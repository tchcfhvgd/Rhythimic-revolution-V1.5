local xx = -100;
local yy = 1300; 
local xx2 = 500; 
local yy2 = 1300;
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
	setProperty('gf.alpha', 1);
	setProperty('boyfriend.alpha', 1);
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
	
	makeLuaSprite('redlight','BG/red/redlight', 0, 0)
	setProperty('redlight.alpha', 0);
	setObjectCamera('redlight', 'other');
	setBlendMode('redlight', 'add')
	
	
	addLuaSprite('sky')
	addLuaSprite('bgrock')
	addLuaSprite('back1')
	addLuaSprite('floor')
	
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
	
	xx = 200;
    xx2 = 200;
	yy = 650;
    yy2 = 650; 
end

function onBeatHit()
    if curBeat % 2 == 0 and redboom == true then
	setProperty('redlight.alpha', 1);
	doTweenAlpha('redboom', 'redlight', 0, 0.5, 'linear');
	triggerEvent('Add Camera Zoom','0.03','0.02');
	end
	if curBeat % 4 == 0 and redboomslow == true then
	setProperty('redlight.alpha', 0.5);
	doTweenAlpha('redboom', 'redlight', 0, 0.5, 'linear');
	triggerEvent('Add Camera Zoom','0.015','0.01');
	end
end

function onStepHit()
    if curStep == 760 or curStep == 780 or curStep == 804 or curStep == 844 or curStep == 868 then
	cuton(1, 1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 384 or curStep == 1552 then
	flashwhite();
	end
	if curStep == 9999 or curStep == 9999 then
	flashdark();
	end
	if curStep == 384 or curStep == 9999 then
	xx = 200;
    xx2 = 200; 
	yy = 1200;
	yy2 = 1200;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 128 or curStep == 640 or curStep == 9999 then
	xx = -100
	xx2 = 500
	yy = 1300;
	yy2 = 1300;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 384 then
	redboom = true
	end
	if curStep == 9999 or curStep == 9999 then
	beating = true;
	end
	if curStep == 9999 or curStep == 9999 then
	beating = false;
	end
	----
	if curStep == 1 then
	doTweenAlpha('flashdowndark', 'flashdark', 0, 7, 'linear');
	end
	if curStep == 63 then
	yy = 1300;
	yy2 = 1300;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 112 then
	doTweenAlpha('hudreturn', 'camHUD', 1, 1, 'linear');
	cuton(1, 1)
	end
	if curStep == 370 then
	xx2 = 650
	yy2 = 1550;
	end
	if curStep == 376 then
	cuton(3, 0.1)
	end
	if curStep == 380 then
	cuton(4, 0.1)
	end
	if curStep == 384 then
	cuton(1, 1)
	end
	if curStep == 632 then
	xx2 = 650
	yy2 = 1550;
	triggerEvent('Camera Follow Pos',xx2,yy2)
	cuton(3, 0.5)
	end
	if curStep == 640 then
	redboom = false;
	redboomslow = true;
	setProperty('flashdark.alpha', 1);
	end
	if curStep == 648 then
	setProperty('flashdark.alpha', 0);
	flashwhite();
	cuton(1, 1)
	end
	if curStep == 752 or curStep == 774 or curStep == 792 or curStep == 838 or curStep == 856 then
	cuton(2, 0.15)
	end
	if curStep == 896 then
	redboomslow = false;
	end
	if curStep == 1023 then
	redboomslow = true;
	end
	if curStep == 1132 or curStep == 1276 then
	redboomslow = false;
	redboom = true;
	end
	if curStep == 1155 then
	redboomslow = true;
	redboom = false;
	end
	if curStep == 1536 then
	redboomslow = false;
	redboom = false;
	setProperty('flashdark.alpha', 1);
	setObjectCamera('flashdark', 'hud');
	doTweenAlpha('flashdowndark', 'flashdark', 0, 1.75, 'linear');
	end
	if curStep == 1560 then
	doTweenAlpha('theend', 'camHUD', 0, 2, 'linear');
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
    setProperty('flashwhite.alpha', 1);
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