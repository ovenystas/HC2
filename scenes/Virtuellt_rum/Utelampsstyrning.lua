--[[
%% properties
%% globals
Dagsljus
--]]

local currentDate = os.date("%Y-%m-%d", os.time());
local dagsljus = fibaro:getGlobalValue("Dagsljus");
if (dagsljus == "Natt") then
  fibaro:debug(currentDate .. ": Natt: Tänder utelampor")
  fibaro:startScene(313);  -- Tänd Utelampor
elseif (dagsljus == "Gryning") then
  fibaro:debug(currentDate .. ": Gryning: Släcker utelampor")
  fibaro:startScene(314);  -- Släck Utelampor
end

