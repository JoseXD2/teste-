local uberkidDead = false
local uberkidIsInFront = false
local deathAnimPlaying = false
local didEmergencyCreate = false
local InCutsceneBus = false

local CountDownOfDeath = 5

local DebugMode = false

function onCreate()

	setProperty("defaultCamZoom",1.2)
	
--God bless you Shade from the Psych Engine Discord
	setPropertyFromClass('ClientPrefs', 'camZooms', false)
	setPropertyFromClass('ClientPrefs', 'middleScroll', true)
	
--DEBUG SHIT
	makeLuaText('uberkidDead', '', 0, 515, 150)
	makeLuaText('uberkidIsInFront', '', 0, 515, 160)
	makeLuaText('DeadAnimPlaying', '', 0, 515, 170)
	makeLuaText('didEmergencyCreate', '', 0, 515, 180)


	if DebugMode == true then
		addLuaText('uberkidDead');
		addLuaText('uberkidIsInFront');
		addLuaText('DeadAnimPlaying');
		addLuaText('didEmergencyCreate');
	end

--ACTUAL SCRIPT

--SOUNDS PRECACHE
	precacheSound('gunshot')
	precacheSound('gunout')
	precacheSound('reload')
	precacheSound('blood')
	precacheSound('bulletfall')
	precacheSound('countdown')

	makeLuaSprite('bars','bars',0,0)
	setLuaSpriteScrollFactor('bars',160,90)
	addLuaSprite('bars',true)
	setProperty('bars.antialiasing',false)
	scaleObject('bars',4,4)
	setObjectCamera('bars', 'camHUD');

--REF FOR POSITIONS
	--makeLuaSprite('ref', 'ref', 0, 0);
	--setLuaSpriteScrollFactor('ref', 1, 1);
	--scaleObject('ref', 1, 1);

	makeLuaSprite('sky', 'sky', -310, -100);
	setLuaSpriteScrollFactor('sky', 0.8, 0.8);
	scaleObject('sky', 1, 1);

	makeLuaSprite('buildings', 'buildings', -310, -100);
	setLuaSpriteScrollFactor('buildings', 0.9, 0.9);
	scaleObject('buildings', 1, 1);

	makeAnimatedLuaSprite('flickeringlights', 'FlickerLights', -325, -100);
	luaSpriteAddAnimationByPrefix('flickeringlights', 'glow', 'Glow', 1, false);
	luaSpriteAddAnimationByPrefix('flickeringlights', 'flicker', 'Flicker', 12, false);
	luaSpritePlayAnimation('flickeringlights', 'glow');

	scaleObject('flickeringlights', 1, 1);
	setLuaSpriteScrollFactor('flickeringlights', 0.95, 0.95);
	setProperty('flickeringlights.alpha', 0.1);

	makeLuaSprite('floor', 'floor', -310, -100);
	setLuaSpriteScrollFactor('floor', 1, 1);
	scaleObject('floor', 1, 1);


--BUS CUTSCENE SHIT
    makeAnimatedLuaSprite('buscoming', 'BusComing', 250, -9999);
    luaSpriteAddAnimationByPrefix('buscoming', 'bus1', 'BusComing0', 24, false);
    luaSpriteAddAnimationByPrefix('buscoming', 'bus2', 'BusComing2', 24, false);
    luaSpritePlayAnimation('buscoming', 'bus1');
    scaleObject('buscoming', 1.2, 1.2);
    setLuaSpriteScrollFactor('buscoming', 0.9, 0.9);
    setProperty('buscoming.alpha', 1);
 
	makeAnimatedLuaSprite('bgUberkids', 'bgUberkids', 85, 250);
	luaSpriteAddAnimationByPrefix('bgUberkids', 'idle', 'bguberkids0', 24, false);
	luaSpriteAddAnimationByPrefix('bgUberkids', 'bus', 'bguberkidsBUS', 24, false);
	luaSpritePlayAnimation('bgUberkids', 'idle');
	scaleObject('bgUberkids', 1, 1);
	setLuaSpriteScrollFactor('bgUberkids', 0.9, 0.9);

