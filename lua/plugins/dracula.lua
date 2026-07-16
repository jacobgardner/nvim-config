local colors = require("dracula").colors()
vim.cmd([[colorscheme dracula]])

local setHighlight = function(name, hi_colors)
	vim.api.nvim_set_hl(0, name, hi_colors)
end

setHighlight("TreesitterContext", { bg = colors.comment })
setHighlight("FidgetTitle", { fg = colors.comment })
setHighlight("FidgetTask", { bg = colors.orange })
setHighlight("debugBreakpoint", { fg = colors.red })
setHighlight("debugPc", { bg = colors.comment })

local bg_global = "#000000"
local fg_global = "#ffffff"

---@param c  string
local function rgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
local function blend(foreground, alpha, background)
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local bg = rgb(background)
	local fg = rgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

local function blend_bg(hex, amount, bg)
	return blend(hex, amount, bg or bg_global)
end

local darken = blend_bg

setHighlight("DiffAdd", { bg = "#2E493F" })
setHighlight("DiffDelete", { bg = "#48303B" })
setHighlight("DiffChange", { bg = "#343746" })
setHighlight("DiffText", { bg = "#5E4E44" })
-- setHighlight("illuminatedWord", { bg = darken(colors.comment, 0.65) })
-- setHighlight("illuminatedCurWord", { bg = darken(colors.comment, 0.65) })
-- setHighlight("IlluminatedWordText", { bg = darken(colors.comment, 0.65) })
-- setHighlight("IlluminatedWordRead", { bg = darken(colors.comment, 0.65) })
-- setHighlight("IlluminatedWordWrite", { bg = darken(colors.comment, 0.65) })
