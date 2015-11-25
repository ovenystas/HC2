--[[
%% properties

%% globals
--]]

fibaro:debug("Larmar av friggeboden.");
fibaro:call(73,  "setArmed", "0"); -- Rörelsesensor
fibaro:call(142, "setArmed", "0"); -- Dörr & fönster
fibaro:call(144, "setArmed", "0"); -- Brandvarnare rök
fibaro:call(146, "setArmed", "0"); -- Brandvarnare temp
fibaro:call(310, "setArmed", "0"); -- Dörrlås


