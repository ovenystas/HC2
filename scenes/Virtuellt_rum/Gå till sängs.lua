--[[
%% autostart
%% properties
76 sceneActivation
%% globals
--]]

local id = 76; -- Strömbrytare/dimmer i sovrummet
local name = fibaro:getName(id)
--fibaro:debug(name);

local sourceTriggerType = fibaro:getSourceTriggerType();
--if (sourceTriggerType == "property") then
--  fibaro:debug("sourceTriggerType == property");
--elseif (sourceTriggerType == "global") then
--  fibaro:debug("sourceTriggerType == global");
--elseif (sourceTriggerType == "other") then
--  fibaro:debug("sourceTriggerType == other");
--end

local idn = tonumber(fibaro:getValue(id, "sceneActivation"));
if (idn == 16) then
  fibaro:debug("1 click s1 "..name);
elseif (idn == 26) then
  fibaro:debug("1 click s2 "..name);
elseif (idn == 25) then
  fibaro:debug("3 click s2 "..name);
elseif (idn == 15) then
  fibaro:debug("3 click s1 "..name);
elseif (idn == 14) then
  fibaro:debug("2 click s1 "..name);
elseif (idn == 24) then
  fibaro:debug("2 click s2 "..name);
elseif (idn == 12) then
  fibaro:debug("hold click s1 "..name);
elseif (idn == 13) then
  fibaro:debug("release click s1 "..name);
elseif (idn == 22) then
  fibaro:debug("hold click s2 "..name);
elseif (idn == 23) then
  fibaro:debug("release click s2 "..name);
elseif (idn == 10) then
  fibaro:debug("change from turn off to turn on s1 "..name);
elseif (idn == 11) then
  fibaro:debug("change from turn on to turn off s1 "..name);
elseif (idn == 20) then
  fibaro:debug("change from turn off to turn on s2 "..name);
elseif (idn == 21) then
  fibaro:debug("change from turn on to turn off s2 "..name);
elseif (idn == 17) then
  fibaro:debug("up "..name);
elseif (idn == 18) then
  fibaro:debug("down "..name);
end;

-- Om triggad manuellt eller S2 klickas i sovrummet
if ( (sourceTriggerType == "other") or
     (sourceTriggerType == "property" and idn == 24) ) then
  fibaro:debug("Goodnight, turning off lights");
  fibaro:call(43, "pressButton", "2"); -- Fönsterlampor i köket
  fibaro:call(46, "pressButton", "2"); -- Bokhyllelampor i vardagsrummet
  fibaro:call(47, "pressButton", "2"); -- Vägguttag vänster i vardagsrummet
  fibaro:call(48, "pressButton", "2"); -- Vägguttag mitten i vardagsrummet
  fibaro:call(49, "pressButton", "2"); -- Vägguttag höger i vardagsrummet
  fibaro:call(45, "pressButton", "2"); -- Taklampor i övre hallen
  fibaro:call(70, "turnOff");          -- Golvbelysning i övre hallen
  fibaro:call(55, "turnOff");          -- Fasadlampor utanpå friggeboden
  fibaro:call(57, "turnOff");          -- Taklampor i friggeboden
  fibaro:call(68, "turnOff");          -- Altanbelysning i trädgården
  fibaro:call(71, "turnOff");          -- Taklampa i Noras rum
  fibaro:call(76, "turnOff");          -- Taklampa i sovrummet
  fibaro:call(461, "turnOff");         -- Trapplampor
  fibaro:call(465, "turnOff");         -- Taklampor i nedre hallen
  fibaro:call(467, "turnOff");         -- Taklampa i Isaks rum
  --fibaro:call(484, "turnOff");         -- Ljusslinga på balkongen
end;

