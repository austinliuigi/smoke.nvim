local options = require('smoke.config').options

-- black     #0C0C0C
-- lowest    #1A1A1A
-- lower     #262626
-- low       #303030
-- gray      #7E7E7E
-- high      #A5A5A5
-- higher    #CCCCCC
-- highest   #F2F2F2
-- white     #FFFFFF

local variants = {
  dark = {
    nc = '#16141f',
    base = '#0C0C0C',
    text = '#CCCCCC',
    surface = '#1A1A1A',
    overlay = '#262626',
    black = '#0C0C0C',
    lowest = '#1A1A1A',
    lower = '#494949',
    low = '#646464',
    gray = '#7E7E7E',
    high = '#A5A5A5',
    higher = '#CCCCCC',
    highest = '#F2F2F2',
    white = '#FFFFFF',
    red = '#E93E33',
    green = '#a7c080',
    orange = '#F3A432',
    pink = '#ebbcba',
    none = 'NONE',
  },
  light = {
    nc = '#f8f0e7',
    base = '#faf4ed',
    surface = '#fffaf3',
    overlay = '#f2e9e1',
    muted = '#9893a5',
    subtle = '#797593',
    text = '#575279',
    love = '#b4637a',
    gold = '#ea9d34',
    rose = '#d7827e',
    pine = '#286983',
    foam = '#56949f',
    iris = '#907aa9',
    highlight_low = '#f4ede8',
    highlight_med = '#dfdad9',
    highlight_high = '#cecacd',
    none = 'NONE',
  },
}

return variants.dark
--
-- return vim.o.background == 'light' and variants.light
--     or variants.dark
