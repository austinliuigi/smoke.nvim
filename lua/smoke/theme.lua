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
  h('Cursor', { fg = p.text, bg = p.higher })
  h('CursorColumn', { bg = p.lowest })
  -- CursorIM = {},
  h('CursorLine', { bg = p.lowest })
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
  h('Directory', { fg = p.high, bg = p.none })
  -- EndOfBuffer = {},
  h('ErrorMsg', { fg = p.red, bold = true })
  h('FloatBorder', { fg = groups.border, bg = maybe.surface })
  h('FloatTitle', { fg = p.lower })
  h('FoldColumn', { fg = p.lower })
  h('Folded', { fg = p.text, bg = maybe.surface })
  h('IncSearch', { fg = groups.background, bg = p.highest })
  h('LineNr', { fg = p.lower })
  h('MatchParen', { fg = p.text, bg = p.low })
  h('ModeMsg', { fg = p.low })
  h('MoreMsg', { fg = p.gray })
  h('NonText', { fg = p.lower })
  h('Normal', { fg = p.text, bg = maybe.base })
  h('NormalFloat', { fg = p.text, bg = maybe.surface })
  h('NormalNC', { fg = p.text, bg = maybe.dim_nc_background })
  h('NvimInternalError', { fg = '#ffffff', bg = p.red })
  h('Pmenu', { fg = p.low, bg = maybe.surface })
  h('PmenuSbar', { bg = p.lowest })
  h('PmenuSel', { fg = p.text, bg = p.overlay })
  h('PmenuThumb', { bg = p.gray })
  h('Question', { fg = p.highest })
  -- QuickFixLine = {},
  -- RedrawDebugNormal = {}
  h('RedrawDebugClear', { fg = '#ffffff', bg = p.highest })
  h('RedrawDebugComposed', { fg = '#ffffff', bg = p.high })
  h('RedrawDebugRecompose', { fg = '#ffffff', bg = p.red })
  h('Search', { bg = p.gray })
  h('SpecialKey', { fg = p.high })
  h('SpellBad', { sp = p.low, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('SpellCap', { sp = p.low, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('SpellLocal', { sp = p.low, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('SpellRare', { sp = p.low, undercurl = maybe.undercurl, underline = not maybe.undercurl })
  h('SignColumn', {
    fg = p.text,
    bg = (options.dim_nc_background and p.none) or maybe.base,
  })
  h('StatusLine', { fg = p.low, bg = groups.panel })
  h('StatusLineNC', { fg = p.lower, bg = groups.panel_nc })
  h('StatusLineTerm', { link = 'StatusLine' })
  h('StatusLineTermNC', { link = 'StatusLineNC' })
  h('TabLine', { fg = p.low, bg = groups.panel })
  h('TabLineFill', { bg = groups.panel })
  h('TabLineSel', { fg = p.text, bg = p.overlay })
  h('Title', { fg = p.text })
  h('VertSplit', { fg = groups.border, bg = maybe.bold_vert_split })
  h('Visual', { bg = p.lower })
  -- VisualNOS = {},
  h('WarningMsg', { fg = p.orange })
  -- Whitespace = {},
  h('WildMenu', { link = 'IncSearch' })

  h('Boolean', { fg = p.higher })
  h('Character', { fg = p.higher })
  h('Comment', { fg = groups.comment, italic = maybe.italic })
  h('Conditional', { fg = p.high })
  h('Constant', { fg = p.higher })
  h('Debug', { fg = p.higher })
  h('Define', { fg = p.gray })
  h('Delimiter', { fg = p.low })
  h('Error', { fg = p.red })
  h('Exception', { fg = p.high })
  h('Float', { fg = p.higher })
  h('Function', { fg = p.high })
  h('Identifier', { fg = p.higher })
  -- Ignore = {},
  h('Include', { fg = p.gray })
  h('Keyword', { fg = p.gray })
  h('Label', { fg = p.high })
  h('Macro', { fg = p.gray })
  h('Number', { fg = p.higher })
  h('Operator', { fg = p.low })
  h('PreCondit', { fg = p.gray })
  h('PreProc', { fg = p.gray })
  h('Repeat', { fg = p.high })
  h('Special', { fg = p.higher })
  h('SpecialChar', { fg = p.higher })
  h('SpecialComment', { fg = p.gray })
  h('Statement', { fg = p.high })
  h('StorageClass', { fg = p.high })
  h('String', { fg = p.high })
  h('Structure', { fg = p.high })
  h('Tag', { fg = p.higher })
  h('Todo', { fg = p.gray })
  h('Type', { fg = p.high })
  h('Typedef', { link = 'Type' })
  h('Underlined', { underline = true })

  h('htmlArg', { fg = p.gray })
  h('htmlBold', { bold = true })
  h('htmlEndTag', { fg = p.low })
  h('htmlH1', { fg = groups.headings.h1, bold = true })
  h('htmlH2', { fg = groups.headings.h2, bold = true })
  h('htmlH3', { fg = groups.headings.h3, bold = true })
  h('htmlH4', { fg = groups.headings.h4, bold = true })
  h('htmlH5', { fg = groups.headings.h5, bold = true })
  h('htmlItalic', { italic = maybe.italic })
  h('htmlLink', { fg = groups.link })
  h('htmlTag', { fg = p.low })
  h('htmlTagN', { fg = p.text })
  h('htmlTagName', { fg = p.high })

  h('markdownDelimiter', { fg = p.low })
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

  h('mkdCode', { fg = p.high, italic = maybe.italic })
  h('mkdCodeDelimiter', { fg = p.highest })
  h('mkdCodeEnd', { fg = p.high })
  h('mkdCodeStart', { fg = p.high })
  h('mkdFootnotes', { fg = p.high })
  h('mkdID', { fg = p.high, underline = true })
  h('mkdInlineURL', { fg = groups.link, underline = true })
  h('mkdLink', { link = 'mkdInlineURL' })
  h('mkdLinkDef', { link = 'mkdInlineURL' })
  h('mkdListItemLine', { fg = p.text })
  h('mkdRule', { fg = p.low })
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
  h('DiagnosticUnnecessary', { fg = p.higher })
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
  h('@class', { fg = p.high })
  h('@comment', { link = 'Comment' })
  h('@conditional', { link = 'Conditional' })
  h('@constant', { link = 'Constant' })
  h('@constant.builtin', { fg = p.higher })
  h('@constant.macro', { link = '@constant' })
  h('@constructor', { fg = p.gray })
  h('@field', { fg = p.high })
  h('@function', { link = 'Function' })
  h('@function.builtin', { link = 'Function' })
  h('@function.macro', { link = '@function' })
  h('@include', { link = 'Include' })
  h('@interface', { fg = p.high })
  h('@keyword', { link = 'Keyword' })
  h('@keyword.operator', { fg = p.low })
  h('@label', { link = 'Label' })
  h('@macro', { link = 'Macro' })
  h('@method', { fg = p.gray })
  h('@number', { link = 'Number' })
  h('@operator', { link = 'Operator' })
  h('@parameter', { fg = p.gray, italic = maybe.italic })
  h('@preproc', { link = 'PreProc' })
  h('@property', { fg = p.high, italic = maybe.italic })
  h('@punctuation', { fg = groups.punctuation })
  h('@punctuation.bracket', { link = '@punctuation' })
  h('@punctuation.delimiter', { link = '@punctuation' })
  h('@punctuation.special', { link = '@punctuation' })
  h('@regexp', { link = 'String' })
  h('@repeat', { link = 'Repeat' })
  h('@storageclass', { link = 'StorageClass' })
  h('@string', { link = 'String' })
  h('@string.escape', { fg = p.high })
  h('@string.special', { link = '@string' })
  h('@symbol', { link = 'Identifier' })
  h('@tag', { link = 'Tag' })
  h('@tag.attribute', { fg = p.gray })
  h('@tag.delimiter', { fg = p.low })
  h('@text', { fg = p.text })
  h('@text.strong', { bold = true })
  h('@text.emphasis', { italic = true })
  h('@text.underline', { underline = true })
  h('@text.strike', { strikethrough = true })
  h('@text.math', { link = 'Special' })
  h('@text.environment', { link = 'Macro' })
  h('@text.environment.name', { link = 'Type' })
  h('@text.title', { link = 'Title' })
  h('@text.uri', { fg = groups.link })
  h('@text.note', { link = 'SpecialComment' })
  h('@text.warning', { fg = groups.warn })
  h('@text.danger', { fg = groups.error })
  h('@todo', { link = 'Todo' })
  h('@type', { link = 'Type' })
  h('@variable', { fg = p.text, italic = maybe.italic })
  h('@variable.builtin', { fg = p.red })
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
  h('@lsp.typemod.function.defaultLibrary', { link = 'Special' })
  h('@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })

  -- LSP Injected Groups
  h('@lsp.typemod.operator.injected', { link = '@operator' })
  h('@lsp.typemod.string.injected', { link = '@string' })
  h('@lsp.typemod.variable.injected', { link = '@variable' })

  -- vim.lsp.buf.document_highlight()
  h('LspReferenceText', { bg = p.gray })
  h('LspReferenceRead', { bg = p.gray })
  h('LspReferenceWrite', { bg = p.gray })

  -- lsp-highlight-codelens
  h('LspCodeLens', { fg = p.low })                        -- virtual text of code len
  h('LspCodeLensSeparator', { fg = p.highest })       -- separator between two or more code len

  -- romgrk/barbar.nvim
  h('BufferCurrent', { fg = p.text, bg = p.overlay })
  h('BufferCurrentIndex', { fg = p.text, bg = p.overlay })
  h('BufferCurrentMod', { fg = p.high, bg = p.overlay })
  h('BufferCurrentSign', { fg = p.low, bg = p.overlay })
  h('BufferCurrentTarget', { fg = p.highest, bg = p.overlay })
  h('BufferInactive', { fg = p.low })
  h('BufferInactiveIndex', { fg = p.low })
  h('BufferInactiveMod', { fg = p.high })
  h('BufferInactiveSign', { fg = p.lower })
  h('BufferInactiveTarget', { fg = p.highest })
  h('BufferTabpageFill', { fg = groups.background, bg = groups.background })
  h('BufferVisible', { fg = p.low })
  h('BufferVisibleIndex', { fg = p.low })
  h('BufferVisibleMod', { fg = p.high })
  h('BufferVisibleSign', { fg = p.lower })
  h('BufferVisibleTarget', { fg = p.highest })

  -- lewis6991/gitsigns.nvim
  h('GitSignsAdd', { fg = groups.git_add, bg = groups.background })
  h('GitSignsChange', { fg = groups.git_change, bg = groups.background })
  h('GitSignsDelete', { fg = groups.git_delete, bg = groups.background })
  h('SignAdd', { link = 'GitSignsAdd' })
  h('SignChange', { link = 'GitSignsChange' })
  h('SignDelete', { link = 'GitSignsDelete' })

  -- mvllow/modes.nvim
  h('ModesCopy', { bg = p.highest })
  h('ModesDelete', { bg = p.red })
  h('ModesInsert', { bg = p.high })
  h('ModesVisual', { bg = p.gray })

  -- kyazdani42/nvim-tree.lua
  h('NvimTreeEmptyFolderName', { fg = p.lower })
  h('NvimTreeFileDeleted', { fg = p.red })
  h('NvimTreeFileDirty', { fg = p.highest })
  h('NvimTreeFileMerge', { fg = p.gray })
  h('NvimTreeFileNew', { fg = p.high })
  h('NvimTreeFileRenamed', { fg = p.high })
  h('NvimTreeFileStaged', { fg = p.gray })
  h('NvimTreeFolderIcon', { fg = p.low })
  h('NvimTreeFolderName', { fg = p.high })
  h('NvimTreeGitDeleted', { fg = groups.git_delete })
  h('NvimTreeGitDirty', { fg = groups.git_dirty })
  h('NvimTreeGitIgnored', { fg = groups.git_ignore })
  h('NvimTreeGitMerge', { fg = groups.git_merge })
  h('NvimTreeGitNew', { fg = groups.git_add })
  h('NvimTreeGitRenamed', { fg = groups.git_rename })
  h('NvimTreeGitStaged', { fg = groups.git_stage })
  h('NvimTreeImageFile', { fg = p.text })
  h('NvimTreeNormal', { fg = p.text })
  h('NvimTreeOpenedFile', { fg = p.text, bg = p.gray })
  h('NvimTreeOpenedFolderName', { link = 'NvimTreeFolderName' })
  h('NvimTreeRootFolder', { fg = p.gray })
  h('NvimTreeSpecialFile', { link = 'NvimTreeNormal' })
  h('NvimTreeWindowPicker', { fg = p.red, bg = p.red, blend = 10 })

  -- nvim-neo-tree/neo-tree.nvim
  h('NeoTreeTitleBar', { fg = p.surface, bg = p.high })

  -- folke/which-key.nvim
  h('WhichKey', { fg = p.gray })
  h('WhichKeyGroup', { fg = p.high })
  h('WhichKeySeparator', { fg = p.low })
  h('WhichKeyDesc', { fg = p.highest })
  h('WhichKeyFloat', { bg = maybe.surface })
  h('WhichKeyValue', { fg = p.highest })

  -- luka-reineke/indent-blankline.nvim
  h('IndentBlanklineChar', { fg = p.lower, nocombine = true })
  h('IndentBlanklineSpaceChar', { fg = p.lower, nocombine = true })
  h('IndentBlanklineSpaceCharBlankline', { fg = p.lower, nocombine = true })

  -- hrsh7th/nvim-cmp
  h('CmpItemAbbr', { fg = p.low })
  h('CmpItemAbbrDeprecated', { fg = p.low, strikethrough = true })
  h('CmpItemAbbrMatch', { fg = p.text, bold = true })
  h('CmpItemAbbrMatchFuzzy', { fg = p.text, bold = true })
  h('CmpItemKind', { fg = p.low })
  h('CmpItemKindClass', { fg = p.high })
  h('CmpItemKindFunction', { fg = p.highest })
  h('CmpItemKindInterface', { fg = p.high })
  h('CmpItemKindMethod', { fg = p.gray })
  h('CmpItemKindSnippet', { fg = p.highest })
  h('CmpItemKindVariable', { fg = p.text })

  -- TimUntersberger/neogit
  h('NeogitDiffAddHighlight', { fg = p.high, bg = p.gray })
  h('NeogitDiffContextHighlight', { bg = p.lowest })
  h('NeogitDiffDeleteHighlight', { fg = p.red, bg = p.gray })
  h('NeogitHunkHeader', { bg = p.lowest })
  h('NeogitHunkHeaderHighlight', { bg = p.lowest })

  -- vimwiki/vimwiki
  h('VimwikiHR', { fg = p.low })
  h('VimwikiHeader1', { fg = groups.headings.h1, bold = true })
  h('VimwikiHeader2', { fg = groups.headings.h2, bold = true })
  h('VimwikiHeader3', { fg = groups.headings.h3, bold = true })
  h('VimwikiHeader4', { fg = groups.headings.h4, bold = true })
  h('VimwikiHeader5', { fg = groups.headings.h5, bold = true })
  h('VimwikiHeader6', { fg = groups.headings.h6, bold = true })
  h('VimwikiHeaderChar', { fg = p.high })
  h('VimwikiLink', { fg = groups.link, underline = true })
  h('VimwikiList', { fg = p.gray })
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
  h('DefinitionCount', { fg = p.highest })
  h('DefinitionIcon', { fg = p.highest })
  h('DefintionPreviewTitle', { fg = p.highest, bold = true })
  h('LspFloatWinBorder', { fg = groups.border })
  h('LspFloatWinNormal', { bg = maybe.surface })
  h('LspSagaAutoPreview', { fg = p.low })
  h('LspSagaCodeActionBorder', { fg = groups.border })
  h('LspSagaCodeActionContent', { fg = p.high })
  h('LspSagaCodeActionTitle', { fg = p.highest, bold = true })
  h('LspSagaCodeActionTruncateLine', { link = 'LspSagaCodeActionBorder' })
  h('LspSagaDefPreviewBorder', { fg = groups.border })
  h('LspSagaDiagnosticBorder', { fg = groups.border })
  h('LspSagaDiagnosticHeader', { fg = p.highest, bold = true })
  h('LspSagaDiagnosticTruncateLine', { link = 'LspSagaDiagnosticBorder' })
  h('LspSagaDocTruncateLine', { link = 'LspSagaHoverBorder' })
  h('LspSagaFinderSelection', { fg = p.highest })
  h('LspSagaHoverBorder', { fg = groups.border })
  h('LspSagaLspFinderBorder', { fg = groups.border })
  h('LspSagaRenameBorder', { fg = p.high })
  h('LspSagaRenamePromptPrefix', { fg = p.red })
  h('LspSagaShTruncateLine', { link = 'LspSagaSignatureHelpBorder' })
  h('LspSagaSignatureHelpBorder', { fg = p.high })
  h('ReferencesCount', { fg = p.highest })
  h('ReferencesIcon', { fg = p.highest })
  h('SagaShadow', { bg = p.overlay })
  h('TargetWord', { fg = p.gray })

  -- ray-x/lsp_signature.nvim
  h('LspSignatureActiveParameter', { bg = p.overlay })

  -- rlane/pounce.nvim
  h('PounceAccept', { fg = p.red, bg = p.highest })
  h('PounceAcceptBest', { fg = p.base, bg = p.highest })
  h('PounceGap', { link = 'Search' })
  h('PounceMatch', { link = 'Search' })

  local float_background = options.dim_nc_background
      and (options.disable_float_background and groups.panel_nc or groups.panel)
      or maybe.surface

  -- ggandor/leap.nvim
  h('LeapMatch', { link = 'MatchParen' })
  h('LeapLabelPrimary', { link = 'IncSearch' })
  h('LeapLabelSecondary', { fg = p.base, bg = p.high })

  -- nvim-telescope/telescope.nvim
  h('TelescopeBorder', { fg = groups.border, bg = float_background })
  h('TelescopeMatching', { fg = p.highest })
  h('TelescopeNormal', { fg = p.low, bg = float_background })
  h('TelescopePromptNormal', { fg = p.text, bg = float_background })
  h('TelescopePromptPrefix', { fg = p.low })
  h('TelescopeSelection', { fg = p.text, bg = p.overlay })
  h('TelescopeSelectionCaret', { fg = p.highest, bg = p.overlay })
  h('TelescopeTitle', { fg = p.low })

  -- rcarriga/nvim-notify
  h('NotifyINFOBorder', { fg = p.high })
  h('NotifyINFOTitle', { link = 'NotifyINFOBorder' })
  h('NotifyINFOIcon', { link = 'NotifyINFOBorder' })
  h('NotifyWARNBorder', { fg = p.orange })
  h('NotifyWARNTitle', { link = 'NotifyWARNBorder' })
  h('NotifyWARNIcon', { link = 'NotifyWARNBorder' })
  h('NotifyDEBUGBorder', { fg = p.lower })
  h('NotifyDEBUGTitle', { link = 'NotifyDEBUGBorder' })
  h('NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
  h('NotifyTRACEBorder', { fg = p.gray })
  h('NotifyTRACETitle', { link = 'NotifyTRACEBorder' })
  h('NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })
  h('NotifyERRORBorder', { fg = p.red })
  h('NotifyERRORTitle', { link = 'NotifyERRORBorder' })
  h('NotifyERRORIcon', { link = 'NotifyERRORBorder' })

  -- rcarriga/nvim-dap-ui
  h('DapUIVariable', { link = 'Normal' })
  h('DapUIValue', { link = 'Normal' })
  h('DapUIFrameName', { link = 'Normal' })
  h('DapUIThread', { fg = p.highest })
  h('DapUIWatchesValue', { link = 'DapUIThread' })
  h('DapUIBreakpointsInfo', { link = 'DapUIThread' })
  h('DapUIBreakpointsCurrentLine', { fg = p.highest, bold = true })
  h('DapUIWatchesEmpty', { fg = p.red })
  h('DapUIWatchesError', { link = 'DapUIWatchesEmpty' })
  h('DapUIBreakpointsDisabledLine', { fg = p.lower })
  h('DapUISource', { fg = p.gray })
  h('DapUIBreakpointsPath', { fg = p.high })
  h('DapUIScope', { link = 'DapUIBreakpointsPath' })
  h('DapUILineNumber', { link = 'DapUIBreakpointsPath' })
  h('DapUIBreakpointsLine', { link = 'DapUIBreakpointsPath' })
  h('DapUIFloatBorder', { link = 'DapUIBreakpointsPath' })
  h('DapUIStoppedThread', { link = 'DapUIBreakpointsPath' })
  h('DapUIDecoration', { link = 'DapUIBreakpointsPath' })
  h('DapUIModifiedValue', { fg = p.high, bold = true })

  -- glepnir/dashboard-nvim
  h('DashboardShortcut', { fg = p.red })
  h('DashboardHeader', { fg = p.high })
  h('DashboardCenter', { fg = p.highest })
  h('DashboardFooter', { fg = p.gray })

  -- SmiteshP/nvim-navic
  h('NavicIconsFile', { fg = p.base })
  h('NavicIconsModule', { fg = p.highest })
  h('NavicIconsNamespace', { fg = p.base })
  h('NavicIconsPackage', { fg = p.base })
  h('NavicIconsClass', { fg = p.high })
  h('NavicIconsMethod', { fg = p.gray })
  h('NavicIconsProperty', { fg = p.high })
  h('NavicIconsField', { fg = p.high })
  h('NavicIconsConstructor', { fg = p.highest })
  h('NavicIconsEnum', { fg = p.highest })
  h('NavicIconsInterface', { fg = p.high })
  h('NavicIconsFunction', { fg = p.high })
  h('NavicIconsVariable', { fg = p.text })
  h('NavicIconsConstant', { fg = p.highest })
  h('NavicIconsString', { fg = p.highest })
  h('NavicIconsNumber', { fg = p.highest })
  h('NavicIconsBoolean', { fg = p.highest })
  h('NavicIconsArray', { fg = p.highest })
  h('NavicIconsObject', { fg = p.highest })
  h('NavicIconsKey', { fg = p.gray })
  h('NavicIconsKeyword', { fg = p.high })
  h('NavicIconsNull', { fg = p.red })
  h('NavicIconsEnumMember', { fg = p.high })
  h('NavicIconsStruct', { fg = p.high })
  h('NavicIconsEvent', { fg = p.highest })
  h('NavicIconsOperator', { fg = p.low })
  h('NavicIconsTypeParameter', { fg = p.high })
  h('NavicText', { fg = p.low })
  h('NavicSeparator', { fg = p.low })

  -- folke/noice.nvim
  h('NoiceCursor', { fg = p.highest, bg = p.text })

  -- echasnovski/mini.indentscope
  h('MiniIndentscopeSymbol', { fg = p.gray })
  h('MiniIndentscopeSymbolOff', { fg = p.gray })

  -- goolord/alpha-nvim
  h('AlphaHeader', { fg = p.high })
  h('AlphaButtons', { fg = p.high })
  h('AlphaShortcut', { fg = p.highest })
  h('AlphaFooter', { fg = p.highest })

  vim.g.terminal_color_0 = p.overlay       -- black
  vim.g.terminal_color_8 = p.low        -- bright black
  vim.g.terminal_color_1 = p.red          -- red
  vim.g.terminal_color_9 = p.red          -- bright red
  vim.g.terminal_color_2 = p.green          -- green
  vim.g.terminal_color_10 = p.green         -- bright green
  vim.g.terminal_color_3 = p.highest          -- yellow
  vim.g.terminal_color_11 = p.highest         -- bright yellow
  vim.g.terminal_color_4 = p.high          -- blue
  vim.g.terminal_color_12 = p.high         -- bright blue
  vim.g.terminal_color_5 = p.gray          -- magenta
  vim.g.terminal_color_13 = p.gray         -- bright magenta
  vim.g.terminal_color_6 = p.higher          -- cyan
  vim.g.terminal_color_14 = p.higher         -- bright cyan
  vim.g.terminal_color_7 = p.text          -- white
  vim.g.terminal_color_15 = p.text         -- bright white

  -- Set user highlights
  for group, color in pairs(options.highlight_groups) do
    h(group, color)
  end
end

return M
