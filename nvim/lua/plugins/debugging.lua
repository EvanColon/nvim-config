return {
  -- Core DAP with UI, virtual text, and Mason adapter support
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio", -- REQUIRED by dap-ui
        },
      },
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup dap-ui
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      require("nvim-dap-virtual-text").setup({ commented = true })

      -- Auto open/close dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Signs
      vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "🟦", texthl = "", linehl = "", numhl = "" })

      -- Keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      map("n", "<F5>", dap.continue, opts)
      map("n", "<F10>", dap.step_over, opts)
      map("n", "<F11>", dap.step_into, opts)
      map("n", "<F12>", dap.step_out, opts)
      map("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      map("n", "<Leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Set Conditional Breakpoint" })
      map("n", "<Leader>lp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, { desc = "Set Log Point" })
      map("n", "<Leader>dr", dap.repl.open, { desc = "Open REPL" })
      map("n", "<Leader>dl", dap.run_last, { desc = "Run Last Config" })

      -- Python setup (Mason installs debugpy virtualenv)
      require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

      -- JS/TS setup via node2
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
        },
      }

      dap.configurations.javascript = {
        {
          name = "Launch file",
          type = "node2",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
      }

      dap.configurations.typescript = dap.configurations.javascript
    end,
  },

  -- Mason DAP Adapter Manager
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "python",
          "node2",
        },
        automatic_setup = true, -- automatically configure adapters
      })
      -- No need for setup_handlers() if automatic_setup = true
    end,
  },
}
