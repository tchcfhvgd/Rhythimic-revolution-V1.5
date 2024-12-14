function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('perfect-kill');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end