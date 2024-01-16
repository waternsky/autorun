local ui = require("autorun.ui")

local M = {}

function M.attach_to_buffer(bufnr, opts)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("Autorun", { clear = true }),
        pattern = { "*.go", "*.py" },
        callback = function ()

            local filePath = vim.api.nvim_buf_get_name(0)
            local command = {}
            local extension = filePath:sub(-2, -1)
            if extension == "py" then
                command = { opts.pythoncmd, filePath }
            elseif extension == "go" then
                command = { "go", "run", filePath }
            else
                command = { "cat" }
            end

            local wins = vim.api.nvim_list_wins()
            for _, win in pairs(wins) do
                local config = vim.api.nvim_win_get_config(win)
                if config.title ~= nil and config.title[1][1] == "AutoRun" then
                    vim.api.nvim_win_close(win, true)
                end
            end

            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "output: " })
            local append_data = function (_, data)
                if data then
                    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
                end
            end

            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data,
            })

            local winId = ui.createWin(bufnr)
            vim.keymap.set("n", "<C-c>", function ()
                if vim.api.nvim_win_is_valid(winId) then
                    vim.api.nvim_win_close(winId, true)
                end
            end)
        end
    })
end

return M
