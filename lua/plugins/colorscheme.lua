return {
  -- 테마 플러그인 (Tokyo Night)
  "folke/tokyonight.nvim",
  lazy = false, -- Neovim 시작 시 바로 로드
  priority = 1000, -- 다른 플러그인보다 먼저 로드하여 색상 적용
  opts = {
    transparent = true, -- 배경을 투명하게 설정 (터미널 배경 사용)
    styles = {
      sidebars = "transparent", -- 사이드바 투명
      floats = "transparent", -- 팝업창 투명
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts) -- 설정 적용
    vim.cmd([[colorscheme tokyonight]]) -- 테마 로드
  end,
}
