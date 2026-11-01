return {
    "saghen/blink.cmp",
    opts = {
        -- NOTE: this is why I keep blink.lua
        keymap = {
            preset = "enter",
            ["<C-y>"] = { "select_and_accept" },
            ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
        },
    },
}
