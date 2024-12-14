local xx = -100;
local yy = 1300; --1300
local xx2 = 500; 
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
local dodgetiming = false;
local dodgesuccess = false;


function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
	
	addCharacterToList('mitori-2-dark')
	addCharacterToList('BB-BF-dark')
	addCharacterToList('BB-GF-dark')
end

function onCreate()
	setProperty('gf.alpha', 1);
	setProperty('boyfriend.alpha', 1);
	setProperty('camHUD.alpha', 0);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('floor','BG/green/stage', -1850, 200)
	
	makeLuaSprite('light','BG/green/light', -1850, 0)
	setProperty('light.alpha', 0.25);
	setBlendMode('light', 'add')
	
	makeLuaSprite('shadowMitori','BG/green/shadow', -630, 1600)
	setProperty('shadowMitori.alpha', 0.33);
	setBlendMode('shadowMitori', 'MULTIPLY')
	
	makeLuaSprite('shadowBF','BG/green/shadow', 370, 1620)
	setProperty('shadowBF.alpha', 0.33);
	setBlendMode('shadowBF', 'MULTIPLY')
	
	makeLuaSprite('shadowGF','BG/green/shadow', 20, 1570)
	setProperty('shadowGF.alpha', 0.33);
	setBlendMode('shadowGF', 'MULTIPLY')
	
	makeLuaSprite('shadowshiro','BG/green/shadow', -1000, 1570)
	setProperty('shadowshiro.alpha', 0.33);
	setBlendMode('shadowshiro', 'MULTIPLY')
	
	makeAnimatedLuaSprite('ele','BG/green/ele', -680, 1050)
	addAnimationByPrefix('ele','loop','idle', 24, true)
	
	makeLuaSprite('darkbackground','Flashdark', -1850, 0)
	setProperty('darkbackground.alpha', 0);
	scaleObject('darkbackground',3,3)
	
	makeLuaSprite('lightdown','Flashdark', -1850, 0)
	setProperty('lightdown.alpha', 0);
	scaleObject('lightdown',3,3)
	
	makeAnimatedLuaSprite('alert','BG/green/alert', 450, 280)
	addAnimationByPrefix('alert','loop','alert', 24, false)
	setObjectCamera('alert', 'other');
	scaleObject('alert',0.6, 0.6);
	setProperty('alert.alpha', 0);

	addLuaSprite('floor')
	addLuaSprite('shadowMitori')
	addLuaSprite('shadowBF')
	addLuaSprite('shadowGF')
	addLuaSprite('shadowshiro')
	addLuaSprite('ele')
	addLuaSprite('lightdown')
	addLuaSprite('darkbackground', true)
	addLuaSprite('alert', true)
	
	-----------------------------------------
	
	makeLuaSprite('flashdark','Flashdark', 0, 0)
	makeLuaSprite('flashwhite','Flashwhite', 0, 0)
	makeLuaSprite('DarkSC','DarkSC', 0, 0)
	
	makeLuaSprite('csdown','cutscenebox', 0, -1080)
	makeLuaSprite('csup','cutscenebox', 0, 720)
	
	setProperty('DarkSC.alpha', 0.3);
	setObjectCamera('DarkSC', 'other');
	
	setProperty('flashdark.alpha', 1);
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
	addLuaSprite('DarkSC')


	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	doTweenAlpha('stagedarkfadeout', 'darkbackground', 0.4, 5, 'CircInOut');
end

function onEvent(name,value1,value2)
	if name == 'trigger' then
	doTweenAlpha('alertfade', 'alert', 1, 0.3, 'linear');
	objectPlayAnimation('alert','loop',true);
	runTimer('dodge_timing', 1)
	triggerEvent('Play Animation', 'attack', 0);
	cuton(2);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'dodge_timing' then
	dodgetiming = true;
	runTimer('dodge_end', 0.55)
	end
	if tag == 'dodge_end' then
	dodgetiming = false;
	doTweenAlpha('alertfade', 'alert', 0, 0.3, 'linear');
	flashwhite();
	cuton(1);
	playSound('mitori_slash', 1.3);
	    if dodgesuccess == true then
		triggerEvent('Play Animation', 'dodge', 1);
		playSound('mitori_swing', 0.8);
		else
		triggerEvent('Play Animation', 'singUPmiss', 1);
		setProperty('health', 0);
		end
	end
end

function onTweenCompleted(tag)
    if tag == 'stagedarkfadeout' then
	doTweenAlpha('stagedarkfadein', 'darkbackground', 0.25, 5, 'CircInOut');
	end
	if tag == 'stagedarkfadein' then
	doTweenAlpha('stagedarkfadeout', 'darkbackground', 0.4, 5, 'CircInOut');
	end
end

function onBeatHit()
    if curBeat % 2 == 0 and beating == true then
	triggerEvent('Add Camera Zoom',0.035,0.025)
	end
end

function onStepHit()
    if curStep == 9999 or curStep == 9999 then
	cuton(1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 128 or curStep == 1830 or curStep == 2352 then
	flashwhite();
	end
	if curStep == 9999 or curStep == 9999 then
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
	if curStep == 16 then
	doTweenAlpha('screenfade', 'flashdark', 0.5, 6, 'linear');
	end
	if curStep == 112 or curStep == 1679 then
	doTweenAlpha('camHUDfade', 'camHUD', 1, 1, 'linear');
	cuton(1);
	end
	if curStep == 128 then
	setProperty('flashdark.alpha', 0);
	end
	if curStep == 239 then
	cuton(3);
	yy2 = 1400;
	triggerEvent('Camera Follow Pos',xx2,yy2)
	end
	if curStep == 262 then
	flashwhite()
	cuton(1);
	yy2 = 1300;
	beating = true;
	end
	if cutStep == 384 then
	cuton(3);
	end
	if cutStep == 384 then
	flashwhite();
	cuton(1);
	end
	if curStep == 464 then
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 495 then
	triggerEvent('Camera Follow Pos',xx-144,yy+30)
	end
	if curStep == 505 then
	triggerEvent('Camera Follow Pos',xx+50,yy+10)
	end
	if curStep == 768 then
	flashdark();
	triggerEvent('Change Character', 1, 'mitori-2-dark')
	triggerEvent('Change Character', 0, 'BB-BF-dark')
	triggerEvent('Change Character', 2, 'BB-GF-dark')
	setProperty('stagedarkfadeout.visible', false);
	setProperty('lightdown.alpha', 1);
	end
	if curStep == 1567 then
	setProperty('camHUD.alpha', 0);
	setProperty('flashdark.alpha', 1);
	doTweenAlpha('screenfade', 'flashdark', 0.5, 6, 'linear');
	triggerEvent('Change Character', 1, 'mitori-2')
	triggerEvent('Change Character', 0, 'BB-BF')
	triggerEvent('Change Character', 2, 'BB-GF')
	setProperty('stagedarkfadeout.visible', true);
	setProperty('lightdown.alpha', 0);
	end
	if curStep == 1695 then
	flashwhite()
	setProperty('flashdark.alpha', 0);
	end
	if curStep == 2352 then
	doTweenAlpha('camHUDfade', 'camHUD', 0, 3, 'linear');
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
	
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and dodgetiming == true then
	  dodgesuccess = true;
	  doTweenColor('attackbarcolorsucc2', 'attackframe', '00FD0A', 0.01, 'linear')
	  setProperty('attackbar.visible',false)
      setProperty('attackbar_green.visible',true)
	  playSound('success_bell', 1.2);
	  dodgetiming = false;
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