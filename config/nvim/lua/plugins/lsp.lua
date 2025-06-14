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
        lua_ls = {},
        markdown_oxide = {}, -- Markdown PKM
        marksman = {}, -- Markdown language server
        nixd = {},
        pylsp = {},
        svelte = {},
        taplo = {}, -- Toml language server
      },
    },
  },
}
