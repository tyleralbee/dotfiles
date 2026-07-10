local cursor_theme = "Bibata-Modern-Ice"
local cursor_size = 24

local dbeaver_class = "DBeaver"
local dejadup_class = "org.gnome.DejaDup"
local discord_class = "discord"
local dolphin_class = "org.kde.dolphin"
local firefox_class = "firefox"
local ghostty_class = "com.mitchellh.ghostty"
local gimp_class = "gimp"
local obs_studio_class = "com.obsproject.Studio"
local obsidian_class = "obsidian"
local runelite_class = "net-runelite-client-RuneLite"
local spotify_class = "spotify"
local timeshift_class = "timeshift-gtk"
local yubico_class = "com.yubico.yubioath"
local zed_class = "dev.zed.Zed"
local zoom_class = "zoom"

-- exec-once.conf
hl.on("hyprland.start", function()
    -- Authentication
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    -- Clipboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    -- Cursor
    hl.exec_cmd("hyprctl setcursor" .. " " .. cursor_theme .. " " .. cursor_size)
    -- Notifications
    hl.exec_cmd("swaync")
    -- Screensharing
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- env.conf

-- Environment variables - Toolkit Backend Variables
hl.env("GDK_BACKEND", "wayland,x11,*")   -- pacman -Qi gtk3 gtk4
hl.env("QT_QPA_PLATFORM", "wayland;xcb") -- pacman -Qi qt5-base qt6-base
hl.env("SDL_VIDEODRIVER", "wayland")     -- pacman -Qi sdl2

-- Environment variables - XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Environment variables - Qt Variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct") -- KDE Dolphin dark mode: qt6ct > Style > kvantum-dark
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Environment variables - Nvidia Specific
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia") -- pacman -Qi libva

-- Environment variables - Theming Related Variables
hl.env("GTK_THEME", "Adwaita:dark")

-- hyprcursor - Hyprcursor Themes
hl.env("HYPRCURSOR_THEME", cursor_theme)
hl.env("HYPRCURSOR_SIZE", cursor_size)

-- windowrule.conf
hl.window_rule({ name = "add-tag-auth-to-class-yubico", match = { class = yubico_class, }, tag = "+auth", })
hl.window_rule({ name = "add-tag-browser-to-class-firefox", match = { class = firefox_class, }, tag = "+browser", })
hl.window_rule({ name = "add-tag-code-to-class-zed", match = { class = zed_class, }, tag = "+code", })
hl.window_rule({ name = "add-tag-devtools-to-class-dbeaver", match = { class = dbeaver_class, }, tag = "+devtools", })
hl.window_rule({ name = "add-tag-game-to-class-runelite", match = { class = runelite_class, }, tag = "+game", })
hl.window_rule({ name = "add-tag-graphics-to-class-gimp", match = { class = gimp_class, }, tag = "+graphics", })
hl.window_rule({ name = "add-tag-music-to-class-spotify", match = { class = spotify_class, }, tag = "+music", })
hl.window_rule({ name = "add-tag-notes-to-class-obsidian", match = { class = obsidian_class, }, tag = "+notes", })
hl.window_rule({ name = "add-tag-social-to-class-discord", match = { class = discord_class, }, tag = "+social", })
hl.window_rule({ name = "add-tag-social-to-class-obs-studio", match = { class = obs_studio_class, }, tag = "+social", })
hl.window_rule({ name = "add-tag-social-to-class-zoom", match = { class = zoom_class, }, tag = "+social", })
hl.window_rule({ name = "add-tag-system-to-class-dejadup", match = { class = dejadup_class, }, tag = "+system", })
hl.window_rule({ name = "add-tag-system-to-class-dolphin", match = { class = dolphin_class, }, tag = "+system", })
hl.window_rule({ name = "add-tag-system-to-class-timeshift", match = { class = timeshift_class, }, tag = "+system", })
hl.window_rule({ name = "add-tag-terminal-to-class-ghostty", match = { class = ghostty_class, }, tag = "+terminal", })

hl.window_rule({ name = "add-tag-quarterfloat-to-tag-auth", match = { tag = "auth", }, tag = "+quarterfloat", })
hl.window_rule({ name = "implement-tag-quarterfloat-behavior", match = { tag = "quarterfloat", }, float = true, size = { "(monitor_w*0.25)", "(monitor_h*0.9)" }, move = { "((monitor_w*0.725))", "((monitor_h*0.05))" }, })

hl.window_rule({ name = "assign-workspace-1-to-tag-code", match = { tag = "code*", }, workspace = "1", })
hl.window_rule({ name = "assign-workspace-1-to-tag-game", match = { tag = "game*", }, workspace = "1", })
hl.window_rule({ name = "assign-workspace-2-to-tag-browser", match = { tag = "browser*", }, workspace = "2", })
hl.window_rule({ name = "assign-workspace-3-to-tag-notes", match = { tag = "notes*", }, workspace = "3", })
hl.window_rule({ name = "assign-workspace-4-to-tag-terminal", match = { tag = "terminal*", }, workspace = "4", })
hl.window_rule({ name = "assign-workspace-5-to-tag-devtools", match = { tag = "devtools*", }, workspace = "5", })
hl.window_rule({ name = "assign-workspace-5-to-tag-graphics", match = { tag = "graphics*", }, workspace = "5", })
hl.window_rule({ name = "assign-workspace-6-to-tag-music", match = { tag = "music*", }, workspace = "6", })
hl.window_rule({ name = "assign-workspace-6-to-tag-social", match = { tag = "social*" }, workspace = "6" })

hl.config({
    -- animation.conf
    animations = {
        enabled = false,
    },

    -- bind.conf

    -- cursor.conf
    cursor = {
        hotspot_padding = 0,
        persistent_warps = true,
    },

    -- decoration.conf

    -- ecosystem.conf
    ecosystem = {
        no_donation_nag = true,
    },

    -- general.conf
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 0,
    },

    -- input.conf
    input = {
        -- Keyboard
        repeat_delay = 250,
        repeat_rate = 25,
    },

    -- misc.conf
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        middle_click_paste = false,
        mouse_move_enables_dpms = true,
    },

    -- xwayland.conf
    xwayland = {
        force_zero_scaling = true,
    },
})

