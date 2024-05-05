
return {
  -- Mason setup
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  -- Mason LSP config setup
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "pyright"}
      })
    end
  },

  -- Neovim LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      local leader = " " -- Sets the leader key
      local lspconfig = require("lspconfig")

      -- Setup for Lua language server
      lspconfig.lua_ls.setup({
        -- Your specific Lua language server configurations here
      })

      -- Key mappings for LSP actions
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', leader .. 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_set_keymap('n', leader .. 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_set_keymap('n', leader .. 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_set_keymap('n', leader .. 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_set_keymap('n', leader .. 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

      -- Diagnostics navigation
      vim.api.nvim_set_keymap('n', leader .. 'dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      vim.api.nvim_set_keymap('n', leader .. 'dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

      -- Additional bindings
      vim.api.nvim_set_keymap('n', leader .. 'ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
      vim.api.nvim_set_keymap('n', leader .. 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    end
  }
}

