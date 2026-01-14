return {
  "akinsho/toggleterm.nvim",
  lazy = true, -- تحمل فقط عند الحاجة
  opts = {
    direction = "float",
    close_on_exit = true,
    float_opts = {
      border = "curved",
      winblend = 3,
    },
    -- تفعيل اختصارات التيرمينال داخل التيرمينال نفسه
    open_mapping = [[<C-\>]],
  },
  keys = {
    -- 1. اختصار التيرمينال العائم (الافتراضي)
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal Float" },

    -- 2. الاختصار اللي كنت عم تحاول تعمله (Horizontal)
    {
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal<cr>",
      desc = "Toggle Terminal Horizontal",
    },

    -- 3. اختصار للتيرمينال العمودي (مفيد جداً للـ Arch)
    {
      "<leader>tv",
      "<cmd>ToggleTerm direction=vertical size=60<cr>",
      desc = "Toggle Terminal Vertical",
    },
  },
}
