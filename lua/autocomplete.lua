-- Native UI
vim.fn['ddc#custom#patch_global']('ui', 'native')

vim.fn['ddc#custom#patch_global']({
  sources = { 'nvim-lsp', 'zsh', 'around', 'buffer' },
  sourceOptions = {
    ['_'] = {
      matchers = {'matcher_fuzzy'},
      sorters = {'sorter_fuzzy'},
      converters = {'converter_fuzzy'},
    },
    ['nvim-lsp'] = {
      mark = 'LSP',
      forceCompletionPattern = [[.|:|->]],
      maxItems = 15,
    },
    ['zsh'] = {
      mark = 'ZSH',
      forceCompletionPattern = [[/]],
      maxItems = 15,
    },
    ['around'] = {
      mark = 'AROUND',
      maxItems = 5,
    },
    ['buffer'] = {
      mark = 'BUFFER',
      maxItems = 5,
    },
  },
})

-- Enable DDC
vim.fn['popup_preview#enable']()
vim.fn['ddc#enable']()
