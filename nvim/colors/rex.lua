-- Rex colorscheme: reads the active theme straight from the Rex app bundle, so
-- nvim matches whatever theme Rex uses (Settings -> Appearance).

local THEMES_JSON = "/Applications/Rex Beta.app/Contents/Resources/SuperUI_SuperDesignTokens.bundle/Contents/Resources/themes.json"
local DOMAIN = "com.superlogical.rex"

local function read_default(domain, key)
	local out = vim.fn.system({ "defaults", "read", domain, key })
	if vim.v.shell_error ~= 0 then
		return nil
	end
	return vim.trim(out)
end

local function appearance()
	-- Rex follows the system unless told otherwise
	local pref = read_default(DOMAIN, "Workspace.appearance")
	if pref == "dark" or pref == "light" then
		return pref
	end
	return read_default("-g", "AppleInterfaceStyle") == "Dark" and "dark" or "light"
end

local function load_theme(mode)
	local id = read_default(DOMAIN, mode == "dark" and "Workspace.darkThemeID" or "Workspace.lightThemeID")
		or ("merino-" .. mode)
	local f = io.open(THEMES_JSON, "r")
	if not f then
		return nil
	end
	local ok, themes = pcall(vim.json.decode, f:read("*a"))
	f:close()
	if not ok then
		return nil
	end
	local fallback
	for _, t in ipairs(themes) do
		if t.id == id then
			return t
		end
		if t.id == "merino-" .. mode then
			fallback = t
		end
	end
	return fallback
end

local mode = appearance()
local theme = load_theme(mode)
if not theme then
	vim.notify("rex colorscheme: could not read Rex theme, falling back to default", vim.log.levels.WARN)
	vim.cmd.colorscheme("default")
	return
end

