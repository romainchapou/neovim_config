local time = {}

local DAYS_OF_THE_WEEK = {
  [0] = "sunday",
  [1] = "monday",
  [2] = "tuesday",
  [3] = "wednesday",
  [4] = "thursday",
  [5] = "friday",
  [6] = "saturday"
}

-- sensible to locale settings
function time.get_date(date)
  local t = tonumber(os.date("%s"))
  local nb_days_diff = 0
  local number_date = tonumber(date)
  local cur_day_week = tonumber(os.date("%w"))

  for num,day in pairs(DAYS_OF_THE_WEEK) do
    if day == date then
      nb_days_diff = (num - cur_day_week) % 7
      if nb_days_diff == 0 then nb_days_diff = 7 end
    end
  end

  if nb_days_diff == 0 then
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
  end

  t = t + 60*60*24*nb_days_diff

  return os.date("%d %b %Y", t)
end

return time
