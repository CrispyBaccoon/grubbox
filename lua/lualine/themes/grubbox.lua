local theme = require 'grubbox.colors'.setup {}

local colors = {
  normal = theme.syntax.constant[1],
  insert = theme.ike[1],
  visual = theme.syntax.object[1],

  fg0 = theme.fg0[1],
  fg1 = theme.fg1[1],
  bg0 = theme.bg0[1],
  bg1 = theme.bg1[1],
  bg2 = theme.bg2[1],
}

local aki = {}

aki.normal = {
  a = { fg = colors.bg0, bg = colors.normal },
  b = { bg = colors.bg0, fg = colors.normal },
  c = { bg = colors.bg1, fg = colors.fg0 },
}

aki.insert = {
  a = { fg = colors.bg0, bg = colors.insert },
  b = { bg = colors.bg0, fg = colors.insert },
}

aki.command = aki.normal

aki.visual = {
  a = { fg = colors.bg0, bg = colors.visual },
  b = { bg = colors.bg0, fg = colors.visual },
}

aki.replace = aki.insert

aki.inactive = {
  a = { bg = colors.bg1, fg = colors.fg1 },
  b = { bg = colors.bg1, fg = colors.fg1 },
  c = { bg = colors.bg1, fg = colors.fg1 },
}

return aki
