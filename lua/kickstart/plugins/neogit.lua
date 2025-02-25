return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional
    'nvim-telescope/telescope.nvim', -- optional
  },
  vim.keymap.set('n', '<leader>ng', ':Neogit<CR>', { silent = true, desc = 'Neogit' }),
  vim.keymap.set('n', '<leader>df', ':DiffviewOpen<CR>', { silent = true, desc = 'DiffviewOpen' }),
  vim.keymap.set('n', '<leader>dfc', ':DiffviewClose<CR>', { silent = true, desc = 'DiffviewClose' }),
  vim.keymap.set('n', '<leader>dfr', ':DiffviewRefresh<CR>', { silent = true, desc = 'DiffviewRefresh' }),
  vim.keymap.set('n', '<leader>tf', ':DiffviewToggleFiles<CR>', { silent = true, desc = 'DiffviewToggleFiles' }),
  vim.keymap.set('n', '<leader>fh', ':DiffviewFileHistory<CR>', { silent = true, desc = 'DiffviewFileHistory' }),
  config = true,
}
