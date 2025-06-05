return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- Set Claude as the default provider
    provider = "claude",
    
    -- Behaviour settings
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    
    -- Mappings
    mappings = {
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
    },
    
    -- Hints configuration
    hints = { enabled = true },
    
    -- Windows configuration
    windows = {
      position = "right",
      wrap = true,
      width = 30,
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },
    
    -- Highlights configuration
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    
    -- Provider configurations - FIXED
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        api_key_name = "ANTHROPIC_API_KEY",
        -- Remove timeout from extra_request_body as it's not a valid Claude API parameter
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
        -- Timeout should be handled at the HTTP client level, not sent to Claude API
        timeout = 30000, -- This is for the HTTP request timeout, not API parameter
      },
    },
    
    -- Repository map for better context
    repo_map = {
      ignore_patterns = {
        "%.git",
        "%.worktree",
        "__pycache__",
        "node_modules",
        "%.next",
        "%.nuxt",
        "dist",
        "build",
      },
    },
  },
  
  build = "make",
  
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  
  config = function(_, opts)
    require("avante").setup(opts)
    
    -- Custom keymaps
    vim.keymap.set("n", "<leader>aa", function() require("avante.api").ask() end, { desc = "avante: ask" })
    vim.keymap.set("v", "<leader>aa", function() require("avante.api").ask() end, { desc = "avante: ask" })
    vim.keymap.set("n", "<leader>ar", function() require("avante.api").refresh() end, { desc = "avante: refresh" })
    vim.keymap.set("n", "<leader>ae", function() require("avante.api").edit() end, { desc = "avante: edit" })
    vim.keymap.set("n", "<leader>at", function() require("avante").toggle() end, { desc = "avante: toggle" })
    
    -- Safe autocmd setup
    local avante_group = vim.api.nvim_create_augroup("AvanteCustom", { clear = true })
    
    vim.api.nvim_create_autocmd("FileType", {
      group = avante_group,
      pattern = "Avante",
      callback = function(args)
        if vim.api.nvim_buf_is_valid(args.buf) then
          vim.opt_local.wrap = true
          vim.opt_local.spell = false
        end
      end,
    })
  end,
}
