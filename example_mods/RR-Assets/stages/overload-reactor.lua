local xx = 0;
local yy = 1100; --1300
local xx2 = 300; 
local yy2 = 1100;--1300
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


function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
	
	triggerEvent('Camera Follow Pos',xx,yy)
	middle = getPropertyFromClass('ClientPrefs', 'middleScroll')
	if middle == false then
		for i = 0,7 do
			xValue = getPropertyFromGroup('strumLineNotes', i, 'x')
			if i < 3.5 then
				setPropertyFromGroup('strumLineNotes', i, 'x', xValue+9999)
			else
				setPropertyFromGroup('strumLineNotes', i, 'x', xValue-320)
			end
		end
	end
end

function onCreate()
	setProperty('gf.alpha', 1);
	setProperty('boyfriend.alpha', 1);
	setProperty('camHUD.alpha', 0);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('floor','BG/green/reactor/floor1', -1850, 950)
	
	makeLuaSprite('light','BG/green/reactor/light', -1350, 0)
	setBlendMode('light', 'add')
	setProperty('light.alpha', 0.3);
	
	makeLuaSprite('shadow','BG/green/reactor/shadow', -1300, 400)
	setScrollFactor('shadow', 0.65, 0.65);
	
	
	makeLuaSprite('background','BG/green/reactor/background', -1500, -1200)
	setScrollFactor('background', 0.35, 0.35);
	
	makeLuaSprite('reactor','BG/green/reactor/reactor', -400, -900)
	setScrollFactor('reactor', 0.65, 0.65);
	
	makeAnimatedLuaSprite('ball','BG/green/reactor/ball', -450, -100)
	addAnimationByPrefix('ball','loop','ball', 24, true)
	setScrollFactor('ball', 0.65, 0.65);
	
	
	makeLuaSprite('shadowMitori','BG/green/shadow', -630, 1540)
	setProperty('shadowMitori.alpha', 0.66);
	setBlendMode('shadowMitori', 'MULTIPLY')
	
	makeLuaSprite('shadowBF','BG/green/shadow', 370, 1520)
	setProperty('shadowBF.alpha', 0.66);
	setBlendMode('shadowBF', 'MULTIPLY')
	
	makeLuaSprite('shadowGF','BG/green/shadow', 20, 1450)
	setProperty('shadowGF.alpha', 0.66);
	setBlendMode('shadowGF', 'MULTIPLY')

    addLuaSprite('background')
	addLuaSprite('shadow')
	addLuaSprite('reactor')
	addLuaSprite('ball')
	addLuaSprite('floor')
	addLuaSprite('light', true)
	
	addLuaSprite('shadowBF')
	addLuaSprite('shadowGF')
	addLuaSprite('shadowMitori')
	
	-----------------------------------------
	
	makeLuaSprite('flashdark','Flashdark', 0, 0)
	makeLuaSprite('flashwhite','Flashwhite', 0, 0)
	makeLuaSprite('DarkSC','DarkSC', 0, 0)
	setProperty('DarkSC.alpha', 0.3);
	setObjectCamera('DarkSC', 'other');
	addLuaSprite('DarkSC')
	
	makeLuaSprite('csdown','cutscenebox', 0, -1080)
	makeLuaSprite('csup','cutscenebox', 0, 720)
	
	setProperty('flashdark.alpha', 1);
	setObjectCamera('flashdark', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	
	setProperty('csup.alpha', 1);
	setObjectCamera('csup', 'hud');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'hud');
	
	makeLuaSprite('warning','BG/green/reactor/overload', 0, 0)
	setProperty('warning.alpha', 0.75);
	setObjectCamera('warning', 'other');
	
	addLuaSprite('warning')
	addLuaSprite('flashdark')
	addLuaSprite('flashwhite')
	addLuaSprite('csup')
	addLuaSprite('csdown')
	addLuaSprite('DarkSC')
	
	
end

function onStepHit()
    if curStep == 1 or curStep == 9999 then
	cuton(1, 1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 256 or curStep == 9999 then
	flashwhite();
	end
	if curStep == 9999 or curStep == 9999 then
	flashdark();
	end
	if curStep == 9999 or curStep == 9999 then
	xx = 100;
    xx2 = 100; 
	yy = 1050;
	yy2 = 1050;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 9999 or curStep == 9999 then
	xx = 0;
    yy = 1100;
 	xx2 = 300; 
 	yy2 = 1100;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 9999 or curStep == 9999 then
	beating = true;
	end
	if curStep == 9999 or curStep == 9999 then
	beating = false;
	end
	----
	if curStep == 1 then
	doTweenAlpha('introfade', 'flashdark', 0, 2, 'linear');
	end
	if curStep == 128 then
	doTweenY('warninggoaway', 'warning', 1280, 3, 'CircInOut');
	end
	if curStep == 224 or curStep == 2479 then
	doTweenAlpha('introfadeHUD', 'camHUD', 1, 2, 'linear');
	end
	if curStep == 768 or curStep == 1584 then
	cuton(8,0.5)
	end
	if curStep == 832 or curStep == 1408 or curStep == 1536 or curStep == 1856 or curStep == 2128 then
	cuton(1,0.5)
	end
	if curStep == 1392 or curStep == 1520 then
	cuton(3,0.05)
	end
	if curStep == 1396 or curStep == 1524 then
	cuton(6,0.05)
	end
	if curStep == 1400 or curStep == 1528 or curStep == 2914 or curStep == 3192 or curStep == 3456 then
	cuton(8,0.05)
	end
	if curStep == 1616 or curStep == 1876 or curStep == 2944 or curStep == 3200 then
	cuton(3,5)
	end
	if curStep == 2384 then
	doTweenAlpha('dialogues', 'camHUD', 0, 1, 'linear');
	end
	if curStep == 3520 then
	setProperty('camHUD.alpha', 0);
	setProperty('flashdark.alpha', 1);
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

function cuton(level, speed)
    doTweenY('CSUPY', 'csup', 720-(50*level), speed, 'CircInOut');
    doTweenY('SCDOWNY', 'csdown', -1080+(50*level), speed, 'CircInOut');
end

function cutoff()
    doTweenY('CSUPYend', 'csup', 720, 1, 'CircInOut');
    doTweenY('SCDOWNYend', 'csdown', -1080, 1, 'CircInOut');
end

function opponentNoteHit()
    if screenshake == true then
        triggerEvent('Screen Shake','0.02, 0.01','0.1, 0.0075');
	end
end