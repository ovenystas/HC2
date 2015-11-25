--[[
%% properties
%% globals
--]]

local currentDate = os.date("%Y-%m-%d", os.time());
fibaro:debug(currentDate .. ": Anropad")
local startSourceType = fibaro:getSourceTriggerType();
if (startSourceType == "other") then
  fibaro:debug("- Släcker")
  fibaro:call(55,  "turnOff"); -- Fasadlampor på friggeboden
  fibaro:call(480, "turnOff"); -- Lampor i trädgården
  fibaro:call(484, "turnOff"); -- Ljusslinga på balkongen
  fibaro:call(68,  "turnOff"); -- Altanbelysning
end

