local terminal = "ghostty"
local file_manager = "dolphin"
local menu = "rofi -show drun"
local reload = "pkill waybar; pkill dunst; waybar && dunst"

local mod_key = "SUPER"

-- exec 
hl.bind(mod_key .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mod_key .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mod_key .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(mod_key .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mod_key .. " + R", hl.dsp.exec_cmd(reload))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy')) -- screenshots

local function toggle_rec(record_cmd)
    return hl.dsp.exec_cmd(
        "if pkill -INT -x wf-recorder; then sleep 2; pkill -KILL -x wf-recorder; " ..
        "else mkdir -p ~/video; " .. record_cmd .. "; fi"
    )
end

local rec_out = "-c h264_nvenc --audio -f ~/video/rec-$(date +%F_%H-%M-%S).mp4"
hl.bind(mod_key .. " + Print", toggle_rec('g=$(slurp) && wf-recorder -g "$g" ' .. rec_out))
hl.bind(mod_key .. " + SHIFT + Print", toggle_rec("wf-recorder " .. rec_out))

-- windows layout
hl.bind(mod_key .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mod_key .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod_key .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mod_key .. " + P", hl.dsp.window.pseudo())
hl.bind(mod_key .. " + V", hl.dsp.layout("togglesplit"))
hl.bind(mod_key .. " + C", hl.dsp.window.center())

-- focus & directions
hl.bind(mod_key .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod_key .. " + SHIFT + H",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mod_key .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod_key .. " + SHIFT + L",  hl.dsp.window.swap({ direction = "right" }))
hl.bind(mod_key .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod_key .. " + SHIFT + K",  hl.dsp.window.swap({ direction = "up" }))
hl.bind(mod_key .. " + J",  hl.dsp.focus({ direction = "down" }))
hl.bind(mod_key .. " + SHIFT + J",  hl.dsp.window.swap({ direction = "down" }))

-- workspace configs
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0

    hl.bind(mod_key .. " + " .. key,             hl.dsp.focus({ workspace = i}))

    hl.bind(mod_key .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    
    hl.bind(mod_key .. " + CTRL + " .. key, function()
        require("scripts.swap_workspaces").swap_workspaces(i)
    end)
end

-- scratchpad
hl.bind(mod_key .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod_key .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- scroll
hl.bind(mod_key .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod_key .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod_key .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod_key .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- multimedia
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- temp

local command = "dunstify -u critical -a \"discord\" -i discord -h string:x-dunst-stack-tag:discord \"Fulano (#geral, Meu Servidor)\" \"e aí, bora jogar hoje?\""

hl.bind(mod_key .. " + T", hl.dsp.exec_cmd(command))
