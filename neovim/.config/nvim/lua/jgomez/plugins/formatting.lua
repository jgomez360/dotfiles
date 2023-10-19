return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        prettierd = {
          command = "prettierd --plugin=prettier-plugin-solidity",
        },
      },
      formatters_by_ft = {
        beancount = { "bean_format" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        solidity = { "prettierd" },
        toml = { "taplo" },
        markdown = { "prettierd" },
        rust = { "rustfmt" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
