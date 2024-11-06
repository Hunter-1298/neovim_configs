--adding rust tools, make sure rust-analyzer is installed in local toolchain
return {
  -- amongst your other plugins
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
}
