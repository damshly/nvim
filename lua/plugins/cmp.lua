-- File: lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  -- بـ AstroNvim بنستخدم opts لتعديل الإعدادات الافتراضية
  opts = function(_, opts)
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    require("snippets.js_snippets").setup()

    -- 2. ربط لغات البرمجة ببعضها للقصاصات
    luasnip.filetype_extend("typescript", { "javascript" })
    luasnip.filetype_extend("javascriptreact", { "javascript" })
    luasnip.filetype_extend("typescriptreact", { "javascript" })

    -- 3. دمج الإعدادات تبعك مع إعدادات AstroNvim
    -- المابينغ (Mappings)
    opts.mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
    }
    opts.sources = {
      { name = "luasnip", priority = 1000 }, -- السنيبت أولاً دائماً
      { name = "nvim_lsp", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
    }
    opts.preselect = cmp.PreselectMode.None
    -- 5. تجميل النوافذ (Bordered Windows)
    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    if not opts.sources then opts.sources = {} end
    table.insert(opts.sources, { name = "luasnip", priority = 1000 })

    return opts
  end,
}
