
local minSpeed = 0.3
local maxSpeed = 1.1
local minSpeedReduced = 0.6
local maxSpeedReduced = 0.8

local effectApplied = false
local effectIntensity = 0

function onCreatePost()
    effectApplied = false
end

function onUpdate(elapsed)
    local curStep = getProperty('curStep')

    if curStep >= 191 and curStep <= 319 then
        if not effectApplied or effectIntensity ~= 1 then
            applyNoteSpeed(minSpeed, maxSpeed)
            effectIntensity = 1
            effectApplied = true
        end
    elseif curStep >= 320 and curStep <= 447 then
        if not effectApplied or effectIntensity ~= 0.5 then
            applyNoteSpeed(minSpeedReduced, maxSpeedReduced)
            effectIntensity = 0.5
            effectApplied = true
        end
    elseif curStep >= 639 and curStep <= 767 then
        if not effectApplied or effectIntensity ~= 1 then
            applyNoteSpeed(minSpeed, maxSpeed)
            effectIntensity = 1
            effectApplied = true
        end
    elseif curStep >= 960 and curStep <= 1344 then
        if not effectApplied or effectIntensity ~= 1 then
            applyNoteSpeed(minSpeed, maxSpeed)
            effectIntensity = 1
            effectApplied = true
        end
    else
        if effectApplied then
            applyNoteSpeed(1, 1) 
            effectIntensity = 0
            effectApplied = false
        end
    end
end

function applyNoteSpeed(minSpeed, maxSpeed)
    for i = 0, getProperty("unspawnNotes.length")-1 do
        if not getPropertyFromGroup("unspawnNotes", i, "isSustainNote") then
            local speed = getRandomFloat(minSpeed, maxSpeed)
            setPropertyFromGroup("unspawnNotes", i, "multSpeed", speed)
        else
            setPropertyFromGroup("unspawnNotes", i, "multSpeed", getPropertyFromGroup("unspawnNotes", i, "parent.multSpeed"))
        end
    end
end



