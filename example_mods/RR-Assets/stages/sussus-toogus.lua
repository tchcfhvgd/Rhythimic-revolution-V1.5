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


function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
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
	
	makeLuaSprite('shadowgamma','BG/green/shadow', 750, 1550)
	setProperty('shadowgamma.alpha', 0.33);
	setBlendMode('shadowgamma', 'MULTIPLY')
	
	makeAnimatedLuaSprite('ele','BG/green/ele', -680, 1050)
	addAnimationByPrefix('ele','loop','idle', 24, true)
	
	makeAnimatedLuaSprite('shiro','BG/green/shiro', -880, 1050)
	addAnimationByPrefix('shiro','loop','stand', 24, false)
	
	makeAnimatedLuaSprite('gamma','BG/green/gamma', 850, 1100)
	addAnimationByPrefix('gamma','loop','idle', 24, false)
	
	makeAnimatedLuaSprite('powers','BG/green/powers', -1380, 750)
	addAnimationByPrefix('powers','doot','doot 1', 24, false)
	scaleObject('powers', 1.6, 1.6);
	setProperty('powers.alpha', 0.001);

	addLuaSprite('floor')
	addLuaSprite('shadowMitori')
	addLuaSprite('shadowBF')
	addLuaSprite('shadowGF')
	addLuaSprite('shadowshiro')
	addLuaSprite('shadowgamma')
	addLuaSprite('ele')
	addLuaSprite('shiro')
	addLuaSprite('gamma')
	addLuaSprite('powers', true)
	addLuaSprite('light', true)
	
	-----------------------------------------
	
	makeLuaSprite('flashdark','Flashdark', 0, 0)
	makeLuaSprite('flashwhite','Flashwhite', 0, 0)
	
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
	
	addLuaSprite('flashdark')
	addLuaSprite('flashwhite')
	addLuaSprite('csup')
	addLuaSprite('csdown')
	
	xx = 200;
    xx2 = 1200; 
	yy = 650;
	yy2 = 1250;
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
end

function onBeatHit()
    if curBeat % 4 == 0 then
	objectPlayAnimation('shiro','loop',true);
	objectPlayAnimation('gamma','loop',true);
	end
end

function onStepHit()
    if curStep == 192 or curStep == 9999 then
	cuton(1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 127 or curStep == 575 or curStep == 831 then
	flashwhite();
	end
	if curStep == 9999 or curStep == 9999 then
	flashdark();
	end
	if curStep == 575 or curStep == 831 or curStep == 960 or curStep == 1536 then
	xx = 200;
    xx2 = 200; 
	yy = 1250;
	yy2 = 1250;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 192 or curStep == 768 or curStep == 896 or curStep == 1023 then
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
	if curStep == 64 then
	flashwhite()
	setProperty('flashdark.alpha', 0);
	yy = 1300;
	yy2 = 1300;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 180 then
	xx = -100;
    xx2 = -100; 
	yy = 1450;
	yy2 = 1450;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 192 then
	flashwhite();
	setProperty('camHUD.alpha', 1);
	cuton();
	end
	if curStep == 640 or curStep == 656 then
	lockx = -100
	locky = 1250;
	lockzoom = 0.8;
	lockscreen = true;
	followchars = false;
	end
	if curStep == 644 or curStep == 664 then
	lockx = 500
	locky = 1250;
	lockzoom = 0.8;
	lockscreen = true;
	followchars = false;
	end
	if curStep == 672 then
	lockx = 200
	locky = 1350;
	lockzoom = 0.65;
	end
	if curStep == 688 then
	lockscreen = false;
	followchars = true;
	triggerEvent('Camera Follow Pos',xx,yy)
	objectPlayAnimation('powers','doot',false);
	setProperty('powers.alpha', 1);
	end
	if curStep == 704 then
	doTweenX('powersmooving', 'powers', 1300, 12.5, 'linear')
	end
	if curStep == 735 then
	triggerEvent('Camera Follow Pos',xx2,yy2)
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
	setProperty('camGame.scroll.x',lockx-(screenWidth / 2))
    setProperty('camGame.scroll.y',locky-(screenHeight / 2))
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