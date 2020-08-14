// Copyright (C) 1999-2000 Id Software, Inc.
//
// cg_view.c -- setup all the parameters (position, angle, etc)
// for a 3D rendering
#include "cg_local.h"

#if !defined(CL_LIGHT_H_INC)
	#include "cg_lights.h"
#endif

#define MASK_CAMERACLIP (MASK_SOLID|CONTENTS_PLAYERCLIP)
#define CAMERA_SIZE	4


/*
=============================================================================

  MODEL TESTING

The viewthing and gun positioning tools from Q2 have been integrated and
enhanced into a single model testing facility.

Model viewing can begin with either "testmodel <modelname>" or "testgun <modelname>".

The names must be the full pathname after the basedir, like 
"models/weapons/v_launch/tris.md3" or "players/male/tris.md3"

Testmodel will create a fake entity 100 units in front of the current view
position, directly facing the viewer.  It will remain immobile, so you can
move around it to view it from different angles.

Testgun will cause the model to follow the player around and supress the real
view weapon model.  The default frame 0 of most guns is completely off screen,
so you will probably have to cycle a couple frames to see it.

"nextframe", "prevframe", "nextskin", and "prevskin" commands will change the
frame or skin of the testmodel.  These are bound to F5, F6, F7, and F8 in
q3default.cfg.

If a gun is being tested, the "gun_x", "gun_y", and "gun_z" variables will let
you adjust the positioning.

Note that none of the model testing features update while the game is paused, so
it may be convenient to test with deathmatch set to 1 so that bringing down the
console doesn't pause the game.

=============================================================================
*/

/*
=================
CG_TestModel_f

Creates an entity in front of the current position, which
can then be moved around
=================
*/
void CG_TestModel_f (void) {
	vec3_t		angles;

	memset( &cg.testModelEntity, 0, sizeof(cg.testModelEntity) );
	if ( trap_Argc() < 2 ) {
		return;
	}

	Q_strncpyz (cg.testModelName, CG_Argv( 1 ), MAX_QPATH );
	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );

	if ( trap_Argc() == 3 ) {
		cg.testModelEntity.backlerp = atof( CG_Argv( 2 ) );
		cg.testModelEntity.frame = 1;
		cg.testModelEntity.oldframe = 0;
	}
	if (! cg.testModelEntity.hModel ) {
		CG_Printf( "Can't register model\n" );
		return;
	}

	VectorMA( cg.refdef.vieworg, 100, cg.refdef.viewaxis[0], cg.testModelEntity.origin );

	angles[PITCH] = 0;
	angles[YAW] = 180 + cg.refdefViewAngles[1];
	angles[ROLL] = 0;

	AnglesToAxis( angles, cg.testModelEntity.axis );
	cg.testGun = qfalse;
}

/*
=================
CG_TestGun_f

Replaces the current view weapon with the given model
=================
*/
void CG_TestGun_f (void) {
	CG_TestModel_f();
	cg.testGun = qtrue;
	//cg.testModelEntity.renderfx = RF_MINLIGHT | RF_DEPTHHACK | RF_FIRST_PERSON;

	// rww - 9-13-01 [1-26-01-sof2]
	cg.testModelEntity.renderfx = RF_DEPTHHACK | RF_FIRST_PERSON;
}


void CG_TestModelNextFrame_f (void) {
	cg.testModelEntity.frame++;
	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
}

void CG_TestModelPrevFrame_f (void) {
	cg.testModelEntity.frame--;
	if ( cg.testModelEntity.frame < 0 ) {
		cg.testModelEntity.frame = 0;
	}
	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
}

void CG_TestModelNextSkin_f (void) {
	cg.testModelEntity.skinNum++;
	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
}

void CG_TestModelPrevSkin_f (void) {
	cg.testModelEntity.skinNum--;
	if ( cg.testModelEntity.skinNum < 0 ) {
		cg.testModelEntity.skinNum = 0;
	}
	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
}

static void CG_AddTestModel (void) {
	int		i;

	// re-register the model, because the level may have changed
	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
	if (! cg.testModelEntity.hModel ) {
		CG_Printf ("Can't register model\n");
		return;
	}

	// if testing a gun, set the origin reletive to the view origin
	if ( cg.testGun ) {
		VectorCopy( cg.refdef.vieworg, cg.testModelEntity.origin );
		VectorCopy( cg.refdef.viewaxis[0], cg.testModelEntity.axis[0] );
		VectorCopy( cg.refdef.viewaxis[1], cg.testModelEntity.axis[1] );
		VectorCopy( cg.refdef.viewaxis[2], cg.testModelEntity.axis[2] );

		// allow the position to be adjusted
		for (i=0 ; i<3 ; i++) {
			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[0][i] * cg_gun_x.value;
			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[1][i] * cg_gun_y.value;
			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[2][i] * cg_gun_z.value;
		}
	}

	trap_R_AddRefEntityToScene( &cg.testModelEntity );
}



//============================================================================


/*
=================
CG_CalcVrect

Sets the coordinates of the rendered window
=================
*/
static void CG_CalcVrect (void) {
	int		size;

	// the intermission should allways be full screen
	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
		size = 100;
	} else {
		// bound normal viewsize
		if (cg_viewsize.integer < 30) {
			trap_Cvar_Set ("cg_viewsize","30");
			size = 30;
		} else if (cg_viewsize.integer > 100) {
			trap_Cvar_Set ("cg_viewsize","100");
			size = 100;
		} else {
			size = cg_viewsize.integer;
		}

	}
	cg.refdef.width = cgs.glconfig.vidWidth*size/100;
	cg.refdef.width &= ~1;

	cg.refdef.height = cgs.glconfig.vidHeight*size/100;
	cg.refdef.height &= ~1;

	cg.refdef.x = (cgs.glconfig.vidWidth - cg.refdef.width)/2;
	cg.refdef.y = (cgs.glconfig.vidHeight - cg.refdef.height)/2;
}

//==============================================================================

//==============================================================================
//==============================================================================
// this causes a compiler bug on mac MrC compiler
static void CG_StepOffset( void ) {
	int		timeDelta;
	
	// smooth out stair climbing
	timeDelta = cg.time - cg.stepTime;
	if ( timeDelta < STEP_TIME ) {
		cg.refdef.vieworg[2] -= cg.stepChange 
			* (STEP_TIME - timeDelta) / STEP_TIME;
	}
}

#define CAMERA_DAMP_INTERVAL	50

static vec3_t	cameramins = { -CAMERA_SIZE, -CAMERA_SIZE, -CAMERA_SIZE };
static vec3_t	cameramaxs = { CAMERA_SIZE, CAMERA_SIZE, CAMERA_SIZE };
vec3_t	camerafwd, cameraup;

vec3_t	cameraFocusAngles,			cameraFocusLoc;
vec3_t	cameraIdealTarget,			cameraIdealLoc;
vec3_t	cameraCurTarget={0,0,0},	cameraCurLoc={0,0,0};
vec3_t	cameraOldLoc={0,0,0},		cameraNewLoc={0,0,0};
int		cameraLastFrame=0;

float	cameraLastYaw=0;
float	cameraStiffFactor=0.0f;

/*
===============
Notes on the camera viewpoint in and out...

cg.refdef.vieworg
--at the start of the function holds the player actor's origin (center of player model).
--it is set to the final view location of the camera at the end of the camera code.
cg.refdefViewAngles
--at the start holds the client's view angles
--it is set to the final view angle of the camera at the end of the camera code.

===============
*/
  
extern qboolean gCGHasFallVector;
extern vec3_t gCGFallVector;

/*
===============
CG_CalcTargetThirdPersonViewLocation

===============
*/
static void CG_CalcIdealThirdPersonViewTarget(void)
{
	float thirdPersonVertOffset = cg_thirdPersonVertOffset.value;

	if (cg.snap && cg.snap->ps.usingATST)
	{
		thirdPersonVertOffset = 200;
	}

	// Initialize IdealTarget
	if (gCGHasFallVector)
	{
		VectorCopy(gCGFallVector, cameraFocusLoc);
	}
	else
	{
		VectorCopy(cg.refdef.vieworg, cameraFocusLoc);
	}

	// Add in the new viewheight
	cameraFocusLoc[2] += cg.snap->ps.viewheight;

	// Add in a vertical offset from the viewpoint, which puts the actual target above the head, regardless of angle.
//	VectorMA(cameraFocusLoc, thirdPersonVertOffset, cameraup, cameraIdealTarget);
	
	// Add in a vertical offset from the viewpoint, which puts the actual target above the head, regardless of angle.
	VectorCopy( cameraFocusLoc, cameraIdealTarget );
	cameraIdealTarget[2] += cg_thirdPersonVertOffset.value;
	//VectorMA(cameraFocusLoc, cg_thirdPersonVertOffset.value, cameraup, cameraIdealTarget);
}

	

/*
===============
CG_CalcTargetThirdPersonViewLocation

===============
*/
static void CG_CalcIdealThirdPersonViewLocation(void)
{
	float thirdPersonRange = cg_thirdPersonRange.value;

	if (cg.snap && cg.snap->ps.usingATST)
	{
		thirdPersonRange = 300;
	}

	VectorMA(cameraIdealTarget, -(thirdPersonRange), camerafwd, cameraIdealLoc);
}



static void CG_ResetThirdPersonViewDamp(void)
{
	trace_t trace;

	// Cap the pitch within reasonable limits
	if (cameraFocusAngles[PITCH] > 89.0)
	{
		cameraFocusAngles[PITCH] = 89.0;
	}
	else if (cameraFocusAngles[PITCH] < -89.0)
	{
		cameraFocusAngles[PITCH] = -89.0;
	}

	AngleVectors(cameraFocusAngles, camerafwd, NULL, cameraup);

	// Set the cameraIdealTarget
	CG_CalcIdealThirdPersonViewTarget();

	// Set the cameraIdealLoc
	CG_CalcIdealThirdPersonViewLocation();

	// Now, we just set everything to the new positions.
	VectorCopy(cameraIdealLoc, cameraCurLoc);
	VectorCopy(cameraIdealTarget, cameraCurTarget);

	// First thing we do is trace from the first person viewpoint out to the new target location.
	CG_Trace(&trace, cameraFocusLoc, cameramins, cameramaxs, cameraCurTarget, cg.snap->ps.clientNum, MASK_CAMERACLIP);
	if (trace.fraction <= 1.0)
	{
		VectorCopy(trace.endpos, cameraCurTarget);
	}

	// Now we trace from the new target location to the new view location, to make sure there is nothing in the way.
	CG_Trace(&trace, cameraCurTarget, cameramins, cameramaxs, cameraCurLoc, cg.snap->ps.clientNum, MASK_CAMERACLIP);
	if (trace.fraction <= 1.0)
	{
		VectorCopy(trace.endpos, cameraCurLoc);
	}

	cameraLastFrame = cg.time;
	cameraLastYaw = cameraFocusAngles[YAW];
	cameraStiffFactor = 0.0f;
}

