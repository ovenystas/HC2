--[[ 
%% properties 
%% globals 
--]] 

fibaro:call(1,'requestNodeNeighborUpdate') 
fibaro:debug('Rediscover all node') 
fibaro:sleep(5000)

