--[[
%% properties

%% globals
--]]

function Vacation_Days(dateForCheck)

  -- Ange vilka datum som skall anses som lediga datum
  local LedigaDatum = { "2014-05-02" , "2014-05-30" }

  local datum

  for z,datum in pairs(LedigaDatum) do
    TestDatum = os.date("*t", os.time({year = tonumber(string.sub(datum,1,4)), month = tonumber(string.sub(datum,6,7)), day = tonumber(string.sub(datum,9))}))
    if ( TestDatum.year == dateForCheck.year and TestDatum.month == dateForCheck.month and TestDatum.day == dateForCheck.day ) then
      return true
    end
  end
  return false
end 

function Holidays_CalculateEaster(year)
  golden = (year % 19) + 1
  c = math.floor(year/400) + math.floor(8*(math.floor(year/100)+11)/25) - math.floor(year/100)
  s = (11 * golden + c) % 30
  if (s < 0) then
    s = s + 30
  end
  pfm = os.time{year=year, month=4, day=19} - s * 24 * 60 * 60
  if (pfm == os.time{year=year, month=4, day=19}) then
    pfm = pfm - 24 * 60 * 60
  elseif (pfm == os.time{year=year, month=4, day=18} and golden > 11) then
    pfm = pfm - 24 * 60 * 60
  end
  sunday = pfm + (7 - tonumber(os.date("%w", pfm))) * 24 * 60 * 60
  friday = sunday - 2 * 24 * 60 * 60
   
  return {year, tonumber(os.date("%m", friday)), tonumber(os.date("%d", friday))} 
end

function WorkDay(dateToCheck)
  local easterDay
  local returnValue
     
  returnValue = true

  -- Indatum är en lördag eller Söndag
  if ( dateToCheck.wday == 1 or dateToCheck.wday == 7 ) then
    returnValue = false
  -- Indatum är nationaldag       
  elseif ( dateToCheck.month == 6 and dateToCheck.day == 6 ) then
    returnValue = false
  -- Indatum är Nyårsdag eller trettondag
  elseif ( dateToCheck.month == 1 and (dateToCheck.day == 1 or dateToCheck.day == 6 ) ) then
    returnValue = false
  -- Indatum är 1:a maj
  elseif ( dateToCheck.month == 5 and dateToCheck.day == 1 ) then
    returnValue = false
  -- Indatum är Julafton,Juldag, Annandag eller Nyårsafton
  elseif ( dateToCheck.month == 12 and (dateToCheck.day == 24 or dateToCheck.day == 25 or dateToCheck.day == 26 or dateToCheck.day == 31) ) then
    returnValue = false
  end

  -- Långfredag
  easterDay = Holidays_CalculateEaster(dateToCheck.year)
  if ( easterDay[1] == dateToCheck.year and easterDay[2] == dateToCheck.month and easterDay[3] == dateToCheck.day ) then
    returnValue = false
  end
  -- AnnandagPåsk
  easterDay2 = os.date("*t", os.time({year = easterDay[1], month = easterDay[2], day = easterDay[3]})+3*24*60*60)
  if ( easterDay2.year == dateToCheck.year and easterDay2.month == dateToCheck.month and easterDay2.day == dateToCheck.day ) then
    returnValue = false
  end
  -- Kristihimmelfärdsdag? +41 dagar från Långfredag?
  datum3 = os.date("*t", os.time({year = easterDay[1], month = easterDay[2], day = easterDay[3]})+41*24*60*60)
  if ( datum3.year == dateToCheck.year and datum3.month == dateToCheck.month and datum3.day == dateToCheck.day ) then
    returnValue = false
  end
  -- hitta midsommardagen för att kunna kontrollera midsommarafton
  -- midsommardagen = den lördag som infaller under tiden den 20-26 juni -> midsommarafton bör vara den fredag som inträffar under tiden 19-25 juni
  if ( dateToCheck.month == 6 and (dateToCheck.day >= 19 and dateToCheck.day <= 25) and dateToCheck.wday == 6 ) then
    returnValue = false
  end
           
  if ( Vacation_Days(dateToCheck) ) then
    returnValue = false
  end
     
  return returnValue
end

if WorkDay(os.date("*t")) then
  fibaro:setGlobal("WorkToday","True");
else
  fibaro:setGlobal("WorkToday","False");
end

if WorkDay(os.date("*t", os.time()+24*60*60)) then
  fibaro:setGlobal("WorkTomorrow","True");
else
  fibaro:setGlobal("WorkTomorrow","False");
end

