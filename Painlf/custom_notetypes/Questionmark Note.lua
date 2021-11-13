function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Questionmark Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'QUESTIONMARKNOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
local healthDrain = 0;
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Questionmark Note' then
		-- health loss | || || |_
		--setProperty('health', getProperty('health') - 50.0);
		healthDrain = healthDrain + 0.6;
		setProperty('health', getProperty('health') - 0.6);
	end
end

function onUpdate(elapsed)
	if healthDrain > 0 then
		healthDrain = healthDrain - 0.0 * elapsed;
		setProperty('health', getProperty('health') - 0.1 * elapsed);
		if healthDrain < 0 then
			healthDrain = 0;
		end
	end
end