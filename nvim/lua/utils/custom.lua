local M = {}

local function show(commands)
  vim.ui.select(commands, {
    prompt = "Colorschemes",
    format_item = function(item)
      return item.name
    end,
  }, function(choice)
    if choice then
      vim.cmd(choice.action)
    end
  end)
end

local colors = {
  -- Cyberdream
  { name = "Cyberdream",           action = "colorscheme cyberdream" },

  -- Catppuccin
  { name = "Catppuccin Macchiato", action = "colorscheme catppuccin-macchiato" },

  -- Tokyonight
  { name = "TokyoNight Night",     action = "colorscheme tokyonight-night" },

  -- Kanagawa
  { name = "Kanagawa Wave",        action = "colorscheme kanagawa-wave" },
  { name = "Kanagawa Dragon",      action = "colorscheme kanagawa-dragon" },

  -- Rose Pine
  { name = "Rose Pine Main",       action = "colorscheme rose-pine" },

  -- Nightfox
  { name = "Nightfox",             action = "colorscheme nightfox" },
  { name = "Duskfox",              action = "colorscheme duskfox" },
  { name = "Nordfox",              action = "colorscheme nordfox" },
  { name = "Terafox",              action = "colorscheme terafox" },
  { name = "Carbonfox",            action = "colorscheme carbonfox" },
}

function M.color_list()
  show(colors)
end

return M
