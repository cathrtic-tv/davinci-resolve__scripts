-- --------------------------------------------------------------------------------
local Details = require('scripts/classes/static/Details')
local Path = require('scripts/classes/Path')


-- --------------------------------------------------------------------------------
local function exportThumbnails(outputPath)
    local timelineMarkers = Details.timeline:GetMarkers()
    local originalTimecode = Details.timeline:GetCurrentTimecode()

    -- Order Markers by frame
    local frames = {}
    for frame, _ in pairs(timelineMarkers) do
        table.insert(frames, frame)
    end
    table.sort(frames)

    -- Export each marker's timestamp
    for _, frame in ipairs(frames) do
        local marker = timelineMarkers[frame]
        if (marker.color ~= 'Cocoa') then goto continue end

        local startTotalSeconds = (frame / Details.fps) + 3600

        local startHours = string.format('%02d', math.floor(startTotalSeconds / 3600))
        local startMinutes = string.format('%02d', math.floor((startTotalSeconds % 3600) / 60))
        local startSeconds = string.format('%02d', math.floor(startTotalSeconds % 60))
        local startFrame = string.format('%02d', math.floor((startTotalSeconds % 1) * Details.fps))

        local timecode = startHours .. ':' .. startMinutes .. ':' .. startSeconds .. ':' .. startFrame
        local timecodeFormatted = startHours .. '-' .. startMinutes .. '-' .. startSeconds .. '-' .. startFrame

        local markerName = marker.name
        if (markerName == 'Unknown Color Marker' or markerName == '') then
            markerName = 'FRAME STILL'
        end
        markerName = string.gsub(markerName, '^## ', '')
        markerName = markerName .. ' ' .. timecodeFormatted .. '.png'

        Details.timeline:SetCurrentTimecode(timecode)
        Details.project:ExportCurrentFrameAsStill(tostring(Path:new(outputPath, markerName)))

        print('Exported: "' .. markerName .. '"')
        ::continue::
    end

    Details.timeline:SetCurrentTimecode(originalTimecode)
end


-- --------------------------------------------------------------------------------
return exportThumbnails
