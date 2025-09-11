return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional
    'nvim-telescope/telescope.nvim', -- optional
  },
  keys = {
    { "<leader>ng", "<cmd>Neogit<CR>", desc = "Neogit" },
    { "<leader>df", "<cmd>DiffviewOpen<CR>", desc = "DiffviewOpen" },
    { "<leader>dfc","<cmd>DiffviewClose<CR>", desc = "DiffviewClose" },
    { "<leader>tf", "<cmd>DiffviewToggleFiles<CR>", desc = "DiffviewToggleFiles" },
    { "<leader>fh", "<cmd>DiffviewFileHistory<CR>", desc = "DiffviewFileHistory" },
  },
  config = function()
    require("neogit").setup {
      status = {
        recent_commit_count = 100,
      },
      sections = {
        recent = { folded = false, hidden = false },
      },
    }
  end,
}
