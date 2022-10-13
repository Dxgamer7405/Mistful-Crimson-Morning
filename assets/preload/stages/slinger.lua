-- Camera Shit (Useful for the stuff which happens in game)
function onUpdate()
	if mustHitSection then
		triggerEvent('Camera Follow Pos', '105', '-60')
		doTweenZoom('asf', 'camGame', 0.65, 1, 'cubeOut')
		setProperty('defaultCamZoom', 0.65)
	else
		triggerEvent('Camera Follow Pos', '-112', '-250')
		doTweenZoom('asf', 'camGame', 0.75, 1, 'cubeOut')
		setProperty('defaultCamZoom', 0.75)
	end
end

-- Stage Stuff
function onCreate()
	makeLuaSprite('sky','mcm/stages/slinger/sky', -1037, -780)
	makeLuaSprite('mountains','mcm/stages/slinger/mountains', -1037, -780)
	makeLuaSprite('road','mcm/stages/slinger/road', -1037, -780)
	makeLuaSprite('glow','mcm/stages/slinger/glow', -1037, -780)

	addLuaSprite('sky', false);
	addLuaSprite('mountains', false);
	addLuaSprite('road', false);
	addLuaSprite('glow', true);	
end