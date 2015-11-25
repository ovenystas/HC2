--[[
%% properties
%% globals
--]]

local dscId = 450;  -- Device Id of DSC alarm
--local startSourceType = fibaro:getSourceTriggerType();
fibaro:debug("Alarm=" .. fibaro:getValue(dscId, "alarm"));
fibaro:debug("Armed=" .. fibaro:getValue(dscId, "armed"));
fibaro:debug("Dead=" .. fibaro:getValue(dscId, "dead"));
fibaro:debug("DeviceControlType=" .. fibaro:getValue(dscId, "deviceControlType"));
fibaro:debug("DeviceIcon=" .. fibaro:getValue(dscId, "deviceIcon"));
fibaro:debug("EntryTime=" .. fibaro:getValue(dscId, "entryTime"));
fibaro:debug("ExitTime=" .. fibaro:getValue(dscId, "exitTime"));
fibaro:debug("Log=" .. fibaro:getValue(dscId, "log"));
fibaro:debug("LogTemp=" .. fibaro:getValue(dscId, "logTemp"));
fibaro:debug("Manufacturer=" .. fibaro:getValue(dscId, "manufacturer"));
fibaro:debug("Model=" .. fibaro:getValue(dscId, "model"));
fibaro:debug("PartitionId=" .. fibaro:getValue(dscId, "partitionId"));
fibaro:debug("Ready=" .. fibaro:getValue(dscId, "ready"));
fibaro:debug("RemoteGatewayId=" .. fibaro:getValue(dscId, "remoteGatewayId"));
fibaro:debug("SaveLogs=" .. fibaro:getValue(dscId, "saveLogs"));
fibaro:debug("UserDescription=" .. fibaro:getValue(dscId, "userDescription"));

