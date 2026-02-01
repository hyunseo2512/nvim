return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- 검색 속도 향상
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- 위로 이동
            ["<C-j>"] = actions.move_selection_next,     -- 아래로 이동
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- 선택 항목 퀵픽스 리스트로
          },
        },
        path_display = { "truncate " },
      },
    })

    -- fzf 익스텐션 로드 (빠른 검색 알고리즘)
    telescope.load_extension("fzf")

    -- 키 매핑
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "파일 찾기" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "최근 파일 찾기" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "문자열 검색 (Live Grep)" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "현재 커서 단어 검색" })
  end,
}
