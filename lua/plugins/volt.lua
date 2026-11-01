return {
    { "nvzone/volt", lazy = true },
    {
        "nvzone/minty",
        cmd = { "Shades", "Huefy" },
    },
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    },
}
