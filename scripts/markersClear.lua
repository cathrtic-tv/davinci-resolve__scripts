-- --------------------------------------------------------------------------------
local Details = require('scripts/classes/static/Details')


-- --------------------------------------------------------------------------------
local function markersClear()
    local count = 0

    -- Clear markers from timeline
    for frame, marker in pairs(Details.timeline:GetMarkers()) do
        if (marker.name:sub(1, 3) == '## ') then
            Details.timeline:DeleteMarkerAtFrame(frame)
            count = count + 1
        end
    end

    print('Markers Cleared: ' .. count)
end


-- --------------------------------------------------------------------------------
return markersClear
