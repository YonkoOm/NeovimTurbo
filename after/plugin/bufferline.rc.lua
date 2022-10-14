local status, bufferline = pcall(require, "bufferline")
if (not status) then return end
local status, tokyonight = pcall(require, "tokyonight.colors")
if (not status) then return end
local colors = tokyonight.setup()

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      -- fg = '#073642',
      fg = colors.border_highlight,
      -- bg = '#002b36',
      bg = colors.bg_dark
    },
    separator_selected = {
      -- fg = '#073642',
      fg = colors.border_highlight,
    },
    background = {
      fg = '#657b83',
      -- bg = '#002b36'
      bg = colors.bg_dark
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
      italic = false,
    },
    fill = {
      -- bg = '#073642'
      bg = colors.bg_statusline
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
