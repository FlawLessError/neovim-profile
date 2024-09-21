local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

return {
  "mfussenegger/nvim-dap",
  recommended = true,
  desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
  },

  -- stylua: ignore
  keys = {
    { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
    local dap = require("dap")

    -- load mason-nvim-dap here, after all adapters have been setup
    if LazyVim.has("mason-nvim-dap.nvim") then
      require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
    end

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(LazyVim.config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    -- setup dap config by VsCode launch.json file
    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end

    -- Extends dap.configurations with entries read from .vscode/launch.json
    if vim.fn.filereadable(".vscode/launch.json") then
      vscode.load_launchjs()
    end

    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        -- Debug single nodejs files
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
        -- Debug nodejs processes (make sure to add --inspect when you run the process)
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
        -- Debug web applications (client side)
        {
          type = "chrome",
          request = "launch",
          name = "Launch & Debug Chrome",
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = "Enter URL: ",
                default = "http://localhost:3000",
              }, function(url)
                if url == nil or url == "" then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          webRoot = vim.fn.getcwd(),
          protocol = "inspector",
          sourceMaps = true,
          userDataDir = false,
        },
        -- Divider for the launch.json derived configs
        {
          name = "----- ↓ launch.json configs ↓ -----",
          type = "",
          request = "launch",
        },
      }
    end
    dependencies = {
      {
        "miscrosoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup({
            node_path = "node",

            debugger_cmd = { "js-debug-adapter" },

            debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

            adapters = {
              "pwa-node",
              "chrome",
              "pwa-msedge",
              "node-terminal",
              "pwa-extensionHost",
              "node-terminal",
              "node",
            },

            log_file_path = vim.fn.stdpath("cache") .. "/dap_vscode_js.log",

            log_file_level = 0,

            log_console_level = vim.log.levels.ERROR,
          })
        end,
      },
    }
  end,
}
