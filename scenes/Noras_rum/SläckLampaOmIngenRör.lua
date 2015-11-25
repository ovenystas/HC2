--[[
%% properties
71 value
78 value
%% globals
--]]

-- Id 71 = Taklampa i Noras rum
-- Id 78 = Rörelsesensor i Noras rum

-- Run only one instance of this scene
if (fibaro:countScenes() > 1) then
  fibaro:abort();
end

local motionId = 78; -- ID for the motion detector
local dimmerId = 71; -- ID for the dimmer you want to operate
local bollamporId = 39;

local motion = tonumber(fibaro:getValue(motionId, "value"));
local bollampor = tonumber(fibaro:getValue(bollamporId, "value"));
local currentDim = tonumber(fibaro:getValue(dimmerId, "value"));
--fibaro:debug("Motion="..motion..", bollampor="..bollampor..", currentDim="..currentDim);

if (currentDim == 0 and motion > 0 and bollampor == 0) then
  fibaro:debug("Motion detected and ball lamps are turned off. Turning on roof light.");
  fibaro:call(dimmerId, "turnOn");
  currentDim = tonumber(fibaro:getValue(dimmerId, "value"));
end  

local entryDim = currentDim;

if (entryDim > 0) then
  -- light is on
  
  local startTimer = 300 * 2; -- Determines how long the light will stay on before dimming starts
  local timer = startTimer;
  local outDim = entryDim;
  local motion;
  local motionLast;

  repeat
    fibaro:sleep(500);
    if (timer == startTimer) then
      fibaro:debug("Starting timer countdown.");
    end;
    timer = timer - 1;

    currentDim = tonumber(fibaro:getValue(dimmerId, "value"));
    if (currentDim ~= outDim) then
      -- Dim level changed outside this scene, resetting timer
      -- and setting new entry dim level
      timer = startTimer;
      entryDim = currentDim;
      outDim = entryDim;
    end;
    
    motion = tonumber(fibaro:getValue(motionId, "value"));
    if (motion > 0 and motionLast == 0) then
      -- Motion detected, resetting timer
      fibaro:debug("Motion detected. Resetting light level and timer.");
      timer = startTimer;
      outDim = entryDim;
      if (outDim ~= currentDim) then
        fibaro:call(dimmerId, "setValue", outDim);
      end;
    end;
    motionLast = motion;

    if (timer < 1) then
      -- Dim the light
      if (timer == 0) then
        fibaro:debug("Timer=0. Starting to dim the light.");
      end;
      if (currentDim > 0) then
        outDim = currentDim - 1;
        fibaro:call(dimmerId, "setValue", outDim);
      end;
    end
    --fibaro:debug("Motion = "..motion..", Timer = "..timer..", Dim level = "..outDim);
  until (currentDim < 1 or outDim < 1)

  fibaro:call(dimmerId, "setValue", entryDim); -- Reset level
  fibaro:call(dimmerId, "turnOff");
  fibaro:debug("Light is turned off.");
  fibaro:killScenes(17);
end

