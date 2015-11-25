--[[
%% autostart
%% properties
%% globals
--]]

local goToBedSceneId = 1
local goToBedTimeWhenAway = "23:30"
local awayVarName = "Bortrest"

function tempFunc()
  local daysAway = tonumber(fibaro:getGlobalValue(awayVarName))
  if daysAway > 0 then
    local currentDate = os.date("*t")
    local currentTime = string.format("%02d", currentDate.hour) .. ":" ..
                        string.format("%02d", currentDate.min)
    if currentTime == goToBedTimeWhenAway then
	  fibaro:startScene(goToBedSceneId)
    end
  end

  setTimeout(tempFunc, 60 * 1000)
end


if fibaro:getSourceTriggerType() == "autostart" then
  tempFunc()
end

