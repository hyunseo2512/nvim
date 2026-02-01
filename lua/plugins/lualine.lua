return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight", -- 테마와 일치시킴
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
    })
  end,
}
