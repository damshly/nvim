return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = false,
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
    },
  },
  keys = {
    {

      "F",
      function() require("conform").format { async = true, lsp_fallback = true } end,
      desc = "Manual Format",
    },
  },
}
