-- Leader
vim.keymap.set('n', '<Space>', '')
vim.g.mapleader = ' '

local opts = { silent = true }
vim.keymap.set('n', '<leader><esc>', ':nohlsearch<cr>', opts)
vim.keymap.set('i', 'jj', '<C-\\><C-n>', opts)
vim.keymap.set('t', 'jj', '<C-\\><C-n>', opts)

-- LSP
-- diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next)
-- keymappings for language server attached buffers
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, opts)
  end,
})
-- rust-tools
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end
  },
})

-- DDC
-- <TAB>: completion
local opts = { silent = true, expr = true }
vim.keymap.set('i', '<TAB>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  else
    local col = vim.fn.col('.')
    if col <= 1 or string.find(string.sub(vim.fn.getline('.'), col - 1, col - 1), '%s') then
      return '<TAB>'
    else
      return vim.fn['ddc#map#manual_complete']()
    end
  end
end, opts)
-- <S-TAB>: completion back
vim.keymap.set('i', '<S-TAB>', function() return vim.fn.pumvisible() == 1 and '<C-p>' or '<C-h>' end, opts)

-- Debugger
local dap = require("dap")
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)

-- ack.vim
-- Maps <leader>/ so we're ready to type the search keyword
vim.keymap.set('n', '<leader>/', ':Ack!<space>')

-- F-Keys
local opts = { silent = true }
vim.keymap.set('n', '<F2>', ':lua cycleLineNumbers()<CR>', opts)
vim.keymap.set('n', '<F3>', ':lua cycleShiftWidth()<CR>', opts)
vim.keymap.set('n', '<F4>', ':lua toggleColorColumn()<CR>', opts)

function cycleLineNumbers()
  if vim.wo.number and vim.wo.relativenumber then
    vim.wo.number = false
    vim.wo.relativenumber = false
  elseif not vim.wo.number then
    vim.wo.number = true
    vim.wo.relativenumber = false
  else
    vim.wo.number = true
    vim.wo.relativenumber = true
  end
end

function cycleShiftWidth()
  if vim.bo.shiftwidth == 2 then
    print('> 4 spaces')
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  else
    print('> 2 spaces')
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end
end

function toggleColorColumn()
  if vim.wo.colorcolumn == '' then
    vim.wo.colorcolumn = '110'
  else
    vim.wo.colorcolumn = ''
  end
end
