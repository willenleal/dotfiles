local M = {}

local defaults = require "formatter.defaults"
local util = require "formatter.util"

M.tsfmt = util.copyf(defaults.tsfmt)

M.prettier = util.withl(defaults.prettier, "typescript")

M.prettierd = util.copyf(defaults.prettierd)

M.prettiereslint = util.withl(defaults.prettiereslint, "typescript")

M.eslint_d = util.copyf(defaults.eslint_d)

M.clangformat = util.copyf(defaults.clangformat)

M.denofmt = util.copyf(defaults.denofmt)

M.biome = util.copyf(defaults.biome)

return M
