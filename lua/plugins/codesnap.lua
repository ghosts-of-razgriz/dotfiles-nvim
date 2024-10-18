return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
	mac_window_bar = false,
    save_path = "~/Desktop",
    has_breadcrumbs = false,
	bg_padding = 0,
    bg_theme = "bamboo",
	code_font_family = "Nerd Operator",
	watermark = "",
  },
}
