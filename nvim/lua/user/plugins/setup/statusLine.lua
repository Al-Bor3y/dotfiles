-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#89B4FA',
  green   = '#A6E3A1',
--  black  = '#080808',
  white  = '#CDD6F4',
  red    = '#F38Ba8',
  mauve = '#CBA6F7',
  lavender = '#B4BEFE',
  background = '#1E1E2E'
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.background, bg = colors.blue },
    b = { fg = colors.lavender, bg = colors.background },
    c = { fg = colors.lavender },
  },

  insert = { a = { fg = colors.background, bg = colors.green } },
  visual = { a = { fg = colors.background, bg = colors.mauve } },
  replace = { a = { fg = colors.background, bg = colors.red } },

  inactive = {
    a = { fg = colors.lavender, bg = colors.background },
    b = { fg = colors.lavender, bg = colors.background },
    c = { fg = colors.lavender },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center compoentnts here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
--require("lualine").setup{}
