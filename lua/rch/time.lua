local time = {}

-- sensible to locale settings
function time.get_date(date)
  print(date)

  local t = tonumber(os.date("%s"))
  local nb_days_diff = 0
  local number_date = tonumber(date)

  if date == nil or date == "" or date == "today" then
    nb_days_diff = 0
  elseif date == "tomorrow" then
    nb_days_diff = 1
  elseif date == "next_week" then
    nb_days_diff = 7
  elseif number_date ~= nil then
    nb_days_diff = number_date
  else
    return "?"
  end

  t = t + 60*60*24*nb_days_diff

  return os.date("%d %b %Y", t)
end

return time
