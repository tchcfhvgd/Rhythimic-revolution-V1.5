function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'benjamin-knife' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'lightdown_note');
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			end
		end
	end
end


function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'benjamin-knife' then
	    rob_gun()
		triggerEvent('Play Animation', 'dodge', 1);
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'benjamin-knife' then
     	rob_gun()
		triggerEvent('Play Animation', 'singUPmiss', 1);
		playSound('robert_gun_impact', 1);
		health = getProperty('health')
        setProperty('health', health-1);
	end
end

function rob_gun()
    anim_random = getRandomInt(0, 1);
	if anim_random == 0 then
    triggerEvent('Play Animation', 'attack1', 0);
	else
	triggerEvent('Play Animation', 'attack2', 0);
	end
	
	
	gun_sound_random = getRandomInt(0.7, 1);
	playSound('mitori_slash', random);
end