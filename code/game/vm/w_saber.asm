data
export saberSpinSound
align 4
LABELV saberSpinSound
byte 4 0
export saberOffSound
align 4
LABELV saberOffSound
byte 4 0
export saberOnSound
align 4
LABELV saberOnSound
byte 4 0
export saberHumSound
align 4
LABELV saberHumSound
byte 4 0
export RandFloat
code
proc RandFloat 8 0
file "../w_saber.c"
line 23
;1:#include "g_local.h"
;2:#include "bg_local.h" //Only because we use PM_SetAnim here once.
;3:#include "w_saber.h"
;4:#include "ai_main.h"
;5:#include "..\ghoul2\g2.h"
;6:
;7:#define SABER_BOX_SIZE 16.0f
;8:
;9:extern bot_state_t *botstates[MAX_CLIENTS];
;10:extern qboolean InFront( vec3_t spot, vec3_t from, vec3_t fromAngles, float threshHold );
;11:
;12:int saberSpinSound = 0;
;13:int saberOffSound = 0;
;14:int saberOnSound = 0;
;15:int saberHumSound = 0;
;16:
;17://would be cleaner if these were renamed to BG_ and proto'd in a header.
;18:qboolean PM_SaberInTransition( int move );
;19:qboolean PM_SaberInDeflect( int move );
;20:qboolean PM_SaberInBrokenParry( int move );
;21:qboolean PM_SaberInBounce( int move );
;22:
;23:float RandFloat(float min, float max) {
line 24
;24:	return ((rand() * (max - min)) / 32768.0F) + min;
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
MULF4
CNSTF4 1191182336
DIVF4
ADDRLP4 4
INDIRF4
ADDF4
RETF4
LABELV $83
endproc RandFloat 8 0
export SaberUpdateSelf
proc SaberUpdateSelf 20 4
line 68
;25:}
;26:
;27://#define DEBUG_SABER_BOX
;28:
;29:#ifdef DEBUG_SABER_BOX
;30:void	G_DebugBoxLines(vec3_t mins, vec3_t maxs, int duration)
;31:{
;32:	vec3_t start;
;33:	vec3_t end;
;34:
;35:	float x = maxs[0] - mins[0];
;36:	float y = maxs[1] - mins[1];
;37:
;38:	// top of box
;39:	VectorCopy(maxs, start);
;40:	VectorCopy(maxs, end);
;41:	start[0] -= x;
;42:	G_TestLine(start, end, 0x00000ff, duration);
;43:	end[0] = start[0];
;44:	end[1] -= y;
;45:	G_TestLine(start, end, 0x00000ff, duration);
;46:	start[1] = end[1];
;47:	start[0] += x;
;48:	G_TestLine(start, end, 0x00000ff, duration);
;49:	G_TestLine(start, maxs, 0x00000ff, duration);
;50:	// bottom of box
;51:	VectorCopy(mins, start);
;52:	VectorCopy(mins, end);
;53:	start[0] += x;
;54:	G_TestLine(start, end, 0x00000ff, duration);
;55:	end[0] = start[0];
;56:	end[1] += y;
;57:	G_TestLine(start, end, 0x00000ff, duration);
;58:	start[1] = end[1];
;59:	start[0] -= x;
;60:	G_TestLine(start, end, 0x00000ff, duration);
;61:	G_TestLine(start, mins, 0x00000ff, duration);
;62:}
;63:#endif
;64:
;65:#define PROPER_THROWN_VALUE 999 //Ah, well.. 
;66:
;67:void SaberUpdateSelf(gentity_t *ent)
;68:{
line 69
;69:	if (ent->r.ownerNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $85
line 70
;70:	{
line 71
;71:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 72
;72:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 73
;73:		return;
ADDRGP4 $84
JUMPV
LABELV $85
line 76
;74:	}
;75:
;76:	if (!g_entities[ent->r.ownerNum].inuse ||
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $94
ADDRLP4 0
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $94
ADDRLP4 0
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $88
LABELV $94
line 79
;77:		!g_entities[ent->r.ownerNum].client ||
;78:		g_entities[ent->r.ownerNum].client->sess.sessionTeam == TEAM_SPECTATOR)
;79:	{
line 80
;80:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 81
;81:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 82
;82:		return;
ADDRGP4 $84
JUMPV
LABELV $88
line 85
;83:	}
;84:
;85:	if (g_entities[ent->r.ownerNum].client->ps.saberInFlight && g_entities[ent->r.ownerNum].health > 0)
ADDRLP4 4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $96
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $96
line 86
;86:	{ //let The Master take care of us now (we'll get treated like a missile until we return)
line 87
;87:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 88
;88:		ent->bolt_Head = PROPER_THROWN_VALUE;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 999
ASGNI4
line 89
;89:		return;
ADDRGP4 $84
JUMPV
LABELV $96
line 92
;90:	}
;91:
;92:	ent->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 94
;93:
;94:	if (g_entities[ent->r.ownerNum].client->ps.usingATST)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $101
line 95
;95:	{ //using atst
line 96
;96:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 97
;97:		ent->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 98
;98:	}
ADDRGP4 $102
JUMPV
LABELV $101
line 99
;99:	else if (g_entities[ent->r.ownerNum].client->ps.weapon != WP_SABER ||
ADDRLP4 12
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $114
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $114
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 1
LTI4 $114
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $114
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $104
LABELV $114
line 104
;100:		(g_entities[ent->r.ownerNum].client->ps.pm_flags & PMF_FOLLOW) ||
;101:		g_entities[ent->r.ownerNum].health < 1 ||
;102:		g_entities[ent->r.ownerNum].client->ps.saberHolstered ||
;103:		!g_entities[ent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK])
;104:	{ //owner is not using saber, spectating, dead, saber holstered, or has no attack level
line 105
;105:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 106
;106:		ent->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 107
;107:	}
ADDRGP4 $105
JUMPV
LABELV $104
line 109
;108:	else
;109:	{ //Standard contents (saber is active)
line 123
;110:#ifdef DEBUG_SABER_BOX
;111:		vec3_t dbgMins;
;112:		vec3_t dbgMaxs;
;113:
;114:		if (ent->r.ownerNum == 0)
;115:		{
;116:			VectorAdd( ent->r.currentOrigin, ent->r.mins, dbgMins );
;117:			VectorAdd( ent->r.currentOrigin, ent->r.maxs, dbgMaxs );
;118:
;119:			G_DebugBoxLines(dbgMins, dbgMaxs, 100);
;120:		}
;121:#endif
;122:
;123:		ent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 124
;124:		ent->clipmask = MASK_PLAYERSOLID | CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262417
ASGNI4
line 125
;125:	}
LABELV $105
LABELV $102
line 127
;126:
;127:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 129
;128:
;129:	ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 130
;130:}
LABELV $84
endproc SaberUpdateSelf 20 4
export SaberGotHit
proc SaberGotHit 12 0
line 133
;131:
;132:void SaberGotHit( gentity_t *self, gentity_t *other, trace_t *trace )
;133:{
line 134
;134:	gentity_t *own = &g_entities[self->r.ownerNum];
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 136
;135:
;136:	if (!own || !own->client)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $119
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $117
LABELV $119
line 137
;137:	{
line 138
;138:		return;
LABELV $117
line 142
;139:	}
;140:
;141:	//Do something here..? Was handling projectiles here, but instead they're now handled in their own functions.
;142:}
LABELV $116
endproc SaberGotHit 12 0
export WP_SaberInitBladeData
proc WP_SaberInitBladeData 32 4
line 145
;143:
;144:void WP_SaberInitBladeData( gentity_t *ent )
;145:{
line 150
;146:	gentity_t *saberent;
;147:
;148:	//We do not want the client to have any real knowledge of the entity whatsoever. It will only
;149:	//ever be used on the server.
;150:	saberent = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 151
;151:	ent->client->ps.saberEntityNum = saberent->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 152
;152:	saberent->classname = "lightsaber";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $121
ASGNP4
line 154
;153:			
;154:	saberent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 155
;155:	saberent->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 157
;156:
;157:	saberent->clipmask = MASK_PLAYERSOLID | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262417
ASGNI4
line 158
;158:	saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 160
;159:
;160:	VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 161
;161:	VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 163
;162:
;163:	saberent->mass = 10;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTF4 1092616192
ASGNF4
line 165
;164:
;165:	saberent->s.eFlags |= EF_NODRAW;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 166
;166:	saberent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 168
;167:
;168:	saberent->touch = SaberGotHit;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 170
;169:
;170:	saberent->think = SaberUpdateSelf;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 171
;171:	saberent->bolt_Head = 0;
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 172
;172:	saberent->nextthink = level.time + 50;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 174
;173:
;174:	saberSpinSound = G_SoundIndex("sound/weapons/saber/saberspin.wav");
ADDRGP4 $123
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberSpinSound
ADDRLP4 16
INDIRI4
ASGNI4
line 175
;175:	saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $124
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 20
INDIRI4
ASGNI4
line 176
;176:	saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $125
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 24
INDIRI4
ASGNI4
line 177
;177:	saberHumSound = G_SoundIndex("sound/weapons/saber/saberhum1.wav");
ADDRGP4 $126
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberHumSound
ADDRLP4 28
INDIRI4
ASGNI4
line 178
;178:}
LABELV $120
endproc WP_SaberInitBladeData 32 4
export G_G2ClientSpineAngles
proc G_G2ClientSpineAngles 152 36
line 182
;179:
;180://NOTE: If C` is modified this function should be modified as well (and vice versa)
;181:void G_G2ClientSpineAngles( gentity_t *ent, vec3_t viewAngles, const vec3_t angles, vec3_t thoracicAngles, vec3_t ulAngles, vec3_t llAngles )
;182:{
line 183
;183:	viewAngles[YAW] = AngleDelta( ent->client->ps.viewangles[YAW], angles[YAW] );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 185
;184:
;185:	if ( !BG_FlippingAnim( ent->client->ps.legsAnim ) 
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $128
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
EQI4 $128
line 189
;186:		&& !BG_SpinningSaberAnim( ent->client->ps.legsAnim ) 
;187:		&& !BG_SpinningSaberAnim( ent->client->ps.torsoAnim )
;188:		&& ent->client->ps.legsAnim != ent->client->ps.torsoAnim )//NOTE: presumes your legs & torso are on the same frame, though they *should* be because PM_SetAnimFinal tries to keep them in synch
;189:	{//FIXME: no need to do this if legs and torso on are same frame
line 196
;190:		//adjust for motion offset
;191:		mdxaBone_t	boltMatrix;
;192:		vec3_t		motionFwd, motionAngles;
;193:		vec3_t		motionRt, tempAng;
;194:		int			ang;
;195:
;196:		trap_G2API_GetBoltMatrix_NoRecNoRot( ent->client->ghoul2, 0, ent->bolt_Motion, &boltMatrix, vec3_origin, ent->client->ps.origin, level.time, /*cgs.gameModels*/0, vec3_origin);
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
ADDRLP4 124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 124
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRLP4 132
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix_NoRecNoRot
CALLI4
pop
line 198
;197:		//trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_Y, motionFwd );
;198:		motionFwd[0] = -boltMatrix.matrix[0][1];
ADDRLP4 88
ADDRLP4 40+4
INDIRF4
NEGF4
ASGNF4
line 199
;199:		motionFwd[1] = -boltMatrix.matrix[1][1];
ADDRLP4 88+4
ADDRLP4 40+16+4
INDIRF4
NEGF4
ASGNF4
line 200
;200:		motionFwd[2] = -boltMatrix.matrix[2][1];
ADDRLP4 88+8
ADDRLP4 40+32+4
INDIRF4
NEGF4
ASGNF4
line 202
;201:
;202:		vectoangles( motionFwd, motionAngles );
ADDRLP4 88
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 205
;203:
;204:		//trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_X, motionRt );
;205:		motionRt[0] = -boltMatrix.matrix[0][0];
ADDRLP4 100
ADDRLP4 40
INDIRF4
NEGF4
ASGNF4
line 206
;206:		motionRt[1] = -boltMatrix.matrix[1][0];
ADDRLP4 100+4
ADDRLP4 40+16
INDIRF4
NEGF4
ASGNF4
line 207
;207:		motionRt[2] = -boltMatrix.matrix[2][0];
ADDRLP4 100+8
ADDRLP4 40+32
INDIRF4
NEGF4
ASGNF4
line 208
;208:		vectoangles( motionRt, tempAng );
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 209
;209:		motionAngles[ROLL] = -tempAng[PITCH];
ADDRLP4 28+8
ADDRLP4 112
INDIRF4
NEGF4
ASGNF4
line 211
;210:
;211:		for ( ang = 0; ang < 3; ang++ )
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $143
line 212
;212:		{
line 213
;213:			viewAngles[ang] = AngleNormalize180( viewAngles[ang] - AngleNormalize180( motionAngles[ang] ) );
ADDRLP4 136
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRLP4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 136
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
INDIRF4
ADDRLP4 140
INDIRF4
SUBF4
ARGF4
ADDRLP4 148
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 144
INDIRP4
ADDRLP4 148
INDIRF4
ASGNF4
line 214
;214:		}
LABELV $144
line 211
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 3
LTI4 $143
line 215
;215:	}
LABELV $128
line 218
;216:	//distribute the angles differently up the spine
;217:	//NOTE: each of these distributions must add up to 1.0f
;218:	thoracicAngles[PITCH] = viewAngles[PITCH]*0.20f;
ADDRFP4 12
INDIRP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 219
;219:	llAngles[PITCH] = viewAngles[PITCH]*0.40f;
ADDRFP4 20
INDIRP4
CNSTF4 1053609165
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 220
;220:	ulAngles[PITCH] = viewAngles[PITCH]*0.40f;
ADDRFP4 16
INDIRP4
CNSTF4 1053609165
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 222
;221:
;222:	thoracicAngles[YAW] = viewAngles[YAW]*0.20f;
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 223
;223:	ulAngles[YAW] = viewAngles[YAW]*0.35f;
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 224
;224:	llAngles[YAW] = viewAngles[YAW]*0.45f;
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 226
;225:
;226:	thoracicAngles[ROLL] = viewAngles[ROLL]*0.20f;
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 227
;227:	ulAngles[ROLL] = viewAngles[ROLL]*0.35f;
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 228
;228:	llAngles[ROLL] = viewAngles[ROLL]*0.45f;
ADDRLP4 44
CNSTI4 8
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 229
;229:}
LABELV $127
endproc G_G2ClientSpineAngles 152 36
data
align 4
LABELV $148
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
lit
align 4
LABELV $149
byte 4 0
byte 4 0
byte 4 0
export G_G2PlayerAngles
code
proc G_G2PlayerAngles 232 44
line 231
;230:
;231:void G_G2PlayerAngles( gentity_t *ent, vec3_t legs[3], vec3_t legsAngles){
line 239
;232:	vec3_t		torsoAngles, headAngles;
;233:	float		dest;
;234:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;235:	vec3_t		velocity;
;236:	float		speed;
;237:	int			dir;
;238:	vec3_t		velPos, velAng;
;239:	int			adddir = 0;
ADDRLP4 104
CNSTI4 0
ASGNI4
line 241
;240:	float		dif;
;241:	float		degrees_negative = 0;
ADDRLP4 96
CNSTF4 0
ASGNF4
line 242
;242:	float		degrees_positive = 0;
ADDRLP4 100
CNSTF4 0
ASGNF4
line 243
;243:	qboolean	yawing = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 244
;244:	vec3_t		ulAngles, llAngles, viewAngles, angles, thoracicAngles = {0,0,0};
ADDRLP4 84
ADDRGP4 $149
INDIRB
ASGNB 12
line 246
;245:
;246:	VectorCopy( ent->client->ps.viewangles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 247
;247:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 152
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 152
INDIRF4
ASGNF4
line 248
;248:	VectorClear( legsAngles );
ADDRLP4 156
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 160
CNSTF4 0
ASGNF4
ADDRLP4 156
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 156
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 156
INDIRP4
ADDRLP4 160
INDIRF4
ASGNF4
line 249
;249:	VectorClear( torsoAngles );
ADDRLP4 164
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 164
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 164
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 164
INDIRF4
ASGNF4
line 254
;250:
;251:	// --------- yaw -------------
;252:
;253:	// allow yaw to drift a bit
;254:	if ((( ent->s.legsAnim & ~ANIM_TOGGLEBIT ) != BOTH_STAND1) || 
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
CNSTI4 -2049
ASGNI4
ADDRLP4 168
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
BANDI4
CNSTI4 571
NEI4 $156
ADDRLP4 168
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
BANDI4
ADDRLP4 168
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
EQI4 $154
LABELV $156
line 256
;255:			( ent->s.torsoAnim & ~ANIM_TOGGLEBIT ) != WeaponReadyAnim[ent->s.weapon]  ) 
;256:	{
line 257
;257:		yawing = qtrue;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 258
;258:	}
LABELV $154
line 261
;259:
;260:	// adjust legs for movement dir
;261:	dir = ent->s.angles2[YAW];
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 262
;262:	if ( dir < 0 || dir > 7 ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $159
ADDRLP4 72
INDIRI4
CNSTI4 7
LEI4 $157
LABELV $159
line 263
;263:		return;
ADDRGP4 $147
JUMPV
LABELV $157
line 266
;264:	}
;265:
;266:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $148
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 271
;267:
;268:	// --------- pitch -------------
;269:
;270:	// only show a fraction of the pitch angle in the torso
;271:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $162
line 272
;272:		dest = (-360 + headAngles[PITCH]) * 0.75;
ADDRLP4 148
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 273
;273:	} else {
ADDRGP4 $163
JUMPV
LABELV $162
line 274
;274:		dest = headAngles[PITCH] * 0.75;
ADDRLP4 148
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 275
;275:	}
LABELV $163
line 277
;276:
;277:	torsoAngles[PITCH] = ent->client->ps.viewangles[PITCH];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
line 283
;278:
;279:	// --------- roll -------------
;280:
;281:
;282:	// lean towards the direction of travel
;283:	VectorCopy( ent->s.pos.trDelta, velocity );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 284
;284:	speed = VectorNormalize( velocity );
ADDRLP4 24
ARGP4
ADDRLP4 180
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 76
ADDRLP4 180
INDIRF4
ASGNF4
line 286
;285:
;286:	if ( speed ) {
ADDRLP4 76
INDIRF4
CNSTF4 0
EQF4 $164
line 290
;287:		vec3_t	axis[3];
;288:		float	side;
;289:
;290:		speed *= 0.05;
ADDRLP4 76
CNSTF4 1028443341
ADDRLP4 76
INDIRF4
MULF4
ASGNF4
line 292
;291:
;292:		AnglesToAxis( legsAngles, axis );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 184
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 293
;293:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 220
ADDRLP4 76
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 184+12
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 184+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 184+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 294
;294:		legsAngles[ROLL] -= side;
ADDRLP4 224
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 220
INDIRF4
SUBF4
ASGNF4
line 296
;295:
;296:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 220
ADDRLP4 76
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 184+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 184+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 297
;297:		legsAngles[PITCH] += side;
ADDRLP4 228
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRF4
ADDRLP4 220
INDIRF4
ADDF4
ASGNF4
line 298
;298:	}
LABELV $164
line 301
;299:
;300:	//rww - crazy velocity-based leg angle calculation
;301:	legsAngles[YAW] = headAngles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 302
;302:	velPos[0] = ent->client->ps.origin[0] + velocity[0];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 303
;303:	velPos[1] = ent->client->ps.origin[1] + velocity[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
line 304
;304:	velPos[2] = ent->client->ps.origin[2] + velocity[2];
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 306
;305:
;306:	if (ent->client->ps.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $182
line 307
;307:	{ //off the ground, no direction-based leg angles
line 308
;308:		VectorCopy(ent->client->ps.origin, velPos);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 309
;309:	}
LABELV $182
line 311
;310:
;311:	VectorSubtract(ent->client->ps.origin, velPos, velAng);
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 48
ADDRLP4 184
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 184
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 36+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 36+8
INDIRF4
SUBF4
ASGNF4
line 313
;312:
;313:	if (!VectorCompare(velAng, vec3_origin))
ADDRLP4 48
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 188
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
NEI4 $188
line 314
;314:	{
line 315
;315:		vectoangles(velAng, velAng);
ADDRLP4 48
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 317
;316:
;317:		if (velAng[YAW] <= legsAngles[YAW])
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
GTF4 $190
line 318
;318:		{
line 319
;319:			degrees_negative = (legsAngles[YAW] - velAng[YAW]);
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 48+4
INDIRF4
SUBF4
ASGNF4
line 320
;320:			degrees_positive = (360 - legsAngles[YAW]) + velAng[YAW];
ADDRLP4 100
CNSTF4 1135869952
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ADDRLP4 48+4
INDIRF4
ADDF4
ASGNF4
line 321
;321:		}
ADDRGP4 $191
JUMPV
LABELV $190
line 323
;322:		else
;323:		{
line 324
;324:			degrees_negative = legsAngles[YAW] + (360 - velAng[YAW]);
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1135869952
ADDRLP4 48+4
INDIRF4
SUBF4
ADDF4
ASGNF4
line 325
;325:			degrees_positive = (velAng[YAW] - legsAngles[YAW]);
ADDRLP4 100
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 326
;326:		}
LABELV $191
line 328
;327:
;328:		if (degrees_negative < degrees_positive)
ADDRLP4 96
INDIRF4
ADDRLP4 100
INDIRF4
GEF4 $197
line 329
;329:		{
line 330
;330:			dif = degrees_negative;
ADDRLP4 80
ADDRLP4 96
INDIRF4
ASGNF4
line 331
;331:			adddir = 0;
ADDRLP4 104
CNSTI4 0
ASGNI4
line 332
;332:		}
ADDRGP4 $198
JUMPV
LABELV $197
line 334
;333:		else
;334:		{
line 335
;335:			dif = degrees_positive;
ADDRLP4 80
ADDRLP4 100
INDIRF4
ASGNF4
line 336
;336:			adddir = 1;
ADDRLP4 104
CNSTI4 1
ASGNI4
line 337
;337:		}
LABELV $198
line 339
;338:
;339:		if (dif > 90)
ADDRLP4 80
INDIRF4
CNSTF4 1119092736
LEF4 $199
line 340
;340:		{
line 341
;341:			dif = (180 - dif);
ADDRLP4 80
CNSTF4 1127481344
ADDRLP4 80
INDIRF4
SUBF4
ASGNF4
line 342
;342:		}
LABELV $199
line 344
;343:
;344:		if (dif > 60)
ADDRLP4 80
INDIRF4
CNSTF4 1114636288
LEF4 $201
line 345
;345:		{
line 346
;346:			dif = 60;
ADDRLP4 80
CNSTF4 1114636288
ASGNF4
line 347
;347:		}
LABELV $201
line 350
;348:
;349:		//Slight hack for when playing is running backward
;350:		if (dir == 3 || dir == 5)
ADDRLP4 72
INDIRI4
CNSTI4 3
EQI4 $205
ADDRLP4 72
INDIRI4
CNSTI4 5
NEI4 $203
LABELV $205
line 351
;351:		{
line 352
;352:			dif = -dif;
ADDRLP4 80
ADDRLP4 80
INDIRF4
NEGF4
ASGNF4
line 353
;353:		}
LABELV $203
line 355
;354:
;355:		if (adddir)
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $206
line 356
;356:		{
line 357
;357:			legsAngles[YAW] -= dif;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 80
INDIRF4
SUBF4
ASGNF4
line 358
;358:		}
ADDRGP4 $207
JUMPV
LABELV $206
line 360
;359:		else
;360:		{
line 361
;361:			legsAngles[YAW] += dif;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ASGNF4
line 362
;362:		}
LABELV $207
line 363
;363:	}
LABELV $188
line 365
;364:
;365:	legsAngles[YAW] = ent->client->ps.viewangles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 367
;366:
;367:	legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 368
;368:	torsoAngles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 371
;369:
;370:	// pull the angles back out of the hierarchial chain
;371:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 372
;372:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 373
;373:	AnglesToAxis( legsAngles, legs );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 376
;374:	// we assume that model 0 is the player model.
;375:
;376:	VectorCopy( ent->client->ps.viewangles, viewAngles );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 378
;377:
;378:	if (viewAngles[PITCH] > 290)
ADDRLP4 60
INDIRF4
CNSTF4 1133576192
LEF4 $209
line 379
;379:	{ //keep the same general range as lerpAngles on the client so we can use the same spine correction
line 380
;380:		viewAngles[PITCH] -= 360;
ADDRLP4 60
ADDRLP4 60
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 381
;381:	}
LABELV $209
line 383
;382:
;383:	viewAngles[YAW] = viewAngles[ROLL] = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
ADDRLP4 60+8
ADDRLP4 192
INDIRF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 192
INDIRF4
ASGNF4
line 384
;384:	viewAngles[PITCH] *= 0.5;
ADDRLP4 60
CNSTF4 1056964608
ADDRLP4 60
INDIRF4
MULF4
ASGNF4
line 386
;385:
;386:	VectorCopy(legsAngles, angles);
ADDRLP4 132
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 388
;387:
;388:	G_G2ClientSpineAngles(ent, viewAngles, angles, thoracicAngles, ulAngles, llAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 120
ARGP4
ADDRGP4 G_G2ClientSpineAngles
CALLV
pop
line 390
;389:
;390:	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "upper_lumbar", ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time); 
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 $213
ARGP4
ADDRLP4 108
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 391
;391:	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "lower_lumbar", llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time); 
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $215
ARGP4
ADDRLP4 120
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 392
;392:	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "thoracic", thoracicAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time); 
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 393
;393:}
LABELV $147
endproc G_G2PlayerAngles 232 44
export SaberAttacking
proc SaberAttacking 28 4
line 396
;394:
;395:qboolean SaberAttacking(gentity_t *self)
;396:{
line 397
;397:	if (PM_SaberInParry(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $220
line 398
;398:	{
line 399
;399:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $219
JUMPV
LABELV $220
line 401
;400:	}
;401:	if (PM_SaberInBrokenParry(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $222
line 402
;402:	{
line 403
;403:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $219
JUMPV
LABELV $222
line 405
;404:	}
;405:	if (PM_SaberInDeflect(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $224
line 406
;406:	{
line 407
;407:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $219
JUMPV
LABELV $224
line 409
;408:	}
;409:	if (PM_SaberInBounce(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $226
line 410
;410:	{
line 411
;411:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $219
JUMPV
LABELV $226
line 413
;412:	}
;413:	if (PM_SaberInKnockaway(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 PM_SaberInKnockaway
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $228
line 414
;414:	{
line 415
;415:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $219
JUMPV
LABELV $228
line 418
;416:	}
;417:
;418:	if (BG_SaberInAttack(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $230
line 419
;419:	{
line 420
;420:		if (self->client->ps.weaponstate == WEAPON_FIRING && self->client->ps.saberBlocked == BLOCKED_NONE)
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
NEI4 $232
ADDRLP4 24
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $232
line 421
;421:		{ //if we're firing and not blocking, then we're attacking.
line 422
;422:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $219
JUMPV
LABELV $232
line 424
;423:		}
;424:	}
LABELV $230
line 426
;425:
;426:	return qfalse;
CNSTI4 0
RETI4
LABELV $219
endproc SaberAttacking 28 4
export WP_SabersCheckLock2
proc WP_SabersCheckLock2 1692 28
line 449
;427:}
;428:
;429:typedef enum
;430:{
;431:	LOCK_FIRST = 0,
;432:	LOCK_TOP = LOCK_FIRST,
;433:	LOCK_DIAG_TR,
;434:	LOCK_DIAG_TL,
;435:	LOCK_DIAG_BR,
;436:	LOCK_DIAG_BL,
;437:	LOCK_R,
;438:	LOCK_L,
;439:	LOCK_RANDOM
;440:} sabersLockMode_t;
;441:
;442:#define LOCK_IDEAL_DIST_TOP 32.0f
;443:#define LOCK_IDEAL_DIST_CIRCLE 48.0f
;444:
;445:#define SABER_HITDAMAGE 35
;446:void WP_SaberBlockNonRandom( gentity_t *self, vec3_t hitloc, qboolean missileBlock );
;447:
;448:qboolean WP_SabersCheckLock2( gentity_t *attacker, gentity_t *defender, sabersLockMode_t lockMode )
;449:{
line 450
;450:	int		attAnim, defAnim = 0;
ADDRLP4 1512
CNSTI4 0
ASGNI4
line 451
;451:	float	attStart = 0.5f;
ADDRLP4 1536
CNSTF4 1056964608
ASGNF4
line 452
;452:	float	idealDist = 48.0f;
ADDRLP4 1528
CNSTF4 1111490560
ASGNF4
line 456
;453:	vec3_t	attAngles, defAngles, defDir;
;454:	vec3_t	newOrg;
;455:	vec3_t	attDir;
;456:	float	diff = 0;
ADDRLP4 380
CNSTF4 0
ASGNF4
line 461
;457:	trace_t trace;
;458:	pmove_t		pmv;
;459:
;460:	//MATCH ANIMS
;461:	if ( lockMode == LOCK_RANDOM )
ADDRFP4 8
INDIRI4
CNSTI4 7
NEI4 $236
line 462
;462:	{
line 463
;463:		lockMode = (sabersLockMode_t)Q_irand( (int)LOCK_FIRST, (int)(LOCK_RANDOM)-1 );
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 1540
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 8
ADDRLP4 1540
INDIRI4
ASGNI4
line 464
;464:	}
LABELV $236
line 465
;465:	switch ( lockMode )
ADDRLP4 1540
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 1540
INDIRI4
CNSTI4 0
LTI4 $238
ADDRLP4 1540
INDIRI4
CNSTI4 6
GTI4 $238
ADDRLP4 1540
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $248
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $248
address $241
address $242
address $243
address $244
address $245
address $246
address $247
code
line 466
;466:	{
LABELV $241
line 468
;467:	case LOCK_TOP:
;468:		attAnim = BOTH_BF2LOCK;
ADDRLP4 1532
CNSTI4 550
ASGNI4
line 469
;469:		defAnim = BOTH_BF1LOCK;
ADDRLP4 1512
CNSTI4 553
ASGNI4
line 470
;470:		attStart = 0.5f;
ADDRLP4 1536
CNSTF4 1056964608
ASGNF4
line 471
;471:		idealDist = LOCK_IDEAL_DIST_TOP;
ADDRLP4 1528
CNSTF4 1107296256
ASGNF4
line 472
;472:		break;
ADDRGP4 $239
JUMPV
LABELV $242
line 474
;473:	case LOCK_DIAG_TR:
;474:		attAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1532
CNSTI4 561
ASGNI4
line 475
;475:		defAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1512
CNSTI4 560
ASGNI4
line 476
;476:		attStart = 0.5f;
ADDRLP4 1536
CNSTF4 1056964608
ASGNF4
line 477
;477:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1528
CNSTF4 1111490560
ASGNF4
line 478
;478:		break;
ADDRGP4 $239
JUMPV
LABELV $243
line 480
;479:	case LOCK_DIAG_TL:
;480:		attAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1532
CNSTI4 560
ASGNI4
line 481
;481:		defAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1512
CNSTI4 561
ASGNI4
line 482
;482:		attStart = 0.5f;
ADDRLP4 1536
CNSTF4 1056964608
ASGNF4
line 483
;483:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1528
CNSTF4 1111490560
ASGNF4
line 484
;484:		break;
ADDRGP4 $239
JUMPV
LABELV $244
line 486
;485:	case LOCK_DIAG_BR:
;486:		attAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1532
CNSTI4 560
ASGNI4
line 487
;487:		defAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1512
CNSTI4 561
ASGNI4
line 488
;488:		attStart = 0.85f;
ADDRLP4 1536
CNSTF4 1062836634
ASGNF4
line 489
;489:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1528
CNSTF4 1111490560
ASGNF4
line 490
;490:		break;
ADDRGP4 $239
JUMPV
LABELV $245
line 492
;491:	case LOCK_DIAG_BL:
;492:		attAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1532
CNSTI4 561
ASGNI4
line 493
;493:		defAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1512
CNSTI4 560
ASGNI4
line 494
;494:		attStart = 0.85f;
ADDRLP4 1536
CNSTF4 1062836634
ASGNF4
line 495
;495:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1528
CNSTF4 1111490560
ASGNF4
line 496
;496:		break;
ADDRGP4 $239
JUMPV
LABELV $246
line 498
;497:	case LOCK_R:
;498:		attAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1532
CNSTI4 561
ASGNI4
line 499
;499:		defAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1512
CNSTI4 560
ASGNI4
line 500
;500:		attStart = 0.75f;
ADDRLP4 1536
CNSTF4 1061158912
ASGNF4
line 501
;501:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1528
CNSTF4 1111490560
ASGNF4
line 502
;502:		break;
ADDRGP4 $239
JUMPV
LABELV $247
line 504
;503:	case LOCK_L:
;504:		attAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1532
CNSTI4 560
ASGNI4
line 505
;505:		defAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1512
CNSTI4 561
ASGNI4
line 506
;506:		attStart = 0.75f;
ADDRLP4 1536
CNSTF4 1061158912
ASGNF4
line 507
;507:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1528
CNSTF4 1111490560
ASGNF4
line 508
;508:		break;
ADDRGP4 $239
JUMPV
LABELV $238
line 510
;509:	default:
;510:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $235
JUMPV
line 511
;511:		break;
LABELV $239
line 514
;512:	}
;513:
;514:	memset (&pmv, 0, sizeof(pmv));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 380
ARGI4
ADDRGP4 memset
CALLP4
pop
line 515
;515:	pmv.ps = &attacker->client->ps;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 516
;516:	pmv.animations = bgGlobalAnimations;
ADDRLP4 0+224
ADDRGP4 bgGlobalAnimations
ASGNP4
line 517
;517:	pmv.cmd = attacker->client->pers.cmd;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRB
ASGNB 28
line 518
;518:	pmv.trace = trap_Trace;
ADDRLP4 0+240
ADDRGP4 trap_Trace
ASGNP4
line 519
;519:	pmv.pointcontents = trap_PointContents;
ADDRLP4 0+244
ADDRGP4 trap_PointContents
ASGNP4
line 520
;520:	pmv.gametype = g_gametype.integer;
ADDRLP4 0+220
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
line 523
;521:
;522:	//This is a rare exception, you should never really call PM_ utility functions from game or cgame (despite the fact that it's technically possible)
;523:	pm = &pmv;
ADDRGP4 pm
ADDRLP4 0
ASGNP4
line 524
;524:	PM_SetAnim(SETANIM_BOTH, attAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1548
CNSTI4 3
ASGNI4
ADDRLP4 1548
INDIRI4
ARGI4
ADDRLP4 1532
INDIRI4
ARGI4
ADDRLP4 1548
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 525
;525:	attacker->client->ps.saberLockFrame = bgGlobalAnimations[attAnim].firstFrame+(bgGlobalAnimations[attAnim].numFrames*0.5);
ADDRLP4 1552
CNSTI4 28
ADDRLP4 1532
INDIRI4
MULI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 1552
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 1552
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 527
;526:
;527:	pmv.ps = &defender->client->ps;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 528
;528:	pmv.animations = bgGlobalAnimations;
ADDRLP4 0+224
ADDRGP4 bgGlobalAnimations
ASGNP4
line 529
;529:	pmv.cmd = defender->client->pers.cmd;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRB
ASGNB 28
line 531
;530:
;531:	pm = &pmv;
ADDRGP4 pm
ADDRLP4 0
ASGNP4
line 532
;532:	PM_SetAnim(SETANIM_BOTH, defAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1556
CNSTI4 3
ASGNI4
ADDRLP4 1556
INDIRI4
ARGI4
ADDRLP4 1512
INDIRI4
ARGI4
ADDRLP4 1556
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 533
;533:	defender->client->ps.saberLockFrame = bgGlobalAnimations[defAnim].firstFrame+(bgGlobalAnimations[defAnim].numFrames*0.5);
ADDRLP4 1560
CNSTI4 28
ADDRLP4 1512
INDIRI4
MULI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 1560
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 1560
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 535
;534:
;535:	attacker->client->ps.saberLockHits = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 536
;536:	defender->client->ps.saberLockHits = 0;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 538
;537:
;538:	attacker->client->ps.saberLockAdvance = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 539
;539:	defender->client->ps.saberLockAdvance = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 541
;540:
;541:	VectorClear( attacker->client->ps.velocity );
ADDRLP4 1564
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1568
CNSTF4 0
ASGNF4
ADDRLP4 1564
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1568
INDIRF4
ASGNF4
ADDRLP4 1564
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1568
INDIRF4
ASGNF4
ADDRLP4 1564
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1568
INDIRF4
ASGNF4
line 542
;542:	VectorClear( defender->client->ps.velocity );
ADDRLP4 1572
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1576
CNSTF4 0
ASGNF4
ADDRLP4 1572
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1576
INDIRF4
ASGNF4
ADDRLP4 1572
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1576
INDIRF4
ASGNF4
ADDRLP4 1572
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1576
INDIRF4
ASGNF4
line 543
;543:	attacker->client->ps.saberLockTime = defender->client->ps.saberLockTime = level.time + 10000;
ADDRLP4 1580
CNSTI4 408
ASGNI4
ADDRLP4 1584
CNSTI4 524
ASGNI4
ADDRLP4 1588
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 1580
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1584
INDIRI4
ADDP4
ADDRLP4 1588
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1580
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1584
INDIRI4
ADDP4
ADDRLP4 1588
INDIRI4
ASGNI4
line 544
;544:	attacker->client->ps.saberLockEnemy = defender->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 528
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 545
;545:	defender->client->ps.saberLockEnemy = attacker->s.number;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 528
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 546
;546:	attacker->client->ps.weaponTime = defender->client->ps.weaponTime = Q_irand( 1000, 3000 );//delay 1 to 3 seconds before pushing
CNSTI4 1000
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 1592
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1596
CNSTI4 408
ASGNI4
ADDRLP4 1600
CNSTI4 44
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 1596
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1600
INDIRI4
ADDP4
ADDRLP4 1592
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1596
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1600
INDIRI4
ADDP4
ADDRLP4 1592
INDIRI4
ASGNI4
line 548
;547:
;548:	VectorSubtract( defender->r.currentOrigin, attacker->r.currentOrigin, defDir );
ADDRLP4 1604
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1608
CNSTI4 368
ASGNI4
ADDRLP4 1612
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 384
ADDRLP4 1604
INDIRP4
ADDRLP4 1608
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1612
INDIRP4
ADDRLP4 1608
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1616
CNSTI4 372
ASGNI4
ADDRLP4 384+4
ADDRLP4 1604
INDIRP4
ADDRLP4 1616
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1612
INDIRP4
ADDRLP4 1616
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1620
CNSTI4 376
ASGNI4
ADDRLP4 384+8
ADDRFP4 4
INDIRP4
ADDRLP4 1620
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 1620
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 549
;549:	VectorCopy( attacker->client->ps.viewangles, attAngles );
ADDRLP4 1500
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 550
;550:	attAngles[YAW] = vectoyaw( defDir );
ADDRLP4 384
ARGP4
ADDRLP4 1624
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRLP4 1500+4
ADDRLP4 1624
INDIRF4
ASGNF4
line 551
;551:	SetClientViewAngle( attacker, attAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1500
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 552
;552:	defAngles[PITCH] = attAngles[PITCH]*-1;
ADDRLP4 1516
CNSTF4 3212836864
ADDRLP4 1500
INDIRF4
MULF4
ASGNF4
line 553
;553:	defAngles[YAW] = AngleNormalize180( attAngles[YAW] + 180);
ADDRLP4 1500+4
INDIRF4
CNSTF4 1127481344
ADDF4
ARGF4
ADDRLP4 1628
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 1516+4
ADDRLP4 1628
INDIRF4
ASGNF4
line 554
;554:	defAngles[ROLL] = 0;
ADDRLP4 1516+8
CNSTF4 0
ASGNF4
line 555
;555:	SetClientViewAngle( defender, defAngles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1516
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 558
;556:	
;557:	//MATCH POSITIONS
;558:	diff = VectorNormalize( defDir ) - idealDist;//diff will be the total error in dist
ADDRLP4 384
ARGP4
ADDRLP4 1632
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 380
ADDRLP4 1632
INDIRF4
ADDRLP4 1528
INDIRF4
SUBF4
ASGNF4
line 560
;559:	//try to move attacker half the diff towards the defender
;560:	VectorMA( attacker->r.currentOrigin, diff*0.5f, defDir, newOrg );
ADDRLP4 1636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1640
CNSTF4 1056964608
ADDRLP4 380
INDIRF4
MULF4
ASGNF4
ADDRLP4 396
ADDRLP4 1636
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 384
INDIRF4
ADDRLP4 1640
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 396+4
ADDRLP4 1636
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 384+4
INDIRF4
ADDRLP4 1640
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 396+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 384+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 380
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 562
;561:
;562:	trap_Trace( &trace, attacker->r.currentOrigin, attacker->r.mins, attacker->r.maxs, newOrg, attacker->s.number, attacker->clipmask );
ADDRLP4 420
ARGP4
ADDRLP4 1644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1644
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1644
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1644
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 396
ARGP4
ADDRLP4 1644
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1644
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 563
;563:	if ( !trace.startsolid && !trace.allsolid )
ADDRLP4 1648
CNSTI4 0
ASGNI4
ADDRLP4 420+4
INDIRI4
ADDRLP4 1648
INDIRI4
NEI4 $270
ADDRLP4 420
INDIRI4
ADDRLP4 1648
INDIRI4
NEI4 $270
line 564
;564:	{
line 565
;565:		G_SetOrigin( attacker, trace.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 420+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 566
;566:		trap_LinkEntity( attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 567
;567:	}
LABELV $270
line 569
;568:	//now get the defender's dist and do it for him too
;569:	VectorSubtract( attacker->r.currentOrigin, defender->r.currentOrigin, attDir );
ADDRLP4 1652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1656
CNSTI4 368
ASGNI4
ADDRLP4 1660
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 408
ADDRLP4 1652
INDIRP4
ADDRLP4 1656
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1660
INDIRP4
ADDRLP4 1656
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1664
CNSTI4 372
ASGNI4
ADDRLP4 408+4
ADDRLP4 1652
INDIRP4
ADDRLP4 1664
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1660
INDIRP4
ADDRLP4 1664
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1668
CNSTI4 376
ASGNI4
ADDRLP4 408+8
ADDRFP4 0
INDIRP4
ADDRLP4 1668
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 1668
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 570
;570:	diff = VectorNormalize( attDir ) - idealDist;//diff will be the total error in dist
ADDRLP4 408
ARGP4
ADDRLP4 1672
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 380
ADDRLP4 1672
INDIRF4
ADDRLP4 1528
INDIRF4
SUBF4
ASGNF4
line 572
;571:	//try to move defender all of the remaining diff towards the attacker
;572:	VectorMA( defender->r.currentOrigin, diff, attDir, newOrg );
ADDRLP4 1676
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 396
ADDRLP4 1676
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 408
INDIRF4
ADDRLP4 380
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 396+4
ADDRLP4 1676
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 408+4
INDIRF4
ADDRLP4 380
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 396+8
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 408+8
INDIRF4
ADDRLP4 380
INDIRF4
MULF4
ADDF4
ASGNF4
line 573
;573:	trap_Trace( &trace, defender->r.currentOrigin, defender->r.mins, defender->r.maxs, newOrg, defender->s.number, defender->clipmask );
ADDRLP4 420
ARGP4
ADDRLP4 1684
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1684
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1684
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1684
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 396
ARGP4
ADDRLP4 1684
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1684
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 574
;574:	if ( !trace.startsolid && !trace.allsolid )
ADDRLP4 1688
CNSTI4 0
ASGNI4
ADDRLP4 420+4
INDIRI4
ADDRLP4 1688
INDIRI4
NEI4 $280
ADDRLP4 420
INDIRI4
ADDRLP4 1688
INDIRI4
NEI4 $280
line 575
;575:	{
line 576
;576:		G_SetOrigin( defender, trace.endpos );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 420+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 577
;577:		trap_LinkEntity( defender );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 578
;578:	}
LABELV $280
line 581
;579:
;580:	//DONE!
;581:	return qtrue;
CNSTI4 1
RETI4
LABELV $235
endproc WP_SabersCheckLock2 1692 28
export WP_SabersCheckLock
proc WP_SabersCheckLock 240 16
line 585
;582:}
;583:
;584:qboolean WP_SabersCheckLock( gentity_t *ent1, gentity_t *ent2 )
;585:{
line 587
;586:	float dist;
;587:	qboolean	ent1BlockingPlayer = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 588
;588:	qboolean	ent2BlockingPlayer = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 590
;589:
;590:	if (!g_saberLocking.integer)
ADDRGP4 g_saberLocking+12
INDIRI4
CNSTI4 0
NEI4 $285
line 591
;591:	{
line 592
;592:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $285
line 595
;593:	}
;594:
;595:	if (!ent1->client || !ent2->client)
ADDRLP4 12
CNSTI4 408
ASGNI4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $290
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $288
LABELV $290
line 596
;596:	{
line 597
;597:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $288
line 600
;598:	}
;599:
;600:	if (!ent1->client->ps.duelInProgress ||
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 1304
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $295
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $295
ADDRLP4 48
CNSTI4 1296
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
INDIRI4
NEI4 $295
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
INDIRI4
EQI4 $291
LABELV $295
line 604
;601:		!ent2->client->ps.duelInProgress ||
;602:		ent1->client->ps.duelIndex != ent2->s.number ||
;603:		ent2->client->ps.duelIndex != ent1->s.number)
;604:	{ //only allow saber locking if two players are dueling with each other directly
line 605
;605:		if (g_gametype.integer != GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $296
line 606
;606:		{
line 607
;607:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $296
line 609
;608:		}
;609:	}
LABELV $291
line 611
;610:
;611:	if ( fabs( ent1->r.currentOrigin[2]-ent2->r.currentOrigin[2] ) > 16 )
ADDRLP4 52
CNSTI4 376
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 56
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 1098907648
LEF4 $299
line 612
;612:	{
line 613
;613:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $299
line 615
;614:	}
;615:	if ( ent1->client->ps.groundEntityNum == ENTITYNUM_NONE ||
ADDRLP4 60
CNSTI4 408
ASGNI4
ADDRLP4 64
CNSTI4 84
ASGNI4
ADDRLP4 68
CNSTI4 1023
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $303
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $301
LABELV $303
line 617
;616:		ent2->client->ps.groundEntityNum == ENTITYNUM_NONE )
;617:	{
line 618
;618:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $301
line 620
;619:	}
;620:	dist = DistanceSquared(ent1->r.currentOrigin,ent2->r.currentOrigin);
ADDRLP4 72
CNSTI4 368
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 DistanceSquared
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 76
INDIRF4
ASGNF4
line 621
;621:	if ( dist < 64 || dist > 6400 )
ADDRLP4 8
INDIRF4
CNSTF4 1115684864
LTF4 $306
ADDRLP4 8
INDIRF4
CNSTF4 1170735104
LEF4 $304
LABELV $306
line 622
;622:	{//between 8 and 80 from each other
line 623
;623:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $304
line 626
;624:	}
;625:
;626:	if (BG_InSpecialJump(ent1->client->ps.legsAnim))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $307
line 627
;627:	{
line 628
;628:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $307
line 630
;629:	}
;630:	if (BG_InSpecialJump(ent2->client->ps.legsAnim))
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $309
line 631
;631:	{
line 632
;632:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $309
line 635
;633:	}
;634:
;635:	if (BG_InRoll(&ent1->client->ps, ent1->client->ps.legsAnim))
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $311
line 636
;636:	{
line 637
;637:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $311
line 639
;638:	}
;639:	if (BG_InRoll(&ent2->client->ps, ent2->client->ps.legsAnim))
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $313
line 640
;640:	{
line 641
;641:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $313
line 644
;642:	}
;643:
;644:	if (ent1->client->ps.forceHandExtend != HANDEXTEND_NONE ||
ADDRLP4 108
CNSTI4 408
ASGNI4
ADDRLP4 112
CNSTI4 1248
ASGNI4
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
NEI4 $317
ADDRFP4 4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
EQI4 $315
LABELV $317
line 646
;645:		ent2->client->ps.forceHandExtend != HANDEXTEND_NONE)
;646:	{
line 647
;647:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $315
line 650
;648:	}
;649:
;650:	if ((ent1->client->ps.pm_flags & PMF_DUCKED) ||
ADDRLP4 120
CNSTI4 408
ASGNI4
ADDRLP4 124
CNSTI4 12
ASGNI4
ADDRLP4 128
CNSTI4 1
ASGNI4
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRI4
ADDRLP4 128
INDIRI4
BANDI4
ADDRLP4 132
INDIRI4
NEI4 $320
ADDRFP4 4
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRI4
ADDRLP4 128
INDIRI4
BANDI4
ADDRLP4 132
INDIRI4
EQI4 $318
LABELV $320
line 652
;651:		(ent2->client->ps.pm_flags & PMF_DUCKED))
;652:	{
line 653
;653:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $318
line 656
;654:	}
;655:
;656:	if (!InFront( ent1->client->ps.origin, ent2->client->ps.origin, ent2->client->ps.viewangles, 0.4f ))
ADDRLP4 136
CNSTI4 408
ASGNI4
ADDRLP4 140
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
ARGP4
ADDRLP4 144
ADDRFP4 4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1053609165
ARGF4
ADDRLP4 148
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $321
line 657
;657:	{
line 658
;658:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $321
line 660
;659:	}
;660:	if (!InFront( ent2->client->ps.origin, ent1->client->ps.origin, ent1->client->ps.viewangles, 0.4f ))
ADDRLP4 152
CNSTI4 408
ASGNI4
ADDRLP4 156
CNSTI4 20
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
ADDRFP4 0
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1053609165
ARGF4
ADDRLP4 164
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $323
line 661
;661:	{
line 662
;662:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $323
line 666
;663:	}
;664:
;665:	//T to B lock
;666:	if ( ent1->client->ps.torsoAnim == BOTH_A1_T__B_ ||
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 138
EQI4 $330
ADDRLP4 168
INDIRI4
CNSTI4 215
EQI4 $330
ADDRLP4 168
INDIRI4
CNSTI4 292
EQI4 $330
ADDRLP4 168
INDIRI4
CNSTI4 369
EQI4 $330
ADDRLP4 168
INDIRI4
CNSTI4 446
NEI4 $325
LABELV $330
line 671
;667:		ent1->client->ps.torsoAnim == BOTH_A2_T__B_ ||
;668:		ent1->client->ps.torsoAnim == BOTH_A3_T__B_ ||
;669:		ent1->client->ps.torsoAnim == BOTH_A4_T__B_ ||
;670:		ent1->client->ps.torsoAnim == BOTH_A5_T__B_ )
;671:	{//ent1 is attacking top-down
line 672
;672:		return WP_SabersCheckLock2( ent1, ent2, LOCK_TOP );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 172
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $325
line 675
;673:	}
;674:
;675:	if ( ent2->client->ps.torsoAnim == BOTH_A1_T__B_ ||
ADDRLP4 172
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 138
EQI4 $336
ADDRLP4 172
INDIRI4
CNSTI4 215
EQI4 $336
ADDRLP4 172
INDIRI4
CNSTI4 292
EQI4 $336
ADDRLP4 172
INDIRI4
CNSTI4 369
EQI4 $336
ADDRLP4 172
INDIRI4
CNSTI4 446
NEI4 $331
LABELV $336
line 680
;676:		ent2->client->ps.torsoAnim == BOTH_A2_T__B_ ||
;677:		ent2->client->ps.torsoAnim == BOTH_A3_T__B_ ||
;678:		ent2->client->ps.torsoAnim == BOTH_A4_T__B_ ||
;679:		ent2->client->ps.torsoAnim == BOTH_A5_T__B_ )
;680:	{//ent2 is attacking top-down
line 681
;681:		return WP_SabersCheckLock2( ent2, ent1, LOCK_TOP );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 176
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $331
line 684
;682:	}
;683:
;684:	if ( ent1->s.number == 0 &&
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRLP4 176
INDIRP4
INDIRI4
ADDRLP4 180
INDIRI4
NEI4 $337
ADDRLP4 184
ADDRLP4 176
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 2
NEI4 $337
ADDRLP4 184
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 180
INDIRI4
GTI4 $337
line 686
;685:		ent1->client->ps.saberBlocking == BLK_WIDE && ent1->client->ps.weaponTime <= 0 )
;686:	{
line 687
;687:		ent1BlockingPlayer = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 688
;688:	}
LABELV $337
line 689
;689:	if ( ent2->s.number == 0 &&
ADDRLP4 188
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRLP4 188
INDIRP4
INDIRI4
ADDRLP4 192
INDIRI4
NEI4 $339
ADDRLP4 196
ADDRLP4 188
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 2
NEI4 $339
ADDRLP4 196
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 192
INDIRI4
GTI4 $339
line 691
;690:		ent2->client->ps.saberBlocking == BLK_WIDE && ent2->client->ps.weaponTime <= 0 )
;691:	{
line 692
;692:		ent2BlockingPlayer = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 693
;693:	}
LABELV $339
line 696
;694:
;695:	//TR to BL lock
;696:	if ( ent1->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 144
EQI4 $346
ADDRLP4 200
INDIRI4
CNSTI4 221
EQI4 $346
ADDRLP4 200
INDIRI4
CNSTI4 298
EQI4 $346
ADDRLP4 200
INDIRI4
CNSTI4 375
EQI4 $346
ADDRLP4 200
INDIRI4
CNSTI4 452
NEI4 $341
LABELV $346
line 701
;697:		ent1->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;698:		ent1->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;699:		ent1->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;700:		ent1->client->ps.torsoAnim == BOTH_A5_TR_BL )
;701:	{//ent1 is attacking diagonally
line 702
;702:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $347
line 703
;703:		{//player will block this anyway
line 704
;704:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TR );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 204
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $347
line 706
;705:		}
;706:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 204
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 144
EQI4 $355
ADDRLP4 204
INDIRI4
CNSTI4 221
EQI4 $355
ADDRLP4 204
INDIRI4
CNSTI4 298
EQI4 $355
ADDRLP4 204
INDIRI4
CNSTI4 375
EQI4 $355
ADDRLP4 204
INDIRI4
CNSTI4 452
EQI4 $355
ADDRLP4 204
INDIRI4
CNSTI4 525
NEI4 $349
LABELV $355
line 712
;707:			ent2->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;708:			ent2->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;709:			ent2->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;710:			ent2->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;711:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TL )
;712:		{//ent2 is attacking in the opposite diagonal
line 713
;713:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TR );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 208
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $349
line 715
;714:		}
;715:		if ( ent2->client->ps.torsoAnim == BOTH_A1_BR_TL ||
ADDRLP4 208
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 142
EQI4 $362
ADDRLP4 208
INDIRI4
CNSTI4 219
EQI4 $362
ADDRLP4 208
INDIRI4
CNSTI4 296
EQI4 $362
ADDRLP4 208
INDIRI4
CNSTI4 373
EQI4 $362
ADDRLP4 208
INDIRI4
CNSTI4 450
EQI4 $362
ADDRLP4 208
INDIRI4
CNSTI4 526
NEI4 $356
LABELV $362
line 721
;716:			ent2->client->ps.torsoAnim == BOTH_A2_BR_TL ||
;717:			ent2->client->ps.torsoAnim == BOTH_A3_BR_TL ||
;718:			ent2->client->ps.torsoAnim == BOTH_A4_BR_TL ||
;719:			ent2->client->ps.torsoAnim == BOTH_A5_BR_TL ||
;720:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BL )
;721:		{//ent2 is attacking in the opposite diagonal
line 722
;722:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_BL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 212
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $356
line 724
;723:		}
;724:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $341
line 727
;725:	}
;726:
;727:	if ( ent2->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 204
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 144
EQI4 $368
ADDRLP4 204
INDIRI4
CNSTI4 221
EQI4 $368
ADDRLP4 204
INDIRI4
CNSTI4 298
EQI4 $368
ADDRLP4 204
INDIRI4
CNSTI4 375
EQI4 $368
ADDRLP4 204
INDIRI4
CNSTI4 452
NEI4 $363
LABELV $368
line 732
;728:		ent2->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;729:		ent2->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;730:		ent2->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;731:		ent2->client->ps.torsoAnim == BOTH_A5_TR_BL )
;732:	{//ent2 is attacking diagonally
line 733
;733:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $369
line 734
;734:		{//player will block this anyway
line 735
;735:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TR );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 208
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $369
line 737
;736:		}
;737:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 144
EQI4 $377
ADDRLP4 208
INDIRI4
CNSTI4 221
EQI4 $377
ADDRLP4 208
INDIRI4
CNSTI4 298
EQI4 $377
ADDRLP4 208
INDIRI4
CNSTI4 375
EQI4 $377
ADDRLP4 208
INDIRI4
CNSTI4 452
EQI4 $377
ADDRLP4 208
INDIRI4
CNSTI4 525
NEI4 $371
LABELV $377
line 743
;738:			ent1->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;739:			ent1->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;740:			ent1->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;741:			ent1->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;742:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TL )
;743:		{//ent1 is attacking in the opposite diagonal
line 744
;744:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TR );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 212
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $371
line 746
;745:		}
;746:		if ( ent1->client->ps.torsoAnim == BOTH_A1_BR_TL ||
ADDRLP4 212
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 142
EQI4 $384
ADDRLP4 212
INDIRI4
CNSTI4 219
EQI4 $384
ADDRLP4 212
INDIRI4
CNSTI4 296
EQI4 $384
ADDRLP4 212
INDIRI4
CNSTI4 373
EQI4 $384
ADDRLP4 212
INDIRI4
CNSTI4 450
EQI4 $384
ADDRLP4 212
INDIRI4
CNSTI4 526
NEI4 $378
LABELV $384
line 752
;747:			ent1->client->ps.torsoAnim == BOTH_A2_BR_TL ||
;748:			ent1->client->ps.torsoAnim == BOTH_A3_BR_TL ||
;749:			ent1->client->ps.torsoAnim == BOTH_A4_BR_TL ||
;750:			ent1->client->ps.torsoAnim == BOTH_A5_BR_TL ||
;751:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BL )
;752:		{//ent1 is attacking in the opposite diagonal
line 753
;753:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_BL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 216
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $378
line 755
;754:		}
;755:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $363
line 759
;756:	}
;757:
;758:	//TL to BR lock
;759:	if ( ent1->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 141
EQI4 $390
ADDRLP4 208
INDIRI4
CNSTI4 218
EQI4 $390
ADDRLP4 208
INDIRI4
CNSTI4 295
EQI4 $390
ADDRLP4 208
INDIRI4
CNSTI4 372
EQI4 $390
ADDRLP4 208
INDIRI4
CNSTI4 449
NEI4 $385
LABELV $390
line 764
;760:		ent1->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;761:		ent1->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;762:		ent1->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;763:		ent1->client->ps.torsoAnim == BOTH_A5_TL_BR )
;764:	{//ent1 is attacking diagonally
line 765
;765:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $391
line 766
;766:		{//player will block this anyway
line 767
;767:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 212
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $391
line 769
;768:		}
;769:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 212
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 141
EQI4 $399
ADDRLP4 212
INDIRI4
CNSTI4 218
EQI4 $399
ADDRLP4 212
INDIRI4
CNSTI4 295
EQI4 $399
ADDRLP4 212
INDIRI4
CNSTI4 372
EQI4 $399
ADDRLP4 212
INDIRI4
CNSTI4 449
EQI4 $399
ADDRLP4 212
INDIRI4
CNSTI4 524
NEI4 $393
LABELV $399
line 775
;770:			ent2->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;771:			ent2->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;772:			ent2->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;773:			ent2->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;774:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TR )
;775:		{//ent2 is attacking in the opposite diagonal
line 776
;776:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 216
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $393
line 778
;777:		}
;778:		if ( ent2->client->ps.torsoAnim == BOTH_A1_BL_TR ||
ADDRLP4 216
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 143
EQI4 $406
ADDRLP4 216
INDIRI4
CNSTI4 220
EQI4 $406
ADDRLP4 216
INDIRI4
CNSTI4 297
EQI4 $406
ADDRLP4 216
INDIRI4
CNSTI4 374
EQI4 $406
ADDRLP4 216
INDIRI4
CNSTI4 451
EQI4 $406
ADDRLP4 216
INDIRI4
CNSTI4 527
NEI4 $400
LABELV $406
line 784
;779:			ent2->client->ps.torsoAnim == BOTH_A2_BL_TR ||
;780:			ent2->client->ps.torsoAnim == BOTH_A3_BL_TR ||
;781:			ent2->client->ps.torsoAnim == BOTH_A4_BL_TR ||
;782:			ent2->client->ps.torsoAnim == BOTH_A5_BL_TR ||
;783:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BR )
;784:		{//ent2 is attacking in the opposite diagonal
line 785
;785:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_BR );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 220
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $400
line 787
;786:		}
;787:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $385
line 790
;788:	}
;789:
;790:	if ( ent2->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 212
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 141
EQI4 $412
ADDRLP4 212
INDIRI4
CNSTI4 218
EQI4 $412
ADDRLP4 212
INDIRI4
CNSTI4 295
EQI4 $412
ADDRLP4 212
INDIRI4
CNSTI4 372
EQI4 $412
ADDRLP4 212
INDIRI4
CNSTI4 449
NEI4 $407
LABELV $412
line 795
;791:		ent2->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;792:		ent2->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;793:		ent2->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;794:		ent2->client->ps.torsoAnim == BOTH_A5_TL_BR )
;795:	{//ent2 is attacking diagonally
line 796
;796:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $413
line 797
;797:		{//player will block this anyway
line 798
;798:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 216
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $413
line 800
;799:		}
;800:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 216
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 141
EQI4 $421
ADDRLP4 216
INDIRI4
CNSTI4 218
EQI4 $421
ADDRLP4 216
INDIRI4
CNSTI4 295
EQI4 $421
ADDRLP4 216
INDIRI4
CNSTI4 372
EQI4 $421
ADDRLP4 216
INDIRI4
CNSTI4 449
EQI4 $421
ADDRLP4 216
INDIRI4
CNSTI4 524
NEI4 $415
LABELV $421
line 806
;801:			ent1->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;802:			ent1->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;803:			ent1->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;804:			ent1->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;805:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TR )
;806:		{//ent1 is attacking in the opposite diagonal
line 807
;807:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 220
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $415
line 809
;808:		}
;809:		if ( ent1->client->ps.torsoAnim == BOTH_A1_BL_TR ||
ADDRLP4 220
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 143
EQI4 $428
ADDRLP4 220
INDIRI4
CNSTI4 220
EQI4 $428
ADDRLP4 220
INDIRI4
CNSTI4 297
EQI4 $428
ADDRLP4 220
INDIRI4
CNSTI4 374
EQI4 $428
ADDRLP4 220
INDIRI4
CNSTI4 451
EQI4 $428
ADDRLP4 220
INDIRI4
CNSTI4 527
NEI4 $422
LABELV $428
line 815
;810:			ent1->client->ps.torsoAnim == BOTH_A2_BL_TR ||
;811:			ent1->client->ps.torsoAnim == BOTH_A3_BL_TR ||
;812:			ent1->client->ps.torsoAnim == BOTH_A4_BL_TR ||
;813:			ent1->client->ps.torsoAnim == BOTH_A5_BL_TR ||
;814:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BR )
;815:		{//ent1 is attacking in the opposite diagonal
line 816
;816:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_BR );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 224
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $422
line 818
;817:		}
;818:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $407
line 821
;819:	}
;820:	//L to R lock
;821:	if ( ent1->client->ps.torsoAnim == BOTH_A1__L__R ||
ADDRLP4 216
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 139
EQI4 $434
ADDRLP4 216
INDIRI4
CNSTI4 216
EQI4 $434
ADDRLP4 216
INDIRI4
CNSTI4 293
EQI4 $434
ADDRLP4 216
INDIRI4
CNSTI4 370
EQI4 $434
ADDRLP4 216
INDIRI4
CNSTI4 447
NEI4 $429
LABELV $434
line 826
;822:		ent1->client->ps.torsoAnim == BOTH_A2__L__R ||
;823:		ent1->client->ps.torsoAnim == BOTH_A3__L__R ||
;824:		ent1->client->ps.torsoAnim == BOTH_A4__L__R ||
;825:		ent1->client->ps.torsoAnim == BOTH_A5__L__R )
;826:	{//ent1 is attacking l to r
line 827
;827:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $435
line 828
;828:		{//player will block this anyway
line 829
;829:			return WP_SabersCheckLock2( ent1, ent2, LOCK_L );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 220
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $435
line 831
;830:		}
;831:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 220
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 141
EQI4 $444
ADDRLP4 220
INDIRI4
CNSTI4 218
EQI4 $444
ADDRLP4 220
INDIRI4
CNSTI4 295
EQI4 $444
ADDRLP4 220
INDIRI4
CNSTI4 372
EQI4 $444
ADDRLP4 220
INDIRI4
CNSTI4 449
EQI4 $444
ADDRLP4 220
INDIRI4
CNSTI4 524
EQI4 $444
ADDRLP4 220
INDIRI4
CNSTI4 526
NEI4 $437
LABELV $444
line 838
;832:			ent2->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;833:			ent2->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;834:			ent2->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;835:			ent2->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;836:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TR ||
;837:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BL )
;838:		{//ent2 is attacking or blocking on the r
line 839
;839:			return WP_SabersCheckLock2( ent1, ent2, LOCK_L );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 224
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $437
line 841
;840:		}
;841:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $429
line 843
;842:	}
;843:	if ( ent2->client->ps.torsoAnim == BOTH_A1__L__R ||
ADDRLP4 220
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 139
EQI4 $450
ADDRLP4 220
INDIRI4
CNSTI4 216
EQI4 $450
ADDRLP4 220
INDIRI4
CNSTI4 293
EQI4 $450
ADDRLP4 220
INDIRI4
CNSTI4 370
EQI4 $450
ADDRLP4 220
INDIRI4
CNSTI4 447
NEI4 $445
LABELV $450
line 848
;844:		ent2->client->ps.torsoAnim == BOTH_A2__L__R ||
;845:		ent2->client->ps.torsoAnim == BOTH_A3__L__R ||
;846:		ent2->client->ps.torsoAnim == BOTH_A4__L__R ||
;847:		ent2->client->ps.torsoAnim == BOTH_A5__L__R )
;848:	{//ent2 is attacking l to r
line 849
;849:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $451
line 850
;850:		{//player will block this anyway
line 851
;851:			return WP_SabersCheckLock2( ent2, ent1, LOCK_L );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 224
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $451
line 853
;852:		}
;853:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 141
EQI4 $460
ADDRLP4 224
INDIRI4
CNSTI4 218
EQI4 $460
ADDRLP4 224
INDIRI4
CNSTI4 295
EQI4 $460
ADDRLP4 224
INDIRI4
CNSTI4 372
EQI4 $460
ADDRLP4 224
INDIRI4
CNSTI4 449
EQI4 $460
ADDRLP4 224
INDIRI4
CNSTI4 524
EQI4 $460
ADDRLP4 224
INDIRI4
CNSTI4 526
NEI4 $453
LABELV $460
line 860
;854:			ent1->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;855:			ent1->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;856:			ent1->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;857:			ent1->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;858:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TR ||
;859:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BL )
;860:		{//ent1 is attacking or blocking on the r
line 861
;861:			return WP_SabersCheckLock2( ent2, ent1, LOCK_L );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 228
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $453
line 863
;862:		}
;863:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $445
line 866
;864:	}
;865:	//R to L lock
;866:	if ( ent1->client->ps.torsoAnim == BOTH_A1__R__L ||
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 140
EQI4 $466
ADDRLP4 224
INDIRI4
CNSTI4 217
EQI4 $466
ADDRLP4 224
INDIRI4
CNSTI4 294
EQI4 $466
ADDRLP4 224
INDIRI4
CNSTI4 371
EQI4 $466
ADDRLP4 224
INDIRI4
CNSTI4 448
NEI4 $461
LABELV $466
line 871
;867:		ent1->client->ps.torsoAnim == BOTH_A2__R__L ||
;868:		ent1->client->ps.torsoAnim == BOTH_A3__R__L ||
;869:		ent1->client->ps.torsoAnim == BOTH_A4__R__L ||
;870:		ent1->client->ps.torsoAnim == BOTH_A5__R__L )
;871:	{//ent1 is attacking r to l
line 872
;872:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $467
line 873
;873:		{//player will block this anyway
line 874
;874:			return WP_SabersCheckLock2( ent1, ent2, LOCK_R );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 228
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $467
line 876
;875:		}
;876:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 228
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 144
EQI4 $476
ADDRLP4 228
INDIRI4
CNSTI4 221
EQI4 $476
ADDRLP4 228
INDIRI4
CNSTI4 298
EQI4 $476
ADDRLP4 228
INDIRI4
CNSTI4 375
EQI4 $476
ADDRLP4 228
INDIRI4
CNSTI4 452
EQI4 $476
ADDRLP4 228
INDIRI4
CNSTI4 525
EQI4 $476
ADDRLP4 228
INDIRI4
CNSTI4 527
NEI4 $469
LABELV $476
line 883
;877:			ent2->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;878:			ent2->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;879:			ent2->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;880:			ent2->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;881:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TL ||
;882:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BR )
;883:		{//ent2 is attacking or blocking on the l
line 884
;884:			return WP_SabersCheckLock2( ent1, ent2, LOCK_R );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 232
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $469
line 886
;885:		}
;886:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $461
line 888
;887:	}
;888:	if ( ent2->client->ps.torsoAnim == BOTH_A1__R__L ||
ADDRLP4 228
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 140
EQI4 $482
ADDRLP4 228
INDIRI4
CNSTI4 217
EQI4 $482
ADDRLP4 228
INDIRI4
CNSTI4 294
EQI4 $482
ADDRLP4 228
INDIRI4
CNSTI4 371
EQI4 $482
ADDRLP4 228
INDIRI4
CNSTI4 448
NEI4 $477
LABELV $482
line 893
;889:		ent2->client->ps.torsoAnim == BOTH_A2__R__L ||
;890:		ent2->client->ps.torsoAnim == BOTH_A3__R__L ||
;891:		ent2->client->ps.torsoAnim == BOTH_A4__R__L ||
;892:		ent2->client->ps.torsoAnim == BOTH_A5__R__L )
;893:	{//ent2 is attacking r to l
line 894
;894:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $483
line 895
;895:		{//player will block this anyway
line 896
;896:			return WP_SabersCheckLock2( ent2, ent1, LOCK_R );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 232
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $483
line 898
;897:		}
;898:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 144
EQI4 $492
ADDRLP4 232
INDIRI4
CNSTI4 221
EQI4 $492
ADDRLP4 232
INDIRI4
CNSTI4 298
EQI4 $492
ADDRLP4 232
INDIRI4
CNSTI4 375
EQI4 $492
ADDRLP4 232
INDIRI4
CNSTI4 452
EQI4 $492
ADDRLP4 232
INDIRI4
CNSTI4 525
EQI4 $492
ADDRLP4 232
INDIRI4
CNSTI4 527
NEI4 $485
LABELV $492
line 905
;899:			ent1->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;900:			ent1->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;901:			ent1->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;902:			ent1->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;903:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TL ||
;904:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BR )
;905:		{//ent1 is attacking or blocking on the l
line 906
;906:			return WP_SabersCheckLock2( ent2, ent1, LOCK_R );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 236
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $485
line 908
;907:		}
;908:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $477
line 910
;909:	}
;910:	if ( !Q_irand( 0, 10 ) )
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 232
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
NEI4 $493
line 911
;911:	{
line 912
;912:		return WP_SabersCheckLock2( ent1, ent2, LOCK_RANDOM );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 236
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
RETI4
ADDRGP4 $284
JUMPV
LABELV $493
line 914
;913:	}
;914:	return qfalse;
CNSTI4 0
RETI4
LABELV $284
endproc WP_SabersCheckLock 240 16
export G_GetParryForBlock
proc G_GetParryForBlock 4 0
line 918
;915:}
;916:
;917:int G_GetParryForBlock(int block)
;918:{
line 919
;919:	switch (block)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $497
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $497
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $508-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $508
address $498
address $500
address $502
address $504
address $506
address $499
address $501
address $503
address $505
address $507
code
line 920
;920:	{
LABELV $498
line 922
;921:		case BLOCKED_UPPER_RIGHT:
;922:			return LS_PARRY_UR;
CNSTI4 109
RETI4
ADDRGP4 $495
JUMPV
line 923
;923:			break;
LABELV $499
line 925
;924:		case BLOCKED_UPPER_RIGHT_PROJ:
;925:			return LS_REFLECT_UR;
CNSTI4 114
RETI4
ADDRGP4 $495
JUMPV
line 926
;926:			break;
LABELV $500
line 928
;927:		case BLOCKED_UPPER_LEFT:
;928:			return LS_PARRY_UL;
CNSTI4 110
RETI4
ADDRGP4 $495
JUMPV
line 929
;929:			break;
LABELV $501
line 931
;930:		case BLOCKED_UPPER_LEFT_PROJ:
;931:			return LS_REFLECT_UL;
CNSTI4 115
RETI4
ADDRGP4 $495
JUMPV
line 932
;932:			break;
LABELV $502
line 934
;933:		case BLOCKED_LOWER_RIGHT:
;934:			return LS_PARRY_LR;
CNSTI4 111
RETI4
ADDRGP4 $495
JUMPV
line 935
;935:			break;
LABELV $503
line 937
;936:		case BLOCKED_LOWER_RIGHT_PROJ:
;937:			return LS_REFLECT_LR;
CNSTI4 116
RETI4
ADDRGP4 $495
JUMPV
line 938
;938:			break;
LABELV $504
line 940
;939:		case BLOCKED_LOWER_LEFT:
;940:			return LS_PARRY_LL;
CNSTI4 112
RETI4
ADDRGP4 $495
JUMPV
line 941
;941:			break;
LABELV $505
line 943
;942:		case BLOCKED_LOWER_LEFT_PROJ:
;943:			return LS_REFLECT_LL;
CNSTI4 117
RETI4
ADDRGP4 $495
JUMPV
line 944
;944:			break;
LABELV $506
line 946
;945:		case BLOCKED_TOP:
;946:			return LS_PARRY_UP;
CNSTI4 108
RETI4
ADDRGP4 $495
JUMPV
line 947
;947:			break;
LABELV $507
line 949
;948:		case BLOCKED_TOP_PROJ:
;949:			return LS_REFLECT_UP;
CNSTI4 113
RETI4
ADDRGP4 $495
JUMPV
line 950
;950:			break;
line 952
;951:		default:
;952:			break;
LABELV $497
line 955
;953:	}
;954:
;955:	return LS_NONE;
CNSTI4 0
RETI4
LABELV $495
endproc G_GetParryForBlock 4 0
export WP_GetSaberDeflectionAngle
proc WP_GetSaberDeflectionAngle 132 16
line 962
;956:}
;957:
;958:int PM_SaberBounceForAttack( int move );
;959:int PM_SaberDeflectionForQuad( int quad );
;960:extern stringID_table_t animTable[MAX_ANIMATIONS+1];
;961:qboolean WP_GetSaberDeflectionAngle( gentity_t *attacker, gentity_t *defender, float saberHitFraction )
;962:{
line 963
;963:	qboolean animBasedDeflection = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 965
;964:
;965:	if ( !attacker || !attacker->client || !attacker->client->ghoul2 )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $514
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $514
ADDRLP4 12
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $511
LABELV $514
line 966
;966:	{
line 967
;967:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $511
line 969
;968:	}
;969:	if ( !defender || !defender->client || !defender->client->ghoul2 )
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $518
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $518
ADDRLP4 24
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
NEU4 $515
LABELV $518
line 970
;970:	{
line 971
;971:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $515
line 974
;972:	}
;973:
;974:	if ((level.time - attacker->client->lastSaberStorageTime) > 500)
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1780
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $519
line 975
;975:	{ //last update was too long ago, something is happening to this client to prevent his saber from updating
line 976
;976:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $519
line 978
;977:	}
;978:	if ((level.time - defender->client->lastSaberStorageTime) > 500)
ADDRGP4 level+32
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1780
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $522
line 979
;979:	{ //ditto
line 980
;980:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $522
line 983
;981:	}
;982:
;983:	if ( animBasedDeflection )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $525
line 984
;984:	{
line 986
;985:		//Hmm, let's try just basing it off the anim
;986:		int attQuadStart = saberMoveData[attacker->client->ps.saberMove].startQuad;
ADDRLP4 36
CNSTI4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
ASGNI4
line 987
;987:		int attQuadEnd = saberMoveData[attacker->client->ps.saberMove].endQuad;
ADDRLP4 40
CNSTI4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
ASGNI4
line 988
;988:		int defQuad = saberMoveData[defender->client->ps.saberMove].endQuad;
ADDRLP4 32
CNSTI4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
ASGNI4
line 989
;989:		int quadDiff = fabs(defQuad-attQuadStart);
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 44
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
line 991
;990:
;991:		if ( defender->client->ps.saberMove == LS_READY )
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
NEI4 $530
line 992
;992:		{
line 1000
;993:			//FIXME: we should probably do SOMETHING here...
;994:			//I have this return qfalse here in the hopes that
;995:			//the defender will pick a parry and the attacker
;996:			//will hit the defender's saber again.
;997:			//But maybe this func call should come *after*
;998:			//it's decided whether or not the defender is
;999:			//going to parry.
;1000:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $530
line 1004
;1001:		}
;1002:
;1003:		//reverse the left/right of the defQuad because of the mirrored nature of facing each other in combat
;1004:		switch ( defQuad )
ADDRLP4 48
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LTI4 $532
ADDRLP4 48
INDIRI4
CNSTI4 6
GTI4 $532
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $540
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $540
address $534
address $535
address $536
address $532
address $537
address $538
address $539
code
line 1005
;1005:		{
LABELV $534
line 1007
;1006:		case Q_BR:
;1007:			defQuad = Q_BL;
ADDRLP4 32
CNSTI4 6
ASGNI4
line 1008
;1008:			break;
ADDRGP4 $533
JUMPV
LABELV $535
line 1010
;1009:		case Q_R:
;1010:			defQuad = Q_L;
ADDRLP4 32
CNSTI4 5
ASGNI4
line 1011
;1011:			break;
ADDRGP4 $533
JUMPV
LABELV $536
line 1013
;1012:		case Q_TR:
;1013:			defQuad = Q_TL;
ADDRLP4 32
CNSTI4 4
ASGNI4
line 1014
;1014:			break;
ADDRGP4 $533
JUMPV
LABELV $537
line 1016
;1015:		case Q_TL:
;1016:			defQuad = Q_TR;
ADDRLP4 32
CNSTI4 2
ASGNI4
line 1017
;1017:			break;
ADDRGP4 $533
JUMPV
LABELV $538
line 1019
;1018:		case Q_L:
;1019:			defQuad = Q_R;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 1020
;1020:			break;
ADDRGP4 $533
JUMPV
LABELV $539
line 1022
;1021:		case Q_BL:
;1022:			defQuad = Q_BR;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1023
;1023:			break;
LABELV $532
LABELV $533
line 1026
;1024:		}
;1025:
;1026:		if ( quadDiff > 4 )
ADDRLP4 28
INDIRI4
CNSTI4 4
LEI4 $541
line 1027
;1027:		{//wrap around so diff is never greater than 180 (4 * 45)
line 1028
;1028:			quadDiff = 4 - (quadDiff - 4);
ADDRLP4 52
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRLP4 52
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 52
INDIRI4
SUBI4
SUBI4
ASGNI4
line 1029
;1029:		}
LABELV $541
line 1031
;1030:		//have the quads, find a good anim to use
;1031:		if ( (!quadDiff || (quadDiff == 1 && Q_irand(0,1))) //defender pretty much stopped the attack at a 90 degree angle
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $545
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $543
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $543
LABELV $545
ADDRLP4 68
CNSTI4 408
ASGNI4
ADDRLP4 72
CNSTI4 1228
ASGNI4
ADDRLP4 76
ADDRFP4 4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $546
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
SUBI4
ARGI4
ADDRLP4 84
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
LTI4 $543
LABELV $546
line 1033
;1032:			&& (defender->client->ps.fd.saberAnimLevel == attacker->client->ps.fd.saberAnimLevel || Q_irand( 0, defender->client->ps.fd.saberAnimLevel-attacker->client->ps.fd.saberAnimLevel ) >= 0) )//and the defender's style is stronger
;1033:		{
line 1035
;1034:			//bounce straight back
;1035:			int attMove = attacker->client->ps.saberMove;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1036
;1036:			attacker->client->ps.saberMove = PM_SaberBounceForAttack( attacker->client->ps.saberMove );
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 PM_SaberBounceForAttack
CALLI4
ASGNI4
ADDRLP4 92
INDIRP4
ADDRLP4 96
INDIRI4
ASGNI4
line 1037
;1037:			if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $547
line 1038
;1038:			{
line 1039
;1039:				Com_Printf( "attack %s vs. parry %s bounced to %s\n", 
ADDRGP4 $550
ARGP4
ADDRLP4 100
CNSTI4 40
ASGNI4
ADDRLP4 104
CNSTI4 3
ASGNI4
ADDRLP4 108
ADDRGP4 animTable
ASGNP4
ADDRLP4 100
INDIRI4
ADDRLP4 88
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
LSHI4
ADDRLP4 108
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 112
CNSTI4 408
ASGNI4
ADDRLP4 116
CNSTI4 512
ASGNI4
ADDRLP4 100
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
LSHI4
ADDRLP4 108
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
LSHI4
ADDRLP4 108
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1043
;1040:					animTable[saberMoveData[attMove].animToUse].name, 
;1041:					animTable[saberMoveData[defender->client->ps.saberMove].animToUse].name,
;1042:					animTable[saberMoveData[attacker->client->ps.saberMove].animToUse].name );
;1043:			}
LABELV $547
line 1044
;1044:			attacker->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1045
;1045:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $543
line 1048
;1046:		}
;1047:		else
;1048:		{//attack hit at an angle, figure out what angle it should bounce off att
line 1050
;1049:			int newQuad;
;1050:			quadDiff = defQuad - attQuadEnd;
ADDRLP4 28
ADDRLP4 32
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ASGNI4
line 1052
;1051:			//add half the diff of between the defense and attack end to the attack end
;1052:			if ( quadDiff > 4 )
ADDRLP4 28
INDIRI4
CNSTI4 4
LEI4 $554
line 1053
;1053:			{
line 1054
;1054:				quadDiff = 4 - (quadDiff - 4);
ADDRLP4 92
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRLP4 92
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 92
INDIRI4
SUBI4
SUBI4
ASGNI4
line 1055
;1055:			}
ADDRGP4 $555
JUMPV
LABELV $554
line 1056
;1056:			else if ( quadDiff < -4 )
ADDRLP4 28
INDIRI4
CNSTI4 -4
GEI4 $556
line 1057
;1057:			{
line 1058
;1058:				quadDiff = -4 + (quadDiff + 4);
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 4
ADDI4
CNSTI4 -4
ADDI4
ASGNI4
line 1059
;1059:			}
LABELV $556
LABELV $555
line 1060
;1060:			newQuad = attQuadEnd + ceil( ((float)quadDiff)/2.0f );
ADDRLP4 28
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
ARGF4
ADDRLP4 92
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 88
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 1061
;1061:			if ( newQuad < Q_BR )
ADDRLP4 88
INDIRI4
CNSTI4 0
GEI4 $558
line 1062
;1062:			{//less than zero wraps around
line 1063
;1063:				newQuad = Q_B + newQuad;
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 7
ADDI4
ASGNI4
line 1064
;1064:			}
LABELV $558
line 1065
;1065:			if ( newQuad == attQuadStart )
ADDRLP4 88
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $560
line 1066
;1066:			{//never come off at the same angle that we would have if the attack was not interrupted
line 1067
;1067:				if ( Q_irand(0, 1) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 96
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $562
line 1068
;1068:				{
line 1069
;1069:					newQuad--;
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1070
;1070:				}
ADDRGP4 $563
JUMPV
LABELV $562
line 1072
;1071:				else
;1072:				{
line 1073
;1073:					newQuad++;
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1074
;1074:				}
LABELV $563
line 1075
;1075:				if ( newQuad < Q_BR )
ADDRLP4 88
INDIRI4
CNSTI4 0
GEI4 $564
line 1076
;1076:				{
line 1077
;1077:					newQuad = Q_B;
ADDRLP4 88
CNSTI4 7
ASGNI4
line 1078
;1078:				}
ADDRGP4 $565
JUMPV
LABELV $564
line 1079
;1079:				else if ( newQuad > Q_B )
ADDRLP4 88
INDIRI4
CNSTI4 7
LEI4 $566
line 1080
;1080:				{
line 1081
;1081:					newQuad = Q_BR;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 1082
;1082:				}
LABELV $566
LABELV $565
line 1083
;1083:			}
LABELV $560
line 1084
;1084:			if ( newQuad == defQuad )
ADDRLP4 88
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $568
line 1085
;1085:			{//bounce straight back
line 1086
;1086:				int attMove = attacker->client->ps.saberMove;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1087
;1087:				attacker->client->ps.saberMove = PM_SaberBounceForAttack( attacker->client->ps.saberMove );
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 PM_SaberBounceForAttack
CALLI4
ASGNI4
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1088
;1088:				if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $570
line 1089
;1089:				{
line 1090
;1090:					Com_Printf( "attack %s vs. parry %s bounced to %s\n", 
ADDRGP4 $550
ARGP4
ADDRLP4 108
CNSTI4 40
ASGNI4
ADDRLP4 112
CNSTI4 3
ASGNI4
ADDRLP4 116
ADDRGP4 animTable
ASGNP4
ADDRLP4 108
INDIRI4
ADDRLP4 96
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
LSHI4
ADDRLP4 116
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 120
CNSTI4 408
ASGNI4
ADDRLP4 124
CNSTI4 512
ASGNI4
ADDRLP4 108
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
LSHI4
ADDRLP4 116
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 108
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
LSHI4
ADDRLP4 116
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1094
;1091:						animTable[saberMoveData[attMove].animToUse].name, 
;1092:						animTable[saberMoveData[defender->client->ps.saberMove].animToUse].name,
;1093:						animTable[saberMoveData[attacker->client->ps.saberMove].animToUse].name );
;1094:				}
LABELV $570
line 1095
;1095:				attacker->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1096
;1096:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $568
line 1100
;1097:			}
;1098:			//else, pick a deflection
;1099:			else
;1100:			{
line 1101
;1101:				int attMove = attacker->client->ps.saberMove;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1102
;1102:				attacker->client->ps.saberMove = PM_SaberDeflectionForQuad( newQuad );
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 PM_SaberDeflectionForQuad
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 1103
;1103:				if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $576
line 1104
;1104:				{
line 1105
;1105:					Com_Printf( "attack %s vs. parry %s deflected to %s\n", 
ADDRGP4 $579
ARGP4
ADDRLP4 104
CNSTI4 40
ASGNI4
ADDRLP4 108
CNSTI4 3
ASGNI4
ADDRLP4 112
ADDRGP4 animTable
ASGNP4
ADDRLP4 104
INDIRI4
ADDRLP4 96
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
LSHI4
ADDRLP4 112
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 116
CNSTI4 408
ASGNI4
ADDRLP4 120
CNSTI4 512
ASGNI4
ADDRLP4 104
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
LSHI4
ADDRLP4 112
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 104
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
LSHI4
ADDRLP4 112
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1109
;1106:						animTable[saberMoveData[attMove].animToUse].name, 
;1107:						animTable[saberMoveData[defender->client->ps.saberMove].animToUse].name,
;1108:						animTable[saberMoveData[attacker->client->ps.saberMove].animToUse].name );
;1109:				}
LABELV $576
line 1110
;1110:				attacker->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1111
;1111:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $510
JUMPV
LABELV $525
line 1116
;1112:			}
;1113:		}
;1114:	}
;1115:	else
;1116:	{ //old math-based method (probably broken)
line 1120
;1117:		vec3_t	att_HitDir, def_BladeDir, temp;
;1118:		float	hitDot;
;1119:
;1120:		VectorCopy(attacker->client->lastSaberBase_Always, temp);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1768
ADDP4
INDIRB
ASGNB 12
line 1122
;1121:
;1122:		AngleVectors(attacker->client->lastSaberDir_Always, att_HitDir, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1756
ADDP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1124
;1123:
;1124:		AngleVectors(defender->client->lastSaberDir_Always, def_BladeDir, 0, 0);
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1756
ADDP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 72
CNSTP4 0
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1127
;1125:
;1126:		//now compare
;1127:		hitDot = DotProduct( att_HitDir, def_BladeDir );
ADDRLP4 64
ADDRLP4 40
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 52+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 52+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1128
;1128:		if ( hitDot < 0.25f && hitDot > -0.25f )
ADDRLP4 76
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 1048576000
GEF4 $587
ADDRLP4 76
INDIRF4
CNSTF4 3196059648
LEF4 $587
line 1129
;1129:		{//hit pretty much perpendicular, pop straight back
line 1130
;1130:			attacker->client->ps.saberMove = PM_SaberBounceForAttack( attacker->client->ps.saberMove );
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 PM_SaberBounceForAttack
CALLI4
ASGNI4
ADDRLP4 80
INDIRP4
ADDRLP4 84
INDIRI4
ASGNI4
line 1131
;1131:			attacker->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1132
;1132:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $587
line 1135
;1133:		}
;1134:		else 
;1135:		{//a deflection
line 1140
;1136:			vec3_t	att_Right, att_Up, att_DeflectionDir;
;1137:			float	swingRDot, swingUDot;
;1138:
;1139:			//get the direction of the deflection
;1140:			VectorScale( def_BladeDir, hitDot, att_DeflectionDir );
ADDRLP4 124
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 80
ADDRLP4 52
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 52+4
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 52+8
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
line 1142
;1141:			//get our bounce straight back direction
;1142:			VectorScale( att_HitDir, -1.0f, temp );
ADDRLP4 128
CNSTF4 3212836864
ASGNF4
ADDRLP4 28
ADDRLP4 128
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 128
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28+8
CNSTF4 3212836864
ADDRLP4 40+8
INDIRF4
MULF4
ASGNF4
line 1144
;1143:			//add the bounce back and deflection
;1144:			VectorAdd( att_DeflectionDir, temp, att_DeflectionDir );
ADDRLP4 80
ADDRLP4 80
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 80+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
ASGNF4
line 1146
;1145:			//normalize the result to determine what direction our saber should bounce back toward
;1146:			VectorNormalize( att_DeflectionDir );
ADDRLP4 80
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1149
;1147:
;1148:			//need to know the direction of the deflectoin relative to the attacker's facing
;1149:			VectorSet( temp, 0, attacker->client->ps.viewangles[YAW], 0 );//presumes no pitch!
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 28+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28+8
CNSTF4 0
ASGNF4
line 1150
;1150:			AngleVectors( temp, NULL, att_Right, att_Up );
ADDRLP4 28
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1151
;1151:			swingRDot = DotProduct( att_Right, att_DeflectionDir );
ADDRLP4 116
ADDRLP4 92
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 92+4
INDIRF4
ADDRLP4 80+4
INDIRF4
MULF4
ADDF4
ADDRLP4 92+8
INDIRF4
ADDRLP4 80+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1152
;1152:			swingUDot = DotProduct( att_Up, att_DeflectionDir );
ADDRLP4 120
ADDRLP4 104
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 104+4
INDIRF4
ADDRLP4 80+4
INDIRF4
MULF4
ADDF4
ADDRLP4 104+8
INDIRF4
ADDRLP4 80+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1154
;1153:
;1154:			if ( swingRDot > 0.25f )
ADDRLP4 116
INDIRF4
CNSTF4 1048576000
LEF4 $613
line 1155
;1155:			{//deflect to right
line 1156
;1156:				if ( swingUDot > 0.25f )
ADDRLP4 120
INDIRF4
CNSTF4 1048576000
LEF4 $615
line 1157
;1157:				{//deflect to top
line 1158
;1158:					attacker->client->ps.saberMove = LS_D1_TR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 83
ASGNI4
line 1159
;1159:				}
ADDRGP4 $614
JUMPV
LABELV $615
line 1160
;1160:				else if ( swingUDot < -0.25f )
ADDRLP4 120
INDIRF4
CNSTF4 3196059648
GEF4 $617
line 1161
;1161:				{//deflect to bottom
line 1162
;1162:					attacker->client->ps.saberMove = LS_D1_BR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 81
ASGNI4
line 1163
;1163:				}
ADDRGP4 $614
JUMPV
LABELV $617
line 1165
;1164:				else
;1165:				{//deflect horizontally
line 1166
;1166:					attacker->client->ps.saberMove = LS_D1__R;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 82
ASGNI4
line 1167
;1167:				}
line 1168
;1168:			}
ADDRGP4 $614
JUMPV
LABELV $613
line 1169
;1169:			else if ( swingRDot < -0.25f )
ADDRLP4 116
INDIRF4
CNSTF4 3196059648
GEF4 $619
line 1170
;1170:			{//deflect to left
line 1171
;1171:				if ( swingUDot > 0.25f )
ADDRLP4 120
INDIRF4
CNSTF4 1048576000
LEF4 $621
line 1172
;1172:				{//deflect to top
line 1173
;1173:					attacker->client->ps.saberMove = LS_D1_TL;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 85
ASGNI4
line 1174
;1174:				}
ADDRGP4 $620
JUMPV
LABELV $621
line 1175
;1175:				else if ( swingUDot < -0.25f )
ADDRLP4 120
INDIRF4
CNSTF4 3196059648
GEF4 $623
line 1176
;1176:				{//deflect to bottom
line 1177
;1177:					attacker->client->ps.saberMove = LS_D1_BL;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 87
ASGNI4
line 1178
;1178:				}
ADDRGP4 $620
JUMPV
LABELV $623
line 1180
;1179:				else
;1180:				{//deflect horizontally
line 1181
;1181:					attacker->client->ps.saberMove = LS_D1__L;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 86
ASGNI4
line 1182
;1182:				}
line 1183
;1183:			}
ADDRGP4 $620
JUMPV
LABELV $619
line 1185
;1184:			else
;1185:			{//deflect in middle
line 1186
;1186:				if ( swingUDot > 0.25f )
ADDRLP4 120
INDIRF4
CNSTF4 1048576000
LEF4 $625
line 1187
;1187:				{//deflect to top
line 1188
;1188:					attacker->client->ps.saberMove = LS_D1_T_;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 84
ASGNI4
line 1189
;1189:				}
ADDRGP4 $626
JUMPV
LABELV $625
line 1190
;1190:				else if ( swingUDot < -0.25f )
ADDRLP4 120
INDIRF4
CNSTF4 3196059648
GEF4 $627
line 1191
;1191:				{//deflect to bottom
line 1192
;1192:					attacker->client->ps.saberMove = LS_D1_B_;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 88
ASGNI4
line 1193
;1193:				}
ADDRGP4 $628
JUMPV
LABELV $627
line 1195
;1194:				else
;1195:				{//deflect horizontally?  Well, no such thing as straight back in my face, so use top
line 1196
;1196:					if ( swingRDot > 0 )
ADDRLP4 116
INDIRF4
CNSTF4 0
LEF4 $629
line 1197
;1197:					{
line 1198
;1198:						attacker->client->ps.saberMove = LS_D1_TR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 83
ASGNI4
line 1199
;1199:					}
ADDRGP4 $630
JUMPV
LABELV $629
line 1200
;1200:					else if ( swingRDot < 0 )
ADDRLP4 116
INDIRF4
CNSTF4 0
GEF4 $631
line 1201
;1201:					{
line 1202
;1202:						attacker->client->ps.saberMove = LS_D1_TL;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 85
ASGNI4
line 1203
;1203:					}
ADDRGP4 $632
JUMPV
LABELV $631
line 1205
;1204:					else
;1205:					{
line 1206
;1206:						attacker->client->ps.saberMove = LS_D1_T_;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 84
ASGNI4
line 1207
;1207:					}
LABELV $632
LABELV $630
line 1208
;1208:				}
LABELV $628
LABELV $626
line 1209
;1209:			}
LABELV $620
LABELV $614
line 1211
;1210:
;1211:			attacker->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1212
;1212:			return qtrue;
CNSTI4 1
RETI4
LABELV $510
endproc WP_GetSaberDeflectionAngle 132 16
export G_KnockawayForParry
proc G_KnockawayForParry 4 0
line 1218
;1213:		}
;1214:	}
;1215:}
;1216:
;1217:int G_KnockawayForParry( int move )
;1218:{
line 1221
;1219:	//FIXME: need actual anims for this
;1220:	//FIXME: need to know which side of the saber was hit!  For now, we presume the saber gets knocked away from the center
;1221:	switch ( move )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 108
LTI4 $634
ADDRLP4 0
INDIRI4
CNSTI4 112
GTI4 $634
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $641-432
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $641
address $636
address $637
address $638
address $639
address $640
code
line 1222
;1222:	{
LABELV $636
line 1224
;1223:	case LS_PARRY_UP:
;1224:		return LS_K1_T_;//push up
CNSTI4 103
RETI4
ADDRGP4 $633
JUMPV
line 1225
;1225:		break;
LABELV $637
LABELV $634
line 1228
;1226:	case LS_PARRY_UR:
;1227:	default://case LS_READY:
;1228:		return LS_K1_TR;//push up, slightly to right
CNSTI4 104
RETI4
ADDRGP4 $633
JUMPV
line 1229
;1229:		break;
LABELV $638
line 1231
;1230:	case LS_PARRY_UL:
;1231:		return LS_K1_TL;//push up and to left
CNSTI4 105
RETI4
ADDRGP4 $633
JUMPV
line 1232
;1232:		break;
LABELV $639
line 1234
;1233:	case LS_PARRY_LR:
;1234:		return LS_K1_BR;//push down and to left
CNSTI4 106
RETI4
ADDRGP4 $633
JUMPV
line 1235
;1235:		break;
LABELV $640
line 1237
;1236:	case LS_PARRY_LL:
;1237:		return LS_K1_BL;//push down and to right
CNSTI4 107
RETI4
line 1238
;1238:		break;
LABELV $633
endproc G_KnockawayForParry 4 0
export G_GetAttackDamage
proc G_GetAttackDamage 48 12
line 1246
;1239:	}
;1240:}
;1241:
;1242:#define SABER_NONATTACK_DAMAGE 1
;1243:
;1244://For strong attacks, we ramp damage based on the point in the attack animation
;1245:int G_GetAttackDamage(gentity_t *self, int minDmg, int maxDmg, float multPoint)
;1246:{
line 1247
;1247:	int peakDif = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1248
;1248:	int speedDif = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1249
;1249:	int totalDamage = maxDmg;
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
line 1250
;1250:	float peakPoint = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1251
;1251:	float attackAnimLength = bgGlobalAnimations[self->client->ps.torsoAnim&~ANIM_TOGGLEBIT].numFrames * fabs(bgGlobalAnimations[self->client->ps.torsoAnim&~ANIM_TOGGLEBIT].frameLerp);
ADDRLP4 32
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 1252
;1252:	float currentPoint = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1253
;1253:	float damageFactor = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1254
;1254:	float animSpeedFactor = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 1257
;1255:
;1256:	//Be sure to scale by the proper anim speed just as if we were going to play the animation
;1257:	BG_SaberStartTransAnim(self->client->ps.fd.saberAnimLevel, self->client->ps.torsoAnim&~ANIM_TOGGLEBIT, &animSpeedFactor);
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 BG_SaberStartTransAnim
CALLV
pop
line 1258
;1258:	speedDif = attackAnimLength - (attackAnimLength * animSpeedFactor);
ADDRLP4 20
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 1259
;1259:	attackAnimLength += speedDif;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1260
;1260:	peakPoint = attackAnimLength;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 1261
;1261:	peakPoint -= attackAnimLength*multPoint;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 1264
;1262:
;1263:	//we treat torsoTimer as the point in the animation (closer it is to attackAnimLength, closer it is to beginning)
;1264:	currentPoint = self->client->ps.torsoTimer;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1266
;1265:
;1266:	if (peakPoint > currentPoint)
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
LEF4 $646
line 1267
;1267:	{
line 1268
;1268:		peakDif = (peakPoint - currentPoint);
ADDRLP4 28
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 1269
;1269:	}
ADDRGP4 $647
JUMPV
LABELV $646
line 1271
;1270:	else
;1271:	{
line 1272
;1272:		peakDif = (currentPoint - peakPoint);
ADDRLP4 28
ADDRLP4 12
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 1273
;1273:	}
LABELV $647
line 1275
;1274:
;1275:	damageFactor = (float)((currentPoint/peakPoint));
ADDRLP4 16
ADDRLP4 12
INDIRF4
ADDRLP4 4
INDIRF4
DIVF4
ASGNF4
line 1276
;1276:	if (damageFactor > 1)
ADDRLP4 16
INDIRF4
CNSTF4 1065353216
LEF4 $648
line 1277
;1277:	{
line 1278
;1278:		damageFactor = (2.0f - damageFactor);
ADDRLP4 16
CNSTF4 1073741824
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
line 1279
;1279:	}
LABELV $648
line 1281
;1280:
;1281:	totalDamage *= damageFactor;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1282
;1282:	if (totalDamage < minDmg)
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
GEI4 $650
line 1283
;1283:	{
line 1284
;1284:		totalDamage = minDmg;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 1285
;1285:	}
LABELV $650
line 1286
;1286:	if (totalDamage > maxDmg)
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $652
line 1287
;1287:	{
line 1288
;1288:		totalDamage = maxDmg;
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
line 1289
;1289:	}
LABELV $652
line 1293
;1290:
;1291:	//Com_Printf("%i\n", totalDamage);
;1292:
;1293:	return totalDamage;
ADDRLP4 0
INDIRI4
RETI4
LABELV $643
endproc G_GetAttackDamage 48 12
export G_GetAnimPoint
proc G_GetAnimPoint 36 12
line 1298
;1294:}
;1295:
;1296://Get the point in the animation and return a percentage of the current point in the anim between 0 and the total anim length (0.0f - 1.0f)
;1297:float G_GetAnimPoint(gentity_t *self)
;1298:{
line 1299
;1299:	int speedDif = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1300
;1300:	float attackAnimLength = bgGlobalAnimations[self->client->ps.torsoAnim&~ANIM_TOGGLEBIT].numFrames * fabs(bgGlobalAnimations[self->client->ps.torsoAnim&~ANIM_TOGGLEBIT].frameLerp);
ADDRLP4 20
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1301
;1301:	float currentPoint = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1302
;1302:	float animSpeedFactor = 1.0f;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1303
;1303:	float animPercentage = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1306
;1304:
;1305:	//Be sure to scale by the proper anim speed just as if we were going to play the animation
;1306:	BG_SaberStartTransAnim(self->client->ps.fd.saberAnimLevel, self->client->ps.torsoAnim&~ANIM_TOGGLEBIT, &animSpeedFactor);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_SaberStartTransAnim
CALLV
pop
line 1307
;1307:	speedDif = attackAnimLength - (attackAnimLength * animSpeedFactor);
ADDRLP4 4
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 1308
;1308:	attackAnimLength += speedDif;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1310
;1309:
;1310:	currentPoint = self->client->ps.torsoTimer;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1312
;1311:
;1312:	animPercentage = currentPoint/attackAnimLength;
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 1316
;1313:
;1314:	//Com_Printf("%f\n", animPercentage);
;1315:
;1316:	return animPercentage;
ADDRLP4 16
INDIRF4
RETF4
LABELV $654
endproc G_GetAnimPoint 36 12
export G_ClientIdleInWorld
proc G_ClientIdleInWorld 12 0
line 1320
;1317:}
;1318:
;1319:qboolean G_ClientIdleInWorld(gentity_t *ent)
;1320:{
line 1321
;1321:	if (!ent->client->pers.cmd.upmove &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $658
ADDRLP4 0
INDIRP4
CNSTI4 1408
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $658
ADDRLP4 0
INDIRP4
CNSTI4 1409
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $658
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $658
ADDRLP4 8
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $658
ADDRLP4 8
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $658
ADDRLP4 8
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $658
ADDRLP4 8
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $658
ADDRLP4 8
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $658
ADDRLP4 8
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $658
line 1331
;1322:		!ent->client->pers.cmd.forwardmove &&
;1323:		!ent->client->pers.cmd.rightmove &&
;1324:		!(ent->client->pers.cmd.buttons & BUTTON_GESTURE) &&
;1325:		!(ent->client->pers.cmd.buttons & BUTTON_FORCEGRIP) &&
;1326:		!(ent->client->pers.cmd.buttons & BUTTON_ALT_ATTACK) &&
;1327:		!(ent->client->pers.cmd.buttons & BUTTON_FORCEPOWER) &&
;1328:		!(ent->client->pers.cmd.buttons & BUTTON_FORCE_LIGHTNING) &&
;1329:		!(ent->client->pers.cmd.buttons & BUTTON_FORCE_DRAIN) &&
;1330:		!(ent->client->pers.cmd.buttons & BUTTON_ATTACK))
;1331:	{
line 1332
;1332:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $657
JUMPV
LABELV $658
line 1335
;1333:	}
;1334:
;1335:	return qfalse;
CNSTI4 0
RETI4
LABELV $657
endproc G_ClientIdleInWorld 12 0
lit
align 4
LABELV $666
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export G_G2TraceCollide
code
proc G_G2TraceCollide 1104 48
line 1340
;1336:}
;1337:
;1338:#ifdef G2_COLLISION_ENABLED
;1339:qboolean G_G2TraceCollide(trace_t *tr, vec3_t lastValidStart, vec3_t lastValidEnd, vec3_t traceMins, vec3_t traceMaxs)
;1340:{
line 1341
;1341:	if (!g_saberGhoul2Collision.integer)
ADDRGP4 g_saberGhoul2Collision+12
INDIRI4
CNSTI4 0
NEI4 $661
line 1342
;1342:	{
line 1343
;1343:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $660
JUMPV
LABELV $661
line 1346
;1344:	}
;1345:
;1346:	if (tr->entityNum < MAX_CLIENTS)
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 32
GEI4 $664
line 1347
;1347:	{ //Hit a client with the normal trace, try the collision trace.
line 1350
;1348:		G2Trace_t		G2Trace;
;1349:		gentity_t		*g2Hit;
;1350:		vec3_t			vIdentity = {1.0f, 1.0f, 1.0f};
ADDRLP4 1036
ADDRGP4 $666
INDIRB
ASGNB 12
line 1352
;1351:		vec3_t			angles;
;1352:		int				tN = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1353
;1353:		float			fRadius = 0;
ADDRLP4 1032
CNSTF4 0
ASGNF4
line 1355
;1354:
;1355:		if (traceMins[0] ||
ADDRLP4 1060
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 1064
CNSTF4 0
ASGNF4
ADDRLP4 1060
INDIRP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $673
ADDRLP4 1068
CNSTI4 4
ASGNI4
ADDRLP4 1060
INDIRP4
ADDRLP4 1068
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $673
ADDRLP4 1072
CNSTI4 8
ASGNI4
ADDRLP4 1060
INDIRP4
ADDRLP4 1072
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $673
ADDRLP4 1076
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1076
INDIRP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $673
ADDRLP4 1076
INDIRP4
ADDRLP4 1068
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $673
ADDRLP4 1076
INDIRP4
ADDRLP4 1072
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1064
INDIRF4
EQF4 $667
LABELV $673
line 1361
;1356:			traceMins[1] ||
;1357:			traceMins[2] ||
;1358:			traceMaxs[0] ||
;1359:			traceMaxs[1] ||
;1360:			traceMaxs[2])
;1361:		{
line 1362
;1362:			fRadius=(traceMaxs[0]-traceMins[0])/2.0f;
ADDRLP4 1032
ADDRFP4 16
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1363
;1363:		}
LABELV $667
line 1365
;1364:
;1365:		memset (&G2Trace, 0, sizeof(G2Trace));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $675
JUMPV
LABELV $674
line 1368
;1366:
;1367:		while (tN < MAX_G2_COLLISIONS)
;1368:		{
line 1369
;1369:			G2Trace[tN].mEntityNum = -1;
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 4+4
ADDP4
CNSTI4 -1
ASGNI4
line 1370
;1370:			tN++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1371
;1371:		}
LABELV $675
line 1367
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $674
line 1372
;1372:		g2Hit = &g_entities[tr->entityNum];
ADDRLP4 1028
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1374
;1373:
;1374:		if (g2Hit && g2Hit->inuse && g2Hit->client && g2Hit->client->ghoul2)
ADDRLP4 1084
CNSTU4 0
ASGNU4
ADDRLP4 1028
INDIRP4
CVPU4 4
ADDRLP4 1084
INDIRU4
EQU4 $678
ADDRLP4 1028
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $678
ADDRLP4 1088
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CVPU4 4
ADDRLP4 1084
INDIRU4
EQU4 $678
ADDRLP4 1088
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1084
INDIRU4
EQU4 $678
line 1375
;1375:		{
line 1376
;1376:			angles[ROLL] = angles[PITCH] = 0;
ADDRLP4 1092
CNSTF4 0
ASGNF4
ADDRLP4 1048
ADDRLP4 1092
INDIRF4
ASGNF4
ADDRLP4 1048+8
ADDRLP4 1092
INDIRF4
ASGNF4
line 1377
;1377:			angles[YAW] = g2Hit->client->ps.viewangles[YAW];
ADDRLP4 1048+4
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 1379
;1378:
;1379:			trap_G2API_CollisionDetect ( G2Trace, g2Hit->client->ghoul2, angles, g2Hit->client->ps.origin, level.time, g2Hit->s.number, lastValidStart, lastValidEnd, vIdentity, 0, 2, fRadius );
ADDRLP4 4
ARGP4
ADDRLP4 1100
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1036
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRGP4 trap_G2API_CollisionDetect
CALLV
pop
line 1381
;1380:
;1381:			if (G2Trace[0].mEntityNum != g2Hit->s.number)
ADDRLP4 4+4
INDIRI4
ADDRLP4 1028
INDIRP4
INDIRI4
EQI4 $683
line 1382
;1382:			{
line 1383
;1383:				tr->fraction = 1.0f;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 1384
;1384:				tr->entityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 1023
ASGNI4
line 1385
;1385:				tr->startsolid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1386
;1386:				tr->allsolid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1387
;1387:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $660
JUMPV
LABELV $683
line 1390
;1388:			}
;1389:			else
;1390:			{ //The ghoul2 trace result matches, so copy the collision position into the trace endpos and send it back.
line 1391
;1391:				VectorCopy(G2Trace[0].mCollisionPosition, tr->endpos);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4+20
INDIRB
ASGNB 12
line 1392
;1392:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $660
JUMPV
LABELV $678
line 1395
;1393:			}
;1394:		}
;1395:	}
LABELV $664
line 1397
;1396:
;1397:	return qfalse;
CNSTI4 0
RETI4
LABELV $660
endproc G_G2TraceCollide 1104 48
export G_SaberInBackAttack
proc G_SaberInBackAttack 4 0
line 1402
;1398:}
;1399:#endif
;1400:
;1401:qboolean G_SaberInBackAttack(int move)
;1402:{
line 1403
;1403:	switch (move)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $690
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $690
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $690
ADDRGP4 $688
JUMPV
line 1404
;1404:	{
LABELV $690
line 1408
;1405:	case LS_A_BACK:
;1406:	case LS_A_BACK_CR:
;1407:	case LS_A_BACKSTAB:
;1408:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $687
JUMPV
LABELV $688
line 1411
;1409:	}
;1410:
;1411:	return qfalse;
CNSTI4 0
RETI4
LABELV $687
endproc G_SaberInBackAttack 4 0
export CheckSaberDamage
proc CheckSaberDamage 1624 32
line 1418
;1412:}
;1413:
;1414://rww - MP version of the saber damage function. This is where all the things like blocking, triggering a parry,
;1415://triggering a broken parry, doing actual damage, etc. are done for the saber. It doesn't resemble the SP
;1416://version very much, but functionality is (hopefully) about the same.
;1417:qboolean CheckSaberDamage(gentity_t *self, vec3_t saberStart, vec3_t saberEnd, qboolean doInterpolate, int trMask)
;1418:{
line 1426
;1419:	trace_t tr;
;1420:	vec3_t dir;
;1421:	vec3_t saberTrMins, saberTrMaxs;
;1422:#ifdef G2_COLLISION_ENABLED
;1423:	vec3_t lastValidStart;
;1424:	vec3_t lastValidEnd;
;1425:#endif
;1426:	int dmg = 0;
ADDRLP4 1136
CNSTI4 0
ASGNI4
line 1427
;1427:	int attackStr = 0;
ADDRLP4 1168
CNSTI4 0
ASGNI4
line 1428
;1428:	float saberBoxSize = g_saberBoxTraceSize.value;
ADDRLP4 1140
ADDRGP4 g_saberBoxTraceSize+8
INDIRF4
ASGNF4
line 1429
;1429:	qboolean idleDamage = qfalse;
ADDRLP4 1172
CNSTI4 0
ASGNI4
line 1430
;1430:	qboolean didHit = qfalse;
ADDRLP4 1160
CNSTI4 0
ASGNI4
line 1431
;1431:	qboolean sabersClashed = qfalse;
ADDRLP4 1176
CNSTI4 0
ASGNI4
line 1432
;1432:	qboolean unblockable = qfalse;
ADDRLP4 1156
CNSTI4 0
ASGNI4
line 1433
;1433:	qboolean didDefense = qfalse;
ADDRLP4 1188
CNSTI4 0
ASGNI4
line 1434
;1434:	qboolean didOffense = qfalse;
ADDRLP4 1180
CNSTI4 0
ASGNI4
line 1435
;1435:	qboolean saberTraceDone = qfalse;
ADDRLP4 1128
CNSTI4 0
ASGNI4
line 1436
;1436:	qboolean otherUnblockable = qfalse;
ADDRLP4 1164
CNSTI4 0
ASGNI4
line 1437
;1437:	qboolean tryDeflectAgain = qfalse;
ADDRLP4 1184
CNSTI4 0
ASGNI4
line 1441
;1438:
;1439:	gentity_t *otherOwner;
;1440:
;1441:	if (self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $693
line 1442
;1442:	{
line 1443
;1443:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $691
JUMPV
LABELV $693
line 1446
;1444:	}
;1445:
;1446:	memset (&tr, 0, sizeof(tr)); //make the compiler happy
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1448
;1447:#ifdef G2_COLLISION_ENABLED
;1448:	if (g_saberGhoul2Collision.integer)
ADDRGP4 g_saberGhoul2Collision+12
INDIRI4
CNSTI4 0
EQI4 $695
line 1449
;1449:	{
line 1450
;1450:		VectorSet(saberTrMins, -saberBoxSize*3, -saberBoxSize*3, -saberBoxSize*3);
ADDRLP4 1192
CNSTF4 1077936128
ADDRLP4 1140
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1080+8
CNSTF4 1077936128
ADDRLP4 1140
INDIRF4
NEGF4
MULF4
ASGNF4
line 1451
;1451:		VectorSet(saberTrMaxs, saberBoxSize*3, saberBoxSize*3, saberBoxSize*3);
ADDRLP4 1196
CNSTF4 1077936128
ADDRLP4 1140
INDIRF4
MULF4
ASGNF4
ADDRLP4 1092
ADDRLP4 1196
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1196
INDIRF4
ASGNF4
ADDRLP4 1092+8
CNSTF4 1077936128
ADDRLP4 1140
INDIRF4
MULF4
ASGNF4
line 1452
;1452:	}
ADDRGP4 $720
JUMPV
LABELV $695
line 1455
;1453:	else
;1454:#endif
;1455:	if (self->client->ps.fd.saberAnimLevel < FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
GEI4 $702
line 1456
;1456:	{ //box trace for fast, because it doesn't get updated so often
line 1457
;1457:		VectorSet(saberTrMins, -saberBoxSize, -saberBoxSize, -saberBoxSize);
ADDRLP4 1192
ADDRLP4 1140
INDIRF4
NEGF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1080+8
ADDRLP4 1140
INDIRF4
NEGF4
ASGNF4
line 1458
;1458:		VectorSet(saberTrMaxs, saberBoxSize, saberBoxSize, saberBoxSize);
ADDRLP4 1092
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 1092+8
ADDRLP4 1140
INDIRF4
ASGNF4
line 1459
;1459:	}
ADDRGP4 $720
JUMPV
LABELV $702
line 1460
;1460:	else if (g_saberAlwaysBoxTrace.integer)
ADDRGP4 g_saberAlwaysBoxTrace+12
INDIRI4
CNSTI4 0
EQI4 $708
line 1461
;1461:	{
line 1462
;1462:		VectorSet(saberTrMins, -saberBoxSize, -saberBoxSize, -saberBoxSize);
ADDRLP4 1192
ADDRLP4 1140
INDIRF4
NEGF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1080+8
ADDRLP4 1140
INDIRF4
NEGF4
ASGNF4
line 1463
;1463:		VectorSet(saberTrMaxs, saberBoxSize, saberBoxSize, saberBoxSize);
ADDRLP4 1092
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 1092+8
ADDRLP4 1140
INDIRF4
ASGNF4
line 1464
;1464:	}
ADDRGP4 $720
JUMPV
LABELV $708
line 1466
;1465:	else
;1466:	{
line 1467
;1467:		VectorClear(saberTrMins);
ADDRLP4 1192
CNSTF4 0
ASGNF4
ADDRLP4 1080+8
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1192
INDIRF4
ASGNF4
line 1468
;1468:		VectorClear(saberTrMaxs);
ADDRLP4 1196
CNSTF4 0
ASGNF4
ADDRLP4 1092+8
ADDRLP4 1196
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1196
INDIRF4
ASGNF4
ADDRLP4 1092
ADDRLP4 1196
INDIRF4
ASGNF4
line 1469
;1469:	}
ADDRGP4 $720
JUMPV
LABELV $719
line 1472
;1470:
;1471:	while (!saberTraceDone)
;1472:	{
line 1473
;1473:		if (doInterpolate)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $722
line 1474
;1474:		{ //This didn't quite work out like I hoped. But it's better than nothing. Sort of.
line 1476
;1475:			vec3_t oldSaberStart, oldSaberEnd, saberDif, oldSaberDif;
;1476:			int traceTests = 0;
ADDRLP4 1244
CNSTI4 0
ASGNI4
line 1477
;1477:			float trDif = 8;
ADDRLP4 1192
CNSTF4 1090519040
ASGNF4
line 1479
;1478:
;1479:			VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 1196
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1744
ADDP4
INDIRB
ASGNB 12
line 1480
;1480:			VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 1208
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRB
ASGNB 12
line 1482
;1481:
;1482:			VectorSubtract(saberStart, saberEnd, saberDif);
ADDRLP4 1248
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1252
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1220
ADDRLP4 1248
INDIRP4
INDIRF4
ADDRLP4 1252
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1256
CNSTI4 4
ASGNI4
ADDRLP4 1220+4
ADDRLP4 1248
INDIRP4
ADDRLP4 1256
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1252
INDIRP4
ADDRLP4 1256
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1260
CNSTI4 8
ASGNI4
ADDRLP4 1220+8
ADDRFP4 4
INDIRP4
ADDRLP4 1260
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 1260
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1483
;1483:			VectorSubtract(oldSaberStart, oldSaberEnd, oldSaberDif);
ADDRLP4 1232
ADDRLP4 1196
INDIRF4
ADDRLP4 1208
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1232+4
ADDRLP4 1196+4
INDIRF4
ADDRLP4 1208+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1232+8
ADDRLP4 1196+8
INDIRF4
ADDRLP4 1208+8
INDIRF4
SUBF4
ASGNF4
line 1485
;1484:
;1485:			VectorNormalize(saberDif);
ADDRLP4 1220
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1486
;1486:			VectorNormalize(oldSaberDif);
ADDRLP4 1232
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1488
;1487:
;1488:			saberEnd[0] = saberStart[0] - (saberDif[0]*trDif);
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 1220
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1489
;1489:			saberEnd[1] = saberStart[1] - (saberDif[1]*trDif);
ADDRLP4 1264
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1264
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1264
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1220+4
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1490
;1490:			saberEnd[2] = saberStart[2] - (saberDif[2]*trDif);
ADDRLP4 1268
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1268
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1268
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1220+8
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1492
;1491:
;1492:			oldSaberEnd[0] = oldSaberStart[0] - (oldSaberDif[0]*trDif);
ADDRLP4 1208
ADDRLP4 1196
INDIRF4
ADDRLP4 1232
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1493
;1493:			oldSaberEnd[1] = oldSaberStart[1] - (oldSaberDif[1]*trDif);
ADDRLP4 1208+4
ADDRLP4 1196+4
INDIRF4
ADDRLP4 1232+4
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1494
;1494:			oldSaberEnd[2] = oldSaberStart[2] - (oldSaberDif[2]*trDif);
ADDRLP4 1208+8
ADDRLP4 1196+8
INDIRF4
ADDRLP4 1232+8
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1496
;1495:
;1496:			trap_Trace(&tr, saberEnd, saberTrMins, saberTrMaxs, saberStart, self->s.number, trMask);
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1498
;1497:#ifdef G2_COLLISION_ENABLED
;1498:			VectorCopy(saberEnd, lastValidStart);
ADDRLP4 1104
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1499
;1499:			VectorCopy(saberStart, lastValidEnd);
ADDRLP4 1116
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1500
;1500:			if (tr.entityNum < MAX_CLIENTS)
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $740
line 1501
;1501:			{
line 1502
;1502:				G_G2TraceCollide(&tr, lastValidStart, lastValidEnd, saberTrMins, saberTrMaxs);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRGP4 G_G2TraceCollide
CALLI4
pop
line 1503
;1503:			}
LABELV $740
line 1506
;1504:#endif
;1505:
;1506:			trDif++;
ADDRLP4 1192
ADDRLP4 1192
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
ADDRGP4 $744
JUMPV
LABELV $743
line 1509
;1507:
;1508:			while (tr.fraction == 1.0 && traceTests < 4 && tr.entityNum >= ENTITYNUM_NONE)
;1509:			{
line 1510
;1510:				VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 1196
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1744
ADDP4
INDIRB
ASGNB 12
line 1511
;1511:				VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 1208
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRB
ASGNB 12
line 1513
;1512:
;1513:				VectorSubtract(saberStart, saberEnd, saberDif);
ADDRLP4 1272
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1276
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1220
ADDRLP4 1272
INDIRP4
INDIRF4
ADDRLP4 1276
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1280
CNSTI4 4
ASGNI4
ADDRLP4 1220+4
ADDRLP4 1272
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1276
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1284
CNSTI4 8
ASGNI4
ADDRLP4 1220+8
ADDRFP4 4
INDIRP4
ADDRLP4 1284
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 1284
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1514
;1514:				VectorSubtract(oldSaberStart, oldSaberEnd, oldSaberDif);
ADDRLP4 1232
ADDRLP4 1196
INDIRF4
ADDRLP4 1208
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1232+4
ADDRLP4 1196+4
INDIRF4
ADDRLP4 1208+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1232+8
ADDRLP4 1196+8
INDIRF4
ADDRLP4 1208+8
INDIRF4
SUBF4
ASGNF4
line 1516
;1515:
;1516:				VectorNormalize(saberDif);
ADDRLP4 1220
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1517
;1517:				VectorNormalize(oldSaberDif);
ADDRLP4 1232
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1519
;1518:
;1519:				saberEnd[0] = saberStart[0] - (saberDif[0]*trDif);
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 1220
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1520
;1520:				saberEnd[1] = saberStart[1] - (saberDif[1]*trDif);
ADDRLP4 1288
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1288
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1288
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1220+4
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1521
;1521:				saberEnd[2] = saberStart[2] - (saberDif[2]*trDif);
ADDRLP4 1292
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1292
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1292
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1220+8
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1523
;1522:
;1523:				oldSaberEnd[0] = oldSaberStart[0] - (oldSaberDif[0]*trDif);
ADDRLP4 1208
ADDRLP4 1196
INDIRF4
ADDRLP4 1232
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1524
;1524:				oldSaberEnd[1] = oldSaberStart[1] - (oldSaberDif[1]*trDif);
ADDRLP4 1208+4
ADDRLP4 1196+4
INDIRF4
ADDRLP4 1232+4
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1525
;1525:				oldSaberEnd[2] = oldSaberStart[2] - (oldSaberDif[2]*trDif);
ADDRLP4 1208+8
ADDRLP4 1196+8
INDIRF4
ADDRLP4 1232+8
INDIRF4
ADDRLP4 1192
INDIRF4
MULF4
SUBF4
ASGNF4
line 1527
;1526:
;1527:				trap_Trace(&tr, saberEnd, saberTrMins, saberTrMaxs, saberStart, self->s.number, trMask);
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1529
;1528:#ifdef G2_COLLISION_ENABLED
;1529:				VectorCopy(saberEnd, lastValidStart);
ADDRLP4 1104
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1530
;1530:				VectorCopy(saberStart, lastValidEnd);
ADDRLP4 1116
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1531
;1531:				if (tr.entityNum < MAX_CLIENTS)
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $764
line 1532
;1532:				{
line 1533
;1533:					G_G2TraceCollide(&tr, lastValidStart, lastValidEnd, saberTrMins, saberTrMaxs);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRGP4 G_G2TraceCollide
CALLI4
pop
line 1534
;1534:				}
LABELV $764
line 1536
;1535:#endif
;1536:				traceTests++;
ADDRLP4 1244
ADDRLP4 1244
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1537
;1537:				trDif += 8;
ADDRLP4 1192
ADDRLP4 1192
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1538
;1538:			}
LABELV $744
line 1508
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $768
ADDRLP4 1244
INDIRI4
CNSTI4 4
GEI4 $768
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
GEI4 $743
LABELV $768
line 1539
;1539:		}
ADDRGP4 $723
JUMPV
LABELV $722
line 1541
;1540:		else
;1541:		{
line 1542
;1542:			trap_Trace(&tr, saberStart, saberTrMins, saberTrMaxs, saberEnd, self->s.number, trMask);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1544
;1543:#ifdef G2_COLLISION_ENABLED
;1544:			VectorCopy(saberStart, lastValidStart);
ADDRLP4 1104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1545
;1545:			VectorCopy(saberEnd, lastValidEnd);
ADDRLP4 1116
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1546
;1546:			if (tr.entityNum < MAX_CLIENTS)
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $769
line 1547
;1547:			{
line 1548
;1548:				G_G2TraceCollide(&tr, lastValidStart, lastValidEnd, saberTrMins, saberTrMaxs);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRGP4 G_G2TraceCollide
CALLI4
pop
line 1549
;1549:			}
LABELV $769
line 1551
;1550:#endif
;1551:		}
LABELV $723
line 1553
;1552:
;1553:		saberTraceDone = qtrue;
ADDRLP4 1128
CNSTI4 1
ASGNI4
line 1554
;1554:	}
LABELV $720
line 1471
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $719
line 1556
;1555:
;1556:	if (SaberAttacking(self) &&
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1192
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
EQI4 $772
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $772
line 1558
;1557:		self->client->ps.saberAttackWound < level.time)
;1558:	{ //this animation is that of the last attack movement, and so it should do full damage
line 1559
;1559:		qboolean saberInSpecial = BG_SaberInSpecial(self->client->ps.saberMove);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1204
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1196
ADDRLP4 1204
INDIRI4
ASGNI4
line 1560
;1560:		qboolean inBackAttack = G_SaberInBackAttack(self->client->ps.saberMove);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1208
ADDRGP4 G_SaberInBackAttack
CALLI4
ASGNI4
ADDRLP4 1200
ADDRLP4 1208
INDIRI4
ASGNI4
line 1562
;1561:
;1562:		dmg = SABER_HITDAMAGE;
ADDRLP4 1136
CNSTI4 35
ASGNI4
line 1564
;1563:
;1564:		if (self->client->ps.fd.saberAnimLevel == 3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $775
line 1565
;1565:		{
line 1567
;1566:			//new damage-ramping system
;1567:			if (!saberInSpecial && !inBackAttack)
ADDRLP4 1212
CNSTI4 0
ASGNI4
ADDRLP4 1196
INDIRI4
ADDRLP4 1212
INDIRI4
NEI4 $777
ADDRLP4 1200
INDIRI4
ADDRLP4 1212
INDIRI4
NEI4 $777
line 1568
;1568:			{
line 1569
;1569:				dmg = G_GetAttackDamage(self, 2, 120, 0.5f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 120
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1216
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1216
INDIRI4
ASGNI4
line 1570
;1570:			}
ADDRGP4 $776
JUMPV
LABELV $777
line 1571
;1571:			else if (saberInSpecial &&
ADDRLP4 1196
INDIRI4
CNSTI4 0
EQI4 $779
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 15
NEI4 $779
line 1573
;1572:					 (self->client->ps.saberMove == LS_A_JUMP_T__B_))
;1573:			{
line 1574
;1574:				dmg = G_GetAttackDamage(self, 2, 180, 0.65f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 180
ARGI4
CNSTF4 1059481190
ARGF4
ADDRLP4 1216
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1216
INDIRI4
ASGNI4
line 1575
;1575:			}
ADDRGP4 $776
JUMPV
LABELV $779
line 1576
;1576:			else if (inBackAttack)
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $781
line 1577
;1577:			{
line 1578
;1578:				dmg = G_GetAttackDamage(self, 2, 30, 0.5f); //can hit multiple times (and almost always does), so..
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 30
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1216
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1216
INDIRI4
ASGNI4
line 1579
;1579:			}
ADDRGP4 $776
JUMPV
LABELV $781
line 1581
;1580:			else
;1581:			{
line 1582
;1582:				dmg = 100;
ADDRLP4 1136
CNSTI4 100
ASGNI4
line 1583
;1583:			}
line 1584
;1584:		}
ADDRGP4 $776
JUMPV
LABELV $775
line 1585
;1585:		else if (self->client->ps.fd.saberAnimLevel == 2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
NEI4 $783
line 1586
;1586:		{
line 1587
;1587:			if (saberInSpecial &&
ADDRLP4 1196
INDIRI4
CNSTI4 0
EQI4 $785
ADDRLP4 1212
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 16
EQI4 $787
ADDRLP4 1212
INDIRI4
CNSTI4 17
NEI4 $785
LABELV $787
line 1589
;1588:				(self->client->ps.saberMove == LS_A_FLIP_STAB || self->client->ps.saberMove == LS_A_FLIP_SLASH))
;1589:			{ //a well-timed hit with this can do a full 85
line 1590
;1590:				dmg = G_GetAttackDamage(self, 2, 80, 0.5f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 80
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1216
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1216
INDIRI4
ASGNI4
line 1591
;1591:			}
ADDRGP4 $784
JUMPV
LABELV $785
line 1592
;1592:			else if (inBackAttack)
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $788
line 1593
;1593:			{
line 1594
;1594:				dmg = G_GetAttackDamage(self, 2, 25, 0.5f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 25
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1216
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1216
INDIRI4
ASGNI4
line 1595
;1595:			}
ADDRGP4 $784
JUMPV
LABELV $788
line 1597
;1596:			else
;1597:			{
line 1598
;1598:				dmg = 60;
ADDRLP4 1136
CNSTI4 60
ASGNI4
line 1599
;1599:			}
line 1600
;1600:		}
ADDRGP4 $784
JUMPV
LABELV $783
line 1601
;1601:		else if (self->client->ps.fd.saberAnimLevel == 1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
NEI4 $790
line 1602
;1602:		{
line 1603
;1603:			if (saberInSpecial &&
ADDRLP4 1196
INDIRI4
CNSTI4 0
EQI4 $792
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 14
NEI4 $792
line 1605
;1604:				(self->client->ps.saberMove == LS_A_LUNGE))
;1605:			{
line 1606
;1606:				dmg = G_GetAttackDamage(self, 2, SABER_HITDAMAGE-5, 0.3f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 30
ARGI4
CNSTF4 1050253722
ARGF4
ADDRLP4 1212
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1212
INDIRI4
ASGNI4
line 1607
;1607:			}
ADDRGP4 $793
JUMPV
LABELV $792
line 1608
;1608:			else if (inBackAttack)
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $794
line 1609
;1609:			{
line 1610
;1610:				dmg = G_GetAttackDamage(self, 2, 30, 0.5f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 30
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1212
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1212
INDIRI4
ASGNI4
line 1611
;1611:			}
ADDRGP4 $795
JUMPV
LABELV $794
line 1613
;1612:			else
;1613:			{
line 1614
;1614:				dmg = SABER_HITDAMAGE;
ADDRLP4 1136
CNSTI4 35
ASGNI4
line 1615
;1615:			}
LABELV $795
LABELV $793
line 1616
;1616:		}
LABELV $790
LABELV $784
LABELV $776
line 1618
;1617:
;1618:		attackStr = self->client->ps.fd.saberAnimLevel;
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 1619
;1619:	}
ADDRGP4 $773
JUMPV
LABELV $772
line 1620
;1620:	else if (self->client->ps.saberIdleWound < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $796
line 1621
;1621:	{ //just touching, do minimal damage and only check for it every 200ms (mainly to cut down on network traffic for hit events)
line 1622
;1622:		dmg = SABER_NONATTACK_DAMAGE;
ADDRLP4 1136
CNSTI4 1
ASGNI4
line 1623
;1623:		idleDamage = qtrue;
ADDRLP4 1172
CNSTI4 1
ASGNI4
line 1624
;1624:	}
LABELV $796
LABELV $773
line 1626
;1625:
;1626:	if (BG_SaberInSpecial(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1196
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
EQI4 $799
line 1627
;1627:	{
line 1628
;1628:		qboolean inBackAttack = G_SaberInBackAttack(self->client->ps.saberMove);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1204
ADDRGP4 G_SaberInBackAttack
CALLI4
ASGNI4
ADDRLP4 1200
ADDRLP4 1204
INDIRI4
ASGNI4
line 1630
;1629:
;1630:		unblockable = qtrue;
ADDRLP4 1156
CNSTI4 1
ASGNI4
line 1631
;1631:		self->client->ps.saberBlocked = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1633
;1632:
;1633:		if (!inBackAttack)
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $801
line 1634
;1634:		{
line 1635
;1635:			if (self->client->ps.saberMove == LS_A_JUMP_T__B_)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 15
NEI4 $803
line 1636
;1636:			{ //do extra damage for special unblockables
line 1637
;1637:				dmg += 5; //This is very tiny, because this move has a huge damage ramp
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 1638
;1638:			}
ADDRGP4 $804
JUMPV
LABELV $803
line 1639
;1639:			else if (self->client->ps.saberMove == LS_A_FLIP_STAB || self->client->ps.saberMove == LS_A_FLIP_SLASH)
ADDRLP4 1208
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 16
EQI4 $807
ADDRLP4 1208
INDIRI4
CNSTI4 17
NEI4 $805
LABELV $807
line 1640
;1640:			{
line 1641
;1641:				dmg += 5; //ditto
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 1642
;1642:				if (dmg <= 40 || G_GetAnimPoint(self) <= 0.4f)
ADDRLP4 1136
INDIRI4
CNSTI4 40
LEI4 $810
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 G_GetAnimPoint
CALLF4
ASGNF4
ADDRLP4 1212
INDIRF4
CNSTF4 1053609165
GTF4 $806
LABELV $810
line 1643
;1643:				{ //sort of a hack, don't want it doing big damage in the off points of the anim
line 1644
;1644:					dmg = 2;
ADDRLP4 1136
CNSTI4 2
ASGNI4
line 1645
;1645:				}
line 1646
;1646:			}
ADDRGP4 $806
JUMPV
LABELV $805
line 1647
;1647:			else if (self->client->ps.saberMove == LS_A_LUNGE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 14
NEI4 $811
line 1648
;1648:			{
line 1649
;1649:				dmg += 2; //and ditto again
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 1650
;1650:				if (G_GetAnimPoint(self) <= 0.4f)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 G_GetAnimPoint
CALLF4
ASGNF4
ADDRLP4 1212
INDIRF4
CNSTF4 1053609165
GTF4 $812
line 1651
;1651:				{ //same as above
line 1652
;1652:					dmg = 2;
ADDRLP4 1136
CNSTI4 2
ASGNI4
line 1653
;1653:				}
line 1654
;1654:			}
ADDRGP4 $812
JUMPV
LABELV $811
line 1656
;1655:			else
;1656:			{
line 1657
;1657:				dmg += 20;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1658
;1658:			}
LABELV $812
LABELV $806
LABELV $804
line 1659
;1659:		}
LABELV $801
line 1660
;1660:	}
LABELV $799
line 1662
;1661:
;1662:	if (!dmg)
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $815
line 1663
;1663:	{
line 1664
;1664:		if (tr.entityNum < MAX_CLIENTS ||
ADDRLP4 0+52
INDIRI4
CNSTI4 32
LTI4 $825
ADDRLP4 1200
CNSTI4 828
ASGNI4
ADDRLP4 1204
CNSTI4 0
ASGNI4
ADDRLP4 1200
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1204
INDIRI4
EQI4 $817
ADDRLP4 1200
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 1204
INDIRI4
EQI4 $817
LABELV $825
line 1666
;1665:			(g_entities[tr.entityNum].inuse && (g_entities[tr.entityNum].r.contents & CONTENTS_LIGHTSABER)))
;1666:		{
line 1667
;1667:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $691
JUMPV
LABELV $817
line 1669
;1668:		}
;1669:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $691
JUMPV
LABELV $815
line 1672
;1670:	}
;1671:
;1672:	if (dmg > SABER_NONATTACK_DAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $826
line 1673
;1673:	{
line 1674
;1674:		dmg *= g_saberDamageScale.value;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CVIF4 4
ADDRGP4 g_saberDamageScale+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1675
;1675:	}
LABELV $826
line 1677
;1676:
;1677:	if (dmg > SABER_NONATTACK_DAMAGE && self->client->ps.isJediMaster)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $829
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $829
line 1678
;1678:	{ //give the Jedi Master more saber attack power
line 1679
;1679:		dmg *= 2;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1680
;1680:	}
LABELV $829
line 1682
;1681:
;1682:	VectorSubtract(saberEnd, saberStart, dir);
ADDRLP4 1200
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1204
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1144
ADDRLP4 1200
INDIRP4
INDIRF4
ADDRLP4 1204
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1208
CNSTI4 4
ASGNI4
ADDRLP4 1144+4
ADDRLP4 1200
INDIRP4
ADDRLP4 1208
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1204
INDIRP4
ADDRLP4 1208
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1212
CNSTI4 8
ASGNI4
ADDRLP4 1144+8
ADDRFP4 8
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1683
;1683:	VectorNormalize(dir);
ADDRLP4 1144
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1689
;1684:
;1685:	//rww - I'm saying || tr.startsolid here, because otherwise your saber tends to skip positions and go through
;1686:	//people, and the compensation traces start in their bbox too. Which results in the saber passing through people
;1687:	//when you visually cut right through them. Which sucks.
;1688:
;1689:	if ((tr.fraction != 1 || tr.startsolid) &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $844
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $833
LABELV $844
ADDRLP4 1216
CNSTI4 828
ASGNI4
ADDRLP4 1220
CNSTI4 0
ASGNI4
ADDRLP4 1216
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+680
ADDP4
INDIRI4
ADDRLP4 1220
INDIRI4
EQI4 $833
ADDRLP4 1216
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 1220
INDIRI4
GTI4 $845
ADDRLP4 1216
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
ADDRLP4 1220
INDIRI4
NEI4 $833
LABELV $845
ADDRLP4 0+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $833
line 1693
;1690:		g_entities[tr.entityNum].takedamage &&
;1691:		(g_entities[tr.entityNum].health > 0 || !(g_entities[tr.entityNum].s.eFlags & EF_DISINTEGRATION)) &&
;1692:		tr.entityNum != self->s.number)
;1693:	{
line 1696
;1694:		gentity_t *te;
;1695:
;1696:		if (idleDamage &&
ADDRLP4 1172
INDIRI4
CNSTI4 0
EQI4 $846
ADDRLP4 1228
CNSTI4 828
ASGNI4
ADDRLP4 1228
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $846
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1228
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1232
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1236
CNSTI4 0
ASGNI4
ADDRLP4 1232
INDIRI4
ADDRLP4 1236
INDIRI4
EQI4 $846
ADDRGP4 g_friendlySaber+12
INDIRI4
ADDRLP4 1236
INDIRI4
NEI4 $846
line 1700
;1697:			g_entities[tr.entityNum].client &&
;1698:			OnSameTeam(self, &g_entities[tr.entityNum]) &&
;1699:			!g_friendlySaber.integer)
;1700:		{
line 1701
;1701:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $691
JUMPV
LABELV $846
line 1704
;1702:		}
;1703:
;1704:		if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client &&
ADDRLP4 1240
CNSTI4 828
ASGNI4
ADDRLP4 1244
CNSTI4 0
ASGNI4
ADDRLP4 1240
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1244
INDIRI4
EQI4 $852
ADDRLP4 1240
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $852
ADDRLP4 1240
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 1244
INDIRI4
EQI4 $852
ADDRLP4 1240
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $852
line 1707
;1705:			g_entities[tr.entityNum].client->ps.duelInProgress &&
;1706:			g_entities[tr.entityNum].client->ps.duelIndex != self->s.number)
;1707:		{
line 1708
;1708:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $691
JUMPV
LABELV $852
line 1711
;1709:		}
;1710:
;1711:		if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client &&
ADDRLP4 1248
CNSTI4 828
ASGNI4
ADDRLP4 1252
CNSTI4 0
ASGNI4
ADDRLP4 1248
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1252
INDIRI4
EQI4 $862
ADDRLP4 1248
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $862
ADDRLP4 1256
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1256
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 1252
INDIRI4
EQI4 $862
ADDRLP4 1256
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 1248
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
INDIRI4
EQI4 $862
line 1714
;1712:			self->client->ps.duelInProgress &&
;1713:			self->client->ps.duelIndex != g_entities[tr.entityNum].s.number)
;1714:		{
line 1715
;1715:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $691
JUMPV
LABELV $862
line 1718
;1716:		}
;1717:
;1718:		self->client->ps.saberIdleWound = level.time + g_saberDmgDelay_Idle.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_saberDmgDelay_Idle+12
INDIRI4
ADDI4
ASGNI4
line 1720
;1719:
;1720:		didHit = qtrue;
ADDRLP4 1160
CNSTI4 1
ASGNI4
line 1722
;1721:
;1722:		if (g_entities[tr.entityNum].client && !unblockable && WP_SaberCanBlock(&g_entities[tr.entityNum], tr.endpos, 0, MOD_SABER, qfalse, attackStr))
ADDRLP4 1260
CNSTI4 828
ASGNI4
ADDRLP4 1260
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $871
ADDRLP4 1264
CNSTI4 0
ASGNI4
ADDRLP4 1156
INDIRI4
ADDRLP4 1264
INDIRI4
NEI4 $871
ADDRLP4 1260
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1264
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1264
INDIRI4
ARGI4
ADDRLP4 1168
INDIRI4
ARGI4
ADDRLP4 1268
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1268
INDIRI4
CNSTI4 0
EQI4 $871
line 1723
;1723:		{
line 1724
;1724:			te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 0+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1272
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1224
ADDRLP4 1272
INDIRP4
ASGNP4
line 1725
;1725:			if (dmg <= SABER_NONATTACK_DAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 1
GTI4 $878
line 1726
;1726:			{
line 1727
;1727:				self->client->ps.saberIdleWound = level.time + g_saberDmgDelay_Idle.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_saberDmgDelay_Idle+12
INDIRI4
ADDI4
ASGNI4
line 1728
;1728:			}
LABELV $878
line 1729
;1729:			VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1224
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1730
;1730:			VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1224
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 1731
;1731:			te->s.eventParm = 1;
ADDRLP4 1224
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1733
;1732:
;1733:			if (dmg > SABER_NONATTACK_DAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $884
line 1734
;1734:			{
line 1735
;1735:				int lockFactor = g_saberLockFactor.integer;
ADDRLP4 1276
ADDRGP4 g_saberLockFactor+12
INDIRI4
ASGNI4
line 1737
;1736:
;1737:				if ((g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK] - self->client->ps.fd.forcePowerLevel[FP_SABERATTACK]) > 1 &&
ADDRLP4 1280
CNSTI4 1004
ASGNI4
ADDRLP4 1284
CNSTI4 1
ASGNI4
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
INDIRI4
SUBI4
ADDRLP4 1284
INDIRI4
LEI4 $887
ADDRLP4 1284
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1288
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
ADDRLP4 1276
INDIRI4
CNSTI4 1
LSHI4
GEI4 $887
line 1739
;1738:					Q_irand(1, 10) < lockFactor*2)
;1739:				{ //Just got blocked by someone with a decently higher attack level, so enter into a lock (where they have the advantage due to a higher attack lev)
line 1740
;1740:					if (!G_ClientIdleInWorld(&g_entities[tr.entityNum]))
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1292
ADDRGP4 G_ClientIdleInWorld
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
CNSTI4 0
NEI4 $888
line 1741
;1741:					{
line 1742
;1742:						if (WP_SabersCheckLock(self, &g_entities[tr.entityNum]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1296
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $888
line 1743
;1743:						{	
line 1744
;1744:							self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1745
;1745:							g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_NONE;
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1746
;1746:							return didHit;
ADDRLP4 1160
INDIRI4
RETI4
ADDRGP4 $691
JUMPV
line 1748
;1747:						}
;1748:					}
line 1749
;1749:				}
LABELV $887
line 1750
;1750:				else if (Q_irand(1, 20) < lockFactor)
CNSTI4 1
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 1292
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
ADDRLP4 1276
INDIRI4
GEI4 $899
line 1751
;1751:				{
line 1752
;1752:					if (!G_ClientIdleInWorld(&g_entities[tr.entityNum]))
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1296
ADDRGP4 G_ClientIdleInWorld
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 0
NEI4 $901
line 1753
;1753:					{
line 1754
;1754:						if (WP_SabersCheckLock(self, &g_entities[tr.entityNum]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1300
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 0
EQI4 $904
line 1755
;1755:						{	
line 1756
;1756:							self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1757
;1757:							g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_NONE;
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1758
;1758:							return didHit;
ADDRLP4 1160
INDIRI4
RETI4
ADDRGP4 $691
JUMPV
LABELV $904
line 1760
;1759:						}
;1760:					}
LABELV $901
line 1761
;1761:				}
LABELV $899
LABELV $888
line 1762
;1762:			}
LABELV $884
line 1763
;1763:			otherOwner = &g_entities[tr.entityNum];
ADDRLP4 1132
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1764
;1764:			goto blockStuff;
ADDRGP4 $910
JUMPV
LABELV $871
line 1767
;1765:		}
;1766:		else
;1767:		{
line 1768
;1768:			if (g_entities[tr.entityNum].client && g_entities[tr.entityNum].client->ps.usingATST)
ADDRLP4 1272
CNSTI4 828
ASGNI4
ADDRLP4 1272
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $911
ADDRLP4 1272
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $911
line 1769
;1769:			{
line 1770
;1770:				dmg *= 0.1;
ADDRLP4 1136
CNSTF4 1036831949
ADDRLP4 1136
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1771
;1771:			}
LABELV $911
line 1773
;1772:
;1773:			if (g_entities[tr.entityNum].client && !g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 1276
CNSTI4 828
ASGNI4
ADDRLP4 1276
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $917
ADDRLP4 1276
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 0
NEI4 $917
line 1774
;1774:			{ //not a "jedi", so make them suffer more
line 1775
;1775:				if (dmg > SABER_NONATTACK_DAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $923
line 1776
;1776:				{ //don't bother increasing just for idle touch damage
line 1777
;1777:					dmg *= 1.5;
ADDRLP4 1136
CNSTF4 1069547520
ADDRLP4 1136
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1778
;1778:				}
LABELV $923
line 1779
;1779:			}
LABELV $917
line 1781
;1780:
;1781:			if (g_entities[tr.entityNum].client && g_entities[tr.entityNum].client->ps.weapon == WP_SABER)
ADDRLP4 1280
CNSTI4 828
ASGNI4
ADDRLP4 1280
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $925
ADDRLP4 1280
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $925
line 1782
;1782:			{ //for jedi using the saber, half the damage (this comes with the increased default dmg debounce time)
line 1783
;1783:				if (dmg > SABER_NONATTACK_DAMAGE && !unblockable)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $931
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $931
line 1784
;1784:				{ //don't reduce damage if it's only 1, or if this is an unblockable attack
line 1785
;1785:					if (dmg == SABER_HITDAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 35
NEI4 $933
line 1786
;1786:					{ //level 1 attack
line 1787
;1787:						dmg *= 0.7;
ADDRLP4 1136
CNSTF4 1060320051
ADDRLP4 1136
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1788
;1788:					}
ADDRGP4 $934
JUMPV
LABELV $933
line 1790
;1789:					else
;1790:					{
line 1791
;1791:						dmg *= 0.5;
ADDRLP4 1136
CNSTF4 1056964608
ADDRLP4 1136
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1792
;1792:					}
LABELV $934
line 1793
;1793:				}
LABELV $931
line 1794
;1794:			}
LABELV $925
line 1796
;1795:
;1796:			G_Damage(&g_entities[tr.entityNum], self, self, dir, tr.endpos, dmg, 0, MOD_SABER);
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1144
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1136
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1798
;1797:
;1798:			te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 0+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1288
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1224
ADDRLP4 1288
INDIRP4
ASGNP4
line 1800
;1799:
;1800:			VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1224
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1801
;1801:			VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1224
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 1803
;1802:			
;1803:			if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1292
ADDRLP4 1224
INDIRP4
ASGNP4
ADDRLP4 1296
CNSTF4 0
ASGNF4
ADDRLP4 1292
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1296
INDIRF4
NEF4 $940
ADDRLP4 1292
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1296
INDIRF4
NEF4 $940
ADDRLP4 1292
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1296
INDIRF4
NEF4 $940
line 1804
;1804:			{ //don't let it play with no direction
line 1805
;1805:				te->s.angles[1] = 1;
ADDRLP4 1224
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 1806
;1806:			}
LABELV $940
line 1808
;1807:
;1808:			if (g_entities[tr.entityNum].client)
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $942
line 1809
;1809:			{
line 1810
;1810:				te->s.eventParm = 1;
ADDRLP4 1224
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1811
;1811:			}
ADDRGP4 $943
JUMPV
LABELV $942
line 1813
;1812:			else
;1813:			{
line 1814
;1814:				te->s.eventParm = 0;
ADDRLP4 1224
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 1815
;1815:			}
LABELV $943
line 1817
;1816:
;1817:			self->client->ps.saberAttackWound = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1818
;1818:		}
line 1819
;1819:	}
ADDRGP4 $834
JUMPV
LABELV $833
line 1820
;1820:	else if ((tr.fraction != 1 || tr.startsolid) &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $957
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $947
LABELV $957
ADDRLP4 1224
CNSTI4 828
ASGNI4
ADDRLP4 1224
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $947
ADDRLP4 1224
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $947
line 1823
;1821:		(g_entities[tr.entityNum].r.contents & CONTENTS_LIGHTSABER) &&
;1822:		g_entities[tr.entityNum].r.contents != -1)
;1823:	{ //saber clash
line 1825
;1824:		gentity_t *te;
;1825:		otherOwner = &g_entities[g_entities[tr.entityNum].r.ownerNum];
ADDRLP4 1232
CNSTI4 828
ASGNI4
ADDRLP4 1132
ADDRLP4 1232
INDIRI4
ADDRLP4 1232
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+100
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1827
;1826:
;1827:		if (otherOwner &&
ADDRLP4 1240
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1240
INDIRU4
EQU4 $961
ADDRLP4 1132
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $961
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1240
INDIRU4
EQU4 $961
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1244
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1248
CNSTI4 0
ASGNI4
ADDRLP4 1244
INDIRI4
ADDRLP4 1248
INDIRI4
EQI4 $961
ADDRGP4 g_friendlySaber+12
INDIRI4
ADDRLP4 1248
INDIRI4
NEI4 $961
line 1832
;1828:			otherOwner->inuse &&
;1829:			otherOwner->client &&
;1830:			OnSameTeam(self, otherOwner) &&
;1831:			!g_friendlySaber.integer)
;1832:		{
line 1833
;1833:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $691
JUMPV
LABELV $961
line 1836
;1834:		}
;1835:
;1836:		if (otherOwner && otherOwner->client &&
ADDRLP4 1256
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1256
INDIRU4
EQU4 $964
ADDRLP4 1260
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
CVPU4 4
ADDRLP4 1256
INDIRU4
EQU4 $964
ADDRLP4 1260
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $964
ADDRLP4 1260
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $964
line 1839
;1837:			otherOwner->client->ps.duelInProgress &&
;1838:			otherOwner->client->ps.duelIndex != self->s.number)
;1839:		{
line 1840
;1840:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $691
JUMPV
LABELV $964
line 1843
;1841:		}
;1842:
;1843:		if (otherOwner && otherOwner->client &&
ADDRLP4 1268
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1268
INDIRU4
EQU4 $966
ADDRLP4 1272
CNSTI4 408
ASGNI4
ADDRLP4 1132
INDIRP4
ADDRLP4 1272
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1268
INDIRU4
EQU4 $966
ADDRLP4 1276
ADDRFP4 0
INDIRP4
ADDRLP4 1272
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1276
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $966
ADDRLP4 1276
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 1132
INDIRP4
INDIRI4
EQI4 $966
line 1846
;1844:			self->client->ps.duelInProgress &&
;1845:			self->client->ps.duelIndex != otherOwner->s.number)
;1846:		{
line 1847
;1847:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $691
JUMPV
LABELV $966
line 1850
;1848:		}
;1849:
;1850:		didHit = qtrue;
ADDRLP4 1160
CNSTI4 1
ASGNI4
line 1851
;1851:		self->client->ps.saberIdleWound = level.time + g_saberDmgDelay_Idle.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_saberDmgDelay_Idle+12
INDIRI4
ADDI4
ASGNI4
line 1853
;1852:
;1853:		te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 0+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1280
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1228
ADDRLP4 1280
INDIRP4
ASGNP4
line 1854
;1854:		if (dmg <= SABER_NONATTACK_DAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 1
GTI4 $971
line 1855
;1855:		{
line 1856
;1856:			self->client->ps.saberIdleWound = level.time + g_saberDmgDelay_Idle.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_saberDmgDelay_Idle+12
INDIRI4
ADDI4
ASGNI4
line 1857
;1857:		}
LABELV $971
line 1859
;1858:
;1859:		VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1228
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1860
;1860:		VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1228
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 1861
;1861:		te->s.eventParm = 1;
ADDRLP4 1228
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1863
;1862:
;1863:		sabersClashed = qtrue;
ADDRLP4 1176
CNSTI4 1
ASGNI4
LABELV $910
line 1866
;1864:
;1865:blockStuff:
;1866:		otherUnblockable = qfalse;
ADDRLP4 1164
CNSTI4 0
ASGNI4
line 1868
;1867:
;1868:		if (otherOwner && otherOwner->client && otherOwner->client->ps.saberInFlight)
ADDRLP4 1288
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1288
INDIRU4
EQU4 $977
ADDRLP4 1292
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1292
INDIRP4
CVPU4 4
ADDRLP4 1288
INDIRU4
EQU4 $977
ADDRLP4 1292
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $977
line 1869
;1869:		{
line 1870
;1870:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $691
JUMPV
LABELV $977
line 1873
;1871:		}
;1872:
;1873:		if (dmg > SABER_NONATTACK_DAMAGE && !unblockable && !otherUnblockable)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $979
ADDRLP4 1296
CNSTI4 0
ASGNI4
ADDRLP4 1156
INDIRI4
ADDRLP4 1296
INDIRI4
NEI4 $979
ADDRLP4 1164
INDIRI4
ADDRLP4 1296
INDIRI4
NEI4 $979
line 1874
;1874:		{
line 1875
;1875:			int lockFactor = g_saberLockFactor.integer;
ADDRLP4 1300
ADDRGP4 g_saberLockFactor+12
INDIRI4
ASGNI4
line 1877
;1876:
;1877:			if (sabersClashed && Q_irand(1, 20) <= lockFactor)
ADDRLP4 1176
INDIRI4
CNSTI4 0
EQI4 $982
CNSTI4 1
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 1304
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1304
INDIRI4
ADDRLP4 1300
INDIRI4
GTI4 $982
line 1878
;1878:			{
line 1879
;1879:				if (!G_ClientIdleInWorld(otherOwner))
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1308
ADDRGP4 G_ClientIdleInWorld
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 0
NEI4 $984
line 1880
;1880:				{
line 1881
;1881:					if (WP_SabersCheckLock(self, otherOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1312
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1312
INDIRI4
CNSTI4 0
EQI4 $986
line 1882
;1882:					{
line 1883
;1883:						self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1884
;1884:						otherOwner->client->ps.saberBlocked = BLOCKED_NONE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1885
;1885:						return didHit;
ADDRLP4 1160
INDIRI4
RETI4
ADDRGP4 $691
JUMPV
LABELV $986
line 1887
;1886:					}
;1887:				}
LABELV $984
line 1888
;1888:			}
LABELV $982
line 1889
;1889:		}
LABELV $979
line 1891
;1890:
;1891:		if (!otherOwner || !otherOwner->client)
ADDRLP4 1304
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1304
INDIRU4
EQU4 $990
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1304
INDIRU4
NEU4 $988
LABELV $990
line 1892
;1892:		{
line 1893
;1893:			return didHit;
ADDRLP4 1160
INDIRI4
RETI4
ADDRGP4 $691
JUMPV
LABELV $988
line 1896
;1894:		}
;1895:
;1896:		if (BG_SaberInSpecial(otherOwner->client->ps.saberMove))
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1308
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 0
EQI4 $991
line 1897
;1897:		{
line 1898
;1898:			otherUnblockable = qtrue;
ADDRLP4 1164
CNSTI4 1
ASGNI4
line 1899
;1899:			otherOwner->client->ps.saberBlocked = 0;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1900
;1900:		}
LABELV $991
line 1902
;1901:
;1902:		if ( sabersClashed &&
ADDRLP4 1176
INDIRI4
CNSTI4 0
EQI4 $993
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $993
ADDRLP4 1312
CNSTI4 408
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1312
INDIRI4
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
GEI4 $993
ADDRLP4 1132
INDIRP4
ADDRLP4 1312
INDIRI4
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1316
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1316
INDIRI4
CNSTI4 0
NEI4 $993
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1320
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
CNSTI4 0
NEI4 $993
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1324
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
NEI4 $993
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1328
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 0
NEI4 $993
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1332
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
NEI4 $993
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1336
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1336
INDIRI4
CNSTI4 0
NEI4 $993
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1340
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1344
CNSTI4 0
ASGNI4
ADDRLP4 1340
INDIRI4
ADDRLP4 1344
INDIRI4
NEI4 $993
ADDRLP4 1156
INDIRI4
ADDRLP4 1344
INDIRI4
NEI4 $993
line 1913
;1903:			dmg > SABER_NONATTACK_DAMAGE &&
;1904:			 self->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3 &&
;1905:			 !PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;1906:			 !PM_SaberInParry(self->client->ps.saberMove) &&
;1907:			 !PM_SaberInBrokenParry(self->client->ps.saberMove) &&
;1908:			 !BG_SaberInSpecial(self->client->ps.saberMove) &&
;1909:			 !PM_SaberInBounce(self->client->ps.saberMove) &&
;1910:			 !PM_SaberInDeflect(self->client->ps.saberMove) &&
;1911:			 !PM_SaberInReflect(self->client->ps.saberMove) &&
;1912:			 !unblockable )
;1913:		{
line 1915
;1914:			//if (Q_irand(1, 10) <= 6)
;1915:			if (1) //for now, just always try a deflect. (deflect func can cause bounces too)
line 1916
;1916:			{
line 1917
;1917:				if (!WP_GetSaberDeflectionAngle(self, otherOwner, tr.fraction))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 1348
ADDRGP4 WP_GetSaberDeflectionAngle
CALLI4
ASGNI4
ADDRLP4 1348
INDIRI4
CNSTI4 0
NEI4 $997
line 1918
;1918:				{
line 1919
;1919:					tryDeflectAgain = qtrue; //Failed the deflect, try it again if we can if the guy we're smashing goes into a parry and we don't break it
ADDRLP4 1184
CNSTI4 1
ASGNI4
line 1920
;1920:				}
ADDRGP4 $996
JUMPV
LABELV $997
line 1922
;1921:				else
;1922:				{
line 1923
;1923:					self->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1924
;1924:					didOffense = qtrue;
ADDRLP4 1180
CNSTI4 1
ASGNI4
line 1925
;1925:				}
line 1926
;1926:			}
ADDRGP4 $996
JUMPV
LABELV $995
line 1928
;1927:			else
;1928:			{
line 1929
;1929:				self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1930
;1930:				didOffense = qtrue;
ADDRLP4 1180
CNSTI4 1
ASGNI4
line 1932
;1931:
;1932:				if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1000
line 1933
;1933:				{
line 1934
;1934:					Com_Printf("Client %i clashed into client %i's saber, did BLOCKED_ATK_BOUNCE\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1003
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1935
;1935:				}
LABELV $1000
line 1936
;1936:			}
LABELV $996
line 1937
;1937:		}
LABELV $993
line 1939
;1938:
;1939:		if ( ((self->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3 && ((tryDeflectAgain && Q_irand(1, 10) <= 3) || (!tryDeflectAgain && Q_irand(1, 10) <= 7))) || (Q_irand(1, 10) <= 1 && otherOwner->client->ps.fd.saberAnimLevel >= FORCE_LEVEL_3))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
GEI4 $1009
ADDRLP4 1184
INDIRI4
CNSTI4 0
EQI4 $1008
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1348
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1348
INDIRI4
CNSTI4 3
LEI4 $1006
LABELV $1008
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1009
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1352
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1352
INDIRI4
CNSTI4 7
LEI4 $1006
LABELV $1009
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1356
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1356
INDIRI4
CNSTI4 1
GTI4 $1004
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1004
LABELV $1006
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1360
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1360
INDIRI4
CNSTI4 0
NEI4 $1004
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1364
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1364
INDIRI4
CNSTI4 0
NEI4 $1004
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1368
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1368
INDIRI4
CNSTI4 0
NEI4 $1004
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1372
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1372
INDIRI4
CNSTI4 0
NEI4 $1004
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1376
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1376
INDIRI4
CNSTI4 0
NEI4 $1004
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1380
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1384
CNSTI4 0
ASGNI4
ADDRLP4 1380
INDIRI4
ADDRLP4 1384
INDIRI4
NEI4 $1004
ADDRLP4 1388
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1392
ADDRLP4 1388
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1392
INDIRI4
CNSTI4 2
GTI4 $1010
ADDRLP4 1388
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1004
ADDRLP4 1384
INDIRI4
ARGI4
ADDRLP4 1392
INDIRI4
ARGI4
ADDRLP4 1396
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1396
INDIRI4
CNSTI4 0
EQI4 $1004
LABELV $1010
ADDRLP4 1400
CNSTI4 0
ASGNI4
ADDRLP4 1156
INDIRI4
ADDRLP4 1400
INDIRI4
NEI4 $1004
ADDRLP4 1164
INDIRI4
ADDRLP4 1400
INDIRI4
NEI4 $1004
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1004
ADDRLP4 1180
INDIRI4
ADDRLP4 1400
INDIRI4
NEI4 $1004
line 1953
;1940:			&& !PM_SaberInBounce(self->client->ps.saberMove)
;1941:
;1942:			&& !PM_SaberInBrokenParry(otherOwner->client->ps.saberMove)
;1943:			&& !BG_SaberInSpecial(otherOwner->client->ps.saberMove)
;1944:			&& !PM_SaberInBounce(otherOwner->client->ps.saberMove)
;1945:			&& !PM_SaberInDeflect(otherOwner->client->ps.saberMove)
;1946:			&& !PM_SaberInReflect(otherOwner->client->ps.saberMove)
;1947:
;1948:			&& (otherOwner->client->ps.fd.saberAnimLevel > FORCE_LEVEL_2 || ( otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= 3 && Q_irand(0, otherOwner->client->ps.fd.saberAnimLevel) )) 
;1949:			&& !unblockable
;1950:			&& !otherUnblockable
;1951:			&& dmg > SABER_NONATTACK_DAMAGE
;1952:			&& !didOffense) //don't allow the person we're attacking to do this if we're making an unblockable attack
;1953:		{//knockaways can make fast-attacker go into a broken parry anim if the ent is using fast or med. In MP, we also randomly decide this for level 3 attacks.
line 1956
;1954:			//Going to go ahead and let idle damage do simple knockaways. Looks sort of good that way.
;1955:			//turn the parry into a knockaway
;1956:			if (!PM_SaberInParry(otherOwner->client->ps.saberMove))
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1404
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1404
INDIRI4
CNSTI4 0
NEI4 $1011
line 1957
;1957:			{
line 1958
;1958:				WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 1959
;1959:				otherOwner->client->ps.saberMove = BG_KnockawayForParry( otherOwner->client->ps.saberBlocked );
ADDRLP4 1408
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1408
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1412
ADDRGP4 BG_KnockawayForParry
CALLI4
ASGNI4
ADDRLP4 1408
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 1412
INDIRI4
ASGNI4
line 1960
;1960:				otherOwner->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1961
;1961:			}
ADDRGP4 $1012
JUMPV
LABELV $1011
line 1963
;1962:			else
;1963:			{
line 1964
;1964:				otherOwner->client->ps.saberMove = G_KnockawayForParry(otherOwner->client->ps.saberMove); //BG_KnockawayForParry( otherOwner->client->ps.saberBlocked );
ADDRLP4 1408
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 1408
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1412
ADDRGP4 G_KnockawayForParry
CALLI4
ASGNI4
ADDRLP4 1408
INDIRP4
ADDRLP4 1412
INDIRI4
ASGNI4
line 1965
;1965:				otherOwner->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1966
;1966:			}
LABELV $1012
line 1969
;1967:	
;1968:			//make them (me) go into a broken parry
;1969:			self->client->ps.saberMove = BG_BrokenParryForAttack( self->client->ps.saberMove );
ADDRLP4 1408
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 1408
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1412
ADDRGP4 BG_BrokenParryForAttack
CALLI4
ASGNI4
ADDRLP4 1408
INDIRP4
ADDRLP4 1412
INDIRI4
ASGNI4
line 1970
;1970:			self->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1972
;1971:
;1972:			if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1014
line 1973
;1973:			{
line 1974
;1974:				Com_Printf("Client %i sent client %i into a reflected attack with a knockaway\n", otherOwner->s.number, self->s.number);
ADDRGP4 $1017
ARGP4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1975
;1975:			}
LABELV $1014
line 1977
;1976:
;1977:			didDefense = qtrue;
ADDRLP4 1188
CNSTI4 1
ASGNI4
line 1978
;1978:		}
ADDRGP4 $1005
JUMPV
LABELV $1004
line 1979
;1979:		else if ((self->client->ps.fd.saberAnimLevel > FORCE_LEVEL_2 || unblockable) && //if we're doing a special attack, we can send them into a broken parry too (MP only)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
GTI4 $1020
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $1018
LABELV $1020
ADDRLP4 1404
CNSTI4 408
ASGNI4
ADDRLP4 1408
ADDRLP4 1132
INDIRP4
ADDRLP4 1404
INDIRI4
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1412
ADDRFP4 0
INDIRP4
ADDRLP4 1404
INDIRI4
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1408
INDIRI4
ADDRLP4 1412
INDIRI4
LTI4 $1022
ADDRLP4 1408
INDIRI4
ADDRLP4 1412
INDIRI4
NEI4 $1018
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1416
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1416
INDIRI4
CVIF4 4
CNSTF4 1069547520
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CVIF4 4
MULF4
GEF4 $1022
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $1018
LABELV $1022
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1420
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1420
INDIRI4
CNSTI4 0
EQI4 $1018
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1424
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1424
INDIRI4
CNSTI4 0
NEI4 $1018
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1428
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1428
INDIRI4
CNSTI4 0
NEI4 $1018
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1432
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1432
INDIRI4
CNSTI4 0
NEI4 $1018
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1436
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1440
CNSTI4 0
ASGNI4
ADDRLP4 1436
INDIRI4
ADDRLP4 1440
INDIRI4
NEI4 $1018
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1018
ADDRLP4 1180
INDIRI4
ADDRLP4 1440
INDIRI4
NEI4 $1018
ADDRLP4 1164
INDIRI4
ADDRLP4 1440
INDIRI4
NEI4 $1018
line 1989
;1980:				 ( otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] < self->client->ps.fd.saberAnimLevel || (otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == self->client->ps.fd.saberAnimLevel && (Q_irand(1, 10) >= otherOwner->client->ps.fd.saberAnimLevel*1.5 || unblockable)) ) &&
;1981:				 PM_SaberInParry(otherOwner->client->ps.saberMove) &&
;1982:				 !PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;1983:				 !PM_SaberInParry(self->client->ps.saberMove) &&
;1984:				 !PM_SaberInBrokenParry(self->client->ps.saberMove) &&
;1985:				 !PM_SaberInBounce(self->client->ps.saberMove) &&
;1986:				 dmg > SABER_NONATTACK_DAMAGE &&
;1987:				 !didOffense &&
;1988:				 !otherUnblockable)
;1989:		{ //they are in a parry, and we are slamming down on them with a move of equal or greater force than their defense, so send them into a broken parry.. unless they are already in one.
line 1990
;1990:			if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1023
line 1991
;1991:			{
line 1992
;1992:				Com_Printf("Client %i sent client %i into a broken parry\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1026
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1993
;1993:			}
LABELV $1023
line 1995
;1994:
;1995:			otherOwner->client->ps.saberMove = BG_BrokenParryForParry( otherOwner->client->ps.saberMove );
ADDRLP4 1444
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 1444
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 BG_BrokenParryForParry
CALLI4
ASGNI4
ADDRLP4 1444
INDIRP4
ADDRLP4 1448
INDIRI4
ASGNI4
line 1996
;1996:			otherOwner->client->ps.saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 1998
;1997:
;1998:			didDefense = qtrue;
ADDRLP4 1188
CNSTI4 1
ASGNI4
line 1999
;1999:		}
ADDRGP4 $1019
JUMPV
LABELV $1018
line 2000
;2000:		else if ((self->client->ps.fd.saberAnimLevel > FORCE_LEVEL_2) && //if we're doing a special attack, we can send them into a broken parry too (MP only)
ADDRLP4 1444
CNSTI4 408
ASGNI4
ADDRLP4 1448
CNSTI4 1228
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1444
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1448
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LEI4 $1027
ADDRLP4 1452
ADDRLP4 1132
INDIRP4
ADDRLP4 1444
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1452
INDIRP4
ADDRLP4 1448
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1027
ADDRLP4 1452
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1456
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1456
INDIRI4
CNSTI4 0
EQI4 $1027
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1460
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1460
INDIRI4
CNSTI4 0
NEI4 $1027
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1464
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1464
INDIRI4
CNSTI4 0
NEI4 $1027
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1468
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1468
INDIRI4
CNSTI4 0
NEI4 $1027
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1472
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1472
INDIRI4
CNSTI4 0
NEI4 $1027
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1476
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1476
INDIRI4
CNSTI4 0
NEI4 $1027
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1480
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1484
CNSTI4 0
ASGNI4
ADDRLP4 1480
INDIRI4
ADDRLP4 1484
INDIRI4
NEI4 $1027
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1027
ADDRLP4 1180
INDIRI4
ADDRLP4 1484
INDIRI4
NEI4 $1027
ADDRLP4 1156
INDIRI4
ADDRLP4 1484
INDIRI4
NEI4 $1027
line 2013
;2001:				 //( otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] < self->client->ps.fd.saberAnimLevel || (otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == self->client->ps.fd.saberAnimLevel && (Q_irand(1, 10) >= otherOwner->client->ps.fd.saberAnimLevel*3 || unblockable)) ) &&
;2002:				 otherOwner->client->ps.fd.saberAnimLevel >= FORCE_LEVEL_3 &&
;2003:				 PM_SaberInParry(otherOwner->client->ps.saberMove) &&
;2004:				 !PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;2005:				 !PM_SaberInParry(self->client->ps.saberMove) &&
;2006:				 !PM_SaberInBrokenParry(self->client->ps.saberMove) &&
;2007:				 !PM_SaberInBounce(self->client->ps.saberMove) &&
;2008:				 !PM_SaberInDeflect(self->client->ps.saberMove) &&
;2009:				 !PM_SaberInReflect(self->client->ps.saberMove) &&
;2010:				 dmg > SABER_NONATTACK_DAMAGE &&
;2011:				 !didOffense &&
;2012:				 !unblockable)
;2013:		{ //they are in a parry, and we are slamming down on them with a move of equal or greater force than their defense, so send them into a broken parry.. unless they are already in one.
line 2014
;2014:			if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1029
line 2015
;2015:			{
line 2016
;2016:				Com_Printf("Client %i bounced off of client %i's saber\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1032
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2017
;2017:			}
LABELV $1029
line 2019
;2018:
;2019:			if (!tryDeflectAgain)
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1033
line 2020
;2020:			{
line 2021
;2021:				if (!WP_GetSaberDeflectionAngle(self, otherOwner, tr.fraction))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 1488
ADDRGP4 WP_GetSaberDeflectionAngle
CALLI4
ASGNI4
ADDRLP4 1488
INDIRI4
CNSTI4 0
NEI4 $1035
line 2022
;2022:				{
line 2023
;2023:					tryDeflectAgain = qtrue;
ADDRLP4 1184
CNSTI4 1
ASGNI4
line 2024
;2024:				}
LABELV $1035
line 2025
;2025:			}
LABELV $1033
line 2027
;2026:
;2027:			didOffense = qtrue;
ADDRLP4 1180
CNSTI4 1
ASGNI4
line 2028
;2028:		}
ADDRGP4 $1028
JUMPV
LABELV $1027
line 2029
;2029:		else if (SaberAttacking(otherOwner) && dmg > SABER_NONATTACK_DAMAGE && !BG_SaberInSpecial(otherOwner->client->ps.saberMove) && !didOffense && !otherUnblockable)
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1488
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 1488
INDIRI4
CNSTI4 0
EQI4 $1038
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1038
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1492
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1496
CNSTI4 0
ASGNI4
ADDRLP4 1492
INDIRI4
ADDRLP4 1496
INDIRI4
NEI4 $1038
ADDRLP4 1180
INDIRI4
ADDRLP4 1496
INDIRI4
NEI4 $1038
ADDRLP4 1164
INDIRI4
ADDRLP4 1496
INDIRI4
NEI4 $1038
line 2030
;2030:		{ //they were attacking and our saber hit their saber, make them bounce. But if they're in a special attack, leave them.
line 2031
;2031:			if (!PM_SaberInBounce(self->client->ps.saberMove) &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1500
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1500
INDIRI4
CNSTI4 0
NEI4 $1040
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1504
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1504
INDIRI4
CNSTI4 0
NEI4 $1040
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1508
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1508
INDIRI4
CNSTI4 0
NEI4 $1040
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1512
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1512
INDIRI4
CNSTI4 0
NEI4 $1040
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1516
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1516
INDIRI4
CNSTI4 0
NEI4 $1040
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1520
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1520
INDIRI4
CNSTI4 0
NEI4 $1040
line 2038
;2032:				!PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;2033:				!PM_SaberInDeflect(self->client->ps.saberMove) &&
;2034:				!PM_SaberInDeflect(otherOwner->client->ps.saberMove) &&
;2035:
;2036:				!PM_SaberInReflect(self->client->ps.saberMove) &&
;2037:				!PM_SaberInReflect(otherOwner->client->ps.saberMove))
;2038:			{
line 2039
;2039:				if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1042
line 2040
;2040:				{
line 2041
;2041:					Com_Printf("Client %i and client %i bounced off of each other's sabers\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1045
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2042
;2042:				}
LABELV $1042
line 2044
;2043:
;2044:				self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2045
;2045:				otherOwner->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2047
;2046:
;2047:				didOffense = qtrue;
ADDRLP4 1180
CNSTI4 1
ASGNI4
line 2048
;2048:			}
LABELV $1040
line 2049
;2049:		}
LABELV $1038
LABELV $1028
LABELV $1019
LABELV $1005
line 2052
;2050:		
;2051:#ifdef G2_COLLISION_ENABLED
;2052:		if (g_saberGhoul2Collision.integer && !didDefense && dmg <= SABER_NONATTACK_DAMAGE && !otherUnblockable) //with perpoly, it looks pretty weird to have clash flares coming off the guy's face and whatnot
ADDRLP4 1500
CNSTI4 0
ASGNI4
ADDRGP4 g_saberGhoul2Collision+12
INDIRI4
ADDRLP4 1500
INDIRI4
EQI4 $1046
ADDRLP4 1188
INDIRI4
ADDRLP4 1500
INDIRI4
NEI4 $1046
ADDRLP4 1136
INDIRI4
CNSTI4 1
GTI4 $1046
ADDRLP4 1164
INDIRI4
ADDRLP4 1500
INDIRI4
NEI4 $1046
line 2053
;2053:		{
line 2054
;2054:			if (!PM_SaberInParry(otherOwner->client->ps.saberMove) &&
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1504
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1504
INDIRI4
CNSTI4 0
NEI4 $1047
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1508
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1508
INDIRI4
CNSTI4 0
NEI4 $1047
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1512
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1512
INDIRI4
CNSTI4 0
NEI4 $1047
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1516
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1516
INDIRI4
CNSTI4 0
NEI4 $1047
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1520
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1520
INDIRI4
CNSTI4 0
NEI4 $1047
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1524
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1524
INDIRI4
CNSTI4 0
NEI4 $1047
line 2060
;2055:				!PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;2056:				!BG_SaberInSpecial(otherOwner->client->ps.saberMove) &&
;2057:				!PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;2058:				!PM_SaberInDeflect(otherOwner->client->ps.saberMove) &&
;2059:				!PM_SaberInReflect(otherOwner->client->ps.saberMove))
;2060:			{
line 2061
;2061:				WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 2062
;2062:			}
line 2063
;2063:		}
ADDRGP4 $1047
JUMPV
LABELV $1046
line 2066
;2064:		else 
;2065:#endif
;2066:		if (!didDefense && dmg > SABER_NONATTACK_DAMAGE && !otherUnblockable) //if not more than idle damage, don't even bother blocking.
ADDRLP4 1504
CNSTI4 0
ASGNI4
ADDRLP4 1188
INDIRI4
ADDRLP4 1504
INDIRI4
NEI4 $1052
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1052
ADDRLP4 1164
INDIRI4
ADDRLP4 1504
INDIRI4
NEI4 $1052
line 2067
;2067:		{ //block
line 2068
;2068:			if (!PM_SaberInParry(otherOwner->client->ps.saberMove) &&
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1508
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1508
INDIRI4
CNSTI4 0
NEI4 $1054
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1512
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1512
INDIRI4
CNSTI4 0
NEI4 $1054
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1516
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1516
INDIRI4
CNSTI4 0
NEI4 $1054
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1520
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1520
INDIRI4
CNSTI4 0
NEI4 $1054
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1524
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1524
INDIRI4
CNSTI4 0
NEI4 $1054
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1528
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1528
INDIRI4
CNSTI4 0
NEI4 $1054
line 2074
;2069:				!PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;2070:				!BG_SaberInSpecial(otherOwner->client->ps.saberMove) &&
;2071:				!PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;2072:				!PM_SaberInDeflect(otherOwner->client->ps.saberMove) &&
;2073:				!PM_SaberInReflect(otherOwner->client->ps.saberMove))
;2074:			{
line 2075
;2075:				qboolean crushTheParry = qfalse;
ADDRLP4 1532
CNSTI4 0
ASGNI4
line 2077
;2076:
;2077:				if (unblockable)
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $1056
line 2078
;2078:				{ //It's unblockable. So send us into a broken parry immediately.
line 2079
;2079:					crushTheParry = qtrue;
ADDRLP4 1532
CNSTI4 1
ASGNI4
line 2080
;2080:				}
LABELV $1056
line 2082
;2081:
;2082:				if (!SaberAttacking(otherOwner))
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1536
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 1536
INDIRI4
CNSTI4 0
NEI4 $1058
line 2083
;2083:				{
line 2084
;2084:					WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 2085
;2085:				}
ADDRGP4 $1059
JUMPV
LABELV $1058
line 2086
;2086:				else if (self->client->ps.fd.saberAnimLevel > otherOwner->client->ps.fd.saberAnimLevel ||
ADDRLP4 1540
CNSTI4 408
ASGNI4
ADDRLP4 1544
CNSTI4 1228
ASGNI4
ADDRLP4 1548
ADDRFP4 0
INDIRP4
ADDRLP4 1540
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1544
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1552
ADDRLP4 1132
INDIRP4
ADDRLP4 1540
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1544
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1548
INDIRI4
ADDRLP4 1552
INDIRI4
GTI4 $1063
ADDRLP4 1548
INDIRI4
ADDRLP4 1552
INDIRI4
NEI4 $1061
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1556
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1556
INDIRI4
CNSTI4 2
GTI4 $1061
LABELV $1063
line 2088
;2087:					(self->client->ps.fd.saberAnimLevel == otherOwner->client->ps.fd.saberAnimLevel && Q_irand(1, 10) <= 2))
;2088:				{ //they are attacking, and we managed to make them break
line 2090
;2089:					//Give them a parry, so we can later break it.
;2090:					WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 2091
;2091:					crushTheParry = qtrue;
ADDRLP4 1532
CNSTI4 1
ASGNI4
line 2093
;2092:
;2093:					if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1062
line 2094
;2094:					{
line 2095
;2095:						Com_Printf("Client %i forced client %i into a broken parry with a stronger attack\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1068
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2096
;2096:					}
line 2097
;2097:				}
ADDRGP4 $1062
JUMPV
LABELV $1061
line 2099
;2098:				else
;2099:				{ //They are attacking, so are we, and obviously they have an attack level higher than or equal to ours
line 2100
;2100:					if (self->client->ps.fd.saberAnimLevel == otherOwner->client->ps.fd.saberAnimLevel)
ADDRLP4 1560
CNSTI4 408
ASGNI4
ADDRLP4 1564
CNSTI4 1228
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1560
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1564
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1132
INDIRP4
ADDRLP4 1560
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1564
INDIRI4
ADDP4
INDIRI4
NEI4 $1069
line 2101
;2101:					{ //equal level, try to bounce off each other's sabers
line 2102
;2102:						if (!didOffense &&
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $1071
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1568
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1568
INDIRI4
CNSTI4 0
NEI4 $1071
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1572
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1572
INDIRI4
CNSTI4 0
NEI4 $1071
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1576
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1576
INDIRI4
CNSTI4 0
NEI4 $1071
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1580
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1580
INDIRI4
CNSTI4 0
NEI4 $1071
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1584
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1584
INDIRI4
CNSTI4 0
NEI4 $1071
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1588
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1592
CNSTI4 0
ASGNI4
ADDRLP4 1588
INDIRI4
ADDRLP4 1592
INDIRI4
NEI4 $1071
ADDRLP4 1156
INDIRI4
ADDRLP4 1592
INDIRI4
NEI4 $1071
line 2110
;2103:							!PM_SaberInParry(self->client->ps.saberMove) &&
;2104:							!PM_SaberInBrokenParry(self->client->ps.saberMove) &&
;2105:							!BG_SaberInSpecial(self->client->ps.saberMove) &&
;2106:							!PM_SaberInBounce(self->client->ps.saberMove) &&
;2107:							!PM_SaberInDeflect(self->client->ps.saberMove) &&
;2108:							!PM_SaberInReflect(self->client->ps.saberMove) &&
;2109:							!unblockable)
;2110:						{
line 2111
;2111:							self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2112
;2112:							didOffense = qtrue;
ADDRLP4 1180
CNSTI4 1
ASGNI4
line 2113
;2113:						}
LABELV $1071
line 2114
;2114:						if (!didDefense &&
ADDRLP4 1188
INDIRI4
CNSTI4 0
NEI4 $1073
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1596
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1596
INDIRI4
CNSTI4 0
NEI4 $1073
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1600
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1600
INDIRI4
CNSTI4 0
NEI4 $1073
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1604
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1604
INDIRI4
CNSTI4 0
NEI4 $1073
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1608
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1608
INDIRI4
CNSTI4 0
NEI4 $1073
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1612
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1612
INDIRI4
CNSTI4 0
NEI4 $1073
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1616
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1620
CNSTI4 0
ASGNI4
ADDRLP4 1616
INDIRI4
ADDRLP4 1620
INDIRI4
NEI4 $1073
ADDRLP4 1156
INDIRI4
ADDRLP4 1620
INDIRI4
NEI4 $1073
line 2122
;2115:							!PM_SaberInParry(otherOwner->client->ps.saberMove) &&
;2116:							!PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;2117:							!BG_SaberInSpecial(otherOwner->client->ps.saberMove) &&
;2118:							!PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;2119:							!PM_SaberInDeflect(otherOwner->client->ps.saberMove) &&
;2120:							!PM_SaberInReflect(otherOwner->client->ps.saberMove) &&
;2121:							!unblockable)
;2122:						{
line 2123
;2123:							otherOwner->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2124
;2124:						}
LABELV $1073
line 2125
;2125:						if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1070
line 2126
;2126:						{
line 2127
;2127:							Com_Printf("Equal attack level bounce/deflection for clients %i and %i\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1078
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2128
;2128:						}
line 2129
;2129:					}
ADDRGP4 $1070
JUMPV
LABELV $1069
line 2130
;2130:					else if ((level.time - otherOwner->client->lastSaberStorageTime) < 500 && !unblockable) //make sure the stored saber data is updated
ADDRGP4 level+32
INDIRI4
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1780
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $1079
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1079
line 2131
;2131:					{ //They are higher, this means they can actually smash us into a broken parry
line 2133
;2132:						//Using reflected anims instead now
;2133:						self->client->ps.saberMove = BG_BrokenParryForAttack(self->client->ps.saberMove);
ADDRLP4 1568
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 1568
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1572
ADDRGP4 BG_BrokenParryForAttack
CALLI4
ASGNI4
ADDRLP4 1568
INDIRP4
ADDRLP4 1572
INDIRI4
ASGNI4
line 2134
;2134:						self->client->ps.saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 2136
;2135:
;2136:						if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1082
line 2137
;2137:						{
line 2138
;2138:							Com_Printf("Client %i hit client %i's stronger attack, was forced into a broken parry\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1085
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2139
;2139:						}
LABELV $1082
line 2141
;2140:
;2141:						didOffense = qtrue;
ADDRLP4 1180
CNSTI4 1
ASGNI4
line 2142
;2142:					}
LABELV $1079
LABELV $1070
line 2143
;2143:				}
LABELV $1062
LABELV $1059
line 2145
;2144:
;2145:				if (crushTheParry && PM_SaberInParry(G_GetParryForBlock(otherOwner->client->ps.saberBlocked)))
ADDRLP4 1532
INDIRI4
CNSTI4 0
EQI4 $1086
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1560
ADDRGP4 G_GetParryForBlock
CALLI4
ASGNI4
ADDRLP4 1560
INDIRI4
ARGI4
ADDRLP4 1564
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1564
INDIRI4
CNSTI4 0
EQI4 $1086
line 2146
;2146:				{ //This means that the attack actually hit our saber, and we went to block it.
line 2148
;2147:				  //But, one of the above cases says we actually can't. So we will be smashed into a broken parry instead.
;2148:					otherOwner->client->ps.saberMove = BG_BrokenParryForParry( G_GetParryForBlock(otherOwner->client->ps.saberBlocked) );
ADDRLP4 1568
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1568
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1572
ADDRGP4 G_GetParryForBlock
CALLI4
ASGNI4
ADDRLP4 1572
INDIRI4
ARGI4
ADDRLP4 1576
ADDRGP4 BG_BrokenParryForParry
CALLI4
ASGNI4
ADDRLP4 1568
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 1576
INDIRI4
ASGNI4
line 2149
;2149:					otherOwner->client->ps.saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 2151
;2150:
;2151:					if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1087
line 2152
;2152:					{
line 2153
;2153:						Com_Printf("Client %i broke through %i's parry with a special or stronger attack\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1091
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2154
;2154:					}
line 2155
;2155:				}
ADDRGP4 $1087
JUMPV
LABELV $1086
line 2156
;2156:				else if (PM_SaberInParry(G_GetParryForBlock(otherOwner->client->ps.saberBlocked)) && !didOffense && tryDeflectAgain)
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1568
ADDRGP4 G_GetParryForBlock
CALLI4
ASGNI4
ADDRLP4 1568
INDIRI4
ARGI4
ADDRLP4 1572
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1576
CNSTI4 0
ASGNI4
ADDRLP4 1572
INDIRI4
ADDRLP4 1576
INDIRI4
EQI4 $1092
ADDRLP4 1180
INDIRI4
ADDRLP4 1576
INDIRI4
NEI4 $1092
ADDRLP4 1184
INDIRI4
ADDRLP4 1576
INDIRI4
EQI4 $1092
line 2157
;2157:				{ //We want to try deflecting again because the other is in the parry and we haven't made any new moves
line 2158
;2158:					int preMove = otherOwner->client->ps.saberMove;
ADDRLP4 1580
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 2160
;2159:
;2160:					otherOwner->client->ps.saberMove = G_GetParryForBlock(otherOwner->client->ps.saberBlocked);
ADDRLP4 1584
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1584
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1588
ADDRGP4 G_GetParryForBlock
CALLI4
ASGNI4
ADDRLP4 1584
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 1588
INDIRI4
ASGNI4
line 2161
;2161:					WP_GetSaberDeflectionAngle(self, otherOwner, tr.fraction);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRGP4 WP_GetSaberDeflectionAngle
CALLI4
pop
line 2162
;2162:					otherOwner->client->ps.saberMove = preMove;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 1580
INDIRI4
ASGNI4
line 2163
;2163:				}
LABELV $1092
LABELV $1087
line 2164
;2164:			}
LABELV $1054
line 2165
;2165:		}
LABELV $1052
LABELV $1047
line 2167
;2166:
;2167:		self->client->ps.saberAttackWound = level.time + g_saberDmgDelay_Wound.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_saberDmgDelay_Wound+12
INDIRI4
ADDI4
ASGNI4
line 2168
;2168:	}
LABELV $947
LABELV $834
line 2170
;2169:
;2170:	return didHit;
ADDRLP4 1160
INDIRI4
RETI4
LABELV $691
endproc CheckSaberDamage 1624 32
export CheckThrownSaberDamaged
proc CheckThrownSaberDamaged 1236 32
line 2183
;2171:}
;2172:
;2173:#define MIN_SABER_SLICE_DISTANCE 50
;2174:
;2175:#define MIN_SABER_SLICE_RETURN_DISTANCE 30
;2176:
;2177:#define SABER_THROWN_HIT_DAMAGE 30
;2178:#define SABER_THROWN_RETURN_HIT_DAMAGE 5
;2179:
;2180:void thrownSaberTouch (gentity_t *saberent, gentity_t *other, trace_t *trace);
;2181:
;2182:qboolean CheckThrownSaberDamaged(gentity_t *saberent, gentity_t *saberOwner, gentity_t *ent, int dist, int returning)
;2183:{
line 2188
;2184:	vec3_t vecsub;
;2185:	float veclen;
;2186:	gentity_t *te;
;2187:
;2188:	if (saberOwner && saberOwner->client && saberOwner->client->ps.saberAttackWound > level.time)
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1098
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1098
ADDRLP4 28
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1098
line 2189
;2189:	{
line 2190
;2190:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1097
JUMPV
LABELV $1098
line 2193
;2191:	}
;2192:
;2193:	if (ent && ent->client && ent->inuse && ent->s.number != saberOwner->s.number &&
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1101
ADDRLP4 40
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1101
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $1101
ADDRLP4 32
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $1101
ADDRLP4 32
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $1101
ADDRLP4 32
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $1101
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1101
ADDRLP4 56
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1101
ADDRLP4 56
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1101
line 2198
;2194:		ent->health > 0 && ent->takedamage &&
;2195:		trap_InPVS(ent->client->ps.origin, saberent->r.currentOrigin) &&
;2196:		ent->client->sess.sessionTeam != TEAM_SPECTATOR &&
;2197:		ent->client->pers.connected)
;2198:	{ //hit a client
line 2199
;2199:		if (ent->inuse && ent->client &&
ADDRLP4 60
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $1103
ADDRLP4 68
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1103
ADDRLP4 68
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $1103
ADDRLP4 68
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $1103
line 2202
;2200:			ent->client->ps.duelInProgress &&
;2201:			ent->client->ps.duelIndex != saberOwner->s.number)
;2202:		{
line 2203
;2203:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1097
JUMPV
LABELV $1103
line 2206
;2204:		}
;2205:
;2206:		if (ent->inuse && ent->client &&
ADDRLP4 72
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $1105
ADDRLP4 80
CNSTI4 408
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1105
ADDRLP4 84
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $1105
ADDRLP4 84
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 72
INDIRP4
INDIRI4
EQI4 $1105
line 2209
;2207:			saberOwner->client->ps.duelInProgress &&
;2208:			saberOwner->client->ps.duelIndex != ent->s.number)
;2209:		{
line 2210
;2210:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1097
JUMPV
LABELV $1105
line 2213
;2211:		}
;2212:
;2213:		VectorSubtract(saberent->r.currentOrigin, ent->client->ps.origin, vecsub);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 88
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2214
;2214:		veclen = VectorLength(vecsub);
ADDRLP4 0
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 96
INDIRF4
ASGNF4
line 2216
;2215:
;2216:		if (veclen < dist)
ADDRLP4 12
INDIRF4
ADDRFP4 12
INDIRI4
CVIF4 4
GEF4 $1102
line 2217
;2217:		{ //within range
line 2220
;2218:			trace_t tr;
;2219:
;2220:			trap_Trace(&tr, saberent->r.currentOrigin, NULL, NULL, ent->client->ps.origin, saberent->s.number, MASK_SHOT);
ADDRLP4 100
ARGP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1184
CNSTP4 0
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1180
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2222
;2221:
;2222:			if (tr.fraction == 1 || tr.entityNum == ent->s.number)
ADDRLP4 100+8
INDIRF4
CNSTF4 1065353216
EQF4 $1115
ADDRLP4 100+52
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
NEI4 $1102
LABELV $1115
line 2223
;2223:			{ //Slice them
line 2224
;2224:				if (!saberOwner->client->ps.isJediMaster && WP_SaberCanBlock(ent, tr.endpos, 0, MOD_SABER, qfalse, 8))
ADDRLP4 1188
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 1188
INDIRI4
NEI4 $1116
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 100+12
ARGP4
ADDRLP4 1188
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1188
INDIRI4
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 1192
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
EQI4 $1116
line 2225
;2225:				{ //they blocked it
line 2226
;2226:					WP_SaberBlockNonRandom(ent, tr.endpos, qfalse);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 100+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 2228
;2227:
;2228:					te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 100+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1196
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1196
INDIRP4
ASGNP4
line 2229
;2229:					VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 100+12
INDIRB
ASGNB 12
line 2230
;2230:					VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 100+24
INDIRB
ASGNB 12
line 2231
;2231:					if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1200
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 1204
CNSTF4 0
ASGNF4
ADDRLP4 1200
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
NEF4 $1123
ADDRLP4 1200
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
NEF4 $1123
ADDRLP4 1200
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
NEF4 $1123
line 2232
;2232:					{
line 2233
;2233:						te->s.angles[1] = 1;
ADDRLP4 16
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 2234
;2234:					}
LABELV $1123
line 2235
;2235:					te->s.eventParm = 1;
ADDRLP4 16
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2237
;2236:
;2237:					if (!returning)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $1125
line 2238
;2238:					{ //return to owner if blocked
line 2239
;2239:						thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2240
;2240:					}
LABELV $1125
line 2242
;2241:
;2242:					saberOwner->client->ps.saberAttackWound = level.time + 500;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2243
;2243:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1097
JUMPV
LABELV $1116
line 2246
;2244:				}
;2245:				else
;2246:				{ //a good hit
line 2249
;2247:					vec3_t dir;
;2248:
;2249:					VectorSubtract(tr.endpos, saberent->r.currentOrigin, dir);
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
ADDRLP4 100+12
INDIRF4
ADDRLP4 1208
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1196+4
ADDRLP4 100+12+4
INDIRF4
ADDRLP4 1208
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1196+8
ADDRLP4 100+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2250
;2250:					VectorNormalize(dir);
ADDRLP4 1196
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2252
;2251:
;2252:					if (!dir[0] && !dir[1] && !dir[2])
ADDRLP4 1212
CNSTF4 0
ASGNF4
ADDRLP4 1196
INDIRF4
ADDRLP4 1212
INDIRF4
NEF4 $1135
ADDRLP4 1196+4
INDIRF4
ADDRLP4 1212
INDIRF4
NEF4 $1135
ADDRLP4 1196+8
INDIRF4
ADDRLP4 1212
INDIRF4
NEF4 $1135
line 2253
;2253:					{
line 2254
;2254:						dir[1] = 1;
ADDRLP4 1196+4
CNSTF4 1065353216
ASGNF4
line 2255
;2255:					}
LABELV $1135
line 2257
;2256:
;2257:					if (saberOwner->client->ps.isJediMaster)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1140
line 2258
;2258:					{ //2x damage for the Jedi Master
line 2259
;2259:						G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, saberent->damage*2, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1216
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1196
ARGP4
ADDRLP4 100+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2260
;2260:					}
ADDRGP4 $1141
JUMPV
LABELV $1140
line 2262
;2261:					else
;2262:					{
line 2263
;2263:						G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, saberent->damage, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1216
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1196
ARGP4
ADDRLP4 100+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2264
;2264:					}
LABELV $1141
line 2266
;2265:
;2266:					te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 100+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1216
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1216
INDIRP4
ASGNP4
line 2267
;2267:					VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 100+12
INDIRB
ASGNB 12
line 2268
;2268:					VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 100+24
INDIRB
ASGNB 12
line 2269
;2269:					if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1220
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 1224
CNSTF4 0
ASGNF4
ADDRLP4 1220
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
NEF4 $1147
ADDRLP4 1220
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
NEF4 $1147
ADDRLP4 1220
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
NEF4 $1147
line 2270
;2270:					{
line 2271
;2271:						te->s.angles[1] = 1;
ADDRLP4 16
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 2272
;2272:					}
LABELV $1147
line 2274
;2273:
;2274:					te->s.eventParm = 1;
ADDRLP4 16
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2276
;2275:
;2276:					if (!returning)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $1149
line 2277
;2277:					{ //return to owner if blocked
line 2278
;2278:						thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 1228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1228
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2279
;2279:					}
LABELV $1149
line 2280
;2280:				}
line 2282
;2281:
;2282:				saberOwner->client->ps.saberAttackWound = level.time + 500;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2283
;2283:			}
line 2284
;2284:		}
line 2285
;2285:	}
ADDRGP4 $1102
JUMPV
LABELV $1101
line 2286
;2286:	else if (ent && !ent->client && ent->inuse && ent->takedamage && ent->health > 0 && ent->s.number != saberOwner->s.number &&
ADDRLP4 60
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1152
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
NEU4 $1152
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $1152
ADDRLP4 60
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $1152
ADDRLP4 60
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $1152
ADDRLP4 72
ADDRLP4 60
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $1152
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRP4
INDIRI4
EQI4 $1152
ADDRLP4 80
CNSTI4 368
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $1152
line 2288
;2287:		ent->s.number != saberent->s.number && trap_InPVS(ent->r.currentOrigin, saberent->r.currentOrigin))
;2288:	{ //hit a non-client
line 2289
;2289:		VectorSubtract(saberent->r.currentOrigin, ent->r.currentOrigin, vecsub);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 368
ASGNI4
ADDRLP4 96
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
CNSTI4 372
ASGNI4
ADDRLP4 0+4
ADDRLP4 88
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 104
CNSTI4 376
ASGNI4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2290
;2290:		veclen = VectorLength(vecsub);
ADDRLP4 0
ARGP4
ADDRLP4 108
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 108
INDIRF4
ASGNF4
line 2292
;2291:
;2292:		if (veclen < dist)
ADDRLP4 12
INDIRF4
ADDRFP4 12
INDIRI4
CVIF4 4
GEF4 $1156
line 2293
;2293:		{
line 2296
;2294:			trace_t tr;
;2295:
;2296:			trap_Trace(&tr, saberent->r.currentOrigin, NULL, NULL, ent->r.currentOrigin, saberent->s.number, MASK_SHOT);
ADDRLP4 112
ARGP4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
CNSTI4 368
ASGNI4
ADDRLP4 1192
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ARGP4
ADDRLP4 1200
CNSTP4 0
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ARGP4
ADDRLP4 1192
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2298
;2297:
;2298:			if (tr.fraction == 1 || tr.entityNum == ent->s.number)
ADDRLP4 112+8
INDIRF4
CNSTF4 1065353216
EQF4 $1162
ADDRLP4 112+52
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
NEI4 $1158
LABELV $1162
line 2299
;2299:			{
line 2302
;2300:				vec3_t dir;
;2301:
;2302:				VectorSubtract(tr.endpos, saberent->r.currentOrigin, dir);
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
ADDRLP4 112+12
INDIRF4
ADDRLP4 1216
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1204+4
ADDRLP4 112+12+4
INDIRF4
ADDRLP4 1216
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1204+8
ADDRLP4 112+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2303
;2303:				VectorNormalize(dir);
ADDRLP4 1204
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2305
;2304:
;2305:				if (ent->s.eType == ET_GRAPPLE)
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1170
line 2306
;2306:				{ //an animent
line 2307
;2307:					G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, 40, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1220
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1204
ARGP4
ADDRLP4 112+12
ARGP4
CNSTI4 40
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2308
;2308:				}
ADDRGP4 $1171
JUMPV
LABELV $1170
line 2310
;2309:				else
;2310:				{
line 2311
;2311:					G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, 5, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1220
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1204
ARGP4
ADDRLP4 112+12
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2312
;2312:				}
LABELV $1171
line 2314
;2313:
;2314:				te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 112+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1220
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1220
INDIRP4
ASGNP4
line 2315
;2315:				VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 112+12
INDIRB
ASGNB 12
line 2316
;2316:				VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 112+24
INDIRB
ASGNB 12
line 2317
;2317:				if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1224
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 1228
CNSTF4 0
ASGNF4
ADDRLP4 1224
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
NEF4 $1177
ADDRLP4 1224
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
NEF4 $1177
ADDRLP4 1224
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
NEF4 $1177
line 2318
;2318:				{
line 2319
;2319:					te->s.angles[1] = 1;
ADDRLP4 16
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 2320
;2320:				}
LABELV $1177
line 2322
;2321:
;2322:				te->s.eventParm = 1;
ADDRLP4 16
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2324
;2323:
;2324:				if (!returning)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $1179
line 2325
;2325:				{ //return to owner if blocked
line 2326
;2326:					thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 1232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRLP4 1232
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2327
;2327:				}
LABELV $1179
line 2329
;2328:
;2329:				saberOwner->client->ps.saberAttackWound = level.time + 500;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2330
;2330:			}
LABELV $1158
line 2331
;2331:		}
LABELV $1156
line 2332
;2332:	}
LABELV $1152
LABELV $1102
line 2334
;2333:
;2334:	return qtrue;
CNSTI4 1
RETI4
LABELV $1097
endproc CheckThrownSaberDamaged 1236 32
export saberCheckRadiusDamage
proc saberCheckRadiusDamage 28 20
line 2338
;2335:}
;2336:
;2337:void saberCheckRadiusDamage(gentity_t *saberent, int returning)
;2338:{ //we're going to cheat and damage players within the saber's radius, just for the sake of doing things more "efficiently" (and because the saber entity has no server g2 instance)
line 2339
;2339:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2340
;2340:	int dist = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2342
;2341:	gentity_t *ent;
;2342:	gentity_t *saberOwner = &g_entities[saberent->r.ownerNum];
ADDRLP4 8
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2344
;2343:
;2344:	if (returning && returning != 2)
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1183
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $1183
line 2345
;2345:	{
line 2346
;2346:		dist = MIN_SABER_SLICE_RETURN_DISTANCE;
ADDRLP4 12
CNSTI4 30
ASGNI4
line 2347
;2347:	}
ADDRGP4 $1184
JUMPV
LABELV $1183
line 2349
;2348:	else
;2349:	{
line 2350
;2350:		dist = MIN_SABER_SLICE_DISTANCE;
ADDRLP4 12
CNSTI4 50
ASGNI4
line 2351
;2351:	}
LABELV $1184
line 2353
;2352:
;2353:	if (!saberOwner || !saberOwner->client)
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1187
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
NEU4 $1185
LABELV $1187
line 2354
;2354:	{
line 2355
;2355:		return;
ADDRGP4 $1182
JUMPV
LABELV $1185
line 2358
;2356:	}
;2357:
;2358:	if (saberOwner->client->ps.saberAttackWound > level.time)
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1192
line 2359
;2359:	{
line 2360
;2360:		return;
ADDRGP4 $1182
JUMPV
LABELV $1191
line 2364
;2361:	}
;2362:
;2363:	while (i < MAX_GENTITIES)
;2364:	{
line 2365
;2365:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2367
;2366:
;2367:		CheckThrownSaberDamaged(saberent, saberOwner, ent, dist, returning);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CheckThrownSaberDamaged
CALLI4
pop
line 2369
;2368:
;2369:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2370
;2370:	}
LABELV $1192
line 2363
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1191
line 2371
;2371:}
LABELV $1182
endproc saberCheckRadiusDamage 28 20
export saberMoveBack
proc saberMoveBack 28 12
line 2376
;2372:
;2373://#define THROWN_SABER_COMP
;2374:
;2375:void saberMoveBack( gentity_t *ent, qboolean goingBack ) 
;2376:{
line 2379
;2377:	vec3_t		origin, oldOrg;
;2378:
;2379:	ent->s.pos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 2381
;2380:
;2381:	VectorCopy( ent->r.currentOrigin, oldOrg );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2383
;2382:	// get current position
;2383:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2385
;2384:	//Get current angles?
;2385:	BG_EvaluateTrajectory( &ent->s.apos, level.time, ent->r.currentAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 380
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2426
;2386:
;2387:	//compensation test code..
;2388:#ifdef THROWN_SABER_COMP
;2389:	if (!goingBack)
;2390:	{ //acts as a fallback in case touch code fails, keeps saber from going through things between predictions
;2391:		float originalLength = 0;
;2392:		int iCompensationLength = 32;
;2393:		trace_t tr;
;2394:		vec3_t mins, maxs;
;2395:		vec3_t calcComp, compensatedOrigin;
;2396:		VectorSet( mins, -24.0f, -24.0f, -8.0f );
;2397:		VectorSet( maxs, 24.0f, 24.0f, 8.0f );
;2398:
;2399:		VectorSubtract(origin, oldOrg, calcComp);
;2400:		originalLength = VectorLength(calcComp);
;2401:
;2402:		VectorNormalize(calcComp);
;2403:
;2404:		compensatedOrigin[0] = oldOrg[0] + calcComp[0]*(originalLength+iCompensationLength);		
;2405:		compensatedOrigin[1] = oldOrg[1] + calcComp[1]*(originalLength+iCompensationLength);
;2406:		compensatedOrigin[2] = oldOrg[2] + calcComp[2]*(originalLength+iCompensationLength);
;2407:
;2408:		trap_Trace(&tr, oldOrg, mins, maxs, compensatedOrigin, ent->r.ownerNum, MASK_PLAYERSOLID);
;2409:
;2410:		if ((tr.fraction != 1 || tr.startsolid || tr.allsolid) && tr.entityNum != ent->r.ownerNum)
;2411:		{
;2412:			VectorClear(ent->s.pos.trDelta);
;2413:
;2414:			//Unfortunately doing this would defeat the purpose of the compensation. We will have to settle for a jerk on the client.
;2415:			//VectorCopy( origin, ent->r.currentOrigin );
;2416:
;2417:			CheckThrownSaberDamaged(ent, &g_entities[ent->r.ownerNum], &g_entities[tr.entityNum], 256, 0);
;2418:
;2419:			tr.startsolid = 0;
;2420:			thrownSaberTouch(ent, &g_entities[tr.entityNum], &tr);
;2421:			return;
;2422:		}
;2423:	}
;2424:#endif
;2425:
;2426:	VectorCopy( origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2427
;2427:}
LABELV $1194
endproc saberMoveBack 28 12
export SaberBounceSound
proc SaberBounceSound 4 0
line 2430
;2428:
;2429:void SaberBounceSound( gentity_t *self, gentity_t *other, trace_t *trace )
;2430:{
line 2431
;2431:	VectorCopy(self->r.currentAngles, self->s.apos.trBase);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 2432
;2432:	self->s.apos.trBase[PITCH] = 90;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 1119092736
ASGNF4
line 2433
;2433:}
LABELV $1197
endproc SaberBounceSound 4 0
export DeadSaberThink
proc DeadSaberThink 0 4
line 2436
;2434:
;2435:void DeadSaberThink(gentity_t *saberent)
;2436:{
line 2437
;2437:	if (saberent->speed < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1199
line 2438
;2438:	{
line 2439
;2439:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2440
;2440:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2441
;2441:		return;
ADDRGP4 $1198
JUMPV
LABELV $1199
line 2444
;2442:	}
;2443:
;2444:	G_RunObject(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2445
;2445:}
LABELV $1198
endproc DeadSaberThink 0 4
export MakeDeadSaber
proc MakeDeadSaber 52 12
line 2448
;2446:
;2447:void MakeDeadSaber(gentity_t *ent)
;2448:{	//spawn a "dead" saber entity here so it looks like the saber fell out of the air.
line 2454
;2449:	//This entity will remove itself after a very short time period.
;2450:	vec3_t startorg;
;2451:	vec3_t startang;
;2452:	gentity_t *saberent;
;2453:	
;2454:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1204
line 2455
;2455:	{ //never spawn a dead saber in JM, because the only saber on the level is really a world object
line 2456
;2456:		G_Sound(ent, CHAN_AUTO, saberOffSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOffSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2457
;2457:		return;
ADDRGP4 $1203
JUMPV
LABELV $1204
line 2460
;2458:	}
;2459:
;2460:	saberent = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2462
;2461:
;2462:	VectorCopy(ent->r.currentOrigin, startorg);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2463
;2463:	VectorCopy(ent->r.currentAngles, startang);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 2465
;2464:
;2465:	saberent->classname = "deadsaber";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $1207
ASGNP4
line 2467
;2466:			
;2467:	saberent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 2468
;2468:	saberent->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2470
;2469:
;2470:	saberent->clipmask = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 273
ASGNI4
line 2471
;2471:	saberent->r.contents = CONTENTS_TRIGGER;//0;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 2473
;2472:
;2473:	VectorSet( saberent->r.mins, -3.0f, -3.0f, -3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 2474
;2474:	VectorSet( saberent->r.maxs, 3.0f, 3.0f, 3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 2476
;2475:
;2476:	saberent->touch = SaberBounceSound;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberBounceSound
ASGNP4
line 2478
;2477:
;2478:	saberent->think = DeadSaberThink;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DeadSaberThink
ASGNP4
line 2479
;2479:	saberent->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2481
;2480:
;2481:	VectorCopy(startorg, saberent->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2482
;2482:	VectorCopy(startang, saberent->s.apos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2484
;2483:
;2484:	VectorCopy(startorg, saberent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2485
;2485:	VectorCopy(startang, saberent->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2487
;2486:
;2487:	VectorCopy(startorg, saberent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2488
;2488:	VectorCopy(startang, saberent->r.currentAngles);
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2490
;2489:
;2490:	saberent->s.apos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 5
ASGNI4
line 2491
;2491:	saberent->s.apos.trDelta[0] = Q_irand(200, 800);
CNSTI4 200
ARGI4
CNSTI4 800
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 32
INDIRI4
CVIF4 4
ASGNF4
line 2492
;2492:	saberent->s.apos.trDelta[1] = Q_irand(200, 800);
CNSTI4 200
ARGI4
CNSTI4 800
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
line 2493
;2493:	saberent->s.apos.trDelta[2] = Q_irand(200, 800);
CNSTI4 200
ARGI4
CNSTI4 800
ARGI4
ADDRLP4 40
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 40
INDIRI4
CVIF4 4
ASGNF4
line 2494
;2494:	saberent->s.apos.trTime = level.time-50;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 2496
;2495:
;2496:	saberent->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2497
;2497:	saberent->s.pos.trTime = level.time-50;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 2498
;2498:	saberent->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 2499
;2499:	saberent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $1211
ARGP4
ADDRLP4 44
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 2500
;2500:	saberent->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 2501
;2501:	saberent->s.g2radius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 20
ASGNI4
line 2503
;2502:
;2503:	saberent->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 2504
;2504:	saberent->s.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 2506
;2505:
;2506:	saberent->speed = level.time + 4000;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 2508
;2507:
;2508:	saberent->bounceCount = 12;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 12
ASGNI4
line 2511
;2509:
;2510:	//fall off in the direction the real saber was headed
;2511:	VectorCopy(ent->s.pos.trDelta, saberent->s.pos.trDelta);
ADDRLP4 48
CNSTI4 36
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 2513
;2512:
;2513:	saberMoveBack(saberent, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 2514
;2514:	saberent->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2516
;2515:
;2516:	trap_LinkEntity(saberent);	
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2517
;2517:}
LABELV $1203
endproc MakeDeadSaber 52 12
export saberBackToOwner
proc saberBackToOwner 48 8
line 2520
;2518:
;2519:void saberBackToOwner(gentity_t *saberent)
;2520:{
line 2521
;2521:	gentity_t *saberOwner = &g_entities[saberent->r.ownerNum];
ADDRLP4 16
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2525
;2522:	vec3_t dir;
;2523:	float ownerLen;
;2524:
;2525:	if (saberent->r.ownerNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1214
line 2526
;2526:	{
line 2527
;2527:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 2529
;2528:
;2529:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2530
;2530:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2531
;2531:		return;
ADDRGP4 $1213
JUMPV
LABELV $1214
line 2534
;2532:	}
;2533:
;2534:	if (!g_entities[saberent->r.ownerNum].inuse ||
ADDRLP4 20
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1223
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1223
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1217
LABELV $1223
line 2537
;2535:		!g_entities[saberent->r.ownerNum].client ||
;2536:		g_entities[saberent->r.ownerNum].client->sess.sessionTeam == TEAM_SPECTATOR)
;2537:	{
line 2538
;2538:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 2540
;2539:
;2540:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2541
;2541:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2542
;2542:		return;
ADDRGP4 $1213
JUMPV
LABELV $1217
line 2545
;2543:	}
;2544:
;2545:	if (g_entities[saberent->r.ownerNum].health < 1 || !g_entities[saberent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK] || !g_entities[saberent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERTHROW])
ADDRLP4 24
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1231
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1231
ADDRLP4 24
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1225
LABELV $1231
line 2546
;2546:	{ //He's dead, just go back to our normal saber status
line 2547
;2547:		saberent->touch = SaberGotHit;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 2548
;2548:		saberent->think = SaberUpdateSelf;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 2549
;2549:		saberent->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 2550
;2550:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2552
;2551:
;2552:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 2554
;2553:
;2554:		saberent->r.svFlags |= (SVF_NOCLIENT);
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2555
;2555:		saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 2556
;2556:		VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 2557
;2557:		VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 2558
;2558:		saberent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2560
;2559:
;2560:		g_entities[saberent->r.ownerNum].client->ps.saberInFlight = qfalse;
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 2561
;2561:		g_entities[saberent->r.ownerNum].client->ps.saberThrowDelay = level.time + 500;
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2562
;2562:		g_entities[saberent->r.ownerNum].client->ps.saberCanThrow = qfalse;
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 2564
;2563:
;2564:		return;
ADDRGP4 $1213
JUMPV
LABELV $1225
line 2567
;2565:	}
;2566:
;2567:	saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 2569
;2568:
;2569:	VectorSubtract(saberent->pos1, saberent->r.currentOrigin, dir);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 32
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 36
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2571
;2570:
;2571:	ownerLen = VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
ASGNF4
line 2573
;2572:
;2573:	if (saberent->speed < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1239
line 2574
;2574:	{
line 2575
;2575:		VectorNormalize(dir);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2577
;2576:
;2577:		saberMoveBack(saberent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 2578
;2578:		VectorCopy(saberent->r.currentOrigin, saberent->s.pos.trBase);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2580
;2579:
;2580:		if (g_entities[saberent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_3)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1242
line 2581
;2581:		{ //allow players with high saber throw rank to control the return speed of the saber
line 2582
;2582:			if (g_entities[saberent->r.ownerNum].client->buttons & BUTTON_ATTACK)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1245
line 2583
;2583:			{
line 2584
;2584:				VectorScale(dir, 1200, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1150681088
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1150681088
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1150681088
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 2585
;2585:				saberent->speed = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
CVIF4 4
ASGNF4
line 2586
;2586:			}
ADDRGP4 $1243
JUMPV
LABELV $1245
line 2588
;2587:			else
;2588:			{
line 2589
;2589:				VectorScale(dir, 700, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 2590
;2590:				saberent->speed = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 2591
;2591:			}
line 2592
;2592:		}
ADDRGP4 $1243
JUMPV
LABELV $1242
line 2594
;2593:		else
;2594:		{
line 2595
;2595:			VectorScale(dir, 700, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 2596
;2596:			saberent->speed = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 2597
;2597:		}
LABELV $1243
line 2598
;2598:		saberent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2599
;2599:	}
LABELV $1239
line 2601
;2600:
;2601:	if (ownerLen <= 512)
ADDRLP4 12
INDIRF4
CNSTF4 1140850688
GTF4 $1258
line 2602
;2602:	{
line 2603
;2603:		saberent->s.saberInFlight = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
CNSTI4 0
ASGNI4
line 2604
;2604:		saberent->s.loopSound = saberHumSound;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 saberHumSound
INDIRI4
ASGNI4
line 2605
;2605:	}
LABELV $1258
line 2607
;2606:
;2607:	if (ownerLen <= 32)
ADDRLP4 12
INDIRF4
CNSTF4 1107296256
GTF4 $1260
line 2608
;2608:	{
line 2609
;2609:		saberOwner->client->ps.saberInFlight = qfalse;
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 2610
;2610:		saberOwner->client->ps.saberCanThrow = qfalse;
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 2611
;2611:		saberOwner->client->ps.saberThrowDelay = level.time + 300;
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 2613
;2612:
;2613:		saberent->touch = SaberGotHit;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 2615
;2614:
;2615:		saberent->think = SaberUpdateSelf;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 2616
;2616:		saberent->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 2617
;2617:		saberent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2619
;2618:
;2619:		return;
ADDRGP4 $1213
JUMPV
LABELV $1260
line 2622
;2620:	}
;2621:
;2622:	if (!saberent->s.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1264
line 2623
;2623:	{
line 2624
;2624:		saberCheckRadiusDamage(saberent, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberCheckRadiusDamage
CALLV
pop
line 2625
;2625:	}
ADDRGP4 $1265
JUMPV
LABELV $1264
line 2627
;2626:	else
;2627:	{
line 2628
;2628:		saberCheckRadiusDamage(saberent, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 saberCheckRadiusDamage
CALLV
pop
line 2629
;2629:	}
LABELV $1265
line 2631
;2630:
;2631:	saberMoveBack(saberent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 2633
;2632:
;2633:	saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2634
;2634:}
LABELV $1213
endproc saberBackToOwner 48 8
export thrownSaberTouch
proc thrownSaberTouch 44 20
line 2639
;2635:
;2636:void saberFirstThrown(gentity_t *saberent);
;2637:
;2638:void thrownSaberTouch (gentity_t *saberent, gentity_t *other, trace_t *trace)
;2639:{
line 2640
;2640:	gentity_t *hitEnt = other;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 2642
;2641:
;2642:	if (other && other->s.number == saberent->r.ownerNum)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1268
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
NEI4 $1268
line 2643
;2643:	{
line 2644
;2644:		return;
ADDRGP4 $1267
JUMPV
LABELV $1268
line 2646
;2645:	}
;2646:	VectorClear(saberent->s.pos.trDelta);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 2647
;2647:	saberent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2649
;2648:
;2649:	saberent->s.apos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 2650
;2650:	saberent->s.apos.trDelta[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 0
ASGNF4
line 2651
;2651:	saberent->s.apos.trDelta[1] = 800;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 1145569280
ASGNF4
line 2652
;2652:	saberent->s.apos.trDelta[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 2654
;2653:
;2654:	VectorCopy(saberent->r.currentOrigin, saberent->s.pos.trBase);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2656
;2655:
;2656:	saberent->think = saberBackToOwner;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 saberBackToOwner
ASGNP4
line 2657
;2657:	saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2659
;2658:
;2659:	if (other && other->r.ownerNum < MAX_CLIENTS &&
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1272
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32
GEI4 $1272
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $1272
ADDRLP4 36
CNSTI4 828
ADDRLP4 28
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1272
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1272
line 2663
;2660:		(other->r.contents & CONTENTS_LIGHTSABER) &&
;2661:		g_entities[other->r.ownerNum].client &&
;2662:		g_entities[other->r.ownerNum].inuse)
;2663:	{
line 2664
;2664:		hitEnt = &g_entities[other->r.ownerNum];
ADDRLP4 0
CNSTI4 828
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2665
;2665:	}
LABELV $1272
line 2667
;2666:
;2667:	CheckThrownSaberDamaged(saberent, &g_entities[saberent->r.ownerNum], hitEnt, 256, 0);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 40
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CheckThrownSaberDamaged
CALLI4
pop
line 2669
;2668:
;2669:	saberent->speed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTF4 0
ASGNF4
line 2670
;2670:}
LABELV $1267
endproc thrownSaberTouch 44 20
export saberFirstThrown
proc saberFirstThrown 1204 28
line 2675
;2671:
;2672:#define SABER_MAX_THROW_DISTANCE 700
;2673:
;2674:void saberFirstThrown(gentity_t *saberent)
;2675:{
line 2678
;2676:	vec3_t		vSub;
;2677:	float		vLen;
;2678:	gentity_t	*saberOwn = &g_entities[saberent->r.ownerNum];
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2680
;2679:
;2680:	if (saberent->r.ownerNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1277
line 2681
;2681:	{
line 2682
;2682:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 2684
;2683:
;2684:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2685
;2685:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2686
;2686:		return;
ADDRGP4 $1276
JUMPV
LABELV $1277
line 2689
;2687:	}
;2688:
;2689:	if (!saberOwn ||
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1284
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1284
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1284
ADDRLP4 28
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1280
LABELV $1284
line 2693
;2690:		!saberOwn->inuse ||
;2691:		!saberOwn->client ||
;2692:		saberOwn->client->sess.sessionTeam == TEAM_SPECTATOR)
;2693:	{
line 2694
;2694:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 2696
;2695:
;2696:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2697
;2697:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2698
;2698:		return;
ADDRGP4 $1276
JUMPV
LABELV $1280
line 2701
;2699:	}
;2700:
;2701:	if (saberOwn->health < 1 || !saberOwn->client->ps.fd.forcePowerLevel[FP_SABERATTACK] || !saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW])
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1289
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $1289
ADDRLP4 36
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $1286
LABELV $1289
line 2702
;2702:	{ //He's dead, just go back to our normal saber status
line 2703
;2703:		saberent->touch = SaberGotHit;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 2704
;2704:		saberent->think = SaberUpdateSelf;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 2705
;2705:		saberent->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 2706
;2706:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2708
;2707:
;2708:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 2710
;2709:
;2710:		saberent->r.svFlags |= (SVF_NOCLIENT);
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2711
;2711:		saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 2712
;2712:		VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 2713
;2713:		VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 2714
;2714:		saberent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2716
;2715:
;2716:		saberOwn->client->ps.saberInFlight = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 2717
;2717:		saberOwn->client->ps.saberThrowDelay = level.time + 500;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2718
;2718:		saberOwn->client->ps.saberCanThrow = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 2720
;2719:
;2720:		return;
ADDRGP4 $1276
JUMPV
LABELV $1286
line 2723
;2721:	}
;2722:
;2723:	if ((level.time - saberOwn->client->ps.saberDidThrowTime) > 500)
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $1292
line 2724
;2724:	{
line 2725
;2725:		if (!(saberOwn->client->buttons & BUTTON_ALT_ATTACK))
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1596
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $1295
line 2726
;2726:		{ //If owner releases altattack 500ms or later after throwing saber, it autoreturns
line 2727
;2727:			thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2728
;2728:			goto runMin;
ADDRGP4 $1297
JUMPV
LABELV $1295
line 2730
;2729:		}
;2730:		else if ((level.time - saberOwn->client->ps.saberDidThrowTime) > 6000)
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
SUBI4
CNSTI4 6000
LEI4 $1298
line 2731
;2731:		{ //if it's out longer than 6 seconds, return it
line 2732
;2732:			thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2733
;2733:			goto runMin;
ADDRGP4 $1297
JUMPV
LABELV $1298
line 2735
;2734:		}
;2735:	}
LABELV $1292
line 2737
;2736:
;2737:	if (BG_HasYsalamiri(g_gametype.integer, &saberOwn->client->ps))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1301
line 2738
;2738:	{
line 2739
;2739:		thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2740
;2740:		goto runMin;
ADDRGP4 $1297
JUMPV
LABELV $1301
line 2743
;2741:	}
;2742:	
;2743:	if (!BG_CanUseFPNow(g_gametype.integer, &saberOwn->client->ps, level.time, FP_SABERTHROW))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTI4 17
ARGI4
ADDRLP4 48
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $1304
line 2744
;2744:	{
line 2745
;2745:		thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2746
;2746:		goto runMin;
ADDRGP4 $1297
JUMPV
LABELV $1304
line 2749
;2747:	}
;2748:
;2749:	VectorSubtract(saberOwn->client->ps.origin, saberent->r.currentOrigin, vSub);
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 52
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2750
;2750:	vLen = VectorLength(vSub);
ADDRLP4 4
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 60
INDIRF4
ASGNF4
line 2752
;2751:
;2752:	if (vLen >= (SABER_MAX_THROW_DISTANCE*saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW]))
ADDRLP4 16
INDIRF4
CNSTI4 700
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
MULI4
CVIF4 4
LTF4 $1310
line 2753
;2753:	{
line 2754
;2754:		thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2755
;2755:		goto runMin;
ADDRGP4 $1297
JUMPV
LABELV $1310
line 2758
;2756:	}
;2757:
;2758:	if (saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_2 &&
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 2
LTI4 $1312
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1312
line 2760
;2759:		saberent->speed < level.time)
;2760:	{ //if owner is rank 3 in saber throwing, the saber goes where he points
line 2764
;2761:		vec3_t fwd, traceFrom, traceTo, dir;
;2762:		trace_t tr;
;2763:
;2764:		AngleVectors(saberOwn->client->ps.viewangles, fwd, 0, 0);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1192
CNSTP4 0
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2766
;2765:
;2766:		VectorCopy(saberOwn->client->ps.origin, traceFrom);
ADDRLP4 100
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2767
;2767:		traceFrom[2] += saberOwn->client->ps.viewheight;
ADDRLP4 100+8
ADDRLP4 100+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2769
;2768:
;2769:		VectorCopy(traceFrom, traceTo);
ADDRLP4 76
ADDRLP4 100
INDIRB
ASGNB 12
line 2770
;2770:		traceTo[0] += fwd[0]*4096;
ADDRLP4 76
ADDRLP4 76
INDIRF4
CNSTF4 1166016512
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
line 2771
;2771:		traceTo[1] += fwd[1]*4096;
ADDRLP4 76+4
ADDRLP4 76+4
INDIRF4
CNSTF4 1166016512
ADDRLP4 88+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2772
;2772:		traceTo[2] += fwd[2]*4096;
ADDRLP4 76+8
ADDRLP4 76+8
INDIRF4
CNSTF4 1166016512
ADDRLP4 88+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2774
;2773:
;2774:		saberMoveBack(saberent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 2775
;2775:		VectorCopy(saberent->r.currentOrigin, saberent->s.pos.trBase);
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1196
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2777
;2776:
;2777:		if (saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_3)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1320
line 2778
;2778:		{ //if highest saber throw rank, we can direct the saber toward players directly by looking at them
line 2779
;2779:			trap_Trace(&tr, traceFrom, NULL, NULL, traceTo, saberOwn->s.number, MASK_PLAYERSOLID);
ADDRLP4 112
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 1200
CNSTP4 0
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2780
;2780:		}
ADDRGP4 $1321
JUMPV
LABELV $1320
line 2782
;2781:		else
;2782:		{
line 2783
;2783:			trap_Trace(&tr, traceFrom, NULL, NULL, traceTo, saberOwn->s.number, MASK_SOLID);
ADDRLP4 112
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 1200
CNSTP4 0
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2784
;2784:		}
LABELV $1321
line 2786
;2785:
;2786:		VectorSubtract(tr.endpos, saberent->r.currentOrigin, dir);
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 112+12
INDIRF4
ADDRLP4 1200
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 112+12+4
INDIRF4
ADDRLP4 1200
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 112+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2788
;2787:
;2788:		VectorNormalize(dir);
ADDRLP4 64
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2790
;2789:
;2790:		VectorScale(dir, 500, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1140457472
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1140457472
ADDRLP4 64+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1140457472
ADDRLP4 64+8
INDIRF4
MULF4
ASGNF4
line 2791
;2791:		saberent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2793
;2792:
;2793:		if (saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_3)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1332
line 2794
;2794:		{ //we'll treat them to a quicker update rate if their throw rank is high enough
line 2795
;2795:			saberent->speed = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 2796
;2796:		}
ADDRGP4 $1333
JUMPV
LABELV $1332
line 2798
;2797:		else
;2798:		{
line 2799
;2799:			saberent->speed = level.time + 400;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 400
ADDI4
CVIF4 4
ASGNF4
line 2800
;2800:		}
LABELV $1333
line 2801
;2801:	}
LABELV $1312
LABELV $1297
line 2805
;2802:
;2803:runMin:
;2804:
;2805:	saberCheckRadiusDamage(saberent, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberCheckRadiusDamage
CALLV
pop
line 2806
;2806:	G_RunObject(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2807
;2807:}
LABELV $1276
endproc saberFirstThrown 1204 28
export WP_SaberPositionUpdate
proc WP_SaberPositionUpdate 568 40
line 2810
;2808:
;2809:void WP_SaberPositionUpdate( gentity_t *self, usercmd_t *ucmd )
;2810:{ //rww - keep the saber position as updated as possible on the server so that we can try to do realistic-looking contact stuff
line 2818
;2811:	mdxaBone_t	boltMatrix;
;2812:	vec3_t properAngles, properOrigin;
;2813:	vec3_t boltAngles, boltOrigin;
;2814:	vec3_t end;
;2815:	vec3_t legAxis[3];
;2816:	vec3_t addVel;
;2817:	vec3_t rawAngles;
;2818:	float fVSpeed = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2822
;2819:	int f;
;2820:	int torsoAnim;
;2821:	int legsAnim;
;2822:	int returnAfterUpdate = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 2823
;2823:	float animSpeedScale = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 2824
;2824:	qboolean setTorso = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 2826
;2825:
;2826:	if (self && self->inuse && self->client)
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
CNSTU4 0
ASGNU4
ADDRLP4 196
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
EQU4 $1337
ADDRLP4 196
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1337
ADDRLP4 196
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
EQU4 $1337
line 2827
;2827:	{
line 2828
;2828:		if (self->client->saberCycleQueue)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1339
line 2829
;2829:		{
line 2830
;2830:			self->client->ps.fd.saberDrawAnimLevel = self->client->saberCycleQueue;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTI4 1232
ADDP4
ADDRLP4 204
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
ASGNI4
line 2831
;2831:		}
ADDRGP4 $1340
JUMPV
LABELV $1339
line 2833
;2832:		else
;2833:		{
line 2834
;2834:			self->client->ps.fd.saberDrawAnimLevel = self->client->ps.fd.saberAnimLevel;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTI4 1232
ADDP4
ADDRLP4 204
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 2835
;2835:		}
LABELV $1340
line 2836
;2836:	}
LABELV $1337
line 2838
;2837:
;2838:	if (self &&
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
CNSTU4 0
ASGNU4
ADDRLP4 204
INDIRP4
CVPU4 4
ADDRLP4 208
INDIRU4
EQU4 $1341
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 212
INDIRI4
EQI4 $1341
ADDRLP4 216
ADDRLP4 204
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
CVPU4 4
ADDRLP4 208
INDIRU4
EQU4 $1341
ADDRLP4 216
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
ADDRLP4 212
INDIRI4
EQI4 $1341
ADDRLP4 216
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 212
INDIRI4
LEI4 $1343
ADDRLP4 204
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1341
LABELV $1343
line 2843
;2839:		self->inuse &&
;2840:		self->client &&
;2841:		self->client->saberCycleQueue &&
;2842:		(self->client->ps.weaponTime <= 0 || self->health < 1))
;2843:	{ //we cycled attack levels while we were busy, so update now that we aren't (even if that means we're dead)
line 2844
;2844:		self->client->ps.fd.saberAnimLevel = self->client->saberCycleQueue;
ADDRLP4 220
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 220
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
ASGNI4
line 2845
;2845:		self->client->saberCycleQueue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1580
ADDP4
CNSTI4 0
ASGNI4
line 2846
;2846:	}
LABELV $1341
line 2848
;2847:
;2848:	if (!self ||
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
CNSTU4 0
ASGNU4
ADDRLP4 220
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $1348
ADDRLP4 228
ADDRLP4 220
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $1348
ADDRLP4 228
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $1348
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
NEU4 $1344
LABELV $1348
line 2852
;2849:		!self->client ||
;2850:		!self->client->ghoul2 ||
;2851:		!g2SaberInstance)
;2852:	{
line 2853
;2853:		return;
ADDRGP4 $1336
JUMPV
LABELV $1344
line 2856
;2854:	}
;2855:
;2856:	if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1349
line 2857
;2857:	{ //we don't want to waste precious CPU time calculating saber positions for corpses. But we want to avoid the saber ent position lagging on spawn, so..
line 2858
;2858:		gentity_t *mySaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 232
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2861
;2859:
;2860:		//I guess it's good to keep the position updated even when contents are 0
;2861:		if (mySaber && ((mySaber->r.contents & CONTENTS_LIGHTSABER) || mySaber->r.contents == 0) && !self->client->ps.saberInFlight)
ADDRLP4 236
ADDRLP4 232
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1336
ADDRLP4 240
ADDRLP4 236
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ASGNI4
ADDRLP4 244
CNSTI4 0
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 244
INDIRI4
NEI4 $1353
ADDRLP4 240
INDIRI4
ADDRLP4 244
INDIRI4
NEI4 $1336
LABELV $1353
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1336
line 2862
;2862:		{ //Since we haven't got a bolt position, place it on top of the player origin.
line 2863
;2863:			VectorCopy(self->client->ps.origin, mySaber->r.currentOrigin);
ADDRLP4 232
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2864
;2864:		}
line 2865
;2865:		return;
ADDRGP4 $1336
JUMPV
LABELV $1349
line 2868
;2866:	}
;2867:
;2868:	if (self->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1354
line 2869
;2869:	{ //we don't update the server's G2 instance in the case of ATST use, so..
line 2870
;2870:		return;
ADDRGP4 $1336
JUMPV
LABELV $1354
line 2873
;2871:	}
;2872:
;2873:	if (self->client->ps.weapon != WP_SABER ||
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 236
CNSTI4 2
ASGNI4
ADDRLP4 232
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
NEI4 $1359
ADDRLP4 240
ADDRLP4 232
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 1
EQI4 $1359
ADDRLP4 240
INDIRI4
ADDRLP4 236
INDIRI4
NEI4 $1356
LABELV $1359
line 2876
;2874:		self->client->ps.weaponstate == WEAPON_RAISING ||
;2875:		self->client->ps.weaponstate == WEAPON_DROPPING)
;2876:	{
line 2877
;2877:		returnAfterUpdate = 1;
ADDRLP4 140
CNSTI4 1
ASGNI4
line 2878
;2878:	}
LABELV $1356
line 2880
;2879:
;2880:	if (self->client->ps.saberThrowDelay < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1360
line 2881
;2881:	{
line 2882
;2882:		self->client->ps.saberCanThrow = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 2883
;2883:	}
LABELV $1360
line 2885
;2884:
;2885:	if (self->client->ps.fd.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1363
line 2886
;2886:	{
line 2887
;2887:		animSpeedScale = 2;
ADDRLP4 28
CNSTF4 1073741824
ASGNF4
line 2888
;2888:	}
LABELV $1363
line 2890
;2889:	
;2890:	torsoAnim = (self->client->ps.torsoAnim & ~ANIM_TOGGLEBIT );
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2891
;2891:	legsAnim = (self->client->ps.legsAnim & ~ANIM_TOGGLEBIT );
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2893
;2892:
;2893:	VectorCopy(self->client->ps.origin, properOrigin);
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2894
;2894:	VectorCopy(self->client->ps.viewangles, properAngles);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2897
;2895:
;2896:	//try to predict the origin based on velocity so it's more like what the client is seeing
;2897:	VectorCopy(self->client->ps.velocity, addVel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2898
;2898:	VectorNormalize(addVel);
ADDRLP4 108
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2900
;2899:
;2900:	if (self->client->ps.velocity[0] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1365
line 2901
;2901:	{
line 2902
;2902:		fVSpeed += (-self->client->ps.velocity[0]);
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 2903
;2903:	}
ADDRGP4 $1366
JUMPV
LABELV $1365
line 2905
;2904:	else
;2905:	{
line 2906
;2906:		fVSpeed += self->client->ps.velocity[0];
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2907
;2907:	}
LABELV $1366
line 2908
;2908:	if (self->client->ps.velocity[1] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1367
line 2909
;2909:	{
line 2910
;2910:		fVSpeed += (-self->client->ps.velocity[1]);
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 2911
;2911:	}
ADDRGP4 $1368
JUMPV
LABELV $1367
line 2913
;2912:	else
;2913:	{
line 2914
;2914:		fVSpeed += self->client->ps.velocity[1];
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2915
;2915:	}
LABELV $1368
line 2916
;2916:	if (self->client->ps.velocity[2] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1369
line 2917
;2917:	{
line 2918
;2918:		fVSpeed += (-self->client->ps.velocity[2]);
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 2919
;2919:	}
ADDRGP4 $1370
JUMPV
LABELV $1369
line 2921
;2920:	else
;2921:	{
line 2922
;2922:		fVSpeed += self->client->ps.velocity[2];
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2923
;2923:	}
LABELV $1370
line 2925
;2924:
;2925:	fVSpeed *= 0.08;
ADDRLP4 24
CNSTF4 1034147594
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 2927
;2926:
;2927:	properOrigin[0] += addVel[0]*fVSpeed;
ADDRLP4 96
ADDRLP4 96
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 2928
;2928:	properOrigin[1] += addVel[1]*fVSpeed;
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 108+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 2929
;2929:	properOrigin[2] += addVel[2]*fVSpeed;
ADDRLP4 96+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 108+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 2931
;2930:
;2931:	properAngles[0] = 0;
ADDRLP4 80
CNSTF4 0
ASGNF4
line 2932
;2932:	properAngles[1] = self->client->ps.viewangles[YAW];
ADDRLP4 80+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2933
;2933:	properAngles[2] = 0;
ADDRLP4 80+8
CNSTF4 0
ASGNF4
line 2935
;2934:
;2935:	AnglesToAxis( properAngles, legAxis );
ADDRLP4 80
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2936
;2936:	G_G2PlayerAngles( self, legAxis, properAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 G_G2PlayerAngles
CALLV
pop
line 2938
;2937:
;2938:	if (returnAfterUpdate)
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1377
line 2939
;2939:	{ //We don't even need to do GetBoltMatrix if we're only in here to keep the g2 server instance in sync
line 2941
;2940:		//but keep our saber entity in sync too, just copy it over our origin.
;2941:		gentity_t *mySaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 244
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2944
;2942:
;2943:		//I guess it's good to keep the position updated even when contents are 0
;2944:		if (mySaber && ((mySaber->r.contents & CONTENTS_LIGHTSABER) || mySaber->r.contents == 0) && !self->client->ps.saberInFlight)
ADDRLP4 248
ADDRLP4 244
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1382
ADDRLP4 252
ADDRLP4 248
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ASGNI4
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 256
INDIRI4
NEI4 $1381
ADDRLP4 252
INDIRI4
ADDRLP4 256
INDIRI4
NEI4 $1382
LABELV $1381
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1382
line 2945
;2945:		{ //Since we haven't got a bolt position, place it on top of the player origin.
line 2946
;2946:			VectorCopy(self->client->ps.origin, mySaber->r.currentOrigin);
ADDRLP4 244
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2947
;2947:		}
line 2949
;2948:
;2949:		goto finalUpdate;
ADDRGP4 $1382
JUMPV
LABELV $1377
line 2952
;2950:	}
;2951:
;2952:	trap_G2API_GetBoltMatrix(self->client->ghoul2, 1, 0, &boltMatrix, properAngles, properOrigin, level.time, NULL, vec3_origin);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 32
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 2954
;2953:
;2954:	boltOrigin[0] = boltMatrix.matrix[0][3];
ADDRLP4 0
ADDRLP4 32+12
INDIRF4
ASGNF4
line 2955
;2955:	boltOrigin[1] = boltMatrix.matrix[1][3];
ADDRLP4 0+4
ADDRLP4 32+16+12
INDIRF4
ASGNF4
line 2956
;2956:	boltOrigin[2] = boltMatrix.matrix[2][3];
ADDRLP4 0+8
ADDRLP4 32+32+12
INDIRF4
ASGNF4
line 2958
;2957:
;2958:	boltAngles[0] = -boltMatrix.matrix[0][1];
ADDRLP4 12
ADDRLP4 32+4
INDIRF4
NEGF4
ASGNF4
line 2959
;2959:	boltAngles[1] = -boltMatrix.matrix[1][1];
ADDRLP4 12+4
ADDRLP4 32+16+4
INDIRF4
NEGF4
ASGNF4
line 2960
;2960:	boltAngles[2] = -boltMatrix.matrix[2][1];
ADDRLP4 12+8
ADDRLP4 32+32+4
INDIRF4
NEGF4
ASGNF4
line 2963
;2961:
;2962:	//immediately store these values so we don't have to recalculate this again
;2963:	VectorCopy(boltOrigin, self->client->lastSaberBase_Always);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1768
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2964
;2964:	VectorCopy(boltOrigin, self->client->lastSaberDir_Always);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1756
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2965
;2965:	self->client->lastSaberStorageTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1780
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2967
;2966:
;2967:	VectorCopy(boltAngles, rawAngles);
ADDRLP4 184
ADDRLP4 12
INDIRB
ASGNB 12
line 2969
;2968:
;2969:	VectorMA( boltOrigin, 40, boltAngles, end );
ADDRLP4 244
CNSTF4 1109393408
ASGNF4
ADDRLP4 124
ADDRLP4 0
INDIRF4
ADDRLP4 244
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 244
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1109393408
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2971
;2970:
;2971:	if (self->client->ps.saberEntityNum)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1405
line 2972
;2972:	{
line 2973
;2973:		gentity_t *mySaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 248
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2976
;2974:
;2975:		//I guess it's good to keep the position updated even when contents are 0
;2976:		if (mySaber && ((mySaber->r.contents & CONTENTS_LIGHTSABER) || mySaber->r.contents == 0) && !self->client->ps.saberInFlight)
ADDRLP4 248
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1407
ADDRLP4 256
ADDRLP4 248
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ASGNI4
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 260
INDIRI4
NEI4 $1409
ADDRLP4 256
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $1407
LABELV $1409
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1407
line 2977
;2977:		{ //place it roughly in the middle of the saber..
line 2978
;2978:			VectorMA( boltOrigin, 20, boltAngles, mySaber->r.currentOrigin );
ADDRLP4 248
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 372
ADDP4
ADDRLP4 0+4
INDIRF4
CNSTF4 1101004800
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 376
ADDP4
ADDRLP4 0+8
INDIRF4
CNSTF4 1101004800
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2980
;2979:
;2980:			if (self->client->ps.dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1414
line 2981
;2981:			{
line 2982
;2982:				VectorCopy(boltOrigin, mySaber->r.currentOrigin);
ADDRLP4 248
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2983
;2983:			}
LABELV $1414
line 2984
;2984:		}
LABELV $1407
line 2985
;2985:	}
LABELV $1405
line 2987
;2986:
;2987:	boltAngles[YAW] = self->client->ps.viewangles[YAW];
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2991
;2988:
;2989:	//G_TestLine(boltOrigin, end, 0x000000ff, 50);
;2990:
;2991:	if (self->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1417
line 2992
;2992:	{ //do the thrown-saber stuff
line 2993
;2993:		gentity_t *saberent = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 248
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2995
;2994:
;2995:		if (saberent)
ADDRLP4 248
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1418
line 2996
;2996:		{
line 2997
;2997:			if (!self->client->ps.saberEntityState)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1421
line 2998
;2998:			{
line 3001
;2999:				vec3_t startorg, startang, dir;
;3000:
;3001:				VectorCopy(boltOrigin, saberent->r.currentOrigin);
ADDRLP4 248
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3003
;3002:
;3003:				VectorCopy(boltOrigin, startorg);
ADDRLP4 264
ADDRLP4 0
INDIRB
ASGNB 12
line 3004
;3004:				VectorCopy(boltAngles, startang);
ADDRLP4 276
ADDRLP4 12
INDIRB
ASGNB 12
line 3010
;3005:
;3006:				//startang[0] = 90;
;3007:				//Instead of this we'll sort of fake it and slowly tilt it down on the client via
;3008:				//a perframe method (which doesn't actually affect where or how the saber hits)
;3009:
;3010:				saberent->r.svFlags &= ~(SVF_NOCLIENT);
ADDRLP4 288
ADDRLP4 248
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 288
INDIRP4
ADDRLP4 288
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 3011
;3011:				VectorCopy(startorg, saberent->s.pos.trBase);
ADDRLP4 248
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 264
INDIRB
ASGNB 12
line 3012
;3012:				VectorCopy(startang, saberent->s.apos.trBase);
ADDRLP4 248
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 276
INDIRB
ASGNB 12
line 3014
;3013:
;3014:				VectorCopy(startorg, saberent->s.origin);
ADDRLP4 248
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 264
INDIRB
ASGNB 12
line 3015
;3015:				VectorCopy(startang, saberent->s.angles);
ADDRLP4 248
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 276
INDIRB
ASGNB 12
line 3017
;3016:
;3017:				saberent->s.saberInFlight = qtrue;
ADDRLP4 248
INDIRP4
CNSTI4 228
ADDP4
CNSTI4 1
ASGNI4
line 3019
;3018:
;3019:				saberent->s.apos.trType = TR_LINEAR;
ADDRLP4 248
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 3020
;3020:				saberent->s.apos.trDelta[0] = 0;
ADDRLP4 248
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 0
ASGNF4
line 3021
;3021:				saberent->s.apos.trDelta[1] = 800;
ADDRLP4 248
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 1145569280
ASGNF4
line 3022
;3022:				saberent->s.apos.trDelta[2] = 0;
ADDRLP4 248
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 3024
;3023:
;3024:				saberent->s.pos.trType = TR_LINEAR;
ADDRLP4 248
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 3025
;3025:				saberent->s.eType = ET_GENERAL;
ADDRLP4 248
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 3026
;3026:				saberent->s.eFlags = 0;
ADDRLP4 248
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 3027
;3027:				saberent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $1211
ARGP4
ADDRLP4 292
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 248
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 3028
;3028:				saberent->s.modelGhoul2 = 127;
ADDRLP4 248
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 127
ASGNI4
line 3030
;3029:
;3030:				saberent->parent = self;
ADDRLP4 248
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 3032
;3031:
;3032:				self->client->ps.saberEntityState = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 1
ASGNI4
line 3035
;3033:
;3034:				//Projectile stuff:
;3035:				AngleVectors(self->client->ps.viewangles, dir, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 252
ARGP4
ADDRLP4 296
CNSTP4 0
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3037
;3036:
;3037:				saberent->nextthink = level.time + FRAMETIME;
ADDRLP4 248
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3038
;3038:				saberent->think = saberFirstThrown;
ADDRLP4 248
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 saberFirstThrown
ASGNP4
line 3040
;3039:
;3040:				saberent->damage = SABER_THROWN_HIT_DAMAGE;
ADDRLP4 248
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 30
ASGNI4
line 3041
;3041:				saberent->methodOfDeath = MOD_SABER;
ADDRLP4 248
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 3
ASGNI4
line 3042
;3042:				saberent->splashMethodOfDeath = MOD_SABER;
ADDRLP4 248
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 3
ASGNI4
line 3043
;3043:				saberent->s.solid = 2;
ADDRLP4 248
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3044
;3044:				saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 248
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 3046
;3045:
;3046:				saberent->bolt_Head = 0;
ADDRLP4 248
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 3048
;3047:
;3048:				VectorSet( saberent->r.mins, -24.0f, -24.0f, -8.0f );
ADDRLP4 248
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3250585600
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3250585600
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3238002688
ASGNF4
line 3049
;3049:				VectorSet( saberent->r.maxs, 24.0f, 24.0f, 8.0f );
ADDRLP4 248
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1103101952
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1103101952
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1090519040
ASGNF4
line 3051
;3050:
;3051:				saberent->s.genericenemyindex = self->s.number+1024;
ADDRLP4 248
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 3053
;3052:
;3053:				saberent->touch = thrownSaberTouch;
ADDRLP4 248
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 thrownSaberTouch
ASGNP4
line 3055
;3054:
;3055:				saberent->s.weapon = WP_SABER;
ADDRLP4 248
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 3057
;3056:
;3057:				VectorScale(dir, 400, saberent->s.pos.trDelta );
ADDRLP4 248
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1137180672
ADDRLP4 252
INDIRF4
MULF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1137180672
ADDRLP4 252+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1137180672
ADDRLP4 252+8
INDIRF4
MULF4
ASGNF4
line 3058
;3058:				saberent->s.pos.trTime = level.time;
ADDRLP4 248
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 3060
;3059:
;3060:				saberent->s.loopSound = saberSpinSound;
ADDRLP4 248
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 saberSpinSound
INDIRI4
ASGNI4
line 3062
;3061:
;3062:				self->client->ps.saberDidThrowTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 3064
;3063:
;3064:				self->client->dangerTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1788
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 3065
;3065:				self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 3066
;3066:				self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
CNSTI4 0
ASGNI4
line 3068
;3067:
;3068:				trap_LinkEntity(saberent);
ADDRLP4 248
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3069
;3069:			}
ADDRGP4 $1418
JUMPV
LABELV $1421
line 3071
;3070:			else
;3071:			{
line 3072
;3072:				VectorCopy(boltOrigin, saberent->pos1);
ADDRLP4 248
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3073
;3073:				trap_LinkEntity(saberent);
ADDRLP4 248
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3075
;3074:
;3075:				if (saberent->bolt_Head == PROPER_THROWN_VALUE)
ADDRLP4 248
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 999
NEI4 $1418
line 3076
;3076:				{ //return to the owner now, this is a bad state to be in for here..
line 3077
;3077:					saberent->bolt_Head = 0;
ADDRLP4 248
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 3078
;3078:					saberent->think = SaberUpdateSelf;
ADDRLP4 248
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 3079
;3079:					saberent->nextthink = level.time;
ADDRLP4 248
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 3080
;3080:					self->client->ps.saberInFlight = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 3081
;3081:					self->client->ps.saberThrowDelay = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3082
;3082:					self->client->ps.saberCanThrow = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 3083
;3083:				}
line 3084
;3084:			}
line 3085
;3085:		}
line 3086
;3086:	}
ADDRGP4 $1418
JUMPV
LABELV $1417
line 3087
;3087:	else if (!self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1433
line 3088
;3088:	{
line 3089
;3089:		gentity_t *saberent = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 248
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3091
;3090:
;3091:		if (saberent)
ADDRLP4 248
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1435
line 3092
;3092:		{
line 3093
;3093:			saberent->r.svFlags |= (SVF_NOCLIENT);
ADDRLP4 252
ADDRLP4 248
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
ADDRLP4 252
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 3094
;3094:			saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 248
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 3095
;3095:			VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRLP4 248
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 3096
;3096:			VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRLP4 248
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 3097
;3097:			saberent->s.loopSound = 0;
ADDRLP4 248
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 3098
;3098:		}
LABELV $1435
line 3100
;3099:
;3100:		if (self->client->ps.saberLockTime > level.time && self->client->ps.saberEntityNum)
ADDRLP4 252
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1437
ADDRLP4 252
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1437
line 3101
;3101:		{
line 3102
;3102:			if (self->client->ps.saberIdleWound < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1440
line 3103
;3103:			{
line 3106
;3104:				gentity_t *te;
;3105:				vec3_t dir;
;3106:				te = G_TempEntity( g_entities[self->client->ps.saberEntityNum].r.currentOrigin, EV_SABER_BLOCK );
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 272
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 272
INDIRP4
ASGNP4
line 3107
;3107:				VectorSet( dir, 0, 1, 0 );
ADDRLP4 260
CNSTF4 0
ASGNF4
ADDRLP4 260+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 260+8
CNSTF4 0
ASGNF4
line 3108
;3108:				VectorCopy(g_entities[self->client->ps.saberEntityNum].r.currentOrigin, te->s.origin);
ADDRLP4 256
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRB
ASGNB 12
line 3109
;3109:				VectorCopy(dir, te->s.angles);
ADDRLP4 256
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 260
INDIRB
ASGNB 12
line 3110
;3110:				te->s.eventParm = 1;
ADDRLP4 256
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 3112
;3111:
;3112:				self->client->ps.saberIdleWound = level.time + Q_irand(400, 600);
CNSTI4 400
ARGI4
CNSTI4 600
ARGI4
ADDRLP4 276
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 276
INDIRI4
ADDI4
ASGNI4
line 3113
;3113:			}
LABELV $1440
line 3115
;3114:
;3115:			VectorCopy(boltOrigin, self->client->lastSaberBase);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1744
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3116
;3116:			VectorCopy(end, self->client->lastSaberTip);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3117
;3117:			self->client->hasCurrentPosition = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1784
ADDP4
CNSTI4 1
ASGNI4
line 3119
;3118:
;3119:			self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 3121
;3120:
;3121:			goto finalUpdate;
ADDRGP4 $1382
JUMPV
LABELV $1437
line 3124
;3122:		}
;3123:
;3124:		if (self->client->ps.dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1450
line 3125
;3125:		{
line 3126
;3126:			self->client->ps.saberIdleWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 3127
;3127:			self->client->ps.saberAttackWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 3128
;3128:		}
LABELV $1450
line 3130
;3129:
;3130:		if (self->client->hasCurrentPosition && g_saberInterpolate.integer)
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1784
ADDP4
INDIRI4
ADDRLP4 256
INDIRI4
EQI4 $1452
ADDRGP4 g_saberInterpolate+12
INDIRI4
ADDRLP4 256
INDIRI4
EQI4 $1452
line 3131
;3131:		{
line 3132
;3132:			if (g_saberInterpolate.integer == 1)
ADDRGP4 g_saberInterpolate+12
INDIRI4
CNSTI4 1
NEI4 $1455
line 3133
;3133:			{
line 3134
;3134:				int trMask = CONTENTS_LIGHTSABER|CONTENTS_BODY;
ADDRLP4 396
CNSTI4 262400
ASGNI4
line 3135
;3135:				int sN = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 3136
;3136:				qboolean gotHit = qfalse;
ADDRLP4 392
CNSTI4 0
ASGNI4
line 3138
;3137:				qboolean clientUnlinked[MAX_CLIENTS];
;3138:				qboolean skipSaberTrace = qfalse;
ADDRLP4 400
CNSTI4 0
ASGNI4
line 3140
;3139:				
;3140:				if (!g_saberTraceSaberFirst.integer)
ADDRGP4 g_saberTraceSaberFirst+12
INDIRI4
CNSTI4 0
NEI4 $1458
line 3141
;3141:				{
line 3142
;3142:					skipSaberTrace = qtrue;
ADDRLP4 400
CNSTI4 1
ASGNI4
line 3143
;3143:				}
ADDRGP4 $1459
JUMPV
LABELV $1458
line 3144
;3144:				else if (g_saberTraceSaberFirst.integer < 2 &&
ADDRGP4 g_saberTraceSaberFirst+12
INDIRI4
CNSTI4 2
GEI4 $1461
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $1461
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1461
line 3147
;3145:					g_gametype.integer != GT_TOURNAMENT &&
;3146:					!self->client->ps.duelInProgress)
;3147:				{ //if value is less than 2, and not in a duel, skip
line 3148
;3148:					skipSaberTrace = qtrue;
ADDRLP4 400
CNSTI4 1
ASGNI4
line 3149
;3149:				}
LABELV $1461
LABELV $1459
line 3151
;3150:
;3151:				if (skipSaberTrace)
ADDRLP4 400
INDIRI4
CNSTI4 0
EQI4 $1468
line 3152
;3152:				{ //skip the saber-contents-only trace and get right to the full trace
line 3153
;3153:					trMask = (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT);
ADDRLP4 396
CNSTI4 262929
ASGNI4
line 3154
;3154:				}
ADDRGP4 $1481
JUMPV
line 3156
;3155:				else
;3156:				{
LABELV $1467
line 3158
;3157:					while (sN < MAX_CLIENTS)
;3158:					{
line 3159
;3159:						if (g_entities[sN].inuse && g_entities[sN].client && g_entities[sN].r.linked && g_entities[sN].health > 0 && (g_entities[sN].r.contents & CONTENTS_BODY))
ADDRLP4 404
CNSTI4 828
ADDRLP4 260
INDIRI4
MULI4
ASGNI4
ADDRLP4 408
CNSTI4 0
ASGNI4
ADDRLP4 404
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 408
INDIRI4
EQI4 $1470
ADDRLP4 404
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1470
ADDRLP4 404
INDIRI4
ADDRGP4 g_entities+296
ADDP4
INDIRI4
ADDRLP4 408
INDIRI4
EQI4 $1470
ADDRLP4 404
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 408
INDIRI4
LEI4 $1470
ADDRLP4 404
INDIRI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 408
INDIRI4
EQI4 $1470
line 3160
;3160:						{ //Take this mask off before the saber trace, because we want to hit the saber first
line 3161
;3161:							g_entities[sN].r.contents &= ~CONTENTS_BODY;
ADDRLP4 412
CNSTI4 828
ADDRLP4 260
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
ASGNP4
ADDRLP4 412
INDIRP4
ADDRLP4 412
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 3162
;3162:							clientUnlinked[sN] = qtrue;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 264
ADDP4
CNSTI4 1
ASGNI4
line 3163
;3163:						}
ADDRGP4 $1471
JUMPV
LABELV $1470
line 3165
;3164:						else
;3165:						{
line 3166
;3166:							clientUnlinked[sN] = qfalse;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 264
ADDP4
CNSTI4 0
ASGNI4
line 3167
;3167:						}
LABELV $1471
line 3168
;3168:						sN++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3169
;3169:					}
LABELV $1468
line 3157
ADDRLP4 260
INDIRI4
CNSTI4 32
LTI4 $1467
line 3170
;3170:				}
ADDRGP4 $1481
JUMPV
LABELV $1480
line 3173
;3171:
;3172:				while (!gotHit)
;3173:				{
line 3174
;3174:					if (!CheckSaberDamage(self, boltOrigin, end, qfalse, trMask))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 396
INDIRI4
ARGI4
ADDRLP4 404
ADDRGP4 CheckSaberDamage
CALLI4
ASGNI4
ADDRLP4 404
INDIRI4
CNSTI4 0
NEI4 $1483
line 3175
;3175:					{
line 3176
;3176:						if (!CheckSaberDamage(self, boltOrigin, end, qtrue, trMask))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 396
INDIRI4
ARGI4
ADDRLP4 408
ADDRGP4 CheckSaberDamage
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
NEI4 $1485
line 3177
;3177:						{
line 3189
;3178:							vec3_t oldSaberStart;
;3179:							vec3_t oldSaberEnd;
;3180:							vec3_t saberAngleNow;
;3181:							vec3_t saberAngleBefore;
;3182:							vec3_t saberMidDir;
;3183:							vec3_t saberMidAngle;
;3184:							vec3_t saberMidPoint;
;3185:							vec3_t saberMidEnd;
;3186:							vec3_t saberSubBase;
;3187:							float deltaX, deltaY, deltaZ;
;3188:
;3189:							VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 436
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1744
ADDP4
INDIRB
ASGNB 12
line 3190
;3190:							VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 448
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRB
ASGNB 12
line 3192
;3191:
;3192:							VectorSubtract(oldSaberEnd, oldSaberStart, saberAngleBefore);
ADDRLP4 412
ADDRLP4 448
INDIRF4
ADDRLP4 436
INDIRF4
SUBF4
ASGNF4
ADDRLP4 412+4
ADDRLP4 448+4
INDIRF4
ADDRLP4 436+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 412+8
ADDRLP4 448+8
INDIRF4
ADDRLP4 436+8
INDIRF4
SUBF4
ASGNF4
line 3193
;3193:							vectoangles(saberAngleBefore, saberAngleBefore);
ADDRLP4 412
ARGP4
ADDRLP4 412
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3195
;3194:
;3195:							VectorSubtract(end, boltOrigin, saberAngleNow);
ADDRLP4 424
ADDRLP4 124
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 424+4
ADDRLP4 124+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 424+8
ADDRLP4 124+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 3196
;3196:							vectoangles(saberAngleNow, saberAngleNow);
ADDRLP4 424
ARGP4
ADDRLP4 424
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3198
;3197:
;3198:							deltaX = AngleDelta(saberAngleBefore[0], saberAngleNow[0]);
ADDRLP4 412
INDIRF4
ARGF4
ADDRLP4 424
INDIRF4
ARGF4
ADDRLP4 532
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 472
ADDRLP4 532
INDIRF4
ASGNF4
line 3199
;3199:							deltaY = AngleDelta(saberAngleBefore[1], saberAngleNow[1]);
ADDRLP4 412+4
INDIRF4
ARGF4
ADDRLP4 424+4
INDIRF4
ARGF4
ADDRLP4 536
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 476
ADDRLP4 536
INDIRF4
ASGNF4
line 3200
;3200:							deltaZ = AngleDelta(saberAngleBefore[2], saberAngleNow[2]);
ADDRLP4 412+8
INDIRF4
ARGF4
ADDRLP4 424+8
INDIRF4
ARGF4
ADDRLP4 540
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 480
ADDRLP4 540
INDIRF4
ASGNF4
line 3202
;3201:
;3202:							if ( (deltaX != 0 || deltaY != 0 || deltaZ != 0) && deltaX < 180 && deltaY < 180 && deltaZ < 180 && (BG_SaberInAttack(self->client->ps.saberMove) || PM_SaberInTransition(self->client->ps.saberMove)) )
ADDRLP4 544
CNSTF4 0
ASGNF4
ADDRLP4 472
INDIRF4
ADDRLP4 544
INDIRF4
NEF4 $1506
ADDRLP4 476
INDIRF4
ADDRLP4 544
INDIRF4
NEF4 $1506
ADDRLP4 480
INDIRF4
ADDRLP4 544
INDIRF4
EQF4 $1484
LABELV $1506
ADDRLP4 548
CNSTF4 1127481344
ASGNF4
ADDRLP4 472
INDIRF4
ADDRLP4 548
INDIRF4
GEF4 $1484
ADDRLP4 476
INDIRF4
ADDRLP4 548
INDIRF4
GEF4 $1484
ADDRLP4 480
INDIRF4
ADDRLP4 548
INDIRF4
GEF4 $1484
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
NEI4 $1507
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 556
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $1484
LABELV $1507
line 3203
;3203:							{ //don't go beyond here if we aren't attacking/transitioning or the angle is too large.
line 3205
;3204:							  //and don't bother if the angle is the same
;3205:								saberMidAngle[0] = saberAngleBefore[0] + (deltaX/2);
ADDRLP4 508
ADDRLP4 412
INDIRF4
ADDRLP4 472
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 3206
;3206:								saberMidAngle[1] = saberAngleBefore[1] + (deltaY/2);
ADDRLP4 508+4
ADDRLP4 412+4
INDIRF4
ADDRLP4 476
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 3207
;3207:								saberMidAngle[2] = saberAngleBefore[2] + (deltaZ/2);
ADDRLP4 508+8
ADDRLP4 412+8
INDIRF4
ADDRLP4 480
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 3211
;3208:
;3209:								//Now that I have the angle, I'll just say the base for it is the difference between the two start
;3210:								//points (even though that's quite possibly completely false)
;3211:								VectorSubtract(boltOrigin, oldSaberStart, saberSubBase);
ADDRLP4 484
ADDRLP4 0
INDIRF4
ADDRLP4 436
INDIRF4
SUBF4
ASGNF4
ADDRLP4 484+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 436+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 484+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 436+8
INDIRF4
SUBF4
ASGNF4
line 3212
;3212:								saberMidPoint[0] = boltOrigin[0] + (saberSubBase[0]*0.5);
ADDRLP4 460
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
ADDRLP4 484
INDIRF4
MULF4
ADDF4
ASGNF4
line 3213
;3213:								saberMidPoint[1] = boltOrigin[1] + (saberSubBase[1]*0.5);
ADDRLP4 460+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1056964608
ADDRLP4 484+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3214
;3214:								saberMidPoint[2] = boltOrigin[2] + (saberSubBase[2]*0.5);
ADDRLP4 460+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 484+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3216
;3215:
;3216:								AngleVectors(saberMidAngle, saberMidDir, 0, 0);
ADDRLP4 508
ARGP4
ADDRLP4 496
ARGP4
ADDRLP4 560
CNSTP4 0
ASGNP4
ADDRLP4 560
INDIRP4
ARGP4
ADDRLP4 560
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3217
;3217:								saberMidEnd[0] = saberMidPoint[0] + saberMidDir[0]*40; //40 == saber length
ADDRLP4 520
ADDRLP4 460
INDIRF4
CNSTF4 1109393408
ADDRLP4 496
INDIRF4
MULF4
ADDF4
ASGNF4
line 3218
;3218:								saberMidEnd[1] = saberMidPoint[1] + saberMidDir[1]*40;
ADDRLP4 520+4
ADDRLP4 460+4
INDIRF4
CNSTF4 1109393408
ADDRLP4 496+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3219
;3219:								saberMidEnd[2] = saberMidPoint[2] + saberMidDir[2]*40;
ADDRLP4 520+8
ADDRLP4 460+8
INDIRF4
CNSTF4 1109393408
ADDRLP4 496+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3244
;3220:
;3221:								//Now that we have the difference points, check from them to both the old position and the new
;3222:								/*
;3223:								if (!CheckSaberDamage(self, saberMidPoint, saberMidEnd, qtrue, trMask)) //this checks between mid and old
;3224:								{ //that didn't hit, so copy the mid over the old and check between the new and mid
;3225:									VectorCopy(saberMidPoint, self->client->lastSaberBase);
;3226:									VectorCopy(saberMidEnd, self->client->lastSaberTip);
;3227:
;3228:									if (CheckSaberDamage(self, boltOrigin, end, qtrue, trMask))
;3229:									{
;3230:										gotHit = qtrue;
;3231:									}
;3232:
;3233:									//Then copy the old oldpoints in back for good measure
;3234:									VectorCopy(oldSaberStart, self->client->lastSaberBase);
;3235:									VectorCopy(oldSaberEnd, self->client->lastSaberTip);
;3236:								}
;3237:								else
;3238:								{
;3239:									gotHit = qtrue;
;3240:								}
;3241:								*/
;3242:								//The above was more aggressive in approach, but it did add way too many traces unfortunately.
;3243:								//I'll just trace straight out and not even trace between positions instead.
;3244:								if (CheckSaberDamage(self, saberMidPoint, saberMidEnd, qfalse, trMask))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 460
ARGP4
ADDRLP4 520
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 396
INDIRI4
ARGI4
ADDRLP4 564
ADDRGP4 CheckSaberDamage
CALLI4
ASGNI4
ADDRLP4 564
INDIRI4
CNSTI4 0
EQI4 $1484
line 3245
;3245:								{
line 3246
;3246:									gotHit = qtrue;
ADDRLP4 392
CNSTI4 1
ASGNI4
line 3247
;3247:								}
line 3248
;3248:							}
line 3249
;3249:						}
ADDRGP4 $1484
JUMPV
LABELV $1485
line 3251
;3250:						else
;3251:						{
line 3252
;3252:							gotHit = qtrue;
ADDRLP4 392
CNSTI4 1
ASGNI4
line 3253
;3253:						}
line 3254
;3254:					}
ADDRGP4 $1484
JUMPV
LABELV $1483
line 3256
;3255:					else
;3256:					{
line 3257
;3257:						gotHit = qtrue;
ADDRLP4 392
CNSTI4 1
ASGNI4
line 3258
;3258:					}
LABELV $1484
line 3260
;3259:
;3260:					if (g_saberTraceSaberFirst.integer)
ADDRGP4 g_saberTraceSaberFirst+12
INDIRI4
CNSTI4 0
EQI4 $1532
line 3261
;3261:					{
line 3262
;3262:						sN = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 $1536
JUMPV
LABELV $1535
line 3264
;3263:						while (sN < MAX_CLIENTS)
;3264:						{
line 3265
;3265:							if (clientUnlinked[sN])
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1538
line 3266
;3266:							{ //Make clients clip properly again.
line 3267
;3267:								if (g_entities[sN].inuse && g_entities[sN].health > 0)
ADDRLP4 408
CNSTI4 828
ADDRLP4 260
INDIRI4
MULI4
ASGNI4
ADDRLP4 412
CNSTI4 0
ASGNI4
ADDRLP4 408
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 412
INDIRI4
EQI4 $1540
ADDRLP4 408
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 412
INDIRI4
LEI4 $1540
line 3268
;3268:								{
line 3269
;3269:									g_entities[sN].r.contents |= CONTENTS_BODY;
ADDRLP4 416
CNSTI4 828
ADDRLP4 260
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
ASGNP4
ADDRLP4 416
INDIRP4
ADDRLP4 416
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 3270
;3270:								}
LABELV $1540
line 3271
;3271:							}
LABELV $1538
line 3272
;3272:							sN++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3273
;3273:						}
LABELV $1536
line 3263
ADDRLP4 260
INDIRI4
CNSTI4 32
LTI4 $1535
line 3274
;3274:					}
LABELV $1532
line 3276
;3275:
;3276:					if (!gotHit)
ADDRLP4 392
INDIRI4
CNSTI4 0
NEI4 $1546
line 3277
;3277:					{
line 3278
;3278:						if (trMask != (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT))
ADDRLP4 396
INDIRI4
CNSTI4 262929
EQI4 $1548
line 3279
;3279:						{
line 3280
;3280:							trMask = (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT);
ADDRLP4 396
CNSTI4 262929
ASGNI4
line 3281
;3281:						}
ADDRGP4 $1549
JUMPV
LABELV $1548
line 3283
;3282:						else
;3283:						{
line 3284
;3284:							gotHit = qtrue; //break out of the loop
ADDRLP4 392
CNSTI4 1
ASGNI4
line 3285
;3285:						}
LABELV $1549
line 3286
;3286:					}
LABELV $1546
line 3287
;3287:				}
LABELV $1481
line 3172
ADDRLP4 392
INDIRI4
CNSTI4 0
EQI4 $1480
line 3288
;3288:			}
ADDRGP4 $1453
JUMPV
LABELV $1455
line 3289
;3289:			else if (g_saberInterpolate.integer) //anything but 0 or 1, use the old plain method.
ADDRGP4 g_saberInterpolate+12
INDIRI4
CNSTI4 0
EQI4 $1453
line 3290
;3290:			{
line 3291
;3291:				if (!CheckSaberDamage(self, boltOrigin, end, qfalse, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 0
ARGI4
CNSTI4 262929
ARGI4
ADDRLP4 260
ADDRGP4 CheckSaberDamage
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $1453
line 3292
;3292:				{
line 3293
;3293:					CheckSaberDamage(self, boltOrigin, end, qtrue, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 1
ARGI4
CNSTI4 262929
ARGI4
ADDRGP4 CheckSaberDamage
CALLI4
pop
line 3294
;3294:				}
line 3295
;3295:			}
line 3296
;3296:		}
ADDRGP4 $1453
JUMPV
LABELV $1452
line 3298
;3297:		else
;3298:		{
line 3299
;3299:			CheckSaberDamage(self, boltOrigin, end, qfalse, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 0
ARGI4
CNSTI4 262929
ARGI4
ADDRGP4 CheckSaberDamage
CALLI4
pop
line 3300
;3300:		}
LABELV $1453
line 3302
;3301:
;3302:		if (self->client->ps.dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1555
line 3303
;3303:		{
line 3306
;3304:			vec3_t otherOrg, otherEnd;
;3305:
;3306:			VectorMA( boltOrigin, -12, rawAngles, otherOrg );
ADDRLP4 284
CNSTF4 3242196992
ASGNF4
ADDRLP4 260
ADDRLP4 0
INDIRF4
ADDRLP4 284
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 284
INDIRF4
ADDRLP4 184+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3242196992
ADDRLP4 184+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3307
;3307:			VectorMA( otherOrg, -40, rawAngles, otherEnd );
ADDRLP4 288
CNSTF4 3256877056
ASGNF4
ADDRLP4 272
ADDRLP4 260
INDIRF4
ADDRLP4 288
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 272+4
ADDRLP4 260+4
INDIRF4
ADDRLP4 288
INDIRF4
ADDRLP4 184+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 272+8
ADDRLP4 260+8
INDIRF4
CNSTF4 3256877056
ADDRLP4 184+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3309
;3308:
;3309:			self->client->ps.saberIdleWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 3310
;3310:			self->client->ps.saberAttackWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 3312
;3311:
;3312:			CheckSaberDamage(self, otherOrg, otherEnd, qfalse, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 272
ARGP4
CNSTI4 0
ARGI4
CNSTI4 262929
ARGI4
ADDRGP4 CheckSaberDamage
CALLI4
pop
line 3313
;3313:		}
LABELV $1555
line 3315
;3314:
;3315:		VectorCopy(boltOrigin, self->client->lastSaberBase);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1744
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3316
;3316:		VectorCopy(end, self->client->lastSaberTip);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3317
;3317:		self->client->hasCurrentPosition = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1784
ADDP4
CNSTI4 1
ASGNI4
line 3319
;3318:
;3319:		self->client->ps.saberEntityState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 3320
;3320:	}
LABELV $1433
LABELV $1418
LABELV $1382
line 3322
;3321:finalUpdate:
;3322:	if (self->client->ps.saberLockFrame)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1569
line 3323
;3323:	{
line 3324
;3324:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "model_root", self->client->ps.saberLockFrame, self->client->ps.saberLockFrame+1, BONE_ANIM_OVERRIDE_FREEZE|BONE_ANIM_BLEND, animSpeedScale, level.time, -1, 150);
ADDRLP4 248
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1571
ARGP4
ADDRLP4 252
ADDRLP4 248
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 252
INDIRI4
ARGI4
ADDRLP4 252
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 3325
;3325:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "lower_lumbar", self->client->ps.saberLockFrame, self->client->ps.saberLockFrame+1, BONE_ANIM_OVERRIDE_FREEZE|BONE_ANIM_BLEND, animSpeedScale, level.time, -1, 150);
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $215
ARGP4
ADDRLP4 260
ADDRLP4 256
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 3326
;3326:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "Motion", self->client->ps.saberLockFrame, self->client->ps.saberLockFrame+1, BONE_ANIM_OVERRIDE_FREEZE|BONE_ANIM_BLEND, animSpeedScale, level.time, -1, 150);
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1574
ARGP4
ADDRLP4 268
ADDRLP4 264
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 268
INDIRI4
ARGI4
ADDRLP4 268
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 3327
;3327:		return;
ADDRGP4 $1336
JUMPV
LABELV $1569
line 3330
;3328:	}
;3329:
;3330:	if (self->client->ps.legsAnimExecute != legsAnim)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $1576
line 3331
;3331:	{
line 3332
;3332:		float animSpeed = 50.0f / bgGlobalAnimations[legsAnim].frameLerp;
ADDRLP4 248
CNSTF4 1112014848
CNSTI4 28
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 3334
;3333:		int aFlags;
;3334:		animSpeedScale = (animSpeed *= animSpeedScale);
ADDRLP4 256
ADDRLP4 248
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 248
ADDRLP4 256
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 256
INDIRF4
ASGNF4
line 3336
;3335:
;3336:		if (bgGlobalAnimations[legsAnim].loopFrames != -1)
CNSTI4 28
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1579
line 3337
;3337:		{
line 3338
;3338:			aFlags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 252
CNSTI4 16
ASGNI4
line 3339
;3339:		}
ADDRGP4 $1580
JUMPV
LABELV $1579
line 3341
;3340:		else
;3341:		{
line 3342
;3342:			aFlags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 252
CNSTI4 72
ASGNI4
line 3343
;3343:		}
LABELV $1580
line 3345
;3344:
;3345:		aFlags |= BONE_ANIM_BLEND; //since client defaults to blend. Not sure if this will make much difference if any on server position, but it's here just for the sake of matching them.
ADDRLP4 252
ADDRLP4 252
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 3347
;3346:
;3347:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "model_root", bgGlobalAnimations[legsAnim].firstFrame, bgGlobalAnimations[legsAnim].firstFrame+bgGlobalAnimations[legsAnim].numFrames, aFlags, animSpeedScale, level.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1571
ARGP4
ADDRLP4 260
CNSTI4 28
ADDRLP4 120
INDIRI4
MULI4
ASGNI4
ADDRLP4 264
ADDRLP4 260
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
ARGI4
ADDRLP4 264
INDIRI4
ADDRLP4 260
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 252
INDIRI4
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 3348
;3348:		self->client->ps.legsAnimExecute = legsAnim;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 3349
;3349:	}
LABELV $1576
line 3350
;3350:	if (self->client->ps.torsoAnimExecute != torsoAnim)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $1584
line 3351
;3351:	{
line 3353
;3352:		int initialFrame;
;3353:		int aFlags = 0;
ADDRLP4 248
CNSTI4 0
ASGNI4
line 3354
;3354:		float animSpeed = 0;
ADDRLP4 252
CNSTF4 0
ASGNF4
line 3356
;3355:
;3356:		f = torsoAnim;
ADDRLP4 136
ADDRLP4 92
INDIRI4
ASGNI4
line 3358
;3357:
;3358:		initialFrame = bgGlobalAnimations[f].firstFrame;
ADDRLP4 256
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ASGNI4
line 3360
;3359:	
;3360:		BG_SaberStartTransAnim(self->client->ps.fd.saberAnimLevel, f, &animSpeedScale);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_SaberStartTransAnim
CALLV
pop
line 3362
;3361:
;3362:		animSpeed = 50.0f / bgGlobalAnimations[f].frameLerp;
ADDRLP4 252
CNSTF4 1112014848
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 3363
;3363:		animSpeedScale = (animSpeed *= animSpeedScale);
ADDRLP4 260
ADDRLP4 252
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 252
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 260
INDIRF4
ASGNF4
line 3365
;3364:
;3365:		if (bgGlobalAnimations[f].loopFrames != -1)
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1587
line 3366
;3366:		{
line 3367
;3367:			aFlags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 248
CNSTI4 16
ASGNI4
line 3368
;3368:		}
ADDRGP4 $1588
JUMPV
LABELV $1587
line 3370
;3369:		else
;3370:		{
line 3371
;3371:			aFlags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 248
CNSTI4 72
ASGNI4
line 3372
;3372:		}
LABELV $1588
line 3374
;3373:
;3374:		aFlags |= BONE_ANIM_BLEND; //since client defaults to blend. Not sure if this will make much difference if any on client position, but it's here just for the sake of matching them.
ADDRLP4 248
ADDRLP4 248
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 3376
;3375:
;3376:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "lower_lumbar", initialFrame, bgGlobalAnimations[f].firstFrame+bgGlobalAnimations[f].numFrames, aFlags, animSpeedScale, level.time, initialFrame, 150);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $215
ARGP4
ADDRLP4 264
ADDRLP4 256
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
ARGI4
ADDRLP4 268
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ASGNI4
ADDRLP4 268
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 248
INDIRI4
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 264
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 3378
;3377:
;3378:		self->client->ps.torsoAnimExecute = torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 3380
;3379:		
;3380:		setTorso = qtrue;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 3381
;3381:	}
LABELV $1584
line 3383
;3382:
;3383:	if (!BG_FlippingAnim( self->client->ps.legsAnim ) &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 248
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
NEI4 $1592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 252
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 0
NEI4 $1592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $1592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $1592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $1592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $1592
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 272
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 276
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $1592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $1592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 284
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $1592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 288
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 288
INDIRI4
ADDRLP4 292
INDIRI4
NEI4 $1592
ADDRLP4 144
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $1592
line 3394
;3384:		!BG_FlippingAnim( self->client->ps.torsoAnim ) &&
;3385:		!BG_SpinningSaberAnim( self->client->ps.legsAnim ) &&
;3386:		!BG_SpinningSaberAnim( self->client->ps.torsoAnim ) &&
;3387:		!BG_InSpecialJump( self->client->ps.legsAnim ) &&
;3388:		!BG_InSpecialJump( self->client->ps.torsoAnim ) &&
;3389:		!BG_InRoll(&self->client->ps, self->client->ps.legsAnim) &&
;3390:		!BG_SaberInSpecial(self->client->ps.saberMove) &&
;3391:		!BG_SaberInSpecialAttack(self->client->ps.legsAnim) &&
;3392:		!BG_SaberInSpecialAttack(self->client->ps.torsoAnim) &&
;3393:		setTorso )
;3394:	{
line 3395
;3395:		float animSpeed = 50.0f / bgGlobalAnimations[torsoAnim].frameLerp;
ADDRLP4 296
CNSTF4 1112014848
CNSTI4 28
ADDRLP4 92
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 3397
;3396:		int aFlags;
;3397:		animSpeedScale = (animSpeed *= animSpeedScale);
ADDRLP4 304
ADDRLP4 296
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 296
ADDRLP4 304
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 304
INDIRF4
ASGNF4
line 3399
;3398:
;3399:		if (bgGlobalAnimations[torsoAnim].loopFrames != -1)
CNSTI4 28
ADDRLP4 92
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1595
line 3400
;3400:		{
line 3401
;3401:			aFlags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 300
CNSTI4 16
ASGNI4
line 3402
;3402:		}
ADDRGP4 $1596
JUMPV
LABELV $1595
line 3404
;3403:		else
;3404:		{
line 3405
;3405:			aFlags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 300
CNSTI4 72
ASGNI4
line 3406
;3406:		}
LABELV $1596
line 3408
;3407:
;3408:		aFlags |= BONE_ANIM_BLEND; //since client defaults to blend. Not sure if this will make much difference if any on client position, but it's here just for the sake of matching them.
ADDRLP4 300
ADDRLP4 300
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 3410
;3409:
;3410:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "Motion", bgGlobalAnimations[torsoAnim].firstFrame, bgGlobalAnimations[torsoAnim].firstFrame+bgGlobalAnimations[torsoAnim].numFrames, aFlags, animSpeedScale, level.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1574
ARGP4
ADDRLP4 308
CNSTI4 28
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 312
ADDRLP4 308
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
ARGI4
ADDRLP4 312
INDIRI4
ADDRLP4 308
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 3411
;3411:	}
LABELV $1592
line 3412
;3412:}
LABELV $1336
endproc WP_SaberPositionUpdate 568 40
export WP_MissileBlockForBlock
proc WP_MissileBlockForBlock 4 0
line 3415
;3413:
;3414:int WP_MissileBlockForBlock( int saberBlock )
;3415:{
line 3416
;3416:	switch( saberBlock )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $1601
ADDRLP4 0
INDIRI4
CNSTI4 8
GTI4 $1601
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1608-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1608
address $1603
address $1604
address $1605
address $1606
address $1607
code
line 3417
;3417:	{
LABELV $1603
line 3419
;3418:	case BLOCKED_UPPER_RIGHT:
;3419:		return BLOCKED_UPPER_RIGHT_PROJ;
CNSTI4 9
RETI4
ADDRGP4 $1600
JUMPV
line 3420
;3420:		break;
LABELV $1604
line 3422
;3421:	case BLOCKED_UPPER_LEFT:
;3422:		return BLOCKED_UPPER_LEFT_PROJ;
CNSTI4 10
RETI4
ADDRGP4 $1600
JUMPV
line 3423
;3423:		break;
LABELV $1605
line 3425
;3424:	case BLOCKED_LOWER_RIGHT:
;3425:		return BLOCKED_LOWER_RIGHT_PROJ;
CNSTI4 11
RETI4
ADDRGP4 $1600
JUMPV
line 3426
;3426:		break;
LABELV $1606
line 3428
;3427:	case BLOCKED_LOWER_LEFT:
;3428:		return BLOCKED_LOWER_LEFT_PROJ;
CNSTI4 12
RETI4
ADDRGP4 $1600
JUMPV
line 3429
;3429:		break;
LABELV $1607
line 3431
;3430:	case BLOCKED_TOP:
;3431:		return BLOCKED_TOP_PROJ;
CNSTI4 13
RETI4
ADDRGP4 $1600
JUMPV
line 3432
;3432:		break;
LABELV $1601
line 3434
;3433:	}
;3434:	return saberBlock;
ADDRFP4 0
INDIRI4
RETI4
LABELV $1600
endproc WP_MissileBlockForBlock 4 0
lit
align 4
LABELV $1611
byte 4 0
byte 4 0
byte 4 0
export WP_SaberBlockNonRandom
code
proc WP_SaberBlockNonRandom 72 16
line 3438
;3435:}
;3436:
;3437:void WP_SaberBlockNonRandom( gentity_t *self, vec3_t hitloc, qboolean missileBlock )
;3438:{
line 3439
;3439:	vec3_t diff, fwdangles={0,0,0}, right;
ADDRLP4 36
ADDRGP4 $1611
INDIRB
ASGNB 12
line 3444
;3440:	vec3_t clEye;
;3441:	float rightdot;
;3442:	float zdiff;
;3443:
;3444:	VectorCopy(self->client->ps.origin, clEye);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3445
;3445:	clEye[2] += self->client->ps.viewheight;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3447
;3446:
;3447:	VectorSubtract( hitloc, clEye, diff );
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 3448
;3448:	diff[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 3449
;3449:	VectorNormalize( diff );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3451
;3450:
;3451:	fwdangles[1] = self->client->ps.viewangles[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 3453
;3452:	// Ultimately we might care if the shot was ahead or behind, but for now, just quadrant is fine.
;3453:	AngleVectors( fwdangles, NULL, right, NULL );
ADDRLP4 36
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3455
;3454:
;3455:	rightdot = DotProduct(right, diff);
ADDRLP4 52
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3456
;3456:	zdiff = hitloc[2] - clEye[2];
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 3458
;3457:	
;3458:	if ( zdiff > 0 )
ADDRLP4 48
INDIRF4
CNSTF4 0
LEF4 $1624
line 3459
;3459:	{
line 3460
;3460:		if ( rightdot > 0.3 )
ADDRLP4 52
INDIRF4
CNSTF4 1050253722
LEF4 $1626
line 3461
;3461:		{
line 3462
;3462:			self->client->ps.saberBlocked = BLOCKED_UPPER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 3463
;3463:		}
ADDRGP4 $1625
JUMPV
LABELV $1626
line 3464
;3464:		else if ( rightdot < -0.3 )
ADDRLP4 52
INDIRF4
CNSTF4 3197737370
GEF4 $1628
line 3465
;3465:		{
line 3466
;3466:			self->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 3467
;3467:		}
ADDRGP4 $1625
JUMPV
LABELV $1628
line 3469
;3468:		else
;3469:		{
line 3470
;3470:			self->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 8
ASGNI4
line 3471
;3471:		}
line 3472
;3472:	}
ADDRGP4 $1625
JUMPV
LABELV $1624
line 3473
;3473:	else if ( zdiff > -20 )//20 )
ADDRLP4 48
INDIRF4
CNSTF4 3248488448
LEF4 $1630
line 3474
;3474:	{
line 3475
;3475:		if ( zdiff < -10 )//30 )
ADDRLP4 48
INDIRF4
CNSTF4 3240099840
GEF4 $1632
line 3476
;3476:		{//hmm, pretty low, but not low enough to use the low block, so we need to duck
line 3478
;3477:			
;3478:		}
LABELV $1632
line 3479
;3479:		if ( rightdot > 0.1 )
ADDRLP4 52
INDIRF4
CNSTF4 1036831949
LEF4 $1634
line 3480
;3480:		{
line 3481
;3481:			self->client->ps.saberBlocked = BLOCKED_UPPER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 3482
;3482:		}
ADDRGP4 $1631
JUMPV
LABELV $1634
line 3483
;3483:		else if ( rightdot < -0.1 )
ADDRLP4 52
INDIRF4
CNSTF4 3184315597
GEF4 $1636
line 3484
;3484:		{
line 3485
;3485:			self->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 3486
;3486:		}
ADDRGP4 $1631
JUMPV
LABELV $1636
line 3488
;3487:		else
;3488:		{
line 3489
;3489:			self->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 8
ASGNI4
line 3490
;3490:		}
line 3491
;3491:	}
ADDRGP4 $1631
JUMPV
LABELV $1630
line 3493
;3492:	else
;3493:	{
line 3494
;3494:		if ( rightdot >= 0 )
ADDRLP4 52
INDIRF4
CNSTF4 0
LTF4 $1638
line 3495
;3495:		{
line 3496
;3496:			self->client->ps.saberBlocked = BLOCKED_LOWER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 6
ASGNI4
line 3497
;3497:		}
ADDRGP4 $1639
JUMPV
LABELV $1638
line 3499
;3498:		else
;3499:		{
line 3500
;3500:			self->client->ps.saberBlocked = BLOCKED_LOWER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 3501
;3501:		}
LABELV $1639
line 3502
;3502:	}
LABELV $1631
LABELV $1625
line 3504
;3503:
;3504:	if ( missileBlock )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1640
line 3505
;3505:	{
line 3506
;3506:		self->client->ps.saberBlocked = WP_MissileBlockForBlock( self->client->ps.saberBlocked );
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 WP_MissileBlockForBlock
CALLI4
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ASGNI4
line 3507
;3507:	}
LABELV $1640
line 3508
;3508:}
LABELV $1610
endproc WP_SaberBlockNonRandom 72 16
lit
align 4
LABELV $1643
byte 4 0
byte 4 0
byte 4 0
export WP_SaberBlock
code
proc WP_SaberBlock 80 16
line 3511
;3509:
;3510:void WP_SaberBlock( gentity_t *playerent, vec3_t hitloc, qboolean missileBlock )
;3511:{
line 3512
;3512:	vec3_t diff, fwdangles={0,0,0}, right;
ADDRLP4 24
ADDRGP4 $1643
INDIRB
ASGNB 12
line 3516
;3513:	float rightdot;
;3514:	float zdiff;
;3515:
;3516:	VectorSubtract(hitloc, playerent->client->ps.origin, diff);
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3517
;3517:	VectorNormalize(diff);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3519
;3518:
;3519:	fwdangles[1] = playerent->client->ps.viewangles[1];
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 3521
;3520:	// Ultimately we might care if the shot was ahead or behind, but for now, just quadrant is fine.
;3521:	AngleVectors( fwdangles, NULL, right, NULL );
ADDRLP4 24
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3523
;3522:
;3523:	rightdot = DotProduct(right, diff) + RandFloat(-0.2f,0.2f);
CNSTF4 3192704205
ARGF4
CNSTF4 1045220557
ARGF4
ADDRLP4 56
ADDRGP4 RandFloat
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ADDRLP4 56
INDIRF4
ADDF4
ASGNF4
line 3524
;3524:	zdiff = hitloc[2] - playerent->client->ps.origin[2] + Q_irand(-8,8);
CNSTI4 -8
ARGI4
ADDRLP4 60
CNSTI4 8
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 36
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ADDRLP4 64
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3527
;3525:	
;3526:	// Figure out what quadrant the block was in.
;3527:	if (zdiff > 24)
ADDRLP4 36
INDIRF4
CNSTF4 1103101952
LEF4 $1651
line 3528
;3528:	{	// Attack from above
line 3529
;3529:		if (Q_irand(0,1))
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1653
line 3530
;3530:		{
line 3531
;3531:			playerent->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 8
ASGNI4
line 3532
;3532:		}
ADDRGP4 $1652
JUMPV
LABELV $1653
line 3534
;3533:		else
;3534:		{
line 3535
;3535:			playerent->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 3536
;3536:		}
line 3537
;3537:	}
ADDRGP4 $1652
JUMPV
LABELV $1651
line 3538
;3538:	else if (zdiff > 13)
ADDRLP4 36
INDIRF4
CNSTF4 1095761920
LEF4 $1655
line 3539
;3539:	{	// The upper half has three viable blocks...
line 3540
;3540:		if (rightdot > 0.25)
ADDRLP4 40
INDIRF4
CNSTF4 1048576000
LEF4 $1657
line 3541
;3541:		{	// In the right quadrant...
line 3542
;3542:			if (Q_irand(0,1))
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1659
line 3543
;3543:			{
line 3544
;3544:				playerent->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 3545
;3545:			}
ADDRGP4 $1656
JUMPV
LABELV $1659
line 3547
;3546:			else
;3547:			{
line 3548
;3548:				playerent->client->ps.saberBlocked = BLOCKED_LOWER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 3549
;3549:			}
line 3550
;3550:		}
ADDRGP4 $1656
JUMPV
LABELV $1657
line 3552
;3551:		else
;3552:		{
line 3553
;3553:			switch(Q_irand(0,3))
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 72
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
LTI4 $1656
ADDRLP4 68
INDIRI4
CNSTI4 3
GTI4 $1656
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1667
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1667
address $1664
address $1665
address $1665
address $1666
code
line 3554
;3554:			{
LABELV $1664
line 3556
;3555:			case 0:
;3556:				playerent->client->ps.saberBlocked = BLOCKED_UPPER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 3557
;3557:				break;
ADDRGP4 $1656
JUMPV
LABELV $1665
line 3560
;3558:			case 1:
;3559:			case 2:
;3560:				playerent->client->ps.saberBlocked = BLOCKED_LOWER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 6
ASGNI4
line 3561
;3561:				break;
ADDRGP4 $1656
JUMPV
LABELV $1666
line 3563
;3562:			case 3:
;3563:				playerent->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 8
ASGNI4
line 3564
;3564:				break;
line 3566
;3565:			}
;3566:		}
line 3567
;3567:	}
ADDRGP4 $1656
JUMPV
LABELV $1655
line 3569
;3568:	else
;3569:	{	// The lower half is a bit iffy as far as block coverage.  Pick one of the "low" ones at random.
line 3570
;3570:		if (Q_irand(0,1))
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1668
line 3571
;3571:		{
line 3572
;3572:			playerent->client->ps.saberBlocked = BLOCKED_LOWER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 6
ASGNI4
line 3573
;3573:		}
ADDRGP4 $1669
JUMPV
LABELV $1668
line 3575
;3574:		else
;3575:		{
line 3576
;3576:			playerent->client->ps.saberBlocked = BLOCKED_LOWER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 3577
;3577:		}
LABELV $1669
line 3578
;3578:	}
LABELV $1656
LABELV $1652
line 3580
;3579:
;3580:	if ( missileBlock )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1670
line 3581
;3581:	{
line 3582
;3582:		playerent->client->ps.saberBlocked = WP_MissileBlockForBlock( playerent->client->ps.saberBlocked );
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 WP_MissileBlockForBlock
CALLI4
ASGNI4
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRI4
ASGNI4
line 3583
;3583:	}
LABELV $1670
line 3584
;3584:}
LABELV $1642
endproc WP_SaberBlock 80 16
export WP_SaberCanBlock
proc WP_SaberCanBlock 56 16
line 3587
;3585:
;3586:int WP_SaberCanBlock(gentity_t *self, vec3_t point, int dflags, int mod, qboolean projectile, int attackStr)
;3587:{
line 3588
;3588:	qboolean thrownSaber = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3589
;3589:	float blockFactor = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 3591
;3590:
;3591:	if (!self || !self->client || !point)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1676
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1676
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
NEU4 $1673
LABELV $1676
line 3592
;3592:	{
line 3593
;3593:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1673
line 3596
;3594:	}
;3595:
;3596:	if (attackStr == 8)
ADDRFP4 20
INDIRI4
CNSTI4 8
NEI4 $1677
line 3597
;3597:	{
line 3598
;3598:		attackStr = 0;
ADDRFP4 20
CNSTI4 0
ASGNI4
line 3599
;3599:		thrownSaber = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3600
;3600:	}
LABELV $1677
line 3602
;3601:
;3602:	if (BG_SaberInAttack(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1679
line 3603
;3603:	{
line 3604
;3604:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1679
line 3607
;3605:	}
;3606:
;3607:	if (PM_InSaberAnim(self->client->ps.torsoAnim) && !self->client->ps.saberBlocked &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 PM_InSaberAnim
CALLI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1681
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $1681
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $1681
ADDRLP4 32
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1681
line 3609
;3608:		self->client->ps.saberMove != LS_READY && self->client->ps.saberMove != LS_NONE)
;3609:	{
line 3610
;3610:		if ( self->client->ps.saberMove < LS_PARRY_UP || self->client->ps.saberMove > LS_REFLECT_LL )
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 108
LTI4 $1685
ADDRLP4 36
INDIRI4
CNSTI4 117
LEI4 $1683
LABELV $1685
line 3611
;3611:		{
line 3612
;3612:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1683
line 3614
;3613:		}
;3614:	}
LABELV $1681
line 3616
;3615:
;3616:	if (PM_SaberInBrokenParry(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1686
line 3617
;3617:	{
line 3618
;3618:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1686
line 3621
;3619:	}
;3620:
;3621:	if (self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1688
line 3622
;3622:	{
line 3623
;3623:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1688
line 3626
;3624:	}
;3625:
;3626:	if (self->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1690
line 3627
;3627:	{
line 3628
;3628:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1690
line 3631
;3629:	}
;3630:
;3631:	if (self->client->ps.weapon != WP_SABER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1692
line 3632
;3632:	{
line 3633
;3633:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1692
line 3636
;3634:	}
;3635:
;3636:	if (self->client->ps.weaponstate == WEAPON_RAISING)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1694
line 3637
;3637:	{
line 3638
;3638:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1694
line 3641
;3639:	}
;3640:
;3641:	if (self->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1696
line 3642
;3642:	{
line 3643
;3643:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1696
line 3646
;3644:	}
;3645:
;3646:	if ((self->client->pers.cmd.buttons & BUTTON_ATTACK)/* &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1698
line 3648
;3647:		(projectile || attackStr == FORCE_LEVEL_3)*/)
;3648:	{ //don't block when the player is trying to slash, if it's a projectile or he's doing a very strong attack
line 3649
;3649:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1698
line 3696
;3650:	}
;3651:
;3652:	//Removed this for now, the new broken parry stuff should handle it. This is how
;3653:	//blocks were decided before the 1.03 patch (as you can see, it was STUPID.. for the most part)
;3654:	/*
;3655:	if (attackStr == FORCE_LEVEL_3)
;3656:	{
;3657:		if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
;3658:		{
;3659:			if (Q_irand(1, 10) < 3)
;3660:			{
;3661:				return 0;
;3662:			}
;3663:		}
;3664:		else
;3665:		{
;3666:			return 0;
;3667:		}
;3668:	}
;3669:
;3670:	if (attackStr == FORCE_LEVEL_2 && Q_irand(1, 10) < 3)
;3671:	{
;3672:		if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
;3673:		{
;3674:			//do nothing for now
;3675:		}
;3676:		else if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_2)
;3677:		{
;3678:			if (Q_irand(1, 10) < 5)
;3679:			{
;3680:				return 0;
;3681:			}
;3682:		}
;3683:		else
;3684:		{
;3685:			return 0;
;3686:		}
;3687:	}
;3688:	
;3689:	if (attackStr == FORCE_LEVEL_1 && !self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] &&
;3690:		Q_irand(1, 40) < 3)
;3691:	{ //if I have no defense level at all then I might be unable to block a level 1 attack (but very rarely)
;3692:		return 0;
;3693:	}
;3694:	*/
;3695:
;3696:	if (SaberAttacking(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $1700
line 3697
;3697:	{ //attacking, can't block now
line 3698
;3698:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1700
line 3701
;3699:	}
;3700:
;3701:	if (self->client->ps.saberMove != LS_READY &&
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1702
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1702
line 3703
;3702:		!self->client->ps.saberBlocking)
;3703:	{
line 3704
;3704:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1702
line 3707
;3705:	}
;3706:
;3707:	if (self->client->ps.saberBlockTime >= level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $1704
line 3708
;3708:	{
line 3709
;3709:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1704
line 3712
;3710:	}
;3711:
;3712:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1707
line 3713
;3713:	{
line 3714
;3714:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1707
line 3717
;3715:	}
;3716:
;3717:	if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1709
line 3718
;3718:	{
line 3720
;3719:#ifdef G2_COLLISION_ENABLED
;3720:		if (g_saberGhoul2Collision.integer)
ADDRGP4 g_saberGhoul2Collision+12
INDIRI4
CNSTI4 0
EQI4 $1711
line 3721
;3721:		{
line 3722
;3722:			blockFactor = 0.3f;
ADDRLP4 0
CNSTF4 1050253722
ASGNF4
line 3723
;3723:		}
ADDRGP4 $1710
JUMPV
LABELV $1711
line 3725
;3724:		else
;3725:		{
line 3726
;3726:			blockFactor = 0.05f;
ADDRLP4 0
CNSTF4 1028443341
ASGNF4
line 3727
;3727:		}
line 3731
;3728:#else
;3729:		blockFactor = 0.05f;
;3730:#endif
;3731:	}
ADDRGP4 $1710
JUMPV
LABELV $1709
line 3732
;3732:	else if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1714
line 3733
;3733:	{
line 3734
;3734:		blockFactor = 0.6f;
ADDRLP4 0
CNSTF4 1058642330
ASGNF4
line 3735
;3735:	}
ADDRGP4 $1715
JUMPV
LABELV $1714
line 3736
;3736:	else if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1716
line 3737
;3737:	{
line 3738
;3738:		blockFactor = 0.9f;
ADDRLP4 0
CNSTF4 1063675494
ASGNF4
line 3739
;3739:	}
ADDRGP4 $1717
JUMPV
LABELV $1716
line 3741
;3740:	else
;3741:	{ //for now we just don't get to autoblock with no def
line 3742
;3742:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1717
LABELV $1715
LABELV $1710
line 3745
;3743:	}
;3744:
;3745:	if (thrownSaber)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1718
line 3746
;3746:	{
line 3747
;3747:		blockFactor -= 0.25f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 3748
;3748:	}
LABELV $1718
line 3750
;3749:
;3750:	if (attackStr)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $1720
line 3751
;3751:	{ //blocking a saber, not a projectile.
line 3752
;3752:		blockFactor -= 0.25f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 3753
;3753:	}
LABELV $1720
line 3755
;3754:
;3755:	if (!InFront( point, self->client->ps.origin, self->client->ps.viewangles, blockFactor )) //orig 0.2f
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $1722
line 3756
;3756:	{
line 3757
;3757:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1672
JUMPV
LABELV $1722
line 3760
;3758:	}
;3759:
;3760:	if (projectile)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1724
line 3761
;3761:	{
line 3762
;3762:		WP_SaberBlockNonRandom(self, point, projectile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 3763
;3763:	}
LABELV $1724
line 3764
;3764:	return 1;
CNSTI4 1
RETI4
LABELV $1672
endproc WP_SaberCanBlock 56 16
export HasSetSaberOnly
proc HasSetSaberOnly 16 0
line 3768
;3765:}
;3766:
;3767:qboolean HasSetSaberOnly(void)
;3768:{
line 3769
;3769:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3770
;3770:	int wDisable = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3772
;3771:
;3772:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1727
line 3773
;3773:	{ //set to 0 
line 3774
;3774:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1726
JUMPV
LABELV $1727
line 3777
;3775:	}
;3776:
;3777:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1730
line 3778
;3778:	{
line 3779
;3779:		wDisable = g_duelWeaponDisable.integer;
ADDRLP4 4
ADDRGP4 g_duelWeaponDisable+12
INDIRI4
ASGNI4
line 3780
;3780:	}
ADDRGP4 $1736
JUMPV
LABELV $1730
line 3782
;3781:	else
;3782:	{
line 3783
;3783:		wDisable = g_weaponDisable.integer;
ADDRLP4 4
ADDRGP4 g_weaponDisable+12
INDIRI4
ASGNI4
line 3784
;3784:	}
ADDRGP4 $1736
JUMPV
LABELV $1735
line 3787
;3785:
;3786:	while (i < WP_NUM_WEAPONS)
;3787:	{
line 3788
;3788:		if (!(wDisable & (1 << i)) &&
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $1738
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $1738
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1738
line 3790
;3789:			i != WP_SABER && i != WP_NONE)
;3790:		{
line 3791
;3791:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1726
JUMPV
LABELV $1738
line 3794
;3792:		}
;3793:
;3794:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3795
;3795:	}
LABELV $1736
line 3786
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1735
line 3797
;3796:
;3797:	return qtrue;
CNSTI4 1
RETI4
LABELV $1726
endproc HasSetSaberOnly 16 0
import animTable
import PM_SaberDeflectionForQuad
import PM_SaberBounceForAttack
import PM_SaberInBounce
import PM_SaberInBrokenParry
import PM_SaberInDeflect
import PM_SaberInTransition
import InFront
import botstates
import floattime
import gLevelFlags
import nodenum
import nodetable
import gLastPrintedIndex
import gWPNum
import gWPArray
import gWPRenderedFrame
import gBotEdit
import gDeactivated
import gWPRenderTime
import gBotChatBuffer
import eFlagBlue
import eFlagRed
import oFlagBlue
import flagBlue
import oFlagRed
import flagRed
import bot_wp_visconnect
import bot_wp_distconnect
import bot_wp_clearweight
import bot_wp_edit
import bot_wp_info
import bot_camp
import bot_attachments
import bot_honorableduelacceptance
import bot_forgimmick
import bot_forcepowers
import ConcatArgs
import GetBestIdleGoal
import GetNearestVisibleWP
import BotIsAChickenWuss
import OrgVisibleBox
import BotWaypointRender
import StandardBotAI
import BotDoChat
import BotUtilizePersonality
import NumBots
import BotResetState
import B_Free
import B_Alloc
import B_TempFree
import B_TempAlloc
import forceJumpStrength
import forceJumpHeight
import g_MaxHolocronCarry
import PM_SetForceJumpZStart
import PM_SetSaberMove
import PM_WeaponLightsaber
import PM_SetAnim
import PM_FinishWeaponChange
import PM_BeginWeaponChange
import PM_ForceLegsAnim
import PM_ContinueLegsAnim
import PM_StartTorsoAnim
import BG_CycleInven
import PM_StepSlideMove
import PM_SlideMove
import PM_AddEvent
import PM_AddTouchEnt
import PM_ClipVelocity
import PM_SaberJumpAttackMove
import PM_SaberFlipOverAttackMove
import PM_SomeoneInFront
import PM_GroundDistance
import PM_GetSaberStance
import PM_AnimLength
import PM_InRollComplete
import PM_InOnGroundAnim
import PM_SpinningAnim
import PM_LandingAnim
import PM_JumpingAnim
import PM_PainAnim
import PM_InKnockDown
import PM_InSaberAnim
import PM_SaberInStart
import PM_SaberInReflect
import PM_SaberInKnockaway
import PM_SaberInParry
import forcePowerNeeded
import c_pmove
import pm_flightfriction
import pm_waterfriction
import pm_friction
import pm_flyaccelerate
import pm_wateraccelerate
import pm_airaccelerate
import pm_accelerate
import pm_wadeScale
import pm_swimScale
import pm_duckScale
import pm_stopspeed
import pml
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_ForcePower
import trap_EA_Alt_Attack
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_austrian
import g_saberDebugPrint
import g_saberDmgDelay_Wound
import g_saberDmgDelay_Idle
import g_saberDmgVelocityScale
import g_timeouttospec
import g_forceDodge
import g_dismember
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_debugUp
import g_debugRight
import g_debugForward
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_adaptRespawn
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlySaber
import g_friendlyFire
import g_saberInterpolate
import g_capturelimit
import g_timelimit
import g_duel_fraglimit
import g_fraglimit
import g_duelWeaponDisable
import g_fraglimitVoteCorrection
import g_allowDuelSuicide
import g_weaponDisable
import g_forcePowerDisable
import g_spawnInvulnerability
import g_forceRegenTime
import g_saberDamageScale
import g_slowmoDuelEnd
import g_logClientInfo
import g_saberBoxTraceSize
import g_saberAlwaysBoxTrace
import g_saberGhoul2Collision
import g_saberTraceSaberFirst
import g_saberLockFactor
import g_saberLocking
import g_privateDuel
import g_forceBasedTeams
import g_maxForceRank
import g_dmflags
import g_autoMapCycle
import g_trueJedi
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectSagaSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import B_CleanupAlloc
import B_InitAlloc
import InFieldOfVision
import BotOrder
import OrgVisible
import InitSagaMode
import G_ClearClientLog
import G_LogExit
import G_LogWeaponOutput
import G_LogWeaponInit
import G_LogWeaponItem
import G_LogWeaponPowerup
import G_LogWeaponFrag
import G_LogWeaponDeath
import G_LogWeaponKill
import G_LogWeaponDamage
import G_LogWeaponFire
import G_LogWeaponPickup
import Jedi_DodgeEvasion
import ForceTelepathy
import ForceThrow
import ForceSeeing
import ForceTeamForceReplenish
import ForceTeamHeal
import ForceAbsorb
import ForceProtect
import ForceGrip
import ForceRage
import ForceSpeed
import ForceHeal
import ForcePowerUsableOn
import WP_ForcePowersUpdate
import WP_SpawnInitForcePowers
import WP_InitForcePowers
import WP_ForcePowerStop
import G_PreDefSound
import G_RefreshNextMap
import G_DoesMapSupportGametype
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import G_CheckClientTimeouts
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_GetStripEdString
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import gSlowMoDuelTime
import gDoSlowMoDuel
import g_ff_objectives
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import BlowDetpacks
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import gJMSaberEnt
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import WP_FireGenericBlasterMissile
import WP_FireTurretMissile
import G_CreateExampleAnimEnt
import G_PlayerBecomeATST
import ATST_ManageDamageBoxes
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import WP_FireBlasterMissile
import G_ExplodeMissile
import G_BounceProjectile
import CreateMissile
import G_RunMissile
import G_ReflectMissile
import gGAvoidDismember
import G_CheckForDismemberment
import ExplodeDeath
import TossClientCubes
import TossClientItems
import TossClientWeapon
import body_die
import G_RadiusDamage
import G_Damage
import CanDamage
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CollisionDetect
import trap_G2API_CleanGhoul2Models
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import G_SkinIndex
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_RunObject
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_KillG2Queue
import G_SendG2KillQueue
import TryUse
import G_EntitySound
import G_SoundAtLoc
import G_Sound
import G_MuteSound
import G_ScreenShake
import G_PlayEffect
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetAngles
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_RadiusList
import G_Find
import G_KillBox
import G_TeamCommand
import G_EffectIndex
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import ItemUse_MedPack
import ItemUse_Seeker
import ItemUse_Sentry
import ItemUse_Shield
import ItemUse_Binoculars
import G_GetDuelWinner
import Cmd_EngageDuel_f
import Cmd_ToggleSaber_f
import G_ItemUsable
import Cmd_SaberAttackCycle_f
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import gEscapeTime
import gEscaping
import g2SaberInstance
import precachedKyle
import forcePowerDarkLight
import WeaponAttackAnim
import WeaponReadyAnim
import BG_OutOfMemory
import BG_StringAlloc
import BG_TempFree
import BG_TempAlloc
import BG_AllocUnaligned
import BG_Alloc
import BG_CanUseFPNow
import BG_HasYsalamiri
import BG_GetItemIndexByTag
import BG_ParseAnimationFile
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_ForcePowerDrain
import BG_SaberStartTransAnim
import BG_InDeathAnim
import BG_InRoll
import BG_KnockawayForParry
import BG_BrokenParryForParry
import BG_BrokenParryForAttack
import BG_SaberInSpecialAttack
import BG_SpinningSaberAnim
import BG_FlippingAnim
import BG_SaberInIdle
import BG_SaberInSpecial
import BG_SaberInAttack
import BG_DirectFlippingAnim
import BG_InSaberStandAnim
import BG_InSpecialJump
import BG_LegalizedForcePowers
import saberMoveData
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import vectoyaw
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import pm
import bgForcePowerCost
import forceMasteryPoints
import forceMasteryLevels
import bgGlobalAnimations
import BGPAFtextLoaded
import forcePowerSorted
import WP_MuzzlePoint
import ammoData
import weaponData
import GetStringForID
import GetIDForString
import Q_irand
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseVec4
import COM_ParseFloat
import COM_ParseInt
import COM_ParseString
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import SkipWhitespace
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import powf
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkBlue
import colorLtBlue
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import colorTable
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import forceSpeedLevels
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $1574
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $1571
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 114
char 1 111
char 1 111
char 1 116
char 1 0
align 1
LABELV $1211
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $1207
char 1 100
char 1 101
char 1 97
char 1 100
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $1091
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 98
char 1 114
char 1 111
char 1 107
char 1 101
char 1 32
char 1 116
char 1 104
char 1 114
char 1 111
char 1 117
char 1 103
char 1 104
char 1 32
char 1 37
char 1 105
char 1 39
char 1 115
char 1 32
char 1 112
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 32
char 1 115
char 1 112
char 1 101
char 1 99
char 1 105
char 1 97
char 1 108
char 1 32
char 1 111
char 1 114
char 1 32
char 1 115
char 1 116
char 1 114
char 1 111
char 1 110
char 1 103
char 1 101
char 1 114
char 1 32
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 10
char 1 0
align 1
LABELV $1085
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 104
char 1 105
char 1 116
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 39
char 1 115
char 1 32
char 1 115
char 1 116
char 1 114
char 1 111
char 1 110
char 1 103
char 1 101
char 1 114
char 1 32
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 44
char 1 32
char 1 119
char 1 97
char 1 115
char 1 32
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 100
char 1 32
char 1 105
char 1 110
char 1 116
char 1 111
char 1 32
char 1 97
char 1 32
char 1 98
char 1 114
char 1 111
char 1 107
char 1 101
char 1 110
char 1 32
char 1 112
char 1 97
char 1 114
char 1 114
char 1 121
char 1 10
char 1 0
align 1
LABELV $1078
char 1 69
char 1 113
char 1 117
char 1 97
char 1 108
char 1 32
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 32
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 32
char 1 98
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 47
char 1 100
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 32
char 1 37
char 1 105
char 1 32
char 1 97
char 1 110
char 1 100
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $1068
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 105
char 1 110
char 1 116
char 1 111
char 1 32
char 1 97
char 1 32
char 1 98
char 1 114
char 1 111
char 1 107
char 1 101
char 1 110
char 1 32
char 1 112
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 32
char 1 115
char 1 116
char 1 114
char 1 111
char 1 110
char 1 103
char 1 101
char 1 114
char 1 32
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 10
char 1 0
align 1
LABELV $1045
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 97
char 1 110
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 98
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 100
char 1 32
char 1 111
char 1 102
char 1 102
char 1 32
char 1 111
char 1 102
char 1 32
char 1 101
char 1 97
char 1 99
char 1 104
char 1 32
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 39
char 1 115
char 1 32
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 115
char 1 10
char 1 0
align 1
LABELV $1032
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 98
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 100
char 1 32
char 1 111
char 1 102
char 1 102
char 1 32
char 1 111
char 1 102
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 39
char 1 115
char 1 32
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 10
char 1 0
align 1
LABELV $1026
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 115
char 1 101
char 1 110
char 1 116
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 105
char 1 110
char 1 116
char 1 111
char 1 32
char 1 97
char 1 32
char 1 98
char 1 114
char 1 111
char 1 107
char 1 101
char 1 110
char 1 32
char 1 112
char 1 97
char 1 114
char 1 114
char 1 121
char 1 10
char 1 0
align 1
LABELV $1017
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 115
char 1 101
char 1 110
char 1 116
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 105
char 1 110
char 1 116
char 1 111
char 1 32
char 1 97
char 1 32
char 1 114
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 32
char 1 107
char 1 110
char 1 111
char 1 99
char 1 107
char 1 97
char 1 119
char 1 97
char 1 121
char 1 10
char 1 0
align 1
LABELV $1003
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 99
char 1 108
char 1 97
char 1 115
char 1 104
char 1 101
char 1 100
char 1 32
char 1 105
char 1 110
char 1 116
char 1 111
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 39
char 1 115
char 1 32
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 44
char 1 32
char 1 100
char 1 105
char 1 100
char 1 32
char 1 66
char 1 76
char 1 79
char 1 67
char 1 75
char 1 69
char 1 68
char 1 95
char 1 65
char 1 84
char 1 75
char 1 95
char 1 66
char 1 79
char 1 85
char 1 78
char 1 67
char 1 69
char 1 10
char 1 0
align 1
LABELV $579
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 32
char 1 37
char 1 115
char 1 32
char 1 118
char 1 115
char 1 46
char 1 32
char 1 112
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 37
char 1 115
char 1 32
char 1 100
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $550
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 32
char 1 37
char 1 115
char 1 32
char 1 118
char 1 115
char 1 46
char 1 32
char 1 112
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 37
char 1 115
char 1 32
char 1 98
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $217
char 1 116
char 1 104
char 1 111
char 1 114
char 1 97
char 1 99
char 1 105
char 1 99
char 1 0
align 1
LABELV $215
char 1 108
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 108
char 1 117
char 1 109
char 1 98
char 1 97
char 1 114
char 1 0
align 1
LABELV $213
char 1 117
char 1 112
char 1 112
char 1 101
char 1 114
char 1 95
char 1 108
char 1 117
char 1 109
char 1 98
char 1 97
char 1 114
char 1 0
align 1
LABELV $126
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 104
char 1 117
char 1 109
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $125
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 111
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $124
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 111
char 1 102
char 1 102
char 1 113
char 1 117
char 1 105
char 1 99
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $123
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 115
char 1 112
char 1 105
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $121
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
