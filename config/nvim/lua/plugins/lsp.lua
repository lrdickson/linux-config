return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- Markdown language server
        marksman = {},
        -- Latex language server with spell checking that also supports markdown
        -- The ltex language server seems to break popup windows
        -- ltex = {},
      },
    },
  },
}
