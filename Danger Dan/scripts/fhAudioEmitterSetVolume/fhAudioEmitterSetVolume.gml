// feather ignore GM2017

/// @func fhAudioEmitterSetVolume(emitter, volume)
/// @desc Sets the volume of an emitter
/// @param {real} emitter The emitter
/// @param {real} volume The volume to set
/// @returns {bool} true Always returns True
function fhAudioEmitterSetVolume(emitter, volume)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetVolume()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVolume()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVolume()", "volume", volume);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("Called fhAudioEmitterSetVolume() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setVolume(volume);
	return true;
}

/// @func fha_emitter_set_volume(emitter, volume)
/// @desc Sets the volume of an emitter
/// @param {real} emitter The emitter
/// @param {real} volume The volume to set
/// @returns {bool} true Always returns True
function fha_emitter_set_volume(emitter, volume)
{
	return fhAudioEmitterSetVolume(emitter, volume);
}