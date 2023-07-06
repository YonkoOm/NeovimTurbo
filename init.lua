vim.loader.enable() -- Enable the Lua Module Loader

require("yonkoom.base")
require("yonkoom.highlights")
require("yonkoom.keymaps")
require("yonkoom.plugins")

local has = function(x)
	return vim.fn.has(x) == 1
end
local is_mac = has("macunix")
local is_win = has("win32")

if is_mac == 1 then
	require("yonkoom.macos")
end
if is_win == 1 then
	require("yonkoom.windows")
end
