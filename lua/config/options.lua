-- 옵션 설정 (options.lua)
-- 네오빔의 기본적인 동작을 설정합니다. 한글 주석으로 설명을 달았습니다.

local opt = vim.opt

-- 줄 번호 표시
opt.number = true          -- 현재 줄 번호 표시
opt.relativenumber = false -- 상대 줄 번호 끄기 (절대 번호 고정)

-- 들여쓰기 설정 (C/Python 권장 설정)
opt.tabstop = 4            -- 탭 문자가 보여지는 너비
opt.shiftwidth = 4         -- 자동 들여쓰기 너비
opt.expandtab = true       -- 탭 대신 스페이스 사용 (호환성 위해 권장)
opt.autoindent = true      -- 자동 들여쓰기
opt.smartindent = true     -- 스마트 들여쓰기

-- 모양 및 UI
opt.termguicolors = true   -- 24비트 컬러 지원
opt.signcolumn = "yes"     -- 깃 상태나 에러 표시 공간 항상 확보
opt.cursorline = true      -- 현재 줄 강조
opt.wrap = false           -- 긴 줄 줄바꿈 안함 (코딩에 유리)

-- 검색 설정
opt.ignorecase = true      -- 대소문자 무시하고 검색
opt.smartcase = true       -- 대문자가 섞여있으면 대소문자 구분
opt.hlsearch = true        -- 검색 결과 강조
opt.incsearch = true       -- 검색어 입력 중 실시간 매칭

-- 기타 유용한 설정
opt.updatetime = 250       -- 반응 속도 (기본 4000ms -> 250ms)
opt.timeoutlen = 300       -- 키 조합 대기 시간 단축
opt.splitright = true      -- 세로 분할 시 오른쪽에 창 생성
opt.splitbelow = true      -- 가로 분할 시 아래쪽에 창 생성
opt.clipboard = "unnamedplus" -- 시스템 클립보드와 연동 (xclip 또는 xsel 필요)
opt.scrolloff = 8          -- 커서 위아래 여백 확보
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- 백업 파일 생성 안함
opt.backup = false
opt.writebackup = false
opt.swapfile = false
