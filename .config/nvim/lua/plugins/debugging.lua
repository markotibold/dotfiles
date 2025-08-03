return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriaga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap = require("dap")
		dap.adapters.codelldb = {
			type = "executable",
			command = "lldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
		}
        dap.adapters.gdb = {
          type = "executable",
          command = "gdb",
          args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				-- program = function()
				-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				-- end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		local dapui = require("dapui")

		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
	end,
}
