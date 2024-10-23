--  ##    ## ########  #######  ##     ## #### ##     ##
--  ###   ## ##       ##     ## ##     ##  ##  ###   ###
--  ####  ## ##       ##     ## ##     ##  ##  #### ####
--  ## ## ## ######   ##     ## ##     ##  ##  ## ### ##
--  ##  #### ##       ##     ##  ##   ##   ##  ##     ##
--  ##   ### ##       ##     ##   ## ##    ##  ##     ##
--  ##    ## ########  #######     ###    #### ##     ##

--                    _
--                   | |
--   _ __   ___  ___ | |_ _ __ ___  ___
--  | '_ \ / _ \/ _ \| __| '__/ _ \/ _ \
--  | | | |  __/ (_) | |_| | |  __/  __/
--  |_| |_|\___|\___/ \__|_|  \___|\___|

return {

    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
  },
  config = function ()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
    end
}
