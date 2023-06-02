// feather ignore GM2017

/// @func fhAudioEmitterSetFalloff(emitter, falloffStart, falloffMax, _falloffFactor = 1)
/// @desc Sets the volume falloff settings for an emitter
/// @param {real} emitter The emitter
/// @param {real} falloffStart The distance the sound starts falling off at
/// @param {real} falloffMax The distance the sound no longer loses volume
/// @param {real} _falloffFactor The factor for the falloff(used differently depending on the falloff model in effect)
/// @returns {bool} true Always returns True
function fhAudioEmitterSetFalloff(emitter, falloffStart, falloffMax, _falloffFactor = 1)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetFalloff()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetFalloff()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetFalloff()", "falloffStart", falloffStart);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetFalloff()", "falloffMax", falloffMax);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("Called fhAudioEmitterSetFalloff() with a non-existent emitter.");
		if(falloffStart <=1 || falloffMax <=1)
			__fhAudioThrowError("Called fhAudioEmitterSetFalloff() with too low of falloff values.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setFalloff(falloffStart, falloffMax, _falloffFactor);
	return true;
}

/// @func fha_emitter_set_falloff(emitter, falloffStart, falloffMax, _falloffFactor = 1)
/// @desc Sets the volume falloff settings for an emitter
/// @param {real} emitter The emitter
/// @param {real} falloffStart The distance the sound starts falling off at
/// @param {real} falloffMax The distance the sound no longer loses volume
/// @param {real} _falloffFactor The factor for the falloff(used differently depending on the falloff model in effect)
/// @returns {bool} true Always returns True
function fha_emitter_set_falloff(emitter, falloffStart, falloffMax, _falloffFactor = 1)
{
	return fhAudioEmitterSetFalloff(emitter, falloffStart, falloffMax, _falloffFactor);
}