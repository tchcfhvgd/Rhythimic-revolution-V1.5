local xx = -100;
local yy = 1150; 
local xx2 = 400; 
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
local scorecolor = 1;


function onCreatePost()
    setProperty('gf.alpha', 0);
    triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('scoreTxt.alpha', 0);
end

function onCreate()
	
	setProperty('camHUD.alpha', 1);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('floor','BG/spaceship/mainroom/overload/floor', -1000, 200)
	
	makeLuaSprite('space','BG/spaceship/mainroom/overload/rainbow', -500, -500)
	setScrollFactor('space', 0, 0);
	
	makeLuaSprite('cthulhu','BG/spaceship/mainroom/overload/meme1', 1000, 905)
	scaleObject('cthulhu', 0.5, 0.5);
	
	makeLuaSprite('fumo','BG/spaceship/mainroom/overload/fumo', -300, 655)
	scaleObject('fumo', 0.75, 0.75);
	
	makeLuaSprite('dippee','BG/spaceship/mainroom/overload/dippee', -1000, 755)
	scaleObject('dippee', 2, 2);
	
	makeLuaSprite('Mesmerizer','BG/spaceship/mainroom/overload/Mesmerizer', 900, 755)
	scaleObject('Mesmerizer', 1.5, 1.5);
	setProperty('Mesmerizer.alpha', 0.75);
	
	makeAnimatedLuaSprite('dancedillaw', 'BG/spaceship/mainroom/overload/dancedillaw', -50, 925);
	addAnimationByPrefix("dancedillaw", '1', 'dance1', 24, false);
	addAnimationByPrefix("dancedillaw", '2', 'dance2', 24, false);
	
	makeAnimatedLuaSprite('meme1', 'BG/spaceship/mainroom/overload/meme', -850, 1105);
	addAnimationByPrefix("meme1", 'dance', 'meme1', 24, true);
	
	makeAnimatedLuaSprite('meme2', 'BG/spaceship/mainroom/overload/meme', -1050, 1205);
	addAnimationByPrefix("meme2", 'dance', 'meme2', 24, true);
	
	makeLuaSprite('light','BG/spaceship/mainroom/overload/light', -1850, 0)
	setProperty('light.alpha', 0.25);
	setBlendMode('light', 'add')
	
	makeLuaSprite('shadowdillaw','BG/green/shadow', -720, 1425)
	setProperty('shadowdillaw.alpha', 0.5);
	setBlendMode('shadowdillaw', 'MULTIPLY')
	
	makeLuaSprite('shadowbf','BG/green/shadow', 420, 1425)
	setProperty('shadowbf.alpha', 0.5);
	setBlendMode('shadowbf', 'MULTIPLY')


	addLuaSprite('space')
	
	addLuaSprite('cthulhu')
	addLuaSprite('fumo')
	addLuaSprite('dippee')
	addLuaSprite('Mesmerizer')
	
	addLuaSprite('floor')
	
	
	addLuaSprite('meme1')
	addLuaSprite('meme2',true)
	addLuaSprite('dancedillaw')
	
	addLuaSprite('shadowdillaw')
	addLuaSprite('shadowbf')
	
	addLuaSprite('light', true)
	
	doTweenX('cthulhumove1', 'cthulhu', -1000, 5, 'linear')

	-----------------------------------------
	
	makeLuaSprite('flashdark','Flashdark', 0, 0)
	makeLuaSprite('flashwhite','Flashwhite', 0, 0)
	
	makeLuaSprite('csdown','cutscenebox', 0, -1080)
	makeLuaSprite('csup','cutscenebox', 0, 720)
	
	setProperty('flashdark.alpha', 0);
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
	
	cuton(8,0.1)

end

function onTweenCompleted(tag)
    if tag == 'cthulhumove1' then
	doTweenX('cthulhumove2', 'cthulhu', 1000, 5, 'linear')
	setProperty('cthulhu.flipX', true)
	end
	if tag == 'cthulhumove2' then
	doTweenX('cthulhumove1', 'cthulhu', -1000, 5, 'linear')
	setProperty('cthulhu.flipX', false)
	end
end

function onBeatHit()
    if curBeat % 1 == 0 then
	    if dancing == false then
		dancing = true
		objectPlayAnimation('dancedillaw','1',true);
		else
		dancing = false
		objectPlayAnimation('dancedillaw','2',true);
		end
		    if beating == true then
			triggerEvent('Add Camera Zoom',0.05,0.06)
			end
	end
end

function onStepHit()
   if scorecolor == 1 then
   setTextColor('scoreTxt', 'ff0000')
   scorecolor = scorecolor+1
   elseif scorecolor == 2 then
   setTextColor('scoreTxt', 'ff8f00')
   scorecolor = scorecolor+1
   elseif scorecolor == 3 then
   setTextColor('scoreTxt', 'fffb00')
   scorecolor = scorecolor+1
   elseif scorecolor == 4 then
   setTextColor('scoreTxt', '78ff00')
   scorecolor = scorecolor+1
   elseif scorecolor == 5 then
   setTextColor('scoreTxt', '00ff83')
   scorecolor = scorecolor+1
   elseif scorecolor == 6 then
   setTextColor('scoreTxt', '00fff0')
   scorecolor = scorecolor+1
   elseif scorecolor == 7 then
   setTextColor('scoreTxt', '0074ff')
   scorecolor = scorecolor+1
   elseif scorecolor == 8 then
   setTextColor('scoreTxt', '1700ff')
   scorecolor = scorecolor+1
   elseif scorecolor == 9 then
   setTextColor('scoreTxt', 'c500ff')
   scorecolor = scorecolor+1
   elseif scorecolor == 10 then
   setTextColor('scoreTxt', 'ff0097')
   scorecolor = 1
   end
   
   
   if curStep == 9999 or curStep == 9999 then
	cuton(1, 1);
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 192 or curStep == 639 then
	flashwhite();
	end
	if curStep == 9999 or curStep == 9999 then
	flashdark();
	end
	if curStep == 415 or curStep == 639 or curStep == 1087 then
	cuton(2, 0.5)
	flashwhite();
    xx = 200;
	xx2 = 200; 
    yy = 1100; 
    yy2 = 1100;
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 447 or curStep == 703 then
	cuton(1, 0.5);
    xx = -100;
    yy = 1150; 
    xx2 = 400; 
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
	if curStep == 64 then
    cuton(5, 4)
	end
	if curStep == 112 or curStep == 887 or curStep == 948 or curStep == 1360 then
    cuton(8, 0.25)
	end
	if curStep == 128 or curStep == 959 then
	flashwhite();
    cuton(1, 0.2)
	setProperty('scoreTxt.alpha', 1);
	end
	if curStep == 159 then
	beating = true;
	end
	if curStep == 895 then
	setProperty('floor.alpha', 0);
	end
	if curStep == 911 then
	cuton(5, 2)
	end
	if curStep == 1344 then
	flashwhite();
	beating = false;
	end
end

function onUpdate()
    setProperty('scoreTxt.text', 'I love it when he goes “it’s dillawing time” and dillaws all over the place')
	
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
	
	triggerEvent('Add Camera Zoom',0.01,0.01)
    end