return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- 아이콘 지원
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "파일 탐색기 열기/닫기 (Explorer)",
		},
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true, -- 현재 열린 파일 위치로 자동 이동
				},
				hijack_netrw_behavior = "open_default", -- netrw 대신 neo-tree 사용
			},
		})
	end,
}
