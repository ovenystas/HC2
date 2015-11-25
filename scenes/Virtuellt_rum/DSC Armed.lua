--[[
%% properties
450 armed
%% globals
--]]

local startSourceType = fibaro:getSourceTriggerType();
local dscArmed = tonumber(fibaro:getValue(450, "armed"));
fibaro:debug("dscArmed=" .. dscArmed);
if (dscArmed == 1 or startSourceType == "other") then
  fibaro:debug("DSC changed state to Armed.");

  fibaro:debug("Arming Fibaro.");
  fibaro:call(142, "setArmed", "1"); -- Dörr- & fönster i friggeboden
  fibaro:call(310, "setArmed", "1"); -- Dörrlås i friggeboden
  fibaro:call(73,  "setArmed", "1"); -- Rörelse i friggeboden
  fibaro:call(78,  "setArmed", "1"); -- Rörelse i Noras rum
  fibaro:call(161, "setArmed", "1"); -- Balkongdörr i vardagsrummet
  fibaro:call(391, "setArmed", "1"); -- Rörelse i vardagsrummet
  fibaro:call(390, "setArmed", "1"); -- Rörelse i sovrummet
  fibaro:call(392, "setArmed", "1"); -- Dörr i Isaks rum

  fibaro:debug("Turning off some lights.");
  fibaro:call(46,  "pressButton", "2"); -- Bokhyllelampor i vardagsrummet
  fibaro:call(45,  "pressButton", "2"); -- Taklampor i övre hallen
  fibaro:call(70,  "turnOff");          -- Golvbelysning i övre hallen
  fibaro:call(57,  "turnOff");          -- Taklampor i friggeboden
  fibaro:call(71,  "turnOff");          -- Taklampa i Noras rum
  fibaro:call(76,  "turnOff");          -- Taklampa i sovrummet
  fibaro:call(461, "turnOff");          -- Trapplampor
  fibaro:call(465, "turnOff");          -- Taklampor i nedre hallen
  fibaro:call(467, "turnOff");          -- Taklampa i Isaks rum
end





