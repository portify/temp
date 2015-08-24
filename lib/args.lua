local args = {}

function args.flag(s)
  for _, item in ipairs(args) do
    if item == s then
      return true
    end
  end

  return false
end

local i = 1
local loving = true

while i <= #arg do
  local s, e, m = string.find(arg[i], "%-%-(.+)")

  if loving then
      if m == "console" or m == "fused" then
      elseif m == "game" then
          i = i + 1
      else
          loving = false
      end
  else
    table.insert(args, arg[i])
  end

  i = i + 1
end

return args
