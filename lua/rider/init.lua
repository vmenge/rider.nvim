local M = {}

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "rider"

  package.loaded["rider.palette"] = nil
  package.loaded["rider.highlights"] = nil
  local palette = require("rider.palette")
  local highlights = require("rider.highlights")

  local groups = highlights.get(palette.colors)

  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
