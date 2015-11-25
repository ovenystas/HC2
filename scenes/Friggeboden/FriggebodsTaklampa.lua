--[[
%% properties
73 value
%% globals
--]]

if (tonumber(fibaro:getValue(73, "value")) > 0) then
  fibaro:call(57, "turnOn")
  fibaro:debug("Rörelse i Friggeboden: Tänder taklampor")
else
  fibaro:call(57, "turnOff")
  fibaro:debug("Ingen rörelse i Friggeboden: Släcker taklampor")
end

