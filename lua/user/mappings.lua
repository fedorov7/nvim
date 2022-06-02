local m = require("mapx").setup({ global = true, whichkey = true })
local Job = require("plenary.job")

-- clipboard
m.nnoremap([[<C-P>]], [["+gP]], "Paste from system clipboard")
m.vnoremap([[<C-X>]], [["+x]], "Cut to system clipboard")
m.vnoremap([[<C-C>]], [["+y]], "Copy to system clipboard")

-- cscope
if vim.fn.has("cscope") == 1 then
  vim.api.nvim_set_option("csto", 0)
  vim.api.nvim_set_option("cst", true)
  if vim.fn.filereadable("cscope.out") == 1 then
    vim.api.nvim_command("silent cscope add cscope.out")
  end
end
m.nmap([[<C-\>s]], [[:cs find s <C-R>=expand("<cword>")<CR><CR>]], "Find this C symbol")
m.nmap([[<C-\>g]], [[:cs find g <C-R>=expand("<cword>")<CR><CR>]], "Find this definition")
m.nmap([[<C-\>d]], [[:cs find d <C-R>=expand("<cword>")<CR><CR>]], "Find functions called by this function")
m.nmap([[<C-\>c]], [[:cs find c <C-R>=expand("<cword>")<CR><CR>]], "Find functions calling this function")
m.nmap([[<C-\>t]], [[:cs find t <C-R>=expand("<cword>")<CR><CR>]], "Find this text string")
m.nmap([[<C-\>e]], [[:cs find e <C-R>=expand("<cword>")<CR><CR>]], "Find this egrep pattern")
m.nmap([[<C-\>f]], [[:cs find f <C-R>=expand("<cfile>")<CR><CR>]], "Find this file")
m.nmap([[<C-\>i]], [[:cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>]], "Find files #including this file")
m.nmap([[<C-\>e]], [[:cs find a <C-R>=expand("<cword>")<CR><CR>]], "Find places where this symbol is assigned a value")

local function cscope_create_database()
  local job = Job:new({
    command = "cscope",
    args = { "-bcqR" },
    on_exit = function(_, retval)
      if retval == 0 then
        print("cscope database created")
      else
        print("cscope database failed")
      end
    end,
  })
  job:start()
end
m.cmd("CscopeCreateDatabase", cscope_create_database, { nargs = 0 })
m.nnoremap([[<F5>]], [[<Cmd>CscopeCreateDatabase<CR>]], "Update cscope database")

-- common
m.nnoremap([[<F12>]], [[<Cmd>NvimTreeToggle<CR>]], "Toogle NvimTree")
