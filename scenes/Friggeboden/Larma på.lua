--[[
%% properties

%% globals
--]]

fibaro:debug("Larmar på friggeboden.");
fibaro:call(73,  "setArmed", "1"); -- Rörelsesensor
fibaro:call(142, "setArmed", "1"); -- Dörr & fönster
fibaro:call(144, "setArmed", "1"); -- Brandvarnare rök
fibaro:call(146, "setArmed", "1"); -- Brandvarnare temp
fibaro:call(310, "setArmed", "1"); -- Dörrlås

