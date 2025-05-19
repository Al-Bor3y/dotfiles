local plugins = {"theme", "bufferLine", "completion", "LSPs", "statusLine", "style", "syntaxHighlighter", "telescope", "notify", "explorer", "luaSnip", "gx-extended", "animations"}

for _, plugin in ipairs(plugins) do
	require("user.plugins.setup." .. plugin)
end

