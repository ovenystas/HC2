--[[
%% properties
391 value
%% globals
--]]

local vaken = fibaro:getGlobalValue("Vaken")
if vaken == "1" then
  -- Avbryt om vi redan är vakna
  --fibaro:debug("Redan vaken. Avbryter.")
  fibaro:abort()
end

-- Om vi har rörelse i vardagsrummet (någon har vaknat)...
if tonumber(fibaro:getValue(391, "value")) > 0 then
  local currentDate = os.date("%Y-%m-%d", os.time());
  fibaro:debug(currentDate .. ": Rörelse registrerad i vardagsrummet.")
  -- ...och klockan är efter 06:00
  local now = os.date("*t")
  --local nowVal = now.hour * 60 + now.min
  if now.hour >= 5 and now.hour < 12 then
    fibaro:debug(currentDate .. ": Klockan är mellan 05:00 och 12:00.");
    fibaro:setGlobal("Vaken", 1)
    -- ...om det är natt...
    local dagsljus = fibaro:getGlobalValue("Dagsljus")
    if dagsljus == "Natt" then
      -- ...tänd utelampor och fönsterlampor
      fibaro:debug(currentDate .. ": Det är natt. Tänder alla lamporna.")
	  fibaro:startScene(313); -- Tänd utelampor
	  fibaro:startScene(315); -- Tänd fönsterlampor
    -- ...eller om det är gryning...
    elseif dagsljus == "Gryning" then
      -- ...tänd fönsterlampor
      fibaro:debug(currentDate .. ": Det är gryning. Tänder fönsterlamporna.")
	  fibaro:startScene(315); -- Tänd fönsterlampor
    else
      fibaro:debug(currentDate .. ": Det är dag eller skymning. Tänder inga lampor.")
    end
  else
    fibaro:debug(currentDate .. ": Klockan är före 05:00 eller efter 12:00. Tänder inga lampor.")
  end
end