// This is called every frame.
static void CG_UpdateThirdPersonTargetDamp(void)
{
	trace_t trace;
	vec3_t	targetdiff;
	float	dampfactor, dtime, ratio;

	// Set the cameraIdealTarget
	// Automatically get the ideal target, to avoid jittering.
	CG_CalcIdealThirdPersonViewTarget();

	if (cg_thirdPersonTargetDamp.value>=1.0)
	{	// No damping.
		VectorCopy(cameraIdealTarget, cameraCurTarget);
	}
	else if (cg_thirdPersonTargetDamp.value>=0.0)
	{	
		// Calculate the difference from the current position to the new one.
		VectorSubtract(cameraIdealTarget, cameraCurTarget, targetdiff);

		// Now we calculate how much of the difference we cover in the time allotted.
		// The equation is (Damp)^(time)
		dampfactor = 1.0-cg_thirdPersonTargetDamp.value;	// We must exponent the amount LEFT rather than the amount bled off
		dtime = (float)(cg.time-cameraLastFrame) * (1.0/(float)CAMERA_DAMP_INTERVAL);	// Our dampfactor is geared towards a time interval equal to "1".

		// Note that since there are a finite number of "practical" delta millisecond values possible, 
		// the ratio should be initialized into a chart ultimately.
		ratio = powf(dampfactor, dtime);
		
		// This value is how much distance is "left" from the ideal.
		VectorMA(cameraIdealTarget, -ratio, targetdiff, cameraCurTarget);
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
	}

	// Now we trace to see if the new location is cool or not.

	// First thing we do is trace from the first person viewpoint out to the new target location.
	CG_Trace(&trace, cameraFocusLoc, cameramins, cameramaxs, cameraCurTarget, cg.snap->ps.clientNum, MASK_CAMERACLIP);
	if (trace.fraction < 1.0)
	{
		VectorCopy(trace.endpos, cameraCurTarget);
	}

	// Note that previously there was an upper limit to the number of physics traces that are done through the world
	// for the sake of camera collision, since it wasn't calced per frame.  Now it is calculated every frame.
	// This has the benefit that the camera is a lot smoother now (before it lerped between tested points),
	// however two full volume traces each frame is a bit scary to think about.
}

// This can be called every interval, at the user's discretion.
static void CG_UpdateThirdPersonCameraDamp(void)
{
	trace_t trace;
	vec3_t	locdiff;
	float dampfactor, dtime, ratio;

	// Set the cameraIdealLoc
	CG_CalcIdealThirdPersonViewLocation();
	
	
	// First thing we do is calculate the appropriate damping factor for the camera.
	dampfactor=0.0;
	if (cg_thirdPersonCameraDamp.value != 0.0)
	{
		double pitch;

		// Note that the camera pitch has already been capped off to 89.
		pitch = Q_fabs(cameraFocusAngles[PITCH]);

		// The higher the pitch, the larger the factor, so as you look up, it damps a lot less.
		pitch /= 89.0;	
		dampfactor = (1.0-cg_thirdPersonCameraDamp.value)*(pitch*pitch);

		dampfactor += cg_thirdPersonCameraDamp.value;

		// Now we also multiply in the stiff factor, so that faster yaw changes are stiffer.
		if (cameraStiffFactor > 0.0f)
		{	// The cameraStiffFactor is how much of the remaining damp below 1 should be shaved off, i.e. approach 1 as stiffening increases.
			dampfactor += (1.0-dampfactor)*cameraStiffFactor;
		}
	}

	if (dampfactor>=1.0)
	{	// No damping.
		VectorCopy(cameraIdealLoc, cameraCurLoc);
	}
	else if (dampfactor>=0.0)
	{	
		// Calculate the difference from the current position to the new one.
		VectorSubtract(cameraIdealLoc, cameraCurLoc, locdiff);

		// Now we calculate how much of the difference we cover in the time allotted.
		// The equation is (Damp)^(time)
		dampfactor = 1.0-dampfactor;	// We must exponent the amount LEFT rather than the amount bled off
		dtime = (float)(cg.time-cameraLastFrame) * (1.0/(float)CAMERA_DAMP_INTERVAL);	// Our dampfactor is geared towards a time interval equal to "1".

		// Note that since there are a finite number of "practical" delta millisecond values possible, 
		// the ratio should be initialized into a chart ultimately.
		ratio = powf(dampfactor, dtime);
		
		// This value is how much distance is "left" from the ideal.
		VectorMA(cameraIdealLoc, -ratio, locdiff, cameraCurLoc);
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
	}

	// Now we trace from the new target location to the new view location, to make sure there is nothing in the way.
	CG_Trace(&trace, cameraCurTarget, cameramins, cameramaxs, cameraCurLoc, cg.snap->ps.clientNum, MASK_CAMERACLIP);

	if (trace.fraction < 1.0)
	{
		VectorCopy( trace.endpos, cameraCurLoc );

		//FIXME: when the trace hits movers, it gets very very jaggy... ?
		/*
		//this doesn't actually help any
		if ( trace.entityNum != ENTITYNUM_WORLD )
		{
			centity_t *cent = &cg_entities[trace.entityNum];
			gentity_t *gent = &g_entities[trace.entityNum];
			if ( cent != NULL && gent != NULL )
			{
				if ( cent->currentState.pos.trType == TR_LINEAR || cent->currentState.pos.trType == TR_LINEAR_STOP )
				{
					vec3_t	diff;
					VectorSubtract( cent->lerpOrigin, gent->currentOrigin, diff );
					VectorAdd( cameraCurLoc, diff, cameraCurLoc );
				}
			}
		}
		*/
	}

	// Note that previously there was an upper limit to the number of physics traces that are done through the world
	// for the sake of camera collision, since it wasn't calced per frame.  Now it is calculated every frame.
	// This has the benefit that the camera is a lot smoother now (before it lerped between tested points),
	// however two full volume traces each frame is a bit scary to think about.
}




/*
===============`
CG_OffsetThirdPersonView

===============
*/
extern vmCvar_t cg_thirdPersonHorzOffset;
static void CG_OffsetThirdPersonView( void ) 
{
	vec3_t diff;
	float thirdPersonHorzOffset = cg_thirdPersonHorzOffset.value;
	float deltayaw;

	cameraStiffFactor = 0.0;

	// Set camera viewing direction.
	VectorCopy( cg.refdefViewAngles, cameraFocusAngles );

	// if dead, look at killer
	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) 
	{
		cameraFocusAngles[YAW] = cg.snap->ps.stats[STAT_DEAD_YAW];
	}
	else
	{	// Add in the third Person Angle.
		cameraFocusAngles[YAW] += cg_thirdPersonAngle.value;
		cameraFocusAngles[PITCH] += cg_thirdPersonPitchOffset.value;
	}

	// The next thing to do is to see if we need to calculate a new camera target location.

	// If we went back in time for some reason, or if we just started, reset the sample.
	if (cameraLastFrame == 0 || cameraLastFrame > cg.time)
	{
		CG_ResetThirdPersonViewDamp();
	}
	else
	{
		// Cap the pitch within reasonable limits
		if (cameraFocusAngles[PITCH] > 80.0)
		{
			cameraFocusAngles[PITCH] = 80.0;
		}
		else if (cameraFocusAngles[PITCH] < -80.0)
		{
			cameraFocusAngles[PITCH] = -80.0;
		}

		AngleVectors(cameraFocusAngles, camerafwd, NULL, cameraup);

		deltayaw = fabs(cameraFocusAngles[YAW] - cameraLastYaw);
		if (deltayaw > 180.0f)
		{ // Normalize this angle so that it is between 0 and 180.
			deltayaw = fabs(deltayaw - 360.0f);
		}
		cameraStiffFactor = deltayaw / (float)(cg.time-cameraLastFrame);
		if (cameraStiffFactor < 1.0)
		{
			cameraStiffFactor = 0.0;
		}
		else if (cameraStiffFactor > 2.5)
		{
			cameraStiffFactor = 0.75;
		}
		else
		{	// 1 to 2 scales from 0.0 to 0.5
			cameraStiffFactor = (cameraStiffFactor-1.0f)*0.5f;
		}
		cameraLastYaw = cameraFocusAngles[YAW];

		// Move the target to the new location.
		CG_UpdateThirdPersonTargetDamp();
		CG_UpdateThirdPersonCameraDamp();
	}

	// Now interestingly, the Quake method is to calculate a target focus point above the player, and point the camera at it.
	// We won't do that for now.

	// We must now take the angle taken from the camera target and location.
	/*VectorSubtract(cameraCurTarget, cameraCurLoc, diff);
	VectorNormalize(diff);
	vectoangles(diff, cg.refdefViewAngles);*/
	VectorSubtract(cameraCurTarget, cameraCurLoc, diff);
	{
		float dist = VectorNormalize(diff);
		//under normal circumstances, should never be 0.00000 and so on.
		if ( !dist || (diff[0] == 0 || diff[1] == 0) )
		{//must be hitting something, need some value to calc angles, so use cam forward
			VectorCopy( camerafwd, diff );
		}
	}
	vectoangles(diff, cg.refdefViewAngles);

	// Temp: just move the camera to the side a bit
	if ( thirdPersonHorzOffset != 0.0f )
	{
		AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
		VectorMA( cameraCurLoc, thirdPersonHorzOffset, cg.refdef.viewaxis[1], cameraCurLoc );
	}

	// ...and of course we should copy the new view location to the proper spot too.
	VectorCopy(cameraCurLoc, cg.refdef.vieworg);

	cameraLastFrame=cg.time;
}



