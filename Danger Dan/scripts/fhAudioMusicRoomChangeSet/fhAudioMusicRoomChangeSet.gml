// feather ignore GM2017

/// @func fhAudioMusicRoomChangeSet(roomToSet, musicToSet)
/// @desc Sets a specific music track to play upon entering a specified room
/// @param {Asset.GMRoom} roomToSet Time to take to perform the fadeout
/// @param {Asset.GMSound} musicToSet Time to take to perform the fadeout
/// @returns {bool} true Always returns True
function fhAudioMusicRoomChangeSet(roomToSet, musicToSet)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicRoomChangeSet()");
		if(!room_exists(roomToSet))
			__fhAudioThrowError("Called fhAudioMusicRoomChangeSet() with non-existent room.");
		if(!audio_exists(musicToSet))
			__fhAudioThrowError("Called fhAudioMusicRoomChangeSet() with non-existent audio.");
	}
	__fhAudioObjController.musicRoomStarts[$ string(roomToSet)] = musicToSet;
	return true;
}

/// @func fhAudioMusicRoomChangeSet(roomToSet, musicToSet)
/// @desc Sets a specific music track to play upon entering a specified room
/// @param {Asset.GMRoom} roomToSet Time to take to perform the fadeout
/// @param {Asset.GMSound} musicToSet Time to take to perform the fadeout
/// @returns {bool} true Always returns True
function fha_music_room_change_set(roomToSet, musicToSet)
{
	return fhAudioMusicRoomChangeSet(roomToSet, musicToSet);
}