-- tokyo_vs.nvim
-- A minimal dual (dark/light) colorscheme for Neovim
-- Inspired by Tokyo Night (dark) and Visual Studio (light)

local M = {}

-- Helper function to define highlight groups
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Load palette depending on background mode
local function load_palette(mode)
  if mode == "light" then
    return require("theme.palette_light")
  end
  return require("theme.palette_dark")
end

-- Apply the colorscheme
-- @param mode string: "dark" or "light"
function M.apply(mode)
  mode = mode or "dark"
  local c = load_palette(mode)

  -- Reset highlights
  vim.cmd("highlight clear")
  vim.o.termguicolors = true
  vim.o.background = mode
  vim.g.colors_name = "boicot"

  -- ======================
  -- Editor UI
  -- ======================
  hi("Normal",       { fg = c.fg, bg = c.bg })
  hi("NormalNC",     { fg = c.fg_dim, bg = c.bg })
  hi("CursorLine",   { bg = c.bg_alt })
  hi("LineNr",       { fg = c.fg_dim })
  hi("CursorLineNr", { fg = c.blue, bold = true })
  hi("VertSplit",    { fg = c.border })
  hi("Visual",       { bg = c.border })

  -- Floating windows
  hi("NormalFloat",  { fg = c.fg, bg = c.bg_float })
  hi("FloatBorder",  { fg = c.border, bg = c.bg_float })

  -- ======================
  -- Syntax Highlighting
  -- ======================
  hi("Comment",      { fg = c.fg_dim, italic = true })
  hi("String",       { fg = c.green })
  hi("Character",    { fg = c.green })
  hi("Number",       { fg = c.orange })
  hi("Boolean",      { fg = c.orange })

  hi("Keyword",      { fg = c.magenta })
  hi("Conditional",  { fg = c.magenta })
  hi("Repeat",       { fg = c.magenta })

  hi("Function",     { fg = c.blue })
  hi("Identifier",   { fg = c.fg })
  hi("Type",         { fg = c.cyan })

  -- ======================
  -- UI Components
  -- ======================
  hi("Pmenu",        { fg = c.fg, bg = c.bg_alt })
  hi("PmenuSel",     { fg = c.bg, bg = c.blue })
  hi("PmenuSbar",    { bg = c.bg_alt })
  hi("PmenuThumb",   { bg = c.border })

  -- ======================
  -- Diagnostics (LSP)
  -- ======================
  hi("DiagnosticError", { fg = c.red })
  hi("DiagnosticWarn",  { fg = c.yellow })
  hi("DiagnosticInfo",  { fg = c.blue })
  hi("DiagnosticHint",  { fg = c.cyan })
end

return M
