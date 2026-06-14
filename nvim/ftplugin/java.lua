-- Java Setup
local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
	vim.notify("JDTLS not found, install with `:LspInstall jdtls`")
	return
end

local root_dir = require("jdtls.setup").find_root({
	".git",
	-- "mvnw",
	"pom.xml",
	"build.gradle",
	"build.gradle.kts",
	"settings.gradle",
	"settings.gradle.kts",
})

if root_dir == "" then
	return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
-- os.execute("mkdir " .. workspace_dir)

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

-- Needed for debugging
local bundles = {
	vim.fn.glob(vim.fn.stdpath("data") .. "/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}
-- Needed for running/debugging unit tests
vim.list_extend(bundles, vim.split(vim.fn.glob(vim.fn.stdpath("data") .. "/mason/share/java-test/*.jar", 1), "\n"))

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local jdtls_dir = vim.fn.stdpath("data") .. "/mason/share/jdtls"
local config_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls/config_" .. system_os

local config = {
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. jdtls_dir .. "/lombok.jar",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- Eclipse jdtls location
		"-jar",
		jdtls_dir .. "/plugins/org.eclipse.equinox.launcher.jar",
		"-configuration",
		config_dir,
		"-data",
		workspace_dir,
	},
	-- root_dir = require("jdtls.setup").find_root(root_dir),

	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	settings = {
		java = {
			-- TODO Replace this with the absolute path to your main java version (JDTLS requires JDK 21 or higher)
			home = "/opt/jdk-25.0.2/",

			cleanup = {
				actionsOnSave = {
					qualifyMembers = "qualifyMembers",
					addOverride = "addOverride",
					stringConcatToTextBlock = "stringConcatToTextBlock",
					addFinalModifier = "addFinalModifier",
				},
			},

			eclipse = { downloadSources = true },
			maven = { downloadSources = true },
			implementationsCodeLens = { enabled = true },
			referencesCodeLens = { enabled = true },
			references = { enabled = true, includeDecompiledSources = false },
			signatureHelp = { enabled = true },
			project = {
				outputPath = "bin",
				sourcesPaths = { "src", "test" },
			},

			configuration = {
				updateBuildConfiguration = "automatic",
				-- TODO Update this by adding any runtimes that you need to support your Java projects and removing any that you don't have installed
				-- The runtimes' name parameter needs to match a specific Java execution environments.  See https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request and search "ExecutionEnvironment".
				runtimes = {
					{
						name = "JavaSE-25",
						path = "/opt/jdk-25.0.2/",
					},
					{
						name = "JavaSE-21",
						path = "/opt/jdk-21.0.10/",
					},
				},
			},

			gradle = {
				enabled = true,
				offline = false,
				wrapper = {
					enabled = true,
				},
			},
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
					-- "org.junit.jupiter.api.Assertions.*",
					-- "java.util.Objects.requireNonNull",
					-- "java.util.Objects.requireNonNullElse",
					-- "org.mockito.Mockito.*",
					-- "org.hamcrest.MatcherAssert.assertThat",
					-- "org.hamcrest.CoreMatchers.*",
					-- "org.hamcrest.Matchers.*",
				},
				importOrder = {
					-- "java.util",
					-- "java",
					-- "org",
					-- "com",
				},
				filteredTypes = {
					-- "com.sun.*",
					-- "org.apache.*",
					-- "sun.*",
					-- "jdk.*",
					-- "java.awt.*",
					-- "jdk.internal.*",
					-- "javax.*",
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
			-- test = {
			-- 	configurations = {
			-- 		{
			-- 			name = "JUnit",
			-- 			runtime = "JavaSE-21",
			-- 		},
			-- 	},
			-- },

			inlayHints = {
				parameterNames = { enabled = "all" },
			},
		},
		extendedClientCapabilities = extendedClientCapabilities,
	},
	-- Needed for auto-completion with method signatures and placeholders

	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		bundles = bundles,
	},
}

-- config.on_attach = function(_, _)
-- 	require("jdtls").setup_dap({ hotcodereplace = "auto" })

-- 	local status_ok, jdtls_dap = pcall(require, "jdtls.dap")
-- 	if status_ok then
-- 		jdtls_dap.setup_dap_main_class_configs()
-- 	end
-- end

jdtls.start_or_attach(config)
