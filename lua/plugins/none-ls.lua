return {
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          -- Formatters
          "stylua",
          "black",
          "prettier",
          "shfmt",

          -- Linters
          "flake8",
          "eslint_d",
          "shellcheck",
        },
        automatic_installation = true,
      })
    end,
  },

  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      sources = {
        -- Lua
        formatting.stylua,

        -- Python
        formatting.black,
        formatting.isort,
        diagnostics.flake8,

        -- JavaScript / TypeScript / HTML / CSS / JSON / Markdown / YAML
        formatting.prettier.with({
          filetypes = {
            "javascript",
            "typescript",
            "html",
            "css",
            "json",
            "markdown",
            "yaml",
          },
        }),
        diagnostics.eslint_d.with({
          filetypes = { "javascript", "typescript" },
        }),

        -- Shell (optional)
        diagnostics.shellcheck,
        formatting.shfmt,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end,
          })
        end
      end,
    })

    -- Manual format keybinding
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format buffer" })
  end,
}
