function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('deathrun');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end