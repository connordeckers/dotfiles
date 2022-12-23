local awful = require 'awful'
local tbl = require 'gears.table'
local M = {}

---@class ActionBinding
---@field key string The key press to detect
---@field mods? string[] The modifiers to bind to this call
---@field action string | function The action to call. If a string is passed, it will be wrapped with `awful.util.spawn`, otherwise it will be presumed a function and called directly.
---@field description? string the description to display in the help dialog
---@field group? string the group to collection the description under

---@param action ActionBinding
function M.parse(action)
  action = action or {}
  local mods = action.mods or {}
  local key = action.key or {}
  local fn = action.action or function() end

  local group = action.group or nil
  local description = action.description or nil

  local method = type(fn) == 'string' and function()
    awful.util.spawn(fn)
  end or fn

  return awful.key(mods, key, method, { description = description, group = group })
end

---@param ... ActionBinding[]
function M.collection(...)
  local items = tbl.join(...)
  local keys = {}

  for _, action in pairs(items) do
    keys = tbl.join(keys, M.parse(action))
  end

  return keys
end

return M
