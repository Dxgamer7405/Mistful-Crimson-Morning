-- Camera Stuff
function onUpdate()
	if mustHitSection then
		triggerEvent('Camera Follow Pos', '850', '350')
	else
		triggerEvent('Camera Follow Pos', '420', '250')
	end
end

-- Stage Stuff
function onCreate()
	makeLuaSprite('sky', 'mcm/stages/outside/sky', -700,-400);
	makeLuaSprite('hills', 'mcm/stages/outside/hills', -700,-400);
	makeLuaSprite('ground', 'mcm/stages/outside/ground', -700,-400);

	setScrollFactor('sky', 0.5, 0.5);
	setScrollFactor('hills', 0.8, 0.8);

	addLuaSprite('sky', false);
	addLuaSprite('hills', false);
	addLuaSprite('ground', false);
end