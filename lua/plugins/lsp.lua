return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require "lspconfig"
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.vtsls.setup {
        capabilities = capabilities,
        -- إجبار السيرفر يشوف المجلد الحالي كشغل واحد
        root_dir = lspconfig.util.root_pattern("package.json", ".git") or vim.loop.cwd(),
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true, -- تم تصحيح الكلمة هون
              },
            },
          },
          javascript = {
            suggest = {
              autoImports = true,
            },
            updateImportsOnFileMove = { enabled = "always" },
          },
        },
        on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, silent = true }
          -- الاختصارات الأساسية
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
          vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
          vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { buffer = bufnr, desc = "Rename Symbol" })
        end,
      }
    end,
  },
}
