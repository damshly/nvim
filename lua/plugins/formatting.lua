return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = false,
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
    },
  },
  keys = {
    {

      "<leader>f",
      function() require("conform").format { async = true, lsp_fallback = true } end,
      mode = { "n", "v" },
      desc = "Manual Format",
    },
  },
}
