return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		local dap_python = require("dap-python")

		dapui.setup()
		dap_python.setup()
		dap_python.test_runner = "pytest"

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>dc", dap.continue)

		vim.keymap.set("n", "<leader>tt", dap_python.test_method)
		vim.keymap.set("n", "<leader>tc", dap_python.test_class)
		vim.keymap.set("n", "<leader>ds", dap_python.debug_selection)
	end,
}
