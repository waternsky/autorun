local buffer = require("autorun.buffer")
--local command = { "go", "run" }
-- Why create new scratch buffer each time, just use exisiting scratch buffer?? 
-- because 2 may not be scratch buffer sometimes
local bufnr = vim.api.nvim_create_buf(false, true)
buffer.attach_to_buffer(bufnr)
