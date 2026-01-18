-- --------------------------------------------------------------------------------
-- Get this directory's absolute path
local infoSource = debug.getinfo(1, 'S').source
local workingDirectory = infoSource:match('@(.*[\\/])')

-- Add workingDirectory to the package lookup
package.path = workingDirectory .. '?.lua;' .. package.path


-- --------------------------------------------------------------------------------
local Details = require('scripts/classes/static/Details')
if (Details == nil) then return end
local Env = require('scripts/classes/static/Env')
local Path = require('scripts/classes/Path')

print(string.rep('-', 80))
print('-- Export Thumbnails')
print('Executing: ' .. '"' .. tostring(Path:new(workingDirectory)) .. '"')
print('Date/Time: ' .. os.date("%Y-%m-%d, %H:%M:%S"))
print()


-- --------------------------------------------------------------------------------
local outputPath = Path:new(Env.OUTPUT_PATH, Details.path)
print('Output Path: ' .. '"' .. tostring(outputPath) .. '"')

require('scripts/exportThumbnails')(Path:new(outputPath, 'Thumbnail'))
print()
print()
