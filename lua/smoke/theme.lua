local M = {}

---@param options Config
function M._load(options)
  local h = require('smoke.util').highlight
  local p = require('smoke.palette')

  local groups = options.groups or {}
  local maybe = {
    base = (options.disable_background and p.none) or groups.background,
    surface = (options.disable_float_background and p.none) or groups.panel,
    italic = not options.disable_italics,
    undercurl = not options.disable_undercurl
  }
  maybe.bold_vert_split = (options.bold_vert_split and groups.border)
      or p.none
  maybe.dim_nc_background = (
      options.dim_nc_background and groups.background_nc
      ) or maybe.base

  h('ColorColumn', { bg = p.overlay })
  h('Conceal', { bg = p.none })
  h('CurSearch', { link = 'IncSearch' })
  h('Cursor', { fg = p.text, bg = p.high3 })
  h('CursorColumn', { bg = p.low4 })
  -- CursorIM = {},
  h('CursorLine', { bg = p.low4 })
  h('CursorLineNr', { fg = p.text })
  h('DarkenedPanel', { bg = maybe.surface })
  h('DarkenedStatusline', { bg = maybe.surface })
  h('DiffAdd', { bg = groups.git_add, blend = 20 })

  h('DiffChange', { bg = p.overlay })
  h('DiffDelete', { bg = groups.git_delete, blend = 20 })
  h('DiffText', { bg = groups.git_text, blend = 20 })
  h('diffAdded', { link = 'DiffAdd' })
  h('diffChanged', { link = 'DiffChange' })
  h('diffRemoved', { link = 'DiffDelete' })
  h('Directory', { fg = p.high1, bg = p.none })
  -- EndOfBuffer = {},
  h('ErrorMsg', { fg = p.red, bold = true })
  h('FloatBorder', { fg = groups.border, bg = maybe.surface })
  h('FloatTitle', { fg = p.low2 })
  h('FoldColumn', { fg = p.low2 })
  h('Folded', { fg = p.text, bg = maybe.surface })
  h('IncSearch', { fg = groups.background, bg = p.high3 })
  h('LineNr', { fg = p.low2 })
  h('MatchParen', { fg = p.text, bg = p.low1 })
  h('ModeMsg', { fg = p.low1 })
  h('MoreMsg', { fg = p.medium })
  h('NonText', { fg = p.low2 })
  h('Normal', { fg = p.text, bg = maybe.base })
  h('NormalFloat', { fg = p.text, bg = maybe.surface })
  h('NormalNC', { fg = p.text, bg = maybe.dim_nc_background })
  h('NvimInternalError', { fg = '#ffffff', bg = p.red })
  h('Pmenu', { fg = p.low1, bg = maybe.surface })
  h('PmenuSbar', { bg = p.low4 })
  h('PmenuSel', { fg = p.text, bg = p.overlay })
  h('PmenuThumb', { bg = p.medium })
  h('Question', { fg = p.high4 })
  -- QuickFixLine = {},
  -- RedrawDebugNormal = {}
  h('RedrawDebugClear', { fg = '#ffffff', bg = p.high4 })
  h('RedrawDebugComposed', { fg = '#ffffff', bg = p.high1 })
  h('RedrawDebugRecompose', { fg = '#ffffff', bg = p.red })
  h('Search', { fg = groups.background, bg = p.medium })
  h('SpecialKey', { fg = p.high1 })
  h('SpellBad', { sp = p.low1, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('SpellCap', { sp = p.low1, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('SpellLocal', { sp = p.low1, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('SpellRare', { sp = p.low1, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('SignColumn', {
    fg = p.text,
    bg = (options.dim_nc_background and p.none) or maybe.base,
  })
  h('StatusLine', { fg = p.low1, bg = groups.panel })
  h('StatusLineNC', { fg = p.low2, bg = groups.panel_nc })
  h('StatusLineTerm', { link = 'StatusLine' })
  h('StatusLineTermNC', { link = 'StatusLineNC' })
  h('TabLine', { fg = p.low1, bg = groups.panel })
  h('TabLineFill', { bg = groups.panel })
  h('TabLineSel', { fg = p.text, bg = p.overlay })
  h('Title', { fg = p.text })
  h('VertSplit', { fg = groups.border, bg = maybe.bold_vert_split })
  h('Visual', { bg = p.low2 })
  -- VisualNOS = {},
  h('WarningMsg', { fg = p.orange })
  -- Whitespace = {},
  h('WildMenu', { link = 'IncSearch' })

  h('Boolean', { fg = p.high3 })
  h('Character', { fg = p.high3 })
  h('Comment', { fg = groups.comment, italic = maybe.italic })
  h('Conditional', { fg = p.high1 })
  h('Constant', { fg = p.high3 })
  h('Debug', { fg = p.high3 })
  h('Define', { fg = p.medium })
  h('Delimiter', { fg = p.low1 })
  h('Error', { fg = p.red })
  h('Exception', { fg = p.high1 })
  h('Float', { fg = p.high3 })
  h('Function', { fg = p.high1 })
  h('Identifier', { fg = p.high3 })
  -- Ignore = {},
  h('Include', { fg = p.medium })
  h('Keyword', { fg = p.medium })
  h('Label', { fg = p.high1 })
  h('Macro', { fg = p.medium })
  h('Number', { fg = p.high3 })
  h('Operator', { fg = p.low1 })
  h('PreCondit', { fg = p.medium })
  h('PreProc', { fg = p.medium })
  h('Repeat', { fg = p.high1 })
  h('Special', { fg = p.pink })
  h('SpecialChar', { fg = p.high3 })
  h('SpecialComment', { fg = p.medium })
  h('Statement', { fg = p.high1 })
  h('StorageClass', { fg = p.high1 })
  h('String', { fg = p.high2 })
  h('Structure', { fg = p.high1 })
  h('Tag', { fg = p.high3 })
  h('Todo', { fg = p.medium })
  h('Type', { fg = p.high1 })
  h('Typedef', { link = 'Type' })
  h('Underlined', { underline = true })

  h('htmlArg', { fg = p.medium })
  h('htmlBold', { bold = true })
  h('htmlEndTag', { fg = p.low1 })
  h('htmlH1', { fg = groups.headings.h1, bold = true })
  h('htmlH2', { fg = groups.headings.h2, bold = true })
  h('htmlH3', { fg = groups.headings.h3, bold = true })
  h('htmlH4', { fg = groups.headings.h4, bold = true })
  h('htmlH5', { fg = groups.headings.h5, bold = true })
  h('htmlItalic', { italic = maybe.italic })
  h('htmlLink', { fg = groups.link })
  h('htmlTag', { fg = p.low1 })
  h('htmlTagN', { fg = p.text })
  h('htmlTagName', { fg = p.high1 })

  h('markdownDelimiter', { fg = p.low1 })
  h('markdownH1', { fg = groups.headings.h1, bold = true })
  h('markdownH1Delimiter', { link = 'markdownH1' })
  h('markdownH2', { fg = groups.headings.h2, bold = true })
  h('markdownH2Delimiter', { link = 'markdownH2' })
  h('markdownH3', { fg = groups.headings.h3, bold = true })
  h('markdownH3Delimiter', { link = 'markdownH3' })
  h('markdownH4', { fg = groups.headings.h4, bold = true })
  h('markdownH4Delimiter', { link = 'markdownH4' })
  h('markdownH5', { fg = groups.headings.h5, bold = true })
  h('markdownH5Delimiter', { link = 'markdownH5' })
  h('markdownH6', { fg = groups.headings.h6, bold = true })
  h('markdownH6Delimiter', { link = 'markdownH6' })
  h(
    'markdownLinkText',
    { fg = groups.link, sp = groups.link, underline = true }
  )
  h('markdownUrl', { link = 'markdownLinkText' })

  h('mkdCode', { fg = p.high1, italic = maybe.italic })
  h('mkdCodeDelimiter', { fg = p.high4 })
  h('mkdCodeEnd', { fg = p.high1 })
  h('mkdCodeStart', { fg = p.high1 })
  h('mkdFootnotes', { fg = p.high1 })
  h('mkdID', { fg = p.high1, underline = true })
  h('mkdInlineURL', { fg = groups.link, underline = true })
  h('mkdLink', { link = 'mkdInlineURL' })
  h('mkdLinkDef', { link = 'mkdInlineURL' })
  h('mkdListItemLine', { fg = p.text })
  h('mkdRule', { fg = p.low1 })
  h('mkdURL', { link = 'mkdInlineURL' })

  h('DiagnosticError', { fg = groups.error })
  h('DiagnosticHint', { fg = groups.hint })
  h('DiagnosticInfo', { fg = groups.info })
  h('DiagnosticWarn', { fg = groups.warn })
  h('DiagnosticDefaultError', { fg = groups.error })
  h('DiagnosticDefaultHint', { fg = groups.hint })
  h('DiagnosticDefaultInfo', { fg = groups.info })
  h('DiagnosticDefaultWarn', { fg = groups.warn })
  h('DiagnosticFloatingError', { fg = groups.error })
  h('DiagnosticFloatingHint', { fg = groups.hint })
  h('DiagnosticFloatingInfo', { fg = groups.info })
  h('DiagnosticFloatingWarn', { fg = groups.warn })
  h('DiagnosticSignError', { fg = groups.error })
  h('DiagnosticSignHint', { fg = groups.hint })
  h('DiagnosticSignInfo', { fg = groups.info })
  h('DiagnosticSignWarn', { fg = groups.warn })
  h('DiagnosticStatusLineError', { fg = groups.error, bg = groups.panel })
  h('DiagnosticStatusLineHint', { fg = groups.hint, bg = groups.panel })
  h('DiagnosticStatusLineInfo', { fg = groups.info, bg = groups.panel })
  h('DiagnosticStatusLineWarn', { fg = groups.warn, bg = groups.panel })
  h('DiagnosticUnderlineError', { sp = groups.error, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('DiagnosticUnderlineHint', { sp = groups.hint, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('DiagnosticUnderlineInfo', { sp = groups.info, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('DiagnosticUnderlineWarn', { sp = groups.warn, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('DiagnosticUnnecessary', { fg = p.high3 })
  h('DiagnosticVirtualTextError', { fg = groups.error })
  h('DiagnosticVirtualTextHint', { fg = groups.hint })
  h('DiagnosticVirtualTextInfo', { fg = groups.info })
  h('DiagnosticVirtualTextWarn', { fg = groups.warn })

  -- healthcheck
  h('healthError', { fg = groups.error })
  h('healthSuccess', { fg = groups.info })
  h('healthWarning', { fg = groups.warn })

  -- Treesitter
  h('@boolean', { link = 'Boolean' })
  h('@character', { link = 'Character' })
  h('@character.special', { link = '@character' })
  h('@class', { fg = p.high1 })
  h('@comment', { link = 'Comment' })
  h('@conditional', { link = 'Conditional' })
  h('@constant', { link = 'Constant' })
  h('@constant.builtin', { fg = p.high3 })
  h('@constant.macro', { link = '@constant' })
  h('@constructor', { fg = p.high1 })
  h('@field', { fg = p.high1 })
  h('@function', { link = 'Function' })
  h('@function.builtin', { link = 'Function' })
  h('@function.macro', { link = '@function' })
  h('@include', { link = 'Include' })
  h('@interface', { fg = p.high1 })
  h('@keyword', { link = 'Keyword' })
  h('@keyword.operator', { fg = p.low1 })
  h('@label', { link = 'Label' })
  h('@macro', { link = 'Macro' })
  h('@method', { fg = p.high1 })
  h('@number', { link = 'Number' })
  h('@operator', { link = 'Operator' })
  h('@parameter', { fg = p.medium, italic = maybe.italic })
  h('@preproc', { link = 'PreProc' })
  h('@property', { fg = p.high1, italic = maybe.italic })
  h('@punctuation', { fg = groups.punctuation })
  h('@punctuation.bracket', { link = '@punctuation' })
  h('@punctuation.delimiter', { link = '@punctuation' })
  h('@punctuation.special', { link = '@punctuation' })
  h('@regexp', { link = 'String' })
  h('@repeat', { link = 'Repeat' })
  h('@storageclass', { link = 'StorageClass' })
  h('@string', { link = 'String' })
  h('@string.escape', { fg = p.high1 })
  h('@string.special', { link = '@string' })
  h('@symbol', { link = 'Identifier' })
  h('@tag', { link = 'Tag' })
  h('@tag.attribute', { fg = p.medium })
  h('@tag.delimiter', { fg = p.low1 })
  h('@text', { fg = p.text })
  h('@text.strong', { bold = true })
  h('@text.emphasis', { italic = true })
  h('@text.underline', { underline = true })
  h('@text.strike', { strikethrough = true })
  h('@text.math', { link = 'Special' })
  h('@text.environment', { link = 'Macro' })
  h('@text.environment.name', { link = 'Type' })
  h('@text.reference.vimdoc', { link = 'Special' })
  h('@text.title', { link = 'Title' })
  h('@text.uri', { fg = groups.link })
  h('@text.note', { link = 'SpecialComment' })
  h('@text.warning', { fg = groups.warn })
  h('@text.danger', { fg = groups.error })
  h('@todo', { link = 'Todo' })
  h('@type', { link = 'Type' })
  h('@variable', { fg = p.text, italic = maybe.italic })
  h('@variable.builtin', { link = '@variable' })
  h('@namespace', { link = '@include' })

  -- LSP Semantic Token Groups
  h('@lsp.type.comment', {})
  h('@lsp.type.enum', { link = '@type' })
  h('@lsp.type.keyword', { link = '@keyword' })
  h('@lsp.type.interface', { link = '@interface' })
  h('@lsp.type.namespace', { link = '@namespace' })
  h('@lsp.type.parameter', { link = '@parameter' })
  h('@lsp.type.property', { link = '@property' })
  h('@lsp.type.variable', {})       -- use treesitter styles for regular variables
  h('@lsp.typemod.function.defaultLibrary', { link = 'Function' })
  h('@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })

  -- LSP Injected Groups
  h('@lsp.typemod.operator.injected', { link = '@operator' })
  h('@lsp.typemod.string.injected', { link = '@string' })
  h('@lsp.typemod.variable.injected', { link = '@variable' })

  -- vim.lsp.buf.document_highlight()
  h('LspReferenceText', { bg = p.medium })
  h('LspReferenceRead', { bg = p.medium })
  h('LspReferenceWrite', { bg = p.medium })

  -- lsp-highlight-codelens
  h('LspCodeLens', { fg = p.low1 })                        -- virtual text of code len
  h('LspCodeLensSeparator', { fg = p.high4 })       -- separator between two or more code len

  -- romgrk/barbar.nvim
  h('BufferCurrent', { fg = p.text, bg = p.overlay })
  h('BufferCurrentIndex', { fg = p.text, bg = p.overlay })
  h('BufferCurrentMod', { fg = p.high1, bg = p.overlay })
  h('BufferCurrentSign', { fg = p.low1, bg = p.overlay })
  h('BufferCurrentTarget', { fg = p.high4, bg = p.overlay })
  h('BufferInactive', { fg = p.low1 })
  h('BufferInactiveIndex', { fg = p.low1 })
  h('BufferInactiveMod', { fg = p.high1 })
  h('BufferInactiveSign', { fg = p.low2 })
  h('BufferInactiveTarget', { fg = p.high4 })
  h('BufferTabpageFill', { fg = groups.background, bg = groups.background })
  h('BufferVisible', { fg = p.low1 })
  h('BufferVisibleIndex', { fg = p.low1 })
  h('BufferVisibleMod', { fg = p.high1 })
  h('BufferVisibleSign', { fg = p.low2 })
  h('BufferVisibleTarget', { fg = p.high4 })

  -- lewis6991/gitsigns.nvim
  h('GitSignsAdd', { fg = groups.git_add, bg = groups.background })
  h('GitSignsChange', { fg = groups.git_change, bg = groups.background })
  h('GitSignsDelete', { fg = groups.git_delete, bg = groups.background })
  h('SignAdd', { link = 'GitSignsAdd' })
  h('SignChange', { link = 'GitSignsChange' })
  h('SignDelete', { link = 'GitSignsDelete' })

  -- mvllow/modes.nvim
  h('ModesCopy', { bg = p.high4 })
  h('ModesDelete', { bg = p.red })
  h('ModesInsert', { bg = p.high1 })
  h('ModesVisual', { bg = p.medium })

  -- kyazdani42/nvim-tree.lua
  h('NvimTreeEmptyFolderName', { fg = p.low2 })
  h('NvimTreeFileDeleted', { fg = p.red })
  h('NvimTreeFileDirty', { fg = p.high4 })
  h('NvimTreeFileMerge', { fg = p.medium })
  h('NvimTreeFileNew', { fg = p.high1 })
  h('NvimTreeFileRenamed', { fg = p.high1 })
  h('NvimTreeFileStaged', { fg = p.medium })
  h('NvimTreeFolderIcon', { fg = p.low1 })
  h('NvimTreeFolderName', { fg = p.high1 })
  h('NvimTreeGitDeleted', { fg = groups.git_delete })
  h('NvimTreeGitDirty', { fg = groups.git_dirty })
  h('NvimTreeGitIgnored', { fg = groups.git_ignore })
  h('NvimTreeGitMerge', { fg = groups.git_merge })
  h('NvimTreeGitNew', { fg = groups.git_add })
  h('NvimTreeGitRenamed', { fg = groups.git_rename })
  h('NvimTreeGitStaged', { fg = groups.git_stage })
  h('NvimTreeImageFile', { fg = p.text })
  h('NvimTreeNormal', { fg = p.text })
  h('NvimTreeOpenedFile', { fg = p.text, bg = p.medium })
  h('NvimTreeOpenedFolderName', { link = 'NvimTreeFolderName' })
  h('NvimTreeRootFolder', { fg = p.medium })
  h('NvimTreeSpecialFile', { link = 'NvimTreeNormal' })
  h('NvimTreeWindowPicker', { fg = p.red, bg = p.red, blend = 10 })

  -- nvim-neo-tree/neo-tree.nvim
  h('NeoTreeTitleBar', { fg = p.surface, bg = p.high1 })

  -- folke/which-key.nvim
  h('WhichKey', { fg = p.medium })
  h('WhichKeyGroup', { fg = p.high1 })
  h('WhichKeySeparator', { fg = p.low1 })
  h('WhichKeyDesc', { fg = p.high4 })
  h('WhichKeyFloat', { bg = maybe.surface })
  h('WhichKeyValue', { fg = p.high4 })

  -- luka-reineke/indent-blankline.nvim
  h('IndentBlanklineChar', { fg = p.low2, nocombine = true })
  h('IndentBlanklineSpaceChar', { fg = p.low2, nocombine = true })
  h('IndentBlanklineSpaceCharBlankline', { fg = p.low2, nocombine = true })

  -- hrsh7th/nvim-cmp
  h('CmpItemAbbr', { fg = p.medium })
  h('CmpItemAbbrDeprecated', { fg = p.medium, strikethrough = true })
  h('CmpItemAbbrMatch', { fg = p.text, bold = true })
  h('CmpItemAbbrMatchFuzzy', { fg = p.text, bold = true })
  h('CmpItemKind', { fg = p.medium })
  h('CmpItemKindClass', { fg = p.high1 })
  h('CmpItemKindFunction', { fg = p.high4 })
  h('CmpItemKindInterface', { fg = p.high1 })
  h('CmpItemKindMethod', { fg = p.high1 })
  h('CmpItemKindSnippet', { fg = p.high4 })
  h('CmpItemKindVariable', { fg = p.text })

  -- TimUntersberger/neogit
  h('NeogitDiffAddHighlight', { fg = p.high1, bg = p.medium })
  h('NeogitDiffContextHighlight', { bg = p.low4 })
  h('NeogitDiffDeleteHighlight', { fg = p.red, bg = p.medium })
  h('NeogitHunkHeader', { bg = p.low4 })
  h('NeogitHunkHeaderHighlight', { bg = p.low4 })

  -- vimwiki/vimwiki
  h('VimwikiHR', { fg = p.low1 })
  h('VimwikiHeader1', { fg = groups.headings.h1, bold = true })
  h('VimwikiHeader2', { fg = groups.headings.h2, bold = true })
  h('VimwikiHeader3', { fg = groups.headings.h3, bold = true })
  h('VimwikiHeader4', { fg = groups.headings.h4, bold = true })
  h('VimwikiHeader5', { fg = groups.headings.h5, bold = true })
  h('VimwikiHeader6', { fg = groups.headings.h6, bold = true })
  h('VimwikiHeaderChar', { fg = p.high1 })
  h('VimwikiLink', { fg = groups.link, underline = true })
  h('VimwikiList', { fg = p.medium })
  h('VimwikiNoExistsLink', { fg = p.red })

  -- nvim-neorg/neorg
  h('NeorgHeading1Prefix', { fg = groups.headings.h1, bold = true })
  h('NeorgHeading1Title', { link = 'NeorgHeading1Prefix' })
  h('NeorgHeading2Prefix', { fg = groups.headings.h2, bold = true })
  h('NeorgHeading2Title', { link = 'NeorgHeading2Prefix' })
  h('NeorgHeading3Prefix', { fg = groups.headings.h3, bold = true })
  h('NeorgHeading3Title', { link = 'NeorgHeading3Prefix' })
  h('NeorgHeading4Prefix', { fg = groups.headings.h4, bold = true })
  h('NeorgHeading4Title', { link = 'NeorgHeading4Prefix' })
  h('NeorgHeading5Prefix', { fg = groups.headings.h5, bold = true })
  h('NeorgHeading5Title', { link = 'NeorgHeading5Prefix' })
  h('NeorgHeading6Prefix', { fg = groups.headings.h6, bold = true })
  h('NeorgHeading6Title', { link = 'NeorgHeading6Prefix' })
  h('NeorgMarkerTitle', { fg = p.text, bold = true })

  -- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
  h('DefinitionCount', { fg = p.high4 })
  h('DefinitionIcon', { fg = p.high4 })
  h('DefintionPreviewTitle', { fg = p.high4, bold = true })
  h('LspFloatWinBorder', { fg = groups.border })
  h('LspFloatWinNormal', { bg = maybe.surface })
  h('LspSagaAutoPreview', { fg = p.low1 })
  h('LspSagaCodeActionBorder', { fg = groups.border })
  h('LspSagaCodeActionContent', { fg = p.high1 })
  h('LspSagaCodeActionTitle', { fg = p.high4, bold = true })
  h('LspSagaCodeActionTruncateLine', { link = 'LspSagaCodeActionBorder' })
  h('LspSagaDefPreviewBorder', { fg = groups.border })
  h('LspSagaDiagnosticBorder', { fg = groups.border })
  h('LspSagaDiagnosticHeader', { fg = p.high4, bold = true })
  h('LspSagaDiagnosticTruncateLine', { link = 'LspSagaDiagnosticBorder' })
  h('LspSagaDocTruncateLine', { link = 'LspSagaHoverBorder' })
  h('LspSagaFinderSelection', { fg = p.high4 })
  h('LspSagaHoverBorder', { fg = groups.border })
  h('LspSagaLspFinderBorder', { fg = groups.border })
  h('LspSagaRenameBorder', { fg = p.high1 })
  h('LspSagaRenamePromptPrefix', { fg = p.red })
  h('LspSagaShTruncateLine', { link = 'LspSagaSignatureHelpBorder' })
  h('LspSagaSignatureHelpBorder', { fg = p.high1 })
  h('ReferencesCount', { fg = p.high4 })
  h('ReferencesIcon', { fg = p.high4 })
  h('SagaShadow', { bg = p.overlay })
  h('TargetWord', { fg = p.medium })

  -- ray-x/lsp_signature.nvim
  h('LspSignatureActiveParameter', { bg = p.overlay })

  -- rlane/pounce.nvim
  h('PounceAccept', { fg = p.red, bg = p.high4 })
  h('PounceAcceptBest', { fg = p.base, bg = p.high4 })
  h('PounceGap', { link = 'Search' })
  h('PounceMatch', { link = 'Search' })

  local float_background = options.dim_nc_background
      and (options.disable_float_background and groups.panel_nc or groups.panel)
      or maybe.surface

  -- ggandor/leap.nvim
  h('LeapMatch', { link = 'MatchParen' })
  h('LeapLabelPrimary', { link = 'Special' })
  h('LeapLabelSecondary', { link = 'IncSearch' })

  -- nvim-telescope/telescope.nvim
  h('TelescopeBorder', { fg = groups.border, bg = float_background })
  h('TelescopeMatching', { fg = p.high4 })
  h('TelescopeNormal', { fg = p.low1, bg = float_background })
  h('TelescopePromptNormal', { fg = p.text, bg = float_background })
  h('TelescopePromptPrefix', { fg = p.low1 })
  h('TelescopeSelection', { fg = p.text, bg = p.overlay })
  h('TelescopeSelectionCaret', { fg = p.high4, bg = p.overlay })
  h('TelescopeTitle', { fg = p.low1 })

  -- rcarriga/nvim-notify
  h('NotifyINFOBorder', { fg = p.green })
  h('NotifyINFOTitle', { link = 'NotifyINFOBorder' })
  h('NotifyINFOIcon', { link = 'NotifyINFOBorder' })
  h('NotifyWARNBorder', { fg = p.orange })
  h('NotifyWARNTitle', { link = 'NotifyWARNBorder' })
  h('NotifyWARNIcon', { link = 'NotifyWARNBorder' })
  h('NotifyDEBUGBorder', { fg = p.low2 })
  h('NotifyDEBUGTitle', { link = 'NotifyDEBUGBorder' })
  h('NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
  h('NotifyTRACEBorder', { fg = p.medium })
  h('NotifyTRACETitle', { link = 'NotifyTRACEBorder' })
  h('NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })
  h('NotifyERRORBorder', { fg = p.red })
  h('NotifyERRORTitle', { link = 'NotifyERRORBorder' })
  h('NotifyERRORIcon', { link = 'NotifyERRORBorder' })

  -- rcarriga/nvim-dap-ui
  h('DapUIVariable', { link = 'Normal' })
  h('DapUIValue', { link = 'Normal' })
  h('DapUIFrameName', { link = 'Normal' })
  h('DapUIThread', { fg = p.high4 })
  h('DapUIWatchesValue', { link = 'DapUIThread' })
  h('DapUIBreakpointsInfo', { link = 'DapUIThread' })
  h('DapUIBreakpointsCurrentLine', { fg = p.high4, bold = true })
  h('DapUIWatchesEmpty', { fg = p.red })
  h('DapUIWatchesError', { link = 'DapUIWatchesEmpty' })
  h('DapUIBreakpointsDisabledLine', { fg = p.low2 })
  h('DapUISource', { fg = p.medium })
  h('DapUIBreakpointsPath', { fg = p.high1 })
  h('DapUIScope', { link = 'DapUIBreakpointsPath' })
  h('DapUILineNumber', { link = 'DapUIBreakpointsPath' })
  h('DapUIBreakpointsLine', { link = 'DapUIBreakpointsPath' })
  h('DapUIFloatBorder', { link = 'DapUIBreakpointsPath' })
  h('DapUIStoppedThread', { link = 'DapUIBreakpointsPath' })
  h('DapUIDecoration', { link = 'DapUIBreakpointsPath' })
  h('DapUIModifiedValue', { fg = p.high1, bold = true })

  -- glepnir/dashboard-nvim
  h('DashboardShortcut', { fg = p.red })
  h('DashboardHeader', { fg = p.high1 })
  h('DashboardCenter', { fg = p.high4 })
  h('DashboardFooter', { fg = p.medium })

  -- SmiteshP/nvim-navic
  h('NavicIconsFile', { fg = p.base })
  h('NavicIconsModule', { fg = p.high4 })
  h('NavicIconsNamespace', { fg = p.base })
  h('NavicIconsPackage', { fg = p.base })
  h('NavicIconsClass', { fg = p.high1 })
  h('NavicIconsMethod', { fg = p.high1 })
  h('NavicIconsProperty', { fg = p.high1 })
  h('NavicIconsField', { fg = p.high1 })
  h('NavicIconsConstructor', { fg = p.high4 })
  h('NavicIconsEnum', { fg = p.high4 })
  h('NavicIconsInterface', { fg = p.high1 })
  h('NavicIconsFunction', { fg = p.high1 })
  h('NavicIconsVariable', { fg = p.text })
  h('NavicIconsConstant', { fg = p.high4 })
  h('NavicIconsString', { fg = p.high4 })
  h('NavicIconsNumber', { fg = p.high4 })
  h('NavicIconsBoolean', { fg = p.high4 })
  h('NavicIconsArray', { fg = p.high4 })
  h('NavicIconsObject', { fg = p.high4 })
  h('NavicIconsKey', { fg = p.medium })
  h('NavicIconsKeyword', { fg = p.high1 })
  h('NavicIconsNull', { fg = p.red })
  h('NavicIconsEnumMember', { fg = p.high1 })
  h('NavicIconsStruct', { fg = p.high1 })
  h('NavicIconsEvent', { fg = p.high4 })
  h('NavicIconsOperator', { fg = p.low1 })
  h('NavicIconsTypeParameter', { fg = p.high1 })
  h('NavicText', { fg = p.low1 })
  h('NavicSeparator', { fg = p.low1 })

  -- folke/noice.nvim
  h('NoiceCursor', { fg = p.high4, bg = p.text })

  -- echasnovski/mini.indentscope
  h('MiniIndentscopeSymbol', { fg = p.medium })
  h('MiniIndentscopeSymbolOff', { fg = p.medium })

  -- goolord/alpha-nvim
  h('AlphaHeader', { fg = p.high1 })
  h('AlphaButtons', { fg = p.high1 })
  h('AlphaShortcut', { fg = p.high4 })
  h('AlphaFooter', { fg = p.high4 })

  vim.g.terminal_color_0 = p.overlay       -- black
  vim.g.terminal_color_8 = p.low1        -- bright black
  vim.g.terminal_color_1 = p.red          -- red
  vim.g.terminal_color_9 = p.red          -- bright red
  vim.g.terminal_color_2 = p.green          -- green
  vim.g.terminal_color_10 = p.green         -- bright green
  vim.g.terminal_color_3 = p.orange          -- yellow
  vim.g.terminal_color_11 = p.orange         -- bright yellow
  vim.g.terminal_color_4 = p.high1          -- blue
  vim.g.terminal_color_12 = p.high1         -- bright blue
  vim.g.terminal_color_5 = p.medium          -- magenta
  vim.g.terminal_color_13 = p.medium         -- bright magenta
  vim.g.terminal_color_6 = p.high3          -- cyan
  vim.g.terminal_color_14 = p.high3         -- bright cyan
  vim.g.terminal_color_7 = p.text          -- white
  vim.g.terminal_color_15 = p.text         -- bright white

  -- Set user highlights
  for group, color in pairs(options.highlight_groups) do
    h(group, color)
  end
end

return M
