local inPerfectZone = false
local fadeSpeed = 1

function onCreate()
    makeLuaText('perfectZoneText', 'Perfect Zone', 0, screenWidth - 250, 10)
    setTextSize('perfectZoneText', 30)
    setTextColor('perfectZoneText', 'FF0000') 
    setProperty('perfectZoneText.alpha', 0)  
    addLuaText('perfectZoneText')
	setObjectCamera('perfectZoneText', 'other')
end

function onStepHit()
    if (curStep >= 1023 and curStep <= 1151) or
       (curStep >= 1440 and curStep <= 1663) or
       (curStep >= 2432 and curStep <= 2686) or
       (curStep >= 3584 and curStep <= 3968) then
        inPerfectZone = true
    else
        inPerfectZone = false
    end
end

function onUpdate(elapsed)
    if inPerfectZone then
        setProperty('perfectZoneText.alpha', math.min(1, getProperty('perfectZoneText.alpha') + fadeSpeed * elapsed))
    else
        setProperty('perfectZoneText.alpha', math.max(0, getProperty('perfectZoneText.alpha') - fadeSpeed * elapsed))
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if inPerfectZone then
        setProperty('health', -1) 
    end
end

