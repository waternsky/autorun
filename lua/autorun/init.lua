local buffer = require("autorun.buffer")

local M = {}

-- opts is table
function M.setup(opts)
    local bufnr = vim.api.nvim_create_buf(false, true)
    buffer.attach_to_buffer(bufnr, opts)
end

function M.Toggle(opts)

    vim.api.nvim_create_user_command("AutorunDisable", function ()
        if pcall(function() vim.api.nvim_del_augroup_by_name("Autorun") end) then
            print("Autorun has been disabled")
        else
            print("Autorun is already disabled")
        end
    end, {})

    vim.api.nvim_create_user_command("AutorunEnable", function ()
        M.setup(opts)
    end, {})

end

return M
