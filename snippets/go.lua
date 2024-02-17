local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node

local fmt = ls.extend_decorator.apply(require('luasnip.extras.fmt').fmt, { delimiters = '<>' })

local snippets = {
	s('if err nil', fmt('if err != nil {\n	<>\n}', { i(0) })),
	s('if something nil', fmt('if <> != nil {\n <>\n}', { i(1), i(0) })),
	s('gofunc', fmt('go func(<>) {\n	<>\n}()', { i(1), i(0) })),
	s('func', fmt('func(<>) {\n	<>\n}', { i(1), i(0) })),
}

local auto_snippets = {}

return snippets, auto_snippets