--UBERKIDS SHIT
	makeAnimatedLuaSprite('walkingUberkid', 'uberkidWalk', 750, 217);
	luaSpriteAddAnimationByPrefix('walkingUberkid', 'run', 'walk', 24, true);
	luaSpritePlayAnimation('walkingUberkid', 'run');
	setLuaSpriteScrollFactor('walkingUberkid', 1, 1);

	makeAnimatedLuaSprite('boopinUberkid', 'uberkidShit', 500, 1000);
	luaSpriteAddAnimationByPrefix('boopinUberkid', 'bop', 'idle', 24, false);
	luaSpriteAddAnimationByPrefix('boopinUberkid', 'die', 'die', 24, false);
	luaSpritePlayAnimation('boopinUberkid', 'bop');
	setLuaSpriteScrollFactor('boopinUberkid', 1, 1);

--COUNTDOWN NUMBER, YES MY CODE SUCKS BUT IT'LL WORK OK TRUST ME
	makeAnimatedLuaSprite('numbers', 'numbers', 580, 250);
	luaSpriteAddAnimationByPrefix('numbers', 'one', 'one', 24, true);
	luaSpriteAddAnimationByPrefix('numbers', 'two', 'two', 24, true);
	luaSpriteAddAnimationByPrefix('numbers', 'three', 'three', 24, true);

	luaSpritePlayAnimation('numbers', 'three');
	setLuaSpriteScrollFactor('numbers', 1, 1);
	scaleObject('numbers', 2, 2);
	setProperty('numbers.alpha', 0);

--STAGE BUILDING

	--addLuaSprite('ref', false);

	addLuaSprite('sky', false);
	addLuaSprite('buildings', false);
	addLuaSprite('buscoming', false);
	addLuaSprite('flickeringlights', false);
	addLuaSprite('floor', false);

	addLuaSprite('bgUberkids', false);

	addLuaSprite('walkingUberkid', true);
	addLuaSprite('boopinUberkid', true);

	addLuaSprite('numbers', true);

end


function onEvent(name, value1, value2)
	--MAKE THE UBERKID START GOING
    if name == 'makeuberkidRUN' then
		if deathAnimPlaying == true then
			didEmergencyCreate = true	
			--setProperty('boopinUberkid.alpha', 0);
			setProperty('boopinUberkid.x', 500)
			setProperty('boopinUberkid.y', 1000)
			uberkidDead = false
			uberkidIsInFront = false	
			
		end
		if uberkidDead == false and uberkidIsInFront == false  then
			--setProperty('boopinUberkid.alpha', 0);
			setProperty('boopinUberkid.y', 1000)
			cancelTween('hegointoPico')
			setProperty('walkingUberkid.x', 750)
			doTweenX('hegointoPico', 'walkingUberkid', 500, 1, 'linear')
		end
    end

	if name == 'Play Animation' then
		if value1 == "weaponOut" then
			if value2 == "BF" then
				playSound('gunout', 1)
			end
		end

	end

	if name == 'bus' then
		InCutsceneBus = true
		for i = 0, getProperty('playerStrums.length')-1 do
			setPropertyFromGroup('playerStrums',i,'visible',false)
		end

		doTweenZoom('begin', 'camGame', '1.3', 1, 'quadOut')

		characterPlayAnim('boyfriend', 'buscutscene', true);
		setProperty('boyfriend.specialAnim', true);

		characterPlayAnim('dad', 'bus', true);
		setProperty('dad.specialAnim', true);

		setProperty('bgUberkids.x', -310)
		setProperty('bgUberkids.y', 40)
		luaSpritePlayAnimation('bgUberkids', 'bus');

		luaSpritePlayAnimation('buscoming', 'bus1');
		setProperty('buscoming.y', 150)
	

	end

	if name == 'endbus' then
		setProperty('bgUberkids.y', -9999)
		setProperty('buscoming.y', -9999)
		for i = 0, getProperty('playerStrums.length')-1 do
			setPropertyFromGroup('playerStrums',i,'visible',true)
		end

		doTweenZoom('end', 'camGame', '1.2', 1, 'quadOut')

	end

	--MAKE THE UBERKID DIE
	--if name == 'bulletshot' then
		--if uberkidIsInFront == true then
			--uberkidDead = true
			--playSound('gunshot', 1)
	
			--cameraFlash('camGame', 'ffffff', 0.15, true);
			--cameraShake('camGame', 0.015, 0.15);
	
			--local deathAnimPlaying = true
			--for i = 1, 10, 1 do
				--setProperty('boopinUberkid.x', 450)
				--luaSpritePlayAnimation('boopinUberkid', 'die');
			--end
			--runTimer('waitfortheDeadAnim', 0.7, 1)
		--end
	--end

