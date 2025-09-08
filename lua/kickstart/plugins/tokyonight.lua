return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
          functions = { bold = true },
          variables = {},
        },
        day_brightness = 0.4,
        dim_inactive = true,
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
        end,
      })
      -- Apply startup theme via GNOME detection
      local function apply_tokyonight_theme()
        local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
        if not handle then return end
        local result = handle:read("*a")
        handle:close()

        if result:match("dark") then
          vim.o.background = "dark"
          vim.cmd.colorscheme("tokyonight-night")
        else
          vim.o.background = "light"
          vim.cmd.colorscheme("tokyonight-day")
        end
      end

      apply_tokyonight_theme()

      -- Poll for live changes
      vim.fn.timer_start(1000, function()
        apply_tokyonight_theme()
      end, { ["repeat"] = -1 })
    end,
  },
}
