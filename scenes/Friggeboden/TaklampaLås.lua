--[[
%% properties
310 value
%% globals
--]]

-- Tänd taklamporna i friggeboden om dörren låses up.
-- Släck lamporna om dörren låses.
if (tonumber(fibaro:getValue(310, "value")) > 0) then
  fibaro:call(57, "turnOn");
else
  fibaro:call(57, "turnOff");
end

