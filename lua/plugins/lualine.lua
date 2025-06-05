return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      theme = "dracula",
      icons_enabled = true,
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        {
          "filename",
          path = 1,                -- relative path
          symbols = {
            modified = " [+]",     -- file modified
            readonly = " [RO]",    -- file read-only
            unnamed = "[No Name]", -- buffer has no name
          },
        },
      },
      lualine_x = { "filetype", "encoding", "fileformat" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
