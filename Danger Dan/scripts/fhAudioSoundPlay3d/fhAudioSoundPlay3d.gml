// Feather ignore GM2017

/// @func fhAudioSoundPlay3d(fhfx, posX, posY, posZ, falloffStart, falloffEnd, _looped = false, _falloffFactor = 1)
/// @desc Plays a specified fhfx at a point in 3d space, looping it if specified
/// @param {string} fhfx The fhfx to play(the string specified when it was created)
/// @param {real} posX X Position in 3d space to play the fhfx at
/// @param {real} posY Y Position in 3d space to play the fhfx at
/// @param {real} posZ Z Position in 3d space to play the fhfx at
/// @param {real} falloffStart Distance to start the falloff at
/// @param {real} falloffEnd Distance to end the falloff at
/// @param {bool} _looped True to loop the sound, false if not
/// @param {real} _falloffFactor Falloff factor(use depends on the falloff model)
/// @returns {Id.Sound} reference Reference to the playing sound
function fhAudioSoundPlay3d(fhfx, posX, posY, posZ, falloffStart, falloffEnd, _looped = false, _falloffFactor = 1)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPlay3d()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "fhfx", fhfx);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "posX", posX);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "posY", posY);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "posZ", posZ);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "falloffStart", falloffStart);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "falloffEnd", falloffEnd);
		if(!is_string(fhfx))
			__fhAudioThrowError("Called fhAudioSoundPlay3d() with an invalid fhfx.");
		if(__fhAudioObjController.fhfxList[$ fhfx] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundPlay3d() with an invalid fhfx.");
		}
	}
	var newSound = __fhAudioObjController.fhfxList[$ fhfx].playSound(_looped, undefined, posX, posY, posZ, falloffStart, falloffEnd, _falloffFactor);
	if(_looped)
	{
		var add = new __fhAudioPlayingSound(newSound, __fhAudioObjController.fhfxList[$ sound].myCategory);
		__fhAudioObjController.playingSoundsMap[$ string(newSound)] = add;
	}
	return newSound;
}

/// @func fha_sound_play_3d(fhfx, posX, posY, posZ, falloffStart, falloffEnd, _looped = false, _falloffFactor = 1)
/// @desc Plays a specified fhfx at a point in 3d space, looping it if specified
/// @param {string} fhfx The fhfx to play(the string specified when it was created)
/// @param {real} posX X Position in 3d space to play the fhfx at
/// @param {real} posY Y Position in 3d space to play the fhfx at
/// @param {real} posZ Z Position in 3d space to play the fhfx at
/// @param {real} falloffStart Distance to start the falloff at
/// @param {real} falloffEnd Distance to end the falloff at
/// @param {bool} _looped True to loop the sound, false if not
/// @param {real} _falloffFactor Falloff factor(use depends on the falloff model)
/// @returns {Id.Sound} reference Reference to the playing sound
function fha_sound_play_3d(fhfx, posX, posY, posZ, falloffStart, falloffEnd, _looped = false, _falloffFactor = 1)
{
	return fhAudioSoundPlay3d(fhfx, posX, posY, posZ, falloffStart, falloffEnd, _looped, _falloffFactor);
}