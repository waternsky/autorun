local M = {}

function M.createWin(bufnr)
    local width = 50
    local height = 10
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

return M
