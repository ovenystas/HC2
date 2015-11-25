--[[
%% autostart
%% properties
%% globals
--]]

-- A better time of day calculator which can compare times
-- Runs every minute.
-- Improvement ideas:
-- * Do not wake up every minute by instead calculate and setting sleep-time.
--   Split functions into setNextTimeout(), setNight(), setDawn(), setDay(), setDusk()
--   Needs to take care of dst change nights.
-- Author: Ove Nystås

function calcDagsljus()
  local sunriseStr = fibaro:getValue(1, "sunriseHour")
  local sunriseHour = tonumber(string.sub(sunriseStr, 1, 2))
  local sunriseMin = tonumber(string.sub(sunriseStr, 4, 6))
  local sunriseVal = sunriseHour * 60 + sunriseMin

  local sunsetStr = fibaro:getValue(1, "sunsetHour")
  local sunsetHour = tonumber(string.sub(sunsetStr, 1, 2))
  local sunsetMin = tonumber(string.sub(sunsetStr, 4, 6))
  local sunsetVal = sunsetHour * 60 + sunsetMin

  local now = os.date("*t")
  local nowVal = now.hour * 60 + now.min

  local dagsljus
  if nowVal < sunriseVal then
    dagsljus = "Natt"
  elseif nowVal < sunriseVal + 30 then
    dagsljus = "Gryning"
  elseif nowVal < sunsetVal - 30 then
    dagsljus = "Dag"
  elseif nowVal < sunsetVal then
    dagsljus = "Skymning"
  else
    dagsljus = "Natt"
  end
  local dagsljusBefore = fibaro:getGlobalValue("Dagsljus")
  if dagsljus ~= dagsljusBefore then
    fibaro:setGlobal("Dagsljus", dagsljus)

    fibaro:debug(os.date("%Y-%m-%d", os.time(now)) .. ":" ..
                 " Sunrise=" .. sunriseStr ..
                 " Sunset=" .. sunsetStr ..
                 " Dagsljus=" .. dagsljusBefore .. "->" .. dagsljus)
  end

  setTimeout(calcDagsljus, 60*1000)
end


local trigger = fibaro:getSourceTriggerType()
if trigger == "autostart" then
  calcDagsljus()
end

