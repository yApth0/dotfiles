hl.window_rule({ -- ghostty customization
    match = { class = ".*ghostty"},
    no_blur = false
})

hl.window_rule({
    match = { class = ".*pavucontrol.*"},
    float = true,
    move = {"cursor_x","20"},
})

hl.layer_rule({
    match = { namespace = "notifications"},
    blur = true,
    ignore_alpha = 0.5
})
