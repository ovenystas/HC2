--[[
%% properties
450 entryTime
%% globals
--]]

local entryTime = tonumber(fibaro:getValue(450, "entryTime"));
fibaro:debug("entryTime=" .. entryTime);
if (entryTime == 1) then
  fibaro:call(70, "turnOn");
else
  fibaro:call(70, "turnOff");
end

