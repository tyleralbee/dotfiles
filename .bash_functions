# Create directory and navigate into it
mkcd() { mkdir "$@" && cd "$@" || exit; }

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
