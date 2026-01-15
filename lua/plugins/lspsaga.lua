return {
  "nvimdev/lspsaga.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lspsaga").setup {
      ui = {
        border = "rounded", -- زوايا مدورة متل VS Code
      },
      hover = {
        max_width = 0.6,
        open_link = "gx",
      },
      -- منخلي ساجا بس للأمور التفاعلية (Peek, Rename, Hover)
      -- ومنترك الـ Logic تبع الـ Definitions للـ LSP الأصلي
    }
  end,
}
