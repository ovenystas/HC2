--[[
%% autostart
%% properties
%% globals
--]]

-- This scene fetches data from FHEM and updates the FHT virtual devices.
-- It is run once every minute.

-- Table with FHT devices
local devices ={}
devices["58"] = "fht.sovrummet"
devices["60"] = "fht.isaks_rum"
devices["61"] = "fht.koket"
devices["62"] = "fht.nedre_hallen"
devices["63"] = "fht.vardagsrummet"

---------------------------------------------
function fhtUpdate(deviceId, deviceName)
-- Setting up the connection data
  -- Net not supported in scenes yet
  --FHEM = Net.FHttp("192.168.0.13", 8083)

-- geting info about specific device
--  deviceId = fibaro:getValue(59, 'ui.lblId.value')
--  deviceName = fibaro:getValue(59, 'ui.lblName.value')
  fibaro:debug("deviceName="..deviceName)
  response = FHEM:GET("/fhem?cmd=jsonlist+"..deviceName.."&XHR=1")

-- decoding json string to table
  result = json.decode(response)

-- Special usecase of [""] for json tree items with a - in it.
-- Be aware not to use a . infront of the [ !!
--  res2 = result.ResultSet.Results.ATTRIBUTES.room
  actuator = result.ResultSet.Results.READINGS["actuator"].VAL
  actuatorTime = result.ResultSet.Results.READINGS["actuator"].TIME
  fibaro:call(deviceId, "setProperty", "ui.lblActuator.value", actuator)

  battery = result.ResultSet.Results.READINGS["battery"].VAL
  batteryTime = result.ResultSet.Results.READINGS["battery"].TIME
  fibaro:call(deviceId, "setProperty", "ui.lblBattery.value", battery)

  desiredTemp = result.ResultSet.Results.READINGS["desired-temp"].VAL
  desiredTempTime = result.ResultSet.Results.READINGS["desired-temp"].TIME
  fibaro:call(deviceId, "setProperty", "ui.lblDesiredTemp.value", desiredTemp)

  measuredTemp = result.ResultSet.Results.READINGS["measured-temp"].VAL
  measuredTempTime = result.ResultSet.Results.READINGS["measured-temp"].TIME
  fibaro:call(deviceId, "setProperty", "ui.lblMeasuredTemp.value", measuredTemp)

  mode = result.ResultSet.Results.READINGS["mode"].VAL
  modeTime = result.ResultSet.Results.READINGS["mode"].TIME
  fibaro:call(deviceId, "setProperty", "ui.lblMode.value", mode)

  warnings = result.ResultSet.Results.READINGS["warnings"].VAL
  warningsTime = result.ResultSet.Results.READINGS["warnings"].TIME
  fibaro:call(deviceId, "setProperty", "ui.lblWarnings.value", warnings)

  window = result.ResultSet.Results.READINGS["window"].VAL
  windowTime = result.ResultSet.Results.READINGS["window"].TIME
  fibaro:call(deviceId, "setProperty", "ui.lblWindow.value", window)

  windowsensor = result.ResultSet.Results.READINGS["windowsensor"].VAL
  windowsensorTime = result.ResultSet.Results.READINGS["windowsensor"].TIME
  fibaro:call(deviceId, "setProperty", "ui.lblWindowSensor.value", windowsensor)

  fibaro:debug("actuator="..actuator.." kl. "..actuatorTime)	
  fibaro:debug("battery="..battery.." kl. "..batteryTime)
  fibaro:debug("desired-temp="..desiredTemp.." kl. "..desiredTempTime)
  fibaro:debug("measured-temp="..measuredTemp.." kl. "..measuredTempTime)
  fibaro:debug("mode="..mode.." kl. "..modeTime)
  fibaro:debug("warnings="..warnings.." kl. "..warningsTime)
  fibaro:debug("window="..window.." kl. "..windowTime)
  fibaro:debug("windowsensor="..windowsensor.." kl. "..windowsensorTime)
end -- end function fhtUpdate
---------------------------------------------

if (fibaro:getSourceTriggerType() == "autostart") then
  while (true) do

    -- Update all FHT devices
    for id,name in pairs(devices)
    do
      fibaro:debug("id="..id..", name="..name)
      fibaro:call(59, "setProperty", "ui.lblId.value", id);
      fibaro:call(59, "setProperty", "ui.lblName.value", name);
      fibaro:call(59, "pressButton", "1");
      --fhtUpdate(id, name);
      fibaro:sleep(5000)
    end

    -- Sleep in 1 minute
    fibaro:sleep(60*1000);  
  end
end

