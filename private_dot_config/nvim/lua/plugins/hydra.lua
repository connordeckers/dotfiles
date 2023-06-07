return {
  {
    "anuvyklack/hydra.nvim",
    event = "VeryLazy",
    config = function()
      local Hydra = require "hydra"
      Hydra(require 'hydras.gitsigns')
    end,
  },
}
