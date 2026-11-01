return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        default_component_configs = {
            indent = {
                with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
            git_status = {
                symbols = {
                    -- Change type
                    added = "",
                    deleted = "",
                    modified = "",
                    renamed = "󰁕",
                    -- Status type
                    untracked = "󰞋",
                    ignored = "",
                    unstaged = "󰄱",
                    staged = "",
                    conflict = "",
                },
            },
        },
    },
}