/*
===============
CG_OffsetThirdPersonView

===============
*//*
#define	FOCUS_DISTANCE	512
static void CG_OffsetThirdPersonView( void ) {
	vec3_t		forward, right, up;
	vec3_t		view;
	vec3_t		focusAngles;
	trace_t		trace;
	static vec3_t	mins = { -4, -4, -4 };
	static vec3_t	maxs = { 4, 4, 4 };
	vec3_t		focusPoint;
	float		focusDist;
	float		forwardScale, sideScale;

	cg.refdef.vieworg[2] += cg.predictedPlayerState.viewheight;

	VectorCopy( cg.refdefViewAngles, focusAngles );

	// if dead, look at killer
	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
		focusAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
		cg.refdefViewAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
	}

	if ( focusAngles[PITCH] > 45 ) {
		focusAngles[PITCH] = 45;		// don't go too far overhead
	}
	AngleVectors( focusAngles, forward, NULL, NULL );

	VectorMA( cg.refdef.vieworg, FOCUS_DISTANCE, forward, focusPoint );

	VectorCopy( cg.refdef.vieworg, view );

	view[2] += 8;

	cg.refdefViewAngles[PITCH] *= 0.5;

	AngleVectors( cg.refdefViewAngles, forward, right, up );

	forwardScale = cos( cg_thirdPersonAngle.value / 180 * M_PI );
	sideScale = sin( cg_thirdPersonAngle.value / 180 * M_PI );
	VectorMA( view, -cg_thirdPersonRange.value * forwardScale, forward, view );
	VectorMA( view, -cg_thirdPersonRange.value * sideScale, right, view );

	// trace a ray from the origin to the viewpoint to make sure the view isn't
	// in a solid block.  Use an 8 by 8 block to prevent the view from near clipping anything

	if (!cg_cameraMode.integer) {
		CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_CAMERACLIP);

		if ( trace.fraction != 1.0 ) {
			VectorCopy( trace.endpos, view );
			view[2] += (1.0 - trace.fraction) * 32;
			// try another trace to this position, because a tunnel may have the ceiling
			// close enogh that this is poking out

			CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_CAMERACLIP);
			VectorCopy( trace.endpos, view );
		}
	}


	VectorCopy( view, cg.refdef.vieworg );

	// select pitch to look at focus point from vieword
	VectorSubtract( focusPoint, cg.refdef.vieworg, focusPoint );
	focusDist = sqrt( focusPoint[0] * focusPoint[0] + focusPoint[1] * focusPoint[1] );
	if ( focusDist < 1 ) {
		focusDist = 1;	// should never happen
	}
	cg.refdefViewAngles[PITCH] = -180 / M_PI * atan2( focusPoint[2], focusDist );
	cg.refdefViewAngles[YAW] -= cg_thirdPersonAngle.value;
}


// this causes a compiler bug on mac MrC compiler
static void CG_StepOffset( void ) {
	int		timeDelta;
	
	// smooth out stair climbing
	timeDelta = cg.time - cg.stepTime;
	if ( timeDelta < STEP_TIME ) {
		cg.refdef.vieworg[2] -= cg.stepChange 
			* (STEP_TIME - timeDelta) / STEP_TIME;
	}
}*/

/*
===============
CG_OffsetFirstPersonView

===============
*/
static void CG_OffsetFirstPersonView( void ) {
	float			*origin;
	float			*angles;
	float			bob;
	float			ratio;
	float			delta;
	float			speed;
	float			f;
	vec3_t			predictedVelocity;
	int				timeDelta;
	
	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
		return;
	}

	origin = cg.refdef.vieworg;
	angles = cg.refdefViewAngles;

	// if dead, fix the angle and don't add any kick
	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
		angles[ROLL] = 40;
		angles[PITCH] = -15;
		angles[YAW] = cg.snap->ps.stats[STAT_DEAD_YAW];
		origin[2] += cg.predictedPlayerState.viewheight;
		return;
	}

	// add angles based on weapon kick
	VectorAdd (angles, cg.kick_angles, angles);

	// add angles based on damage kick
	if ( cg.damageTime ) {
		ratio = cg.time - cg.damageTime;
		if ( ratio < DAMAGE_DEFLECT_TIME ) {
			ratio /= DAMAGE_DEFLECT_TIME;
			angles[PITCH] += ratio * cg.v_dmg_pitch;
			angles[ROLL] += ratio * cg.v_dmg_roll;
		} else {
			ratio = 1.0 - ( ratio - DAMAGE_DEFLECT_TIME ) / DAMAGE_RETURN_TIME;
			if ( ratio > 0 ) {
				angles[PITCH] += ratio * cg.v_dmg_pitch;
				angles[ROLL] += ratio * cg.v_dmg_roll;
			}
		}
	}

	// add pitch based on fall kick
#if 0
	ratio = ( cg.time - cg.landTime) / FALL_TIME;
	if (ratio < 0)
		ratio = 0;
	angles[PITCH] += ratio * cg.fall_value;
#endif

	// add angles based on velocity
	VectorCopy( cg.predictedPlayerState.velocity, predictedVelocity );

	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[0]);
	angles[PITCH] += delta * cg_runpitch.value;
	
	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[1]);
	angles[ROLL] -= delta * cg_runroll.value;

	// add angles based on bob

	// make sure the bob is visible even at low speeds
	speed = cg.xyspeed > 200 ? cg.xyspeed : 200;

	delta = cg.bobfracsin * cg_bobpitch.value * speed;
	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
		delta *= 3;		// crouching
	angles[PITCH] += delta;
	delta = cg.bobfracsin * cg_bobroll.value * speed;
	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
		delta *= 3;		// crouching accentuates roll
	if (cg.bobcycle & 1)
		delta = -delta;
	angles[ROLL] += delta;

//===================================

	// add view height
	origin[2] += cg.predictedPlayerState.viewheight;

	// smooth out duck height changes
	timeDelta = cg.time - cg.duckTime;
	if ( timeDelta < DUCK_TIME) {
		cg.refdef.vieworg[2] -= cg.duckChange 
			* (DUCK_TIME - timeDelta) / DUCK_TIME;
	}

	// add bob height
	bob = cg.bobfracsin * cg.xyspeed * cg_bobup.value;
	if (bob > 6) {
		bob = 6;
	}

	origin[2] += bob;


	// add fall height
	delta = cg.time - cg.landTime;
	if ( delta < LAND_DEFLECT_TIME ) {
		f = delta / LAND_DEFLECT_TIME;
		cg.refdef.vieworg[2] += cg.landChange * f;
	} else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
		delta -= LAND_DEFLECT_TIME;
		f = 1.0 - ( delta / LAND_RETURN_TIME );
		cg.refdef.vieworg[2] += cg.landChange * f;
	}

	// add step offset
	CG_StepOffset();

	// add kick offset

	VectorAdd (origin, cg.kick_origin, origin);

	// pivot the eye based on a neck length
#if 0
	{
#define	NECK_LENGTH		8
	vec3_t			forward, up;
 
	cg.refdef.vieworg[2] -= NECK_LENGTH;
	AngleVectors( cg.refdefViewAngles, forward, NULL, up );
	VectorMA( cg.refdef.vieworg, 3, forward, cg.refdef.vieworg );
	VectorMA( cg.refdef.vieworg, NECK_LENGTH, up, cg.refdef.vieworg );
	}
#endif
}

//======================================================================

void CG_ZoomDown_f( void ) { 
	if ( cg.zoomed ) {
		return;
	}
	cg.zoomed = qtrue;
	cg.zoomTime = cg.time;
}

void CG_ZoomUp_f( void ) { 
	if ( !cg.zoomed ) {
		return;
	}
	cg.zoomed = qfalse;
	cg.zoomTime = cg.time;
}



/*
====================
CG_CalcFovFromX

Calcs Y FOV from given X FOV
====================
*/
#define	WAVE_AMPLITUDE	1
#define	WAVE_FREQUENCY	0.4

qboolean CG_CalcFOVFromX( float fov_x ) 
{
	float	x;
//	float	phase;
//	float	v;
//	int		contents;
	float	fov_y;
	qboolean	inwater;

	x = cg.refdef.width / tan( fov_x / 360 * M_PI );
	fov_y = atan2( cg.refdef.height, x );
	fov_y = fov_y * 360 / M_PI;

	// there's a problem with this, it only takes the leafbrushes into account, not the entity brushes,
	//	so if you give slime/water etc properties to a func_door area brush in order to move the whole water 
	//	level up/down this doesn't take into account the door position, so warps the view the whole time
	//	whether the water is up or not. Fortunately there's only one slime area in Trek that you can be under,
	//	so lose it...
#if 0
/*
	// warp if underwater
	contents = CG_PointContents( cg.refdef.vieworg, -1 );
	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ){
		phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
		v = WAVE_AMPLITUDE * sin( phase );
		fov_x += v;
		fov_y -= v;
		inwater = qtrue;
	}
	else {
		inwater = qfalse;
	}
*/
#else
	inwater = qfalse;
#endif


	// set it
	cg.refdef.fov_x = fov_x;
	cg.refdef.fov_y = fov_y;

	return (inwater);
}

/*
====================
CG_CalcFov

Fixed fov at intermissions, otherwise account for fov variable and zooms.
====================
*/
#define	WAVE_AMPLITUDE	1
#define	WAVE_FREQUENCY	0.4
float zoomFov; //this has to be global client-side

