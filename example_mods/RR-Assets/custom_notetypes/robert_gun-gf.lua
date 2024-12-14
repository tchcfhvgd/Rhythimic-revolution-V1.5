function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'robert_gun-gf' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'robert_gun_note');
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			end
		end
	end
end


function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'robert_gun-gf' then
	    rob_gun()
		triggerEvent('Play Animation', 'dodge', 1);
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'robert_gun-gf' then
     	rob_gun()
		triggerEvent('Play Animation', 'singUPmiss', 1);
		playSound('robert_gun_impact', 1);
		health = getProperty('health')
        setProperty('health', health- 0.4);
	end
end

function rob_gun()
    triggerEvent('Play Animation', 'gun', 2);
	gun_sound_random = getRandomInt(1, 4);
	playSound('robert_gun_' .. gun_sound_random, 0.8);
end