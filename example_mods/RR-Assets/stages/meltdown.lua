local xx = -100;
local yy = 1300; 
local xx2 = 500; 
local yy2 = 1325;
local xx3 = 350; 
local yy3 = 1280;
local ofs = 15;
local followchars = false;
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
local dadZoom = 0.66
local bfZoom = 0.75
local gfZoom = 0.85



function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('gf.alpha', 0.75);
	setProperty('boyfriend.alpha', 0.75);
	setBlendMode('gf', 'add')
	setBlendMode('boyfriend', 'add')
end

function onCreate()
	
	setProperty('camHUD.alpha', 0);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('floor','BG/red/layer1', -1850, -300)
	makeLuaSprite('back1','BG/red/layer2', -700, 550)
	setScrollFactor('back1', 0.75, 0.75);
	makeLuaSprite('bgrock','BG/red/layer3', -1050, 450)
	setScrollFactor('bgrock', 0.5, 0.5);
	scaleObject('bgrock', 0.7, 0.7);
	makeLuaSprite('sky','BG/red/sky', -1350, -1200)
	setScrollFactor('sky', 0.15, 0.15);
	
	makeAnimatedLuaSprite('gangs','BG/red/backgroundbois', -1050, 1150)
	addAnimationByPrefix('gangs','loop','idle',24,false)
    objectPlayAnimation('gangs','loop',false);
	setScrollFactor('gangs', 0.55, 0.9);
	scaleObject('gangs',1.3,1.3)
	playAnim('gangs','loop', true);
	setProperty('gangs.alpha', 1);
	
	makeAnimatedLuaSprite('deadgf','BG/red/deadgf', -50, 1450)
	addAnimationByPrefix('deadgf','loop','deadgf', 24, true)
	
	makeLuaSprite('deadbf','BG/red/deadbf', 550, 1330)
	
	makeLuaSprite('redlight','BG/red/redlight', 0, 0)
	setProperty('redlight.alpha', 0);
	setObjectCamera('redlight', 'other');
	setBlendMode('redlight', 'add')
	
	
	addLuaSprite('sky')
	addLuaSprite('bgrock')
	addLuaSprite('back1')
	addLuaSprite('floor')
	addLuaSprite('deadgf')
	addLuaSprite('deadbf')
	
	addLuaSprite('gangs', true)
	addLuaSprite('redlight')
	
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

function onEvent(name,value1,value2)
	if name == 'trigger' and value1 == '1' then
	    setProperty('flashdark.alpha', 0.35);
	    doTweenAlpha('triggerfadedark', 'flashdark', 0, 0.07, 'linear');
		triggerEvent('Add Camera Zoom',0.035,0.025)
	end
end

function onBeatHit()
    if curBeat % 2 == 0 and beating == true then
	triggerEvent('Add Camera Zoom',0.035,0.025)
	
	setProperty('redlight.alpha', 1);
	doTweenAlpha('redboom', 'redlight', 0, 0.5, 'linear');
	triggerEvent('Add Camera Zoom','0.03','0.02');
	end
    if curBeat % 2 == 0 then
	objectPlayAnimation('gangs','loop',true);
	objectPlayAnimation('deadgf','loop',true);
	end
end

function onStepHit()
   if curStep == 9999 or curStep == 9999 then
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
	if curStep == 271 or curStep == 655 or curStep == 894 or curStep == 1167 then
	beating = true;
	end
	if curStep == 511 or curStep == 767 or curStep == 1023 then
	beating = false;
	end
	----
	if curStep == 32 then
    doTweenAlpha('introfade', 'flashdark', 0, 6, 'linear');
	end
	if curStep == 112 then
	doTweenAlpha('introfadeHUD', 'camHUD', 1, 1, 'linear');
	cuton(1, 1);
    end
	if curStep == 128 then
	flashwhite();
	followchars = true;
	end
	if curStep == 248 or curStep == 632 or curStep == 888 or curStep == 1016 then
	cuton(3,0.2);
	end
	if curStep == 252 or curStep == 894 or curStep == 1022 or curStep == 1149 then
	cuton(8,0.2);
	end
	if curStep == 272 or curStep == 640 or curStep == 896 or curStep == 1168 then
	flashwhite();
	cuton(1, 0.2);
	end
	if curStep == 1056 then
	cuton(5, 10)
	end
	if curStep == 1408 then
	beating = false;
	flashwhite();
	end
	if curStep == 1424 then
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
	setProperty('camGame.scroll.x',lockx-(screenWidth / 2))
    setProperty('camGame.scroll.y',locky-(screenHeight / 2))
	setProperty('camGame.zoom',lockzoom)
	triggerEvent('Camera Follow Pos',lockx,locky)
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
		setProperty('defaultCamZoom',dadZoom)
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
			setProperty('defaultCamZoom',gfZoom)
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
			setProperty('defaultCamZoom',bfZoom)
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