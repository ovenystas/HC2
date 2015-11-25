--[[ 
%% properties 
%% autostart 
%% globals 
--]]
local devId = 478;
while true do 
  fibaro:call(devId, "pressButton", "1"); 
  fibaro:call(devId, "pressButton", "2"); 
  fibaro:call(devId, "pressButton", "3"); 
  fibaro:sleep(60000); 
end
