-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'jake-stewart/multicursor.nvim',
    branch = '1.0',
    config = function()
      local mc = require 'multicursor-nvim'

      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      set({ 'n', 'v' }, '<up>', function()
        mc.lineAddCursor(-1)
      end)
      set({ 'n', 'v' }, '<down>', function()
        mc.lineAddCursor(1)
      end)
      set({ 'n', 'v' }, '<leader><up>', function()
        mc.lineSkipCursor(-1)
      end)
      set({ 'n', 'v' }, '<leader><down>', function()
        mc.lineSkipCursor(1)
      end)
      -- Add or skip adding a new cursor by matching word/selection
      set({ 'n', 'v' }, '<leader>n', function()
        mc.matchAddCursor(1)
      end, { desc = 'Add Cursor next word match' })
      set({ 'n', 'v' }, '<leader>s', function()
        mc.matchSkipCursor(1)
      end, { desc = 'Add Cursor next word match' })
      set({ 'n', 'v' }, '<leader>N', function()
        mc.matchAddCursor(-1)
      end)
      set({ 'n', 'v' }, '<leader>S', function()
        mc.matchSkipCursor(-1)
      end)

      set('n', '<esc>', function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        elseif mc.hasCursors() then
          mc.clearCursors()
        else
          -- Default <esc> handler.
        end
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, 'MultiCursorCursor', { link = 'Cursor' })
      hl(0, 'MultiCursorVisual', { link = 'Visual' })
      hl(0, 'MultiCursorSign', { link = 'SignColumn' })
      hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
      hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
      hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
    end,
  },
}
