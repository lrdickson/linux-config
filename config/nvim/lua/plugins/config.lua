local enable_mason = true
if string.find(vim.uv.os_uname().version, "NixOS") then
  enable_mason = false
end

return {
  -- Disable mason to use system package manager
  { "williamboman/mason-lspconfig.nvim", enabled = enable_mason },
  { "williamboman/mason.nvim",           enabled = enable_mason },

  -- Add fileformat to lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return vim.bo.fileformat
        end,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },
  {
    "nmac427/guess-indent.nvim",
    opts = function() require("guess-indent").setup {} end,
  }
}
