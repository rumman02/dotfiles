local all_keys = function ()
	return  {
		{
			hidden = true,
			{ BUFLEADER .. "a" },
			{ BUFLEADER .. "b" },
			{ BUFLEADER .. "c" },
			{ BUFLEADER .. "d" },
			{ BUFLEADER .. "e" },
			{ BUFLEADER .. "f" },
			{ BUFLEADER .. "g" },
			{ BUFLEADER .. "h" },
			{ BUFLEADER .. "i" },
			{ BUFLEADER .. "j" },
			{ BUFLEADER .. "k" },
			{ BUFLEADER .. "l" },
			{ BUFLEADER .. "m" },
			{ BUFLEADER .. "n" },
			{ BUFLEADER .. "o" },
			{ BUFLEADER .. "p" },
			{ BUFLEADER .. "q" },
			{ BUFLEADER .. "r" },
			{ BUFLEADER .. "s" },
			{ BUFLEADER .. "t" },
			{ BUFLEADER .. "u" },
			{ BUFLEADER .. "v" },
			{ BUFLEADER .. "w" },
			{ BUFLEADER .. "x" },
			{ BUFLEADER .. "y" },
			{ BUFLEADER .. "z" },
			{ BUFLEADER .. "A" },
			{ BUFLEADER .. "B" },
			{ BUFLEADER .. "C" },
			{ BUFLEADER .. "D" },
			{ BUFLEADER .. "E" },
			{ BUFLEADER .. "F" },
			{ BUFLEADER .. "G" },
			{ BUFLEADER .. "H" },
			{ BUFLEADER .. "I" },
			{ BUFLEADER .. "J" },
			{ BUFLEADER .. "K" },
			{ BUFLEADER .. "L" },
			{ BUFLEADER .. "M" },
			{ BUFLEADER .. "N" },
			{ BUFLEADER .. "O" },
			{ BUFLEADER .. "P" },
			{ BUFLEADER .. "Q" },
			{ BUFLEADER .. "R" },
			{ BUFLEADER .. "S" },
			{ BUFLEADER .. "T" },
			{ BUFLEADER .. "U" },
			{ BUFLEADER .. "V" },
			{ BUFLEADER .. "W" },
			{ BUFLEADER .. "X" },
			{ BUFLEADER .. "Y" },
			{ BUFLEADER .. "Z" },
			{ BUFLEADER .. "1" },
			{ BUFLEADER .. "2" },
			{ BUFLEADER .. "3" },
			{ BUFLEADER .. "4" },
			{ BUFLEADER .. "5" },
			{ BUFLEADER .. "6" },
			{ BUFLEADER .. "7" },
			{ BUFLEADER .. "8" },
			{ BUFLEADER .. "9" },
			{ BUFLEADER .. "0" },
			{ BUFLEADER .. "!" },
			{ BUFLEADER .. "@" },
			{ BUFLEADER .. "#" },
			{ BUFLEADER .. "$" },
			{ BUFLEADER .. "%" },
			{ BUFLEADER .. "^" },
			{ BUFLEADER .. "&" },
			{ BUFLEADER .. "*" },
			{ BUFLEADER .. "(" },
			{ BUFLEADER .. ")" },
			{ BUFLEADER .. "-" },
			{ BUFLEADER .. "_" },
			{ BUFLEADER .. "=" },
			{ BUFLEADER .. "+" },
			{ BUFLEADER .. "\\" },
			{ BUFLEADER .. "|" },
			{ BUFLEADER .. "]" },
			{ BUFLEADER .. "}" },
			{ BUFLEADER .. "{" },
			{ BUFLEADER .. "[" },
			{ BUFLEADER .. "'" },
			{ BUFLEADER .. '"' },
			{ BUFLEADER .. ";" },
			{ BUFLEADER .. ":" },
			{ BUFLEADER .. "/" },
			{ BUFLEADER .. "?" },
			{ BUFLEADER .. "." },
			{ BUFLEADER .. ">" },
			{ BUFLEADER .. "," },
			{ BUFLEADER .. "<" },
			{ BUFLEADER .. "<cr>" },
			{ BUFLEADER .. "<tab>" },
			{ BUFLEADER .. "<s-tab>" },
			{ BUFLEADER .. "<esc>" },
			{ BUFLEADER .. BUFLEADER },
		}
	}
end

local which_key = require("which-key")
vim.api.nvim_create_autocmd({ "BufLeave" }, {
	callback = function()
		which_key.add(all_keys())
	end
})
