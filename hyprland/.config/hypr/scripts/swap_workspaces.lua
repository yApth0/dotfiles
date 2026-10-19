local M = {}

M.TEMP=9999

function M.swap_workspaces(target)
    local current = hl.get_active_workspace().id

    local current_windows = hl.get_windows({workspace = current})
    local target_windows = hl.get_windows({workspace = target})

    for _, v in ipairs(current_windows) do
        hl.dispatch(hl.dsp.window.move(
            {workspace = target , window=v}
        ))
    end

    for _, v in ipairs(target_windows) do
        hl.dispatch(hl.dsp.window.move(
            { workspace = current , window=v}
        ))
    end
    
    hl.dispatch(hl.dsp.focus({workspace = target}))
end

return M