static int CG_CalcFov( void ) {
	float	x;
	float	phase;
	float	v;
	int		contents;
	float	fov_x, fov_y;
	float	f;
	int		inwater;
	float	cgFov = cg_fov.value;

	if (cgFov < 1)
	{
		cgFov = 1;
	}
	if (cgFov > 97)
	{
		cgFov = 97;
	}

	if ( cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
		// if in intermission, use a fixed value
		fov_x = 80;//90;
	} else {
		// user selectable
		if ( cgs.dmflags & DF_FIXED_FOV ) {
			// dmflag to prevent wide fov for all clients
			fov_x = 80;//90;
		} else {
			fov_x = cgFov;
			if ( fov_x < 1 ) {
				fov_x = 1;
			} else if ( fov_x > 160 ) {
				fov_x = 160;
			}
		}

		if (cg.predictedPlayerState.zoomMode == 2)
		{ //binoculars
			if (zoomFov > 40.0f)
			{
				zoomFov -= cg.frametime * 0.075f;

				if (zoomFov < 40.0f)
				{
					zoomFov = 40.0f;
				}
				else if (zoomFov > cgFov)
				{
					zoomFov = cgFov;
				}
			}

			fov_x = zoomFov;
		}
		else if (cg.predictedPlayerState.zoomMode && pug_demos_cameraMode.integer < 3 )
		{
			if (!cg.predictedPlayerState.zoomLocked)
			{
				if (zoomFov > 50)
				{ //Now starting out at nearly half zoomed in
					zoomFov = 50;
				}
				zoomFov -= cg.frametime * 0.035f;//0.075f;

				if (zoomFov < MAX_ZOOM_FOV)
				{
					zoomFov = MAX_ZOOM_FOV;
				}
				else if (zoomFov > cgFov)
				{
					zoomFov = cgFov;
				}
				else
				{	// Still zooming
					static zoomSoundTime = 0;

					if (zoomSoundTime < cg.time || zoomSoundTime > cg.time + 10000)
					{
						trap_S_StartSound(cg.refdef.vieworg, ENTITYNUM_WORLD, CHAN_LOCAL, cgs.media.disruptorZoomLoop);
						zoomSoundTime = cg.time + 300;
					}
				}
			}

			fov_x = zoomFov;
		}
		else 
		{
			zoomFov = 80;

			f = ( cg.time - cg.predictedPlayerState.zoomTime ) / ZOOM_OUT_TIME;
			if ( f > 1.0 || pug_demos_cameraMode.integer > 2 ) 
			{
				fov_x = fov_x;
			} 
			else 
			{
				fov_x = cg.predictedPlayerState.zoomFov + f * ( fov_x - cg.predictedPlayerState.zoomFov );
			}
		}
	}

	x = cg.refdef.width / tan( fov_x / 360 * M_PI );
	fov_y = atan2( cg.refdef.height, x );
	fov_y = fov_y * 360 / M_PI;

	// warp if underwater
	contents = CG_PointContents( cg.refdef.vieworg, -1 );
	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ){
		phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
		v = WAVE_AMPLITUDE * sin( phase );
		fov_x += v;
		fov_y -= v;
		inwater = qtrue;
	}
	else {
		inwater = qfalse;
	}


	// set it
	cg.refdef.fov_x = fov_x;
	cg.refdef.fov_y = fov_y;

	if (cg.predictedPlayerState.zoomMode)
	{
		cg.zoomSensitivity = zoomFov/cgFov;
	}
	else if ( !cg.zoomed ) {
		cg.zoomSensitivity = 1;
	} else {
		cg.zoomSensitivity = cg.refdef.fov_y / 75.0;
	}

	return inwater;
}


/*
===============
CG_DamageBlendBlob

===============
*/
static void CG_DamageBlendBlob( void ) 
{
	int			t;
	int			maxTime;
	refEntity_t		ent;

	if ( !cg.damageValue ) {
		return;
	}

	maxTime = DAMAGE_TIME;
	t = cg.time - cg.damageTime;
	if ( t <= 0 || t >= maxTime ) {
		return;
	}

	memset( &ent, 0, sizeof( ent ) );
	ent.reType = RT_SPRITE;
	ent.renderfx = RF_FIRST_PERSON;

	VectorMA( cg.refdef.vieworg, 8, cg.refdef.viewaxis[0], ent.origin );
	VectorMA( ent.origin, cg.damageX * -8, cg.refdef.viewaxis[1], ent.origin );
	VectorMA( ent.origin, cg.damageY * 8, cg.refdef.viewaxis[2], ent.origin );

	ent.radius = cg.damageValue * 3 * ( 1.0 - ((float)t / maxTime) );

	if (cg.snap->ps.damageType == 0)
	{ //pure health
		ent.customShader = cgs.media.viewPainShader;
		ent.shaderRGBA[0] = 180 * ( 1.0 - ((float)t / maxTime) );
		ent.shaderRGBA[1] = 50 * ( 1.0 - ((float)t / maxTime) );
		ent.shaderRGBA[2] = 50 * ( 1.0 - ((float)t / maxTime) );
		ent.shaderRGBA[3] = 255;
	}
	else if (cg.snap->ps.damageType == 1)
	{ //pure shields
		ent.customShader = cgs.media.viewPainShader_Shields;
		ent.shaderRGBA[0] = 50 * ( 1.0 - ((float)t / maxTime) );
		ent.shaderRGBA[1] = 180 * ( 1.0 - ((float)t / maxTime) );
		ent.shaderRGBA[2] = 50 * ( 1.0 - ((float)t / maxTime) );
		ent.shaderRGBA[3] = 255;
	}
	else
	{ //shields and health
		ent.customShader = cgs.media.viewPainShader_ShieldsAndHealth;
		ent.shaderRGBA[0] = 180 * ( 1.0 - ((float)t / maxTime) );
		ent.shaderRGBA[1] = 180 * ( 1.0 - ((float)t / maxTime) );
		ent.shaderRGBA[2] = 50 * ( 1.0 - ((float)t / maxTime) );
		ent.shaderRGBA[3] = 255;
	}
	trap_R_AddRefEntityToScene( &ent );
}

qboolean CheckOutOfConstrict(float curAng)
{
	float degrees_negative, degrees_positive;

	float angle_ideal = cg.constrictValue;
	float angle_current = curAng;

	float angle_dif = 0;

	if (angle_current < 0)
	{
		angle_current += 360;
	}
	if (angle_current > 360)
	{
		angle_current -= 360;
	}

	if (cg.doConstrict <= cg.time)
	{
		return qfalse;
	}

	if (angle_ideal <= angle_current)
	{
		degrees_negative = (angle_current - angle_ideal);

		degrees_positive = (360 - angle_current) + angle_ideal;
	}
	else
	{
		degrees_negative = angle_current + (360 - angle_ideal);

		degrees_positive = (angle_ideal - angle_current);
	}

	if (degrees_negative < degrees_positive)
	{
		angle_dif = degrees_negative;
	}
	else
	{
		angle_dif = degrees_positive;
	}

	if (angle_dif > 60)
	{
		return qtrue;
	}

	return qfalse;
}

/*
===============
CG_CalcViewValues

Sets cg.refdef view values
===============
*/
static int CG_CalcViewValues( void ) {
	playerState_t	*ps;

	memset( &cg.refdef, 0, sizeof( cg.refdef ) );

	// strings for in game rendering
	// Q_strncpyz( cg.refdef.text[0], "Park Ranger", sizeof(cg.refdef.text[0]) );
	// Q_strncpyz( cg.refdef.text[1], "19", sizeof(cg.refdef.text[1]) );

	// calculate size of 3D view
	CG_CalcVrect();

	ps = &cg.predictedPlayerState;
/*
	if (cg.cameraMode) {
		vec3_t origin, angles;
		if (trap_getCameraInfo(cg.time, &origin, &angles)) {
			VectorCopy(origin, cg.refdef.vieworg);
			angles[ROLL] = 0;
			VectorCopy(angles, cg.refdefViewAngles);
			AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
			return CG_CalcFov();
		} else {
			cg.cameraMode = qfalse;
		}
	}
*/
	// intermission view
	if ( ps->pm_type == PM_INTERMISSION ) {
		VectorCopy( ps->origin, cg.refdef.vieworg );
		VectorCopy( ps->viewangles, cg.refdefViewAngles );
		AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
		return CG_CalcFov();
	}

	cg.bobcycle = ( ps->bobCycle & 128 ) >> 7;
	cg.bobfracsin = fabs( sin( ( ps->bobCycle & 127 ) / 127.0 * M_PI ) );
	cg.xyspeed = sqrt( ps->velocity[0] * ps->velocity[0] +
		ps->velocity[1] * ps->velocity[1] );

	if (cg.xyspeed > 270)
	{
		cg.xyspeed = 270;
	}

	VectorCopy( ps->origin, cg.refdef.vieworg );
	VectorCopy( ps->viewangles, cg.refdefViewAngles );

	if (cg_cameraOrbit.integer) {
		if (cg.time > cg.nextOrbitTime) {
			cg.nextOrbitTime = cg.time + cg_cameraOrbitDelay.integer;
			cg_thirdPersonAngle.value += cg_cameraOrbit.value;
		}
	}
	// add error decay
	if ( cg_errorDecay.value > 0 ) {
		int		t;
		float	f;

		t = cg.time - cg.predictedErrorTime;
		f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
		if ( f > 0 && f < 1 ) {
			VectorMA( cg.refdef.vieworg, f, cg.predictedError, cg.refdef.vieworg );
		} else {
			cg.predictedErrorTime = 0;
		}
	}

	if ( cg.renderingThirdPerson && !cg.snap->ps.zoomMode) {
		// back away from character
		CG_OffsetThirdPersonView();
	} else {
		// offset for local bobbing and kicks
		CG_OffsetFirstPersonView();
	}

	// position eye reletive to origin
	AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );

	if ( cg.hyperspace ) {
		cg.refdef.rdflags |= RDF_NOWORLDMODEL | RDF_HYPERSPACE;
	}

	// field of view
	return CG_CalcFov();
}


/*
=====================
CG_PowerupTimerSounds
=====================
*/
static void CG_PowerupTimerSounds( void ) {
	int		i;
	int		t;

	// powerup timers going away
	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
		t = cg.snap->ps.powerups[i];
		if ( t <= cg.time ) {
			continue;
		}
		if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
			continue;
		}
		if ( ( t - cg.time ) / POWERUP_BLINK_TIME != ( t - cg.oldTime ) / POWERUP_BLINK_TIME ) {
			//trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_ITEM, cgs.media.wearOffSound );
		}
	}
}

/*
=====================
CG_AddBufferedSound
=====================
*/
void CG_AddBufferedSound( sfxHandle_t sfx ) {
	if ( !sfx )
		return;
	cg.soundBuffer[cg.soundBufferIn] = sfx;
	cg.soundBufferIn = (cg.soundBufferIn + 1) % MAX_SOUNDBUFFER;
	if (cg.soundBufferIn == cg.soundBufferOut) {
		cg.soundBufferOut++;
	}
}

/*
=====================
CG_PlayBufferedSounds
=====================
*/
static void CG_PlayBufferedSounds( void ) {
	if ( cg.soundTime < cg.time ) {
		if (cg.soundBufferOut != cg.soundBufferIn && cg.soundBuffer[cg.soundBufferOut]) {
			trap_S_StartLocalSound(cg.soundBuffer[cg.soundBufferOut], CHAN_ANNOUNCER);
			cg.soundBuffer[cg.soundBufferOut] = 0;
			cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
			cg.soundTime = cg.time + 750;
		}
	}
}

