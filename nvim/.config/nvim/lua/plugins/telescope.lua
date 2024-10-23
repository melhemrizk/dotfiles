--  ##    ## ########  #######  ##     ## #### ##     ##
--  ###   ## ##       ##     ## ##     ##  ##  ###   ###
--  ####  ## ##       ##     ## ##     ##  ##  #### ####
--  ## ## ## ######   ##     ## ##     ##  ##  ## ### ##
--  ##  #### ##       ##     ##  ##   ##   ##  ##     ##
--  ##   ### ##       ##     ##   ## ##    ##  ##     ##
--  ##    ## ########  #######     ###    #### ##     ##

--  | |     | |
--  | |_ ___| | ___  ___  ___ ___  _ __   ___
--  | __/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
--  | ||  __/ |  __/\__ \ (_| (_) | |_) |  __/
--   \__\___|_|\___||___/\___\___/| .__/ \___|
--                                | |
--                                |_|

return {
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
    },
    {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
        require("telescope").setup ({
        extensions = {
        ["ui-select"] = {
        require("telescope.themes").get_dropdown {
            -- even more opts
                        }

                    }
                }
            })
        require("telescope").load_extension("ui-select")
    end
    },
}

