local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 플러그인 설정
require("lazy").setup({
  spec = {
    -- lua/plugins/ 폴더 내의 모든 파일을 플러그인 설정으로 불러옵니다.
    { import = "plugins" },
  },
  -- 부가적인 UI 설정 (옵션)
  ui = {
    border = "rounded", -- 둥근 테두리 사용
  },
  checker = { enabled = true }, -- 플러그인 업데이트 자동 확인
})
