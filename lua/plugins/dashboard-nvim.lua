-- return {
--   "nvimdev/dashboard-nvim",
--   lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
--   opts = function()
--     local logo = [[
-- ███████████████████████████████████████████████████████████████████████████████████████████
-- █▌                                                                                       ▐█
-- █▌     █████╗  ██████╗ ██████╗███████╗███████╗███████╗                                   ▐█
-- █▌    ██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝                                   ▐█
-- █▌    ███████║██║     ██║     █████╗  ███████╗███████╗                                   ▐█
-- █▌    ██╔══██║██║     ██║     ██╔══╝  ╚════██║╚════██║                                   ▐█
-- █▌    ██║  ██║╚██████╗╚██████╗███████╗███████║███████║                                   ▐█
-- █▌    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝                                   ▐█
-- █▌                                                                                       ▐█
-- █▌                     ██████╗ ██████╗  █████╗ ███╗   ██╗████████╗███████╗██████╗        ▐█
-- █▌                    ██╔════╝ ██╔══██╗██╔══██╗████╗  ██║╚══██╔══╝██╔════╝██╔══██╗       ▐█
-- █▌                    ██║  ███╗██████╔╝███████║██╔██╗ ██║   ██║   █████╗  ██║  ██║       ▐█
-- █▌                    ██║   ██║██╔══██╗██╔══██║██║╚██╗██║   ██║   ██╔══╝  ██║  ██║       ▐█
-- █▌                    ╚██████╔╝██║  ██║██║  ██║██║ ╚████║   ██║   ███████╗██████╔╝██╗    ▐█
-- █▌                     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═════╝ ╚═╝    ▐█
-- █▌                                                                                       ▐█
-- ███████████████████████████████████████████████████████████████████████████████████████████
--     ]]
--
--     logo = string.rep("\n", 1) .. logo .. "\n\n"
--
--     local opts = {
--       theme = "doom",
--       hide = {
--         -- this is taken care of by lualine
--         -- enabling this messes up the actual laststatus setting after loading a file
--         -- future me statusline = true means that lualine won't appear!
--         statusline = false,
--       },
--       config = {
--         header = vim.split(logo, "\n"),
--         -- stylua: ignore
--         center = {
--           { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
--           { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
--           { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
--           { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
--           { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
--           { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
--           { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
--           { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
--           { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
--         },
--         footer = function()
--           local stats = require("lazy").stats()
--           local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
--           return {
--             "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
--             "There is no prize to perfection. Only an end to pursuit.",
--             "I bet you can beat the yesterday me!",
--           }
--         end,
--       },
--     }
--
--     for _, button in ipairs(opts.config.center) do
--       button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
--       button.key_format = "  %s"
--     end
--
--     -- open dashboard after closing lazy
--     if vim.o.filetype == "lazy" then
--       vim.api.nvim_create_autocmd("WinClosed", {
--         pattern = tostring(vim.api.nvim_get_current_win()),
--         once = true,
--         callback = function()
--           vim.schedule(function()
--             vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
--           end)
--         end,
--       })
--     end
--     vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#46176d" })
--     vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#9242d6" })
--     vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#a364dd" })
--     vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#a364dd" })
--
--     return opts
--   end,
-- }

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "amansingh-afk/milli.nvim" },
  -- enabled = false,
  opts = function()
    local splash = require("milli").load({ splash = "blackholepurple" })
    return {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        -- WARN: future me statusline = true means that lualine won't appear!
        statusline = false,
      },
      config = {
        header = splash.frames[1], -- seed header with frame 0
        center = {
          {
            action = "lua LazyVim.pick()()",
            desc = " Find File",
            icon = " ",
            key = "f",
          },
          {
            action = "ene | startinsert",
            desc = " New File",
            icon = " ",
            key = "n",
          },
          {
            action = 'lua LazyVim.pick("oldfiles")()',
            desc = " Recent Files",
            icon = " ",
            key = "r",
          },
          {
            action = 'lua LazyVim.pick("live_grep")()',
            desc = " Find Text",
            icon = " ",
            key = "g",
          },
          {
            action = "lua LazyVim.pick.config_files()()",
            desc = " Config",
            icon = " ",
            key = "c",
          },
          {
            action = 'lua require("persistence").load()',
            desc = " Restore Session",
            icon = " ",
            key = "s",
          },
          {
            action = "LazyExtras",
            desc = " Lazy Extras",
            icon = " ",
            key = "x",
          },
          {
            action = "Lazy",
            desc = " Lazy",
            icon = "󰒲 ",
            key = "l",
          },
          {
            action = function()
              vim.api.nvim_input("<cmd>qa<cr>")
            end,
            desc = " Quit",
            icon = " ",
            key = "q",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
            "There is no prize to perfection. Only an end to pursuit.",
            "I bet you can beat the yesterday me!",
          }
        end,
      },
    }
  end,

  config = function(_, opts)
    require("dashboard").setup(opts)
    require("milli").dashboard({ splash = "blackholepurple", loop = true })

    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#46176d" })
    vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#9242d6" })
    vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#a364dd" })
    vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#a364dd" })
  end,
}
