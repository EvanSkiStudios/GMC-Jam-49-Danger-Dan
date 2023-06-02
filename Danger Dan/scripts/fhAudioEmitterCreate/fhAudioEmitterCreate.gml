// feather ignore GM2017

/// @func fhAudioEmitterCreate(falloffStart, falloffMax, _falloffFactor = 1, _instanceToFollow = undefined, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
/// @desc Creates an emitter
/// @param {real} falloffStart The distance the sound starts falling off at
/// @param {real} falloffMax The distance the sound no longer loses volume
/// @param {real} _falloffFactor The factor for the falloff(used differently depending on the falloff model in effect)
/// @param {ID.Instance} _instanceToFollow The ID of the instance
/// @param {bool} _followVelocity True if it should also apply velocity from the instance
/// @param {real} _velocityMultiplier How much to multiply the velocity from the instance(if enabled)
/// @param {bool} _followIn3d True if it should also use the 'z' variable on the instance and follow in 3d space
/// @returns {real} emitter Reference to the new emitter
function fhAudioEmitterCreate(falloffStart, falloffMax, _falloffFactor = 1, _instanceToFollow = undefined, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterCreate()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterCreate()", "falloffStart", falloffStart);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterCreate()", "falloffMax", falloffMax);
		if(falloffStart <=1 || falloffMax <=1)
			__fhAudioThrowError("Called fhAudioEmitterCreate() with too low of falloff values.");
		if(!instance_exists(_instanceToFollow))
			__fhAudioThrowError("Called fhAudioEmitterCreate() with a non-existent instance.");
	}
	var emitStruct = new __fhAudioEmitter();
	emitStruct.setFalloff(falloffStart, falloffMax, _falloffFactor);
	if(_instanceToFollow != undefined)
	{
		emitStruct.setFollowInstance(_instanceToFollow, _followIn3d, _followVelocity, _velocityMultiplier);
	}
	var index = __fhAudioObjController.emitterNextIndex;
	with(__fhAudioObjController)
	{
		emitterMap[$ string(emitterNextIndex)] = emitStruct;
		emitterNextIndex++;
	}
	return index;
}

/// @func fha_emitter_create(falloffStart, falloffMax, _falloffFactor = 1, _instanceToFollow = undefined, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
/// @desc Creates an emitter
/// @param {real} falloffStart The distance the sound starts falling off at
/// @param {real} falloffMax The distance the sound no longer loses volume
/// @param {real} _falloffFactor The factor for the falloff(used differently depending on the falloff model in effect)
/// @param {ID.Instance} _instanceToFollow The ID of the instance
/// @param {bool} _followVelocity True if it should also apply velocity from the instance
/// @param {real} _velocityMultiplier How much to multiply the velocity from the instance(if enabled)
/// @param {bool} _followIn3d True if it should also use the 'z' variable on the instance and follow in 3d space
/// @returns {real} emitter Reference to the new emitter
function fha_emitter_create(falloffStart, falloffMax, _falloffFactor = 1, _instanceToFollow = undefined, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
{
	return fhAudioEmitterCreate(falloffStart, falloffMax, _falloffFactor, _instanceToFollow, _followVelocity, _velocityMultiplier, _followIn3d);
}