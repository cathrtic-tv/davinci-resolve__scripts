-- --------------------------------------------------------------------------------
local Env = {
    OUTPUT_PATH = '',
    MARKERS_BLUE = {},
    MARKERS_CYAN = {},
    MARKERS_GREEN = {},
    MARKERS_YELLOW = {},
    MARKERS_RED = {},
    MARKERS_PINK = {},
    MARKERS_PURPLE = {},
    MARKERS_FUCHSIA = {},
    MARKERS_ROSE = {},
    MARKERS_LAVENDER = {},
    MARKERS_SKY = {},
    MARKERS_MINT = {},
    MARKERS_LEMON = {},
    MARKERS_SAND = {},
    MARKERS_COCOA = {},
    MARKERS_CREAM = {},
    MARKERS_BLUE_ALT = {},
    MARKERS_CYAN_ALT = {},
    MARKERS_GREEN_ALT = {},
    MARKERS_YELLOW_ALT = {},
    MARKERS_RED_ALT = {},
    MARKERS_PINK_ALT = {},
    MARKERS_PURPLE_ALT = {},
    MARKERS_FUCHSIA_ALT = {},
    MARKERS_ROSE_ALT = {},
    MARKERS_LAVENDER_ALT = {},
    MARKERS_SKY_ALT = {},
    MARKERS_MINT_ALT = {},
    MARKERS_LEMON_ALT = {},
    MARKERS_SAND_ALT = {},
    MARKERS_COCOA_ALT = {},
    MARKERS_CREAM_ALT = {},
}


-- --------------------------------------------------------------------------------
-- Selects contents inside whitespaces
local function trim(s)
    s = s:gsub('^%s*(.-)%s*$', '%1')
    return s
end

-- Selects contents inside "s and 's
local function removeQuotes(s)
    s = s:gsub('^"(.*)"$', '%1')
    s = s:gsub("^'(.*)'$", '%1')
    return s
end

-- Removes inline comments
local function removeComments(s)
    s = s:gsub('%s*#.*$', '')
    return s
end


-- --------------------------------------------------------------------------------
-- Get workingDirectory
local workingDirectory = package.path:match('^[^;]+')
workingDirectory = string.gsub(workingDirectory, '%?.lua', '')

-- Read .env file
for line in io.lines(workingDirectory .. '.env') do
    -- Windows CRLF fix
    line = line:gsub('\r$', '')

    -- Skip comments and empty lines
    local commentOrEmpty = (line:match('^%s*#') or line:match('^%s*$'))    
    if (not commentOrEmpty) then

        local key, value = line:match('^%s*([%w_]+)%s*=%s*(.+)%s*$')
        value = removeComments(value)

        -- If array
        local arrayContents = value:match('^%[(.*)%]$')
        if (arrayContents) then
            local array = {}
            for arrayItem in arrayContents:gmatch('([^,]+)') do
                arrayItem = removeQuotes(trim(arrayItem))
                table.insert(array, arrayItem)
            end
            Env[key] = array

        -- Else single value
        else
            value = removeQuotes(trim(value))
            Env[key] = value
        end
    end
end


-- --------------------------------------------------------------------------------
return Env
