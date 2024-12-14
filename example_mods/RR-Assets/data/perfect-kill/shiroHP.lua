local baseHealthDrainRate = 0.05
local desiccationy = 0
local canDecreaseDesiccationy = false
local maxHealthLost = 0
local initialHealth = 500 
local mechanicsActive = false

function onCreate()
    makeLuaText('desiccationyMeter', 'Desiccationy: 0%', 0, 10, 10)
    setTextSize('desiccationyMeter', 20)
    setTextColor('desiccationyMeter', 'FFFFFF')
    addLuaText('desiccationyMeter')
    setProperty('desiccationyMeter.alpha', 0)
	setObjectCamera('desiccationyMeter', 'other')
end

function onCreatePost()
    initialHealth = 500
    setProperty('health', initialHealth)
end

function onUpdate(elapsed)
    if mechanicsActive then
        local textAlpha = math.lerp(getProperty('desiccationyMeter.alpha'), 1, 2 * elapsed)
        setProperty('desiccationyMeter.alpha', textAlpha)

        setTextString('desiccationyMeter', 'Desiccationy: ' .. math.floor(desiccationy) .. '%')

        if desiccationy < 100 and not canDecreaseDesiccationy then
            desiccationy = math.min(100, desiccationy + 10 * elapsed)
        end

        if desiccationy >= 100 then
            canDecreaseDesiccationy = true
            local desiccationyNormalized = desiccationy / 100
            local healthDrainRate = desiccationyNormalized * baseHealthDrainRate * elapsed

            local currentHealth = getProperty('health')
            if currentHealth > 0.01 then
                setProperty('health', math.max(0.01, currentHealth - healthDrainRate))
                maxHealthLost = math.max(maxHealthLost, initialHealth - currentHealth)
            end

            targetAlpha = desiccationyNormalized * 0.4
        else
            targetAlpha = 0
        end

        if desiccationy <= 0 then
            desiccationy = 0
            canDecreaseDesiccationy = false
        end
    end
end

function math.lerp(a, b, t)
    return a + (b - a) * t
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if mechanicsActive and canDecreaseDesiccationy then
        desiccationy = math.max(0, desiccationy - 4) 
    end
end

function onUpdatePost(elapsed)
    if mechanicsActive then
        local currentHealth = getProperty('health')
        if currentHealth > initialHealth - maxHealthLost then
            setProperty('health', initialHealth - maxHealthLost)
        end
    end
end

function onStepHit()
    if curStep == 512 then
        mechanicsActive = true
    end
end