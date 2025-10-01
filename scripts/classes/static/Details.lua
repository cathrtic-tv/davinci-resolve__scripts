-- --------------------------------------------------------------------------------
local projectManager = resolve:GetProjectManager()
local project = projectManager:GetCurrentProject()
local timeline = project:GetCurrentTimeline()
local Path = require('scripts/classes/Path')


-- --------------------------------------------------------------------------------
local Details = {
    name = project:GetName(),
    fps = timeline:GetSetting('timelineFrameRate'),
    project = project,
    timeline = timeline,
    path = Path:new(),
}


-- --------------------------------------------------------------------------------
-- Validate project exists in current folder
local found = false
project:SetName(Details.name .. ' #📜')
for _, folderProject in ipairs(projectManager:GetProjectListInCurrentFolder()) do
    if (folderProject == (Details.name .. ' #📜')) then
        found = true
        break
    end
end
project:SetName(Details.name)

if (not found) then
    print('Project NOT FOUND in Project Manager')
    print()
    print()
    return nil
end


-- If found, traverse to root and back
repeat
    local folder = projectManager:GetCurrentFolder()
    if (folder ~= '') then
        Details.path = Path:new(folder, Details.path)
    end
until (not projectManager:GotoParentFolder())

for _, folder in ipairs(Details.path.segments) do
    projectManager:OpenFolder(folder)
end

Details.path = Path:new(Details.path, Details.name)


-- --------------------------------------------------------------------------------
return Details
