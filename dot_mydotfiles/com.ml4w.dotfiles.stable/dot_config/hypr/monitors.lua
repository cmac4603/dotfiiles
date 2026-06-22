-------------------------------------------------------
-- Monitor Setup
-------------------------------------------------------

-- See https://wiki.hypr.land/Configuring/Monitors/
-- List current monitors and resolutions possible: hyprctl monitors
-- Format: monitor = [port], resolution, position, scale
-- You must relaunch Hyprland after changing any envs (use Super+Esc, then Relaunch)

-- Straight 1x setup for low-resolution displays like 1080p or 1440p
hl.env("GDK_SCALE", "1")
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})

-- hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto", scale = 1.666667 })
hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 1
})
hl.monitor({
    output = "DP-1",
    mode = "preferred",
    position = "auto-left",
    scale = 1.66667
})
