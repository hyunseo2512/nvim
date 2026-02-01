return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Python 포매터: black 또는 isort
        python = { "isort", "black" },
        -- C언어 포매터: clang-format
        c = { "clang-format" },
        lua = { "stylua" },
      },
      -- 저장 시 자동 포매팅 활성화
      format_on_save = {
        lsp_fallback = true, -- 포매터가 없으면 LSP 사용
        async = false,
        timeout_ms = 500,
      },
    })

    -- 수동 포매팅 단축키 (<leader>mp)
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "파일 포맷팅 (Format file)" })
  end,
}
