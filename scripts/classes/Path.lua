-- --------------------------------------------------------------------------------
local Path = {
    segments = {},
}
Path.__index = Path


-- --------------------------------------------------------------------------------
-- Create new Path instance
function Path:new(...)
    local obj = {}
    setmetatable(obj, self)

    -- Avoid sharing prototype table
    obj.segments = {}

    -- Add segments
    for _, input in pairs({ ... }) do
        if (getmetatable(input) == Path) then
            for _, segment in ipairs(input.segments) do
                table.insert(obj.segments, segment)
            end
        elseif (type(input) == 'table') then
            for _, segment in ipairs(input) do
                table.insert(obj.segments, segment)
            end
        else
            for segment in tostring(input):gmatch('[^/\\]+') do
                table.insert(obj.segments, segment)
            end
        end
    end

    return obj
end

-- Convert Path to string
function Path:__tostring()
    return table.concat(self.segments, '/')
end


-- --------------------------------------------------------------------------------
return Path
