--[[
%% properties
%% globals
--]]

local currentDate = os.date("%Y-%m-%d", os.time());
fibaro:debug(currentDate .. ": Anropad")
local startSourceType = fibaro:getSourceTriggerType();
if (startSourceType == "other") then
  fibaro:debug("- Tänder")
  fibaro:call(43,  "pressButton", "1");  -- Fönsterlampor i köket
  fibaro:call(49,  "pressButton", "1");  -- Vägguttag höger i vardagsrummet
  fibaro:call(48,  "pressButton", "1");  -- Vägguttag mitten i vardagsrummet
  fibaro:call(47,  "pressButton", "1");  -- Vägguttag vänster i vardagsrummet
  fibaro:call(469, "turnOn");            -- Fönsterlampa i Isaks rum
  fibaro:call(461, "turnOn");            -- Trapplampor
end

