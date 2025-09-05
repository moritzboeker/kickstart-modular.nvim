return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "moon",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
      })
      -- Apply startup theme via GNOME detection
      local function apply_rose_pine_theme()
        local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
        if not handle then return end
        local result = handle:read("*a")
        handle:close()

        if result:match("dark") then
          vim.o.background = "dark"
          vim.cmd.colorscheme("rose-pine-moon")
        else
          vim.o.background = "light"
          vim.cmd.colorscheme("rose-pine-dawn")
        end
      end

      apply_rose_pine_theme()

      -- Optional: poll for live changes
      vim.fn.timer_start(500, function()
        apply_rose_pine_theme()
      end, { ["repeat"] = -1 })
    end,
  },
}
