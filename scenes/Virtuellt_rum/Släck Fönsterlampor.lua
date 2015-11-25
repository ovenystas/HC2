--[[
%% properties
%% globals
--]]

local currentDate = os.date("%Y-%m-%d", os.time());
fibaro:debug(currentDate .. ": Anropad")
local startSourceType = fibaro:getSourceTriggerType();
if (startSourceType == "other") then
  fibaro:debug("- Släcker")
  fibaro:call(43,  "pressButton", "2");  -- Fönsterlampor i köket
  fibaro:call(49,  "pressButton", "2");  -- Vägguttag höger i vardagsrummet
  fibaro:call(48,  "pressButton", "2");  -- Vägguttag mitten i vardagsrummet
  fibaro:call(47,  "pressButton", "2");  -- Vägguttag vänster i vardagsrummet
  fibaro:call(469, "turnOff");           -- Fönsterlampa i Isaks rum
  fibaro:call(461, "turnOff");           -- Trapplampor
end

