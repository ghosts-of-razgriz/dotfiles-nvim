local neovim_lsp = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

neovim_lsp.gopls.setup {
	on_attach = keymap,
	cmd = { 'gopls', 'serve' },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

function Goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  local method = "textDocument/codeAction"
  local req_s = vim.lsp.buf_request_sync(0, method, params, timeoutms)
  if req_s and req_s[1] then
    local result = req_s[1].result
    if result and result[1] then
      local edit = result[1].edit
      vim.lsp.util.apply_workspace_edit(edit)
    end
  end

  vim.lsp.buf.formatting_sync()
end

vim.cmd [[autocmd BufWritePre *.go lua Goimports(1000)]]

-- GoImports = function(timeout_ms)
-- 	local context = { only = { 'source.organizeImports' } }
-- 	vim.validate { context = { context, 't', true } }

-- 	local params = vim.lsp.util.make_range_params()
-- 	params.context = context

-- 	-- See the implementation of the textDocument/codeAction callback
-- 	-- (lua/vim/lsp/handler.lua) for how to do this properly.
-- 	local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, timeout_ms)
-- 	if not result or next(result) == nil then
-- 		return
-- 	end
-- 	local actions = result[1].result
-- 	if not actions then
-- 		return
-- 	end
-- 	local action = actions[1]

-- 	-- textDocument/codeAction can return either Command[] or CodeAction[]. If it
-- 	-- is a CodeAction, it can have either an edit, a command or both. Edits
-- 	-- should be executed first.
-- 	if action.edit or type(action.command) == 'table' then
-- 		if action.edit then
-- 			vim.lsp.util.apply_workspace_edit(action.edit)
-- 		end
-- 		if type(action.command) == 'table' then
-- 			vim.lsp.buf.execute_command(action.command)
-- 		end
-- 	else
-- 		vim.lsp.buf.execute_command(action)
-- 	end
-- end

-- vim.cmd [[autocmd BufWritePre *.go lua GoImports(1000)]]
