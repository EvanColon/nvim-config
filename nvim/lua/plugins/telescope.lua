return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local actions = require("telescope.actions")
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.6 },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          preview = { filesize_limit = 5 },
          file_ignore_patterns = {
            "node_modules", ".git/", "dist/", "target/", ".next/", ".venv/", "build/"
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          mappings = {
            i = {
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<C-u>"] = actions.preview_scrolling_up,
            },
            n = {
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<C-u>"] = actions.preview_scrolling_up,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      telescope.load_extension("ui-select")

      -- Keymaps
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>fc", builtin.commands, {})

      -- 🔥 Only show modified buffers
      vim.keymap.set("n", "<leader>fm", function()
        builtin.buffers({
          sort_mru = true,
          ignore_current_buffer = true,
          previewer = false,
          only_cwd = true,
          sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
          attach_mappings = function(_, map)
            local action_state = require("telescope.actions.state")
            local actions = require("telescope.actions")

            actions.select_default:replace(function(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if selection then
                vim.api.nvim_set_current_buf(selection.bufnr)
              end
            end)
            return true
          end,
          -- Filter for only modified buffers
          bufnr_filter = function(bufnr)
            return vim.bo[bufnr].modified
          end,
        })
      end, { desc = "Show modified buffers" })
    end,
  },
}
