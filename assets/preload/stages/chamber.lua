-- Middlescroll Shit
function onCreatePost()

	noteTweenX('byearrows1', 0, -200, 0.01, 'linear')
        noteTweenX('byearrows2', 1, -200, 0.01, 'linear')
        noteTweenX('byearrows3', 2, -200, 0.01, 'linear')
        noteTweenX('byearrows4', 3, -200, 0.01, 'linear')
	noteTweenX('middletime1', 4, 414, 0.01, 'linear')
        noteTweenX('middletime2', 5, 527, 0.01, 'linear')
        noteTweenX('middletime3', 6, 637, 0.01, 'linear')
        noteTweenX('middletime4', 7, 750, 0.01, 'linear')
end

-- Camera Stuff
function onUpdate()
	if mustHitSection then
		triggerEvent('Camera Follow Pos', '980', '350')
		doTweenZoom('asf', 'camGame', 0.8, 1, 'cubeOut')
		setProperty('defaultCamZoom', 0.8)
	else
		triggerEvent('Camera Follow Pos', '980', '250')
		doTweenZoom('asf', 'camGame', 1, 1, 'cubeOut')
		setProperty('defaultCamZoom', 1)
	end
end

-- Stage
function onCreate()
	makeLuaSprite('sky', 'mcm/stages/starved/chamber/sky', 150, -150)
	makeLuaSprite('inside', 'mcm/stages/starved/chamber/inside', 150, -150)
	makeLuaSprite('dead', 'mcm/stages/starved/chamber/dead', 400, 350)
	makeLuaSprite('chain', 'mcm/stages/starved/chamber/chain', 300, -150)
	
	setScrollFactor('chain', 1.1, 1.1);
	
	scaleObject('sky', 0.8, 0.8)
	scaleObject('inside', 0.8, 0.8)
	scaleObject('dead', 0.7, 0.7)
	scaleObject('chain', 0.8, 0.8)

	addLuaSprite('sky', false)
	addLuaSprite('inside', false)
	addLuaSprite('dead', false)
	addLuaSprite('chain', false)

end