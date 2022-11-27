require('patch.utils').safe_setup('notify', {})

vim.notify = require 'notify'
