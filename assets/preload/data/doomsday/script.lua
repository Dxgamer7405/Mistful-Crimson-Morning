-- Squidward's Camera
local Camera = 0.85;

-- Camera Zoom
function onUpdate()
	if mustHitSection then
		doTweenZoom('asf', 'camGame', 1.1, 1, 'cubeOut')
		setProperty('defaultCamZoom', 1.1)
	else
		doTweenZoom('asf', 'camGame', Camera, 1, 'cubeOut')
		setProperty('defaultCamZoom', Camera)
	end
end

-- Create Stage Assets (Invis upon startup)
-- Putting it in here since it makes the game not lag upon every stage change
function onCreate()
	-- Stage Part
	makeLuaSprite('stagefb', 'mcm/stages/bedroom/doomsdayfb/stagefb', -890, -200)
	makeLuaSprite('curtainstage', 'mcm/stages/bedroom/doomsdayfb/curtainstage', -890, -450)
	makeLuaSprite('bbcurtian', 'mcm/stages/bedroom/doomsdayfb/bbcurtian', -890, -450)
	makeLuaSprite('curtianbig', 'mcm/stages/bedroom/doomsdayfb/curtianbig', -890, -450)
	makeLuaSprite('FUCKINGCHAIR', 'mcm/stages/bedroom/doomsdayfb/FUCKINGCHAIR', -1390, -500)
	makeLuaSprite('people', 'mcm/stages/bedroom/doomsdayfb/people', -890, -300)

	setLuaSpriteScrollFactor('stagefb', 1, 1)
	setLuaSpriteScrollFactor('curtainstage', 1, 1)
	setLuaSpriteScrollFactor('bbcurtian', 1, 1)
	setLuaSpriteScrollFactor('curtianbig', 1, 1)
	setLuaSpriteScrollFactor('FUCKINGCHAIR', 1, 1)
	setLuaSpriteScrollFactor('people', 1, 1)

	addLuaSprite('stagefb', false)
	addLuaSprite('curtainstage', false)
	addLuaSprite('bbcurtian', false)
	addLuaSprite('curtianbig', false)
	addLuaSprite('FUCKINGCHAIR', true)
	addLuaSprite('people', true)

	setProperty('stagefb.visible', false);	
	setProperty('curtainstage.visible', false);	
	setProperty('bbcurtian.visible', false);	
	setProperty('curtianbig.visible', false);	
	setProperty('FUCKINGCHAIR.visible', false);
	setProperty('people.visible', false);	

	scaleObject('curtainstage', 1, 1.1)
	scaleObject('bbcurtian', 1, 1.1)
	scaleObject('curtianbig', 1, 1.1)
	scaleObject('FUCKINGCHAIR', 1.3, 1.3)
	
	-- Broken Bedroom (Non-Mist)
	makeLuaSprite('wall', 'mcm/stages/bedroom/bedroomf/wall', -700,-400);
	makeLuaSprite('firewall', 'mcm/stages/bedroom/bedroomf/firewall', -700,-400);
	makeLuaSprite('floor', 'mcm/stages/bedroom/bedroomf/floor', -700,-400);
	makeLuaSprite('firefront', 'mcm/stages/bedroom/bedroomf/firefront', -700,-400);
    makeLuaSprite('shading', 'mcm/stages/bedroom/bedroomf/shading', -700,-400);

	addLuaSprite('wall', false);
	addLuaSprite('firewall', false);
	addLuaSprite('floor',false);
	addLuaSprite('firefront', true);
	addLuaSprite('shading', true);

	setProperty('wall.visible', false);	
	setProperty('firewall.visible', false);	
	setProperty('floor.visible', false);		
	setProperty('firefront.visible', false);	
	setProperty('shading.visible', false);	

	-- Destoryed Stage Part
	makeAnimatedLuaSprite('BLOODYTHING','mcm/stages/bedroom/doomsdayfb2/DoomsdayBack', -890, -400)
	makeLuaSprite('redlight', 'mcm/stages/bedroom/doomsdayfb2/redlight', -890, -400)
	makeLuaSprite('stagefx', 'mcm/stages/bedroom/doomsdayfb2/stage', -890, -200)
	makeLuaSprite('curtainstageX', 'mcm/stages/bedroom/doomsdayfb2/backcurtains', -890, -450)
	makeLuaSprite('Xcurtian', 'mcm/stages/bedroom/doomsdayfb2/frontcurtains', -890, -450)
	makeLuaSprite('pieces', 'mcm/stages/bedroom/doomsdayfb2/pieces', -890, -450)
	makeLuaSprite('FUCKINGFUCK', 'mcm/stages/bedroom/doomsdayfb2/BROKENCHAIR', -1390, -500)
	makeAnimatedLuaSprite('debris','mcm/stages/bedroom/doomsdayfb2/debris', -890, -400)
	
	addAnimationByPrefix('BLOODYTHING','Tearflow', 'Tearflow', 24, true)
	addAnimationByPrefix('debris','fallingdebris', 'fallingdebris', 24, true)

	scaleLuaSprite('BLOODYTHING', 1, 1);
	scaleObject('curtainstageX', 1, 1.1)
	scaleObject('Xcurtian', 1, 1.1)
	scaleObject('pieces', 1, 1.1)
	scaleObject('FUCKINGFUCK', 1.3, 1.3)
	scaleObject('debris', 1.3, 1.3)

	setLuaSpriteScrollFactor('redlight', 1, 1)
	setLuaSpriteScrollFactor('stagefx', 1, 1)
	setLuaSpriteScrollFactor('curtainstageX', 1, 1)
	setLuaSpriteScrollFactor('Xcurtian', 1, 1)
	setLuaSpriteScrollFactor('pieces', 1, 1)
	setLuaSpriteScrollFactor('FUCKINGFUCK', 1, 1)

	addLuaSprite('BLOODYTHING', false);
	addLuaSprite('redlight', false)
	addLuaSprite('stagefx', false)
	addLuaSprite('curtainstageX', false)
	addLuaSprite('Xcurtian', false)
	addLuaSprite('pieces', false)
	addLuaSprite('FUCKINGFUCK', true)
	addLuaSprite('debris', true);

	setProperty('BLOODYTHING.visible', false);
	setProperty('redlight.visible', false);	
	setProperty('stagefx.visible', false);	
	setProperty('curtainstageX.visible', false);	
	setProperty('Xcurtian.visible', false);	
	setProperty('pieces.visible', false);	
	setProperty('FUCKINGFUCK.visible', false);
	setProperty('debris.visible', false);
	
	-- Broken Bedroom (Mist-ified)
	makeLuaSprite('skyx', 'mcm/stages/bedroom/redmist/sky', -700,-400);
	makeLuaSprite('lighteffect', 'mcm/stages/bedroom/redmist/lighteffect', -700,-400);
	makeLuaSprite('roomx', 'mcm/stages/bedroom/redmist/room', -700,-400);
	makeLuaSprite('shadingx', 'mcm/stages/bedroom/redmist/shading', -700,-400);

	addLuaSprite('skyx', false);
	addLuaSprite('lighteffect', false);
	addLuaSprite('roomx', false);
	addLuaSprite('shadingx', false);

	setProperty('skyx.visible', false);	
	setProperty('lighteffect.visible', false);			
	setProperty('roomx.visible', false);	
	setProperty('shadingx.visible', false);	
	
	-- Blood Splatter
	makeLuaSprite('suicide', 'mcm/stages/bedroom/suicide', -700,-400);
    makeLuaSprite('blood', 'background/bedroom/blood', 0, 0);

	addLuaSprite('suicide', false);
	addLuaSprite('blood', false);

	setProperty('suicide.visible', false);	
	setProperty('blood.visible', false);	
	
	setObjectCamera('blood', 'hud');
