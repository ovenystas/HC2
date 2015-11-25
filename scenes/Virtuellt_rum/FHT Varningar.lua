--[[
%% autostart
%% properties
%% globals
--]]

-- This scene checks all FHT virtual devices for warnings and
-- pushes a notification to mobile device if warning is found.
-- Runs at 12:00 every day.

-- Table with FHT devices
local devices ={}
devices["58"] = "fht.sovrummet"
devices["60"] = "fht.isaks_rum"
devices["61"] = "fht.koket"
devices["62"] = "fht.nedre_hallen"
devices["63"] = "fht.vardagsrummet"

if (fibaro:getSourceTriggerType() == "autostart") then
  while (true) do
    local currentDate = os.date("*t");
    if (string.format("%02d", currentDate.hour) .. ":" .. string.format("%02d", currentDate.min) == "12:00") then

      -- Check all FHT devices for warnings
      for id,name in pairs(devices)
      do
        fibaro:debug("id="..id..", name="..name)
        warnings = fibaro:getValue(id, "ui.lblWarnings.value")
        if (warnings ~= "none") 
        then
          message = "Varning: "..name.." "..warnings.."."
          fibaro:debug("Warning: id="..id..", name="..name..", warnings="..warnings)
          -- Push a notification
          --fibaro:call(13, "sendDefinedPushNotification", "7");
          -- Send email to Ove
	      --fibaro:call(8, "sendDefinedEmailNotification", "7");
          -- Send push to Oves Galaxy Nexus
	      fibaro:call(13, "sendPush", message);
        end
      end

    end

    fibaro:sleep(60*1000);
  end
end

