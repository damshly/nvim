return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup {
      keymaps = {
        accept_suggestion = "<C-a>",
        clear_suggestion = "<C-x>",
      },
      ignore_filetypes = { "cpp" },
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
    }
  end,
}
