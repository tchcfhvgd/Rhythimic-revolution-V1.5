local xx = -100;
local yy = 1150; 
local xx2 = 300; 
local yy2 = 1200;
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
	
	setProperty('camHUD.alpha', 0);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('floor','BG/spaceship/mainroom/floor', -1000, 200)
	makeLuaSprite('box','BG/spaceship/mainroom/box', -1000, 200)
	
	makeLuaSprite('space','BG/spaceship/mainroom/SPAAACCCEEEEEEE', -500, -500)
	setScrollFactor('space', 0, 0);
	
	makeAnimatedLuaSprite('shiro','BG/spaceship/mainroom/shirokill', -170, 975)
	addAnimationByPrefix('shiro','loop','shiro', 24, true)
	scaleObject('shiro', 0.9, 0.9);
	setProperty('shiro.alpha', 0);
	
	
	makeLuaSprite('planet','BG/spaceship/mainroom/planet', -500, -500)
	setScrollFactor('planet', 0.1, 0.1);
	
	makeLuaSprite('light','BG/green/light', -1850, 0)
	setProperty('light.alpha', 0.25);
	setBlendMode('light', 'add')
	
	makeLuaSprite('shadowdillaw','BG/green/shadow', -720, 1425)
	setProperty('shadowdillaw.alpha', 0.5);
	setBlendMode('shadowdillaw', 'MULTIPLY')
	
	makeLuaSprite('shadowbf','BG/green/shadow', 420, 1425)
	setProperty('shadowbf.alpha', 0.5);
	setBlendMode('shadowbf', 'MULTIPLY')
	
	makeLuaSprite('shadowgf','BG/green/shadow', 120, 1325)
	setProperty('shadowgf.alpha', 0.5);
	setBlendMode('shadowgf', 'MULTIPLY')
	
	makeLuaSprite('totallyreference','BG/spaceship/mainroom/totally-reference', 0, 0)
	setProperty('totallyreference.alpha', 0);
	setObjectCamera('totallyreference', 'hud');


	addLuaSprite('space')
	addLuaSprite('planet')
	addLuaSprite('floor')
	addLuaSprite('box')
	addLuaSprite('shiro')
	
	addLuaSprite('shadowdillaw')
	addLuaSprite('shadowbf')
	addLuaSprite('shadowgf')
	
	addLuaSprite('light', true)
	addLuaSprite('totallyreference')
	
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

end

function onBeatHit()
    if curBeat % 2 == 0 then
		    if beating == true then
			triggerEvent('Add Camera Zoom',0.05,0.06)
			end
	end
end

function onStepHit()
   if curStep == 146 or curStep == 9999 then
	cuton(1, 1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 9999 or curStep == 9999 then
	flashwhite();
	end
	if curStep == 9999 or curStep == 9999 then
	flashdark();
	end
	if curStep == 9999 or curStep == 9999 then
	xx = 200;
    xx2 = 200; 
	yy = 1200;
	yy2 = 1200;
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
	flashwhite();
	setProperty('flashdark.alpha', 0);
	end
	if curStep == 56 then
	xx = -270;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 146 then
	flashwhite();
	setProperty('camHUD.alpha', 1);
	xx = -100;
	triggerEvent('Camera Follow Pos',xx,yy)
	beating = true;
	end
	if curStep == 400 then
	fuckingreference();
	end
	if curStep == 655 or curStep == 1151 then
	beating = false;
	end
	if curStep == 911 or curStep == 1295 then
	beating = true;
	end
	if curStep == 1151 or curStep == 1404 or curStep == 1936 then
	cuton(3, 0.5)
	end
	if curStep == 1168 or curStep == 1424 then
	cuton(1, 0.5)
	flashwhite();
	end
	if curStep == 2064 then
	beating = false;
	cuton(1, 0.1)
	flashwhite();
	triggerEvent('Play Animation',"surprised",1)
	triggerEvent('Play Animation',"dead",2)
	triggerEvent('Play Animation',"behind",0)
	doTweenAlpha('outro', 'outro', 0, 1, 'linear');
	setProperty('shiro.alpha', 1);
	setProperty('camHUD.alpha', 0);
	end
	if curStep == 2128 then
	doTweenAlpha('theendweeee', 'flashdark', 1, 3, 'linear');
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

function fuckingreference()
    playSound('vineboom', 0.15);
    setProperty('totallyreference.alpha', 0.75);
	doTweenAlpha('totallyreference', 'totallyreference', 0, 1.5, 'linear');
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