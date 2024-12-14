playVideo = true;
playDialogue = true;

function onStartCountdown()
	if isStoryMode then
		if playVideo then 
			startVideo('sussus-toogus');
			playVideo = false;
			return Function_Stop;
		end
	return Function_Continue;
    end
end