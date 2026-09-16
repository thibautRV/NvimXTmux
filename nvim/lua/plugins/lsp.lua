return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" }, -- ajoute ici tes langages: "pyright", "ts_ls", "rust_analyzer"...
      })

      local toggles = require("config.toggles")
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        -- Si le LSP est désactivé au moment de l'attache, on coupe direct.
        if not toggles.lsp_should_attach() then
          vim.lsp.stop_client(client.id)
          return
        end
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
      })

      -- Diagnostics désactivés par défaut tant que le LSP est off au démarrage
      if not toggles.lsp_enabled then
        vim.diagnostic.enable(false)
      end

      -- Autoformat piloté par le toggle <leader>tf
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          if vim.g.autoformat then
            vim.lsp.buf.format({ async = false })
          end
        end,
      })
    end,
  },
}
