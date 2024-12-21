local utils = require("rumman.lib.utils")

return {
	--[[ this funciton will help you to, not break every plugins, if a single
	plugin will break. only that plugin will break and other plugins will run
	smoothly without any problem ]]
	requires = function(module)
		local status_ok, plugin = pcall(require, module)
		if not status_ok then
			vim.notify("WARNING!!! " .. '"' .. module .. '"' .. " plugin's not found!!!")
		else
			return plugin
		end
	end,

	--[[ removes repetation of opts from vim.keymap.set ]]
	set_keymaps = function(mode, lhs, rhs, options)
		-- can set here extra any other opts
		local default_opts = { noremap = true, nowait = true }
		options = vim.tbl_extend("force", default_opts, options or {})
		vim.keymap.set(mode, lhs, rhs, options)
	end,


	-- this is for repetable keymaps
	loop_keymaps = function (loop_back_to, isloop, lhs, rhs, opts)

		local swk_show = [[<cmd>lua require('which-key').show({ keys = ']] .. loop_back_to .. [[', loop = ]] .. tostring(isloop) .. [[ })<cr>]]
		local fwk_show = function()
			require("which-key").show({ keys = loop_back_to, loop = isloop })
		end

		local rhsf = function ()
			if type(rhs) == "string" then
				return rhs .. swk_show
			elseif type(rhs) == "function" then
				return function ()
					rhs()
					fwk_show()
				end
			end
		end

		return {
			lhs,
			rhsf(),
			desc = opts.desc,
			expr = opts.expr,
			icon = opts.icon,
			mode = opts.mode,
			hidden = opts.hidden,
			cond = opts.cond,
			proxy = opts.proxy,
			expand = opts.expand,
			buffer = opts.buffer,
		}
	end,


	--[[ custom function for keymaps of q, fix q key without breaking q macro
	recording ]]
	handle_q_colon_key = function()
		--[[ when alreaddy recording, this vim.fn.reg_recording() this function returns
		recording register (ex: a/b/c..) & when not recording, it returns empty
		string (ex: '') ]]
		if vim.fn.reg_recording() == "" then
			--[[ when call that vim.fn.getcharstr() function, after calling this waiting
			for key press and returns the key ]]
			local key = vim.fn.getcharstr()

			-- if after pressing q, the key is ":" then leave function
			if key ~= ":" then
				--[[ if after pressing q, the key is "keys" then this vim.api.nvim_feedkeys()
				function will send the given "keys" to nvim, that is q + "keys" with normal
				mode which is starting recording macros (ex: qa) ]]
				vim.api.nvim_feedkeys("q" .. key, "n", true)

				-- this is for notify it to, is it recording or not, by vim notify
				for _, values in ipairs(utils.alphabets) do
					if key == values then
						vim.notify("Recording macro to regkey: " .. key)
					end
				end
			end
		else
			-- this is for notify to when the current recording is stopped
			vim.notify("Stopped recording macro to regkey: " .. vim.fn.reg_recording())

			--[[ when already into recording, after pressing q is the given intput key
			also q, so that nvim can recognize as quit macro ]]
			vim.api.nvim_feedkeys("q", "n", true)
		end
	end,
}

