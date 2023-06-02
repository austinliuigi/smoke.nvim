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
    border = 'medium',
    comment = 'low1',
    link = 'medium',
    punctuation = 'medium',
    error = 'red',
    hint = 'medium',
    info = 'high1',
    warn = 'orange',
    git_add = 'green',
    git_change = 'orange',
    git_delete = 'red',
    git_dirty = 'high4',
    git_ignore = 'low1',
    git_merge = 'medium',
    git_rename = 'high1',
    git_stage = 'medium',
    git_text = 'high4',
    headings = {
      h1 = 'high4',
      h2 = 'high3',
      h3 = 'high1',
      h4 = 'high1',
      h5 = 'high1',
      h6 = 'high1',
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
