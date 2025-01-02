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


	-- open terminal by toggleterm or tmux pane
	toggleterm_tmux = function (key, count)
		---@diagnostic disable-next-line: unused-local
		local result = vim.fn.system("tmux info")
		local split_size, toggleterm_direction, tmux_option, tmux_reverse_direction, tmux_reverse_split_size, char

		-- get expected width & height size
		local split_ratio = 3 -- less is bigger window, higher is smaller window
		local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
		local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)

		-- ask for input of count
		if count == 1 then
			char = vim.fn.input("Count: ") or 1
		end

		if key == "h" or key == "l" then
			split_size = w_split_size
			toggleterm_direction = "vertical"

			tmux_reverse_direction = "-v -l "
			tmux_reverse_split_size = math.floor(vim.api.nvim_win_get_height(0))

			if key == "h" then
				tmux_option = "-d -h -b -l "
			else
				tmux_option = "-d -h -l "
			end

		elseif key == "j" or key == "k" then
			split_size = h_split_size
			toggleterm_direction = "horizontal"

			tmux_reverse_direction = "-h -l "
			tmux_reverse_split_size = math.floor(vim.api.nvim_win_get_width(0))

			if key == "k" then
				tmux_option = "-d -v -b -l "
			else
				tmux_option = "-d -v -l "
			end
		end

		if vim.v.shell_error == 0 then
			vim.cmd("silent! !tmux split-window " .. tmux_option .. split_size)
			if count == 1 then
				local split_size_per_pane = math.floor(tmux_reverse_split_size / char)
				local nsplit_size = tmux_reverse_split_size - split_size_per_pane
				---@diagnostic disable-next-line: unused-local
				for i = 1, char-1, 1 do
					vim.cmd("silent! !tmux split-window " .. tmux_reverse_direction .. nsplit_size)
					nsplit_size = nsplit_size - split_size_per_pane
				end
			end
		else
			vim.cmd("ToggleTerm size=".. split_size .. " direction=" .. toggleterm_direction)
			vim.cmd("wincmd " .. string.upper(key))
			vim.cmd(toggleterm_direction .. " resize " .. split_size)
			if count == 1 then
				local split_size_per_pane = math.floor(tmux_reverse_split_size / char)
				local nsplit_size = tmux_reverse_split_size - split_size_per_pane
				for i = 1, char-1, 1 do
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(i+1) .. "<cmd>exe v:count1 . 'ToggleTerm direction=" .. toggleterm_direction .. "'<cr><c-w>=", true, false, true), "n", false)
					nsplit_size = nsplit_size - split_size_per_pane
				end
			end
		end

		if vim.fn.exists(":NoiceDismiss") == 2 then
			vim.cmd("NoiceDismiss")
		end
	end,

	toggle_toggleterm_tmux = function ()
		local result = vim.fn.system("tmux info")
		if vim.v.shell_error == 0 then
			vim.cmd("silent! !tmux resize-pane -Z")
		else
			vim.cmd("ToggleTerm")
		end
	end,


	toggleterm_tmux_close = function (key)
		local result = vim.fn.system("tmux info")
		local tmux_direction
		if key == "h" then
			tmux_direction = "-L"
		elseif key == "j" then
			tmux_direction = "-D"
		elseif key == "k" then
			tmux_direction = "-U"
		elseif key == "l" then
			tmux_direction = "-R"
		end

		if vim.v.shell_error == 0 then
			vim.cmd("silent! !tmux select-pane " .. tmux_direction )
			vim.cmd("silent! !tmux kill-pane")
		end

		if vim.fn.exists(":NoiceDismiss") == 2 then
			vim.cmd("NoiceDismiss")
		end
	end,
}

