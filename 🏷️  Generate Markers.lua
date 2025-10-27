-- --------------------------------------------------------------------------------
-- Get this directorys absolute path
local infoSource = debug.getinfo(1, 'S').source
local workingDirectory = infoSource:match('@(.*[\\/])')

-- Add workingDirectory to the package lookup
package.path = workingDirectory .. "?.lua;" .. package.path


-- --------------------------------------------------------------------------------
local Details = require('scripts/classes/static/Details')
if (Details == nil) then return end
local Env = require('scripts/classes/static/Env')
local Path = require('scripts/classes/Path')

print(string.rep('-', 80))
print('-- Generate Markers')
print('Executing: ' .. '"' .. string.gsub(tostring(Path:new(workingDirectory)), 'Users/(.-)/AppData', 'Users/########/AppData') .. '"')
print('Date/Time: ' .. os.date("%Y-%m-%d, %H:%M:%S"))
print()


-- --------------------------------------------------------------------------------
require('scripts/markersClear')()
require('scripts/markersConvert')()
print()
print()
