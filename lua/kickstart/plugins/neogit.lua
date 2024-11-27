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
  config = true,
}
