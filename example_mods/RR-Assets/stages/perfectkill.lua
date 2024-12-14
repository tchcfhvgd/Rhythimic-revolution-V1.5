local xx = 0;
local yy = 1300; 
local xx2 = 400; 
local yy2 = 1366;
local xx3 = 100; 
local yy3 = 1250;
local ofs = 15;
local followchars = false;
local del = 0;
local del2 = 0;
local damage = true;
local beating = false;
local tp = false;
local tspeed = 0.5;
local screenshake = false;
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
local intro = true;
local defeatboom = false;
local hightlight = false;



function onCreatePost()
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
	
	setProperty('camHUD.alpha', 0);
	
	makeLuaSprite('floor','BG/spaceship/perfectkill/floor', -1000, 600)
	scaleObject('floor', 2.15, 2.15);
	
	makeLuaSprite('overlayer','BG/spaceship/perfectkill/overlayer', -1000, 550)
	scaleObject('overlayer', 2.15, 2.15);
	setScrollFactor('overlayer', 0.8, 0.8);
	
	makeLuaSprite('floor2','BG/spaceship/perfectkill/floor-red', -1000, 600)
	scaleObject('floor2', 2.15, 2.15);
	setProperty('floor2.alpha', 0);
	
	makeLuaSprite('overlayer2','BG/spaceship/perfectkill/overlayer-red', -1000, 600)
	scaleObject('overlayer2', 2.15, 2.15);
	setScrollFactor('overlayer2', 0.8, 0.8);
	setProperty('overlayer2.alpha', 0);
	
	makeLuaSprite('space','BG/spaceship/perfectkill/space', -1000, -200)
	scaleObject('space', 2.15, 2.15);
	setScrollFactor('space', 0.1, 0.1);
	
	makeLuaSprite('redlight','BG/red/redlight', 0, 0)
	setProperty('redlight.alpha', 0);
	setObjectCamera('redlight', 'other');
	setBlendMode('redlight', 'add')
	
	makeLuaSprite('shadowenemy','BG/green/shadow', -700, 1680)
	setProperty('shadowenemy.alpha', 0.5);
	setBlendMode('shadowenemy', 'MULTIPLY')
	
	makeLuaSprite('shadowgf','BG/green/shadow', -500, 1540)
	setProperty('shadowgf.alpha', 0.7);
	setBlendMode('shadowgf', 'MULTIPLY')
	scaleObject('shadowgf', 1.5, 1.5);
	
	makeLuaSprite('shadowbf','BG/green/shadow', 550, 1680)
	setProperty('shadowbf.alpha', 0.5);
	setBlendMode('shadowbf', 'MULTIPLY')
	
	makeLuaSprite('light','BG/void/light', -1250, 200)
	setProperty('light.alpha', 0);
	setBlendMode('light', 'add')
	
	
	addLuaSprite('space')
	addLuaSprite('floor')
	addLuaSprite('overlayer', true)
	addLuaSprite('floor2')
	addLuaSprite('overlayer2', true)
	
	
	addLuaSprite('light')
	
	
	addLuaSprite('shadowenemy')
	addLuaSprite('shadowgf')
	addLuaSprite('shadowbf')


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
	if curBeat % 4 == 0 and defeatboom == true then
	setProperty('light.alpha', 0.75);
	doTweenAlpha('defeatlight', 'light', 0.75/2, 1, 'linear');
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
	beating = true;
	end
	if curStep == 9999 or curStep == 9999 then
	beating = false;
	end
	if curStep == 768 or curStep == 1088 or curStep == 1216 or curStep == 1440 or curStep == 2688 or curStep == 3008 or curStep == 3477 or curStep == 3904 then
	followchars = false;
	cuton(2, 0.3);
	setProperty('camGame.scroll.x',xx+200-(screenWidth / 2))
    setProperty('camGame.scroll.y',yy-(screenHeight / 2))
	triggerEvent('Camera Follow Pos',xx+200,yy)
	setProperty('camGame.zoom',0.6)
	end
	if curStep == 880 or curStep == 1152 or curStep == 1280 or curStep == 1536 or curStep == 2755 or curStep == 3072 or curStep == 3584 then
	followchars = true;
	cuton(1, 0.1);
	end
	----
	if curStep == 128 then
    doTweenAlpha('flashdowndark', 'flashdark', 0, 3, 'linear');
	end
	if curStep == 192 then
	intro = false;
    setProperty('camGame.scroll.x',xx-(screenWidth / 2))
    setProperty('camGame.scroll.y',yy-(screenHeight / 2))
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camGame.zoom',1)
	end
	if curStep == 256 then
    setProperty('camGame.scroll.x',xx2-(screenWidth / 2))
    setProperty('camGame.scroll.y',yy2-(screenHeight / 2))
	triggerEvent('Camera Follow Pos',xx2,yy2)
	end
	if curStep == 320 then
    setProperty('camGame.scroll.x',xx3-(screenWidth / 2))
    setProperty('camGame.scroll.y',yy3-(screenHeight / 2))
	triggerEvent('Camera Follow Pos',xx3,yy3)
	end
	if curStep == 367 then
	setProperty('camGame.scroll.x',xx+200-(screenWidth / 2))
    setProperty('camGame.scroll.y',yy-(screenHeight / 2))
	triggerEvent('Camera Follow Pos',xx+200,yy)
	setProperty('camGame.zoom',0.6)
    end
	if curStep == 384 then
	setProperty('flashdark.alpha', 0);
	flashwhite();
	setProperty('camHUD.alpha', 1);
	cuton(1, 0.25);
	followchars = true;
	end
	if curStep == 1632 or curStep == 3184 then
	cuton(3, 0.1);
	end
	if curStep == 1640 or curStep == 3190 then
	cuton(5, 0.1);
	end
	if curStep == 1648 or curStep == 3196 then
	cuton(8, 0.1);
	end
	if curStep == 1664 or curStep == 2304 or curStep == 2432 or curStep == 3200 then
	cuton(1, 0.1);
	end
	if curStep == 1904 or curStep == 2296 or curStep == 2416 then
	cuton(8, 0.5); 
	end
	if curStep == 1920 then
	cuton(1, 0.25);
	defeatboom = true
	flashwhite();
	doTweenAlpha('shirogone', 'dad', 0, 1.5, 'linear');
	setProperty('floor.alpha', 0);
	setProperty('overlayer.alpha', 0);
	setProperty('space.alpha', 0);
	setProperty('light.alpha', 0.75);
	end
	if curStep == 2432 then
	defeatboom = false
	flashwhite();
	setProperty('dad.alpha', 1);
	setProperty('floor2.alpha', 1);
	setProperty('overlayer2.alpha', 1);
	setProperty('space.alpha', 1);
	setProperty('light.alpha', 0);
	end
	if curStep == 3584 then
	flashwhite();
	hightlight = true;
	cuton(2, 0.2);
	end
	if curStep == 3968 then
	flashwhite();
	end
	if curStep == 4000 then
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
	
	if mustHitSection == false then
	    doTweenX('gangreturnX', 'gangs.scale', 1.3, 0.25, 'linear')
	    doTweenY('gangreturnY', 'gangs.scale', 1.3, 0.25, 'linear')
		doTweenAlpha('gangalpha', 'gangs', 1, 0.4, 'linear');
	else
	    doTweenX('gangzoomX', 'gangs.scale', 1.45, 0.25, 'linear')
	    doTweenY('gangzoomY', 'gangs.scale', 1.45, 0.25, 'linear')
		doTweenAlpha('gangalphareturn', 'gangs', 0.85, 0.4, 'linear');
	end
	
	if intro == true then
	    setProperty('camGame.scroll.x',xx+200-(screenWidth / 2))
        setProperty('camGame.scroll.y',yy-(screenHeight / 2))
		triggerEvent('Camera Follow Pos',xx+200,yy)
	end
	
    if followchars == true and intro == false then
        if mustHitSection == false then
        setProperty('camGame.scroll.x',xx-(screenWidth / 2))
        setProperty('camGame.scroll.y',yy-(screenHeight / 2))
	    triggerEvent('Camera Follow Pos',xx,yy)

        else
		
		
		    if gfSection == true then
			    setProperty('camGame.scroll.x',xx3-(screenWidth / 2))
                setProperty('camGame.scroll.y',yy3-(screenHeight / 2))
	            triggerEvent('Camera Follow Pos',xx3,yy3)
            else
            setProperty('camGame.scroll.x',xx2-(screenWidth / 2))
            setProperty('camGame.scroll.y',yy2-(screenHeight / 2))
	        triggerEvent('Camera Follow Pos',xx2,yy2)
			end
        end
    else

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
    if hightlight == true then
        triggerEvent('Screen Shake','0.02, 0.01','0.1, 0.0075');
	end
end