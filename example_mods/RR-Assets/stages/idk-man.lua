local xx = 0;
local yy = 1300; --1300
local xx2 = 200; 
local yy2 = 1300;--1300
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
local damage = true;
local beating = false;
local beat_skip = 0;
local tp = false;
local tspeed = 0.5;
local screenshake = false;
local beep = false;
local beepchance = 0;
local maxchance = 22;
local lockscreen = false;
local lockx = 0;
local locky = 0;
local lockzoom = 1;
local angleshit = 0.55;
local anglevar = 0.55;
local idk_brush = false;


function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('gf.alpha', 0);
end

function onCreate()
	
	setProperty('boyfriend.alpha', 1);
	setProperty('camHUD.alpha', 1);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('bg','BG/idk-man/bg', -1400, 200)
	
	makeLuaSprite('floor','BG/idk-man/floor', -1400, 1500)
	makeLuaSprite('buildings','BG/idk-man/buildings', -1400, 900)
	makeLuaSprite('sky','BG/idk-man/sky', -1400, 550)
	makeLuaSprite('drawing','BG/idk-man/drawing', -100, 1050)
	makeLuaSprite('jeremy','BG/idk-man/zed and jeremy', -600, 1200)
	
	makeAnimatedLuaSprite('brushL','BG/idk-man/brush_gimmic', 640, 0)
	addAnimationByPrefix('brushL','BR','L',24,false)
    objectPlayAnimation('brushL','BR',false);
	scaleObject('brushL',0.65, 0.65)
	playAnim('brushL','loop', true);
	setObjectCamera('brushL', 'other');
	
	makeAnimatedLuaSprite('brushU','BG/idk-man/brush_gimmic', 950, -100)
	addAnimationByPrefix('brushU','BR','u',24,false)
    objectPlayAnimation('brushU','BR',false);
	scaleObject('brushU',0.65, 0.65)
	playAnim('brushU','loop', true);
	setObjectCamera('brushU', 'other');
	
	makeAnimatedLuaSprite('brushD','BG/idk-man/brush_gimmic', 840, -50)
	addAnimationByPrefix('brushD','BR','d',24,false)
    objectPlayAnimation('brushD','BR',false);
	scaleObject('brushD',0.65, 0.65)
	playAnim('brushD','loop', true);
	setObjectCamera('brushD', 'other');
	
	makeAnimatedLuaSprite('brushR','BG/idk-man/brush_gimmic', 1025, 0)
	addAnimationByPrefix('brushR','BR','r',24,false)
    objectPlayAnimation('brushR','BR',false);
	scaleObject('brushR',0.65, 0.65)
	playAnim('brushR','loop', true);
	setObjectCamera('brushR', 'other');
	
	setProperty('brushL.alpha', 0);
	setProperty('brushU.alpha', 0);
	setProperty('brushD.alpha', 0);
	setProperty('brushR.alpha', 0);
	
	setProperty('floor.alpha', 0);
	setProperty('buildings.alpha', 0);
	setProperty('sky.alpha', 0);
	setProperty('drawing.alpha', 0);
	setProperty('jeremy.alpha', 0);
	

	addLuaSprite('bg')
	
	addLuaSprite('sky')
	addLuaSprite('buildings')
	addLuaSprite('floor')
	addLuaSprite('drawing')
	addLuaSprite('jeremy')
	
	addLuaSprite('brushL')
	addLuaSprite('brushU')
	addLuaSprite('brushD')
	addLuaSprite('brushR')
	-----------------------------------------
	
	makeLuaSprite('flashdark','Flashdark', 0, 0)
	makeLuaSprite('flashwhite','Flashwhite', 0, 0)
	
	makeLuaSprite('csdown','cutscenebox', 0, -1080)
	makeLuaSprite('csup','cutscenebox', 0, 720)
	
	setProperty('flashdark.alpha', 0);
	setObjectCamera('flashdark', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	
	setProperty('csup.alpha', 1);
	setObjectCamera('csup', 'hud');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'hud');
	
	addLuaSprite('flashdark')
	addLuaSprite('flashwhite')
	addLuaSprite('csup')
	addLuaSprite('csdown')

	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	downScroll = getPropertyFromClass('ClientPrefs', 'downScroll')
	if downScroll == true then
		setProperty('brushL.y', 500);
		setProperty('brushU.y', 400);
		setProperty('brushD.y', 450);
		setProperty('brushR.y', 500);
	end
	
	middle = getPropertyFromClass('ClientPrefs', 'middleScroll')
	if middle == true then
	    setProperty('brushL.x', 300);
		setProperty('brushU.x', 610);
		setProperty('brushD.x', 510);
		setProperty('brushR.x', 680);
	end
