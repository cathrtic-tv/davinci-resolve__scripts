-- --------------------------------------------------------------------------------
local Details = require('scripts/classes/static/Details')
local Path = require('scripts/classes/Path')
local json = require('dkjson')


-- --------------------------------------------------------------------------------
local function exportTimestamps(outputPath)
    local outputTable = {}
    local timelineMarkers = Details.timeline:GetMarkers()

    -- Order Markers by frame
    local frames = {}
    for frame, _ in pairs(timelineMarkers) do
        table.insert(frames, frame)
    end
    table.sort(frames)

    -- Export each marker's timestamp
    for _, frame in ipairs(frames) do
        local marker = timelineMarkers[frame]
        if (marker.color ~= 'Cream') then goto continue end

        local startTotalSeconds = (frame / Details.fps) + 3600

        table.insert(outputTable, {
            text = marker.name,

            startHours = math.floor(startTotalSeconds / 3600),
            startMinutes = math.floor((startTotalSeconds % 3600) / 60),
            startSeconds = math.floor(startTotalSeconds % 60),
            startMilliseconds = math.floor((startTotalSeconds % 1) * 1000),
        })
        ::continue::
    end

    -- Write JSON to file
    local keyorder = {
        'text',
        'startHours', 'startMinutes', 'startSeconds', 'startMilliseconds',
        'endHours', 'endMinutes', 'endSeconds', 'endMilliseconds'
    }
    local outputJson = json.encode(outputTable, { indent = true, keyorder = keyorder })
    local outputFile = io.open(tostring(Path:new(outputPath, 'timestamps.json')), 'w')
    outputFile:write(outputJson)
    outputFile:close()

    print('Exported: "timestamps.json"')
end


-- --------------------------------------------------------------------------------
return exportTimestamps