-- cssVariables come as "r g b", "rgb(r g b)", "rgb(r g b / a)" or "#rrggbb"
local function parse(v)
	if v:sub(1, 1) == "#" then
		return tonumber(v:sub(2, 3), 16), tonumber(v:sub(4, 5), 16), tonumber(v:sub(6, 7), 16), 1
	end
	local nums = {}
	for n in v:gmatch("[%d%.]+") do
		nums[#nums + 1] = tonumber(n)
	end
	return nums[1], nums[2], nums[3], nums[4] or 1
end

local function hex(r, g, b)
	return string.format("#%02x%02x%02x", math.floor(r + 0.5), math.floor(g + 0.5), math.floor(b + 0.5))
end

local css = theme.cssVariables
local br, bg_, bb = parse(css["--super-term-bg"])

-- Resolve a variable to hex, blending any alpha over the terminal background
local function c(name, alpha)
	local r, g, b, a = parse(css["--super-" .. name])
	a = alpha or a
	return hex(r * a + br * (1 - a), g * a + bg_ * (1 - a), b * a + bb * (1 - a))
end

local p = {
	bg = c("term-bg"),
	fg = c("tt-fg"),
	sidebar = c("sidebar"),
	raised = c("raised"),
	border = c("border"),
	border_strong = c("border-strong"),
	text2 = c("text-secondary"),
	text3 = c("text-tertiary"),
	hover = c("hover"),
	selected = c("selected"),
	accent = c("accent"),
	accent_solid = c("accent-solid"),
	on_solid = c("accent-on-solid"),
	accent_container = c("accent-container"),
	accent_dim = c("accent-dim"),
	danger = c("danger"),
	danger_bg = c("danger-container"),
	warning = c("warning"),
	warning_bg = c("warning-container"),
	success = c("success"),
	success_bg = c("success-container"),
	info = c("info"),
	info_bg = c("info-container"),
}
local a = {}
for i = 0, 15 do
	a[i] = c("tt-" .. i)
	vim.g["terminal_color_" .. i] = a[i]
end

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = mode
vim.g.colors_name = "rex"

local hl = function(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

-- Editor UI
hl("Normal", { fg = p.fg, bg = p.bg })
hl("NormalNC", { link = "Normal" })
hl("NormalFloat", { fg = p.fg, bg = p.raised })
hl("FloatBorder", { fg = p.border_strong, bg = p.raised })
hl("FloatTitle", { fg = p.accent, bg = p.raised, bold = true })
hl("Cursor", { fg = p.bg, bg = c("tt-cursor") })
hl("CursorLine", { bg = p.selected })
hl("CursorColumn", { link = "CursorLine" })
hl("ColorColumn", { bg = p.hover })
hl("LineNr", { fg = p.text3 })
hl("CursorLineNr", { fg = p.fg, bold = true })
hl("SignColumn", { fg = p.text3 })
hl("FoldColumn", { fg = p.text3 })
hl("Folded", { fg = p.text2, bg = p.hover })
hl("EndOfBuffer", { fg = p.bg })
hl("NonText", { fg = p.text3 })
hl("Whitespace", { fg = p.border })
hl("SpecialKey", { fg = p.text3 })
hl("WinSeparator", { fg = p.border })
hl("VertSplit", { link = "WinSeparator" })
hl("StatusLine", { fg = p.fg, bg = p.sidebar })
hl("StatusLineNC", { fg = p.text2, bg = p.sidebar })
hl("TabLine", { fg = p.text2, bg = p.sidebar })
hl("TabLineFill", { bg = p.sidebar })
hl("TabLineSel", { fg = p.fg, bg = p.bg, bold = true })
hl("WinBar", { fg = p.text2 })
hl("WinBarNC", { fg = p.text3 })
hl("Visual", { bg = p.accent_dim })
hl("Search", { fg = p.fg, bg = p.warning_bg })
hl("CurSearch", { fg = p.on_solid, bg = p.warning })
hl("IncSearch", { link = "CurSearch" })
hl("Substitute", { fg = p.on_solid, bg = p.danger })
hl("MatchParen", { fg = p.accent, bold = true, underline = true })
hl("Pmenu", { fg = p.fg, bg = p.raised })
hl("PmenuSel", { fg = p.fg, bg = p.accent_container, bold = true })
hl("PmenuSbar", { bg = p.raised })
hl("PmenuThumb", { bg = p.border_strong })
hl("PmenuKind", { fg = p.accent, bg = p.raised })
hl("PmenuExtra", { fg = p.text2, bg = p.raised })
hl("WildMenu", { link = "PmenuSel" })
hl("Directory", { fg = a[4] })
hl("Title", { fg = p.accent, bold = true })
hl("ErrorMsg", { fg = p.danger })
hl("WarningMsg", { fg = p.warning })
hl("MoreMsg", { fg = p.success })
hl("ModeMsg", { fg = p.text2 })
hl("Question", { fg = p.info })
hl("QuickFixLine", { bg = p.accent_container })
hl("Conceal", { fg = p.text3 })
hl("SpellBad", { sp = p.danger, undercurl = true })
hl("SpellCap", { sp = p.warning, undercurl = true })
hl("SpellLocal", { sp = p.info, undercurl = true })
hl("SpellRare", { sp = a[5], undercurl = true })

-- Syntax (terminal ANSI colors, same as the shell)
hl("Comment", { fg = p.text3, italic = true })
hl("Constant", { fg = a[3] })
hl("String", { fg = a[2] })
hl("Character", { link = "String" })
hl("Number", { fg = a[3] })
hl("Boolean", { fg = a[3] })
hl("Float", { link = "Number" })
hl("Identifier", { fg = p.fg })
hl("Function", { fg = a[4] })
hl("Statement", { fg = a[5] })
hl("Keyword", { fg = a[5] })
hl("Conditional", { link = "Keyword" })
hl("Repeat", { link = "Keyword" })
hl("Label", { fg = a[5] })
hl("Exception", { fg = a[5] })
hl("Operator", { fg = p.text2 })
hl("PreProc", { fg = a[13] })
hl("Include", { fg = a[5] })
hl("Type", { fg = a[6] })
hl("StorageClass", { link = "Keyword" })
hl("Structure", { link = "Type" })
hl("Special", { fg = a[12] })
hl("Delimiter", { fg = p.text2 })
hl("Tag", { fg = a[4] })
hl("Underlined", { underline = true })
hl("Error", { fg = p.danger })
hl("Todo", { fg = p.on_solid, bg = p.warning, bold = true })

-- Treesitter
hl("@variable", { fg = p.fg })
hl("@variable.builtin", { fg = a[1] })
hl("@variable.parameter", { fg = a[11] })
hl("@variable.member", { fg = a[12] })
hl("@property", { fg = a[12] })
hl("@constant.builtin", { fg = a[3] })
hl("@function.builtin", { fg = a[6] })
hl("@constructor", { fg = a[6] })
hl("@module", { fg = a[13] })
hl("@tag", { fg = a[1] })
hl("@tag.attribute", { fg = a[11] })
hl("@tag.delimiter", { fg = p.text2 })
hl("@punctuation", { fg = p.text2 })
hl("@markup.heading", { fg = p.accent, bold = true })
hl("@markup.link", { fg = a[4], underline = true })
hl("@markup.raw", { fg = a[2] })
hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })

