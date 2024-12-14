local xx = -525;
local yy = 1325; --1300
local xx2 = 50; 
local yy2 = 1250;--1300
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
local dadZoom = 1.1;
local bfZoom = 1.1;

local hudtween = 3.5;
local hudtweenAngle = 2.5;
local dadtween = 4;


function onCreatePost()
    
	setProperty('gf.alpha', 0);
	setScrollFactor('gf', 0.6, 0.6);
	
	setProperty('boyfriend.alpha', 1);
	setCharacterX('bf', -700);
    setCharacterY('bf', 900);
	
	setProperty('dad.alpha', 0);
	setScrollFactor('dad', 0.4, 0.4);
	
	xx = -500; 
    yy = 1350;
	xx2 = xx; 
    yy2 = yy;
	
	doTweenY('mitoritweenY', 'dad', 1350, dadtween, 'QuintInOut');
	doTweenY('gftweenY', 'gf', 400, dadtween, 'QuintInOut');
	doTweenAngle('gftweenAngle', 'gf', 1.5, dadtween, 'QuintInOut')
	
	triggerEvent('Camera Follow Pos',xx,yy)
	
	addCharacterToList('BB-BF-ejected')
	addCharacterToList('mitori-ejected-small')
end

function onCreate()
	
	setProperty('camHUD.alpha', 0);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('sky','BG/green/ejected/sky', -300, -550)
	setScrollFactor('sky', 0, 0);
	
	makeLuaSprite('darkbackground','Flashdark', -1850, 0)
	setProperty('darkbackground.alpha', 1);
	scaleObject('darkbackground',3,3)
	
	makeLuaSprite('cloud1','BG/green/ejected/cloud1', -250, 2020)
	setProperty('cloud1.alpha', 0.75);
	makeLuaSprite('cloud2','BG/green/ejected/cloud2', -1200, 2020)
	setProperty('cloud2.alpha', 0.75);
	makeLuaSprite('cloud3','BG/green/ejected/cloud3', -800, 2020)
	setProperty('cloud3.alpha', 0.5);
	
	makeAnimatedLuaSprite('obj1','BG/green/ejected/obj', 50, -280)
	addAnimationByPrefix('obj1','loop','falling1', 24, true)
	setScrollFactor('obj1', 0.4, 0.4);
	
	makeAnimatedLuaSprite('obj2','BG/green/ejected/obj', 450, -280)
	addAnimationByPrefix('obj2','loop','falling2', 24, true)
	setScrollFactor('obj2', 0.4, 0.4);
	
	makeAnimatedLuaSprite('radiotower','BG/green/ejected/radio-tower', 600, 1080)
	addAnimationByPrefix('radiotower','loop','tower', 24, true)
	setScrollFactor('radiotower', 0.1, 0.1);
	
	
	
	makeAnimatedLuaSprite('wind','BG/green/ejected/wind', -250, -150)
	addAnimationByPrefix('wind','loop','wind', 34, true)
	setScrollFactor('wind', 0, 0);
	setProperty('wind.alpha', 0);
	scaleObject('wind',1.25,1.25)
	
	addLuaSprite('sky')
	
	addLuaSprite('cloud1')
	addLuaSprite('cloud2')
	addLuaSprite('cloud3',true)
	
	addLuaSprite('obj1')
	addLuaSprite('obj2')
	addLuaSprite('radiotower')
	
	addLuaSprite('darkbackground')
	
	addLuaSprite('wind', true)

	
	-----------------------------------------
	
	makeLuaSprite('flashdark','Flashdark', 0, 0)
	makeLuaSprite('flashwhite','Flashwhite', 0, 0)
	makeLuaSprite('DarkSC','DarkSC', 0, 0)
	setProperty('DarkSC.alpha', 0.5);
	setObjectCamera('DarkSC', 'other');
	addLuaSprite('DarkSC')
	
	makeLuaSprite('csdown','cutscenebox', 0, -1080)
	makeLuaSprite('csup','cutscenebox', 0, 720)
	
	setProperty('flashdark.alpha', 1);
	setObjectCamera('flashdark', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	
	setProperty('csup.alpha', 1);
	setObjectCamera('csup', 'other');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'other');
	
	addLuaSprite('flashdark')
	addLuaSprite('flashwhite')
	addLuaSprite('DarkSC')
	
	
	
	
	
	
end

