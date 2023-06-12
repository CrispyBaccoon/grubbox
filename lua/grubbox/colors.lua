---@class Color { [1]: string, [2]: number }

---@alias NeutralColor '0_hard' | '0' | '0_soft' | '1' | '2' | '3' | '4'
---@alias NeutralColors { [NeutralColor]: Color }

---@alias MapColor 'red' | 'green' | 'yellow' | 'purple' | 'orange' | 'blue' | 'aqua'
---@alias MapColors { [MapColor]: Color }

---@class GrubboxColors
---@field bg NeutralColors
---@field fg NeutralColors
---@field neutral MapColors
---@field bright MapColors
---@field dark MapColors

---@type GrubboxColors
_G.grubbox_colors = {
  bg = {
    ['0_hard'] = { '#1d2021', 234 },
    ['0']      = { '#282828', 235 },
    ['0_soft'] = { '#32302f', 236 },
    ['1']      = { '#2a2a2a', 237 },
    ['2']      = { '#3c3836', 239 },
    ['3']      = { '#504945', 241 },
    ['4']      = { '#665c54', 243 },
    ['5']      = { '#928374', 245 },
  },
  fg = {
    ['0_hard'] = { '#f9f5d7', 230 },
    ['0']      = { '#ffdbb3', 229 },
    ['0_soft'] = { '#f2e5bc', 228 },
    ['1']      = { '#f7cb9c', 223 },
    ['2']      = { '#f7e2c1', 250 },
    ['3']      = { '#f5cb9e', 248 },
    ['4']      = { '#f0d3a8', 246 },
  },
  neutral = {
    ['red']    = { '#ea6962', 124 },
    ['green']  = { '#a9b665', 106 },
    ['yellow'] = { '#d8a657', 172 },
    ['blue']   = { '#7daea3', 66 },
    ['purple'] = { '#D6949E', 132 },
    ['aqua']   = { '#89b482', 72 },
  },
  bright = {
    ['red']    = { '#f2594b', 167 },
    ['green']  = { '#b0b846', 142 },
    ['yellow'] = { '#fabd2f', 214 },
    ['blue']   = { '#80aa9e', 109 },
    ['purple'] = { '#d3869b', 175 },
    ['aqua']   = { '#8bba7f', 108 },
  },
  dark = {
    ['red']    = { '#462726', 167 },
    ['green']  = { '#363a25', 142 },
    ['yellow'] = { '#483b22', 214 },
    ['blue']   = { '#2c3735', 109 },
    ['purple'] = { '#3e2f34', 175 },
    ['aqua']   = { '#2e3a2e', 108 },
  },
}

local M = {}

function M.colors()
  return _G.grubbox_colors
end

---@param config GrubboxConfig?
---@return GrubboxTheme
function M.setup(config)
  ---@type GrubboxConfig
  config = vim.tbl_extend("force", _G.grubbox_config, config or {})
  return require 'grubbox.theme'.setup(M.colors(), config)
end

return M
