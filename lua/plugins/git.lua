return {
  -- المحرك الأساسي للواجهة السريعة
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit Open" },
    },
  },
  
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = true, 
      current_line_blame = true, 
    },
  },
}