function onTweenCompleted(tag)
   if tag == 'cloudtween1' then
   setProperty('cloud1.y', 2020);
   setProperty('cloud1.x', getRandomInt(-250, 500));
   doTweenY('cloudtween1', 'cloud1', 500, 1+getRandomInt(0.1, 0.5), 'QuintInOut');
   end
   if tag == 'cloudtween2' then
   setProperty('cloud2.y', 2420);
   setProperty('cloud2.x', getRandomInt(-1200, -1300));
   doTweenY('cloudtween2', 'cloud2', 500, 1+getRandomInt(0.2, 0.4), 'QuintInOut');
   end
   if tag == 'cloudtween3' then
   setProperty('cloud3.y', 2420);
   setProperty('cloud3.x', getRandomInt(-800, -850));
   doTweenY('cloudtween3', 'cloud3', 500, 1.25+getRandomInt(0.2, 0.4), 'QuintInOut');
   end
   
   if tag == 'mitoritweenY' then
   doTweenY('mitoritweenY2', 'dad', 1300, dadtween, 'QuintInOut');
   doTweenY('gftweenY2', 'gf', 480, dadtween, 'QuintInOut');
   doTweenAngle('gftweenAngle2', 'gf', -1.5, dadtween, 'QuintInOut')
   end
   if tag == 'mitoritweenY2' then
   doTweenY('mitoritweenY', 'dad', 1350, dadtween, 'QuintInOut');
   doTweenY('gftweenY', 'gf', 400, dadtween, 'QuintInOut');
   doTweenAngle('gftweenAngle', 'gf', 1.5, dadtween, 'QuintInOut')
   end
   if tag == 'HudtweenY' then
   doTweenY('HudtweenY2', 'camHUD', 15, hudtween, 'QuintInOut');
   end
   if tag == 'HudtweenY2' then
   doTweenY('HudtweenY', 'camHUD', -15, hudtween, 'QuintInOut');
   end
   if tag == 'Hudtweenangle' then
   doTweenAngle('Hudtweenangle2', 'camHUD', -1.5, hudtweenAngle, 'QuintInOut')
   end
   if tag == 'Hudtweenangle2' then
   doTweenAngle('Hudtweenangle', 'camHUD', 1.5, hudtweenAngle, 'QuintInOut')
   end
end

function onStepHit()
    if curStep == 1 or curStep == 9999 then
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
	xx = 100;
    xx2 = 100; 
	yy = 1050;
	yy2 = 1050;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 9999 or curStep == 9999 then
	xx = 0;
    yy = 1100;
 	xx2 = 300; 
 	yy2 = 1100;
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
	doTweenAlpha('introfade', 'flashdark', 0, 10, 'linear');
	end
	if curStep == 111 then
	doTweenAlpha('introfadehud', 'camHUD', 1, 2, 'linear');
	end
	if curStep == 256 then
	xx = -325;
 	yy = 1325;
	xx2 = 50; 
 	yy2 = 1250;
	ofs = 35;
	
	setProperty('darkbackground.alpha', 0);
	
	setProperty('gf.alpha', 1);
	setProperty('dad.alpha', 1);
	setProperty('wind.alpha', 0.1);
	triggerEvent('Change Character', 0, 'BB-BF-ejected')
	triggerEvent('Change Character', 1, 'mitori-ejected-small')
	
	setCharacterX('bf', 400);
    setCharacterY('bf', 1000);
	bfZoom = 0.8
	
	setCharacterX('dad', -650);
	
	setProperty('DarkSC.alpha', 0.15);

	setProperty('defaultCamZoom',dadZoom)
	
	doTweenY('skytween', 'sky', -3350, 150, 'linear');
	doTweenY('HudtweenY', 'camHUD', -15, hudtween, 'QuintInOut');
	doTweenAngle('Hudtweenangle', 'camHUD', 1, hudtweenAngle, 'QuintInOut')
	doTweenY('cloudtween1', 'cloud1', 500, 1+getRandomInt(0.1, 0.5), 'QuintInOut');
	doTweenY('cloudtween2', 'cloud2', 500, 1+getRandomInt(0.1, 0.5), 'QuintInOut');
	doTweenY('cloudtween3', 'cloud3', 500, 1.25+getRandomInt(0.1, 0.5), 'QuintInOut');
	
	flashwhite();
	end
	if curStep == 272 then
	doTweenX('fallingobjX', 'obj1', 620, 12, 'linear');
	doTweenY('fallingobjY', 'obj1', 1300, 11, 'linear');
	doTweenAngle('fallingobjangle', 'obj1', 30, 8, 'linear')
	end
	if curStep == 512 then
	doTweenY('radiotower', 'radiotower', -600, 115, 'linear');
	end
	if curStep == 672 then
	doTweenX('fallingobjX2', 'obj2', -200, 12, 'linear');
	doTweenY('fallingobjY2', 'obj2', 1300, 11, 'linear');
	doTweenAngle('fallingobjangle2', 'obj2', -30, 8, 'linear')
	end
	if curStep == 1504 then
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
        triggerEvent('Screen Shake','0.01, 0.01','0.05, 0.0075');
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.01);
		end
    end