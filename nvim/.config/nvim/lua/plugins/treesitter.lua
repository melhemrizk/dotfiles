--  ##    ## ########  #######  ##     ## #### ##     ##
--  ###   ## ##       ##     ## ##     ##  ##  ###   ###
--  ####  ## ##       ##     ## ##     ##  ##  #### ####
--  ## ## ## ######   ##     ## ##     ##  ##  ## ### ##
--  ##  #### ##       ##     ##  ##   ##   ##  ##     ##
--  ##   ### ##       ##     ##   ## ##    ##  ##     ##
--  ##    ## ########  #######     ###    #### ##     ##

--   _                      _ _   _
--  | |                    (_) | | |
--  | |_ _ __ ___  ___  ___ _| |_| |_ ___ _ __
--  | __| '__/ _ \/ _ \/ __| | __| __/ _ \ '__|
--  | |_| | |  __/  __/\__ \ | |_| ||  __/ |
--   \__|_|  \___|\___||___/_|\__|\__\___|_|

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
	local configs = require("nvim-treesitter.configs")
    configs.setup({
          ensure_installed = { "go", "lua", "vim"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
}
