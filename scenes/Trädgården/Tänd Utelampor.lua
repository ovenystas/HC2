--[[
%% properties
%% globals
--]]

local currentDate = os.date("%Y-%m-%d", os.time());
fibaro:debug(currentDate .. ": Anropad")
local startSourceType = fibaro:getSourceTriggerType();
if (startSourceType == "other") then
  fibaro:debug("- Tänder")
  fibaro:call(55,  "turnOn"); -- Fasadlampor på friggeboden
  fibaro:call(480, "turnOn"); -- Lampor i trädgården
  fibaro:call(484, "turnOn"); -- Ljusslinga på balkongen
  fibaro:call(68,  "turnOn"); -- Altanbelysning
end


