return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      -- Basic keymaps
      vim.keymap.set('n', '<F2>', function() dap.terminate() end)
      vim.keymap.set('n', '<F5>', function() dap.continue() end)
      vim.keymap.set('n', '<F6>', function() dap.step_into() end)
      vim.keymap.set('n', '<F7>', function() dap.step_out() end)
      vim.keymap.set('n', '<F8>', function() dap.step_over() end)
      vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)
      vim.keymap.set('n', '<leader>B', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end)

      -- GDB (14.1+) DAP adapter
      dap.adapters.gdb = {
        id = 'gdb',
        type = 'executable',
        command = 'gdb',
        args = { '--quiet', '--interpreter=dap' },
      }

      dap.configurations.cpp = {
        {
          name = 'Launch with GDB',
          type = 'gdb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = false,
        },
      }
      dap.configurations.c = dap.configurations.cpp
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap, dapui = require('dap'), require('dapui')
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
      dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
    end,
  },

  { 'theHamsta/nvim-dap-virtual-text', opts = {} },
}
