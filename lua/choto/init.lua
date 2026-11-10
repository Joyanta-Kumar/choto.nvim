local M = {}

M.config = {
  transparent = false,
  italic_comments = true,
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  local p = require("choto.palette")
  local c = M.config

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "choto"

  local bg = c.transparent and "NONE" or p.background

  local hl = {
    -- Editor
    Normal       = { fg = p.foreground, bg = bg },
    NormalNC     = { fg = p.foreground, bg = bg },
    NormalFloat  = { fg = p.foreground, bg = p.light_background },
    FloatBorder  = { fg = p.comments, bg = p.light_background },
    FloatTitle   = { fg = p.blue, bg = p.light_background, bold = true },
    Cursor       = { fg = p.background, bg = p.light_foreground },
    CursorLine   = { bg = p.light_background },
    CursorColumn = { bg = p.light_background },
    ColorColumn  = { bg = p.light_background },
    CursorLineNr = { fg = p.yellow, bold = true },
    LineNr       = { fg = p.comments },
    SignColumn   = { fg = p.comments, bg = bg },
    FoldColumn   = { fg = p.comments, bg = bg },
    Folded       = { fg = p.dark_foreground, bg = p.light_background },
    VertSplit    = { fg = p.selection },
    WinSeparator = { fg = p.selection },
    EndOfBuffer  = { fg = p.background },
    NonText      = { fg = p.comments },
    Whitespace   = { fg = p.selection },
    SpecialKey   = { fg = p.comments },
    Conceal      = { fg = p.dark_foreground },
    Directory    = { fg = p.blue },
    Title        = { fg = p.blue, bold = true },
    MatchParen   = { fg = p.orange, bg = p.selection, bold = true },
    Visual       = { bg = p.selection },
    VisualNOS    = { bg = p.selection },
    Search       = { fg = p.background, bg = p.yellow },
    CurSearch    = { fg = p.background, bg = p.orange },
    IncSearch    = { fg = p.background, bg = p.orange },
    Substitute   = { fg = p.background, bg = p.red },
    QuickFixLine = { bg = p.selection },
    WildMenu     = { fg = p.background, bg = p.blue },

    -- Statusline / tabline
    StatusLine   = { fg = p.foreground, bg = p.light_background },
    StatusLineNC = { fg = p.dark_foreground, bg = p.light_background },
    TabLine      = { fg = p.dark_foreground, bg = p.light_background },
    TabLineFill  = { bg = p.light_background },
    TabLineSel   = { fg = p.lightest, bg = p.selection, bold = true },
    WinBar       = { fg = p.foreground, bg = bg },
    WinBarNC     = { fg = p.dark_foreground, bg = bg },

    -- Popup menu
    Pmenu        = { fg = p.foreground, bg = p.light_background },
    PmenuSel     = { fg = p.lightest, bg = p.selection },
    PmenuSbar    = { bg = p.selection },
    PmenuThumb   = { bg = p.comments },

    -- Messages
    ErrorMsg     = { fg = p.red, bold = true },
    WarningMsg   = { fg = p.yellow },
    ModeMsg      = { fg = p.foreground, bold = true },
    MoreMsg      = { fg = p.green },
    Question     = { fg = p.green },

    -- Syntax
    Comment      = { fg = p.comments, italic = c.italic_comments },
    Constant     = { fg = p.orange },
    String       = { fg = p.green },
    Character    = { fg = p.green },
    Number       = { fg = p.orange },
    Boolean      = { fg = p.orange },
    Float        = { fg = p.orange },
    Identifier   = { fg = p.light_foreground },
    Function     = { fg = p.blue },
    Statement    = { fg = p.purple },
    Conditional  = { fg = p.purple },
    Repeat       = { fg = p.purple },
    Label        = { fg = p.purple },
    Operator     = { fg = p.cyan },
    Keyword      = { fg = p.purple },
    Exception    = { fg = p.red },
    PreProc      = { fg = p.pink },
    Include      = { fg = p.purple },
    Define       = { fg = p.purple },
    Macro        = { fg = p.pink },
    PreCondit    = { fg = p.pink },
    Type         = { fg = p.yellow },
    StorageClass = { fg = p.yellow },
    Structure    = { fg = p.yellow },
    Typedef      = { fg = p.yellow },
    Special      = { fg = p.cyan },
    SpecialChar  = { fg = p.pink },
    Tag          = { fg = p.blue },
    Delimiter    = { fg = p.dark_foreground },
    SpecialComment = { fg = p.dark_foreground, bold = true },
    Debug        = { fg = p.red },
    Underlined   = { fg = p.blue, underline = true },
    Error        = { fg = p.red },
    Todo         = { fg = p.background, bg = p.yellow, bold = true },

    -- Treesitter
    ["@variable"]            = { fg = p.foreground },
    ["@variable.builtin"]    = { fg = p.red },
    ["@variable.parameter"]  = { fg = p.light_foreground, italic = true },
    ["@variable.member"]     = { fg = p.cyan },
    ["@constant"]            = { fg = p.orange },
    ["@constant.builtin"]    = { fg = p.orange },
    ["@module"]              = { fg = p.light_foreground },
    ["@string"]              = { fg = p.green },
    ["@string.escape"]       = { fg = p.pink },
    ["@string.regexp"]       = { fg = p.pink },
    ["@character"]           = { fg = p.green },
    ["@number"]              = { fg = p.orange },
    ["@boolean"]             = { fg = p.orange },
    ["@type"]                = { fg = p.yellow },
    ["@type.builtin"]        = { fg = p.yellow, italic = true },
    ["@attribute"]           = { fg = p.pink },
    ["@property"]            = { fg = p.cyan },
    ["@function"]            = { fg = p.blue },
    ["@function.builtin"]    = { fg = p.blue, italic = true },
    ["@function.call"]       = { fg = p.blue },
    ["@function.method"]     = { fg = p.blue },
    ["@constructor"]         = { fg = p.yellow },
    ["@keyword"]             = { fg = p.purple },
    ["@keyword.function"]    = { fg = p.purple },
    ["@keyword.return"]      = { fg = p.purple },
    ["@keyword.operator"]    = { fg = p.purple },
    ["@operator"]            = { fg = p.cyan },
    ["@punctuation"]         = { fg = p.dark_foreground },
    ["@punctuation.special"] = { fg = p.cyan },
    ["@comment"]             = { link = "Comment" },
    ["@tag"]                 = { fg = p.blue },
    ["@tag.attribute"]       = { fg = p.yellow },
    ["@tag.delimiter"]       = { fg = p.dark_foreground },
    ["@markup.heading"]      = { fg = p.blue, bold = true },
    ["@markup.strong"]       = { bold = true },
    ["@markup.italic"]       = { italic = true },
    ["@markup.link"]         = { fg = p.blue, underline = true },
    ["@markup.raw"]          = { fg = p.green },

    -- Diagnostics
    DiagnosticError          = { fg = p.red },
    DiagnosticWarn           = { fg = p.yellow },
    DiagnosticInfo           = { fg = p.blue },
    DiagnosticHint           = { fg = p.cyan },
    DiagnosticOk             = { fg = p.green },
    DiagnosticUnderlineError = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = p.yellow },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = p.blue },
    DiagnosticUnderlineHint  = { undercurl = true, sp = p.cyan },
    DiagnosticVirtualTextError = { fg = p.red },
    DiagnosticVirtualTextWarn  = { fg = p.yellow },
    DiagnosticVirtualTextInfo  = { fg = p.blue },
    DiagnosticVirtualTextHint  = { fg = p.cyan },
    SpellBad   = { undercurl = true, sp = p.red },
    SpellCap   = { undercurl = true, sp = p.yellow },
    SpellLocal = { undercurl = true, sp = p.cyan },
    SpellRare  = { undercurl = true, sp = p.purple },

    -- LSP
    LspReferenceText  = { bg = p.selection },
    LspReferenceRead  = { bg = p.selection },
    LspReferenceWrite = { bg = p.selection },
    LspInlayHint      = { fg = p.comments, bg = p.light_background },

    -- Diff
    DiffAdd     = { bg = "#1a2a1c" },
    DiffChange  = { bg = "#1f2633" },
    DiffDelete  = { bg = "#2d1a1c" },
    DiffText    = { bg = "#2a3548" },
    Added       = { fg = p.green },
    Changed     = { fg = p.yellow },
    Removed     = { fg = p.red },

    -- Gitsigns
    GitSignsAdd    = { fg = p.green },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },

    -- Telescope
    TelescopeNormal       = { link = "NormalFloat" },
    TelescopeBorder       = { link = "FloatBorder" },
    TelescopeSelection    = { bg = p.selection },
    TelescopeMatching     = { fg = p.orange, bold = true },
    TelescopePromptPrefix = { fg = p.purple },

    -- nvim-cmp
    CmpItemAbbrMatch      = { fg = p.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.blue },
    CmpItemKind           = { fg = p.purple },
    CmpItemMenu           = { fg = p.dark_foreground },

    -- Indent guides
    IblIndent = { fg = p.selection },
    IblScope  = { fg = p.comments },
  }

  for group, spec in pairs(hl) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  -- Terminal colors (:terminal)
  vim.g.terminal_color_0  = p.selection
  vim.g.terminal_color_1  = p.red
  vim.g.terminal_color_2  = p.green
  vim.g.terminal_color_3  = p.yellow
  vim.g.terminal_color_4  = p.blue
  vim.g.terminal_color_5  = p.purple
  vim.g.terminal_color_6  = p.cyan
  vim.g.terminal_color_7  = p.foreground
  vim.g.terminal_color_8  = p.comments
  vim.g.terminal_color_9  = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.pink
  vim.g.terminal_color_14 = p.cyan
  vim.g.terminal_color_15 = p.lightest
end

return M
