local xx = -220;
local yy = 1300; 
local xx2 = 500; 
local yy2 = 1325;
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
local lockscreen = false;
local lockx = 0;
local locky = 0;
local lockzoom = 1;
local dadZoom = 0.66
local bfZoom = 0.75
local gfZoom = 0.85
local lightboom = 0.2
local benjamin = false;



function onCreatePost()
	setProperty('gf.alpha', 0);

	middle = getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll')
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
	triggerEvent('Camera Follow Pos',xx2,yy2)
	setProperty('camGame.scroll.x',xx2-(screenWidth / 2))
    setProperty('camGame.scroll.y',yy2-(screenHeight / 2))
	
	setProperty('camHUD.alpha', 1);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('light','BG/void/light', -1450, 0)
	setProperty('light.alpha', 0);
	setBlendMode('light', 'add')
	
	makeLuaSprite('robert','BG/void/robert', -1450, 0)
	setProperty('robert.alpha', 0.2);
	
	makeLuaSprite('mitori','BG/void/mitori', -1450, 0)
	setProperty('mitori.alpha', 0);
	
	makeLuaSprite('final','BG/void/final', -1450, 0)
	setProperty('final.alpha', 0);

	addLuaSprite('robert')
	addLuaSprite('mitori')
	addLuaSprite('final')
	addLuaSprite('light', true)
	
	makeAnimatedLuaSprite('alert','BG/green/alert', 450, 280)
	addAnimationByPrefix('alert','loop','alert', 24, false)
	setObjectCamera('alert', 'other');
	scaleObject('alert',0.6, 0.6);
	setProperty('alert.alpha', 0);
	addLuaSprite('alert', true)
	
	-----------------------------------------
	
	makeLuaSprite('flashdark','Flashdark', 0, 0)
	makeLuaSprite('flashwhite','Flashwhite', 0, 0)
	
	makeLuaSprite('csdown','cutscenebox', 0, -1080)
	makeLuaSprite('csup','cutscenebox', 0, 720)
	
	makeLuaSprite('darkSC','DarkSC', 0, 0)
	setProperty('darkSC.alpha', 1);
	setObjectCamera('darkSC', 'other');
	
	setProperty('flashdark.alpha', 1);
	setObjectCamera('flashdark', 'hud');
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
	addLuaSprite('darkSC')

end

function onEvent(name,value1,value2)
	if name == 'trigger' and value1 == '1' then
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
	triggerEvent('Add Camera Zoom',0.045,0.045)
	end
	if curBeat % 4 == 0 then
	setProperty('light.alpha', lightboom);
	doTweenAlpha('defeatlight', 'light', lightboom/2, 1, 'linear');
	end
end

function onStepHit()
   if curStep == 9999 or curStep == 9999 then
	cuton(1, 1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 528 or curStep == 784 then
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
	if curStep == 1 then
	doTweenAlpha('introhud', 'camHUD', 1, 1, 'linear');
	end
	if curStep == 16 then
	doTweenAlpha('introhud', 'flashdark', 0, 5, 'linear');
	end
	if curStep == 272 then
	flashwhite();
	xx2 = 250;
	setProperty('darkSC.alpha', 0.5);
	setProperty('robert.alpha', 1);
	beating = true;
	end
	if curStep == 528 or curStep == 1744 or curStep == 2656 then
	cuton(1, 0.25);
	benjamin = true
	yy = 1220; 
	dadZoom = 0.575
	end
	if curStep == 1696 or curStep == 2000 or curStep == 2528 then
	cuton(8, 0.25);
	end
	if curStep == 784 then
	flashwhite();
	followchars = false;
	lightboom = 0.75
	doTweenAlpha('introhud', 'camHUD', 0, 0.5, 'linear');
	triggerEvent('Camera Follow Pos',xx-100,yy-150)
	end
	if curStep == 896 then
	doTweenAlpha('introhud', 'camHUD', 1, 1, 'linear');
	end
	if curStep == 912 then
	followchars = true;
	lightboom = 0.5
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 1168 then
	benjamin = false;
	flashdark();
	lightboom = 0.2
	setProperty('robert.alpha', 0);
	setProperty('mitori.alpha', 1);
	dadZoom = 0.66
	yy = 1300; 
	end
	if curStep == 1440 then
	flashdark();
	setProperty('gf.alpha', 1);
	end
	if curStep == 1712 then
	doTweenAlpha('introhud', 'flashdark', 1, 1, 'linear');
	end
	if curStep == 1744 then
	flashwhite();
	setProperty('flashdark.alpha', 0);
	setProperty('gf.alpha', 0);
	lightboom = 0.75
	end
	if curStep == 2000 then
	setProperty('flashdark.alpha', 1);
	setProperty('mitori.alpha', 0);
	lightboom = 0.2
	end
	if curStep == 2016 then
	cuton(1, 0.2);
	benjamin = false;
	flashwhite();
	setProperty('flashdark.alpha', 0);
	dadZoom = 0.66
	yy = 1300; 
	end
	if curStep == 2656 then
	flashwhite();
	setProperty('flashdark.alpha', 0);
	setProperty('final.alpha', 1);
	end
	if curStep == 3056 then
	flashwhite();
	setProperty('flashdark.alpha', 1);
	setObjectCamera('flashdark', 'other');
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
	
    if benjamin == true then
        triggerEvent('Screen Shake','0.02, 0.01','0.1, 0.0075');
	end
end