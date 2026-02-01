return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- 필요할 때 로드 (최적화)
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- 여기에 추가 설정을 넣을 수 있습니다.
  },
}
