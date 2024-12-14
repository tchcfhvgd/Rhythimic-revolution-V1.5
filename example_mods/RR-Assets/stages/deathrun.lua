local xx = -100;
local yy = 1100; 
local xx2 = 300; 
local yy2 = 1120;
local xx3 = 350; 
local yy3 = 1280;
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
local damage = true;
local beating = false;
local screenshake = false;
local movespeed = 4.5;
local dadZoom = 0.7
local bfZoom = 0.8
local phase2 = false;

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('gf.alpha', 0);
end

function onCreate()
	
	setProperty('camHUD.alpha', 1);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('floor1','BG/spaceship/deathrun/deathrun', -1200, -300)
	makeLuaSprite('floor2','BG/spaceship/deathrun/deathrun', 7855, -300)
	
	makeLuaSprite('light','BG/spaceship/deathrun/light', -1200, -300)
	setBlendMode('light', 'add')
	setProperty('light.alpha', 0.2);
	
	addLuaSprite('floor1')
	addLuaSprite('floor2')
	
	makeAnimatedLuaSprite('benja-leg','BG/spaceship/deathrun/Benjamin-legs', -645, 1180)
	addAnimationByPrefix('benja-leg','loop','running', 24, true)
	
	makeAnimatedLuaSprite('benja-leg-faster','BG/spaceship/deathrun/Benjamin-legs-faster', -645, 1180)
	addAnimationByPrefix('benja-leg-faster','loop','running', 24, true)
	setProperty('benja-leg-faster.alpha', 0);
	
	makeAnimatedLuaSprite('bf-leg','BG/spaceship/deathrun/bf-leg', 405, 1250)
	addAnimationByPrefix('bf-leg','loop','leg', 24, true)
	
	
	addLuaSprite('benja-leg')
	addLuaSprite('benja-leg-faster')
	addLuaSprite('bf-leg')
	
	addLuaSprite('light', true)
	
	doTweenX('moving1', 'floor1', -10255, movespeed, 'linear')
	doTweenX('moving2', 'floor2', -1200, movespeed, 'linear')
	
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
	
	cuton(1, 0.2);

end

function onTweenCompleted(tag)
    if tag == 'moving1' then
	setProperty('floor1.x', -1200);
	setProperty('floor2.x', 7855);
	
	doTweenX('moving1', 'floor1', -10255, movespeed, 'linear')
	doTweenX('moving2', 'floor2', -1200, movespeed, 'linear')
	end
end

function onEvent(name,value1,value2)
	if name == 'trigger' and value1 == '1' then
	    setProperty('flashdark.alpha', 0.35);
	    doTweenAlpha('triggerfadedark', 'flashdark', 0, 0.07, 'linear');
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
	if curStep == 64 then
	flashwhite();
	setProperty('flashdark.alpha', 0);
	end
	if curStep == 1112 then
	dadZoom = 1
	end
	if curStep == 1120 then
	cuton(2, 0.2)
	end
	if curStep == 1128 then
	cuton(3, 0.2)
	end
	if curStep == 1136 then
	cuton(6, 0.2)
	end
	if curStep == 1144 then
	dadZoom = 0.6
	cuton(4, 0.2)
	end
	if curStep == 1152 then
	phase2 = true
	cuton(1, 0.2)
	flashwhite();
	dadZoom = 0.7
	movespeed = 3.5
	setProperty('benja-leg.alpha', 0);
    setProperty('benja-leg-faster.alpha', 1);
	end
end

function onUpdate()

    if getProperty('dad.animation.curAnim.name') == 'idle' then
	    if legvool == true then
            objectPlayAnimation('benja-leg','loop', true);
			objectPlayAnimation('benja-leg-faster','loop', true);
			legvool = false;
		end
	else
	    legvool = true;
	end
	
	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
	    if legvoolbf == true then
            objectPlayAnimation('bf-leg','loop', true);
			legvoolbf = false;
		end
	else
	    legvoolbf = true;
	end
	
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
    if phase2 == true then
	triggerEvent('Screen Shake','0.01, 0.01','0.06, 0.0075');
    end
end