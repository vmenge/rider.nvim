local M = {}

function M.get(c)
  local highlights = {}

  -- Core editor
  highlights.Normal       = { fg = c.fg, bg = c.bg }
  highlights.NormalFloat  = { fg = c.fg, bg = c.bg_light }
  highlights.NormalNC     = { fg = c.fg, bg = c.bg }
  highlights.Cursor       = { fg = c.bg, bg = c.fg_bright }
  highlights.CursorLine   = { bg = c.bg_light }
  highlights.CursorLineNr = { fg = c.fg_bright, bold = true }
  highlights.Visual       = { bg = c.selection }
  highlights.VisualNOS    = { bg = c.selection }
  highlights.Search       = { bg = c.search }
  highlights.IncSearch    = { fg = c.bg, bg = c.match }
  highlights.CurSearch    = { fg = c.bg, bg = c.match }
  highlights.LineNr       = { fg = c.line_nr }
  highlights.SignColumn   = { bg = c.bg }
  highlights.FoldColumn   = { fg = c.line_nr, bg = c.bg }
  highlights.Folded       = { fg = c.fg_dark, bg = c.bg_light }
  highlights.MatchParen   = { fg = c.match, bold = true }
  highlights.ColorColumn  = { bg = c.bg_light }
  highlights.Conceal      = { fg = c.line_nr }
  highlights.NonText      = { fg = c.indent }
  highlights.SpecialKey   = { fg = c.indent }
  highlights.Whitespace   = { fg = c.indent }
  highlights.EndOfBuffer  = { fg = c.bg }

  -- Window and tab UI
  highlights.StatusLine   = { fg = c.fg, bg = c.bg_dark }
  highlights.StatusLineNC = { fg = c.fg_dark, bg = c.bg_dark }
  highlights.TabLine      = { fg = c.fg_dark, bg = c.bg_dark }
  highlights.TabLineSel   = { fg = c.fg_bright, bg = c.bg, bold = true }
  highlights.TabLineFill  = { bg = c.bg_dark }
  highlights.WinSeparator = { fg = c.border }
  highlights.VertSplit    = { fg = c.border }
  highlights.WinBar       = { fg = c.fg, bg = c.bg }
  highlights.WinBarNC     = { fg = c.fg_dark, bg = c.bg }

  -- Popup menu
  highlights.Pmenu        = { fg = c.fg, bg = c.bg_light }
  highlights.PmenuSel     = { fg = c.fg_bright, bg = c.selection }
  highlights.PmenuSbar    = { bg = c.bg_lighter }
  highlights.PmenuThumb   = { bg = c.line_nr }

  -- Float
  highlights.FloatBorder  = { fg = c.border, bg = c.bg_light }
  highlights.FloatTitle   = { fg = c.fg_bright, bg = c.bg_light, bold = true }

  -- Messages
  highlights.Title        = { fg = c.keyword, bold = true }
  highlights.Directory    = { fg = c.keyword }
  highlights.Question     = { fg = c.func }
  highlights.MoreMsg      = { fg = c.func }
  highlights.ErrorMsg     = { fg = c.error }
  highlights.WarningMsg   = { fg = c.warning }
  highlights.ModeMsg      = { fg = c.fg, bold = true }
  highlights.WildMenu     = { fg = c.fg_bright, bg = c.selection }

  -- Diff
  highlights.DiffAdd      = { bg = c.added }
  highlights.DiffChange   = { bg = c.changed }
  highlights.DiffDelete   = { fg = c.deleted, bg = c.deleted }
  highlights.DiffText     = { bg = "#2d4f8e" }

  -- Spell
  highlights.SpellBad     = { undercurl = true, sp = c.error }
  highlights.SpellCap     = { undercurl = true, sp = c.warning }
  highlights.SpellLocal   = { undercurl = true, sp = c.info }
  highlights.SpellRare    = { undercurl = true, sp = c.hint }

  -- Legacy syntax (Vim defaults)
  highlights.Comment      = { fg = c.comment, italic = true }
  highlights.Constant     = { fg = c.constant }
  highlights.String       = { fg = c.string }
  highlights.Character    = { fg = c.string }
  highlights.Number       = { fg = c.number }
  highlights.Boolean      = { fg = c.keyword }
  highlights.Float        = { fg = c.number }
  highlights.Identifier   = { fg = c.fg }
  highlights.Function     = { fg = c.func }
  highlights.Statement    = { fg = c.keyword }
  highlights.Conditional  = { fg = c.keyword }
  highlights.Repeat       = { fg = c.keyword }
  highlights.Label        = { fg = c.keyword }
  highlights.Operator     = { fg = c.operator }
  highlights.Keyword      = { fg = c.keyword }
  highlights.Exception    = { fg = c.keyword }
  highlights.PreProc      = { fg = c.keyword }
  highlights.Include      = { fg = c.keyword }
  highlights.Define       = { fg = c.keyword }
  highlights.Macro        = { fg = c.constant }
  highlights.PreCondit    = { fg = c.keyword }
  highlights.Type         = { fg = c.type }
  highlights.StorageClass = { fg = c.keyword }
  highlights.Structure    = { fg = c.type }
  highlights.Typedef      = { fg = c.type }
  highlights.Special      = { fg = c.constant }
  highlights.SpecialChar  = { fg = c.constant }
  highlights.Tag          = { fg = c.keyword }
  highlights.Delimiter    = { fg = c.fg }
  highlights.Debug        = { fg = c.error }
  highlights.Underlined   = { fg = c.keyword, underline = true }
  highlights.Ignore       = { fg = c.indent }
  highlights.Error        = { fg = c.error }
  highlights.Todo         = { fg = c.bg, bg = c.match, bold = true }

  -- Treesitter
  highlights["@comment"]               = { link = "Comment" }
  highlights["@keyword"]               = { fg = c.keyword }
  highlights["@keyword.function"]      = { fg = c.keyword }
  highlights["@keyword.operator"]      = { fg = c.keyword }
  highlights["@keyword.return"]        = { fg = c.keyword }
  highlights["@conditional"]           = { fg = c.keyword }
  highlights["@repeat"]                = { fg = c.keyword }
  highlights["@exception"]             = { fg = c.keyword }
  highlights["@include"]               = { fg = c.keyword }
  highlights["@string"]                = { fg = c.string }
  highlights["@string.escape"]         = { fg = c.constant }
  highlights["@string.regex"]          = { fg = c.constant }
  highlights["@string.special"]        = { fg = c.constant }
  highlights["@character"]             = { fg = c.string }
  highlights["@number"]                = { fg = c.number }
  highlights["@boolean"]               = { fg = c.keyword }
  highlights["@float"]                 = { fg = c.number }
  highlights["@function"]              = { fg = c.func }
  highlights["@function.call"]         = { fg = c.func }
  highlights["@function.builtin"]      = { fg = c.func }
  highlights["@function.macro"]        = { fg = c.func }
  highlights["@method"]                = { fg = c.func }
  highlights["@method.call"]           = { fg = c.func }
  highlights["@constructor"]           = { fg = c.type }
  highlights["@parameter"]             = { fg = c.fg }
  highlights["@field"]                 = { fg = c.constant }
  highlights["@property"]              = { fg = c.constant }
  highlights["@variable"]              = { fg = c.fg }
  highlights["@variable.builtin"]      = { fg = c.keyword }
  highlights["@constant"]              = { fg = c.constant, bold = true }
  highlights["@constant.builtin"]      = { fg = c.constant }
  highlights["@constant.macro"]        = { fg = c.constant }
  highlights["@type"]                  = { fg = c.type }
  highlights["@type.builtin"]          = { fg = c.type }
  highlights["@type.definition"]       = { fg = c.type }
  highlights["@type.qualifier"]        = { fg = c.keyword }
  highlights["@namespace"]             = { fg = c.type }
  highlights["@operator"]              = { fg = c.operator }
  highlights["@punctuation.bracket"]   = { fg = c.fg }
  highlights["@punctuation.delimiter"] = { fg = c.fg }
  highlights["@punctuation.special"]   = { fg = c.constant }
  highlights["@tag"]                   = { fg = c.keyword }
  highlights["@tag.attribute"]         = { fg = c.func }
  highlights["@tag.delimiter"]         = { fg = c.fg_dark }
  highlights["@label"]                 = { fg = c.keyword }
  highlights["@preproc"]               = { fg = c.keyword }
  highlights["@define"]                = { fg = c.keyword }
  highlights["@text"]                  = { fg = c.fg }
  highlights["@text.strong"]           = { bold = true }
  highlights["@text.emphasis"]         = { italic = true }
  highlights["@text.underline"]        = { underline = true }
  highlights["@text.strike"]           = { strikethrough = true }
  highlights["@text.title"]            = { fg = c.keyword, bold = true }
  highlights["@text.literal"]          = { fg = c.string }
  highlights["@text.uri"]              = { fg = c.keyword, underline = true }
  highlights["@text.todo"]             = { link = "Todo" }
  highlights["@text.note"]             = { fg = c.info }
  highlights["@text.warning"]          = { fg = c.warning }
  highlights["@text.danger"]           = { fg = c.error }

  -- LSP Diagnostics
  highlights.DiagnosticError             = { fg = c.error }
  highlights.DiagnosticWarn              = { fg = c.warning }
  highlights.DiagnosticInfo              = { fg = c.info }
  highlights.DiagnosticHint              = { fg = c.hint }
  highlights.DiagnosticUnderlineError    = { undercurl = true, sp = c.error }
  highlights.DiagnosticUnderlineWarn     = { undercurl = true, sp = c.warning }
  highlights.DiagnosticUnderlineInfo     = { undercurl = true, sp = c.info }
  highlights.DiagnosticUnderlineHint     = { undercurl = true, sp = c.hint }
  highlights.DiagnosticVirtualTextError  = { fg = c.error, bg = "#3d2020" }
  highlights.DiagnosticVirtualTextWarn   = { fg = c.warning, bg = "#3d3520" }
  highlights.DiagnosticVirtualTextInfo   = { fg = c.info, bg = "#20303d" }
  highlights.DiagnosticVirtualTextHint   = { fg = c.hint, bg = "#203d30" }
  highlights.DiagnosticSignError         = { fg = c.error }
  highlights.DiagnosticSignWarn          = { fg = c.warning }
  highlights.DiagnosticSignInfo          = { fg = c.info }
  highlights.DiagnosticSignHint          = { fg = c.hint }

  -- LSP References
  highlights.LspReferenceText            = { bg = c.bg_lighter }
  highlights.LspReferenceRead            = { bg = c.bg_lighter }
  highlights.LspReferenceWrite           = { bg = c.bg_lighter, bold = true }
  highlights.LspSignatureActiveParameter = { fg = c.match, bold = true }
  highlights.LspCodeLens                 = { fg = c.line_nr }
  highlights.LspInlayHint                = { fg = c.line_nr, bg = c.bg_light, italic = true }

  -- Telescope
  highlights.TelescopeNormal        = { fg = c.fg, bg = c.bg_light }
  highlights.TelescopeBorder        = { fg = c.border, bg = c.bg_light }
  highlights.TelescopePromptNormal  = { fg = c.fg, bg = c.bg_lighter }
  highlights.TelescopePromptBorder  = { fg = c.border, bg = c.bg_lighter }
  highlights.TelescopePromptTitle   = { fg = c.fg_bright, bg = c.bg_lighter, bold = true }
  highlights.TelescopePreviewTitle  = { fg = c.fg_bright, bg = c.bg_light, bold = true }
  highlights.TelescopeResultsTitle  = { fg = c.fg_bright, bg = c.bg_light, bold = true }
  highlights.TelescopeSelection     = { bg = c.selection }
  highlights.TelescopeMatching      = { fg = c.match, bold = true }

  -- nvim-cmp
  highlights.CmpItemAbbr            = { fg = c.fg }
  highlights.CmpItemAbbrDeprecated  = { fg = c.fg_dark, strikethrough = true }
  highlights.CmpItemAbbrMatch       = { fg = c.match, bold = true }
  highlights.CmpItemAbbrMatchFuzzy  = { fg = c.match, bold = true }
  highlights.CmpItemMenu            = { fg = c.fg_dark }
  highlights.CmpItemKindText        = { fg = c.fg }
  highlights.CmpItemKindMethod      = { fg = c.func }
  highlights.CmpItemKindFunction    = { fg = c.func }
  highlights.CmpItemKindConstructor = { fg = c.type }
  highlights.CmpItemKindField       = { fg = c.constant }
  highlights.CmpItemKindVariable    = { fg = c.fg }
  highlights.CmpItemKindClass       = { fg = c.type }
  highlights.CmpItemKindInterface   = { fg = c.type }
  highlights.CmpItemKindModule      = { fg = c.keyword }
  highlights.CmpItemKindProperty    = { fg = c.constant }
  highlights.CmpItemKindKeyword     = { fg = c.keyword }
  highlights.CmpItemKindSnippet     = { fg = c.string }
  highlights.CmpItemKindColor       = { fg = c.constant }
  highlights.CmpItemKindFile        = { fg = c.fg }
  highlights.CmpItemKindFolder      = { fg = c.keyword }
  highlights.CmpItemKindEnum        = { fg = c.type }
  highlights.CmpItemKindEnumMember  = { fg = c.constant }
  highlights.CmpItemKindConstant    = { fg = c.constant }
  highlights.CmpItemKindStruct      = { fg = c.type }
  highlights.CmpItemKindOperator    = { fg = c.operator }
  highlights.CmpItemKindTypeParameter = { fg = c.type }
  highlights.CmpItemKindValue       = { fg = c.string }

  -- GitSigns
  highlights.GitSignsAdd            = { fg = c.comment }
  highlights.GitSignsChange         = { fg = c.keyword }
  highlights.GitSignsDelete         = { fg = c.error }

  -- indent-blankline
  highlights.IblIndent              = { fg = c.indent }
  highlights.IblScope               = { fg = c.border }

  -- nvim-tree / neo-tree
  highlights.NvimTreeNormal         = { fg = c.fg, bg = c.bg_dark }
  highlights.NvimTreeFolderIcon     = { fg = c.keyword }
  highlights.NvimTreeFolderName     = { fg = c.fg }
  highlights.NvimTreeOpenedFolderName = { fg = c.fg, bold = true }
  highlights.NvimTreeGitDirty       = { fg = c.warning }
  highlights.NvimTreeGitNew         = { fg = c.comment }
  highlights.NvimTreeGitDeleted     = { fg = c.error }
  highlights.NvimTreeSpecialFile    = { fg = c.constant }
  highlights.NvimTreeRootFolder     = { fg = c.type, bold = true }
  highlights.NeoTreeNormal          = { fg = c.fg, bg = c.bg_dark }
  highlights.NeoTreeNormalNC        = { fg = c.fg, bg = c.bg_dark }
  highlights.NeoTreeDimText         = { fg = c.fg_dark }

  return highlights
end

return M
