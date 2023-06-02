// feather ignore GM2017

/// @func fhAudioEmitterDestroy(emitter)
/// @desc Destroys an emitter
/// @param {real} emitter The emitter to destroy
/// @returns {bool} true Always returns True
function fhAudioEmitterDestroy(emitter)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterDestroy()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterDestroy()", "emitter", emitter);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("You called fhAudioEmitterDestroy() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].destroy();
	variable_struct_remove(__fhAudioObjController.emitterMap, string(emitter));
	return true;
}

/// @func fha_emitter_destroy(emitter)
/// @desc Destroys an emitter
/// @param {real} emitter The emitter to destroy
/// @returns {bool} true Always returns True
function fha_emitter_destroy(emitter)
{
	return fhAudioEmitterDestroy(emitter);
}