local M = {}

-- JAVA
function M.organize_imports()
	if vim.bo.filetype == "java" then
		require("jdtls").organize_imports()
	end
end

function M.update_projects_config()
	if vim.bo.filetype == "java" then
		require("jdtls").update_projects_config()
	end
end

function M.test_current_class()
	if vim.bo.filetype == "java" then
		require("jdtls").test_class()
	end
end

function M.test_nearest_method()
	if vim.bo.filetype == "java" then
		require("jdtls").test_nearest_method()
	end
end

return M
