return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional
    'nvim-telescope/telescope.nvim', -- optional
  },
  vim.keymap.set('n', '<leader>ng', ':Neogit<CR>', { silent = true, desc = 'Neogit' }),
  config = true,
}
