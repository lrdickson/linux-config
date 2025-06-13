return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        clangd = {},
        gopls = {},
        markdown_oxide = {}, -- Markdown PKM
        marksman = {},       -- Markdown language server
        nixd = {},
        pylsp = {},
        taplo = {}, -- Toml language server
      },
    },
  },
}
