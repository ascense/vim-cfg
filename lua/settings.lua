-- General
vim.o.hidden = false -- disable hidden buffers
vim.o.updatetime = 750
vim.opt.foldmethod = 'indent'
vim.opt.wrap = false

-- Tab Key
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Character Highlighting 
vim.o.listchars = 'tab:;-,trail:.,extends:>,nbsp:+'
vim.opt.list = true

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Color Column
vim.opt.colorcolumn = '110'

-- base16-vim
vim.g.base16colorspace = 256
vim.cmd("colorscheme base16-default-dark")

-- airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'base16'

-- ack.vim & ripgrep
-- --type-not <xyz> -> Avoid searching specific filetypes
-- --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
vim.g.ackprg = 'rg --vimgrep --smart-case'
-- Any empty ack search will search for the word the cursor is on
vim.g.ack_use_cword_for_empty_search = 1
