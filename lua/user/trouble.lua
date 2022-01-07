-- Trouble plugin
local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup()

local m = require("mapx").setup({ global = true, whichkey = true })

m.nnoremap("<leader>xx", "<Cmd>Trouble<CR>", "Trouble open")
m.nnoremap("<leader>xw", "<Cmd>Trouble workspace_diagnostics<CR>", "Trouble Workspace Diagnostics")
m.nnoremap("<leader>xd", "<Cmd>Trouble document_diagnostics<CR>", "Trouble Document Diagnostics")
m.nnoremap("<leader>xl", "<Cmd>Trouble loclist<CR>", "Trouble Local List")
m.nnoremap("<leader>xq", "<Cmd>Trouble quickfix<CR>", "Trouble QuickFix")
m.nnoremap("gR", "<Cmd>Trouble lsp_references<CR>", "Trouble LSP Reference")
