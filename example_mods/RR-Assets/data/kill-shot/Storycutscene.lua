playVideo = true;
playDialogue = true;

function onStartCountdown()
	if isStoryMode then
		if playVideo then 
			startVideo('killshot_intro');
			playVideo = false;
			return Function_Stop;
		end
	return Function_Continue;
    end
end