--[[
%% properties
450 armed
%% globals
--]]

local startSourceType = fibaro:getSourceTriggerType();
local dscArmed =  tonumber(fibaro:getValue(450, "armed"));
fibaro:debug("dscArmed=" .. dscArmed);
if (dscArmed == 0 or startSourceType == "other") then
  fibaro:debug("DSC changed state to Disarmed.");

  fibaro:debug("Disarming Fibaro sensors.");
  fibaro:call(142, "setArmed", "0"); -- Dörr & fönster i friggeboden
  fibaro:call(310, "setArmed", "0"); -- Dörrlås i friggeboden
  fibaro:call(73,  "setArmed", "0"); -- Rörelse i friggeboden
  fibaro:call(78,  "setArmed", "0"); -- Rörelse i Noras rum
  fibaro:call(161, "setArmed", "0"); -- Balkongdörr i vardagsrummet
  fibaro:call(391, "setArmed", "0"); -- Rörelse i vardagsrummet
  fibaro:call(390, "setArmed", "0"); -- Rörelse i sovrummet
  fibaro:call(392, "setArmed", "0"); -- Dörr i Isaks rum

  local dagsljus = fibaro:getGlobalValue("Dagsljus")
  if (dagsljus ~= "Dag") then
    fibaro:debug("Turning on some lights.");
    --fibaro:call(46,  "pressButton", "1"); -- Bokhyllelampor i vardagsrummet
    fibaro:call(45,  "pressButton", "1"); -- Taklampor i övre hallen
    fibaro:call(461, "turnOn");           -- Trapplampor
  end
end

