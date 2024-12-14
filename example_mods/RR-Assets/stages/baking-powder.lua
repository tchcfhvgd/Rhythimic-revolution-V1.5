local xx = -100;
local yy = 1050; 
local xx2 = 300; 
local yy2 = 1100;
local xx3 = 350; 
local yy3 = 1280;
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
local redboom = false;
local redboomslow = false;


function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onCreate()
	
	setProperty('camHUD.alpha', 1);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('light','BG/spaceship/deathrun/light', -1850, 0)
	setProperty('light.alpha', 0.25);
	setBlendMode('light', 'add')
	
	makeLuaSprite('floor','BG/spaceship/cooking/floor', -1400, -200)
	makeLuaSprite('back','BG/spaceship/cooking/back', -1400, -200)
	
    makeAnimatedLuaSprite('backchef1', 'BG/spaceship/cooking/backchef', -1020, 670);
	addAnimationByPrefix("backchef1", 'idle', 'shark', 24, false);
	
	makeAnimatedLuaSprite('backchef2', 'BG/spaceship/cooking/backchef', 920, 670);
	addAnimationByPrefix("backchef2", 'idle', 'orange', 24, false);
	
	makeAnimatedLuaSprite('william', 'BG/spaceship/cooking/backchef', 20, 610);
	addAnimationByPrefix("william", 'idle', 'william', 24, true);
	scaleObject('william', 0.9, 0.9);
	
	makeAnimatedLuaSprite('clean1', 'BG/spaceship/cooking/cleanchef', 200, 0);
	addAnimationByPrefix("clean1", 'idle', 'clean', 24, false);
	setObjectCamera('clean1', 'other');
	setProperty('clean1.alpha', 0);
	
	makeAnimatedLuaSprite('clean2', 'BG/spaceship/cooking/cleanchef', 0, 100);
	addAnimationByPrefix("clean2", 'idle', 'yellow', 24, false);
	setObjectCamera('clean2', 'other');
	setProperty('clean2.alpha', 0);


    makeLuaSprite('shadowback1','BG/green/shadow', -1050, 1250)
	setProperty('shadowback1.alpha', 0.5);
	setBlendMode('shadowback1', 'MULTIPLY')
	
	 makeLuaSprite('shadowback2','BG/green/shadow', 760, 1200)
	setProperty('shadowback2.alpha', 0.5);
	setBlendMode('shadowback2', 'MULTIPLY')
	
	makeLuaSprite('shadowdillaw','BG/green/shadow', -820, 1370)
	setProperty('shadowdillaw.alpha', 0.5);
	setBlendMode('shadowdillaw', 'MULTIPLY')
	scaleObject('shadowdillaw', 1.5, 1.5);
	
	makeLuaSprite('shadowbf','BG/green/shadow', 420, 1425)
	setProperty('shadowbf.alpha', 0.5);
	setBlendMode('shadowbf', 'MULTIPLY')
	
	makeLuaSprite('shadowgf','BG/green/shadow', 120, 1325)
	setProperty('shadowgf.alpha', 0.5);
	setBlendMode('shadowgf', 'MULTIPLY')
	
	makeLuaSprite('camerahud','BG/spaceship/cooking/hud', 0, 0)
	setObjectCamera('camerahud', 'other');
	
	makeLuaSprite('logo','BG/spaceship/cooking/logo', 350, 200)
	setObjectCamera('logo', 'other');
	scaleObject('logo', 1.5, 1.5);
	setProperty('logo.alpha', 0);

	addLuaSprite('floor')
	
	addLuaSprite('shadowback1')
	addLuaSprite('backchef1')
	
	addLuaSprite('shadowback2')
	addLuaSprite('backchef2')
	
	addLuaSprite('william')
	
	addLuaSprite('back')

	addLuaSprite('shadowdillaw')
	addLuaSprite('shadowbf')
	addLuaSprite('shadowgf')
	
	addLuaSprite('clean1')
	addLuaSprite('clean2')
	
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
	addLuaSprite('logo')
	addLuaSprite('camerahud')
	
	addLuaSprite('csup')
	addLuaSprite('csdown')
	addLuaSprite('flashwhite')
	
	cuton(8,0.1);