-- permission.conf - MUST ENABLE config.ecosystem.permissions
-- hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })

-- bind.conf

local function focus_or_exec(class_name, command)
    return function()
        local window = hl.get_window("class:" .. class_name)

        if window ~= nil then
            hl.dispatch(hl.dsp.focus({ window = window }))
            return
        end

        hl.exec_cmd(command)
    end
end

-- Hyprland
hl.bind("SUPER + SPACE", hl.dsp.window.float())
hl.bind("ALT + tab", hl.dsp.window.cycle_next())

-- Move focus to workspaces
hl.bind("SUPER + code:10", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + code:11", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + code:12", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + code:13", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + code:14", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + code:15", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + code:16", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + code:17", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + code:18", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + code:19", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))

-- Move windows to workspaces
hl.bind("SUPER + SHIFT + code:10", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + code:11", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + code:12", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + code:13", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + code:14", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + code:15", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + code:16", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + code:17", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + code:18", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + code:19", hl.dsp.window.move({ workspace = 10 }))
hl.bind("SUPER + CTRL + down", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + CTRL + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + CTRL + up", hl.dsp.window.move({ direction = "u" }))

-- Swap windows
hl.bind("SUPER + ALT + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + ALT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind("SUPER + ALT + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + ALT + down", hl.dsp.window.swap({ direction = "down" }))

-- Applications
hl.bind("SUPER + A", focus_or_exec(zed_class, "zeditor"), { submap_universal = true })
hl.bind("SUPER + S", focus_or_exec(firefox_class, "firefox"), { submap_universal = true })
hl.bind("SUPER + D", focus_or_exec(obsidian_class, "xdg-open obsidian://vault/" .. os.getenv("OBSIDIAN_NOTES_DIR")), { submap_universal = true })
hl.bind("SUPER + F", focus_or_exec(ghostty_class, "ghostty"), { submap_universal = true })
hl.bind("SUPER + Z", focus_or_exec(yubico_class, "authenticator"), { submap_universal = true })
hl.bind("SUPER + G", focus_or_exec(runelite_class, "bolt"), { submap_universal = true })
hl.bind("SUPER + X", focus_or_exec(spotify_class, "spotify-launcher"), { submap_universal = true })
hl.bind("SUPER + V", focus_or_exec(dolphin_class, "dolphin"), { submap_universal = true })

-- Functions
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + W", hl.dsp.exec_cmd("kdeconnect-cli -n " .. os.getenv("LAPTOP_NAME") .. " --send-clipboard" ))
hl.bind("SUPER + E", hl.dsp.exec_cmd("fuzzel"))
hl.bind("SUPER + R", hl.dsp.window.fullscreen())
hl.bind("SUPER + T", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | swappy -f -]]))

hl.bind("SUPER + SHIFT + Q", hl.dsp.window.kill())
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("~/.config/hypr/scripts/processes.sh"))
hl.bind("SUPER + SHIFT + R", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("hyprpicker --autocopy"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("poweroff"))

-- monitors.conf
hl.monitor({ output = "DP-2", mode = "1920x1080@240.0", position = "3840x0", scale = 1.0, })
hl.monitor({ output = "DP-3", mode = "1920x1080@239.76", position = "5760x0", scale = 1.0 })

-- workspaces.conf
hl.workspace_rule({ workspace = "1", monitor = "DP-2", default = true, })
hl.workspace_rule({ workspace = "2", monitor = "DP-3", default = true, })
hl.workspace_rule({ workspace = "3", monitor = "DP-2", })
hl.workspace_rule({ workspace = "4", monitor = "DP-3", })
hl.workspace_rule({ workspace = "5", monitor = "DP-2", })
hl.workspace_rule({ workspace = "6", monitor = "DP-3", })
hl.workspace_rule({ workspace = "7", monitor = "DP-2", })
hl.workspace_rule({ workspace = "8", monitor = "DP-3", })
hl.workspace_rule({ workspace = "9", monitor = "DP-2", })
hl.workspace_rule({ workspace = "10", monitor = "DP-3", })
