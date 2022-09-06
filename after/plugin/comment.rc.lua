local status, comment = pcall(require, "Comment");
if (not status) then return end

comment.setup({
  toggler = {
    line = '<C-/>',
    block = 'gbb'
  },
  opleader = {
    line = 'gc',
    block = '<C-/>'
  }
})