void CG_UpdateSoundTrackers()
{
	int num;
	centity_t *cent;

	for ( num = 0 ; num < ENTITYNUM_NONE ; num++ )
	{
		cent = &cg_entities[num];

		if (cent && cent->currentState.eFlags & EF_SOUNDTRACKER)
		{ //keep sound for this entity updated in accordance with its attached entity at all times
			if (cg.snap && cent->currentState.trickedentindex == cg.snap->ps.clientNum)
			{ //this is actually the player, so center the sound origin right on top of us
				VectorCopy(cg.refdef.vieworg, cent->lerpOrigin);
				trap_S_UpdateEntityPosition( cent->currentState.number, cent->lerpOrigin );
			}
			else
			{
				trap_S_UpdateEntityPosition( cent->currentState.number, cg_entities[cent->currentState.trickedentindex].lerpOrigin );
			}
		}
	}
}

//=========================================================================

/*
================================
Screen Effect stuff starts here
================================
*/
#define	CAMERA_DEFAULT_FOV			90.0f
#define MAX_SHAKE_INTENSITY			16.0f

cgscreffects_t cgScreenEffects;

void CG_SE_UpdateShake( vec3_t origin, vec3_t angles )
{
	vec3_t	moveDir;
	float	intensity_scale, intensity;
	int		i;
	
	if( pug_demospec.integer != -1 )return;

	if ( cgScreenEffects.shake_duration <= 0 )
		return;

	if ( cg.time > ( cgScreenEffects.shake_start + cgScreenEffects.shake_duration ) )
	{
		cgScreenEffects.shake_intensity = 0;
		cgScreenEffects.shake_duration = 0;
		cgScreenEffects.shake_start = 0;
		return;
	}

	cgScreenEffects.FOV = CAMERA_DEFAULT_FOV;
	cgScreenEffects.FOV2 = CAMERA_DEFAULT_FOV;

	//intensity_scale now also takes into account FOV with 90.0 as normal
	intensity_scale = 1.0f - ( (float) ( cg.time - cgScreenEffects.shake_start ) / (float) cgScreenEffects.shake_duration ) * (((cgScreenEffects.FOV+cgScreenEffects.FOV2)/2.0f)/90.0f);

	intensity = cgScreenEffects.shake_intensity * intensity_scale;

	for ( i = 0; i < 3; i++ )
	{
		moveDir[i] = ( crandom() * intensity );
	}

	//Move the camera
	VectorAdd( origin, moveDir, origin );

	for ( i=0; i < 2; i++ ) // Don't do ROLL
		moveDir[i] = ( crandom() * intensity );

	//Move the angles
	VectorAdd( angles, moveDir, angles );
}

void CG_SE_UpdateMusic(void)
{
	if (cgScreenEffects.music_volume_multiplier < 0.1)
	{
		cgScreenEffects.music_volume_multiplier = 1.0;
		return;
	}

	if (cgScreenEffects.music_volume_time < cg.time)
	{
		if (cgScreenEffects.music_volume_multiplier != 1.0 || cgScreenEffects.music_volume_set)
		{
			char musMultStr[512];

			cgScreenEffects.music_volume_multiplier += 0.1;
			if (cgScreenEffects.music_volume_multiplier > 1.0)
			{
				cgScreenEffects.music_volume_multiplier = 1.0;
			}

			Com_sprintf(musMultStr, sizeof(musMultStr), "%f", cgScreenEffects.music_volume_multiplier);
			trap_Cvar_Set("s_musicMult", musMultStr);

			if (cgScreenEffects.music_volume_multiplier == 1.0)
			{
				cgScreenEffects.music_volume_set = qfalse;
			}
			else
			{
				cgScreenEffects.music_volume_time = cg.time + 200;
			}
		}

		return;
	}

	if (!cgScreenEffects.music_volume_set)
	{ //if the volume_time is >= cg.time, we should have a volume multiplier set
		char musMultStr[512];

		Com_sprintf(musMultStr, sizeof(musMultStr), "%f", cgScreenEffects.music_volume_multiplier);
		trap_Cvar_Set("s_musicMult", musMultStr);
		cgScreenEffects.music_volume_set = qtrue;
	}
}

/*
=================
CG_CalcScreenEffects

Currently just for screen shaking (and music volume management)
=================
*/
void CG_CalcScreenEffects(void)
{
	if( pug_demospec.integer != -1 )return;
	CG_SE_UpdateShake(cg.refdef.vieworg, cg.refdefViewAngles);
	CG_SE_UpdateMusic();
}

void CGCam_Shake( float intensity, int duration )
{
	if( pug_demospec.integer != -1 )return;
	if ( intensity > MAX_SHAKE_INTENSITY )
		intensity = MAX_SHAKE_INTENSITY;

	cgScreenEffects.shake_intensity = intensity;
	cgScreenEffects.shake_duration = duration;
	cgScreenEffects.shake_start = cg.time;
}

void CGCam_SetMusicMult( float multiplier, int duration )
{
	if (multiplier < 0.1f)
	{
		multiplier = 0.1f;
	}

	if (multiplier > 1.0f)
	{
		multiplier = 1.0f;
	}

	cgScreenEffects.music_volume_multiplier = multiplier;
	cgScreenEffects.music_volume_time = cg.time + duration;
	cgScreenEffects.music_volume_set = qfalse;
}

/*
================================
Screen Effect stuff ends here
================================
*/

/*
=================
CG_DrawActiveFrame

Generates and draws a game scene and status information at the given time.
=================
*/

typedef struct {
	vec3_t		origin;
	vec3_t		angle;
	int			time;
	qboolean	thirdPerson;
	vec4_t		csi_coeff[6];   //cubic spline interpolation coefficients
} demoCam_t;

extern int gotime;
extern demoCam_t cam[50];
extern int curCam;
snapshot_t snap;

