local status, comment = pcall(require, "Comment");
if (not status) then return end

comment.setup({
  toggler = {
    line = '[c',
    block = 'gbb'
  },
  opleader = {
    line = 'gc',
    block = '[c'
  }
})
