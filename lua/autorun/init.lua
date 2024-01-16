local buffer = require("autorun.buffer")

local M = {}

-- opts is table
function M.setup(opts)
    local bufnr = vim.api.nvim_create_buf(false, true)
    buffer.attach_to_buffer(bufnr, opts)
end

return M
