package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			["Android Porter"],
			['Dxgamer',			'hi',			"I Ported This Mod",						'https://youtube.com/Dxgamer7405',	'FF0000'],
			[''],
			['Mistful Crimson Morning'],
			['DevilousHavoc',			'no',			'Owner, Charter',							'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['jredwick',				'no',			'Owner, Main Coder, Part Time Artist',		'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Hyper',					'no',			'Director, Charter',						'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Betasheep28',				'no',			'Director, Main Artist',					'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Frylock',					'no',			'Coder',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['PJ9D',					'no',			'Coder',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Anonymous',				'no',			'Coder + Additional Help',					'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['pattydecaffy',			'no',			'Composer',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Olimac31',				'no',			'Composer',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['blueglue',				'no',			'Composer',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['vruzzen',					'no',			'Composer',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['CalciumLmao',				'no',			'Composer',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Sandi',					'no',			'Composer',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['banana B)',				'no',			'Composer',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['END_SELLA',				'no',			'Composer',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Blue',					'no',			'Composer (Snail House Creator)',			'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['CoolmanAJF',				'no',			'Composer, Charter, Assist Coder',			'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['FireDemonWalker',			'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Offical Unfunny Person',	'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Numberless',				'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['cosmicalarcade',			'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['LuXoiD_01',				'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['XXXMickeyTesticles5480',	'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Colonio',					'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['TopTophatter',			'no',			'Artist, Animator',							'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['weedeet',					'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Gnet',					'no',			'Artist, Animator',							'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['AshyTown',				'no',			'Concept Artist',							'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Nazery',					'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Stonesteve',				'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Manny204553',				'no',			'Artist (3D Modeler)',						'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Nugget',					'no',			'Artist',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Adam Navares',			'no',			'Artist (Joe Notes)',						'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['HoneyFox',				'no',			'Artist + Emotional Support',				'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['OstrichIsNotFunny',		'no',			'Charter',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Icexglitch',				'no',			'Charter',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['skwoop',					'no',			'Charter',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Demonic',					'no',			'Charter',									'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Larry',					'no',			'VA (Squidward)',							'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Banbuds',					'no',			'VA (Plankton)',							'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['BluBellaVA',				'no',			'VA',										'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Seifo',					'no',			'VA (MC Spongebob), Chromatic Maker',		'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['Crumby',					'no',			'Chromatic Maker',							'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			['RubysArt_',				'no',			'Chromatic Maker',							'https://www.youtube.com/watch?v=csJONKQa2JI',		'CF2D2D'],
			[''],
			['Psych Engine Team'],
			['Shadow Mario',			'no',			'Main Programmer of Psych Engine',							'https://twitter.com/Shadow_Mario_',	'CF2D2D'],
			['RiverOaken',				'no',			'Main Artist/Animator of Psych Engine',						'https://twitter.com/RiverOaken',		'CF2D2D'],
			['shubs',					'no',			'Additional Programmer of Psych Engine',					'https://twitter.com/yoshubs',			'CF2D2D'],
			[''],
			['Former Engine Members'],
			['bb-panzu',				'no',			'Ex-Programmer of Psych Engine',							'https://twitter.com/bbsub3',			'CF2D2D'],
			[''],
			['Engine Contributors'],
			['iFlicky',					'no',			'Composer of Psync and Tea Time\nMade the Dialogue Sounds',	'https://twitter.com/flicky_i',			'CF2D2D'],
			['SqirraRNG',				'no',			'Chart Editor\'s Sound Waveform base',						'https://twitter.com/gedehari',			'CF2D2D'],
			['PolybiusProxy',			'no',			'.MP4 Video Loader Extension',								'https://twitter.com/polybiusproxy',	'CF2D2D'],
			['Keoiki',					'no',			'Note Splash Animations',									'https://twitter.com/Keoiki_',			'CF2D2D'],
			['Smokey',					'no',			'Spritemap Texture Support',								'https://twitter.com/Smokey_5_',		'CF2D2D'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',			'no',			"Programmer of Friday Night Funkin'",						'https://twitter.com/ninja_muffin99',	'CF2D2D'],
			['PhantomArcade',			'no',			"Animator of Friday Night Funkin'",							'https://twitter.com/PhantomArcade3K',	'CF2D2D'],
			['evilsk8r',				'no',			"Artist of Friday Night Funkin'",							'https://twitter.com/evilsk8r',			'CF2D2D'],
			['kawaisprite',				'no',			"Composer of Friday Night Funkin'",							'https://twitter.com/kawaisprite',		'CF2D2D']
		];
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			optionText.yAdd -= 70;
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();

    #if android
  	addVirtualPad(UP_DOWN, A_B);
    #end

		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-1 * shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(1 * shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.isBold)
			{
				var lerpVal:Float = CoolUtil.boundTo(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
					item.forceX = item.x;
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
					item.forceX = item.x;
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}