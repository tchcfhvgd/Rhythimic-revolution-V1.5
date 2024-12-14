local xx = 0;
local yy = 1050; 
local xx2 = 600; 
local yy2 = 1100;
local xx3 = 350; 
local yy3 = 1280;
local ofs = 15;
local followchars = true;
local damage = true;
local beating = false;
local beatingfast = false;
local screenshake = false;
local lockscreen = false;
local lockx = 0;
local locky = 0;
local lockzoom = 1;


function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onCreate()
	
	setProperty('camHUD.alpha', 1);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('floor','BG/snow/floor', -1000, 225)
	scaleObject('floor', 0.825, 0.825);
	
	makeLuaSprite('chair','BG/snow/chair', -1000, 225)
	scaleObject('chair', 0.825, 0.825);
	
	makeLuaSprite('S_light','BG/snow/light', -1000, 225)
	scaleObject('S_light', 0.825, 0.825);
	setBlendMode('S_light', 'add')
	setProperty('S_light.alpha', 0.75);
	
	makeLuaSprite('back','BG/snow/back', -1000, 225)
	scaleObject('back', 0.825, 0.825);

	makeLuaSprite('light','BG/green/light', -1850, 100)
	setProperty('light.alpha', 0.25);
	setBlendMode('light', 'add')
	
	makeLuaSprite('shadowdillaw','BG/green/shadow', -480, 1425)
	setProperty('shadowdillaw.alpha', 0.5);
	setBlendMode('shadowdillaw', 'MULTIPLY')
	
	makeLuaSprite('shadowbf','BG/green/shadow', 520, 1425)
	setProperty('shadowbf.alpha', 0.5);
	setBlendMode('shadowbf', 'MULTIPLY')
	
	makeLuaSprite('shadowgf','BG/green/shadow', 300, 1325)
	setProperty('shadowgf.alpha', 0.5);
	setBlendMode('shadowgf', 'MULTIPLY')
	
	makeLuaSprite('shadowflake','BG/green/shadow', -220, 1255)
	setProperty('shadowflake.alpha', 0.5);
	setBlendMode('shadowflake', 'MULTIPLY')
	
	makeAnimatedLuaSprite('flake','BG/snow/flake', -125, 750)
	addAnimationByPrefix('flake','loop','flake', 24, false)
	scaleObject('flake', 0.9, 0.9);

    addLuaSprite('back')
	addLuaSprite('floor')
	addLuaSprite('chair')
	
	addLuaSprite('shadowflake')
	addLuaSprite('flake')
	
	addLuaSprite('S_light')
	
	addLuaSprite('shadowdillaw')
	addLuaSprite('shadowbf')
	addLuaSprite('shadowgf')
	
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
    
	cuton(8, 0.01)
end

function onBeatHit()
    if beatingfast == true then
			triggerEvent('Add Camera Zoom',0.03,0.03)
	end
	
    if curBeat % 2 == 0 then
		    if beating == true then
			triggerEvent('Add Camera Zoom',0.05,0.06)
			end
	end
	if curBeat % 2 == 0 then
	objectPlayAnimation('flake','loop',true);
	end
end

function onStepHit()
    if curStep == 9999 or curStep == 9999 then
	cuton(1, 1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 512 or curStep == 768 or curStep == 3200 or curStep == 3712 then
	flashwhite();
	end
	if curStep == 9999 or curStep == 9999 then
	flashdark();
	end
	if curStep == 512 or curStep == 731 or curStep == 1152 or curStep == 3200 then
	xx = 250;
    xx2 = 250; 
	yy = 1000;
	yy2 = 1000;
	triggerEvent('Camera Follow Pos',xx,yy)
	cuton(2, 1)
	end
	if curStep == 640 or curStep == 768 or curStep == 1280 then
	xx = 0
	xx2 = 600
	yy = 1050;
	yy2 = 1100;
	triggerEvent('Camera Follow Pos',xx,yy)
	cuton(1, 1)
	end
	if curStep == 768 or curStep == 9999 then
	beating = true;
	end
	if curStep == 2080 or curStep == 9999 then
	beating = false;
	end
	----
	if curStep == 96 or curStep == 2672 then
	doTweenAlpha('introhud', 'flashdark', 0, 1, 'linear');
	end
	if curStep == 256 then
	flashwhite();
	cuton(1, 1)
	setProperty('flashdark.alpha', 0);
	end
	if curStep == 2048 or curStep == 2669 then
	flashwhite();
	cuton(8, 0.2);
	end
	if curStep == 2080 or curStep == 2592 or curStep == 3776 then
	doTweenAlpha('hudhide', 'flashdark', 1, 1, 'linear');
	end
	if curStep == 2160 then
	doTweenAlpha('hudvisible', 'flashdark', 0, 1, 'linear');
	end
	if curStep == 2303 then
	flashwhite();
	cuton(1, 0.2);
	beatingfast = true;
	end
	if curStep == 2669 then
	beatingfast = false
	end
	if curStep == 2944 then
	beating = true;
	cuton(1, 0.2);
	end
	if curStep == 3200 then
	beating = false
	beatingfast = true
	end
	if curStep == 3712 then
	beatingfast = false;
	cuton(8, 0.2);
	end
end

function onUpdate()
	
	if lockscreen == true then
	setProperty('camFollowPos.x',lockx)
    setProperty('camFollowPos.y',locky)
	setProperty('camGame.zoom',lockzoom)
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