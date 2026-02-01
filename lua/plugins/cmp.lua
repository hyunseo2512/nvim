return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- 현재 파일 내 단어 자동완성
    "hrsh7th/cmp-path",   -- 파일 경로 자동완성
    "L3MON4D3/LuaSnip",   -- 스니펫 엔진
    "saadparwaiz1/cmp_luasnip", -- 스니펫 자동완성 소스
    "rafamadriz/friendly-snippets", -- 유용한 스니펫 모음
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- VSCode 스타일 스니펫 불러오기
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- 스니펫 엔진 설정
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- 위로 이동
        ["<C-j>"] = cmp.mapping.select_next_item(), -- 아래로 이동
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- 자동완성 메뉴 열기
        ["<C-e>"] = cmp.mapping.abort(), -- 메뉴 닫기
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- 엔터로 선택
      }),
      -- 자동완성 소스 우선순위
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP (변수명, 함수명 등)
        { name = "luasnip" },  -- 스니펫
        { name = "buffer" },   -- 현재 파일 텍스트
        { name = "path" },     -- 파일 경로
      }),
    })
  end,
}
