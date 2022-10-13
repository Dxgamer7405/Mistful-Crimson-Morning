local xx2 = 420;
local yy2 = 450;
local xx = 850;
local yy = 350;

-- Camera Stuff
-- Putting this here instead of the stage file as it allows for me to change the camera position much easier
function onUpdate()
	if mustHitSection then
		triggerEvent('Camera Follow Pos', xx2, yy2)
	else
		triggerEvent('Camera Follow Pos', xx, yy)
	end
end


-- Stuff for the part where he's sitting down
function onStepHit()
	if curStep == 2176 then
		-- Camera Position Changes
		xx = 600;
		yy = 350;
		xx2 = 600;
		yy2 = 350;
		setProperty('defaultCamZoom', 0.55)
		-- Middlescroll
		noteTweenX('byearrows1', 0, -200, 0.01, 'linear')
        noteTweenX('byearrows2', 1, -200, 0.01, 'linear')
        noteTweenX('byearrows3', 2, -200, 0.01, 'linear')
        noteTweenX('byearrows4', 3, -200, 0.01, 'linear')
		
		noteTweenX('middletime1', 4, 114, 0.01, 'linear')
        noteTweenX('middletime2', 5, 327, 0.01, 'linear')
        noteTweenX('middletime3', 6, 837, 0.01, 'linear')
        noteTweenX('middletime4', 7, 1050, 0.01, 'linear')
		-- Disables Camera
        doTweenAlpha('camHUDOff' ,'camHUD', 0, 0.00000001, 'linear')
        doTweenAlpha('camGameOff' ,'camGame', 0, 0.00000001, 'linear')
		-- Stuff Changes to Phase 2 Stuff
		-- Phase 2 Stuff
		setProperty('standoff.visible', true);	
		setProperty('frontlight.visible', true);
		-- Phase 1 Stuff gets removed
			setProperty('background.visible', false);	
			setProperty('kitchen.visible', false);
			setProperty('krabs.visible', false);	
			setProperty('squidwardLight.visible', false);
			setProperty('squidward2.visible', false);
		-- Boyfriend Disappears
		setProperty('boyfriendGroup.visible', false);	
	end
	if curStep == 2240 then
		-- Black Screen goes away
        doTweenAlpha('camHUDOff' ,'camHUD', 1, 0.00000001, 'linear')
        doTweenAlpha('camGameOff' ,'camGame', 1, 0.00000001, 'linear')
	end
end