end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'BulletNote' then
		if uberkidDead == false and uberkidIsInFront == true then
		
			cancelTimer('countForDEATH')


			CountDownOfDeath = 5
			uberkidDead = true

			playSound('gunshot', 1)
	
			--cameraFlash('camGame', 'ffffff', 0.15, true);
			cameraShake('camGame', 0.015, 0.15);
	
			playSound('blood', 1)
			for i = 1, 10, 1 do
				characterPlayAnim('boyfriend', 'shoot', true);
				setProperty('boyfriend.specialAnim', true);
				deathAnimPlaying = true
				setProperty('boopinUberkid.x', 450)
				luaSpritePlayAnimation('boopinUberkid', 'die');
			end


			doTweenAlpha('AppearCoundownNumbers', 'numbers', '0', 0.3, 'linear')
			doTweenY('AppearCoundownNumbersY', 'numbers', '250', 0.3, 'linear')

			--setProperty('numbers.y', 250);
			--setProperty('numbers.alpha', 0);
			--setProperty('numbers.scale.y', 2);
			--setProperty('numbers.scale.x', 2);
			runTimer('waitfortheDeadAnim', 0.7, 1)

		end
		if uberkidIsInFront == false then
			playSound('reload', 1)
			for i = 1, 10, 1 do
				characterPlayAnim('boyfriend', 'reload', true);
				setProperty('boyfriend.specialAnim', true);
			end
		end
	end
end

--CHECKS FOR WHEN THE UBERKID DEATH ANIMATION IS DONE
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'waitfortheDeadAnim' then
		--doTweenX('yeahHeDead1', 'boopinUberkid', 2000, 0.5, 'linear')

		if didEmergencyCreate == false then
			deathAnimPlaying = false
			--setProperty('boopinUberkid.alpha', 0);
			setProperty('boopinUberkid.y', 1000)
			setProperty('boopinUberkid.x', 500)
			for i = 1, 10, 1 do
				uberkidDead = false
				uberkidIsInFront = false	
			end
		end
		if didEmergencyCreate == true then
			deathAnimPlaying = false
			didEmergencyCreate = false
		end
	end

	if tag == 'countForDEATH' then

		--YANDERE DEV TYPE CODE, TOO LAZY TO MAKE IT BETTERa
		if CountDownOfDeath == 1 then
			luaSpritePlayAnimation('numbers', 'zero');
		end
		if CountDownOfDeath == 2 then
			luaSpritePlayAnimation('numbers', 'one');
		end
		if CountDownOfDeath == 3 then
			luaSpritePlayAnimation('numbers', 'two');
		end


		setProperty('numbers.scale.y', 3);
		setProperty('numbers.scale.x', 3);

		doTweenX('numbersxsize', 'numbers.scale', 2, 0.3, circInOut)
		doTweenY('numbersysize', 'numbers.scale', 2, 0.3, circInOut)

		CountDownOfDeath = CountDownOfDeath - 1
		if CountDownOfDeath < 4 then
			if CountDownOfDeath > 0 then
				doTweenAlpha('AppearCoundownNumbers', 'numbers', '1', 0.3, 'linear')
				doTweenY('AppearCoundownNumbersY', 'numbers', '150', 0.3, 'linear')
				playSound('countdown', 1)
			end
		end
		--setProperty('health', -500);
	end

	if tag == 'FlickerLights' then
		luaSpritePlayAnimation('flickeringlights', 'flicker');
	end
