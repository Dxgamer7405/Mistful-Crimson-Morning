-- Stage Stuff
function onCreate()
	makeLuaSprite('showroom', 'mcm/stages/propaganda/propaganda', -1200,-400);
	addLuaSprite('showroom', false);
	if not lowQuality then
	-- Characters Bopping
		makeAnimatedLuaSprite("ford", "mcm/stages/propaganda/Ford1", 350, 0)
		addAnimationByPrefix("ford", "Ford1", "Ford1", 24, false)
		addLuaSprite("ford", false)
	end
end

if not lowQuality then
	function onBeatHit()
		if curBeat % 2 == 0 then
			playAnim("ford", "Ford1", true)
		end
	end
end