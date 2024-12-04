local M = {}
local keys = {
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
	"p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
	"P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
}

--==================================================--
--   fix q key without breaking q macro recording   --
--==================================================--
function M.handle_q_colon_key()

  --[[ when alreaddy recording, this vim.fn.reg_recording() this function returns
	recording register (ex: a/b/c..) & when not recording, it returns empty
	string (ex: '') ]]
  if vim.fn.reg_recording() == '' then

    --[[ when call that vim.fn.getcharstr() function, after calling this waiting 
		for key press and returns the key ]]
    local key = vim.fn.getcharstr()

    -- if after pressing q, the key is ":" then leave function
    if key ~= ':' then
      --[[ if after pressing q, the key is "keys" then this vim.api.nvim_feedkeys()
			function will send the given "keys" to nvim, that is q + "keys" with normal
			mode which is starting recording macros (ex: qa) ]]
      vim.api.nvim_feedkeys('q' .. key, "n", true)

			-- this is for notify it to, is it recording or not, by vim notify
			for _, values in ipairs(keys) do
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
    vim.api.nvim_feedkeys('q', "n", true)
  end

end

return M

