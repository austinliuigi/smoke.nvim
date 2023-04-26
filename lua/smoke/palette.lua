local options = require('smoke.config').options

local colors = {
  black      = '#0C0C0C',
  darkgray4  = '#1A1A1A',
  darkgray3  = '#262626',
  darkgray2  = '#353535',
  darkgray1  = '#525252',
  gray       = '#7E7E7E',
  lightgray1 = '#A5A5A5',
  lightgray2 = '#B4B4B4',
  lightgray3 = '#CDCDCD',
  lightgray4 = '#F2F2F2',
  white      = '#FFFFFF',
}

local variants = {
  dark = {
    nc      = colors.darkgray4,
    base    = colors.black,
    text    = colors.lightgray3,
    surface = colors.darkgray4,
    overlay = colors.darkgray3,
    low4    = colors.darkgray4,
    low3    = colors.darkgray3,
    low2    = colors.darkgray2,
    low1    = colors.darkgray1,
    medium  = colors.gray,
    high1   = colors.lightgray1,
    high2   = colors.lightgray2,
    high3   = colors.lightgray3,
    high4   = colors.lightgray4,
    red     = '#E93E33',
    green   = '#A7C080',
    orange  = '#F3A432',
    pink    = '#EBBCBA',
    none    = 'NONE',
  },
  light = {
    nc      = colors.lightgray4,
    base    = colors.white,
    text    = colors.darkgray3,
    surface = colors.lightgray4,
    overlay = colors.lightgray3,
    low4    = colors.lightgray4,
    low2    = colors.lightgray2,
    low1    = colors.lightgray1,
    medium  = colors.gray,
    high1   = colors.darkgray1,
    high3   = colors.darkgray3,
    high4   = colors.darkgray4,
    red     = '#E93E33',
    green   = '#A7C080',
    orange  = '#F3A432',
    pink    = '#EBBCBA',
    none    = 'NONE',
  },
}

return vim.o.background == 'light' and variants.light
    or variants.dark
