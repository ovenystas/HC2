--[[
%% properties

%% globals
--]]

HC2 = Net.FHttp("192.168.0.14") 
HC2:setBasicAuthentication(--username, --password) 

response, status, errorCode = HC2:POST("/api/settings/reboot", "data=reset") 

if errorCode == 0 
then 
  fibaro:log(status) 
else 
  fibaro:log("error") 
end 
