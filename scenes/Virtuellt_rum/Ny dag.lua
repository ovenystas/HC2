--[[
%% autostart
%% properties
%% globals
--]]

local bortrestVirtDevId = 72

function newDayFunc()
  local currentTimeValue = os.time()
  local currentTime = os.date("%H:%M", currentTimeValue)
  --fibaro:debug("currentTime=" .. currentTime)
  if currentTime == "00:00" then

    -- Minska globala variabeln bortrest och
    -- slidern i virtual device bortrest
    -- med 1 om den är större än 0
    local bortrest = tonumber(fibaro:getGlobalValue("Bortrest"))
    fibaro:debug("bortrest=" .. bortrest)
    if bortrest > 0 then
      local newBortrest = bortrest - 1
      local newBortrestString = string.format("%d", newBortrest)
      fibaro:setGlobal("Bortrest", newBortrestString)
      fibaro:call(bortrestVirtDevId, "setProperty", "ui.Label.value",
                  newBortrest)
      fibaro:debug("newBortrest=" ..
                   tonumber(fibaro:getGlobalValue("Bortrest")))
    end

    -- Unset variable "Vaken". Here for now, need to get a better way to
    -- Detect when we go to sleep.
    fibaro:setGlobal("Vaken", 0)

    -- Add more things to do at midnight here

  end

  setTimeout(newDayFunc, 60 * 1000)
end


if fibaro:getSourceTriggerType() == "autostart" then
  newDayFunc()
end

