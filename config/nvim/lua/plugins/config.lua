return {
  -- Disable mason to use system package manager
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "williamboman/mason.nvim",           enabled = false },

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
}