-- Diagnostics
hl("DiagnosticError", { fg = p.danger })
hl("DiagnosticWarn", { fg = p.warning })
hl("DiagnosticInfo", { fg = p.info })
hl("DiagnosticHint", { fg = a[6] })
hl("DiagnosticOk", { fg = p.success })
hl("DiagnosticVirtualTextError", { fg = p.danger, bg = p.danger_bg })
hl("DiagnosticVirtualTextWarn", { fg = p.warning, bg = p.warning_bg })
hl("DiagnosticVirtualTextInfo", { fg = p.info, bg = p.info_bg })
hl("DiagnosticVirtualTextHint", { fg = a[6], bg = p.hover })
hl("DiagnosticUnderlineError", { sp = p.danger, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = p.warning, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = p.info, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = a[6], undercurl = true })

-- Diff / git
hl("DiffAdd", { bg = p.success_bg })
hl("DiffDelete", { fg = p.danger, bg = p.danger_bg })
hl("DiffChange", { bg = p.info_bg })
hl("DiffText", { bg = p.accent_dim, bold = true })
hl("Added", { fg = p.success })
hl("Changed", { fg = p.warning })
hl("Removed", { fg = p.danger })
hl("GitSignsAdd", { link = "Added" })
hl("GitSignsChange", { link = "Changed" })
hl("GitSignsDelete", { link = "Removed" })

-- Plugins
hl("TelescopeNormal", { link = "NormalFloat" })
hl("TelescopeBorder", { link = "FloatBorder" })
hl("TelescopeTitle", { link = "FloatTitle" })
hl("TelescopeSelection", { link = "PmenuSel" })
hl("TelescopeMatching", { fg = p.accent, bold = true })
hl("NvimTreeNormal", { fg = p.fg, bg = p.sidebar })
hl("NvimTreeNormalNC", { link = "NvimTreeNormal" })
hl("NvimTreeEndOfBuffer", { fg = p.sidebar, bg = p.sidebar })
hl("NvimTreeWinSeparator", { fg = p.border, bg = p.sidebar })
hl("NvimTreeCursorLine", { bg = p.selected })
hl("NvimTreeFolderName", { fg = p.fg })
hl("NvimTreeOpenedFolderName", { fg = p.fg, bold = true })
hl("NvimTreeFolderIcon", { fg = a[4] })
hl("NvimTreeRootFolder", { fg = p.accent, bold = true })
hl("NvimTreeGitDirty", { link = "Changed" })
hl("NvimTreeGitNew", { link = "Added" })
hl("NvimTreeGitDeleted", { link = "Removed" })
hl("WhichKey", { fg = p.accent })
hl("WhichKeyGroup", { fg = a[5] })
hl("WhichKeyDesc", { fg = p.fg })
hl("WhichKeyFloat", { link = "NormalFloat" })
