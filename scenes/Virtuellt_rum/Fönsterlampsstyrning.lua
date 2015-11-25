--[[
%% properties
%% globals
Dagsljus
--]]

local currentDate = os.date("%Y-%m-%d", os.time());
local dagsljus = fibaro:getGlobalValue("Dagsljus");
if (dagsljus == "Skymning") then
  fibaro:debug(currentDate .. ": Skymning: Tänd fönsterlampor")
  fibaro:startScene(315);  -- Tänd Fönsterlampor
elseif (dagsljus == "Dag") then
  fibaro:debug(currentDate .. ": Dag: Släck fönsterlampor")
  fibaro:startScene(316);  -- Släck Fönsterlampor
end

