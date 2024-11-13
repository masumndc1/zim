--  -*- mode: lua -*-
--
-- The following Lua code is adapted from ``Calendrical Calculations'' by Nachum
-- Dershowitz and Edward M. Reingold, Software---Practice & Experience,
-- vol. 20, no. 9 (September, 1990), pp. 899--928 and from
-- ``Calendrical Calculations, II: Three Historical Calendars'' by Edward M.
-- Reingold,  Nachum Dershowitz, and Stewart M. Clamen, Software---Practice
-- \& Experience, vol. 23, no. 4 (April, 1993), pp. 383--404.

-- safe for lua 5.1 (12 Sep 2006)

local mod = math.mod
local floor = math.floor

-- is year a leap year?
local function leap_year(year)
  if mod(year, 4) == 0 then
    local m = mod(year, 400)
    return not (m == 100 or m == 200 or m == 300)
  else
    return false
  end
end

local month_lengths = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }

--  Last day in Gregorian $month$ during $year$.
local function last_day_of_gregorian_month (month, year)
  if month == 2 and leap_year(year) then
    return 29
  else
    return month_lengths[month]
  end
end

-- how many days in the year before the given month?
local function days_before_month(m, y)
  local s = 0
  for i = 1, m-1 do
    s = s + last_day_of_gregorian_month(i, y)
  end
  return s
end

-- return date as days since epoch
-- N.B. day of week (0-origin) is days mod 7
-- may be called by afg(mm, dd, yyyy) or
-- by afg { month = mm, day = dd, year = yyyy }
local function absolute_from_gregorian (month, day, year)
  if type(month) == "table" then
    year = month.year
    day = month.day
    month = month.month
  end
  return day +  	        -- Days so far this month.
         days_before_month(month, year) +
                             	-- Days in prior months this year.
         365 * (year - 1) + 	-- Days in prior years.
         floor((year - 1) / 4)        + 	-- Julian leap days in prior years...
       (-                    	-- ...minus prior century years...
        floor((year-1) / 100))      + 	-- ...plus prior years divisible...
        floor((year-1) / 400)   	-- ...by 400.
end

-- given days since epoch, return table with month, day, year
local function gregorian_from_absolute (adate)
	-- Gregorian (month day year) corresponding absolute $adate$.
  local year = floor(adate / 366)
  while adate >= absolute_from_gregorian(1, 1, year+1) do
    year = year + 1
  end
  local month = 1
  while adate > absolute_from_gregorian(month,
			last_day_of_gregorian_month(month, year), year) do
    month = month + 1
  end
  local day = adate + 1 - absolute_from_gregorian(month, 1, year)
  return { month = month, day = day, year = year }
end

-- some other functions
local function Kday_on_or_before (adate, k)
	-- Absolute date of the $k$day on or before $date$.
	-- $k=1$ means Sunday, $k=2$ means Monday, and so on.
  return adate - mod(adate - k - 1, 7)
end

local function Nth_Kday (n,  k,  month, year)
	-- Absolute date of the $n$th $k$day in Gregorian $month$, $year$.
	-- If $n$<0, the $n$th $k$day from the end of month is returned
	-- (that is, -1 is the last $k$day, -2 is the penultimate $k$day,
	-- and so on).  $k=1$ means Sunday, $k=2$ means Monday, and so on.
  if n > 0 then
    return Kday_on_or_before(            	-- First $k$day in month.
          absolute_from_gregorian(month, 7, year), k) +
         7* (n-1)
                  	-- Advance $n-1$ $k$days.
  else
    return
    Kday_on_or_before(             	-- Last $k$day in month.
        absolute_from_gregorian(month, last_day_of_gregorian_month(month, year),
                 year), k)
         + 7 * (n+1)               	-- Go back $-n-1$ $k$days.
     end
end

local function labor_day (year)
	-- Absolute date of American Labor Day in Gregorian $year$.
  return Nth_Kday(1, 2, 9, year)	-- First Monday in September.
end

local function memorial_day (year)
	-- Absolute date of American Memorial Day in Gregorian $year$.
  return Nth_Kday(-1, 2, 5, year)	-- Last Monday in May.
end

local function daylight_savings_start (year)
	-- Absolute date of the start of American daylight savings time
	-- in Gregorian $year$.
  return Nth_Kday (1, 1, 4, year)	-- First Sunday in April.
end
local function daylight_savings_end (year)
	-- Absolute date of the end of American daylight savings time
	-- in Gregorian $year$.
  return Nth_Kday(-1, 1, 10, year)	-- Last Sunday in October.
end

-- convert date to string in American style
local function datestring(d)
  if type(d) == 'number' then
    d = gregorian_from_absolute(d)
  end
  if type(d) == 'table' then
    return d.month .. "/" .. d.day .. "/" .. d.year
  else
    error("unable to produce datestring from " .. tostring(d))
  end
end

-- parse date string in American style
local function parse_mmddyyyy(s)
  local _, _, m, d, y = string.find(s, '^(%d+)/(%d+)/(%d+)$')
  if m and d and y then
    return { month = m, day = d, year = y }
  else
    return nil, "date string " .. s .. " would not parse"
  end
end

local days = {"Sunday", "Monday", "Tuesday",
  "Wednesday", "Thursday", "Friday", "Saturday"}

local months = { "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December" }


-- return day-of-week name from absolute number
local function dow(d)
  return days[1 + mod(d, 7)]
end


cal = cal or { }
cal.gregorian_from_absolute = gregorian_from_absolute
cal.absolute_from_gregorian = absolute_from_gregorian
cal.datestring = datestring
cal.parse = parse_mmddyyyy
cal.dow = dow
cal.days = days
cal.months = months
cal.daylight_savings_start = daylight_savings_start
cal.daylight_savings_end = daylight_savings_end

return cal
