return {
	"goolord/alpha-nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Footer
		local function footer()
			return ""
		end

		-- Banner
		local banner = {
			[[                  ▀████▀▄▄              ▄█          ]],
			[[                    █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█          ]],
			[[            ▄        █          ▀▀▀▀▄  ▄▀           ]],
			[[           ▄▀ ▀▄      ▀▄              ▀▄▀           ]],
			[[          ▄▀    █     █▀   ▄█▀▄      ▄█             ]],
			[[          ▀▄     ▀▄  █     ▀██▀     ██▄█            ]],
			[[           ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █           ]],
			[[            █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀           ]],
			[[           █   █  █      ▄▄           ▄▀            ]],
			[[                                                    ]],
			[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
			[[                                                    ]],
		}

		dashboard.section.header.val = banner

		-- Menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("r", "󰈢  Recently opened files", ":Telescope oldfiles<CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("u", "  Update plugins", ":Lazy update<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = footer()

		alpha.setup(dashboard.config)
	end,
}
