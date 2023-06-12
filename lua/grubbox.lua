local grubbox = {}

---@class GrubboxConfig
---@field transparent_background boolean
---@field override_terminal boolean
---@field style { [styleField]: styleValue }
---@field overrides HLGroups

---@type GrubboxConfig
grubbox.default_config = {
    transparent_background = false,
    override_terminal = true,
    style = {
        search = { reverse = true },
    },
    overrides = {},
}

_G.grubbox_config = _G.grubbox_config or grubbox.default_config

function grubbox.setup(config)
    _G.grubbox_config = vim.tbl_deep_extend("force", _G.grubbox_config, config or {})
end

---@param group string
---@param colors ColorSpec
local function set_hi(group, colors)
    if not vim.tbl_isempty(colors) then
        colors.fg = colors[1] and colors[1][1] or 'NONE'
        colors.bg = colors[2] and colors[2][1] or 'NONE'
        colors.ctermfg = colors[1] and colors[1][2] or 'NONE'
        colors.ctermbg = colors[2] and colors[2][2] or 'NONE'
        colors[1] = nil
        colors[2] = nil
        vim.api.nvim_set_hl(0, group, colors)
    end
end

---@param hlgroups HLGroups
local function set_highlights(hlgroups)
    vim.cmd("highlight Normal guifg=" .. hlgroups.Normal[1][1] .. " guibg=" .. hlgroups.Normal[2][1])
    hlgroups.Normal = nil
    for group, colors in pairs(hlgroups) do
        set_hi(group, colors)
    end
end

function grubbox.load(_)
    if vim.g.colors_name then
        vim.cmd('hi clear')
    end

    vim.g.colors_name = 'grubbox'
    vim.o.termguicolors = true

    if vim.o.background == 'light' then
        _G.grubbox_config.theme = 'light'
    elseif vim.o.background == 'dark' then
        _G.grubbox_config.theme = 'default'
    end

    local theme = require 'grubbox.colors'.setup()
    local hlgroups = require 'grubbox.hl.init'.setup(theme, _G.grubbox_config)

    set_highlights(hlgroups)
end

function grubbox.colors()
    require 'grubbox.colors'
    return _G.grubbox_colors
end

return grubbox
