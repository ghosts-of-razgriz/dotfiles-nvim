require('telescope').setup{
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    -- layout_strategy = "vertical",
    set_env = { ['COLORTERM'] = 'truecolor' },

    sorting_strategy = "ascending",
    preview_title = "",
    layout_strategy = "bottom_pane",
    layout_config = {
      height = 25,
    },
    border = true,
    borderchars = {
      "z",
      prompt =  { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    },
  }
}
