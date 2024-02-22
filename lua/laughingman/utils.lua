local M = {}

M.mapcmd = function(cmd)
	return '<cmd>' .. cmd .. '<cr>'
end

M.mapopts = function(silent)
	local noresilent = { noremap = true, silent = true }
	local nore = { noremap = true }
	if silent then
		return noresilent
	else
		return nore
	end
end

M.nmap = function(tbl)
	vim.keymap.set('n', tbl[1], tbl[2], M.mapopts(tbl[3]))
end

M.imap = function(tbl)
	vim.keymap.set('i', tbl[1], tbl[2], M.mapopts(tbl[3]))
end

return M
