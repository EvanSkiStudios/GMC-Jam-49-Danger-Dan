// feather ignore GM2017

/// @func fhAudioEmitterSetPosition(emitter, newPosX, newPosY, _newPosZ = 0)
/// @desc Sets the position of an emitter
/// @param {real} emitter The emitter
/// @param {real} newPosX The X component of the position vector
/// @param {real} newPosY The Y component of the position vector
/// @param {real} _newPosZ The Z component of the position vector
/// @returns {bool} true Always returns True
function fhAudioEmitterSetPosition(emitter, newPosX, newPosY, _newPosZ = 0)
{	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetPosition()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPosition()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPosition()", "newPosX", newPosX);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPosition()", "newPosY", newPosY);
		if(__fhAudioObjController.emitterMap[$ string(emitter)])
			__fhAudioThrowError("Called fhAudioEmitterSetPosition() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setPosition(newPosX, newPosY, _newPosZ);
	return true;
}

/// @func fha_emitter_set_position(emitter, newPosX, newPosY, _newPosZ = 0)
/// @desc Sets the position of an emitter
/// @param emitter The emitter
/// @param {real} newPosX The X component of the position vector
/// @param {real} newPosY The Y component of the position vector
/// @param {real} _newPosZ The Z component of the position vector
/// @returns {bool} true Always returns True
function fha_emitter_set_position(emitter, newPosX, newPosY, _newPosZ = 0)
{
	return fhAudioEmitterSetPosition(emitter, newPosX, newPosY, _newPosZ);
}