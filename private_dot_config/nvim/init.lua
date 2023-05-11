local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local leader = ' '
vim.g.mapleader = leader
vim.g.maplocalleader = leader

require('lazy').setup 'plugins'

require 'config.keymaps'
require 'config.hl-groups'
require 'config.settings'