end

function onTweenCompleted(tag)

	--STUFF WHEN UBERKID IS IN FRONT OF PICO
	if tag == 'hegointoPico' then
		uberkidDead = false
		uberkidIsInFront = true

		--START TIMER
		runTimer('countForDEATH', 1.069, 5)

		cancelTween('hegointoPico')
		setProperty('walkingUberkid.x', 750)
		setProperty('boopinUberkid.y', 217)
		--setProperty('boopinUberkid.alpha', 1);
	end

end


function onBeatHit()
	
	--MAKES SURE TO NOT BOP WHILE BEING DEAD
	if InCutsceneBus == false then
		luaSpritePlayAnimation('bgUberkids', 'idle');
	end
	if uberkidDead == false then
		luaSpritePlayAnimation('boopinUberkid', 'bop');
	end

	if curBeat % 4 == 0 then
        if math.random(1, 50) <= 15 then
            -- debugPrint('flick lights')
            -- debugPrint(getPropertyFromClass('Conductor', 'bpm'))
			runTimer('FlickerLights', math.random(0.1, 0.6), math.random(1, 4))
        end
    end

end

function onUpdate()
	
	if CountDownOfDeath == 0 then
		if uberkidDead == false then
			setProperty('health', -500)
		end
	end

	setTextString('uberkidDead', uberkidDead)
	setTextString('uberkidIsInFront', uberkidIsInFront)
	setTextString('DeadAnimPlaying', deathAnimPlaying)
	setTextString('didEmergencyCreate', didEmergencyCreate)


	
	setProperty('iconP1.alpha', 0);
	setProperty('iconP2.alpha', 0);
	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y',130)
		setPropertyFromGroup('opponentStrums',i,'x',-9999)
    end
	setProperty('gf.visible',false);
	setProperty('totalNotesHit', 0)
	setProperty('scoreTxt.visible', false)
	if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
	setProperty('botplayTxt.y', 536)
	elseif getPropertyFromClass('ClientPrefs', 'downScroll') == true then
	setProperty('botplayTxt.y', 126)
	end
	setProperty('timeBar.visible', false);
	setProperty('timeBarBG.visible', false);
	setProperty('timeTxt.visible', false);
end

function onCountdownTick(counter)

	luaSpritePlayAnimation('bgUberkids', 'idle');

	if counter == 3 then--GO!
		doTweenColor('nighttimebaby', 'boyfriend', '4B45A5', 90, 'linear')
		doTweenColor('nighttimebaby2', 'dad', '4B45A5', 90, 'linear')
		doTweenColor('nighttimebaby3', 'floor', '4B45A5', 90, 'linear')
		doTweenColor('nighttimebaby4', 'buildings', '4B45A5', 90, 'linear')


		doTweenColor('nighttimebaby5', 'sky', '2B218A', 90, 'linear')

		doTweenColor('nighttimebaby6', 'bgUberkids', '4B45A5', 90, 'linear')
		doTweenColor('nighttimebaby7', 'walkingUberkid', '4B45A5', 90, 'linear')
		doTweenColor('nighttimebaby8', 'boopinUberkid', '4B45A5', 90, 'linear')

		
		doTweenAlpha('nighttimebaby9', 'flickeringlights', 0.13, 90, 'linear')

		doTweenColor('nighttimebaby10', 'buscoming', '4B45A5', 90, 'linear')
	end
end