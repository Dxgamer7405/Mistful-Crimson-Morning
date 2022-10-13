-- Gimmick Shit
function goodNoteHit()
	health = getProperty('health')
	if getProperty('health') > 0.0 then
        setProperty('health', health- 0.023);
    end
end

function onBeatHit()
	health = getProperty('health');
	if getProperty('health') > 0.0 then
        setProperty('health', health- 0.012);
	end
end

-- Stage Stuff
function onCreate()
	-- Health Bar at Full
	setProperty('health', 2.0);
	-- Phase 1
	makeLuaSprite('background', 'mcm/stages/satisfaction/light', -700,-400);
	makeLuaSprite('kitchen', 'mcm/stages/satisfaction/kitchen', -700,-400);
	makeLuaSprite('krabs', 'mcm/stages/satisfaction/characters/krabs', 1300, -100);
	makeLuaSprite('light', 'mcm/stages/satisfaction/light/light', -700,-400);
	makeLuaSprite('squidwardLight', 'mcm/stages/satisfaction/light/squidwardLight', -700,-400);
	
	scaleLuaSprite('krabs', 0.65, 0.65);

	addLuaSprite('background', false);
	addLuaSprite('kitchen', false);
	addLuaSprite('krabs', false);
	addLuaSprite('light', true);
	addLuaSprite('squidwardLight', true);
	
	setProperty('squidwardLight.visible', false);	
	
	-- Squidward (Both Animations)
	makeAnimatedLuaSprite('squidward','mcm/stages/satisfaction/characters/mc_squidfart', 700, -380)
	scaleLuaSprite('squidward', 1.1, 1.1);
	addAnimationByPrefix('squidward','idle', 'idle', 24, true)
	addAnimationByPrefix('squidward','hey', 'hey', 24, true)
	addLuaSprite('squidward', false);
	setProperty('squidward.visible', false)

	makeAnimatedLuaSprite('squidward2','mcm/stages/satisfaction/characters/mc_squidfart', 780, -330)
	scaleLuaSprite('squidward2', 1.1, 1.1);
	addAnimationByPrefix('squidward2','idle', 'idle', 24, true)
	addLuaSprite('squidward2', false);
	setProperty('squidward2.visible', false);
	
	-- Phase 2
	makeLuaSprite('standoff', 'mcm/stages/satisfaction/front/standoff', -700,-400);
	makeLuaSprite('frontlight', 'mcm/stages/satisfaction/front/light', -700,-400);

	addLuaSprite('standoff', false);
	addLuaSprite('frontlight', true);
	
	setProperty('standoff.visible', false);	
	setProperty('frontlight.visible', false);	
end

-- Reversed Arrows
function onCreatePost()
        setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
        setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
        setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
        setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3 )
        setPropertyFromGroup('playerStrums', 4, 'x', defaultOpponentStrumX4 )

        setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 40)
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 40)
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 40)
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX2 + 160)
        setPropertyFromGroup('opponentStrums', 4, 'x', defaultPlayerStrumX3 + 40)	
end

-- The Phase 2 shit is in the other lua script in the data folder, yes I'm still using lua fight me
function onStepHit()
	if curStep == 112 then
	setProperty('squidward.visible', true);
    luaSpritePlayAnimation('squidward', 'hey')
	end
	if curStep == 128 then
		addLuaSprite('light', false);
		setProperty('squidwardLight.visible', true);	
	setProperty('squidward.visible', false);
	setProperty('squidward2.visible', true);
    luaSpritePlayAnimation('squidward2', 'idle')
	end
end