end

-- Events which occur in the song (stage changes n' such)
function onStepHit()
	-- Stage Changes
	if curStep == 1056 then
	Camera = 0.55;
	setProperty('boyfriendGroup.visible', false);
	setProperty('gfGroup.visible', false);
		
	setProperty('stagefb.visible', true);
	setProperty('curtainstage.visible', true);
	setProperty('bbcurtian.visible', true);
	setProperty('curtianbig.visible', true);
	setProperty('FUCKINGCHAIR.visible', true);
	setProperty('people.visible', true);
	
	doTweenZoom('asf', 'camGame', 0.55, 0.2, 'cubeOut')
	setProperty('defaultCamZoom', 0.55)
	end 
	if curStep == 1312 then
	Camera = 0.85;
	setProperty('boyfriendGroup.visible', true);
	setProperty('gfGroup.visible', true);
	
	doTweenZoom('asf', 'camGame', 0.85, 0.2, 'cubeOut')
	setProperty('defaultCamZoom', 0.85)
	
	setProperty('stagefb.visible', false);
	setProperty('curtainstage.visible', false);
	setProperty('bbcurtian.visible', false);
	setProperty('curtianbig.visible', false);
	setProperty('FUCKINGCHAIR.visible', false);
	setProperty('people.visible', false);
	end 	
	if curStep == 1568 then
	-- Camera Zoom, no event cause I'm lazy to make a whole new one
	Camera = 0.65;
	doTweenZoom('asf', 'camGame', 0.65, 0.7, 'cubeOut')
	setProperty('defaultCamZoom', 0.65)
	end 
	if curStep == 1572 then
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')

	setProperty('wall.visible', true);	
	setProperty('firewall.visible', true);	
	setProperty('floor.visible', true);	
	setProperty('firefront.visible', true);	
	setProperty('shading.visible', true);
	end 
	if curStep == 2336 then
	Camera = 0.55;
	doTweenZoom('asf', 'camGame', 0.55, 0.2, 'cubeOut')
	setProperty('defaultCamZoom', 0.55)
	
	setProperty('boyfriendGroup.visible', false);
	setProperty('gfGroup.visible', false);
	
	setProperty('wall.visible', false);	
	setProperty('firewall.visible', false);	
	setProperty('floor.visible', false);	
	setProperty('firefront.visible', false);	
	setProperty('shading.visible', false);
	
	setProperty('BLOODYTHING.visible', true);
	setProperty('redlight.visible', true);
	setProperty('stagefx.visible', true);
	setProperty('curtainstageX.visible', true);
	setProperty('Xcurtian.visible', true);
	setProperty('pieces.visible', true);
	setProperty('FUCKINGFUCK.visible', true);
	setProperty('debris.visible', true);
	end 
	if curStep == 2464 then
	Camera = 0.65;
	setProperty('boyfriendGroup.visible', true);
	setProperty('gfGroup.visible', true);

	doTweenZoom('asf', 'camGame', 0.65, 0.2, 'cubeOut')
	setProperty('defaultCamZoom', 0.65)

	setProperty('BLOODYTHING.visible', false);
	setProperty('redlight.visible', false);
	setProperty('stagefx.visible', false);
	setProperty('curtainstageX.visible', false);
	setProperty('Xcurtian.visible', false);
	setProperty('pieces.visible', false);
	setProperty('FUCKINGFUCK.visible', false);
	setProperty('debris.visible', false);
	
	setProperty('skyx.visible', true);	
	setProperty('lighteffect.visible', true);			
	setProperty('roomx.visible', true);	
	setProperty('shadingx.visible', true);	
	end 
	
	-- Screen shakes n' such
	if curStep > 2464 and curStep < 2520 then
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	end
	
	-- Part where camera starts to zoom at the end near squidward's death
	if curStep == 2592 or curStep == 2726 then
	doTweenZoom('asf', 'camGame', 0.85, 0.2, 'cubeOut')
	setProperty('defaultCamZoom', 0.85)
	Camera = 0.85;
	end 
	if curStep == 2656 or curStep == 2732 then
	doTweenZoom('asf', 'camGame', 0.95, 0.2, 'cubeOut')
	setProperty('defaultCamZoom', 0.95)
	Camera = 0.95;
	end 
	if curStep == 2736 then
	doTweenZoom('asf', 'camGame', 1.1, 0.2, 'cubeOut')
	setProperty('defaultCamZoom', 1.1)
	Camera = 1.1;
	end 
	if curStep == 2720 or curStep == 2740 then
	doTweenZoom('asf', 'camGame', 0.75, 0.2, 'cubeOut')
	setProperty('defaultCamZoom', 0.75)
	Camera = 0.75;
	end 
	
	if curStep == 2744 then
	-- Gunshot
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	
	-- Back to normal (returns to the regular bedroom stage, this time with blood)
	setProperty('blood.visible', true);
	setProperty('suicide.visible', true);	
	setProperty('room.visible', true);	
	
	-- Layering changes to squidward falls in front of both GF and BF
	setObjectOrder('dadGroup', 1)
	setObjectOrder('boyfriendGroup', 2)
	setObjectOrder('gfGroup', 3)

	setObjectOrder('suicide', 4)

	-- Bye mist-ified bedroom
	setProperty('skyx.visible', false);	
	setProperty('lighteffect.visible', false);			
	setProperty('roomx.visible', false);	
	setProperty('shadingx.visible', false);	
	end
end