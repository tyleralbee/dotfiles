# Create directory and navigate into it
mkcd() { mkdir "$@" && cd "$@" || exit; }

# command_exists - Ensure a command exists before running it
#
# Example:
#   if command_exists docker; then
#     echo "Docker already installed"
#   else
#     curl -sSL https://get.docker.com | sh
#   fi
command_exists() { command -v "$@" > /dev/null 2>&1 }

# is_root - Check if the current user is root
#
# Usage:
#   is_root
#
# Returns:
#   0 if the current user is root, 1 otherwise
#
# Example:
#   is_root && echo "Running as root" || echo "Not root"
is_root() { [ "$(id -u)" -eq 0 ]; }

# get_ip - Get IP; IPv4 if it exists, otherwise IPv6
#
# Usage:
#   get_ip
#
# Returns:
#   IPv4 if available, otherwise IPv6
# 
# Exits:
#   1 if unable to determine IP address
# 
# Example:
#   ip=$(get_ip)
get_ip() {
    local ip=""
    
    # IPv4
    ip=$(curl -4s --connect-timeout 5 https://ifconfig.io 2>/dev/null)
    if [ -z "$ip" ]; then
        ip=$(curl -4s --connect-timeout 5 https://icanhazip.com 2>/dev/null)
    fi
    if [ -z "$ip" ]; then
        ip=$(curl -4s --connect-timeout 5 https://ipecho.net/plain 2>/dev/null)
    fi
    
    # IPv6 fallback
    if [ -z "$ip" ]; then
        ip=$(curl -6s --connect-timeout 5 https://ifconfig.io 2>/dev/null)
        if [ -z "$ip" ]; then
            ip=$(curl -6s --connect-timeout 5 https://icanhazip.com 2>/dev/null)
        fi
        if [ -z "$ip" ]; then
            ip=$(curl -6s --connect-timeout 5 https://ipecho.net/plain 2>/dev/null)
        fi
    fi
    
    # Exit if unable to determine IP
    if [ -z "$ip" ]; then
        echo "Error: Could not determine server IP address automatically (neither IPv4 nor IPv6)." >&2
        exit 1
    fi

    echo "$ip"
}

# colors - Display all color combinations in terminal
# Source: https://askubuntu.com/a/279014
colors() {
    for x in {0..8}; do
        for i in {30..37}; do
            for a in {40..47}; do
                echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
            done
            echo
        done
    done
    echo ""
}

# Rename file prefixes in current directory
# usage: `rename_file_prefixes oldprefix newprefix`
#
# Example:
#
# $ ls
# 123.txt  example_changed.md  example_changed.txt  unchanged.txt
# $ rename_file_prefixes example show
# renamed './example_changed.md' -> './show_changed.md'
# renamed './example_changed.txt' -> './show_changed.txt'
rename_file_prefixes() {
    local old new path base rest dest restore
    old=${1:?Usage: rename_file_prefixes OLD NEW}
    new=${2:?Usage: rename_file_prefixes OLD NEW}

    # Include dotfiles, avoid literal './*' when empty
    restore=$(shopt -p nullglob dotglob)
    shopt -s nullglob dotglob

    # Detect conflicts, abort if any
    for path in ./*; do
        [[ -f $path ]] || continue # use [[ -e $path && ! -d $path ]] to include symlinks
        base=${path#./}
        [[ ${base:0:${#old}} == "$old" ]] || continue
        rest=${base:${#old}}
        dest="./$new$rest"
        if [[ -e $dest && $dest != "$path" ]]; then
            printf 'conflict: %s -> %s (exists)\n' "$path" "$dest" >&2
            eval "$restore"
            return 1
        fi
    done

    # Rename files
    for path in ./*; do
        [[ -f $path ]] || continue
        base=${path#./}
        [[ ${base:0:${#old}} == "$old" ]] || continue
        rest=${base:${#old}}
        dest="./$new$rest"
        [[ $dest == "$path" ]] || mv -n "$path" "$dest"
    done

    eval "$restore"
}

# get_usb_speed - Get a USB device's speed by plugging it in
#
# Usage:
#   get_usb_speed
#
# Returns:
#   0 on success, non-zero on error
#
# Example:
#   get_usb_speed
get_usb_speed() {
    local tmp_devices_before tmp_devices_after
    tmp_devices_before="$(mktemp)" || exit 1
    tmp_devices_after="$(mktemp)" || exit 1
    trap 'rm -f "$tmp_devices_before" "$tmp_devices_after"' EXIT

    echo "NOTE: Your USB device should be unplugged before running this function."
    echo "If your USB device is not yet unplugged, cancel now (CTRL+C) and unplug it."
    read -n 1 -s -r -p "Press any key to continue"
    echo

    echo "Getting list of current devices..."
    find /sys/devices -name speed | sort > "$tmp_devices_before"
    read -n 1 -s -r -p "Plug in your USB device now. Press any key when ready to continue"
    echo

    echo "Getting list of devices after plugging in..."
    find /sys/devices -name speed | sort > "$tmp_devices_after"

    # Compare, supressing common lines and outputting unique lines
    comm -3 "$tmp_devices_before" "$tmp_devices_after" | while read f; do
        echo -n "$f" " "
        cat "$f"
    done | column -t -s' '
}

# y - Change the current working directory when exiting Yazi
#
# Usage:
#   - Use y instead of yazi to start, press q to quit, see CWD changes.
#   - Sometimes, you don't want to change, press Q to quit.
#
# Source: https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
