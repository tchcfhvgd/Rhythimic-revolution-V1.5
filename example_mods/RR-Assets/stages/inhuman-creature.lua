local xx = -100;
local yy = 1350; 
local xx2 = 300; 
local yy2 = 1325;
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
local dadZoom = 1
local bfZoom = 0.8



function onCreatePost()
    triggerEvent('Camera Follow Pos',xx2,yy2)
	setProperty('camFollowPos.x',xx2)
    setProperty('camFollowPos.y',yy2)
	setProperty('gf.alpha', 0);
end

function onCreate()
	
	setProperty('camHUD.alpha', 0);
	
	
	
	makeLuaSprite('bg','BG/jerma/bg', -1550, -300)
	makeLuaSprite('bg2','BG/jerma/bg2', -1550, -300)
	setProperty('bg2.alpha', 0);
	makeLuaSprite('dark','BG/jerma/shadow', -1550, -300)
	
	addLuaSprite('bg')
	addLuaSprite('bg2')
	--addLuaSprite('dark', true)
	
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
	
	makeLuaSprite('DarkSC','DarkSC', 0, 0)
	setProperty('DarkSC.alpha', 0.5);
	setObjectCamera('DarkSC', 'other');
	addLuaSprite('DarkSC');
	
	makeAnimatedLuaSprite('beeep','BG/jerma/glitch', 0, 0);
		addAnimationByPrefix('beeep', 'loop', 'staticFLASH', 24, true);
	setObjectCamera('beeep', 'other');
	scaleObject('beeep',4,3)
	setProperty('beeep.alpha', 0.1);
	addLuaSprite('beeep');
	
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
    if curBeat % 1 == 0 and beating == true then
	triggerEvent('Add Camera Zoom',0.035,0.025)
	end
end

function onStepHit()
   if curStep == 9999 or curStep == 9999 then
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
	if curStep == 1440 or curStep == 1575 or curStep == 2111 then
	beating = true;
	end
	if curStep == 1567 or curStep == 1695 or curStep == 2880 then
	beating = false;
	end
	----
	if curStep == 16 then
    doTweenAlpha('flashdowndark', 'flashdark', 0, 3, 'linear');
	end
	if curStep == 64 then
	doTweenAlpha('hudfade', 'camHUD', 1, 1, 'linear');
	cuton(1, 1);
	end
	if curStep == 240 then
	doTweenAlpha('transformhudfade1', 'camHUD', 0, 0.5, 'linear');
	dadZoom = 1.2
	end
	if curStep == 256 then
	doTweenAlpha('transformhudfade2', 'camHUD', 1, 0.25, 'linear');
	dadZoom = 1
	end
	if curStep == 1280 then
	setProperty('flashdark.alpha', 1);
	setProperty('bg2.alpha', 1);
	setProperty('bg.alpha', 0);
	end
	if curStep == 1312 then
	flashwhite();
	setProperty('flashdark.alpha', 0);
	end
	if curStep == 1568 then
	cuton(3, 0.3)
	end
	if curStep == 1576 then
	cuton(1, 0.1);
	end
	if curStep == 1824 then
	doTweenAlpha('flashdowndark', 'flashdark', 1, 2.25, 'linear');
	end
	if curStep == 1856 then
	flashwhite();
	setProperty('flashdark.alpha', 0);
	setProperty('bg2.alpha', 0);
	setProperty('bg.alpha', 1);
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
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.01);
		end
    end