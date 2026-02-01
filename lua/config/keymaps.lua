-- 키 매핑 설정 (keymaps.lua)
-- 편리한 단축키를 설정합니다.

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader 키 설정 (Space 키를 메인 단축키로 사용)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 입력 모드(Insert Mode)에서 'jk'를 누르면 저장 없이 일반 모드(Normal Mode)로 전환
-- ESC 키가 멀리 있어서 불편할 때 유용합니다.
map("i", "jk", "<ESC>", { desc = "일반 모드로 전환" })

-- 창 이동을 쉽게 변경 (Ctrl + h/j/k/l)
map("n", "<C-h>", "<C-w>h", { desc = "왼쪽 창으로 이동" })
map("n", "<C-j>", "<C-w>j", { desc = "아래쪽 창으로 이동" })
map("n", "<C-k>", "<C-w>k", { desc = "위쪽 창으로 이동" })
map("n", "<C-l>", "<C-w>l", { desc = "오른쪽 창으로 이동" })

-- 창 크기 조절 (Ctrl + 화살표)
map("n", "<C-Up>", ":resize +2<CR>", { desc = "창 높이 증가" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "창 높이 감소" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "창 너비 감소" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "창 너비 증가" })

-- 버퍼(파일 탭) 이동
map("n", "<S-h>", ":bprevious<CR>", { desc = "이전 파일로 이동" })
map("n", "<S-l>", ":bnext<CR>", { desc = "다음 파일로 이동" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "현재 파일 닫기" })

-- 저장 및 종료 단축키
map("n", "<leader>w", ":w<CR>", { desc = "저장" })
map("n", "<leader>q", ":q<CR>", { desc = "종료" })

-- 검색 하이라이트 끄기 (ESC 누르면)
map("n", "<ESC>", ":nohlsearch<CR>", { desc = "검색 강조 끄기" })

-- 들여쓰기 모드 유지 (Visual Mode에서 < > 사용 시)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
