-- --------------------------------------------------------------------------------
local Details = require('scripts/classes/static/Details')
local Path = require('scripts/classes/Path')
local json = require('dkjson')


-- --------------------------------------------------------------------------------
local function exportSubtitles(outputPath)
    -- Export each subtitle track
    for i = 1, Details.timeline:GetTrackCount('subtitle'), 1 do
        local name = string.lower(Details.timeline:GetTrackName('subtitle', i))
        local items = Details.timeline:GetItemListInTrack('subtitle', i)

        if (name == 'subtitle 1' or name == 'english') then
            name = ''
        else
            name = '.' .. string.gsub(name, ' ', '')
        end

        -- Create output table
        local outputTable = {}
        for _, item in ipairs(items) do
            local startTotalSeconds = item:GetStart() / Details.fps
            local endTotalSeconds = item:GetEnd() / Details.fps

            table.insert(outputTable, {
                text = item:GetName(),

                startHours = math.floor(startTotalSeconds / 3600),
                startMinutes = math.floor((startTotalSeconds % 3600) / 60),
                startSeconds = math.floor(startTotalSeconds % 60),
                startMilliseconds = math.floor((startTotalSeconds % 1) * 1000),
                endHours = math.floor(endTotalSeconds / 3600),
                endMinutes = math.floor((endTotalSeconds % 3600) / 60),
                endSeconds = math.floor(endTotalSeconds % 60),
                endMilliseconds = math.floor((endTotalSeconds % 1) * 1000),
            })
        end

        -- Write JSON to file
        local keyorder = {
            'text',
            'startHours', 'startMinutes', 'startSeconds', 'startMilliseconds',
            'endHours', 'endMinutes', 'endSeconds', 'endMilliseconds'
        }
        local outputJson = json.encode(outputTable, { indent = true, keyorder = keyorder })
        local outputFile = io.open(tostring(Path:new(outputPath, 'subtitles' .. name .. '.json')), 'w')
        outputFile:write(outputJson)
        outputFile:close()

        print('Exported: "' .. Details.timeline:GetTrackName('subtitle', i) .. '", as "subtitles' .. name .. '.json"')
    end
end


-- --------------------------------------------------------------------------------
return exportSubtitles
