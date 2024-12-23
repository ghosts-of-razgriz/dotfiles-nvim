P = function(v)
	print(vim.inspect(v))
	return v
end

SimpleBuild = function()
	local neovim_build = os.getenv('NEOVIM_BUILD')
	if neovim_build then
		return false
	else
		return true
	end
end
