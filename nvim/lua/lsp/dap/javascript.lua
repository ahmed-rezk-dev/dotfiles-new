--[[ local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug" ]]
local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter"

local M = {}

function M.setup()
    require("dap-vscode-js").setup {
        node_path = "node",
        debugger_path = DEBUGGER_PATH,
        -- debugger_cmd = { "js-debug-adapter" },
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
    }

    for _, language in ipairs { "typescript", "javascript" } do
        require("dap").configurations[language] = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
            {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require("dap.utils").pick_process,
                cwd = "${workspaceFolder}",
            },
            {
                type = "pwa-node",
                request = "launch",
                name = "Debug Jest Tests",
                -- trace = true, -- include debugger info
                runtimeExecutable = "node",
                runtimeArgs = {
                    "./node_modules/jest/bin/jest.js",
                    "--runInBand",
                },
                rootPath = "${workspaceFolder}",
                cwd = "${workspaceFolder}",
                console = "integratedTerminal",
                internalConsoleOptions = "neverOpen",
            },
        }

        for _, language in ipairs { "typescriptreact", "javascriptreact" } do
            require("dap").configurations[language] = {
                {
                    type = "pwa-chrome",
                    name = "Attach - Remote Debugging",
                    request = "attach",
                    program = "${file}",
                    cwd = vim.fn.getcwd(),
                    sourceMaps = true,
                    protocol = "inspector",
                    port = 9222,
                    webRoot = "${workspaceFolder}",
                    processId = require("dap.utils").pick_process,
                },
                {

                    program = "${file}",
                    cwd = vim.fn.getcwd(),
                    sourceMaps = true,
                    protocol = "inspector",
                    port = 9222,
                    type = "pwa-chrome",
                    name = "Launch Chrome",
                    request = "launch",
                    host = "https://localhost:5001",
                    webRoot = "${workspaceFolder}/src",
                    url = "https://localhost:5001",
                },
            }
        end
    end
end

return M
