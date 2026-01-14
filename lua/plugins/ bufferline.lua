return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      separator_style = "slant",
      show_close_icon = false,
      show_buffer_close_icons = false,
    },
  },
  keys = {
    { "<C-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<C-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },

    { "<leader>c", function() require("astrocore.buffer").close() end, desc = "Close Buffer Safely" },
  },
}
