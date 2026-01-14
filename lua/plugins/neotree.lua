return {
  -- لازم نستخدم الاسم الكامل للإضافة متل ما هو معرّف بـ AstroNvim
  "nvim-neo-tree/neo-tree.nvim",
  -- نستخدم خيار الـ 'opts' للتعديل على الإعدادات الافتراضية
  opts = {
    window = {
      position = "right", -- أنت نقلته لليمين، وهاد تغيير كبير لازم يظهر فوراً
      width = 35,
      mappings = {
        ["<space>"] = "none",
        ["l"] = "open",
        ["h"] = "close_node",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["v"] = "open_vsplit",
        ["s"] = "open_split",
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁯",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
  },
}
