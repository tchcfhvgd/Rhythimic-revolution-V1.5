function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'crimson_gun' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'robert_gun_note');
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			end
		end
	end
end


function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'crimson_gun' then
		triggerEvent('Play Animation', 'gun', 1);
		triggerEvent('Play Animation', 'hurt', 0);
		setProperty('health', 2);
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'crimson_gun' then
		triggerEvent('Play Animation', 'singUPmiss', 1);
        setProperty('health', 0);
	end
end