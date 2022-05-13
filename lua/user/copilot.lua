-- local status_ok, _ = pcall(require, "copilot")
-- if not status_ok then
--   return
-- end

vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-B>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["lua"] = true,
  ["rust"] = true,
  ["c"] = true,
  ["c++"] = true,
  ["cpp"] = true,
  ["go"] = true,
  ["python"] = true,
}
