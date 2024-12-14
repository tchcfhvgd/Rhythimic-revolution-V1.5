local baseHealthDrainRate = 0.5
local intensity = 0
local intensityDirection = 1
local targetAlpha = 0
local currentAlpha = 0
local alphaSpeed = 5
local shakeIntensity = 0
local intensityLocked = false

function onCreate()
    makeLuaText('intensityMeter', 'Intensity: 0%', 0, 10, 10)
    setTextSize('intensityMeter', 20)
    setTextColor('intensityMeter', 'FFFFFF')
    addLuaText('intensityMeter')
	setTextFont('intensityMeter', 'Jalnan.ttf')
	setObjectCamera('intensityMeter', 'other')
    
    makeLuaSprite('intensityOverlay', '', 0, 0)
    makeGraphic('intensityOverlay', screenWidth, screenHeight, 'FF0000')
    setObjectCamera('intensityOverlay', 'hud')
    setProperty('intensityOverlay.alpha', 0)
    addLuaSprite('intensityOverlay', true)
    
    makeLuaSprite('darkeningOverlay', '', 0, 0)
    makeGraphic('darkeningOverlay', screenWidth, screenHeight, '000000')
    setObjectCamera('darkeningOverlay', 'hud')
    setProperty('darkeningOverlay.alpha', 0)
    addLuaSprite('darkeningOverlay', true)
end

function onUpdate(elapsed)
    if intensity > 50 then
        shakeIntensity = (intensity / 500) * 10 
        local shakeX = math.random(-shakeIntensity, shakeIntensity)
        local shakeY = math.random(-shakeIntensity, shakeIntensity)
        setProperty('camHUD.x', shakeX)
        setProperty('camHUD.y', shakeY)
        setProperty('camGame.x', shakeX)
        setProperty('camGame.y', shakeY)
    else
        setProperty('camHUD.x', 0)
        setProperty('camHUD.y', 0)
        setProperty('camGame.x', 0)
        setProperty('camGame.y', 0)
    end

    setTextString('intensityMeter', 'Intensity: ' .. math.floor(intensity) .. '%')

    if intensityDirection == 1 then
        local intensityNormalized = intensity / 100
        local healthDrainRate = intensityNormalized * baseHealthDrainRate

        local currentHealth = getProperty('health')
        if currentHealth > 0.01 then
            setProperty('health', math.max(0.01, currentHealth - healthDrainRate * elapsed))
        end

        if math.floor(intensity) % 2 == 0 then
            setTextColor('intensityMeter', 'FF0000')
        else
            setTextColor('intensityMeter', 'FFFFFF')
        end

        targetAlpha = intensityNormalized * 0.4 
    else
        targetAlpha = 0
    end

    currentAlpha = math.lerp(currentAlpha, targetAlpha, alphaSpeed * elapsed)
    setProperty('intensityOverlay.alpha', currentAlpha)
    setProperty('darkeningOverlay.alpha', currentAlpha * 0.7) 

    local noteColorValue = 255 - (intensity * 2.55)
    local noteColorHex = string.format("%02X%02X%02X", noteColorValue, noteColorValue, noteColorValue)
    setProperty('notesColor', noteColorHex)

    moveHUD(intensityNormalized)
end

function math.lerp(a, b, t)
    return a + (b - a) * t
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if not intensityLocked then
        intensity = math.min(100, intensity + 0.4)
        if intensity >= 100 then
            intensityLocked = true
            intensityDirection = -1 
        end
    end
end

function onUpdatePost(elapsed)
    if intensityLocked then
        intensity = math.max(0, intensity - 20 * elapsed) 
        if intensity <= 0 then
            intensityLocked = false 
            intensityDirection = 1 
        end
    end
end

function onBeatHit()
    local zoomAmount = 0.02 + (intensity / 100) * 0.08 
    setProperty('camGame.zoom', getProperty('camGame.zoom') + zoomAmount)
    setProperty('camHUD.zoom', getProperty('camHUD.zoom') + zoomAmount)
end








