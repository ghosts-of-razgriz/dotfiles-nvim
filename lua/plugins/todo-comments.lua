return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		keywords = {
			FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
			TODO = { icon = ' ', color = 'info' },
			HACK = { icon = ' ', color = 'warning' },
			WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
			PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
			NOTE = { icon = 'N ', color = 'hint', alt = { 'INFO' } },
			TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
		},
	},
}

-- feat – a new feature is introduced with the changes
-- fix – a bug fix has occurred
-- chore – changes that do not relate to a fix or feature and don't modify src or test files (for example updating dependencies)
-- refactor – refactored code that neither fixes a bug nor adds a feature
-- docs – updates to documentation such as a the README or other markdown files
-- style – changes that do not affect the meaning of the code, likely related to code formatting such as white-space, missing semi-colons, and so on.
-- test – including new or correcting previous tests
-- perf – performance improvements
-- ci – continuous integration related
-- build – changes that affect the build system or external dependencies
-- revert – reverts a previous commit
