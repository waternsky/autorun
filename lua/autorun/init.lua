local createWin = function (bufnr, lines)

    local width = 50
    local height = 10

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

    local opts = {
        relative = "editor",
        title = "AutoRun",
        height = height,
        width = width,
        row = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        anchor = "NW",
        style = "minimal",
        border = "single",
    }

    return vim.api.nvim_open_win(bufnr, true, opts)
end

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("Autorun", { clear = true }),
    pattern = "**/*.go",
    callback = function ()
        local wins = vim.api.nvim_list_wins()
        for _, win in ipairs(wins) do
            local config = vim.api.nvim_win_get_config(win)
            if config.title ~= nil and config.title[1][1] == "AutoRun" then
                --[[
                local allbuf = vim.fn.win_findbuf(win)
                for _, buf in ipairs(allbuf) do
                    vim.api.nvim_buf_delete(buf, { force = true })
                end
                ]]
                vim.api.nvim_win_close(win, true)
            end
        end
        local bufnr = vim.api.nvim_create_buf(false, true)
        local winId = createWin(bufnr, { "Tesing", "DeezNutz" })
        vim.keymap.set("n", "<C-c>", function ()
            if vim.api.nvim_win_is_valid(winId) then
                vim.api.nvim_win_close(winId, false)
            end
        end)
    end
})
