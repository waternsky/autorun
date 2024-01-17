local M = {}

function M.createWin(bufnr, uopts)
    local width = 50
    local height = 10
    local opts = {
        relative = "editor",
        title = "AutoRun",
        title_pos = uopts.title_pos or "left",
        height = height,
        width = width,
        row = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        anchor = "NW",
        style = "minimal",
        border = uopts.border or "single",
    }
    return vim.api.nvim_open_win(bufnr, true, opts)
end

return M
