do

local function run(msg, matches)
  if matches[1] ~= '!minecraft' then
    operation = matches[1]
  else
    return "!minecraft start|stop|restart"
  end
  if string.find(operation, '&') or string.find(operation, '|') or string.find(operation, '`') or string.find(operation, '%$') then
    return "Invalid operation " .. operation
  end
  local t = io.popen('cd /home/telegram && ./mc ' .. operation)
  local a = t:read("*all")
  return a
end

return {
  description = "loli.club minecraft bot!",
  usage = "!minecraft start|stop|restart",
  patterns = {
    "^!minecraft$",
    "^!minecraft (.*)$"
  },
  run = run
}

end