end

function onEvent(name,value1,value2)
	if name == 'trigger' and value1 == '1' then
	    setProperty('flashdark.alpha', 0.35);
	    doTweenAlpha('triggerfadedark', 'flashdark', 0, 0.07, 'linear');
		triggerEvent('Add Camera Zoom',0.035,0.025)
	end
end

function onBeatHit()
    if curBeat % 2 == 0 then
	objectPlayAnimation('backchef1','idle',true);
	objectPlayAnimation('backchef2','idle',true);
	end
end

function cleaning()

   objectPlayAnimation('clean2','idle',true);
   setProperty('clean2.alpha', 1);
   runTimer('cleanwait', 3.5)
   
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'cleanwait' then
	objectPlayAnimation('clean1','idle',true);
    setProperty('clean1.alpha', 1);
	end
end

function onStepHit()
   if curStep == 9999 or curStep == 9999 then
	cuton(1, 1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 1214 or curStep == 9999 then
	flashwhite();
	end
	if curStep == 9999 or curStep == 9999 then
	flashdark();
	end
	if curStep == 799 or curStep == 9999 then
	xx = 200;
    xx2 = 200; 
	yy = 1100;
	yy2 = 1100;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 946 or curStep == 9999 then
	xx = -100
	xx2 = 300
	yy = 1150;
	yy2 = 1200;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 9999 or curStep == 9999 then
	beating = true;
	end
	if curStep == 9999 or curStep == 9999 then
	beating = false;
	end
	----
	if curStep == 612 then
	cleaning();
	end
	if curStep == 12 then
	doTweenAlpha('intrologo', 'logo', 1, 1.5, 'linear');
	end
	if curStep == 18 or curStep == 21 or curStep == 24 then
	flashwhite();
	end
	if curStep == 32 then
	flashwhite();
	cuton(1, 1);
	setProperty('flashdark.alpha', 0);
	
	doTweenAlpha('logofade', 'logo', 0.5, 2, 'sineInOut');
	
	doTweenX('logoscaleX', 'logo.scale', 0.85, 2, 'sineInOut')
	doTweenY('logoscaleY', 'logo.scale', 0.85, 2, 'sineInOut')
	
	doTweenX('logoposX', 'logo', -100, 2, 'sineInOut')
	doTweenY('logoposY', 'logo', 425, 2, 'sineInOut')
	
	end
	if curStep == 280 or curStep == 799 then
	cuton(3, 0.2);
	end
	if curStep == 284 then
	cuton(5, 0.2);
	end
	if curStep == 288 or curStep == 946 then
	cuton(1, 0.2);
	end
	if curStep == 926 then
	cuton(8, 0.25);
	end
	if curStep == 1223 then
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
	end
	
	if mustHitSection == false then
	    doTweenX('gangreturnX', 'gangs.scale', 1.3, 0.25, 'linear')
	    doTweenY('gangreturnY', 'gangs.scale', 1.3, 0.25, 'linear')
		doTweenAlpha('gangalpha', 'gangs', 1, 0.4, 'linear');
	else
	    doTweenX('gangzoomX', 'gangs.scale', 1.45, 0.25, 'linear')
	    doTweenY('gangzoomY', 'gangs.scale', 1.45, 0.25, 'linear')
		doTweenAlpha('gangalphareturn', 'gangs', 0.85, 0.4, 'linear');
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
		
		
		    if gfSection == true then
			    if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
		    	if getProperty('gf.animation.curAnim.name') == 'danceLeft' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
		    	end
		    	if getProperty('gf.animation.curAnim.name') == 'danceRight' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
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
        end
    else
        triggerEvent('Camera Follow Pos',200,1250)
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
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.01);
		end
    end