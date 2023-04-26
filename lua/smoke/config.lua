local M = {}

---@class Highlight
---@field fg string
---@field bg string
---@field sp string
---@field bold boolean
---@field italic boolean
---@field undercurl boolean
---@field underline boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean

---@class Config
local defaults = {
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,
  disable_undercurl = true,
  groups = {
    background = 'base',
    background_nc = 'nc',
    panel = 'surface',
    panel_nc = 'base',
    border = 'gray',
    comment = 'low',
    link = 'gray',
    punctuation = 'low',
    error = 'red',
    hint = 'gray',
    info = 'high',
    warn = 'orange',
    git_add = 'green',
    git_change = 'orange',
    git_delete = 'red',
    git_dirty = 'highest',
    git_ignore = 'muted',
    git_merge = 'gray',
    git_rename = 'high',
    git_stage = 'gray',
    git_text = 'highest',
    headings = {
      h1 = 'highest',
      h2 = 'higher',
      h3 = 'high',
      h4 = 'high',
      h5 = 'high',
      h6 = 'high',
    },
  },
  ---@type table<string, Highlight>
  highlight_groups = {},
}

---@type Config
M.options = {}

---@param options Config|nil
function M.setup(options)
  M.options = vim.tbl_deep_extend('force', {}, defaults, options or {})
end

---@param options Config|nil
function M.extend(options)
  M.options =
      vim.tbl_deep_extend('force', {}, M.options or defaults, options or {})
end

M.setup()

return M
