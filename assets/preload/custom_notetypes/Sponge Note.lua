function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Sponge Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'note/SpongeNotes');
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

local healthDrain = 0;
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Sponge Note' then	
	playSound('spongeHit', 100);	
	setProperty('health', 2.0);
	end
end