-- Neovim 초기화 파일 (init.lua)
-- 여기서 기본 설정과 플러그인 매니저를 불러옵니다.

-- 1. 기본 옵션 로드 (lua/config/options.lua)
require("config.options")

-- 2. 키 매핑 로드 (lua/config/keymaps.lua)
require("config.keymaps")

-- 3. 플러그인 매니저(lazy.nvim) 로드 및 플러그인 설정 (lua/config/lazy.lua)
require("config.lazy")
