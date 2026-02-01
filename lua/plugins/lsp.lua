return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",           -- LSP 서버 설치 관리자
    "williamboman/mason-lspconfig.nvim", -- mason과 lspconfig 연결
    "hrsh7th/cmp-nvim-lsp",              -- 자동완성 기능 연동
    { "antosha417/nvim-lsp-file-operations", config = true }, -- 파일 이름 변경 시 자동 리팩토링
  },
  config = function()
    -- 필요한 모듈 불러오기
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- 키 매핑 줄임말

    -- LSP가 활성화되었을 때 동작할 함수
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- 주요 LSP 키 매핑
      opts.desc = "정의로 이동 (Go to definition)"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "참조 찾기 (Find references)"
      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "선언부로 이동 (Go to declaration)"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "코드 액션 보기 (Code actions)"
      keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "이름 변경 (Smart rename)"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "라인 에러 메시지 보기"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "문서보기 (K)"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "LSP 재시작"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    -- cmp-nvim-lsp를 통해 capabilities 설정 (자동완성 기능 확장)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Mason 설정 (LSP 서버 관리자)
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Mason-LSPConfig 설정
    mason_lspconfig.setup({
      -- 자동으로 설치할 언어 서버 목록
      ensure_installed = {
        "clangd",    -- C언어
        "pyright",   -- Python (타입 체커)
        "lua_ls",    -- Lua (Neovim 설정용)
        "html",      -- HTML
        "cssls",     -- CSS
        "bashls",    -- Bash Script
        "jsonls",    -- JSON
      },
      -- 서버별 자동 설정 핸들러
      handlers = {
        -- 기본 핸들러 (모든 서버에 적용)
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities, -- 자동완성 capabilities 연결
            on_attach = on_attach,       -- 키 매핑 연결
          })
        end,

        -- [Lua] lua_ls 전용 설정 (커스텀)
        ["lua_ls"] = function()
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }, -- vim 전역 변수에 대한 경고 무시
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                  },
                },
              },
            },
          })
        end,
        
        -- [Python] pyright 전용 설정 (필요시 추가)
        ["pyright"] = function()
          lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              python = {
                analysis = {
                  autoSearchPaths = true,
                  typeCheckingMode = "basic",
                  useLibraryCodeForTypes = true
                }
              }
            }
          })
        end,
        
        -- [C] clangd 전용 설정 (필요시 추가)
         ["clangd"] = function()
          lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "clangd", "--fallback-style=llvm" }
          })
        end,
      },
    })
  end,
}
