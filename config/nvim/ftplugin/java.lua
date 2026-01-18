local home = vim.env.HOME
local jdtls = require("jdtls")
local root_dir = require("jdtls.setup").find_root({ ".git", "pom.xml" })
local project_name = vim.fn.fnamemodify(root_dir, ":t")
local workspace_dir = home .. "/.local/jdtls-workspace/" .. project_name
local system_os = ""
if vim.fn.has("mac") == 1 then
	system_os = "mac"
elseif vim.fn.has("unix") == 1 then
	system_os = "linux"
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	system_os = "win"
else
	print("OS not found, defaulting to 'linux'")
	system_os = "linux"
end

local bundles = {
	vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n"))

local config = {
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- Eclipse jdtls location
		"-jar",
		home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
		"-data",
		workspace_dir,
	},

	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	settings = {
		java = {
			-- TODO Replace this with the absolute path to your main java version (JDTLS requires JDK 21 or higher)
			home = "/opt/jdk-25.0.1/",

			cleanup = {
				actionsOnSave = {
					qualifyMembers = "qualifyMembers",
					addOverride = "addOverride",
					stringConcatToTextBlock = "stringConcatToTextBlock",
					addFinalModifier = "addFinalModifier",
				},
			},
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "automatic",
				-- TODO Update this by adding any runtimes that you need to support your Java projects and removing any that you don't have installed
				-- The runtimes' name parameter needs to match a specific Java execution environments.  See https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request and search "ExecutionEnvironment".
				runtimes = {
					{
						name = "JavaSE-25",
						path = "/opt/jdk-25.0.1/",
					},
					{
						name = "JavaSE-21",
						path = "/opt/jdk-21.0.9/",
					},
				},
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = false,
			},
			signatureHelp = { enabled = true },
			format = {
				enabled = true,
				-- Formatting works by default, but you can refer to a specific file/URL if you choose
				-- settings = {
				--   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
				--   profile = "GoogleStyle",
				-- },
				--
			},
			completion = {
				favoriteStaticMembers = {
					"org.mockito.Mockito.*",
					"org.junit.jupiter.api.Assertions.*",
				},
				importOrder = {
					"java.util",
					"java",
					"org",
					"com",
					"javax",
				},
				filteredTypes = {
					"com.sun.*",
					"sun.*",
					"jdk.*",
					"java.awt.*",
					"jdk.internal.*",
				},
			},

			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				useBlocks = true,
			},
			test = {
				configurations = {
					{
						name = "JUnit",
						runtime = "JavaSE-21",
					},
				},
			},

			inlayHints = {
				parameterNames = { enabled = "all" },
			},
		},
	},
	-- Needed for auto-completion with method signatures and placeholders

	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		bundles = bundles,
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	},
}

config["on_attach"] = function(_, _)
	jdtls.setup_dap({ hotcodereplace = "auto" })
	require("jdtls.dap").setup_dap_main_class_configs()
end

jdtls.start_or_attach(config)
