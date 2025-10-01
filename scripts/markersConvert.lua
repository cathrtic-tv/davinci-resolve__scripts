-- --------------------------------------------------------------------------------
local Details = require('scripts/classes/static/Details')
local Env = require('scripts/classes/static/Env')


-- --------------------------------------------------------------------------------
local markerColors = {
    'Blue', 'Cyan', 'Green', 'Yellow', 'Red', 'Pink', 'Purple', 'Fuchsia', 'Rose', 'Lavender', 'Sky', 'Mint', 'Lemon', 'Sand', 'Cocoa', 'Cream',
}


-- --------------------------------------------------------------------------------
local function markersConvert()
    local toConvert = {}
    local timelineMarkers = Details.timeline:GetMarkers()

    -- Loop through every track
    for _, trackType in ipairs({'audio', 'video', 'subtitle'}) do
        for i = 1, Details.timeline:GetTrackCount(trackType), 1 do
            local name = string.lower(Details.timeline:GetTrackName(trackType, i))
            local items = Details.timeline:GetItemListInTrack(trackType, i)

            -- Loop through every item in track
            for _, item in ipairs(items) do
                local itemFrameTrueStart = item:GetStart() - (item:GetLeftOffset() or 0) - (3600 * Details.fps)
                local itemFrameStart = item:GetStart() - (3600 * Details.fps)
                local itemFrameEnd = item:GetEnd() - (3600 * Details.fps)

                -- Loop through every marker in item
                for frame, marker in pairs(item:GetMarkers()) do
                    if (marker.name:sub(1, 3) == '## ') then
                        local markerFrame = itemFrameTrueStart + frame

                        -- Check if marker is within item range, and not already taken
                        if (markerFrame >= itemFrameStart) and (markerFrame <= itemFrameEnd) then
                            while (timelineMarkers[markerFrame] ~= nil) do
                                markerFrame = markerFrame - 1
                            end
                            toConvert[markerFrame] = marker.name
                        end
                    end
                end
            end
        end
    end

    -- Convert markers
    local count = 0
    for frame, name in pairs(toConvert) do
        name = string.upper(name)
        local color = 'Blue'
        local notes = ''

        for _, markerColor in ipairs(markerColors) do
            local colorKey = 'MARKERS_' .. string.upper(markerColor)
            local found = false

            for _, label in ipairs(Env[colorKey]) do
                label = '## ' .. string.upper(label)
                if (label == name) then
                    found = true
                    color = markerColor
                    break
                end
            end
            if (found) then break end

            for _, label in ipairs(Env[colorKey .. '_ALT']) do
                label = '## ' .. string.upper(label)
                if (label == name) then
                    found = true
                    color = markerColor
                    notes = '...'
                    break
                end
            end
            if (found) then break end
        end

        Details.timeline:AddMarker(frame, color, name, notes, 1)
        count = count + 1
    end

    print('Markers Converted: ' .. count)
end


-- --------------------------------------------------------------------------------
return markersConvert
