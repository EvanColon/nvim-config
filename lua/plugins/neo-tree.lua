return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-tree/nvim-web-devicons",
        opts = { default = true },
      },
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        popup_border_style = "rounded",

        filesystem = {
          follow_current_file = {
            enabled = true, -- auto-focus on current file
            leave_dirs_open = true,
          },
          use_libuv_file_watcher = true, -- auto-refresh tree
          filtered_items = {
            visible = false,             -- hide dotfiles by default
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = { "node_modules", ".DS_Store", "thumbs.db" },
          },
        },

        default_component_configs = {
          indent = {
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            folder_empty_open = "",
            default = "",
            highlight = "NeoTreeFileIcon",
          },

          git_status = {
            symbols = {
              added     = "✚",
              modified  = "",
              deleted   = "✖",
              renamed   = "➜",
              untracked = "",
              ignored   = "◌",
              unstaged  = "󰄱",
              staged    = "✔",
              conflict  = "",
            },
          },
        },

        window = {
          width = 35,
          mappings = {
            ["<space>"] = "toggle_node",
            ["l"] = "open",
            ["h"] = "close_node",
            ["C"] = "close_all_nodes",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<CR>"] = "open",
            ["<ESC>"] = "revert_preview",
          },
        },

        buffers = {
          follow_current_file = {
            enabled = true,
          },
        },

        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function()
              vim.cmd("setlocal signcolumn=no")
            end,
          },
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })
      vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { desc = "Focus NeoTree" })
    end,
  },
}
