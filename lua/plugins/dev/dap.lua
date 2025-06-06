return {}
-- return {
--   "mfussenegger/nvim-dap",
--   dependencies = {
--     -- Add the nvim-nio dependency required by dap-ui
--     "nvim-neotest/nvim-nio",
--     "rcarriga/nvim-dap-ui",
--     "theHamsta/nvim-dap-virtual-text",
--     "mxsdev/nvim-dap-vscode-js",
--     {
--       "microsoft/vscode-js-debug",
--       build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
--     },
--   },
--   config = function()
--     local dap = require("dap")
--     local dapui = require("dapui")
--     local virtual_text = require("nvim-dap-virtual-text")
--     local dap_widgets = require("dap.ui.widgets")
--
--     -- Define custom signs for debugging
--     vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
--     vim.fn.sign_define('DapBreakpointCondition',
--       { text = '◆', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
--     vim.fn.sign_define('DapLogPoint', { text = '◉', texthl = 'DapLogPoint', linehl = '', numhl = '' })
--     vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })
--     vim.fn.sign_define('DapBreakpointRejected', { text = '○', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })
--
--     -- Set up highlighting colors for these signs
--     vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#993939' })          -- red
--     vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { fg = '#61afef' }) -- blue
--     vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef' })            -- blue
--     vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379' })             -- green
--     vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#d19a66' })  -- orange
--     vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#31353f' })         -- subtle background
--
--     -- DAP UI setup
--     dapui.setup({
--       icons = { expanded = "▾", collapsed = "▸" },
--       mappings = {
--         expand = { "<CR>", "<2-LeftMouse>" },
--         open = "o",
--         remove = "d",
--         edit = "e",
--         repl = "r",
--         toggle = "t",
--       },
--       layouts = {
--         {
--           elements = {
--             "scopes",
--             "breakpoints",
--             "stacks",
--             "watches",
--           },
--           size = 40,
--           position = "left",
--         },
--         {
--           elements = {
--             "repl",
--             "console",
--           },
--           size = 10,
--           position = "bottom",
--         },
--       },
--     })
--
--     -- Enable virtual text
--     virtual_text.setup({
--       enabled = true,
--       enabled_commands = true,
--       highlight_changed_variables = true,
--       highlight_new_as_changed = false,
--       show_stop_reason = true,
--       commented = false,
--     })
--
--     -- JavaScript / TypeScript adapter setup
--     require("dap-vscode-js").setup({
--       debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
--       adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
--     })
--
--     -- Node.js configurations
--     dap.configurations.javascript = {
--       -- Launch configuration with debug flags
--       {
--         type = "pwa-node",
--         request = "launch",
--         name = "Launch Current File (Node)",
--         program = "${file}",
--         cwd = "${workspaceFolder}",
--         runtimeExecutable = "node",
--         runtimeArgs = { "--inspect-brk" },
--         console = "integratedTerminal",
--         internalConsoleOptions = "neverOpen",
--         sourceMaps = true,
--         skipFiles = { "<node_internals>/**", "node_modules/**" },
--       },
--       -- Attach to running Node process
--       {
--         type = "pwa-node",
--         request = "attach",
--         name = "Attach to Node Process",
--         -- processId = require("dap.utils").pick_process,
--         port = 9229,
--         cwd = "${workspaceFolder}",
--         sourceMaps = true,
--         restart = true
--       },
--       -- For Jest tests
--       {
--         type = "pwa-node",
--         request = "launch",
--         name = "Debug Jest Tests",
--         runtimeExecutable = "node",
--         runtimeArgs = {
--           "${workspaceFolder}/node_modules/.bin/jest",
--           "--runInBand",
--         },
--         console = "integratedTerminal",
--         internalConsoleOptions = "neverOpen",
--         cwd = "${workspaceFolder}",
--         sourceMaps = true,
--       },
--       -- For web applications
--       {
--         type = "pwa-chrome",
--         request = "launch",
--         name = "Launch Chrome against localhost",
--         url = "http://localhost:3000",
--         webRoot = "${workspaceFolder}",
--         sourceMaps = true,
--         userDataDir = "${workspaceFolder}/.vscode/chrome",
--         sourceMapPathOverrides = {
--           ["webpack:///src/*"] = "${webRoot}/*",
--         },
--       }
--     }
--
--     -- TypeScript configurations
--     dap.configurations.typescript = {
--       -- Launch TS file with ts-node
--       {
--         type = "pwa-node",
--         request = "launch",
--         name = "Launch Current TS File (ts-node)",
--         program = "${file}",
--         cwd = "${workspaceFolder}",
--         runtimeExecutable = "node",
--         runtimeArgs = {
--           "--loader", "ts-node/esm",
--           "--inspect-brk",
--         },
--         sourceMaps = true,
--         protocol = "inspector",
--         skipFiles = { "<node_internals>/**", "node_modules/**" },
--         resolveSourceMapLocations = {
--           "${workspaceFolder}/**",
--           "!**/node_modules/**",
--         },
--         console = "integratedTerminal",
--         internalConsoleOptions = "neverOpen",
--       },
--       -- Attach to running Node process
--       {
--         type = "pwa-node",
--         request = "attach",
--         name = "Attach to Node Process",
--         processId = require("dap.utils").pick_process,
--         cwd = "${workspaceFolder}",
--       },
--       -- Angular debug configuration
--       {
--         type = "pwa-chrome",
--         request = "launch",
--         name = "Launch Chrome with Angular",
--         url = "http://localhost:4200",
--         webRoot = "${workspaceFolder}",
--         userDataDir = "${workspaceFolder}/.vscode/chrome",
--         sourceMaps = true,
--       },
--       -- React debug configuration
--       {
--         type = "pwa-chrome",
--         request = "launch",
--         name = "Launch Chrome with React",
--         url = "http://localhost:3000",
--         webRoot = "${workspaceFolder}",
--         userDataDir = "${workspaceFolder}/.vscode/chrome",
--         sourceMaps = true,
--       }
--     }
--
--     -- Events listeners
--     dap.listeners.after.event_initialized["dapui_config"] = function()
--       dapui.open()
--     end
--     dap.listeners.before.event_terminated["dapui_config"] = function()
--       dapui.close()
--     end
--     dap.listeners.before.event_exited["dapui_config"] = function()
--       dapui.close()
--     end
--
--     -- Helper function for get_args
--     local function get_args()
--       local args_string = vim.fn.input('Program arguments: ')
--       return vim.fn.split(args_string, " ", true)
--     end
--
--     -- Keymappings
--     vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
--       { desc = "Breakpoint Condition" })
--     vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
--     vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Run/Continue" })
--     vim.keymap.set("n", "<leader>da", function() dap.continue({ before = get_args }) end, { desc = "Run with Args" })
--     vim.keymap.set("n", "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run to Cursor" })
--     vim.keymap.set("n", "<leader>dg", function() dap.goto_() end, { desc = "Go to Line (No Execute)" })
--     vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
--     vim.keymap.set("n", "<leader>dj", function() dap.down() end, { desc = "Down" })
--     vim.keymap.set("n", "<leader>dk", function() dap.up() end, { desc = "Up" })
--     vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "Run Last" })
--     vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step Out" })
--     vim.keymap.set("n", "<leader>dO", function() dap.step_over() end, { desc = "Step Over" })
--     vim.keymap.set("n", "<leader>dP", function() dap.pause() end, { desc = "Pause" })
--     vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL" })
--     vim.keymap.set("n", "<leader>ds", function() dap.session() end, { desc = "Session" })
--     vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })
--     vim.keymap.set("n", "<leader>dw", function() dap_widgets.hover() end, { desc = "Widgets" })
--     -- Additional UI toggle keybinding
--     vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle UI" })
--     -- Add a breakpoint with log point
--     vim.keymap.set("n", "<leader>dL", function()
--       dap.set_breakpoint(nil, nil, vim.fn.input('Log message: '))
--     end, { desc = "Logpoint" })
--   end,
-- }
