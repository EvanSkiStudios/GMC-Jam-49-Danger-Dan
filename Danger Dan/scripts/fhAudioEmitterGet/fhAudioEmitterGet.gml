// feather ignore GM2017

/// @func fhAudioEmitterGet(emitter)
/// @desc Returns the real reference to the emitter
/// @param {real} emitter The emitter to get the reference for
/// @returns {real} reference The emitter reference
function fhAudioEmitterGet(emitter)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterDestroy()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterGet()", "emitter", emitter);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("You called fhAudioEmitterGet() with a non-existent emitter.");
	}
	//__fhAudioObjController.emitterMap[$ string(emitter)].destroy();
	return __fhAudioObjController.emitterMap[$ string(emitter)].emitter;
}

/// @func fha_emitter_get(emitter)
/// @desc Returns the real reference to the emitter
/// @param {real} emitter The emitter to get the reference for
/// @returns {real} reference The emitter reference
function fha_emitter_get(emitter)
{
	return fhAudioEmitterGet(emitter);
}