end


function onEvent(name, value1, value2)
    if name == "trigger" then
	    brushsoundrandom = getRandomInt(1, 3);
	    playSound('idk_brush_' .. brushsoundrandom, 0.8);
		
	    if idk_brush == true then
		triggerEvent('Play Animation', 'brushR', 0)
		idk_brush = false;
		else
		triggerEvent('Play Animation', 'brushL', 0)
		idk_brush = true;
		end
		
	    if value1 == '1' then
		objectPlayAnimation('brushL','BR',false);
		setProperty('brushL.alpha', 1);
		runTimer('brushLT', 5.1);
		end
		
		if value1 == '2' then
		objectPlayAnimation('brushU','BR',false);
		setProperty('brushU.alpha', 1);
		runTimer('brushUT', 5.1);
		end
		
		if value1 == '3' then
		objectPlayAnimation('brushD','BR',false);
		setProperty('brushD.alpha', 1);
		runTimer('brushDT', 5.1);
		end
		
		if value1 == '4' then
		objectPlayAnimation('brushR','BR',false);
		setProperty('brushR.alpha', 1);
		runTimer('brushRT', 5.1);
		end
    end
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'brushLT' then
	setProperty('brushL.alpha', 0);
    end
	if tag == 'brushUT' then
	setProperty('brushU.alpha', 0);
    end
	if tag == 'brushDT' then
	setProperty('brushD.alpha', 0);
    end
	if tag == 'brushRT' then
	setProperty('brushR.alpha', 0);
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
	
	end
end

function onStepHit()
    if curStep == 1 or curStep == 9999 then
	cuton(1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 128 or curStep == 1423 or curStep == 1432 or curStep == 1440 then
	flashwhite();
	end
	if curStep == 784 or curStep == 9999 then
	flashdark();
	end
	if curStep == 9999 or curStep == 9999 then
	xx = 200;
    xx2 = 200; 
	yy = 1250;
	yy2 = 1250;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 9999 or curStep == 9999 then
	xx = -100
	xx2 = 500
	yy = 1300;
	yy2 = 1300;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 9999 or curStep == 9999 then
	beating = true;
	end
	if curStep == 9999 or curStep == 9999 then
	beating = false;
	end
	----
	if curStep == 760 then
	cuton(3)
	xx = -200
	yy = 1500
	triggerEvent('Camera Follow Pos',xx,yy)
	doTweenAlpha('STARE1', 'bg', 0.4, 1, 'linear');
	end
    if curStep == 784 then
	cuton(1)
	xx = 0
	yy = 1300
	triggerEvent('Camera Follow Pos',xx,yy)
	doTweenAlpha('STARE1', 'bg', 1, 1, 'linear');
	end
	if curStep == 197 then
	flashwhite()
	setProperty('floor.alpha', 1);
	end
	if curStep == 508 then
	flashwhite()
	setProperty('buildings.alpha', 1);
	end
	if curStep == 577 then
	flashwhite()
	setProperty('sky.alpha', 1);
	end
	if curStep == 888 then
	flashwhite()
	setProperty('drawing.alpha', 1);
	end
	if curStep == 984 then
	flashwhite()
	setProperty('jeremy.alpha', 1);
	end
	if curStep == 1448 then
	doTweenAlpha('endtweenhud', 'camHUD', 0, 1.5, 'linear');
	end
end

function onUpdate()
	
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
	
	if lockscreen == true then
	setProperty('camFollowPos.x',lockx)
    setProperty('camFollowPos.y',locky)
	setProperty('camGame.zoom',lockzoom)
	triggerEvent('Camera Follow Pos',lockx,locky)
	end
	
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
			end

        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
			end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end


function flashwhite()
    setProperty('flashwhite.alpha', 0.5);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end

function flashdark()
    setProperty('flashdark.alpha', 1);
	doTweenAlpha('flashdowndark', 'flashdark', 0, 3, 'linear');
end

function cuton(level)
    doTweenY('CSUPY', 'csup', 720-(50*level), 1, 'CircInOut');
    doTweenY('SCDOWNY', 'csdown', -1080+(50*level), 1, 'CircInOut');
end

function cutoff()
    doTweenY('CSUPYend', 'csup', 720, 1, 'CircInOut');
    doTweenY('SCDOWNYend', 'csdown', -1080, 1, 'CircInOut');
end

function opponentNoteHit()
    if screenshake == true then
        triggerEvent('Screen Shake','0.02, 0.01','0.1, 0.0075');
	end
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.01);
		end
    end