local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- Lazy load Luasnip snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	view = {
		docs = {
			auto_open = false -- disable auto open docs 
		},
		entries = {
			follow_cursor = true -- cmp window follow the cursor
		}
	},

	-- cmp window & documentation styles
	window = {
		completion = {
			border = UI_BORDER_STYLE,
			winhighlight = "Normal:Normal,FloatBorder:CmpBorder",
			winblend = UI_WINDOW_BLEND,
			scrollbar = true
		},
		documentation = {
			border = UI_BORDER_STYLE,
			winhighlight = "Normal:Normal,FloatBorder:CmpDocBorder",
			winblend = UI_WINDOW_BLEND,
			scrollbar = true
		}
	},

	-- Set completion behavior and options.
	completion = {
		completeopt = COMPLETEOPT,
	},

	mapping = cmp.mapping.preset.insert({

		-- c-h for close cmp menu
		["<C-h>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.close()
			else
				fallback()
			end
		end, { "i", "c" }),

		-- c-l for shows available docs
		["<C-l>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if cmp.visible_docs() then
					cmp.close_docs()
				else
					cmp.open_docs()
				end
			else
				fallback()
			end
		end, { "i", "c" }),

		-- c-j for choose below item (select)
		["<C-j>"] = cmp.mapping({
			i = function (fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end,
			c = function (fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end
		}),

		-- c-n for choose below item (insert)
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			else
				fallback()
			end
		end, { "i", "c" }),

		-- c-k for choose above item (select)
		["<C-k>"] = cmp.mapping({
			i = function (fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end,
			c = function (fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end
		}),

		-- c-p for choose above item (insert)
		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
			else
				fallback()
			end
		end, { "i", "c" }),


		-- scroll docs up and down (step 4)
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		-- scroll docs up and down (step 2)
		["<C-u>"] = cmp.mapping.scroll_docs(-2),
		["<C-d>"] = cmp.mapping.scroll_docs(2),

		-- Confirm selection in the completion menu (insert)
		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })
				else
					fallback()
				end
			end,
			c = function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })  -- Confirm selection with Enter key
				else
					fallback()
				end
			end
		}),

		-- Confirm selection in the completion menu (replace)
		["<S-CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
				else
					fallback()
				end
			end,
			c = function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })  -- Confirm selection with Enter key
				else
					fallback()
				end
			end
		}),

		-- handle Tab key for completion or snippet expansion
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true }) -- Confirm selection in the completion menu
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump() -- Expand or jump in snippet
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	formatting = {
		fields = { "abbr", "kind", "menu" }, -- values are : "kind", "abbr", "menu" and this is the format of cmp item showing style,
		format = function(entry, item)
			local label = item.abbr
			local ellipsis_char = '…'
			local max_label_width = COMPLETEOPT_MAX_WIDTH
			local min_label_width = COMPLETEOPT_MIN_WIDTH
			local mode = "symbol_text" -- Values are: "text", "text_symbol", "symbol_text", or "symbol" 
			local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })

			-- Define the kind icons
			local kind = {
				Text = "󰉿 ",
				Method = "󰆧 ",
				Function = "󰊕 ",
				Constructor = " ",
				Field = " ",
				Variable = "󰀫 ",
				Class = "󰠱 ",
				Interface = " ",
				Module = " ",
				Property = "󰜢 ",
				Unit = "󰑭 ",
				Value = "󰎠 ",
				Enum = " ",
				Keyword = "󰌋 ",
				Snippet = " ",
				Color = "󰏘 ",
				File = "󰈙 ",
				Reference = " ",
				Folder = "󰉋 ",
				EnumMember = " ",
				Constant = "󰏿 ",
				Struct = "󰙅 ",
				Event = " ",
				Operator = "󰆕 ",
				TypeParameter = "󰊄 ",
				Misc = " "
			}

			-- Define the menu items
			local menu = {
				nvim_lsp = "[LSP]",
				buffer = "[BUFF]",
				path = "[PATH]",
				luasnip = "[SNIP]",
				cmdline = "[CMD]",
				cmdline_history = "[HIST]",
				nvim_lua = "[LUA]",
			}

			-- Truncate or pad the label
			local truncated_label = vim.fn.strcharpart(label, 0, max_label_width)
			if truncated_label ~= label then
				item.abbr = truncated_label .. ellipsis_char
			elseif string.len(label) < min_label_width then
				local padding = string.rep(' ', min_label_width - string.len(label))
				item.abbr = label .. padding
			end

			-- Apply `mode` formatting logic
			if mode == "symbol" then
				item.kind = kind[item.kind]
				if color_item.abbr_hl_group then
					item.kind_hl_group = color_item.abbr_hl_group
					item.kind = item.kind
				end
			elseif mode == "symbol_text" then
				item.kind = string.format(' %s %s', kind[item.kind], item.kind)
				if color_item.abbr_hl_group then
					item.kind_hl_group = color_item.abbr_hl_group
					item.kind = string.format('%s %s', item.kind, color_item.abbr)
				end
			elseif mode == "text_symbol" then
				item.kind = string.format(' %s %s ', item.kind, kind[item.kind])
				if color_item.abbr_hl_group then
					item.kind_hl_group = color_item.abbr_hl_group
					item.kind = string.format(' %s %s ', color_item.abbr, item.kind )
				end
			end

			-- Set the completion source in the menu
			item.menu = menu[entry.source.name]

			return item
		end,
	},
	experimental = {
		-- Enable ghost text, which shows a faded preview of the item being completed.
		ghost_text = true
	},
	---@diagnostic disable-next-line: undefined-field
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "dictionary", keyword_length = 2},
		{
			name = "buffer",
			keyword_length = 2,
			option = {
				get_bufnrs = function()
					local bufs = {}
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						bufs[vim.api.nvim_win_get_buf(win)] = true
					end
					return vim.tbl_keys(bufs)
				end,
			}
		},
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "emoji" },
		{ name = "nerdfont" }
	}),

	-- Setup for "/", "?" cmdline
	cmp.setup.cmdline({ "/", "?" }, {
		---@diagnostic disable-next-line: undefined-field
		sources = cmp.config.sources({
			{ name = "buffer" },
			{ name = "cmdline_history" }
		}),
	}),

	-- Setup for ":" cmdline
	cmp.setup.cmdline(":", {
		---@diagnostic disable-next-line: undefined-field
		sources = cmp.config.sources({
			{ name = "cmdline" },
			{ name = "cmdline_history" },
			{ name = "path" }
		}),
		matching = { disallow_symbol_nonprefix_matching = false }
	})
})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

