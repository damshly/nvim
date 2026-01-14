return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = false,
    formatters_by_ft = {
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      lua = { "stylua" },
    },
  },
  keys = {
    {
      "F", 
      function() require("conform").format({ async = true, lsp_fallback = true }) end,
      desc = "Manual Format",
    },
  },
}
