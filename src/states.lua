local states = {
  "splash", "menu", "game"
}

local t = {}

for _, state in ipairs(states) do
  t[state] = require(... .. "." .. state)
end

return t
