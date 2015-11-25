--[[
%% properties
450 exitTime
%% globals
--]]

local exitTime = tonumber(fibaro:getValue(450, "exitTime"));
fibaro:debug("exitTime=" .. exitTime);
local devId = 70;  -- Golvlampor i övre hallen
if (exitTime == 1) then
  fibaro:call(70, "turnOn");
else
  fibaro:call(70, "turnOff");
end

