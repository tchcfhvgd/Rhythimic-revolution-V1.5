local customSplashFile = 'RRSplash'

function onCountdownStarted()
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
		setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.disabled', true)
    end
end

function onCreatePost()
    setProperty('iconP1.x', 500)
	setProperty('iconP2.x', 50)
	
	setProperty('iconP1.y', 500)
	setProperty('iconP2.y', 50)
	
	setTextFont('scoreTxt', 'JalnanGothicTTF.ttf')
	setTextFont('timeTxt', 'JalnanGothicTTF.ttf')
	
	setProperty('noteSplashTexture', customSplashFile)
	
end

function onUpdatePost()
    setProperty('healthBar.angle', 90)
	setProperty('healthBar.x', 930)
	setProperty('healthBar.y', 350)

	--setProperty('iconP1.y', 600)
	--setProperty('iconP2.y', 0)
	
	setProperty('iconP1.x', 1150)
	setProperty('iconP2.x', 1150)
	
	local health = getProperty('health')
	
	setProperty('iconP1.y', 300 - (300 * (health - 1) - 50) )
    setProperty('iconP2.y', 300 - (300 * (health - 1) + 50 ) )
end