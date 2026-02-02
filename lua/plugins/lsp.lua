-- File: lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require "lspconfig"
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 1. إعداد سيرفر Svelte الأساسي
      lspconfig.svelte.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- نفس الـ keymaps اللي عرفتها تحت
          local opts = { buffer = bufnr, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          -- ... البقية
          
          -- حركة ذكية: تحديث الـ TS عند حفظ ملفات السيفلت
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
          })
        end,
      }

      -- 2. تعديل vtsls ليدعم Svelte
      lspconfig.vtsls.setup {
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("package.json", ".git") or vim.loop.cwd(),
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
            -- تفعيل دعم ملفات سيفلت داخل vtsls
            tsserver = {
              globalPlugins = {
                {
                  name = "typescript-svelte-plugin",
                  location = vim.fn.expand("$PNPM_HOME/lib/node_modules/typescript-svelte-plugin"), -- تأكد من المسار حسب pnpm عندك
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
          -- ... باقي إعدادات javascript اللي حطيتها
        },
        -- ... نفس الـ on_attach
      }
    end,
  },
}
