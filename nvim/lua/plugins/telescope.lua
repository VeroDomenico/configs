
return {
    {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },  -- Corrected 'dependencies' to 'requires'
        config = function()
            require('telescope').setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {
                            -- Even more options can be configured here.
                        }
                    }
                }
            })

            local builtin = require('telescope.builtin')
            -- You need to pass a function reference, not call the function
            vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })

            -- Load the 'ui-select' extension
            require('telescope').load_extension('ui-select')
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim'
    }
}

