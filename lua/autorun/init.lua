local createWin = function (lines)

    local width = 50
    local height = 10

    local bufnr = vim.api.nvim_create_buf(true, true)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-c>", [[vim.cmd.close]], {
    --    silent = true,
    --    nowait = true,
    --    noremap = true,
    --})
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

    vim.api.nvim_open_win(bufnr, true, opts)
end

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("Autorun", { clear = true }),
    pattern = "**/*.go",
    callback = function ()
        createWin({ "Tesing", "DeezNutz" })
    end
})
