// feather ignore GM2017

/// @func fhAudioEmitterSetPitch(emitter, pitch)
/// @desc Sets the pitch of an emitter
/// @param {real} emitter The emitter
/// @param {real} pitch The pitch to set for the emitter
/// @returns {bool} true Always returns True
function fhAudioEmitterSetPitch(emitter, pitch)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetPitch()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPitch()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPitch()", "pitch", pitch);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("You called fhAudioEmitterSetPitch() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setPitch(pitch);
	return true;
}

/// @func fha_emitter_set_pitch(emitter, pitch)
/// @desc Sets the pitch of an emitter
/// @param {real} emitter The emitter
/// @param {real} pitch The pitch to set for the emitter
/// @returns {bool} true Always returns True
function fha_emitter_set_pitch(emitter, pitch)
{
	return fhAudioEmitterSetPitch(emitter, pitch);
}