void CG_DrawActiveFrame( int serverTime, stereoFrame_t stereoView, qboolean demoPlayback ) {
	int		inwater,orgState;
	static int oldTime = 0;
	//int mypw[MAX_POWERUPS];
	playerState_t prps;
	static qboolean demoCamming = qfalse, TPdemoCamming = qfalse;
	extern fileHandle_t ghostFile;
	extern qboolean ghostMode;
	
	if(pug_demos_cameraMode.integer == 4 || pug_demos_cameraMode.integer == 5 || pug_demos_cameraMode.integer == 6 || pug_demos_cameraMode.integer == 7 || gotime != 0) {
		if(demoPlayback && gotime!=0) {
			int nextTime;
			if(oldTime!=0)nextTime = (serverTime - cgs.levelStartTime) + ((serverTime - cgs.levelStartTime) - oldTime);
			else nextTime = serverTime - cgs.levelStartTime;
			oldTime = serverTime - cgs.levelStartTime;
			if( gotime - nextTime <= 0 ) {
				trap_Cvar_Set("timescale","1");
				gotime = oldTime = 0;
			} else {
				trap_Cvar_Set("timescale",va("%d",(1 + (gotime - nextTime) / 100)));
			}
		} else if(demoPlayback) {
			double timeDelta;
			vec3_t curVec,curVeca;
			int i;
			double l_time=((double)(serverTime - cgs.levelStartTime))/1000;
			qboolean oldCamming;
			oldCamming = demoCamming || TPdemoCamming;
			demoCamming = qfalse;
			for(i = 0;i < curCam - 1;i++) {
				if(cam[i].time!=0 && cam[i].time <= serverTime - cgs.levelStartTime && cam[i+1].time > serverTime - cgs.levelStartTime && cam[i+1].time > cam[i].time){demoCamming = qtrue;break;}
			}
			if(demoCamming) {
				timeDelta = (double)(serverTime - cgs.levelStartTime - cam[i].time) / (double)(cam[i+1].time - cam[i].time);
				l_time=((double)(serverTime - cgs.levelStartTime - cam[i].time))/1000;
				if( cam[i].thirdPerson ) {
					demoCamming = qfalse; //we still need 2 do third person angles here...
					TPdemoCamming = qtrue;
					cg_thirdPersonHorzOffset.value = cam[i+1].origin[1] * timeDelta + cam[i].origin[1] * (1 - timeDelta);
					cg_thirdPersonVertOffset.value = cam[i+1].origin[2] * timeDelta + cam[i].origin[2] * (1 - timeDelta);
					cg_thirdPersonPitchOffset.value = cam[i+1].angle[0] * timeDelta + cam[i].angle[0] * (1 - timeDelta);
					cg_thirdPersonAngle.value = cam[i+1].angle[1] * timeDelta + cam[i].angle[1] * (1 - timeDelta);
					cg_thirdPersonRange.value = cam[i+1].angle[2] * timeDelta + cam[i].angle[2] * (1 - timeDelta);
					if(!oldCamming && cam_autorecord.integer>0)trap_Cvar_Set( "cl_avidemo", va( "%d", cam_autorecord.integer ) );
				} else {
					vec3_t atOrg, dir2Me;
					/*curVec[0] = cam[i+1].origin[0] * timeDelta + cam[i].origin[0] * (1 - timeDelta);
					curVec[1] = cam[i+1].origin[1] * timeDelta + cam[i].origin[1] * (1 - timeDelta);
					curVec[2] = cam[i+1].origin[2] * timeDelta + cam[i].origin[2] * (1 - timeDelta);*/
					curVec[0] = cam[i].csi_coeff[0][0]*l_time*l_time*l_time+cam[i].csi_coeff[0][1]*l_time*l_time+cam[i].csi_coeff[0][2]*l_time+cam[i].csi_coeff[0][3];
					curVec[1] = cam[i].csi_coeff[1][0]*l_time*l_time*l_time+cam[i].csi_coeff[1][1]*l_time*l_time+cam[i].csi_coeff[1][2]*l_time+cam[i].csi_coeff[1][3];
					curVec[2] = cam[i].csi_coeff[2][0]*l_time*l_time*l_time+cam[i].csi_coeff[2][1]*l_time*l_time+cam[i].csi_coeff[2][2]*l_time+cam[i].csi_coeff[2][3];
					VectorAdd( curVec, cam[i].origin, curVec );
					/*curVeca[0] = cam[i+1].angle[0] * timeDelta + cam[i].angle[0] * (1 - timeDelta);
					curVeca[1] = cam[i+1].angle[1] * timeDelta + cam[i].angle[1] * (1 - timeDelta);
					curVeca[2] = cam[i+1].angle[2] * timeDelta + cam[i].angle[2] * (1 - timeDelta);*/
					curVeca[0] = cam[i].csi_coeff[3][0]*l_time*l_time*l_time+cam[i].csi_coeff[3][1]*l_time*l_time+cam[i].csi_coeff[3][2]*l_time+cam[i].csi_coeff[3][3];
					curVeca[1] = cam[i].csi_coeff[4][0]*l_time*l_time*l_time+cam[i].csi_coeff[4][1]*l_time*l_time+cam[i].csi_coeff[4][2]*l_time+cam[i].csi_coeff[4][3];
					curVeca[2] = cam[i].csi_coeff[5][0]*l_time*l_time*l_time+cam[i].csi_coeff[5][1]*l_time*l_time+cam[i].csi_coeff[5][2]*l_time+cam[i].csi_coeff[5][3];
					VectorAdd( curVeca, cam[i].angle, curVeca );
					if(pug_demos_cameraMode.integer>4) {
						//point at current focused player
						VectorCopy( cg_entities[pug_demospec.integer!=-1?pug_demospec.integer:cg.predictedPlayerState.clientNum].lerpOrigin, atOrg );
						//atOrg[2] = curVec[2];
						VectorSubtract( atOrg, curVec, dir2Me );
						vectoangles( dir2Me, curVeca );
						curVeca[2] = cam[i+1].angle[2] * timeDelta + cam[i].angle[2] * (1 - timeDelta);
					}
					if(pug_demos_cameraMode.integer == 6 )
						curVeca[PITCH] = cam[i+1].angle[0] * timeDelta + cam[i].angle[0] * (1 - timeDelta);
					if(pug_demos_cameraMode.integer == 7 )
						curVeca[YAW] = cam[i+1].angle[1] * timeDelta + cam[i].angle[1] * (1 - timeDelta);
					VectorCopy( curVec, cg.refdef.vieworg );
		    	    //VectorCopy( curVeca, cg.refdef.viewangles );
					VectorCopy( curVeca, cg.refdefViewAngles );
		        	AnglesToAxis( curVeca, cg.refdef.viewaxis );
			        CG_CalcFov();
			        if(!oldCamming && cam_autorecord.integer>0)trap_Cvar_Set( "cl_avidemo", va( "%d", cam_autorecord.integer ) );
		    	    //if(cam_endTime - (serverTime - cgs.levelStartTime)<=0)cam_endTime = cam_startTime = 0;
				}
			} else if(oldCamming) {
				if(cam_autorecord.integer>0)trap_Cvar_Set( "cl_avidemo", "0" );
			}
		}
	}

	cg.time = serverTime;
	cg.demoPlayback = demoPlayback;

	if (cg.snap && ui_myteam.integer != cg.snap->ps.persistant[PERS_TEAM])
	{
		trap_Cvar_Set ( "ui_myteam", va("%i", cg.snap->ps.persistant[PERS_TEAM]) );
	}

	// update cvars
	CG_UpdateCvars();

	// if we are only updating the screen as a loading
	// pacifier, don't even try to read snapshots
	if ( cg.infoScreenText[0] != 0 ) {
		CG_DrawInformation();
		return;
	}

	trap_FX_AdjustTime( cg.time, cg.refdef.vieworg, cg.refdef.viewaxis );

	CG_RunLightStyles();

	// any looped sounds will be respecified as entities
	// are added to the render list
	trap_S_ClearLoopingSounds(qfalse);

	// clear all the render lists
	trap_R_ClearScene();

	// set up cg.snap and possibly cg.nextSnap
	CG_ProcessSnapshots();

	trap_ROFF_UpdateEntities();

	// if we haven't received any snapshots yet, all
	// we can draw is the information screen
	if ( !cg.snap || ( cg.snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
		CG_DrawInformation();
		return;
	}

	// let the client system know what our weapon and zoom settings are
	if (cg.snap && cg.snap->ps.saberLockTime > cg.time)
	{
		trap_SetUserCmdValue( cg.weaponSelect, 0.01, cg.forceSelect, cg.itemSelect );
	}
	else if (cg.snap && cg.snap->ps.usingATST)
	{
		trap_SetUserCmdValue( cg.weaponSelect, 0.2, cg.forceSelect, cg.itemSelect );
	}
	else
	{
		trap_SetUserCmdValue( cg.weaponSelect, cg.zoomSensitivity, cg.forceSelect, cg.itemSelect );
	}

	// this counter will be bumped for every valid scene we generate
	cg.clientFrame++;

	// update cg.predictedPlayerState
	CG_PredictPlayerState();
	
    if( cg.demoPlayback && ( pug_demospec.integer!=-1 || demoCamming ) )
    {
		const char *configstring;
		int i;
		snap = *cg.snap;
		prps = cg.predictedPlayerState;
		//playerState_t ps;
		//int size;
		//size = &ps.generic1 - ps.stats;
        //cg.predictedPlayerState.clientNum = pug_demospec.integer;
        //memcpy(cg.snap->ps.stats,cg_entities[pug_demospec.integer].playerState->stats,size);
        //cg.snap->ps.clientNum = pug_demospec.integer;
        //cg.snap->ps.fd = cg_entities[pug_demospec.integer].playerState->fd;
        memset(&cg.snap->ps.fd,0,sizeof(forcedata_t));
        cg.snap->ps.stats[STAT_DEAD_YAW]=0;//cg_entities[pug_demospec.integer].playerState->stats[STAT_DEAD_YAW];
        for( i = 0; i < cgs.maxclients; i++ ) {
		    configstring = CG_ConfigString( i + CS_PLAYERS );
			strcpy( cgs.clientinfo[ i ].name, Info_ValueForKey(configstring, "n") );
		}
		if( cg.snap->ps.persistant[PERS_TEAM] == cgs.clientinfo[pug_demospec.integer].team && numSortedTeamPlayers ) {
			//only know health if its a teammate
			cg.snap->ps.stats[STAT_HEALTH] = cgs.clientinfo[pug_demospec.integer].health;
			cg.snap->ps.stats[STAT_ARMOR] = cgs.clientinfo[pug_demospec.integer].armor;
		} else {
			cg.snap->ps.stats[STAT_HEALTH] = cg_entities[pug_demospec.integer].currentState.eFlags & EF_DEAD?0:cg.snap->ps.stats[STAT_MAX_HEALTH];
		}
		cg.snap->ps.persistant[PERS_TEAM] = cg.predictedPlayerState.persistant[PERS_TEAM] = cgs.clientinfo[pug_demospec.integer].team;
		/*memcpy( cg.snap->ps.powerups, cg_entities[pug_demospec.integer].playerState->powerups, sizeof(int) * MAX_POWERUPS );
		memcpy( mypw, cg.predictedPlayerState.powerups, sizeof(int) * MAX_POWERUPS );
		memcpy( cg.predictedPlayerState.powerups, cg_entities[pug_demospec.integer].playerState->powerups, sizeof(int) * MAX_POWERUPS );*/
		orgState = cg.predictedPlayerState.pm_type;
		if(orgState == PM_DEAD)orgState = PM_NORMAL;
		cg.predictedPlayerState.pm_type = PM_NORMAL;
		if(cg_entities[pug_demospec.integer].currentState.eFlags & EF_DEAD) {
			cg.snap->ps.stats[STAT_DEAD_YAW] = cg_entities[pug_demospec.integer].lerpAngles[YAW];
			cg.predictedPlayerState.pm_type = PM_DEAD;
		}
		//messes up if original demo taker was free flight mode
		cg.snap->ps.fallingToDeath = 0;//cg_entities[pug_demospec.integer].playerState->fallingToDeath;
		cg.snap->ps.zoomMode = 0;
		cg.predictedPlayerState.zoomMode = 0;//cg_entities[pug_demospec.integer].playerState->zoomMode;
		cg.snap->ps.persistant[PERS_TEAM] = cgs.clientinfo[pug_demospec.integer].team;
		cg.snap->ps.viewheight = DEFAULT_VIEWHEIGHT;
		cg.predictedPlayerState.viewheight = DEFAULT_VIEWHEIGHT;
		cg.predictedPlayerState.weapon = cg.snap->ps.weapon = cg_entities[pug_demospec.integer].currentState.weapon;
		cg.predictedPlayerState.weaponstate = cg.snap->ps.weaponstate = cg_entities[pug_demospec.integer].currentState.modelindex2;
		
        //memcpy(&(cg.nextSnap->ps),cg_entities[pug_demospec.integer].playerState,sizeof(playerState_t));
        //ps = cg_entities[pug_demospec.integer].playerState;
        //CG_Printf("%d %d %d    %d %d %d\n",ps->origin[1],ps->origin[2],ps->origin[3],ps->viewangles[1],ps->viewangles[2],ps->viewangles[3]);
    }

	// decide on third person view
	cg.renderingThirdPerson = cg_thirdPerson.integer || (cg.snap->ps.stats[STAT_HEALTH] <= 0);

	if (cg.snap->ps.stats[STAT_HEALTH] > 0 && (cg.predictedPlayerState.weapon == WP_SABER || cg.predictedPlayerState.usingATST ||
		cg.predictedPlayerState.forceHandExtend == HANDEXTEND_KNOCKDOWN || cg.predictedPlayerState.fallingToDeath))
	{
		if (cg_fpls.integer && cg.predictedPlayerState.weapon == WP_SABER)
		{ //force to first person for fpls
			cg.renderingThirdPerson = 0;
		}
		else
		{
			cg.renderingThirdPerson = 1;
		}
	}
	else if (cg.snap->ps.zoomMode)
	{ //always force first person when zoomed
		cg.renderingThirdPerson = 0;
	}
	
	if (demoCamming) cg.renderingThirdPerson = 1;

	// build cg.refdef
	if( !(cg.demoPlayback && pug_demospec.integer!=-1 ) && !(cg.demoPlayback && demoCamming==qtrue))inwater = CG_CalcViewValues();

	CG_CalcScreenEffects();

	// first person blend blobs, done after AnglesToAxis
	if ( !cg.renderingThirdPerson ) {
		CG_DamageBlendBlob();
	}
	
	if( cg.demoPlayback && pug_demospec.integer!=-1 )
    {
		centity_t *cent;
		int orgFlags;
        cent = cg_entities + pug_demospec.integer;
        cg.predictedPlayerState.weapon = prps.weapon;
        cg.predictedPlayerState.weaponstate = prps.weaponstate;
        if( demoCamming == qfalse ) {
			VectorCopy( cent->lerpOrigin, cg.refdef.vieworg );
	        VectorCopy( cent->lerpAngles, cg.refdefViewAngles );
	        AnglesToAxis( cent->lerpAngles, cg.refdef.viewaxis );
		}
        //cg.snap->ps.m_iVehicleNum = cg_entities[pug_demospec.integer].playerState->m_iVehicleNum;
        cg.predictedPlayerState.pm_type = orgState;
        orgFlags = cg.predictedPlayerState.pm_flags;
        cg.predictedPlayerState.pm_flags = 0;
        if( demoCamming == qfalse ) {
	        if(cg.renderingThirdPerson)CG_OffsetThirdPersonView();
	        else CG_OffsetFirstPersonView();
	        CG_CalcFov();
		}
        cg.predictedPlayerState.pm_flags = orgFlags;
        /*memcpy( cg.snap->ps.powerups, snap.ps.powerups, sizeof(int) * MAX_POWERUPS );
        memcpy( cg.predictedPlayerState.powerups, mypw, sizeof(int) * MAX_POWERUPS );*/
    }

	// build the render lists
	if ( !cg.hyperspace ) {
		CG_AddPacketEntities();			// adter calcViewValues, so predicted player state is correct
		CG_AddMarks();
		CG_AddParticles ();
		CG_AddLocalEntities();
	}
	if( cg.demoPlayback && pug_demospec.integer!=-1 )
	{
		int orgNum;
		orgNum = cg.predictedPlayerState.clientNum;
		cg.predictedPlayerState.clientNum = pug_demospec.integer;
		CG_AddViewWeapon( &cg.predictedPlayerState );
		cg.predictedPlayerState.clientNum = orgNum;
		if(cg_entities[pug_demospec.integer].currentState.eFlags & EF_DEAD)cg.predictedPlayerState.pm_type = PM_DEAD;
	} else
		CG_AddViewWeapon( &cg.predictedPlayerState );

	if ( !cg.hyperspace) 
	{
		trap_FX_AddScheduledEffects();
	}

	// add buffered sounds
	CG_PlayBufferedSounds();

	// play buffered voice chats
	CG_PlayBufferedVoiceChats();

	// finish up the rest of the refdef
	if ( cg.testModelEntity.hModel ) {
		CG_AddTestModel();
	}
	cg.refdef.time = cg.time;
	memcpy( cg.refdef.areamask, cg.snap->areamask, sizeof( cg.refdef.areamask ) );

	// warning sounds when powerup is wearing off
	CG_PowerupTimerSounds();

	// if there are any entities flagged as sound trackers and attached to other entities, update their sound pos
	CG_UpdateSoundTrackers();

	if (gCGHasFallVector)
	{
		vec3_t lookAng;

		VectorSubtract(cg.snap->ps.origin, cg.refdef.vieworg, lookAng);
		VectorNormalize(lookAng);
		vectoangles(lookAng, lookAng);

		VectorCopy(gCGFallVector, cg.refdef.vieworg);
		AnglesToAxis(lookAng, cg.refdef.viewaxis);
	}

	// update audio positions
	trap_S_Respatialize( cg.snap->ps.clientNum, cg.refdef.vieworg, cg.refdef.viewaxis, inwater );

	// make sure the lagometerSample and frame timing isn't done twice when in stereo
	if ( stereoView != STEREO_RIGHT ) {
		cg.frametime = cg.time - cg.oldTime;
		if ( cg.frametime < 0 ) {
			cg.frametime = 0;
		}
		cg.oldTime = cg.time;
		CG_AddLagometerFrameInfo();
	}
	if (cg_timescale.value != cg_timescaleFadeEnd.value) {
		if (cg_timescale.value < cg_timescaleFadeEnd.value) {
			cg_timescale.value += cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
			if (cg_timescale.value > cg_timescaleFadeEnd.value)
				cg_timescale.value = cg_timescaleFadeEnd.value;
		}
		else {
			cg_timescale.value -= cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
			if (cg_timescale.value < cg_timescaleFadeEnd.value)
				cg_timescale.value = cg_timescaleFadeEnd.value;
		}
		if (cg_timescaleFadeSpeed.value) {
			trap_Cvar_Set("timescale", va("%f", cg_timescale.value));
		}
	}
	
	if( ghostFile!=-1) {
		switch( ghostMode ) {
			case qtrue:
			{
				static vec3_t vieworg,viewangles/*,viewaxis[3]*/,nextVieworg,nextViewangles/*,nextViewaxis[3]*/;
				static int servTime=0, nextServTime=0;
				int i;
				double timeDelta;
				while( cg.time > nextServTime ) {
					//push next down to current, read next from file
					VectorCopy( nextVieworg, vieworg );
					VectorCopy( nextViewangles, viewangles );
					//VectorCopy( nextViewaxis[0], viewaxis[0] );
					//VectorCopy( nextViewaxis[1], viewaxis[1] );
					//VectorCopy( nextViewaxis[2], viewaxis[2] );
					servTime = nextServTime;
					trap_FS_Read( &nextVieworg, sizeof( vec3_t ), ghostFile );
					trap_FS_Read( &nextViewangles, sizeof( vec3_t ), ghostFile );
					//trap_FS_Read( &nextViewaxis, sizeof( vec3_t ) * 3, ghostFile );
					trap_FS_Read( &nextServTime, sizeof( int ), ghostFile );
					if( nextServTime <= servTime ) {
						trap_FS_FCloseFile( ghostFile );
						ghostFile = -1;
						CG_Printf( "End of ghost reached.\n" );
						break;
					}
				}
				if( servTime != 0 )
				{
					vec3_t atOrg, dir2Me;
					//interpolate current cam pos from the 2 we have stored
					timeDelta = (double)( nextServTime - cg.time ) / (double)( nextServTime - servTime );
					for( i=0; i<3; i++ ) {
						cg.refdef.vieworg[i] = vieworg[i] * timeDelta + nextVieworg[i] * (1 - timeDelta);
						cg.refdefViewAngles[i] = viewangles[i] * timeDelta + nextViewangles[i] * (1 - timeDelta);
						//cg.refdef.viewaxis[0][i] = viewaxis[0][i] * timeDelta + nextViewaxis[0][i] * (1 - timeDelta);
						//cg.refdef.viewaxis[1][i] = viewaxis[1][i] * timeDelta + nextViewaxis[1][i] * (1 - timeDelta);
						//cg.refdef.viewaxis[2][i] = viewaxis[2][i] * timeDelta + nextViewaxis[2][i] * (1 - timeDelta);
					}
					if(pug_demos_cameraMode.integer>4) {
						//point at current focused player
						VectorCopy( cg_entities[pug_demospec.integer!=-1?pug_demospec.integer:cg.predictedPlayerState.clientNum].lerpOrigin, atOrg );
						VectorSubtract( atOrg, cg.refdef.vieworg, dir2Me );
						vectoangles( dir2Me, cg.refdefViewAngles );
						cg.refdefViewAngles[2] = viewangles[2] * timeDelta + nextViewangles[2] * (1 - timeDelta);
					}
					if(pug_demos_cameraMode.integer == 6 )
						cg.refdefViewAngles[PITCH] = viewangles[0] * timeDelta + nextViewangles[0] * (1 - timeDelta);
					if(pug_demos_cameraMode.integer == 7 )
						cg.refdefViewAngles[YAW] = viewangles[1] * timeDelta + nextViewangles[1] * (1 - timeDelta);
					AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
				}
				break;
			}
			case qfalse:
			{
				trap_FS_Write( cg.refdef.vieworg, sizeof( vec3_t ), ghostFile );
				trap_FS_Write( cg.refdefViewAngles, sizeof( vec3_t ), ghostFile );
				//trap_FS_Write( cg.refdef.viewaxis, sizeof( vec3_t ) * 3, ghostFile );
				trap_FS_Write( &serverTime, sizeof( int ), ghostFile );
				break;
			}
		}
	}
	
	if ( !cg.demoPlayback ) drawSplines( );

	// actually issue the rendering calls
	CG_DrawActive( stereoView );

	if ( cg_stats.integer ) {
		CG_Printf( "cg.clientFrame:%i\n", cg.clientFrame );
	}
	
	if( cg.demoPlayback && pug_demospec.integer!=-1 )
    {
        //cg.snap->ps.clientNum = snap.ps.clientNum;
        cg.snap->ps.fd = snap.ps.fd;
        cg.snap->ps.stats[STAT_DEAD_YAW] = snap.ps.stats[STAT_DEAD_YAW];
		cg.snap->ps.stats[STAT_HEALTH] = snap.ps.stats[STAT_HEALTH];
		cg.snap->ps.stats[STAT_ARMOR] = snap.ps.stats[STAT_ARMOR];
		cg.snap->ps.persistant[PERS_TEAM] = snap.ps.persistant[PERS_TEAM];
		cg.snap->ps.fallingToDeath = snap.ps.fallingToDeath;
		cg.snap->ps.weapon = snap.ps.weapon;
		cg.snap->ps.weaponstate = snap.ps.weaponstate;
		/*memcpy( cg.snap->ps.powerups, snap.ps.powerups, sizeof(int) * MAX_POWERUPS );*/
		cg.snap->ps.zoomMode = snap.ps.zoomMode;
		cg.predictedPlayerState = prps;
		//cg.snap->ps = snap.ps;
    }
}

extern int showCam;
void drawSplines( void )
{
	int 		myTime, i;
	qboolean 	demoCamming = qtrue;
	polyVert_t	verts[3];
	double		l_time;
	
	myTime = cam[0].time;
	if ( myTime == 0 ) return;
	
	while ( demoCamming )
	{
		demoCamming = qfalse;
		for(i = 0;i < curCam - 1;i++) {
			if(cam[i].time!=0 &&
			   cam[i].time <= myTime &&
			   cam[i+1].time > myTime &&
			   cam[i+1].time > cam[i].time &&
			   !cam[i].thirdPerson &&
			   !cam[i+1].thirdPerson)
			{
				demoCamming = qtrue;
				break;
			}
		}
		if ( demoCamming )
		{
			//timeDelta = (double)(myTime - cam[i].time) / (double)(cam[i+1].time - cam[i].time);
			l_time=((double)(myTime - cam[i].time))/1000;
			
			VectorCopy( verts[2].xyz, verts[0].xyz );
			
			verts[0].st[0] = 0;
			verts[0].st[1] = 0;
			
			verts[1].st[0] = 0;
			verts[1].st[1] = 1;
			
			verts[0].modulate[0] = verts[1].modulate[0] = 255;
			verts[0].modulate[1] = verts[1].modulate[1] = 255;
			verts[0].modulate[2] = verts[1].modulate[2] = 255;
			verts[0].modulate[3] = verts[1].modulate[3] = 255;
			
			verts[2].xyz[0] = cam[i].csi_coeff[0][0]*l_time*l_time*l_time+cam[i].csi_coeff[0][1]*l_time*l_time+cam[i].csi_coeff[0][2]*l_time+cam[i].csi_coeff[0][3];
			verts[2].xyz[1] = cam[i].csi_coeff[1][0]*l_time*l_time*l_time+cam[i].csi_coeff[1][1]*l_time*l_time+cam[i].csi_coeff[1][2]*l_time+cam[i].csi_coeff[1][3];
			verts[2].xyz[2] = cam[i].csi_coeff[2][0]*l_time*l_time*l_time+cam[i].csi_coeff[2][1]*l_time*l_time+cam[i].csi_coeff[2][2]*l_time+cam[i].csi_coeff[2][3];
			VectorAdd( verts[2].xyz, cam[i].origin, verts[2].xyz );
			VectorCopy( verts[2].xyz, verts[1].xyz );
			
			//verts[1].xyz[0] += 3.0f;
			
			verts[2].st[0] = 1;
			verts[2].st[1] = 1;
			
			verts[2].modulate[0] = 255;
			verts[2].modulate[1] = 255;
			verts[2].modulate[2] = 255;
			verts[2].modulate[3] = 255;
			
			/*curVeca[0] = cam[i].csi_coeff[3][0]*l_time*l_time*l_time+cam[i].csi_coeff[3][1]*l_time*l_time+cam[i].csi_coeff[3][2]*l_time+cam[i].csi_coeff[3][3];
			curVeca[1] = cam[i].csi_coeff[4][0]*l_time*l_time*l_time+cam[i].csi_coeff[4][1]*l_time*l_time+cam[i].csi_coeff[4][2]*l_time+cam[i].csi_coeff[4][3];
			curVeca[2] = cam[i].csi_coeff[5][0]*l_time*l_time*l_time+cam[i].csi_coeff[5][1]*l_time*l_time+cam[i].csi_coeff[5][2]*l_time+cam[i].csi_coeff[5][3];
			VectorAdd( curVeca, cam[i].angle, curVeca );*/
			
			if ( myTime != cam[0].time && trap_R_inPVS(cg.refdef.vieworg, verts[2].xyz)) {
				/*float fac, sine;
				vec3_t tmpvec;
				
				VectorSubtract( verts[2].xyz, verts[0].xyz, verts[1].xyz );
				fac = VectorLength( verts[1].xyz );
				verts[1].xyz[0] /= fac;
				verts[1].xyz[1] /= fac;
				verts[1].xyz[2] /= fac;
				sine = asin( verts[1].xyz[1] );
				if( sine < M_PI / 2 )
				{
					if( verts[1].xyz[1] > 0 && verts[1].xyz[0] < 0 ) sine = M_PI - sine;
				}
				else if( sine > M_PI && sine < M_PI * 3 / 2 )
				{
					if( verts[1].xyz[1] < 0 && verts[1].xyz[0] > 0 ) sine = ( 3 * M_PI ) - sine;
				}
				sine += ( 5.0f / 180.0f * M_PI ); //add 5 degrees
				verts[1].xyz[1] = sin( sine ); //convert back 2 coordinate
				verts[1].xyz[0] *= fac;
				verts[1].xyz[1] *= fac;
				verts[1].xyz[2] *= fac;
				VectorAdd( verts[0].xyz, verts[1].xyz, verts[1].xyz );
				VectorCopy( verts[1].xyz, tmpvec );
				
				trap_R_AddPolyToScene( 2, 3, verts );
				
				VectorSubtract( verts[2].xyz, verts[0].xyz, verts[1].xyz );
				fac = VectorLength( verts[1].xyz );
				verts[1].xyz[0] /= fac;
				verts[1].xyz[1] /= fac;
				verts[1].xyz[2] /= fac;
				sine = asin( verts[1].xyz[2] );
				if( sine < M_PI / 2 )
				{
					if( verts[1].xyz[2] > 0 && verts[1].xyz[0] < 0 ) sine = M_PI - sine;
				}
				else if( sine > M_PI && sine < M_PI * 3 / 2 )
				{
					if( verts[1].xyz[2] < 0 && verts[1].xyz[0] > 0 ) sine = ( 3 * M_PI ) - sine;
				}
				sine += ( 5.0f / 180.0f * M_PI ); //add 5 degrees
				verts[1].xyz[2] = sin( sine ); //convert back 2 coordinate
				verts[1].xyz[0] *= fac;
				verts[1].xyz[1] *= fac;
				verts[1].xyz[2] *= fac;
				VectorAdd( verts[0].xyz, verts[1].xyz, verts[1].xyz );
				
				trap_R_AddPolyToScene( 2, 3, verts );
				
				VectorCopy( tmpvec, verts[2].xyz );
				
				trap_R_AddPolyToScene( 2, 3, verts );*/
				//CG_TestLine( verts[0].xyz, verts[2].xyz, 2, 0, 1 );
				#include "fx_local.h"
				static vec3_t WHITE={1.0f,1.0f,1.0f};
				trap_FX_AddLine( verts[0].xyz, verts[2].xyz, 0.1f, 6.0f, 0.0f, 
							1.0f, 0.0f, 0.0f,
							WHITE, WHITE, 0.0f,
							150, trap_R_RegisterShader( "gfx/effects/redLine" ), 
							FX_SIZE_LINEAR | FX_ALPHA_LINEAR );
			}
			
			
		}
		
		myTime += (double)( cam[ i+1 ].time - cam[ i ].time ) / (double)20;
		if( myTime >= cam[ i+1 ].time && cam[ i+2 ].time < cam[ i+1 ].time ) {
			VectorCopy( verts[2].xyz, verts[0].xyz );
			VectorCopy( cam[ i+1 ].origin, verts[2].xyz );
			VectorCopy( verts[2].xyz, verts[1].xyz );
			verts[1].xyz[0] += 3.0f;
			if(trap_R_inPVS(cg.refdef.vieworg, verts[2].xyz)) {
				static vec3_t WHITE={1.0f,1.0f,1.0f};
				trap_FX_AddLine( verts[0].xyz, verts[2].xyz, 0.1f, 6.0f, 0.0f, 
							1.0f, 0.0f, 0.0f,
							WHITE, WHITE, 0.0f,
							150, trap_R_RegisterShader( "gfx/effects/redLine" ), 
							FX_SIZE_LINEAR | FX_ALPHA_LINEAR );
			}
		}
	}
	
	for ( i=0; cam[i].time; i++ )
	{
		//CG_DrawPlayerSphere(cent, cent->lerpOrigin, 1.0f, cgs.media.invulnerabilityShader );
		refEntity_t ent;
		vec3_t ang;
		float vLen, scale=0.5f;
		vec3_t viewDir;
		
		memset( &ent, 0, sizeof( ent ) );
		
		VectorCopy( cam[i].origin, ent.origin );
		//ent.origin[2] += 9.0;
		
		VectorSubtract(ent.origin, cg.refdef.vieworg, ent.axis[0]);
		vLen = VectorLength(ent.axis[0]);
		if (vLen <= 0.1f)
		{	// Entity is right on vieworg.  quit.
			continue;
		}
		
		VectorCopy(ent.axis[0], viewDir);
		VectorInverse(viewDir);
		VectorNormalize(viewDir);
		
		vectoangles(ent.axis[0], ang);
		ang[ROLL] += 180.0f;
		ang[PITCH] += 180.0f;
		AnglesToAxis(ang, ent.axis);
		
		VectorScale(ent.axis[0], scale, ent.axis[0]);
		VectorScale(ent.axis[1], scale, ent.axis[1]);
		VectorScale(ent.axis[2], scale, ent.axis[2]);
		
		ent.nonNormalizedAxes = qtrue;
		
		ent.hModel = cgs.media.halfShieldModel;
		ent.customShader = cgs.media.invulnerabilityShader;
		
		if( showCam == i )
		{
			ent.shaderRGBA[0] = 255;
			ent.shaderRGBA[1] = 255;
			ent.shaderRGBA[2] = 255;
			ent.shaderRGBA[3] = 100;
			ent.renderfx = RF_RGB_TINT;
		} else {
			ent.shaderRGBA[0] = 0;
			ent.shaderRGBA[1] = 255;
			ent.shaderRGBA[2] = 0;
			ent.shaderRGBA[3] = 100;
			ent.renderfx = RF_RGB_TINT;
		}
		
		if(trap_R_inPVS(cg.refdef.vieworg, ent.origin))trap_R_AddRefEntityToScene( &ent );
		
		/*ang[PITCH] -= 180.0f;
		AnglesToAxis(ang, ent.axis);
		
		VectorScale(ent.axis[0], scale*0.5f, ent.axis[0]);
		VectorScale(ent.axis[1], scale*0.5f, ent.axis[1]);
		VectorScale(ent.axis[2], scale*0.5f, ent.axis[2]);
		
		ent.renderfx = (RF_DISTORTION|RF_FORCE_ENT_ALPHA);
		ent.shaderRGBA[0] = 0;
		ent.shaderRGBA[1] = 255;
		ent.shaderRGBA[2] = 0;
		ent.shaderRGBA[3] = 100;
		ent.radius = 256;
		
		VectorMA(ent.origin, 40.0f, viewDir, ent.origin);
		
		ent.customShader = trap_R_RegisterShader("effects/refract_2");
		trap_R_AddRefEntityToScene( &ent );*/
	}
}
