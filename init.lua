local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/nvim-lspconfig'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/neovim/nvim-lspconfig', install_path })
end
execute 'packadd nvim-lspconfig'

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/julia-vim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/JuliaEditorSupport/julia-vim', install_path })
end
execute 'packadd julia-vim'

vim.o.termguicolors = true

local lspconfig = require 'lspconfig'

vim.lsp.set_log_level('trace')

local cmd = {
  'julia', '--project=' .. vim.fn.expand('~/.config/nvim/lsp-julia'), '--startup-file=no', '--history-file=no',
  vim.fn.expand('~/.config/nvim/lsp-julia/run.jl'),
}

lspconfig.julials.setup({
  on_new_config = function(new_config, _)
    new_config.cmd = cmd
  end,
})
