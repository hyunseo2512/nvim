return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag", -- HTML 태그 자동 닫기 (선택 사항)
  },
  config = function()
    -- 안전하게 로드 (pcall 사용)
    local status, configs = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    configs.setup({
      ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "bash" },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
    })
  end,
}
