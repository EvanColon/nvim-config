return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        modified_icon = "●", -- shows a dot if file is modified
        indicator = {
          style = "underline",
        },
      },
    })
  end,
}
