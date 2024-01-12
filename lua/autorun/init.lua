local closeFloatingWindow = function (bufnr)
    local config = vim.api.nvim_win_get_config(bufnr)
    if config.relative ~= "" then
        vim.api.nvim_win_close(bufnr, false)
    end
end

local createWin = function (lines)

    local width = 50
    local height = 10

    local bufnr = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)
    vim.keymap.set("n", "<C-c>", function ()
        closeFloatingWindow(vim.fn.win_findbuf(bufnr)[1])
    end)

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

--[[
local CloseAllFloatingWindows = function ()
    local closed_windows = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then
            vim.api.nvim_win_close(win, false)
            table.insert(closed_windows, win)
        end
    end
    print(string.format("Closed %d window: %s", #closed_windows, vim.inspect(closed_windows)))
end

vim.keymap.set("n", "<C-c>", function ()
    CloseAllFloatingWindows()
end)
]]
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("Autorun", { clear = true }),
    pattern = "**/*.go",
    callback = function ()
        createWin({ "Tesing", "DeezNutz" })
    end
})
