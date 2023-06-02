// Feather ignore GM2017

/// @func fhAudioSoundPlayOnEmitter(fhfx, emitter, _looped = false)
/// @desc Plays a specified fhfx at a point in 3d space, looping it if specified
/// @param {string} fhfx The fhfx to play(the string specified when it was created)
/// @param {real} emitter Emitter to play the sound on
/// @param {bool} _looped True to loop the sound, false if not
/// @returns {Id.Sound} reference Reference to the playing sound
function fhAudioSoundPlayOnEmitter(fhfx, emitter, _looped = false)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPlayOnEmitter()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlayOnEmitter()", "fhfx", fhfx);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlayOnEmitter()", "emitter", emitter);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("You called fhAudioSoundPlayOnEmitter() with a non-existent emitter");
		if(!is_string(fhfx))
			__fhAudioThrowError("Called fhAudioSoundPlayOnEmitter() with an invalid fhfx.");
		if(__fhAudioObjController.fhfxList[$ fhfx] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundPlayOnEmitter() with an invalid fhfx.");
		}
		
	}
	var newSound = __fhAudioObjController.fhfxList[$ fhfx].playSound(_looped, emitter);
	if(_looped)
	{
		var add = new __fhAudioPlayingSound(newSound, __fhAudioObjController.fhfxList[$ fhfx].myCategory);
		__fhAudioObjController.playingSoundsMap[$ string(newSound)] = add;
	}
	return newSound;
}

/// @func function fha_sound_play_on_emitter(fhfx, emitter, _looped = false)
/// @desc Plays a specified fhfx at a point in 3d space, looping it if specified
/// @param {string} fhfx The fhfx to play(the string specified when it was created)
/// @param {real} emitter Emitter to play the sound on
/// @param {bool} _looped True to loop the sound, false if not
/// @returns {Id.Sound} reference Reference to the playing sound
function fha_sound_play_on_emitter(fhfx, emitter, _looped = false)
{
	return fhAudioSoundPlayOnEmitter(fhfx, emitter, _looped);
}