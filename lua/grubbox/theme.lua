---@alias styleField 'search'
---@alias styleValue { reverse: boolean }

---@class GrubboxTheme
---@field none Color
---@field colors GrubboxColors
---@field bg Color
---@field fg Color
---@field bg0 Color
---@field bg1 Color
---@field bg2 Color
---@field bg3 Color
---@field bg4 Color
---@field fg0 Color
---@field fg1 Color
---@field fg2 Color
---@field fg3 Color
---@field fg4 Color
---@field red Color
---@field green Color
---@field yellow Color
---@field blue Color
---@field purple Color
---@field aqua Color
---@field syntax { keyword: Color, object: Color, type: Color, context: Color, constant: Color, call: Color }
---@field style { [styleField]: styleValue }
---@field comment Color

local M = {}

---@param colors GrubboxColors
---@param config GrubboxConfig
---@return GrubboxTheme
function M.setup(colors, config)
  local theme   = {}

  theme.none    = { 'NONE', 0 }
  theme.colors  = colors

  theme.bg      = config.transparent_background and theme.none or colors.bg['0']
  theme.fg      = colors.fg['0']

  theme.bg0     = colors.bg['0']
  theme.bg1     = colors.bg['1']
  theme.bg2     = colors.bg['2']
  theme.bg3     = colors.bg['3']
  theme.bg4     = colors.bg['4']

  theme.fg0     = colors.fg['0']
  theme.fg1     = colors.fg['1']
  theme.fg2     = colors.fg['2']
  theme.fg3     = colors.fg['3']
  theme.fg4     = colors.fg['4']

  theme.comment = theme.bg3

  local _colors = colors.bright
  theme.red     = _colors.red
  theme.green   = _colors.green
  theme.yellow  = _colors.yellow
  theme.blue    = _colors.blue
  theme.purple  = _colors.purple
  theme.aqua    = _colors.aqua

  theme.syntax  = {
    keyword = theme.purple,
    object = theme.fg1,
    type = theme.aqua,
    context = theme.bg3,
    constant = theme.purple,
    call = theme.aqua,
  }

  theme.style   = {
    search = { reverse = true }
  }
  theme.style   = vim.tbl_deep_extend('force', theme.style, config.style)

  return theme
end

return M
