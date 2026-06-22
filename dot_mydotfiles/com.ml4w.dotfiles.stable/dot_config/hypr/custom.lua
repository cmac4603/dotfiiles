hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("[silent] protonmail-bridge --no-window")

    hl.exec_cmd("[workspace 1 silent] zen-browser")
    hl.exec_cmd("[workspace 2 silent] ghostty")
    hl.exec_cmd("[workspace 3 silent] slack")
    hl.exec_cmd("[workspace 4 silent] thunderbird")
end)

hl.config({
    binds = {
        allow_workspace_cycles = true,
        workspace_back_and_forth = true,
    },
})

hl.bind("SUPER + period", hl.dsp.focus({ workspace = "previous" }))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("~/.config/hypr/scripts/launcher.sh"))

-- TODO: doesn't work, fix it
-- hl.bind("SUPER + CTRL + n", hl.dsp.exec_cmd("ghostty -e nmtui"))
