function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('void');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end