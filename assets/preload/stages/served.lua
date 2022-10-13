-- Camera Shit (Useful for the stuff which happens in game)
function onUpdate()
    setProperty("timeBar.color",getColorFromHex("097969"))
	if mustHitSection then
		triggerEvent('Camera Follow Pos', '105', '-60')
	else
		triggerEvent('Camera Follow Pos', '-12', '-60')
	end
end

function onCreate()
	-- Bright
	makeLuaSprite('sky', 'mcm/stages/served/p1/sky', -1037, -780)
	makeLuaSprite('mountains', 'mcm/stages/served/p1/mountains', -1237, -680)
	makeLuaSprite('ground', 'mcm/stages/served/p1/ground', -1437, -780)

	addLuaSprite('sky', false)
	addLuaSprite('mountains', false)
	addLuaSprite('ground', false)

	setScrollFactor('sky', 0.5, 0.5);
	setScrollFactor('mountains', 0.8, 0.8);
	
	-- Dark
	makeLuaSprite('darkersky', 'mcm/stages/served/p2/sky', -1037, -480)
	makeLuaSprite('Bghill', 'mcm/stages/served/p2/Bghill', -1237, -280)
	makeLuaSprite('Fghill', 'mcm/stages/served/p2/Fghill', -1437, -280)
	makeLuaSprite('darkerground', 'mcm/stages/served/p2/ground', -1437, -780)

	addLuaSprite('darkersky', false)
	addLuaSprite('Bghill', false)
	addLuaSprite('Fghill', false)
	addLuaSprite('darkerground', false)

	setScrollFactor('darkersky', 0.6, 0.6);
	setScrollFactor('Bghill', 0.8, 0.8);	
	setScrollFactor('Fghill', 0.9, 0.9);	
	
	setProperty('darkersky.visible', false);	
	setProperty('Bghill.visible', false);	
	setProperty('Fghill.visible', false);	
	setProperty('darkerground.visible', false);	
	
	-- Pillars
	makeLuaSprite('light', 'mcm/stages/served/platform/light', -1245, -2500)
	makeLuaSprite('pillar', 'mcm/stages/served/platform/pillar', -1255, -85)
	makeLuaSprite('pillar2', 'mcm/stages/served/platform/pillar', -45, -85)
	makeLuaSprite('bus', 'mcm/stages/served/bus/bus', -4845, -885)
	makeLuaSprite('fellas', 'mcm/stages/served/platform/fellas', -1445, 585)

	addLuaSprite('light', false)
	addLuaSprite('pillar', false)
	addLuaSprite('pillar2', false)
	addLuaSprite('bus', false)
	addLuaSprite('fellas', true)

	setProperty('pillar.visible', false);
	setProperty('pillar2.visible', false);
	setProperty('bus.visible', false);
	setProperty('light.visible', false);
	setProperty('fellas.visible', false);

	-- Plankton's Microphone
	makeLuaSprite('mic', 'mcm/stages/served/mic', -650, 0)
	addLuaSprite('mic', false)
	scaleObject('mic', 0.2, 0.2)
	
	-- Plankton Beginning Animation
	makeAnimatedLuaSprite('depressed', 'mcm/stages/served/servedo_anim', defaultOpponentX, defaultOpponentY);
	addAnimationByPrefix('depressed', 'standing', 'intro anim', 24, false)
end

--  Current Step Events (Stages Changes n' Such)
function onStepHit()
	if curStep == 176 then
	setProperty('sky.visible', false);	
	setProperty('mountains.visible', false);	
	setProperty('ground.visible', false);	
	
	setProperty('darkersky.visible', true);	
	setProperty('darkerground.visible', true);	
	end
	if curStep == 432 then	
	setProperty('Fghill.visible', true);	
	doTweenY('showup','Fghill', -740, 3, 'cubeOut')
	end
	if curStep == 688 then	
	setProperty('Bghill.visible', true);	
	doTweenY('showup','Bghill', -680, 3, 'cubeOut')
	end
	if curStep == 1326 then
	setProperty('bus.visible', true);
	doTweenX('showup','bus', 150, 0.5, 'cubeOut')
	end
	if curStep > 1328 and curStep < 1350 then
	setProperty('bus.visible', false);	
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	
	doTweenZoom('asf', 'camGame', 0.3, 1, 'cubeOut')
	setProperty('defaultCamZoom', 0.3)
	
	setProperty('pillar.visible', true);
	setProperty('pillar2.visible', true);
	
	setProperty('darkersky.visible', false);	
	setProperty('darkerground.visible', false);	
	setProperty('Fghill.visible', false);	
	setProperty('Bghill.visible', false);	
 	end
	if curStep > 1356 and curStep < 1380 then
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	end
	if curStep > 1389 and curStep < 1413 then
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	end
	if curStep == 1712 then
	setProperty('light.visible', true);
	setProperty('fellas.visible', true);
	doTweenY('showup2','light', -1400, 3, 'cubeOut')
	doTweenY('showup','fellas', -180, 3, 'cubeOut')
	end
	if curStep == 2224 then
	setProperty('light.visible', false);
	setProperty('fellas.visible', false);
	end
	if curStep == 2504 then
    doTweenAlpha('camHUDOff' ,'camHUD', 0, 0.00000001, 'linear')
    doTweenAlpha('camGameOff' ,'camGame', 0, 0.00000001, 'linear')
	end
end