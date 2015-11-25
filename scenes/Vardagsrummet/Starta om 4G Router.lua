--[[
%% properties
%% globals
--]]

local routerId = 474;

local startSourceType = fibaro:getSourceTriggerType();
if (startSourceType == "other")
then
  fibaro:call(routerId, "turnOff");
  setTimeout(function()
      fibaro:call(routerId, "turnOn");
  end, 10000)
end

