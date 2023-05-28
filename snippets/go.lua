local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node

local fmt = ls.extend_decorator.apply(require('luasnip.extras.fmt').fmt, { delimiters = '<>' })

local snippets = {
	s('ien', fmt('if err != nil {\n	<>\n}', { i(0) })),
}

local auto_snippets = {}

return snippets, auto_snippets
