for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/plugins")) do
	if file ~= "init.lua" and file:match("%.lua$") then
		require("plugins." .. file:gsub("%.lua$", ""))
	end
end
