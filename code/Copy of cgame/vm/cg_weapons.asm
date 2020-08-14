export CG_SetGhoul2InfoRef
code
proc CG_SetGhoul2InfoRef 16 0
file "../cg_weapons.c"
line 16
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_weapons.c -- events and effects dealing with weapons
;4:#include "cg_local.h"
;5:#include "fx_local.h"
;6:
;7:extern vec4_t	bluehudtint;
;8:extern vec4_t	redhudtint;
;9:extern float	*hudTintColor;
;10:
;11:/*
;12:Ghoul2 Insert Start
;13:*/
;14:// set up the appropriate ghoul2 info to a refent
;15:void CG_SetGhoul2InfoRef( refEntity_t *ent, refEntity_t	*s1)
;16:{
line 17
;17:	ent->ghoul2 = s1->ghoul2;
ADDRLP4 0
CNSTI4 208
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 18
;18:	VectorCopy( s1->modelScale, ent->modelScale);
ADDRLP4 4
CNSTI4 196
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 19
;19:	ent->radius = s1->radius;
ADDRLP4 8
CNSTI4 92
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 20
;20:	VectorCopy( s1->angles, ent->angles);
ADDRLP4 12
CNSTI4 184
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 21
;21:}
LABELV $120
endproc CG_SetGhoul2InfoRef 16 0
export CG_RegisterItemVisuals
proc CG_RegisterItemVisuals 48 28
line 34
;22:
;23:/*
;24:Ghoul2 Insert End
;25:*/
;26:
;27:/*
;28:=================
;29:CG_RegisterItemVisuals
;30:
;31:The server says this item is used on this level
;32:=================
;33:*/
;34:void CG_RegisterItemVisuals( int itemNum ) {
line 39
;35:	itemInfo_t		*itemInfo;
;36:	gitem_t			*item;
;37:	int				handle;
;38:
;39:	if ( itemNum < 0 || itemNum >= bg_numItems ) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $124
ADDRLP4 12
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $122
LABELV $124
line 40
;40:		CG_Error( "CG_RegisterItemVisuals: itemNum %d out of range [0-%d]", itemNum, bg_numItems-1 );
ADDRGP4 $125
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 bg_numItems
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 41
;41:	}
LABELV $122
line 43
;42:
;43:	itemInfo = &cg_items[ itemNum ];
ADDRLP4 4
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_items
ADDP4
ASGNP4
line 44
;44:	if ( itemInfo->registered ) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $126
line 45
;45:		return;
ADDRGP4 $121
JUMPV
LABELV $126
line 48
;46:	}
;47:
;48:	item = &bg_itemlist[ itemNum ];
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 50
;49:
;50:	memset( itemInfo, 0, sizeof( &itemInfo ) );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 51
;51:	itemInfo->registered = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 53
;52:
;53:	if (item->giType == IT_TEAM &&
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $128
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $131
ADDRLP4 20
INDIRI4
CNSTI4 5
NEI4 $128
LABELV $131
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $128
line 56
;54:		(item->giTag == PW_REDFLAG || item->giTag == PW_BLUEFLAG) &&
;55:		cgs.gametype == GT_CTY)
;56:	{ //in CTY the flag model is different
line 57
;57:		itemInfo->models[0] = trap_R_RegisterModel( item->world_model[1] );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 58
;58:	}
ADDRGP4 $129
JUMPV
LABELV $128
line 59
;59:	else if (item->giType == IT_WEAPON &&
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $132
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 11
EQI4 $135
ADDRLP4 28
INDIRI4
CNSTI4 12
EQI4 $135
ADDRLP4 28
INDIRI4
CNSTI4 13
NEI4 $132
LABELV $135
line 61
;60:		(item->giTag == WP_THERMAL || item->giTag == WP_TRIP_MINE || item->giTag == WP_DET_PACK))
;61:	{
line 62
;62:		itemInfo->models[0] = trap_R_RegisterModel( item->world_model[1] );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 63
;63:	}
ADDRGP4 $133
JUMPV
LABELV $132
line 65
;64:	else
;65:	{
line 66
;66:		itemInfo->models[0] = trap_R_RegisterModel( item->world_model[0] );
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 67
;67:	}
LABELV $133
LABELV $129
line 71
;68:/*
;69:Ghoul2 Insert Start
;70:*/
;71:	if (!Q_stricmp(&item->world_model[0][strlen(item->world_model[0]) - 4], ".glm"))
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $136
line 72
;72:	{
line 73
;73:		handle = trap_G2API_InitGhoul2Model(&itemInfo->g2Models[0], item->world_model[0], 0 , 0, 0, 0, 0);
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRI4
ASGNI4
line 74
;74:		if (handle<0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $139
line 75
;75:		{
line 76
;76:			itemInfo->g2Models[0] = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTP4 0
ASGNP4
line 77
;77:		}
ADDRGP4 $140
JUMPV
LABELV $139
line 79
;78:		else
;79:		{
line 80
;80:			itemInfo->radius[0] = 60;
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1114636288
ASGNF4
line 81
;81:		}
LABELV $140
line 82
;82:	}
LABELV $136
line 86
;83:/*
;84:Ghoul2 Insert End
;85:*/
;86:	if (item->icon)
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
line 87
;87:	{
line 88
;88:		itemInfo->icon = trap_R_RegisterShader( item->icon );
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 89
;89:	}
ADDRGP4 $142
JUMPV
LABELV $141
line 91
;90:	else
;91:	{
line 92
;92:		itemInfo->icon = 0;
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 93
;93:	}
LABELV $142
line 95
;94:
;95:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $143
line 96
;96:		CG_RegisterWeapon( item->giTag );
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 97
;97:	}
LABELV $143
line 102
;98:
;99:	//
;100:	// powerups have an accompanying ring or sphere
;101:	//
;102:	if ( item->giType == IT_POWERUP || item->giType == IT_HEALTH || 
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 5
EQI4 $149
ADDRLP4 40
INDIRI4
CNSTI4 4
EQI4 $149
ADDRLP4 40
INDIRI4
CNSTI4 3
EQI4 $149
ADDRLP4 40
INDIRI4
CNSTI4 6
NEI4 $145
LABELV $149
line 103
;103:		item->giType == IT_ARMOR || item->giType == IT_HOLDABLE ) {
line 104
;104:		if ( item->world_model[1] ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $150
line 105
;105:			itemInfo->models[1] = trap_R_RegisterModel( item->world_model[1] );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 106
;106:		}
LABELV $150
line 107
;107:	}
LABELV $145
line 108
;108:}
LABELV $121
endproc CG_RegisterItemVisuals 48 28
data
align 4
LABELV cgWeapFrame
byte 4 0
align 4
LABELV cgWeapFrameTime
byte 4 0
code
proc CG_MapTorsoToWeaponFrame 40 0
line 133
;109:
;110:
;111:/*
;112:========================================================================================
;113:
;114:VIEW WEAPON
;115:
;116:========================================================================================
;117:*/
;118:
;119:#define WEAPON_FORCE_BUSY_HOLSTER
;120:
;121:#ifdef WEAPON_FORCE_BUSY_HOLSTER
;122://rww - this was done as a last resort. Forgive me.
;123:static int cgWeapFrame = 0;
;124:static int cgWeapFrameTime = 0;
;125:#endif
;126:
;127:/*
;128:=================
;129:CG_MapTorsoToWeaponFrame
;130:
;131:=================
;132:*/
;133:static int CG_MapTorsoToWeaponFrame( clientInfo_t *ci, int frame, int animNum ) {
line 134
;134:	animation_t *animations = bgGlobalAnimations;
ADDRLP4 0
ADDRGP4 bgGlobalAnimations
ASGNP4
line 136
;135:#ifdef WEAPON_FORCE_BUSY_HOLSTER
;136:	if (cg.snap->ps.forceHandExtend != HANDEXTEND_NONE || cgWeapFrameTime > cg.time)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 0
NEI4 $157
ADDRGP4 cgWeapFrameTime
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $153
LABELV $157
line 137
;137:	{ //the reason for the after delay is so that it doesn't snap the weapon frame to the "idle" (0) frame
line 139
;138:		//for a very quick moment
;139:		if (cgWeapFrame < 6)
ADDRGP4 cgWeapFrame
INDIRI4
CNSTI4 6
GEI4 $158
line 140
;140:		{
line 141
;141:			cgWeapFrame = 6;
ADDRGP4 cgWeapFrame
CNSTI4 6
ASGNI4
line 142
;142:			cgWeapFrameTime = cg.time + 10;
ADDRGP4 cgWeapFrameTime
ADDRGP4 cg+64
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 143
;143:		}
LABELV $158
line 145
;144:
;145:		if (cgWeapFrameTime < cg.time && cgWeapFrame < 10)
ADDRGP4 cgWeapFrameTime
INDIRI4
ADDRGP4 cg+64
INDIRI4
GEI4 $161
ADDRGP4 cgWeapFrame
INDIRI4
CNSTI4 10
GEI4 $161
line 146
;146:		{
line 147
;147:			cgWeapFrame++;
ADDRLP4 4
ADDRGP4 cgWeapFrame
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 148
;148:			cgWeapFrameTime = cg.time + 10;
ADDRGP4 cgWeapFrameTime
ADDRGP4 cg+64
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 149
;149:		}
LABELV $161
line 151
;150:
;151:		if (cg.snap->ps.forceHandExtend != HANDEXTEND_NONE &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 0
EQI4 $165
ADDRGP4 cgWeapFrame
INDIRI4
CNSTI4 10
NEI4 $165
line 153
;152:			cgWeapFrame == 10)
;153:		{
line 154
;154:			cgWeapFrameTime = cg.time + 100;
ADDRGP4 cgWeapFrameTime
ADDRGP4 cg+64
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 155
;155:		}
LABELV $165
line 157
;156:
;157:		return cgWeapFrame;
ADDRGP4 cgWeapFrame
INDIRI4
RETI4
ADDRGP4 $152
JUMPV
LABELV $153
line 160
;158:	}
;159:	else
;160:	{
line 161
;161:		cgWeapFrame = 0;
ADDRGP4 cgWeapFrame
CNSTI4 0
ASGNI4
line 162
;162:		cgWeapFrameTime = 0;
ADDRGP4 cgWeapFrameTime
CNSTI4 0
ASGNI4
line 163
;163:	}
line 166
;164:#endif
;165:
;166:	switch( animNum )
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 8
CNSTI4 1091
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $171
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
GTI4 $181
LABELV $180
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 117
LTI4 $169
ADDRLP4 12
INDIRI4
CNSTI4 137
GTI4 $169
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $182-468
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $182
address $177
address $177
address $169
address $177
address $177
address $177
address $177
address $177
address $177
address $177
address $177
address $177
address $177
address $169
address $169
address $169
address $169
address $169
address $169
address $169
address $177
code
LABELV $181
ADDRFP4 8
INDIRI4
CNSTI4 1095
EQI4 $174
ADDRGP4 $169
JUMPV
line 167
;167:	{
LABELV $171
line 169
;168:	case TORSO_DROPWEAP1:
;169:		if ( frame >= animations[animNum].firstFrame && frame < animations[animNum].firstFrame + 5 ) 
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $170
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 5
ADDI4
GEI4 $170
line 170
;170:		{
line 171
;171:			return frame - animations[animNum].firstFrame + 6;
ADDRFP4 4
INDIRI4
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI4
SUBI4
CNSTI4 6
ADDI4
RETI4
ADDRGP4 $152
JUMPV
line 173
;172:		}
;173:		break;
LABELV $174
line 176
;174:
;175:	case TORSO_RAISEWEAP1:
;176:		if ( frame >= animations[animNum].firstFrame && frame < animations[animNum].firstFrame + 4 ) 
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $170
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
CNSTI4 4
ADDI4
GEI4 $170
line 177
;177:		{
line 178
;178:			return frame - animations[animNum].firstFrame + 6 + 4;
ADDRFP4 4
INDIRI4
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI4
SUBI4
CNSTI4 6
ADDI4
CNSTI4 4
ADDI4
RETI4
ADDRGP4 $152
JUMPV
line 180
;179:		}
;180:		break;
LABELV $177
line 194
;181:	case BOTH_ATTACK1:
;182:	case BOTH_ATTACK2:
;183:	case BOTH_ATTACK3:
;184:	case BOTH_ATTACK4:
;185:	case BOTH_ATTACK5:
;186:	case BOTH_ATTACK6:
;187:	case BOTH_ATTACK7:
;188:	case BOTH_ATTACK8:
;189:	case BOTH_ATTACK9:
;190:	case BOTH_ATTACK10:
;191:	case BOTH_ATTACK11:
;192:	case BOTH_ATTACK12:
;193:	case BOTH_THERMAL_THROW:
;194:		if ( frame >= animations[animNum].firstFrame && frame < animations[animNum].firstFrame + 6 ) 
ADDRLP4 32
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $170
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 6
ADDI4
GEI4 $170
line 195
;195:		{
line 196
;196:			return 1 + ( frame - animations[animNum].firstFrame );
ADDRFP4 4
INDIRI4
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
RETI4
ADDRGP4 $152
JUMPV
line 199
;197:		}
;198:
;199:		break;
LABELV $169
LABELV $170
line 201
;200:	}	
;201:	return -1;
CNSTI4 -1
RETI4
LABELV $152
endproc CG_MapTorsoToWeaponFrame 40 0
proc CG_CalculateWeaponPosition 40 4
line 210
;202:}
;203:
;204:
;205:/*
;206:==============
;207:CG_CalculateWeaponPosition
;208:==============
;209:*/
;210:static void CG_CalculateWeaponPosition( vec3_t origin, vec3_t angles ) {
line 215
;211:	float	scale;
;212:	int		delta;
;213:	float	fracsin;
;214:
;215:	VectorCopy( cg.refdef.vieworg, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 cg+3616+24
INDIRB
ASGNB 12
line 216
;216:	VectorCopy( cg.refdefViewAngles, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 cg+3984
INDIRB
ASGNB 12
line 219
;217:
;218:	// on odd legs, invert some angles
;219:	if ( cg.bobcycle & 1 ) {
ADDRGP4 cg+13468
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $188
line 220
;220:		scale = -cg.xyspeed;
ADDRLP4 0
ADDRGP4 cg+13472
INDIRF4
NEGF4
ASGNF4
line 221
;221:	} else {
ADDRGP4 $189
JUMPV
LABELV $188
line 222
;222:		scale = cg.xyspeed;
ADDRLP4 0
ADDRGP4 cg+13472
INDIRF4
ASGNF4
line 223
;223:	}
LABELV $189
line 226
;224:
;225:	// gun angles from bobbing
;226:	angles[ROLL] += scale * cg.bobfracsin * 0.005;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1000593162
ADDRLP4 0
INDIRF4
ADDRGP4 cg+13464
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 227
;227:	angles[YAW] += scale * cg.bobfracsin * 0.01;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1008981770
ADDRLP4 0
INDIRF4
ADDRGP4 cg+13464
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 228
;228:	angles[PITCH] += cg.xyspeed * cg.bobfracsin * 0.005;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1000593162
ADDRGP4 cg+13472
INDIRF4
ADDRGP4 cg+13464
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 231
;229:
;230:	// drop the weapon when landing
;231:	delta = cg.time - cg.landTime;
ADDRLP4 8
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+3504
INDIRI4
SUBI4
ASGNI4
line 232
;232:	if ( delta < LAND_DEFLECT_TIME ) {
ADDRLP4 8
INDIRI4
CNSTI4 150
GEI4 $199
line 233
;233:		origin[2] += cg.landChange*0.25 * delta / LAND_DEFLECT_TIME;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1048576000
ADDRGP4 cg+3500
INDIRF4
MULF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
CNSTF4 1125515264
DIVF4
ADDF4
ASGNF4
line 234
;234:	} else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
ADDRGP4 $200
JUMPV
LABELV $199
ADDRLP4 8
INDIRI4
CNSTI4 450
GEI4 $202
line 235
;235:		origin[2] += cg.landChange*0.25 * 
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1048576000
ADDRGP4 cg+3500
INDIRF4
MULF4
CNSTI4 450
ADDRLP4 8
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1133903872
DIVF4
ADDF4
ASGNF4
line 237
;236:			(LAND_DEFLECT_TIME + LAND_RETURN_TIME - delta) / LAND_RETURN_TIME;
;237:	}
LABELV $202
LABELV $200
line 250
;238:
;239:#if 0
;240:	// drop the weapon when stair climbing
;241:	delta = cg.time - cg.stepTime;
;242:	if ( delta < STEP_TIME/2 ) {
;243:		origin[2] -= cg.stepChange*0.25 * delta / (STEP_TIME/2);
;244:	} else if ( delta < STEP_TIME ) {
;245:		origin[2] -= cg.stepChange*0.25 * (STEP_TIME - delta) / (STEP_TIME/2);
;246:	}
;247:#endif
;248:
;249:	// idle drift
;250:	scale = cg.xyspeed + 40;
ADDRLP4 0
ADDRGP4 cg+13472
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 251
;251:	fracsin = sin( cg.time * 0.001 );
CNSTF4 981668463
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 24
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 252
;252:	angles[ROLL] += scale * fracsin * 0.01;
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1008981770
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 253
;253:	angles[YAW] += scale * fracsin * 0.01;
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1008981770
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 254
;254:	angles[PITCH] += scale * fracsin * 0.01;
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1008981770
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 255
;255:}
LABELV $184
endproc CG_CalculateWeaponPosition 40 4
proc CG_LightningBolt 220 12
line 269
;256:
;257:
;258:/*
;259:===============
;260:CG_LightningBolt
;261:
;262:Origin will be the exact tag point, which is slightly
;263:different than the muzzle point used for determining hits.
;264:The cent should be the non-predicted cent if it is from the player,
;265:so the endpoint will reflect the simulated strike (lagging the predicted
;266:angle)
;267:===============
;268:*/
;269:static void CG_LightningBolt( centity_t *cent, vec3_t origin ) {
line 276
;270://	trace_t  trace;
;271:	refEntity_t  beam;
;272://	vec3_t   forward;
;273://	vec3_t   muzzlePoint, endPoint;
;274:
;275:	//Must be a durational weapon that continuously generates an effect.
;276:	if ( cent->currentState.weapon == WP_DEMP2 && cent->currentState.eFlags & EF_ALT_FIRING ) 
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
CNSTI4 8
ASGNI4
ADDRLP4 212
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 216
INDIRI4
NEI4 $207
ADDRLP4 212
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $207
line 277
;277:	{ /*nothing*/ }
line 279
;278:	else
;279:	{
line 280
;280:		return;
LABELV $209
line 283
;281:	}
;282:
;283:	memset( &beam, 0, sizeof( beam ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 366
;284:
;285:	// NOTENOTE No lightning gun-ish stuff yet.
;286:/*
;287:	// CPMA  "true" lightning
;288:	if ((cent->currentState.number == cg.predictedPlayerState.clientNum) && (cg_trueLightning.value != 0)) {
;289:		vec3_t angle;
;290:		int i;
;291:
;292:		for (i = 0; i < 3; i++) {
;293:			float a = cent->lerpAngles[i] - cg.refdefViewAngles[i];
;294:			if (a > 180) {
;295:				a -= 360;
;296:			}
;297:			if (a < -180) {
;298:				a += 360;
;299:			}
;300:
;301:			angle[i] = cg.refdefViewAngles[i] + a * (1.0 - cg_trueLightning.value);
;302:			if (angle[i] < 0) {
;303:				angle[i] += 360;
;304:			}
;305:			if (angle[i] > 360) {
;306:				angle[i] -= 360;
;307:			}
;308:		}
;309:
;310:		AngleVectors(angle, forward, NULL, NULL );
;311:		VectorCopy(cent->lerpOrigin, muzzlePoint );
;312://		VectorCopy(cg.refdef.vieworg, muzzlePoint );
;313:	} else {
;314:		// !CPMA
;315:		AngleVectors( cent->lerpAngles, forward, NULL, NULL );
;316:		VectorCopy(cent->lerpOrigin, muzzlePoint );
;317:	}
;318:
;319:	// FIXME: crouch
;320:	muzzlePoint[2] += DEFAULT_VIEWHEIGHT;
;321:
;322:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
;323:
;324:	// project forward by the lightning range
;325:	VectorMA( muzzlePoint, LIGHTNING_RANGE, forward, endPoint );
;326:
;327:	// see if it hit a wall
;328:	CG_Trace( &trace, muzzlePoint, vec3_origin, vec3_origin, endPoint, 
;329:		cent->currentState.number, MASK_SHOT );
;330:
;331:	// this is the endpoint
;332:	VectorCopy( trace.endpos, beam.oldorigin );
;333:
;334:	// use the provided origin, even though it may be slightly
;335:	// different than the muzzle origin
;336:	VectorCopy( origin, beam.origin );
;337:
;338:	beam.reType = RT_LIGHTNING;
;339:	beam.customShader = cgs.media.lightningShader;
;340:	trap_R_AddRefEntityToScene( &beam );
;341:*/
;342:
;343:	// NOTENOTE No lightning gun-ish stuff yet.
;344:/*
;345:	// add the impact flare if it hit something
;346:	if ( trace.fraction < 1.0 ) {
;347:		vec3_t	angles;
;348:		vec3_t	dir;
;349:
;350:		VectorSubtract( beam.oldorigin, beam.origin, dir );
;351:		VectorNormalize( dir );
;352:
;353:		memset( &beam, 0, sizeof( beam ) );
;354:		beam.hModel = cgs.media.lightningExplosionModel;
;355:
;356:		VectorMA( trace.endpos, -16, dir, beam.origin );
;357:
;358:		// make a random orientation
;359:		angles[0] = rand() % 360;
;360:		angles[1] = rand() % 360;
;361:		angles[2] = rand() % 360;
;362:		AnglesToAxis( angles, beam.axis );
;363:		trap_R_AddRefEntityToScene( &beam );
;364:	}
;365:*/
;366:}
LABELV $207
endproc CG_LightningBolt 220 12
proc CG_AddWeaponWithPowerups 0 4
line 374
;367:
;368:
;369:/*
;370:========================
;371:CG_AddWeaponWithPowerups
;372:========================
;373:*/
;374:static void CG_AddWeaponWithPowerups( refEntity_t *gun, int powerups ) {
line 376
;375:	// add powerup effects
;376:	trap_R_AddRefEntityToScene( gun );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 378
;377:
;378:	if ( powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $211
line 379
;379:		gun->customShader = cgs.media.battleWeaponShader;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 cgs+70296+472
INDIRI4
ASGNI4
line 380
;380:		trap_R_AddRefEntityToScene( gun );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 381
;381:	}
LABELV $211
line 382
;382:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $215
line 383
;383:		gun->customShader = cgs.media.quadWeaponShader;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 cgs+70296+456
INDIRI4
ASGNI4
line 384
;384:		trap_R_AddRefEntityToScene( gun );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 385
;385:	}
LABELV $215
line 386
;386:}
LABELV $210
endproc CG_AddWeaponWithPowerups 0 4
export CG_AddPlayerWeapon
proc CG_AddPlayerWeapon 972 36
line 398
;387:
;388:
;389:/*
;390:=============
;391:CG_AddPlayerWeapon
;392:
;393:Used for both the view weapon (ps is valid) and the world modelother character models (ps is NULL)
;394:The main player will have this called for BOTH cases, so effects like light and
;395:sound should only be done on the world model case.
;396:=============
;397:*/
;398:void CG_AddPlayerWeapon( refEntity_t *parent, playerState_t *ps, centity_t *cent, int team, vec3_t newAngles, qboolean thirdPerson ) {
line 407
;399:	refEntity_t	gun;
;400:	refEntity_t	barrel;
;401:	vec3_t		angles;
;402:	weapon_t	weaponNum;
;403:	weaponInfo_t	*weapon;
;404:	centity_t	*nonPredictedCent;
;405:	refEntity_t	flash;
;406:
;407:	weaponNum = cent->currentState.weapon;
ADDRLP4 440
ADDRFP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 409
;408:
;409:	if (cent->currentState.weapon == WP_EMPLACED_GUN)
ADDRFP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 14
NEI4 $220
line 410
;410:	{
line 411
;411:		return;
ADDRGP4 $219
JUMPV
LABELV $220
line 414
;412:	}
;413:
;414:	CG_RegisterWeapon( weaponNum );
ADDRLP4 440
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 415
;415:	weapon = &cg_weapons[weaponNum];
ADDRLP4 436
CNSTI4 208
ADDRLP4 440
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 420
;416:/*
;417:Ghoul2 Insert Start
;418:*/
;419:
;420:	memset( &gun, 0, sizeof( gun ) );
ADDRLP4 224
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 423
;421:
;422:	// only do this if we are in first person, since world weapons are now handled on the server by Ghoul2
;423:	if (!thirdPerson)
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $222
line 424
;424:	{
line 427
;425:
;426:		// add the weapon
;427:		VectorCopy( parent->lightingOrigin, gun.lightingOrigin );
ADDRLP4 224+108
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRB
ASGNB 12
line 428
;428:		gun.shadowPlane = parent->shadowPlane;
ADDRLP4 224+120
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ASGNF4
line 429
;429:		gun.renderfx = parent->renderfx;
ADDRLP4 224+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 431
;430:
;431:		if (ps)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $227
line 432
;432:		{	// this player, in first person view
line 433
;433:			gun.hModel = weapon->viewModel;
ADDRLP4 224+8
ADDRLP4 436
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 434
;434:		}
ADDRGP4 $228
JUMPV
LABELV $227
line 436
;435:		else
;436:		{
line 437
;437:			gun.hModel = weapon->weaponModel;
ADDRLP4 224+8
ADDRLP4 436
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 438
;438:		}
LABELV $228
line 439
;439:		if (!gun.hModel) {
ADDRLP4 224+8
INDIRI4
CNSTI4 0
NEI4 $231
line 440
;440:			return;
ADDRGP4 $219
JUMPV
LABELV $231
line 443
;441:		}
;442:
;443:		if ( !ps ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $234
line 445
;444:			// add weapon ready sound
;445:			cent->pe.lightningFiring = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 0
ASGNI4
line 446
;446:			if ( ( cent->currentState.eFlags & EF_FIRING ) && weapon->firingSound ) {
ADDRLP4 660
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 660
INDIRI4
EQI4 $236
ADDRLP4 436
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRLP4 660
INDIRI4
EQI4 $236
line 448
;447:				// lightning gun and guantlet make a different sound when fire is held down
;448:				trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->firingSound );
ADDRLP4 664
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 664
INDIRP4
INDIRI4
ARGI4
ADDRLP4 664
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 436
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 449
;449:				cent->pe.lightningFiring = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 1
ASGNI4
line 450
;450:			} else if ( weapon->readySound ) {
ADDRGP4 $237
JUMPV
LABELV $236
ADDRLP4 436
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
EQI4 $238
line 451
;451:				trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->readySound );
ADDRLP4 664
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 664
INDIRP4
INDIRI4
ARGI4
ADDRLP4 664
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 436
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 452
;452:			}
LABELV $238
LABELV $237
line 453
;453:		}
LABELV $234
line 455
;454:	
;455:		CG_PositionEntityOnTag( &gun, parent, parent->hModel, "tag_weapon");
ADDRLP4 224
ARGP4
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
ARGP4
ADDRLP4 660
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $240
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 457
;456:
;457:		if (!CG_IsMindTricked(cent->currentState.trickedentindex,
ADDRLP4 664
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 664
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 664
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 664
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 664
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 668
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 668
INDIRI4
CNSTI4 0
NEI4 $241
line 462
;458:			cent->currentState.trickedentindex2,
;459:			cent->currentState.trickedentindex3,
;460:			cent->currentState.trickedentindex4,
;461:			cg.snap->ps.clientNum))
;462:		{
line 463
;463:			CG_AddWeaponWithPowerups( &gun, cent->currentState.powerups ); //don't draw the weapon if the player is invisible
ADDRLP4 224
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddWeaponWithPowerups
CALLV
pop
line 474
;464:			/*
;465:			if ( weaponNum == WP_STUN_BATON )
;466:			{
;467:				gun.shaderRGBA[0] = gun.shaderRGBA[1] = gun.shaderRGBA[2] = 25;
;468:	
;469:				gun.customShader = trap_R_RegisterShader( "gfx/effects/stunPass" );
;470:				gun.renderfx = RF_RGB_TINT | RF_FIRST_PERSON | RF_DEPTHHACK;
;471:				trap_R_AddRefEntityToScene( &gun );
;472:			}
;473:			*/
;474:		}
LABELV $241
line 476
;475:
;476:		if (weaponNum == WP_STUN_BATON)
ADDRLP4 440
INDIRI4
CNSTI4 1
NEI4 $244
line 477
;477:		{
line 478
;478:			int i = 0;
ADDRLP4 672
CNSTI4 0
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $246
line 481
;479:
;480:			while (i < 3)
;481:			{
line 482
;482:				memset( &barrel, 0, sizeof( barrel ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 483
;483:				VectorCopy( parent->lightingOrigin, barrel.lightingOrigin );
ADDRLP4 0+108
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRB
ASGNB 12
line 484
;484:				barrel.shadowPlane = parent->shadowPlane;
ADDRLP4 0+120
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ASGNF4
line 485
;485:				barrel.renderfx = parent->renderfx;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 487
;486:
;487:				if (i == 0)
ADDRLP4 672
INDIRI4
CNSTI4 0
NEI4 $252
line 488
;488:				{
line 489
;489:					barrel.hModel = trap_R_RegisterModel("models/weapons2/stun_baton/baton_barrel.md3");
ADDRGP4 $255
ARGP4
ADDRLP4 676
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 676
INDIRI4
ASGNI4
line 490
;490:				}
ADDRGP4 $253
JUMPV
LABELV $252
line 491
;491:				else if (i == 1)
ADDRLP4 672
INDIRI4
CNSTI4 1
NEI4 $256
line 492
;492:				{
line 493
;493:					barrel.hModel = trap_R_RegisterModel("models/weapons2/stun_baton/baton_barrel2.md3");
ADDRGP4 $259
ARGP4
ADDRLP4 676
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 676
INDIRI4
ASGNI4
line 494
;494:				}
ADDRGP4 $257
JUMPV
LABELV $256
line 496
;495:				else
;496:				{
line 497
;497:					barrel.hModel = trap_R_RegisterModel("models/weapons2/stun_baton/baton_barrel3.md3");
ADDRGP4 $261
ARGP4
ADDRLP4 676
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 676
INDIRI4
ASGNI4
line 498
;498:				}
LABELV $257
LABELV $253
line 499
;499:				angles[YAW] = 0;
ADDRLP4 212+4
CNSTF4 0
ASGNF4
line 500
;500:				angles[PITCH] = 0;
ADDRLP4 212
CNSTF4 0
ASGNF4
line 501
;501:				angles[ROLL] = 0;
ADDRLP4 212+8
CNSTF4 0
ASGNF4
line 503
;502:
;503:				AnglesToAxis( angles, barrel.axis );
ADDRLP4 212
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 505
;504:
;505:				if (i == 0)
ADDRLP4 672
INDIRI4
CNSTI4 0
NEI4 $265
line 506
;506:				{
line 507
;507:					CG_PositionRotatedEntityOnTag( &barrel, parent/*&gun*/, /*weapon->weaponModel*/weapon->handsModel, "tag_barrel" );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $267
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 508
;508:				}
ADDRGP4 $266
JUMPV
LABELV $265
line 509
;509:				else if (i == 1)
ADDRLP4 672
INDIRI4
CNSTI4 1
NEI4 $268
line 510
;510:				{
line 511
;511:					CG_PositionRotatedEntityOnTag( &barrel, parent/*&gun*/, /*weapon->weaponModel*/weapon->handsModel, "tag_barrel2" );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $270
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 512
;512:				}
ADDRGP4 $269
JUMPV
LABELV $268
line 514
;513:				else
;514:				{
line 515
;515:					CG_PositionRotatedEntityOnTag( &barrel, parent/*&gun*/, /*weapon->weaponModel*/weapon->handsModel, "tag_barrel3" );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $271
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 516
;516:				}
LABELV $269
LABELV $266
line 517
;517:				CG_AddWeaponWithPowerups( &barrel, cent->currentState.powerups );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddWeaponWithPowerups
CALLV
pop
line 519
;518:
;519:				i++;
ADDRLP4 672
ADDRLP4 672
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 520
;520:			}
LABELV $247
line 480
ADDRLP4 672
INDIRI4
CNSTI4 3
LTI4 $246
line 521
;521:		}
ADDRGP4 $245
JUMPV
LABELV $244
line 523
;522:		else
;523:		{
line 525
;524:			// add the spinning barrel
;525:			if ( weapon->barrelModel ) {
ADDRLP4 436
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $272
line 526
;526:				memset( &barrel, 0, sizeof( barrel ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 527
;527:				VectorCopy( parent->lightingOrigin, barrel.lightingOrigin );
ADDRLP4 0+108
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRB
ASGNB 12
line 528
;528:				barrel.shadowPlane = parent->shadowPlane;
ADDRLP4 0+120
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ASGNF4
line 529
;529:				barrel.renderfx = parent->renderfx;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 531
;530:
;531:				barrel.hModel = weapon->barrelModel;
ADDRLP4 0+8
ADDRLP4 436
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 532
;532:				angles[YAW] = 0;
ADDRLP4 212+4
CNSTF4 0
ASGNF4
line 533
;533:				angles[PITCH] = 0;
ADDRLP4 212
CNSTF4 0
ASGNF4
line 534
;534:				angles[ROLL] = 0;
ADDRLP4 212+8
CNSTF4 0
ASGNF4
line 536
;535:
;536:				AnglesToAxis( angles, barrel.axis );
ADDRLP4 212
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 538
;537:
;538:				CG_PositionRotatedEntityOnTag( &barrel, parent/*&gun*/, /*weapon->weaponModel*/weapon->handsModel, "tag_barrel" );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $267
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 540
;539:
;540:				CG_AddWeaponWithPowerups( &barrel, cent->currentState.powerups );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddWeaponWithPowerups
CALLV
pop
line 541
;541:			}
LABELV $272
line 542
;542:		}
LABELV $245
line 543
;543:	}
LABELV $222
line 548
;544:/*
;545:Ghoul2 Insert End
;546:*/
;547:
;548:	memset (&flash, 0, sizeof(flash));
ADDRLP4 444
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 549
;549:	CG_PositionEntityOnTag( &flash, &gun, gun.hModel, "tag_flash");
ADDRLP4 444
ARGP4
ADDRLP4 224
ARGP4
ADDRLP4 224+8
INDIRI4
ARGI4
ADDRGP4 $282
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 551
;550:
;551:	VectorCopy(flash.origin, cg.lastFPFlashPoint);
ADDRGP4 cg+13796
ADDRLP4 444+52
INDIRB
ASGNB 12
line 555
;552:
;553:	// Do special charge bits
;554:	//-----------------------
;555:	if ( (ps || cg.renderingThirdPerson || cg.predictedPlayerState.clientNum != cent->currentState.number) &&
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $291
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $291
ADDRGP4 cg+96+144
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
EQI4 $285
LABELV $291
ADDRLP4 660
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 5
NEI4 $293
ADDRLP4 660
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 3
EQI4 $294
LABELV $293
ADDRLP4 664
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 664
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 6
NEI4 $295
ADDRLP4 664
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 4
EQI4 $294
LABELV $295
ADDRLP4 668
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 668
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 8
NEI4 $285
ADDRLP4 668
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 5
NEI4 $285
LABELV $294
line 559
;556:		( ( cent->currentState.modelindex2 == WEAPON_CHARGING_ALT && cent->currentState.weapon == WP_BRYAR_PISTOL ) ||
;557:		  ( cent->currentState.weapon == WP_BOWCASTER && cent->currentState.modelindex2 == WEAPON_CHARGING ) ||
;558:		  ( cent->currentState.weapon == WP_DEMP2 && cent->currentState.modelindex2 == WEAPON_CHARGING_ALT) ) )
;559:	{
line 560
;560:		int		shader = 0;
ADDRLP4 748
CNSTI4 0
ASGNI4
line 561
;561:		float	val = 0.0f;
ADDRLP4 744
CNSTF4 0
ASGNF4
line 562
;562:		float	scale = 1.0f;
ADDRLP4 752
CNSTF4 1065353216
ASGNF4
line 566
;563:		addspriteArgStruct_t fxSArgs;
;564:		vec3_t flashorigin, flashdir;
;565:
;566:		if (!thirdPerson)
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $296
line 567
;567:		{
line 568
;568:			VectorCopy(flash.origin, flashorigin);
ADDRLP4 756
ADDRLP4 444+52
INDIRB
ASGNB 12
line 569
;569:			VectorCopy(flash.axis[0], flashdir);
ADDRLP4 768
ADDRLP4 444+12
INDIRB
ASGNB 12
line 570
;570:		}
ADDRGP4 $297
JUMPV
LABELV $296
line 572
;571:		else
;572:		{
line 575
;573:			mdxaBone_t 		boltMatrix;
;574:
;575:			if (!trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1))
ADDRFP4 8
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 828
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 828
INDIRI4
CNSTI4 0
NEI4 $300
line 576
;576:			{ //it's quite possible that we may have have no weapon model and be in a valid state, so return here if this is the case
line 577
;577:				return;
ADDRGP4 $219
JUMPV
LABELV $300
line 581
;578:			}
;579:
;580:			// go away and get me the bolt position for this frame please
;581: 			if (!(trap_G2API_GetBoltMatrix(cent->ghoul2, 1, 0, &boltMatrix, newAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale)))
ADDRLP4 832
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 832
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 780
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 832
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 832
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRLP4 836
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
ASGNI4
ADDRLP4 836
INDIRI4
CNSTI4 0
NEI4 $302
line 582
;582:			{	// Couldn't find bolt point.
line 583
;583:				return;
ADDRGP4 $219
JUMPV
LABELV $302
line 586
;584:			}
;585:			
;586:			trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, flashorigin);
ADDRLP4 780
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 756
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 587
;587:			trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, POSITIVE_X, flashdir);
ADDRLP4 780
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 768
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 588
;588:		}
LABELV $297
line 590
;589:
;590:		if ( cent->currentState.weapon == WP_BRYAR_PISTOL )
ADDRFP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 3
NEI4 $306
line 591
;591:		{
line 593
;592:			// Hardcoded max charge time of 1 second
;593:			val = ( cg.time - cent->currentState.constantLight ) * 0.001f;
ADDRLP4 744
CNSTF4 981668463
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 594
;594:			shader = cgs.media.bryarFrontFlash;
ADDRLP4 748
ADDRGP4 cgs+70296+20
INDIRI4
ASGNI4
line 595
;595:		}
ADDRGP4 $307
JUMPV
LABELV $306
line 596
;596:		else if ( cent->currentState.weapon == WP_BOWCASTER )
ADDRFP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 6
NEI4 $311
line 597
;597:		{
line 599
;598:			// Hardcoded max charge time of 1 second
;599:			val = ( cg.time - cent->currentState.constantLight ) * 0.001f;
ADDRLP4 744
CNSTF4 981668463
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 600
;600:			shader = cgs.media.greenFrontFlash;
ADDRLP4 748
ADDRGP4 cgs+70296+24
INDIRI4
ASGNI4
line 601
;601:		}
ADDRGP4 $312
JUMPV
LABELV $311
line 602
;602:		else if ( cent->currentState.weapon == WP_DEMP2 )
ADDRFP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 8
NEI4 $316
line 603
;603:		{
line 604
;604:			val = ( cg.time - cent->currentState.constantLight ) * 0.001f;
ADDRLP4 744
CNSTF4 981668463
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 605
;605:			shader = cgs.media.lightningFlash;
ADDRLP4 748
ADDRGP4 cgs+70296+28
INDIRI4
ASGNI4
line 606
;606:			scale = 1.75f;
ADDRLP4 752
CNSTF4 1071644672
ASGNF4
line 607
;607:		}
LABELV $316
LABELV $312
LABELV $307
line 609
;608:
;609:		if ( val < 0.0f )
ADDRLP4 744
INDIRF4
CNSTF4 0
GEF4 $321
line 610
;610:		{
line 611
;611:			val = 0.0f;
ADDRLP4 744
CNSTF4 0
ASGNF4
line 612
;612:		}
ADDRGP4 $322
JUMPV
LABELV $321
line 613
;613:		else if ( val > 1.0f )
ADDRLP4 744
INDIRF4
CNSTF4 1065353216
LEF4 $323
line 614
;614:		{
line 615
;615:			val = 1.0f;
ADDRLP4 744
CNSTF4 1065353216
ASGNF4
line 616
;616:			if (ps && cent->currentState.number == ps->clientNum)
ADDRLP4 780
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 780
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $324
ADDRFP4 8
INDIRP4
INDIRI4
ADDRLP4 780
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $324
line 617
;617:			{
line 618
;618:				CGCam_Shake( /*0.1f*/0.2f, 100 );
CNSTF4 1045220557
ARGF4
CNSTI4 100
ARGI4
ADDRGP4 CGCam_Shake
CALLV
pop
line 619
;619:			}
line 620
;620:		}
ADDRGP4 $324
JUMPV
LABELV $323
line 622
;621:		else
;622:		{
line 623
;623:			if (ps && cent->currentState.number == ps->clientNum)
ADDRLP4 780
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 780
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $327
ADDRFP4 8
INDIRP4
INDIRI4
ADDRLP4 780
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $327
line 624
;624:			{
line 625
;625:				CGCam_Shake( val * val * /*0.3f*/0.6f, 100 );
CNSTF4 1058642330
ADDRLP4 744
INDIRF4
ADDRLP4 744
INDIRF4
MULF4
MULF4
ARGF4
CNSTI4 100
ARGI4
ADDRGP4 CGCam_Shake
CALLV
pop
line 626
;626:			}
LABELV $327
line 627
;627:		}
LABELV $324
LABELV $322
line 629
;628:
;629:		val += random() * 0.5f;
ADDRLP4 780
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 744
ADDRLP4 744
INDIRF4
CNSTF4 1056964608
ADDRLP4 780
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 631
;630:
;631:		VectorCopy(flashorigin, fxSArgs.origin);
ADDRLP4 672
ADDRLP4 756
INDIRB
ASGNB 12
line 632
;632:		VectorClear(fxSArgs.vel);
ADDRLP4 784
CNSTF4 0
ASGNF4
ADDRLP4 672+12+8
ADDRLP4 784
INDIRF4
ASGNF4
ADDRLP4 672+12+4
ADDRLP4 784
INDIRF4
ASGNF4
ADDRLP4 672+12
ADDRLP4 784
INDIRF4
ASGNF4
line 633
;633:		VectorClear(fxSArgs.accel);
ADDRLP4 788
CNSTF4 0
ASGNF4
ADDRLP4 672+24+8
ADDRLP4 788
INDIRF4
ASGNF4
ADDRLP4 672+24+4
ADDRLP4 788
INDIRF4
ASGNF4
ADDRLP4 672+24
ADDRLP4 788
INDIRF4
ASGNF4
line 634
;634:		fxSArgs.scale = 3.0f*val*scale;
ADDRLP4 672+36
CNSTF4 1077936128
ADDRLP4 744
INDIRF4
MULF4
ADDRLP4 752
INDIRF4
MULF4
ASGNF4
line 635
;635:		fxSArgs.dscale = 0.0f;
ADDRLP4 672+40
CNSTF4 0
ASGNF4
line 636
;636:		fxSArgs.sAlpha = 0.7f;
ADDRLP4 672+44
CNSTF4 1060320051
ASGNF4
line 637
;637:		fxSArgs.eAlpha = 0.7f;
ADDRLP4 672+48
CNSTF4 1060320051
ASGNF4
line 638
;638:		fxSArgs.rotation = random()*360;
ADDRLP4 792
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 672+52
CNSTF4 1135869952
ADDRLP4 792
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 639
;639:		fxSArgs.bounce = 0.0f;
ADDRLP4 672+56
CNSTF4 0
ASGNF4
line 640
;640:		fxSArgs.life = 1.0f;
ADDRLP4 672+60
CNSTI4 1
ASGNI4
line 641
;641:		fxSArgs.shader = shader;
ADDRLP4 672+64
ADDRLP4 748
INDIRI4
ASGNI4
line 642
;642:		fxSArgs.flags = 0x08000000;
ADDRLP4 672+68
CNSTI4 134217728
ASGNI4
line 645
;643:
;644:		//FX_AddSprite( flash.origin, NULL, NULL, 3.0f * val, 0.0f, 0.7f, 0.7f, WHITE, WHITE, random() * 360, 0.0f, 1.0f, shader, FX_USE_ALPHA );
;645:		trap_FX_AddSprite(&fxSArgs);
ADDRLP4 672
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 646
;646:	}
LABELV $285
line 649
;647:
;648:	// make sure we aren't looking at cg.predictedPlayerEntity for LG
;649:	nonPredictedCent = &cg_entities[cent->currentState.clientNum];
ADDRLP4 656
CNSTI4 1920
ADDRFP4 8
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 654
;650:
;651:	// if the index of the nonPredictedCent is not the same as the clientNum
;652:	// then this is a fake player (like on teh single player podiums), so
;653:	// go ahead and use the cent
;654:	if( ( nonPredictedCent - cg_entities ) != cent->currentState.clientNum ) {
ADDRLP4 656
INDIRP4
CVPU4 4
ADDRGP4 cg_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1920
DIVI4
ADDRFP4 8
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
EQI4 $348
line 655
;655:		nonPredictedCent = cent;
ADDRLP4 656
ADDRFP4 8
INDIRP4
ASGNP4
line 656
;656:	}
LABELV $348
line 659
;657:
;658:	// add the flash
;659:	if ( ( weaponNum == WP_DEMP2)
ADDRLP4 672
CNSTI4 8
ASGNI4
ADDRLP4 440
INDIRI4
ADDRLP4 672
INDIRI4
NEI4 $350
ADDRLP4 656
INDIRP4
ADDRLP4 672
INDIRI4
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $350
line 661
;660:		&& ( nonPredictedCent->currentState.eFlags & EF_FIRING ) ) 
;661:	{
line 663
;662:		// continuous flash
;663:	} else {
ADDRGP4 $351
JUMPV
LABELV $350
line 665
;664:		// impulse flash
;665:		if ( cg.time - cent->muzzleFlashTime > MUZZLE_FLASH_TIME) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
SUBI4
CNSTI4 20
LEI4 $352
line 666
;666:			return;
ADDRGP4 $219
JUMPV
LABELV $352
line 668
;667:		}
;668:	}
LABELV $351
line 670
;669:
;670:	if ( ps || cg.renderingThirdPerson ||
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $361
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $361
ADDRFP4 8
INDIRP4
INDIRI4
ADDRGP4 cg+96+144
INDIRI4
EQI4 $355
LABELV $361
line 672
;671:			cent->currentState.number != cg.predictedPlayerState.clientNum ) 
;672:	{	// Make sure we don't do the thirdperson model effects for the local player if we're in first person
line 676
;673:		vec3_t flashorigin, flashdir;
;674:		refEntity_t	flash;
;675:
;676:		memset (&flash, 0, sizeof(flash));
ADDRLP4 676
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 678
;677:
;678:		if (!thirdPerson)
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $362
line 679
;679:		{
line 680
;680:			CG_PositionEntityOnTag( &flash, &gun, gun.hModel, "tag_flash");
ADDRLP4 676
ARGP4
ADDRLP4 224
ARGP4
ADDRLP4 224+8
INDIRI4
ARGI4
ADDRGP4 $282
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 681
;681:			VectorCopy(flash.origin, flashorigin);
ADDRLP4 888
ADDRLP4 676+52
INDIRB
ASGNB 12
line 682
;682:			VectorCopy(flash.axis[0], flashdir);
ADDRLP4 900
ADDRLP4 676+12
INDIRB
ASGNB 12
line 683
;683:		}
ADDRGP4 $363
JUMPV
LABELV $362
line 685
;684:		else
;685:		{
line 688
;686:			mdxaBone_t 		boltMatrix;
;687:
;688:			if (!trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1))
ADDRFP4 8
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 960
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 960
INDIRI4
CNSTI4 0
NEI4 $367
line 689
;689:			{ //it's quite possible that we may have have no weapon model and be in a valid state, so return here if this is the case
line 690
;690:				return;
ADDRGP4 $219
JUMPV
LABELV $367
line 694
;691:			}
;692:
;693:			// go away and get me the bolt position for this frame please
;694: 			if (!(trap_G2API_GetBoltMatrix(cent->ghoul2, 1, 0, &boltMatrix, newAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale)))
ADDRLP4 964
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 964
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 912
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 964
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 964
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRLP4 968
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
ASGNI4
ADDRLP4 968
INDIRI4
CNSTI4 0
NEI4 $369
line 695
;695:			{	// Couldn't find bolt point.
line 696
;696:				return;
ADDRGP4 $219
JUMPV
LABELV $369
line 699
;697:			}
;698:			
;699:			trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, flashorigin);
ADDRLP4 912
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 888
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 700
;700:			trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, POSITIVE_X, flashdir);
ADDRLP4 912
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 900
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 701
;701:		}
LABELV $363
line 703
;702:
;703:		if ( cg.time - cent->muzzleFlashTime <= MUZZLE_FLASH_TIME + 10 )
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
SUBI4
CNSTI4 30
GTI4 $373
line 704
;704:		{	// Handle muzzle flashes
line 705
;705:			if ( cent->currentState.eFlags & EF_ALT_FIRING )
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $376
line 706
;706:			{	// Check the alt firing first.
line 707
;707:				if (weapon->altMuzzleEffect)
ADDRLP4 436
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $377
line 708
;708:				{
line 709
;709:					trap_FX_PlayEffectID(weapon->altMuzzleEffect, flashorigin, flashdir);
ADDRLP4 436
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 888
ARGP4
ADDRLP4 900
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 710
;710:				}
line 711
;711:			}
ADDRGP4 $377
JUMPV
LABELV $376
line 713
;712:			else
;713:			{	// Regular firing
line 714
;714:				if (weapon->muzzleEffect)
ADDRLP4 436
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 0
EQI4 $380
line 715
;715:				{
line 716
;716:					trap_FX_PlayEffectID(weapon->muzzleEffect, flashorigin, flashdir);
ADDRLP4 436
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 888
ARGP4
ADDRLP4 900
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 717
;717:				}
LABELV $380
line 718
;718:			}
LABELV $377
line 719
;719:		}
LABELV $373
line 722
;720:
;721:		// add lightning bolt
;722:		CG_LightningBolt( nonPredictedCent, flashorigin );
ADDRLP4 656
INDIRP4
ARGP4
ADDRLP4 888
ARGP4
ADDRGP4 CG_LightningBolt
CALLV
pop
line 724
;723:
;724:		if ( weapon->flashDlightColor[0] || weapon->flashDlightColor[1] || weapon->flashDlightColor[2] ) {
ADDRLP4 916
CNSTF4 0
ASGNF4
ADDRLP4 436
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 916
INDIRF4
NEF4 $385
ADDRLP4 436
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ADDRLP4 916
INDIRF4
NEF4 $385
ADDRLP4 436
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRLP4 916
INDIRF4
EQF4 $382
LABELV $385
line 725
;725:			trap_R_AddLightToScene( flashorigin, 300 + (rand()&31), weapon->flashDlightColor[0],
ADDRLP4 920
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 888
ARGP4
ADDRLP4 920
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 300
ADDI4
CVIF4 4
ARGF4
ADDRLP4 436
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ARGF4
ADDRLP4 436
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ARGF4
ADDRLP4 436
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 727
;726:				weapon->flashDlightColor[1], weapon->flashDlightColor[2] );
;727:		}
LABELV $382
line 728
;728:	}
LABELV $355
line 729
;729:}
LABELV $219
endproc CG_AddPlayerWeapon 972 36
export CG_AddViewWeapon
proc CG_AddViewWeapon 264 24
line 738
;730:
;731:/*
;732:==============
;733:CG_AddViewWeapon
;734:
;735:Add the weapon, and flash for the player's view
;736:==============
;737:*/
;738:void CG_AddViewWeapon( playerState_t *ps ) {
line 745
;739:	refEntity_t	hand;
;740:	centity_t	*cent;
;741:	clientInfo_t	*ci;
;742:	float		fovOffset;
;743:	vec3_t		angles;
;744:	weaponInfo_t	*weapon;
;745:	float	cgFov = cg_fov.value;
ADDRLP4 212
ADDRGP4 cg_fov+8
INDIRF4
ASGNF4
line 747
;746:
;747:	if (cgFov < 1)
ADDRLP4 212
INDIRF4
CNSTF4 1065353216
GEF4 $388
line 748
;748:	{
line 749
;749:		cgFov = 1;
ADDRLP4 212
CNSTF4 1065353216
ASGNF4
line 750
;750:	}
LABELV $388
line 751
;751:	if (cgFov > 97)
ADDRLP4 212
INDIRF4
CNSTF4 1120010240
LEF4 $390
line 752
;752:	{
line 753
;753:		cgFov = 97;
ADDRLP4 212
CNSTF4 1120010240
ASGNF4
line 754
;754:	}
LABELV $390
line 756
;755:
;756:	if ( ps->persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 3
NEI4 $392
line 757
;757:		return;
ADDRGP4 $386
JUMPV
LABELV $392
line 760
;758:	}
;759:
;760:	if ( ps->pm_type == PM_INTERMISSION ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $394
line 761
;761:		return;
ADDRGP4 $386
JUMPV
LABELV $394
line 766
;762:	}
;763:
;764:	// no gun if in third person view or a camera is active
;765:	//if ( cg.renderingThirdPerson || cg.cameraMode) {
;766:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $396
line 767
;767:		return;
ADDRGP4 $386
JUMPV
LABELV $396
line 771
;768:	}
;769:
;770:	// allow the gun to be completely removed
;771:	if ( !cg_drawGun.integer || cg.predictedPlayerState.zoomMode) {
ADDRLP4 244
CNSTI4 0
ASGNI4
ADDRGP4 cg_drawGun+12
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $404
ADDRGP4 cg+96+1332
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $399
LABELV $404
line 774
;772:		vec3_t		origin;
;773:
;774:		if ( ps->eFlags & EF_FIRING ) {
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $386
line 776
;775:			// special hack for lightning gun...
;776:			VectorCopy( cg.refdef.vieworg, origin );
ADDRLP4 248
ADDRGP4 cg+3616+24
INDIRB
ASGNB 12
line 777
;777:			VectorMA( origin, -8, cg.refdef.viewaxis[2], origin );
ADDRLP4 260
CNSTF4 3238002688
ASGNF4
ADDRLP4 248
ADDRLP4 248
INDIRF4
ADDRLP4 260
INDIRF4
ADDRGP4 cg+3616+36+24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 248+4
ADDRLP4 248+4
INDIRF4
ADDRLP4 260
INDIRF4
ADDRGP4 cg+3616+36+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 248+8
ADDRLP4 248+8
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+3616+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 778
;778:			CG_LightningBolt( &cg_entities[ps->clientNum], origin );
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRLP4 248
ARGP4
ADDRGP4 CG_LightningBolt
CALLV
pop
line 779
;779:		}
line 780
;780:		return;
ADDRGP4 $386
JUMPV
LABELV $399
line 784
;781:	}
;782:
;783:	// don't draw if testing a gun model
;784:	if ( cg.testGun ) {
ADDRGP4 cg+13760
INDIRI4
CNSTI4 0
EQI4 $424
line 785
;785:		return;
ADDRGP4 $386
JUMPV
LABELV $424
line 789
;786:	}
;787:
;788:	// drop gun lower at higher fov
;789:	if ( cgFov > 90 ) {
ADDRLP4 212
INDIRF4
CNSTF4 1119092736
LEF4 $427
line 790
;790:		fovOffset = -0.2 * ( cgFov - 90 );
ADDRLP4 220
CNSTF4 3192704205
ADDRLP4 212
INDIRF4
CNSTF4 1119092736
SUBF4
MULF4
ASGNF4
line 791
;791:	} else {
ADDRGP4 $428
JUMPV
LABELV $427
line 792
;792:		fovOffset = 0;
ADDRLP4 220
CNSTF4 0
ASGNF4
line 793
;793:	}
LABELV $428
line 795
;794:
;795:	cent = &cg.predictedPlayerEntity;	// &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 216
ADDRGP4 cg+1476
ASGNP4
line 797
;796:	//cent = &cg_entities[cg.predictedPlayerState.clientNum];
;797:	CG_RegisterWeapon( ps->weapon );
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 798
;798:	weapon = &cg_weapons[ ps->weapon ];
ADDRLP4 236
CNSTI4 208
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 800
;799:
;800:	memset (&hand, 0, sizeof(hand));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 803
;801:
;802:	// set up gun position
;803:	CG_CalculateWeaponPosition( hand.origin, angles );
ADDRLP4 0+52
ARGP4
ADDRLP4 224
ARGP4
ADDRGP4 CG_CalculateWeaponPosition
CALLV
pop
line 805
;804:
;805:	VectorMA( hand.origin, cg_gun_x.value, cg.refdef.viewaxis[0], hand.origin );
ADDRLP4 0+52
ADDRLP4 0+52
INDIRF4
ADDRGP4 cg+3616+36
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+4
ADDRLP4 0+52+4
INDIRF4
ADDRGP4 cg+3616+36+4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
ADDRGP4 cg+3616+36+8
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 806
;806:	VectorMA( hand.origin, cg_gun_y.value, cg.refdef.viewaxis[1], hand.origin );
ADDRLP4 0+52
ADDRLP4 0+52
INDIRF4
ADDRGP4 cg+3616+36+12
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+4
ADDRLP4 0+52+4
INDIRF4
ADDRGP4 cg+3616+36+12+4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
ADDRGP4 cg+3616+36+12+8
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 807
;807:	VectorMA( hand.origin, (cg_gun_z.value+fovOffset), cg.refdef.viewaxis[2], hand.origin );
ADDRLP4 0+52
ADDRLP4 0+52
INDIRF4
ADDRGP4 cg+3616+36+24
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 220
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+4
ADDRLP4 0+52+4
INDIRF4
ADDRGP4 cg+3616+36+24+4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 220
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
ADDRGP4 cg+3616+36+24+8
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 220
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 809
;808:
;809:	AnglesToAxis( angles, hand.axis );
ADDRLP4 224
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 812
;810:
;811:	// map torso animations to weapon animations
;812:	if ( cg_gun_frame.integer ) {
ADDRGP4 cg_gun_frame+12
INDIRI4
CNSTI4 0
EQI4 $501
line 814
;813:		// development tool
;814:		hand.frame = hand.oldframe = cg_gun_frame.integer;
ADDRLP4 248
ADDRGP4 cg_gun_frame+12
INDIRI4
ASGNI4
ADDRLP4 0+124
ADDRLP4 248
INDIRI4
ASGNI4
ADDRLP4 0+104
ADDRLP4 248
INDIRI4
ASGNI4
line 815
;815:		hand.backlerp = 0;
ADDRLP4 0+128
CNSTF4 0
ASGNF4
line 816
;816:	} else {
ADDRGP4 $502
JUMPV
LABELV $501
line 818
;817:		// get clientinfo for animation map
;818:		ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 240
CNSTI4 788
ADDRLP4 216
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 819
;819:		hand.frame = CG_MapTorsoToWeaponFrame( ci, cent->pe.torso.frame, cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT );
ADDRLP4 240
INDIRP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ARGI4
ADDRLP4 216
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 252
ADDRGP4 CG_MapTorsoToWeaponFrame
CALLI4
ASGNI4
ADDRLP4 0+104
ADDRLP4 252
INDIRI4
ASGNI4
line 820
;820:		hand.oldframe = CG_MapTorsoToWeaponFrame( ci, cent->pe.torso.oldFrame, cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT );
ADDRLP4 240
INDIRP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ARGI4
ADDRLP4 216
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 260
ADDRGP4 CG_MapTorsoToWeaponFrame
CALLI4
ASGNI4
ADDRLP4 0+124
ADDRLP4 260
INDIRI4
ASGNI4
line 821
;821:		hand.backlerp = cent->pe.torso.backlerp;
ADDRLP4 0+128
ADDRLP4 216
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ASGNF4
line 824
;822:
;823:		// Handle the fringe situation where oldframe is invalid
;824:		if ( hand.frame == -1 )
ADDRLP4 0+104
INDIRI4
CNSTI4 -1
NEI4 $512
line 825
;825:		{
line 826
;826:			hand.frame = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 827
;827:			hand.oldframe = 0;
ADDRLP4 0+124
CNSTI4 0
ASGNI4
line 828
;828:			hand.backlerp = 0;
ADDRLP4 0+128
CNSTF4 0
ASGNF4
line 829
;829:		}
ADDRGP4 $513
JUMPV
LABELV $512
line 830
;830:		else if ( hand.oldframe == -1 )
ADDRLP4 0+124
INDIRI4
CNSTI4 -1
NEI4 $518
line 831
;831:		{
line 832
;832:			hand.oldframe = hand.frame;
ADDRLP4 0+124
ADDRLP4 0+104
INDIRI4
ASGNI4
line 833
;833:			hand.backlerp = 0;
ADDRLP4 0+128
CNSTF4 0
ASGNF4
line 834
;834:		}
LABELV $518
LABELV $513
line 835
;835:	}
LABELV $502
line 837
;836:
;837:	hand.hModel = weapon->handsModel;
ADDRLP4 0+8
ADDRLP4 236
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 838
;838:	hand.renderfx = RF_DEPTHHACK | RF_FIRST_PERSON;// | RF_MINLIGHT;
ADDRLP4 0+4
CNSTI4 12
ASGNI4
line 841
;839:
;840:	// add everything onto the hand
;841:	CG_AddPlayerWeapon( &hand, ps, &cg_entities[cg.predictedPlayerState.clientNum], ps->persistant[PERS_TEAM], angles, qfalse );
ADDRLP4 0
ARGP4
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
ARGP4
CNSTI4 1920
ADDRGP4 cg+96+144
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 224
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 842
;842:}
LABELV $386
endproc CG_AddViewWeapon 264 24
export CG_DrawIconBackground
proc CG_DrawIconBackground 56 20
line 857
;843:
;844:/*
;845:==============================================================================
;846:
;847:WEAPON SELECTION
;848:
;849:==============================================================================
;850:*/
;851:#define ICON_WEAPONS	0
;852:#define ICON_FORCE		1
;853:#define ICON_INVENTORY	2
;854:
;855:
;856:void CG_DrawIconBackground(void)
;857:{
line 860
;858:	int				height,xAdd,x2,y2,t;
;859:	int				prongLeftX,prongRightX;
;860:	float			inTime = cg.invenSelectTime+WEAPON_SELECT_TIME;
ADDRLP4 32
ADDRGP4 cg+13788
INDIRF4
CNSTF4 1152319488
ADDF4
ASGNF4
line 861
;861:	float			wpTime = cg.weaponSelectTime+WEAPON_SELECT_TIME;
ADDRLP4 36
ADDRGP4 cg+13372
INDIRI4
CNSTI4 1400
ADDI4
CVIF4 4
ASGNF4
line 862
;862:	float			fpTime = cg.forceSelectTime+WEAPON_SELECT_TIME;
ADDRLP4 40
ADDRGP4 cg+13792
INDIRF4
CNSTF4 1152319488
ADDF4
ASGNF4
line 864
;863:	qhandle_t		background;
;864:	int				drawType = cgs.media.weaponIconBackground;
ADDRLP4 8
ADDRGP4 cgs+70296+1216
INDIRI4
ASGNI4
line 865
;865:	int				prongsOn = cgs.media.weaponProngsOn;
ADDRLP4 28
ADDRGP4 cgs+70296+1224
INDIRI4
ASGNI4
line 868
;866:		
;867:	// don't display if dead
;868:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
GTI4 $536
line 869
;869:	{
line 870
;870:		return;
ADDRGP4 $528
JUMPV
LABELV $536
line 873
;871:	}
;872:
;873:	if (cg_hudFiles.integer)
ADDRGP4 cg_hudFiles+12
INDIRI4
CNSTI4 0
EQI4 $539
line 874
;874:	{ //simple hud
line 875
;875:		return;
ADDRGP4 $528
JUMPV
LABELV $539
line 878
;876:	}
;877:
;878:	x2 = 30;
ADDRLP4 0
CNSTI4 30
ASGNI4
line 879
;879:	y2 = SCREEN_HEIGHT-70;
ADDRLP4 4
CNSTI4 410
ASGNI4
line 881
;880:
;881:	prongLeftX =x2+37; 
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 37
ADDI4
ASGNI4
line 882
;882:	prongRightX =x2+544; 
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ASGNI4
line 884
;883:
;884:	if (inTime > wpTime)
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LEF4 $542
line 885
;885:	{
line 886
;886:		drawType = cgs.media.inventoryIconBackground;
ADDRLP4 8
ADDRGP4 cgs+70296+1236
INDIRI4
ASGNI4
line 887
;887:		prongsOn = cgs.media.inventoryProngsOn;
ADDRLP4 28
ADDRGP4 cgs+70296+1240
INDIRI4
ASGNI4
line 888
;888:		cg.iconSelectTime = cg.invenSelectTime;
ADDRGP4 cg+13784
ADDRGP4 cg+13788
INDIRF4
ASGNF4
line 889
;889:	}
ADDRGP4 $543
JUMPV
LABELV $542
line 891
;890:	else
;891:	{
line 892
;892:		drawType = cgs.media.weaponIconBackground;
ADDRLP4 8
ADDRGP4 cgs+70296+1216
INDIRI4
ASGNI4
line 893
;893:		prongsOn = cgs.media.weaponProngsOn;
ADDRLP4 28
ADDRGP4 cgs+70296+1224
INDIRI4
ASGNI4
line 894
;894:		cg.iconSelectTime = cg.weaponSelectTime;
ADDRGP4 cg+13784
ADDRGP4 cg+13372
INDIRI4
CVIF4 4
ASGNF4
line 895
;895:	}
LABELV $543
line 897
;896:
;897:	if (fpTime > inTime && fpTime > wpTime)
ADDRLP4 40
INDIRF4
ADDRLP4 32
INDIRF4
LEF4 $556
ADDRLP4 40
INDIRF4
ADDRLP4 36
INDIRF4
LEF4 $556
line 898
;898:	{
line 899
;899:		drawType = cgs.media.forceIconBackground;
ADDRLP4 8
ADDRGP4 cgs+70296+1228
INDIRI4
ASGNI4
line 900
;900:		prongsOn = cgs.media.forceProngsOn;
ADDRLP4 28
ADDRGP4 cgs+70296+1232
INDIRI4
ASGNI4
line 901
;901:		cg.iconSelectTime = cg.forceSelectTime;
ADDRGP4 cg+13784
ADDRGP4 cg+13792
INDIRF4
ASGNF4
line 902
;902:	}
LABELV $556
line 904
;903:
;904:	if ((cg.iconSelectTime+WEAPON_SELECT_TIME)<cg.time)	// Time is up for the HUD to display
ADDRGP4 cg+13784
INDIRF4
CNSTF4 1152319488
ADDF4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
GEF4 $564
line 905
;905:	{
line 906
;906:		if (cg.iconHUDActive)		// The time is up, but we still need to move the prongs back to their original position
ADDRGP4 cg+13776
INDIRI4
CNSTI4 0
EQI4 $568
line 907
;907:		{
line 908
;908:			t =  cg.time - (cg.iconSelectTime+WEAPON_SELECT_TIME);
ADDRLP4 48
ADDRGP4 cg+64
INDIRI4
CVIF4 4
ADDRGP4 cg+13784
INDIRF4
CNSTF4 1152319488
ADDF4
SUBF4
CVFI4 4
ASGNI4
line 909
;909:			cg.iconHUDPercent = t/ 130.0f;
ADDRGP4 cg+13780
ADDRLP4 48
INDIRI4
CVIF4 4
CNSTF4 1124204544
DIVF4
ASGNF4
line 910
;910:			cg.iconHUDPercent = 1 - cg.iconHUDPercent;
ADDRGP4 cg+13780
CNSTF4 1065353216
ADDRGP4 cg+13780
INDIRF4
SUBF4
ASGNF4
line 912
;911:
;912:			if (cg.iconHUDPercent<0)
ADDRGP4 cg+13780
INDIRF4
CNSTF4 0
GEF4 $576
line 913
;913:			{
line 914
;914:				cg.iconHUDActive = qfalse;
ADDRGP4 cg+13776
CNSTI4 0
ASGNI4
line 915
;915:				cg.iconHUDPercent=0;
ADDRGP4 cg+13780
CNSTF4 0
ASGNF4
line 916
;916:			}
LABELV $576
line 918
;917:
;918:			xAdd = (int) 8*cg.iconHUDPercent;
ADDRLP4 12
CNSTF4 1090519040
ADDRGP4 cg+13780
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 920
;919:
;920:			height = (int) (60.0f*cg.iconHUDPercent);
ADDRLP4 16
CNSTF4 1114636288
ADDRGP4 cg+13780
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 921
;921:			CG_DrawPic( x2+60, y2+30, 460, -height, drawType);	// Top half
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 30
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139146752
ARGF4
ADDRLP4 16
INDIRI4
NEGI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 922
;922:			CG_DrawPic( x2+60, y2+30-2,460, height, drawType);	// Bottom half
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 30
ADDI4
CNSTI4 2
SUBI4
CVIF4 4
ARGF4
CNSTF4 1139146752
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 924
;923:
;924:		}
ADDRGP4 $569
JUMPV
LABELV $568
line 926
;925:		else
;926:		{
line 927
;927:			xAdd = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 928
;928:		}
LABELV $569
line 930
;929:
;930:		trap_R_SetColor(hudTintColor);					
ADDRGP4 hudTintColor
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 931
;931:		CG_DrawPic( prongLeftX+xAdd, y2-10, 40, 80, cgs.media.weaponProngsOff);
ADDRLP4 20
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 10
SUBI4
CVIF4 4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1117782016
ARGF4
ADDRGP4 cgs+70296+1220
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 932
;932:		CG_DrawPic( prongRightX-xAdd, y2-10, -40, 80, cgs.media.weaponProngsOff);
ADDRLP4 24
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 10
SUBI4
CVIF4 4
ARGF4
CNSTF4 3256877056
ARGF4
CNSTF4 1117782016
ARGF4
ADDRGP4 cgs+70296+1220
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 934
;933:
;934:		return;
ADDRGP4 $528
JUMPV
LABELV $564
line 936
;935:	}
;936:	prongLeftX =x2+37; 
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 37
ADDI4
ASGNI4
line 937
;937:	prongRightX =x2+544; 
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ASGNI4
line 939
;938:
;939:	if (!cg.iconHUDActive)
ADDRGP4 cg+13776
INDIRI4
CNSTI4 0
NEI4 $587
line 940
;940:	{
line 941
;941:		t = cg.time - cg.iconSelectTime;
ADDRLP4 48
ADDRGP4 cg+64
INDIRI4
CVIF4 4
ADDRGP4 cg+13784
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 942
;942:		cg.iconHUDPercent = t/ 130.0f;
ADDRGP4 cg+13780
ADDRLP4 48
INDIRI4
CVIF4 4
CNSTF4 1124204544
DIVF4
ASGNF4
line 945
;943:
;944:		// Calc how far into opening sequence we are
;945:		if (cg.iconHUDPercent>1)
ADDRGP4 cg+13780
INDIRF4
CNSTF4 1065353216
LEF4 $593
line 946
;946:		{
line 947
;947:			cg.iconHUDActive = qtrue;
ADDRGP4 cg+13776
CNSTI4 1
ASGNI4
line 948
;948:			cg.iconHUDPercent=1;
ADDRGP4 cg+13780
CNSTF4 1065353216
ASGNF4
line 949
;949:		}
ADDRGP4 $588
JUMPV
LABELV $593
line 950
;950:		else if (cg.iconHUDPercent<0)
ADDRGP4 cg+13780
INDIRF4
CNSTF4 0
GEF4 $588
line 951
;951:		{
line 952
;952:			cg.iconHUDPercent=0;
ADDRGP4 cg+13780
CNSTF4 0
ASGNF4
line 953
;953:		}
line 954
;954:	}
ADDRGP4 $588
JUMPV
LABELV $587
line 956
;955:	else
;956:	{
line 957
;957:		cg.iconHUDPercent=1;
ADDRGP4 cg+13780
CNSTF4 1065353216
ASGNF4
line 958
;958:	}
LABELV $588
line 960
;959:
;960:	trap_R_SetColor( colorTable[CT_WHITE] );					
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 961
;961:	height = (int) (60.0f*cg.iconHUDPercent);
ADDRLP4 16
CNSTF4 1114636288
ADDRGP4 cg+13780
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 962
;962:	CG_DrawPic( x2+60, y2+30, 460, -height, drawType);	// Top half
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 30
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139146752
ARGF4
ADDRLP4 16
INDIRI4
NEGI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 963
;963:	CG_DrawPic( x2+60, y2+30-2,460, height, drawType);	// Bottom half
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 30
ADDI4
CNSTI4 2
SUBI4
CVIF4 4
ARGF4
CNSTF4 1139146752
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 973
;964:
;965:	// And now for the prongs
;966:/*	if ((cg.inventorySelectTime+WEAPON_SELECT_TIME)>cg.time)	
;967:	{
;968:		cgs.media.currentBackground = ICON_INVENTORY;
;969:		background = &cgs.media.inventoryProngsOn;
;970:	}
;971:	else if ((cg.weaponSelectTime+WEAPON_SELECT_TIME)>cg.time)	
;972:	{*/
;973:		cgs.media.currentBackground = ICON_WEAPONS;
ADDRGP4 cgs+70296+1212
CNSTI4 0
ASGNI4
line 974
;974:		background = prongsOn;
ADDRLP4 44
ADDRLP4 28
INDIRI4
ASGNI4
line 983
;975:/*	}
;976:	else 
;977:	{
;978:		cgs.media.currentBackground = ICON_FORCE;
;979:		background = &cgs.media.forceProngsOn;
;980:	}
;981:*/
;982:	// Side Prongs
;983:	trap_R_SetColor( colorTable[CT_WHITE]);					
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 984
;984:	xAdd = (int) 8*cg.iconHUDPercent;
ADDRLP4 12
CNSTF4 1090519040
ADDRGP4 cg+13780
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 985
;985:	CG_DrawPic( prongLeftX+xAdd, y2-10, 40, 80, background);
ADDRLP4 20
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 10
SUBI4
CVIF4 4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1117782016
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 986
;986:	CG_DrawPic( prongRightX-xAdd, y2-10, -40, 80, background);
ADDRLP4 24
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 10
SUBI4
CVIF4 4
ARGF4
CNSTF4 3256877056
ARGF4
CNSTF4 1117782016
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 988
;987:
;988:}
LABELV $528
endproc CG_DrawIconBackground 56 20
export CG_WeaponCheck
proc CG_WeaponCheck 12 0
line 991
;989:
;990:qboolean CG_WeaponCheck(int weap)
;991:{
line 992
;992:	if (cg.snap->ps.ammo[weaponData[weap].ammoIndex] < weaponData[weap].energyPerShot &&
ADDRLP4 0
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
CNSTI4 452
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
GEI4 $610
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
GEI4 $610
line 994
;993:		cg.snap->ps.ammo[weaponData[weap].ammoIndex] < weaponData[weap].altEnergyPerShot)
;994:	{
line 995
;995:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $609
JUMPV
LABELV $610
line 998
;996:	}
;997:
;998:	return qtrue;
CNSTI4 1
RETI4
LABELV $609
endproc CG_WeaponCheck 12 0
proc CG_WeaponSelectable 12 0
line 1006
;999:}
;1000:
;1001:/*
;1002:===============
;1003:CG_WeaponSelectable
;1004:===============
;1005:*/
;1006:static qboolean CG_WeaponSelectable( int i ) {
line 1010
;1007:	/*if ( !cg.snap->ps.ammo[weaponData[i].ammoIndex] ) {
;1008:		return qfalse;
;1009:	}*/
;1010:	if (!i)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $617
line 1011
;1011:	{
line 1012
;1012:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $616
JUMPV
LABELV $617
line 1015
;1013:	}
;1014:
;1015:	if (cg.predictedPlayerState.ammo[weaponData[i].ammoIndex] < weaponData[i].energyPerShot &&
ADDRLP4 0
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cg+96+408
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
GEI4 $619
ADDRLP4 4
INDIRI4
ADDRGP4 cg+96+408
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
GEI4 $619
line 1017
;1016:		cg.predictedPlayerState.ammo[weaponData[i].ammoIndex] < weaponData[i].altEnergyPerShot)
;1017:	{
line 1018
;1018:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $616
JUMPV
LABELV $619
line 1021
;1019:	}
;1020:
;1021:	if (i == WP_DET_PACK && cg.predictedPlayerState.ammo[weaponData[i].ammoIndex] < 1 &&
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 13
NEI4 $627
CNSTI4 56
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+96+408
ADDP4
INDIRI4
CNSTI4 1
GEI4 $627
ADDRGP4 cg+96+640
INDIRI4
CNSTI4 0
NEI4 $627
line 1023
;1022:		!cg.predictedPlayerState.hasDetPackPlanted)
;1023:	{
line 1024
;1024:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $616
JUMPV
LABELV $627
line 1027
;1025:	}
;1026:
;1027:	if ( ! (cg.predictedPlayerState.stats[ STAT_WEAPONS ] & ( 1 << i ) ) ) {
ADDRGP4 cg+96+216+16
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $633
line 1028
;1028:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $616
JUMPV
LABELV $633
line 1031
;1029:	}
;1030:
;1031:	return qtrue;
CNSTI4 1
RETI4
LABELV $616
endproc CG_WeaponSelectable 12 0
lit
align 4
LABELV $751
byte 4 1063256064
byte 4 1060622041
byte 4 1039650521
byte 4 1065353216
export CG_DrawWeaponSelect
code
proc CG_DrawWeaponSelect 1112 20
line 1039
;1032:}
;1033:
;1034:/*
;1035:===================
;1036:CG_DrawWeaponSelect
;1037:===================
;1038:*/
;1039:void CG_DrawWeaponSelect( void ) {
line 1049
;1040:	int				i;
;1041:	int				bits;
;1042:	int				count;
;1043:	int				smallIconSize,bigIconSize;
;1044:	int				holdX,x,y,pad;
;1045:	int				sideLeftIconCnt,sideRightIconCnt;
;1046:	int				sideMax,holdCount,iconCnt;
;1047:	int				height;
;1048:
;1049:	if (cg.predictedPlayerState.emplacedIndex)
ADDRGP4 cg+96+596
INDIRI4
CNSTI4 0
EQI4 $639
line 1050
;1050:	{ //can't cycle when on a weapon
line 1051
;1051:		cg.weaponSelectTime = 0;
ADDRGP4 cg+13372
CNSTI4 0
ASGNI4
line 1052
;1052:	}
LABELV $639
line 1054
;1053:
;1054:	if ((cg.weaponSelectTime+WEAPON_SELECT_TIME)<cg.time)	// Time is up for the HUD to display
ADDRGP4 cg+13372
INDIRI4
CNSTI4 1400
ADDI4
ADDRGP4 cg+64
INDIRI4
GEI4 $644
line 1055
;1055:	{
line 1056
;1056:		return;
ADDRGP4 $638
JUMPV
LABELV $644
line 1060
;1057:	}
;1058:
;1059:	// don't display if dead
;1060:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) 
ADDRGP4 cg+96+216
INDIRI4
CNSTI4 0
GTI4 $648
line 1061
;1061:	{
line 1062
;1062:		return;
ADDRGP4 $638
JUMPV
LABELV $648
line 1066
;1063:	}
;1064:
;1065:	// showing weapon select clears pickup item display, but not the blend blob
;1066:	cg.itemPickupTime = 0;
ADDRGP4 cg+13364
CNSTI4 0
ASGNI4
line 1068
;1067:
;1068:	bits = cg.predictedPlayerState.stats[ STAT_WEAPONS ];
ADDRLP4 12
ADDRGP4 cg+96+216+16
INDIRI4
ASGNI4
line 1071
;1069:
;1070:	// count the number of weapons owned
;1071:	count = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 1073
;1072:
;1073:	if ( !CG_WeaponSelectable(cg.weaponSelect) &&
ADDRGP4 cg+3508
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $656
ADDRGP4 cg+3508
INDIRI4
CNSTI4 11
EQI4 $661
ADDRGP4 cg+3508
INDIRI4
CNSTI4 12
NEI4 $656
LABELV $661
line 1075
;1074:		(cg.weaponSelect == WP_THERMAL || cg.weaponSelect == WP_TRIP_MINE) )
;1075:	{ //display this weapon that we don't actually "have" as unhighlighted until it's deselected
line 1077
;1076:	  //since it's selected we must increase the count to display the proper number of valid selectable weapons
;1077:		count++;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1078
;1078:	}
LABELV $656
line 1080
;1079:
;1080:	for ( i = 1 ; i < 16 ; i++ ) 
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $662
line 1081
;1081:	{
line 1082
;1082:		if ( bits & ( 1 << i ) ) 
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $666
line 1083
;1083:		{
line 1084
;1084:			if ( CG_WeaponSelectable(i) ||
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $670
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $668
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $668
LABELV $670
line 1086
;1085:				(i != WP_THERMAL && i != WP_TRIP_MINE) )
;1086:			{
line 1087
;1087:				count++;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1088
;1088:			}
LABELV $668
line 1089
;1089:		}
LABELV $666
line 1090
;1090:	}
LABELV $663
line 1080
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $662
line 1092
;1091:
;1092:	if (count == 0)	// If no weapons, don't display
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $671
line 1093
;1093:	{
line 1094
;1094:		return;
ADDRGP4 $638
JUMPV
LABELV $671
line 1097
;1095:	}
;1096:
;1097:	sideMax = 3;	// Max number of icons on the side
ADDRLP4 56
CNSTI4 3
ASGNI4
line 1100
;1098:
;1099:	// Calculate how many icons will appear to either side of the center one
;1100:	holdCount = count - 1;	// -1 for the center icon
ADDRLP4 52
ADDRLP4 36
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1101
;1101:	if (holdCount == 0)			// No icons to either side
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $673
line 1102
;1102:	{
line 1103
;1103:		sideLeftIconCnt = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1104
;1104:		sideRightIconCnt = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1105
;1105:	}
ADDRGP4 $674
JUMPV
LABELV $673
line 1106
;1106:	else if (count > (2*sideMax))	// Go to the max on each side
ADDRLP4 36
INDIRI4
ADDRLP4 56
INDIRI4
CNSTI4 1
LSHI4
LEI4 $675
line 1107
;1107:	{
line 1108
;1108:		sideLeftIconCnt = sideMax;
ADDRLP4 28
ADDRLP4 56
INDIRI4
ASGNI4
line 1109
;1109:		sideRightIconCnt = sideMax;
ADDRLP4 32
ADDRLP4 56
INDIRI4
ASGNI4
line 1110
;1110:	}
ADDRGP4 $676
JUMPV
LABELV $675
line 1112
;1111:	else							// Less than max, so do the calc
;1112:	{
line 1113
;1113:		sideLeftIconCnt = holdCount/2;
ADDRLP4 28
ADDRLP4 52
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1114
;1114:		sideRightIconCnt = holdCount - sideLeftIconCnt;
ADDRLP4 32
ADDRLP4 52
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
ASGNI4
line 1115
;1115:	}
LABELV $676
LABELV $674
line 1117
;1116:
;1117:	i = cg.weaponSelect - 1;
ADDRLP4 0
ADDRGP4 cg+3508
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1118
;1118:	if (i<1)
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $678
line 1119
;1119:	{
line 1120
;1120:		i = 13;
ADDRLP4 0
CNSTI4 13
ASGNI4
line 1121
;1121:	}
LABELV $678
line 1123
;1122:
;1123:	smallIconSize = 40;
ADDRLP4 8
CNSTI4 40
ASGNI4
line 1124
;1124:	bigIconSize = 80;
ADDRLP4 40
CNSTI4 80
ASGNI4
line 1125
;1125:	pad = 12;
ADDRLP4 20
CNSTI4 12
ASGNI4
line 1127
;1126:
;1127:	x = 320;
ADDRLP4 44
CNSTI4 320
ASGNI4
line 1128
;1128:	y = 410;
ADDRLP4 24
CNSTI4 410
ASGNI4
line 1136
;1129:
;1130:	// Background
;1131://	memcpy(calcColor, colorTable[CT_WHITE], sizeof(vec4_t));
;1132://	calcColor[3] = .35f;
;1133://	trap_R_SetColor( calcColor);					
;1134:
;1135:	// Left side ICONS
;1136:	trap_R_SetColor(colorTable[CT_WHITE]);
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1138
;1137:	// Work backwards from current icon
;1138:	holdX = x - ((bigIconSize/2) + pad + smallIconSize);
ADDRLP4 16
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
CNSTI4 2
DIVI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
SUBI4
ASGNI4
line 1139
;1139:	height = smallIconSize * 1;//cg.iconHUDPercent;
ADDRLP4 48
CNSTI4 1
ADDRLP4 8
INDIRI4
MULI4
ASGNI4
line 1141
;1140:
;1141:	for (iconCnt=1;iconCnt<(sideLeftIconCnt+1);i--)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $684
JUMPV
LABELV $681
line 1142
;1142:	{
line 1143
;1143:		if (i<1)
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $685
line 1144
;1144:		{
line 1145
;1145:			i = 13;
ADDRLP4 0
CNSTI4 13
ASGNI4
line 1146
;1146:		}
LABELV $685
line 1148
;1147:
;1148:		if ( !(bits & ( 1 << i )))	// Does he have this weapon?
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $687
line 1149
;1149:		{
line 1150
;1150:			continue;
ADDRGP4 $682
JUMPV
LABELV $687
line 1153
;1151:		}
;1152:
;1153:		if ( !CG_WeaponSelectable(i) &&
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $689
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $691
ADDRLP4 0
INDIRI4
CNSTI4 12
NEI4 $689
LABELV $691
line 1155
;1154:			(i == WP_THERMAL || i == WP_TRIP_MINE) )
;1155:		{ //Don't show thermal and tripmine when out of them
line 1156
;1156:			continue;
ADDRGP4 $682
JUMPV
LABELV $689
line 1159
;1157:		}
;1158:
;1159:		++iconCnt;					// Good icon
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1161
;1160:
;1161:		if (cgs.media.weaponIcons[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+928
ADDP4
INDIRI4
CNSTI4 0
EQI4 $692
line 1162
;1162:		{
line 1164
;1163:			weaponInfo_t	*weaponInfo;
;1164:			CG_RegisterWeapon( i );	
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 1165
;1165:			weaponInfo = &cg_weapons[i];
ADDRLP4 72
CNSTI4 208
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1167
;1166:
;1167:			trap_R_SetColor(colorTable[CT_WHITE]);
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1168
;1168:			if (!CG_WeaponCheck(i))
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 CG_WeaponCheck
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $697
line 1169
;1169:			{
line 1170
;1170:				CG_DrawPic( holdX, y+10, smallIconSize, smallIconSize, /*weaponInfo->weaponIconNoAmmo*/cgs.media.weaponIcons_NA[i] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 80
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+992
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1171
;1171:			}
ADDRGP4 $698
JUMPV
LABELV $697
line 1173
;1172:			else
;1173:			{
line 1174
;1174:				CG_DrawPic( holdX, y+10, smallIconSize, smallIconSize, /*weaponInfo->weaponIcon*/cgs.media.weaponIcons[i] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 80
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+928
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1175
;1175:			}
LABELV $698
line 1177
;1176:
;1177:			holdX -= (smallIconSize+pad);
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
SUBI4
ASGNI4
line 1178
;1178:		}
LABELV $692
line 1179
;1179:	}
LABELV $682
line 1141
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $684
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
LTI4 $681
line 1182
;1180:
;1181:	// Current Center Icon
;1182:	height = bigIconSize * cg.iconHUDPercent;
ADDRLP4 48
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRGP4 cg+13780
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1183
;1183:	if (cgs.media.weaponIcons[cg.weaponSelect])
ADDRGP4 cg+3508
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+928
ADDP4
INDIRI4
CNSTI4 0
EQI4 $704
line 1184
;1184:	{
line 1186
;1185:		weaponInfo_t	*weaponInfo;
;1186:		CG_RegisterWeapon( cg.weaponSelect );	
ADDRGP4 cg+3508
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 1187
;1187:		weaponInfo = &cg_weapons[cg.weaponSelect];
ADDRLP4 64
CNSTI4 208
ADDRGP4 cg+3508
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1189
;1188:
;1189:		trap_R_SetColor( colorTable[CT_WHITE]);
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1190
;1190:		if (!CG_WeaponCheck(cg.weaponSelect))
ADDRGP4 cg+3508
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_WeaponCheck
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $712
line 1191
;1191:		{
line 1192
;1192:			CG_DrawPic( x-(bigIconSize/2), (y-((bigIconSize-smallIconSize)/2))+10, bigIconSize, bigIconSize, cgs.media.weaponIcons_NA[cg.weaponSelect] );
ADDRLP4 76
CNSTI4 2
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
ADDRLP4 76
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
ADDRLP4 40
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ADDRLP4 76
INDIRI4
DIVI4
SUBI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 80
ADDRLP4 40
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRGP4 cg+3508
INDIRI4
ADDRLP4 76
INDIRI4
LSHI4
ADDRGP4 cgs+70296+992
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1193
;1193:		}
ADDRGP4 $713
JUMPV
LABELV $712
line 1195
;1194:		else
;1195:		{
line 1196
;1196:			CG_DrawPic( x-(bigIconSize/2), (y-((bigIconSize-smallIconSize)/2))+10, bigIconSize, bigIconSize, cgs.media.weaponIcons[cg.weaponSelect] );
ADDRLP4 76
CNSTI4 2
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
ADDRLP4 76
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
ADDRLP4 40
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ADDRLP4 76
INDIRI4
DIVI4
SUBI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 80
ADDRLP4 40
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRGP4 cg+3508
INDIRI4
ADDRLP4 76
INDIRI4
LSHI4
ADDRGP4 cgs+70296+928
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1197
;1197:		}
LABELV $713
line 1198
;1198:	}
LABELV $704
line 1200
;1199:
;1200:	i = cg.weaponSelect + 1;
ADDRLP4 0
ADDRGP4 cg+3508
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1201
;1201:	if (i> 13)
ADDRLP4 0
INDIRI4
CNSTI4 13
LEI4 $722
line 1202
;1202:	{
line 1203
;1203:		i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1204
;1204:	}
LABELV $722
line 1208
;1205:
;1206:	// Right side ICONS
;1207:	// Work forwards from current icon
;1208:	holdX = x + (bigIconSize/2) + pad;
ADDRLP4 16
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 1209
;1209:	height = smallIconSize * cg.iconHUDPercent;
ADDRLP4 48
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cg+13780
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1210
;1210:	for (iconCnt=1;iconCnt<(sideRightIconCnt+1);i++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $728
JUMPV
LABELV $725
line 1211
;1211:	{
line 1212
;1212:		if (i>13)
ADDRLP4 0
INDIRI4
CNSTI4 13
LEI4 $729
line 1213
;1213:		{
line 1214
;1214:			i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1215
;1215:		}
LABELV $729
line 1217
;1216:
;1217:		if ( !(bits & ( 1 << i )))	// Does he have this weapon?
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $731
line 1218
;1218:		{
line 1219
;1219:			continue;
ADDRGP4 $726
JUMPV
LABELV $731
line 1222
;1220:		}
;1221:
;1222:		if ( !CG_WeaponSelectable(i) &&
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $733
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $735
ADDRLP4 0
INDIRI4
CNSTI4 12
NEI4 $733
LABELV $735
line 1224
;1223:			(i == WP_THERMAL || i == WP_TRIP_MINE) )
;1224:		{ //Don't show thermal and tripmine when out of them
line 1225
;1225:			continue;
ADDRGP4 $726
JUMPV
LABELV $733
line 1228
;1226:		}
;1227:
;1228:		++iconCnt;					// Good icon
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1230
;1229:
;1230:		if (/*weaponData[i].weaponIcon[0]*/cgs.media.weaponIcons[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+928
ADDP4
INDIRI4
CNSTI4 0
EQI4 $736
line 1231
;1231:		{
line 1233
;1232:			weaponInfo_t	*weaponInfo;
;1233:			CG_RegisterWeapon( i );	
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 1234
;1234:			weaponInfo = &cg_weapons[i];
ADDRLP4 72
CNSTI4 208
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1236
;1235:			// No ammo for this weapon?
;1236:			trap_R_SetColor( colorTable[CT_WHITE]);
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1237
;1237:			if (!CG_WeaponCheck(i))
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 CG_WeaponCheck
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $741
line 1238
;1238:			{
line 1239
;1239:				CG_DrawPic( holdX, y+10, smallIconSize, smallIconSize, cgs.media.weaponIcons_NA[i] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 80
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+992
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1240
;1240:			}
ADDRGP4 $742
JUMPV
LABELV $741
line 1242
;1241:			else
;1242:			{
line 1243
;1243:				CG_DrawPic( holdX, y+10, smallIconSize, smallIconSize, cgs.media.weaponIcons[i] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 80
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+928
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1244
;1244:			}
LABELV $742
line 1247
;1245:
;1246:
;1247:			holdX += (smallIconSize+pad);
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ADDI4
ASGNI4
line 1248
;1248:		}
LABELV $736
line 1249
;1249:	}
LABELV $726
line 1210
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $728
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
LTI4 $725
line 1252
;1250:
;1251:	// draw the selected name
;1252:	if ( cg_weapons[ cg.weaponSelect ].item ) 
CNSTI4 208
ADDRGP4 cg+3508
INDIRI4
MULI4
ADDRGP4 cg_weapons+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $747
line 1253
;1253:	{
line 1254
;1254:		vec4_t			textColor = { .875f, .718f, .121f, 1.0f };
ADDRLP4 64
ADDRGP4 $751
INDIRB
ASGNB 16
line 1257
;1255:		char	text[1024];
;1256:		
;1257:		if ( trap_SP_GetStringTextString( va("INGAME_%s",cg_weapons[ cg.weaponSelect ].item->classname), text, sizeof( text )))
ADDRGP4 $754
ARGP4
CNSTI4 208
ADDRGP4 cg+3508
INDIRI4
MULI4
ADDRGP4 cg_weapons+4
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1108
ADDRGP4 trap_SP_GetStringTextString
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
EQI4 $752
line 1258
;1258:		{
line 1259
;1259:			UI_DrawProportionalString(320, y+45, text, UI_CENTER|UI_SMALLFONT, textColor);
CNSTI4 320
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 45
ADDI4
ARGI4
ADDRLP4 80
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 64
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1260
;1260:		}
ADDRGP4 $753
JUMPV
LABELV $752
line 1262
;1261:		else
;1262:		{
line 1263
;1263:			UI_DrawProportionalString(320, y+45, cg_weapons[ cg.weaponSelect ].item->classname, UI_CENTER|UI_SMALLFONT, textColor);
CNSTI4 320
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 45
ADDI4
ARGI4
CNSTI4 208
ADDRGP4 cg+3508
INDIRI4
MULI4
ADDRGP4 cg_weapons+4
ADDP4
INDIRP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 64
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1264
;1264:		}
LABELV $753
line 1265
;1265:	}
LABELV $747
line 1267
;1266:
;1267:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1268
;1268:}
LABELV $638
endproc CG_DrawWeaponSelect 1112 20
proc isValidEnt 4 0
line 1270
;1269:
;1270:static qboolean isValidEnt( int number ) {
line 1271
;1271:	if(cg_entities[number].currentState.eType == ET_MISSILE || cg_entities[number].currentState.eType == ET_PLAYER)return qtrue;
ADDRLP4 0
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $764
ADDRLP4 0
INDIRI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $760
LABELV $764
CNSTI4 1
RETI4
ADDRGP4 $759
JUMPV
LABELV $760
line 1272
;1272:	else return qfalse;
CNSTI4 0
RETI4
LABELV $759
endproc isValidEnt 4 0
export CG_NextWeapon_f
proc CG_NextWeapon_f 20 8
line 1280
;1273:}
;1274:
;1275:/*
;1276:===============
;1277:CG_NextWeapon_f
;1278:===============
;1279:*/
;1280:void CG_NextWeapon_f( void ) {
line 1284
;1281:	int		i;
;1282:	int		original;
;1283:
;1284:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $766
line 1285
;1285:		return;
ADDRGP4 $765
JUMPV
LABELV $766
line 1288
;1286:	}
;1287:	
;1288:	if ( cg.demoPlayback ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $769
line 1289
;1289:		int oldidx, firstidx=-1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 1290
;1290:		if(pug_demospec.integer==-1)pug_demospec.integer=cg.snap->ps.clientNum;
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
NEI4 $772
ADDRGP4 pug_demospec+12
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
LABELV $772
line 1291
;1291:		oldidx = pug_demospec.integer;
ADDRLP4 12
ADDRGP4 pug_demospec+12
INDIRI4
ASGNI4
line 1292
;1292:		for( i=MAX_GENTITIES-1; i>=0; i-- )
ADDRLP4 0
CNSTI4 1023
ASGNI4
LABELV $778
line 1293
;1293:		{
line 1296
;1294:	    	//configstring = CG_ConfigString( clientNum + CS_PLAYERS );
;1295:		    if( /*( cg_entities[i].lerpOrigin[0] || cg_entities[i].lerpOrigin[1] || cg_entities[i].lerpOrigin[2] ) && cgs.clientinfo[i].team != TEAM_SPECTATOR*/
;1296:			isValidEnt( i ) ) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 isValidEnt
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $782
line 1297
;1297:				if( i>oldidx )pug_demospec.integer = i;
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $784
ADDRGP4 pug_demospec+12
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $784
line 1298
;1298:				firstidx = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1299
;1299:			}
LABELV $782
line 1300
;1300:	    }
LABELV $779
line 1292
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $778
line 1301
;1301:	    if( pug_demospec.integer == oldidx && firstidx != -1 )pug_demospec.integer = firstidx;
ADDRGP4 pug_demospec+12
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $787
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $787
ADDRGP4 pug_demospec+12
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $787
line 1302
;1302:	    if(pug_demospec.integer==cg.snap->ps.clientNum)pug_demospec.integer=-1;
ADDRGP4 pug_demospec+12
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $765
ADDRGP4 pug_demospec+12
CNSTI4 -1
ASGNI4
line 1303
;1303:	    return;
ADDRGP4 $765
JUMPV
LABELV $769
line 1306
;1304:	}
;1305:	
;1306:	if ( cg.snap->ps.pm_flags & PMF_FOLLOW ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $796
line 1307
;1307:		return;
ADDRGP4 $765
JUMPV
LABELV $796
line 1310
;1308:	}
;1309:
;1310:	if (cg.snap->ps.emplacedIndex)
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $799
line 1311
;1311:	{
line 1312
;1312:		return;
ADDRGP4 $765
JUMPV
LABELV $799
line 1315
;1313:	}
;1314:
;1315:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+13372
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1316
;1316:	original = cg.weaponSelect;
ADDRLP4 4
ADDRGP4 cg+3508
INDIRI4
ASGNI4
line 1318
;1317:
;1318:	for ( i = 0 ; i < 16 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $805
line 1319
;1319:		cg.weaponSelect++;
ADDRLP4 8
ADDRGP4 cg+3508
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1320
;1320:		if ( cg.weaponSelect == 16 ) {
ADDRGP4 cg+3508
INDIRI4
CNSTI4 16
NEI4 $810
line 1321
;1321:			cg.weaponSelect = 0;
ADDRGP4 cg+3508
CNSTI4 0
ASGNI4
line 1322
;1322:		}
LABELV $810
line 1326
;1323:	//	if ( cg.weaponSelect == WP_STUN_BATON ) {
;1324:	//		continue;		// never cycle to gauntlet
;1325:	//	}
;1326:		if ( CG_WeaponSelectable( cg.weaponSelect ) ) {
ADDRGP4 cg+3508
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $814
line 1327
;1327:			break;
ADDRGP4 $807
JUMPV
LABELV $814
line 1329
;1328:		}
;1329:	}
LABELV $806
line 1318
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $805
LABELV $807
line 1330
;1330:	if ( i == 16 ) {
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $817
line 1331
;1331:		cg.weaponSelect = original;
ADDRGP4 cg+3508
ADDRLP4 4
INDIRI4
ASGNI4
line 1332
;1332:	}
ADDRGP4 $818
JUMPV
LABELV $817
line 1334
;1333:	else
;1334:	{
line 1335
;1335:		trap_S_MuteSound(cg.snap->ps.clientNum, CHAN_WEAPON);
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_S_MuteSound
CALLV
pop
line 1336
;1336:	}
LABELV $818
line 1337
;1337:}
LABELV $765
endproc CG_NextWeapon_f 20 8
export CG_PrevWeapon_f
proc CG_PrevWeapon_f 20 8
line 1344
;1338:
;1339:/*
;1340:===============
;1341:CG_PrevWeapon_f
;1342:===============
;1343:*/
;1344:void CG_PrevWeapon_f( void ) {
line 1348
;1345:	int		i;
;1346:	int		original;
;1347:
;1348:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $822
line 1349
;1349:		return;
ADDRGP4 $821
JUMPV
LABELV $822
line 1352
;1350:	}
;1351:	
;1352:	if ( cg.demoPlayback ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $825
line 1354
;1353:		//const char *configstring;
;1354:		int oldidx, lastidx=-1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 1355
;1355:		if(pug_demospec.integer==-1)pug_demospec.integer=cg.snap->ps.clientNum;
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
NEI4 $828
ADDRGP4 pug_demospec+12
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
LABELV $828
line 1356
;1356:		oldidx = pug_demospec.integer;
ADDRLP4 12
ADDRGP4 pug_demospec+12
INDIRI4
ASGNI4
line 1357
;1357:		for( i=0; i<MAX_GENTITIES; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $834
line 1358
;1358:		{
line 1362
;1359:	    	//configstring = CG_ConfigString( clientNum + CS_PLAYERS );
;1360:		    //CG_Printf("%d: %s\n",clientNum,Info_ValueForKey(configstring, "n"));
;1361:		    if( /*( cg_entities[i].lerpOrigin[0] || cg_entities[i].lerpOrigin[1] || cg_entities[i].lerpOrigin[2] ) && cgs.clientinfo[i].team != TEAM_SPECTATOR*/
;1362:			isValidEnt(i) ) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 isValidEnt
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $838
line 1363
;1363:				if( i<oldidx )pug_demospec.integer = i;
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $840
ADDRGP4 pug_demospec+12
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $840
line 1364
;1364:				lastidx = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1365
;1365:			}
LABELV $838
line 1366
;1366:	    }
LABELV $835
line 1357
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $834
line 1367
;1367:	    if( pug_demospec.integer == oldidx && lastidx != -1 )pug_demospec.integer = lastidx;
ADDRGP4 pug_demospec+12
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $843
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $843
ADDRGP4 pug_demospec+12
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $843
line 1368
;1368:	    if(pug_demospec.integer==cg.snap->ps.clientNum)pug_demospec.integer=-1;
ADDRGP4 pug_demospec+12
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $821
ADDRGP4 pug_demospec+12
CNSTI4 -1
ASGNI4
line 1369
;1369:	    return;
ADDRGP4 $821
JUMPV
LABELV $825
line 1372
;1370:	}
;1371:	
;1372:	if ( cg.snap->ps.pm_flags & PMF_FOLLOW ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $852
line 1373
;1373:		return;
ADDRGP4 $821
JUMPV
LABELV $852
line 1376
;1374:	}
;1375:
;1376:	if (cg.snap->ps.emplacedIndex)
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $855
line 1377
;1377:	{
line 1378
;1378:		return;
ADDRGP4 $821
JUMPV
LABELV $855
line 1381
;1379:	}
;1380:
;1381:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+13372
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1382
;1382:	original = cg.weaponSelect;
ADDRLP4 4
ADDRGP4 cg+3508
INDIRI4
ASGNI4
line 1384
;1383:
;1384:	for ( i = 0 ; i < 16 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $861
line 1385
;1385:		cg.weaponSelect--;
ADDRLP4 8
ADDRGP4 cg+3508
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1386
;1386:		if ( cg.weaponSelect == -1 ) {
ADDRGP4 cg+3508
INDIRI4
CNSTI4 -1
NEI4 $866
line 1387
;1387:			cg.weaponSelect = 15;
ADDRGP4 cg+3508
CNSTI4 15
ASGNI4
line 1388
;1388:		}
LABELV $866
line 1392
;1389:	//	if ( cg.weaponSelect == WP_STUN_BATON ) {
;1390:	//		continue;		// never cycle to gauntlet
;1391:	//	}
;1392:		if ( CG_WeaponSelectable( cg.weaponSelect ) ) {
ADDRGP4 cg+3508
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $870
line 1393
;1393:			break;
ADDRGP4 $863
JUMPV
LABELV $870
line 1395
;1394:		}
;1395:	}
LABELV $862
line 1384
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $861
LABELV $863
line 1396
;1396:	if ( i == 16 ) {
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $873
line 1397
;1397:		cg.weaponSelect = original;
ADDRGP4 cg+3508
ADDRLP4 4
INDIRI4
ASGNI4
line 1398
;1398:	}
ADDRGP4 $874
JUMPV
LABELV $873
line 1400
;1399:	else
;1400:	{
line 1401
;1401:		trap_S_MuteSound(cg.snap->ps.clientNum, CHAN_WEAPON);
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_S_MuteSound
CALLV
pop
line 1402
;1402:	}
LABELV $874
line 1403
;1403:}
LABELV $821
endproc CG_PrevWeapon_f 20 8
export CG_Weapon_f
proc CG_Weapon_f 32 8
line 1410
;1404:
;1405:/*
;1406:===============
;1407:CG_Weapon_f
;1408:===============
;1409:*/
;1410:void CG_Weapon_f( void ) {
line 1413
;1411:	int		num;
;1412:
;1413:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $878
line 1414
;1414:		return;
ADDRGP4 $877
JUMPV
LABELV $878
line 1416
;1415:	}
;1416:	if ( cg.snap->ps.pm_flags & PMF_FOLLOW ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $881
line 1417
;1417:		return;
ADDRGP4 $877
JUMPV
LABELV $881
line 1420
;1418:	}
;1419:
;1420:	if (cg.snap->ps.emplacedIndex)
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $884
line 1421
;1421:	{
line 1422
;1422:		return;
ADDRGP4 $877
JUMPV
LABELV $884
line 1425
;1423:	}
;1424:
;1425:	num = atoi( CG_Argv( 1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1427
;1426:
;1427:	if ( num < 1 || num > 15 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $889
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $887
LABELV $889
line 1428
;1428:		return;
ADDRGP4 $877
JUMPV
LABELV $887
line 1431
;1429:	}
;1430:
;1431:	if (num == 1 && cg.snap->ps.weapon == WP_SABER)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $890
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
NEI4 $890
line 1432
;1432:	{
line 1433
;1433:		if (cg.snap->ps.weaponTime < 1)
ADDRGP4 cg+36
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
GEI4 $877
line 1434
;1434:		{
line 1436
;1435:			//trap_SendClientCommand("sv_saberswitch");
;1436:			trap_SendConsoleCommand("sv_saberswitch");
ADDRGP4 $896
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1437
;1437:		}
line 1438
;1438:		return;
ADDRGP4 $877
JUMPV
LABELV $890
line 1442
;1439:	}
;1440:
;1441:	//rww - hack to make weapon numbers same as single player
;1442:	if (num > WP_STUN_BATON)
ADDRLP4 0
INDIRI4
CNSTI4 1
LEI4 $897
line 1443
;1443:	{
line 1444
;1444:		num++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1445
;1445:	}
ADDRGP4 $898
JUMPV
LABELV $897
line 1447
;1446:	else
;1447:	{
line 1448
;1448:		if (cg.snap->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $899
line 1449
;1449:		{
line 1450
;1450:			num = WP_SABER;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1451
;1451:		}
ADDRGP4 $900
JUMPV
LABELV $899
line 1453
;1452:		else
;1453:		{
line 1454
;1454:			num = WP_STUN_BATON;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1455
;1455:		}
LABELV $900
line 1456
;1456:	}
LABELV $898
line 1458
;1457:
;1458:	if (num > WP_DET_PACK+1)
ADDRLP4 0
INDIRI4
CNSTI4 14
LEI4 $902
line 1459
;1459:	{ //other weapons are off limits due to not actually being weapon weapons
line 1460
;1460:		return;
ADDRGP4 $877
JUMPV
LABELV $902
line 1463
;1461:	}
;1462:
;1463:	if (num >= WP_THERMAL)
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $904
line 1464
;1464:	{
line 1465
;1465:		int weap, i = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1467
;1466:
;1467:		if (cg.snap->ps.weapon >= WP_THERMAL &&
ADDRLP4 24
CNSTI4 192
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 11
LTI4 $906
ADDRGP4 cg+36
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 13
GTI4 $906
line 1469
;1468:			cg.snap->ps.weapon <= WP_DET_PACK)
;1469:		{
line 1471
;1470:			// already in cycle range so start with next cycle item
;1471:			weap = cg.snap->ps.weapon + 1;
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1472
;1472:		}
ADDRGP4 $912
JUMPV
LABELV $906
line 1474
;1473:		else
;1474:		{
line 1476
;1475:			// not in cycle range, so start with thermal detonator
;1476:			weap = WP_THERMAL;
ADDRLP4 16
CNSTI4 11
ASGNI4
line 1477
;1477:		}
ADDRGP4 $912
JUMPV
LABELV $911
line 1481
;1478:
;1479:		// prevent an endless loop
;1480:		while ( i <= 4 )
;1481:		{
line 1482
;1482:			if (weap > WP_DET_PACK)
ADDRLP4 16
INDIRI4
CNSTI4 13
LEI4 $914
line 1483
;1483:			{
line 1484
;1484:				weap = WP_THERMAL;
ADDRLP4 16
CNSTI4 11
ASGNI4
line 1485
;1485:			}
LABELV $914
line 1487
;1486:
;1487:			if (CG_WeaponSelectable(weap))
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $916
line 1488
;1488:			{
line 1489
;1489:				num = weap;
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 1490
;1490:				break;
ADDRGP4 $913
JUMPV
LABELV $916
line 1493
;1491:			}
;1492:
;1493:			weap++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1494
;1494:			i++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1495
;1495:		}
LABELV $912
line 1480
ADDRLP4 20
INDIRI4
CNSTI4 4
LEI4 $911
LABELV $913
line 1496
;1496:	}
LABELV $904
line 1498
;1497:
;1498:	if (!CG_WeaponSelectable(num))
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $918
line 1499
;1499:	{
line 1500
;1500:		return;
ADDRGP4 $877
JUMPV
LABELV $918
line 1503
;1501:	}
;1502:
;1503:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+13372
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1505
;1504:
;1505:	if ( ! ( cg.snap->ps.stats[STAT_WEAPONS] & ( 1 << num ) ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $922
line 1506
;1506:	{
line 1507
;1507:		if (num == WP_SABER)
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $877
line 1508
;1508:		{ //don't have saber, try the stun baton on the same slot
line 1509
;1509:			num = WP_STUN_BATON;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1511
;1510:
;1511:			if ( ! ( cg.snap->ps.stats[STAT_WEAPONS] & ( 1 << num ) ) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $926
line 1512
;1512:			{
line 1513
;1513:				return;
ADDRGP4 $877
JUMPV
line 1515
;1514:			}
;1515:		}
line 1517
;1516:		else
;1517:		{
line 1518
;1518:			return;		// don't have the weapon
LABELV $926
line 1520
;1519:		}
;1520:	}
LABELV $922
line 1522
;1521:
;1522:	if (cg.weaponSelect != num)
ADDRGP4 cg+3508
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $930
line 1523
;1523:	{
line 1524
;1524:		trap_S_MuteSound(cg.snap->ps.clientNum, CHAN_WEAPON);
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_S_MuteSound
CALLV
pop
line 1525
;1525:	}
LABELV $930
line 1527
;1526:
;1527:	cg.weaponSelect = num;
ADDRGP4 cg+3508
ADDRLP4 0
INDIRI4
ASGNI4
line 1528
;1528:}
LABELV $877
endproc CG_Weapon_f 32 8
export CG_OutOfAmmoChange
proc CG_OutOfAmmoChange 12 8
line 1538
;1529:
;1530:/*
;1531:===================
;1532:CG_OutOfAmmoChange
;1533:
;1534:The current weapon has just run out of ammo
;1535:===================
;1536:*/
;1537:void CG_OutOfAmmoChange( int oldWeapon )
;1538:{
line 1541
;1539:	int		i;
;1540:
;1541:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+13372
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1543
;1542:
;1543:	for ( i = WP_DET_PACK ; i > 0 ; i-- )	//We don't want the emplaced or turret
ADDRLP4 0
CNSTI4 13
ASGNI4
LABELV $938
line 1544
;1544:	{
line 1545
;1545:		if ( CG_WeaponSelectable( i ) )
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $942
line 1546
;1546:		{
line 1552
;1547:			/*
;1548:			if ( 1 == cg_autoswitch.integer && 
;1549:				( i == WP_TRIP_MINE || i == WP_DET_PACK || i == WP_THERMAL || i == WP_ROCKET_LAUNCHER) ) // safe weapon switch
;1550:			*/
;1551:			//rww - Don't we want to make sure i != one of these if autoswitch is 1 (safe)?
;1552:			if (cg_autoswitch.integer != 1 || (i != WP_TRIP_MINE && i != WP_DET_PACK && i != WP_THERMAL && i != WP_ROCKET_LAUNCHER))
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 1
NEI4 $947
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $944
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $944
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $944
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $944
LABELV $947
line 1553
;1553:			{
line 1554
;1554:				if (i != oldWeapon)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $948
line 1555
;1555:				{ //don't even do anything if we're just selecting the weapon we already have/had
line 1556
;1556:					cg.weaponSelect = i;
ADDRGP4 cg+3508
ADDRLP4 0
INDIRI4
ASGNI4
line 1557
;1557:					break;
ADDRGP4 $940
JUMPV
LABELV $948
line 1559
;1558:				}
;1559:			}
LABELV $944
line 1560
;1560:		}
LABELV $942
line 1561
;1561:	}
LABELV $939
line 1543
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $938
LABELV $940
line 1563
;1562:
;1563:	trap_S_MuteSound(cg.snap->ps.clientNum, CHAN_WEAPON);
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_S_MuteSound
CALLV
pop
line 1564
;1564:}
LABELV $935
endproc CG_OutOfAmmoChange 12 8
export CG_FireATST
proc CG_FireATST 8 16
line 1577
;1565:
;1566:
;1567:
;1568:/*
;1569:===================================================================================================
;1570:
;1571:WEAPON EVENTS
;1572:
;1573:===================================================================================================
;1574:*/
;1575:
;1576:void CG_FireATST(centity_t *cent, qboolean altFire)
;1577:{
line 1609
;1578://No muzzle flash for now?
;1579:#if 0
;1580:	int getMeBolt = 0;
;1581:	mdxaBone_t boltMatrix;
;1582:	vec3_t flashorigin, flashdir;
;1583:
;1584:	if (!cgs.clientinfo[cent->currentState.number].bolt_lhand)
;1585:	{
;1586:		return;
;1587:	}
;1588:
;1589:	if (altFire)
;1590:	{
;1591:		getMeBolt = cgs.clientinfo[cent->currentState.number].bolt_lhand;
;1592:	}
;1593:	else
;1594:	{
;1595:		getMeBolt = cgs.clientinfo[cent->currentState.number].bolt_rhand;
;1596:	}
;1597:
;1598: 	if (!(trap_G2API_GetBoltMatrix(cent->ghoul2, 0, getMeBolt, &boltMatrix, cent->lerpAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale)))
;1599:	{
;1600:		return;
;1601:	}
;1602:			
;1603:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, flashorigin);
;1604:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, POSITIVE_X, flashdir);
;1605:
;1606:	trap_FX_PlayEffectID(trap_FX_RegisterEffect("turret/muzzle_flash.efx"), flashorigin, flashdir);
;1607:#endif
;1608:
;1609:	trap_S_StartSound(NULL, cent->currentState.number, CHAN_WEAPON, trap_S_RegisterSound(va("sound/weapons/atst/ATSTfire1.wav"/*, Q_irand(1,4)*/)));
ADDRGP4 $953
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1610
;1610:}
LABELV $952
endproc CG_FireATST 8 16
export CG_GetClientWeaponMuzzleBoltPoint
proc CG_GetClientWeaponMuzzleBoltPoint 80 36
line 1613
;1611:
;1612:void CG_GetClientWeaponMuzzleBoltPoint(int clIndex, vec3_t to)
;1613:{
line 1617
;1614:	centity_t *cent;
;1615:	mdxaBone_t	boltMatrix;
;1616:
;1617:	if (clIndex < 0 || clIndex >= MAX_CLIENTS)
ADDRLP4 52
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $957
ADDRLP4 52
INDIRI4
CNSTI4 32
LTI4 $955
LABELV $957
line 1618
;1618:	{
line 1619
;1619:		return;
ADDRGP4 $954
JUMPV
LABELV $955
line 1622
;1620:	}
;1621:
;1622:	cent = &cg_entities[clIndex];
ADDRLP4 0
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1624
;1623:
;1624:	if (!cent || !cent->ghoul2 || !trap_G2_HaveWeGhoul2Models(cent->ghoul2) ||
ADDRLP4 60
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $962
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $962
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $962
ADDRLP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 72
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $958
LABELV $962
line 1626
;1625:		!trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1))
;1626:	{
line 1627
;1627:		return;
ADDRGP4 $954
JUMPV
LABELV $958
line 1630
;1628:	}
;1629:
;1630:	trap_G2API_GetBoltMatrix(cent->ghoul2, 1, 0, &boltMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 1631
;1631:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, to);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 1632
;1632:}
LABELV $954
endproc CG_GetClientWeaponMuzzleBoltPoint 80 36
export CG_FireWeapon
proc CG_FireWeapon 20 16
line 1641
;1633:
;1634:/*
;1635:================
;1636:CG_FireWeapon
;1637:
;1638:Caused by an EV_FIRE_WEAPON event
;1639:================
;1640:*/
;1641:void CG_FireWeapon( centity_t *cent, qboolean altFire ) {
line 1646
;1642:	entityState_t *ent;
;1643:	int				c;
;1644:	weaponInfo_t	*weap;
;1645:
;1646:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $966
line 1647
;1647:	{
line 1648
;1648:		CG_FireATST(cent, altFire);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_FireATST
CALLV
pop
line 1649
;1649:		return;
ADDRGP4 $965
JUMPV
LABELV $966
line 1652
;1650:	}
;1651:
;1652:	ent = &cent->currentState;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 1653
;1653:	if ( ent->weapon == WP_NONE ) {
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $968
line 1654
;1654:		return;
ADDRGP4 $965
JUMPV
LABELV $968
line 1656
;1655:	}
;1656:	if ( ent->weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 16
LTI4 $970
line 1657
;1657:		CG_Error( "CG_FireWeapon: ent->weapon >= WP_NUM_WEAPONS" );
ADDRGP4 $972
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1658
;1658:		return;
ADDRGP4 $965
JUMPV
LABELV $970
line 1660
;1659:	}
;1660:	weap = &cg_weapons[ ent->weapon ];
ADDRLP4 4
CNSTI4 208
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1664
;1661:
;1662:	// mark the entity as muzzle flashing, so when it is added it will
;1663:	// append the flash to the weapon model
;1664:	cent->muzzleFlashTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1666
;1665:
;1666:	if (cg.predictedPlayerState.clientNum == cent->currentState.number)
ADDRGP4 cg+96+144
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $974
line 1667
;1667:	{
line 1668
;1668:		if ((ent->weapon == WP_BRYAR_PISTOL && altFire) ||
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 3
NEI4 $981
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $982
LABELV $981
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 6
NEI4 $983
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $982
LABELV $983
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 8
NEI4 $978
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $978
LABELV $982
line 1671
;1669:			(ent->weapon == WP_BOWCASTER && !altFire) ||
;1670:			(ent->weapon == WP_DEMP2 && altFire))
;1671:		{
line 1672
;1672:			float val = ( cg.time - cent->currentState.constantLight ) * 0.001f;
ADDRLP4 12
CNSTF4 981668463
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1674
;1673:
;1674:			if (val > 3)
ADDRLP4 12
INDIRF4
CNSTF4 1077936128
LEF4 $985
line 1675
;1675:			{
line 1676
;1676:				val = 3;
ADDRLP4 12
CNSTF4 1077936128
ASGNF4
line 1677
;1677:			}
LABELV $985
line 1678
;1678:			if (val < 0.2)
ADDRLP4 12
INDIRF4
CNSTF4 1045220557
GEF4 $987
line 1679
;1679:			{
line 1680
;1680:				val = 0.2;
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
line 1681
;1681:			}
LABELV $987
line 1683
;1682:
;1683:			val *= 2;
ADDRLP4 12
CNSTF4 1073741824
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 1685
;1684:
;1685:			CGCam_Shake( val, 250 );
ADDRLP4 12
INDIRF4
ARGF4
CNSTI4 250
ARGI4
ADDRGP4 CGCam_Shake
CALLV
pop
line 1686
;1686:		}
ADDRGP4 $979
JUMPV
LABELV $978
line 1687
;1687:		else if (ent->weapon == WP_ROCKET_LAUNCHER ||
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $992
ADDRLP4 12
INDIRI4
CNSTI4 7
NEI4 $993
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $992
LABELV $993
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
NEI4 $989
LABELV $992
line 1690
;1688:			(ent->weapon == WP_REPEATER && altFire) ||
;1689:			ent->weapon == WP_FLECHETTE)
;1690:		{
line 1691
;1691:			if (ent->weapon == WP_ROCKET_LAUNCHER)
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 10
NEI4 $994
line 1692
;1692:			{
line 1693
;1693:				CGCam_Shake(Q_irand(2, 3), 350);
CNSTI4 2
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 16
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
CNSTI4 350
ARGI4
ADDRGP4 CGCam_Shake
CALLV
pop
line 1694
;1694:			}
ADDRGP4 $995
JUMPV
LABELV $994
line 1695
;1695:			else if (ent->weapon == WP_REPEATER)
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 7
NEI4 $996
line 1696
;1696:			{
line 1697
;1697:				CGCam_Shake(Q_irand(2, 3), 350);
CNSTI4 2
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 16
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
CNSTI4 350
ARGI4
ADDRGP4 CGCam_Shake
CALLV
pop
line 1698
;1698:			}
ADDRGP4 $997
JUMPV
LABELV $996
line 1699
;1699:			else if (ent->weapon == WP_FLECHETTE)
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
NEI4 $998
line 1700
;1700:			{
line 1701
;1701:				if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1000
line 1702
;1702:				{
line 1703
;1703:					CGCam_Shake(Q_irand(2, 3), 350);
CNSTI4 2
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 16
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
CNSTI4 350
ARGI4
ADDRGP4 CGCam_Shake
CALLV
pop
line 1704
;1704:				}
ADDRGP4 $1001
JUMPV
LABELV $1000
line 1706
;1705:				else
;1706:				{
line 1707
;1707:					CGCam_Shake(1.5, 250);
CNSTF4 1069547520
ARGF4
CNSTI4 250
ARGI4
ADDRGP4 CGCam_Shake
CALLV
pop
line 1708
;1708:				}
LABELV $1001
line 1709
;1709:			}
LABELV $998
LABELV $997
LABELV $995
line 1710
;1710:		}
LABELV $989
LABELV $979
line 1711
;1711:	}
LABELV $974
line 1713
;1712:	// lightning gun only does this this on initial press
;1713:	if ( ent->weapon == WP_DEMP2 ) {
ADDRLP4 8
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1002
line 1714
;1714:		if ( cent->pe.lightningFiring ) {
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1004
line 1715
;1715:			return;
ADDRGP4 $965
JUMPV
LABELV $1004
line 1717
;1716:		}
;1717:	}
LABELV $1002
line 1720
;1718:
;1719:	// play quad sound if needed
;1720:	if ( cent->currentState.powerups & ( 1 << PW_QUAD ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1006
line 1722
;1721:		//trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.media.quadSound );
;1722:	}
LABELV $1006
line 1726
;1723:
;1724:
;1725:	// play a sound
;1726:	if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1008
line 1727
;1727:	{
line 1729
;1728:		// play a sound
;1729:		for ( c = 0 ; c < 4 ; c++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1010
line 1730
;1730:			if ( !weap->altFlashSound[c] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1014
line 1731
;1731:				break;
ADDRGP4 $1012
JUMPV
LABELV $1014
line 1733
;1732:			}
;1733:		}
LABELV $1011
line 1729
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $1010
LABELV $1012
line 1734
;1734:		if ( c > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $1009
line 1735
;1735:			c = rand() % c;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 1736
;1736:			if ( weap->altFlashSound[c] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1009
line 1737
;1737:			{
line 1738
;1738:				trap_S_StartSound( NULL, ent->number, CHAN_WEAPON, weap->altFlashSound[c] );
CNSTP4 0
ARGP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1739
;1739:			}
line 1740
;1740:		}
line 1745
;1741://		if ( weap->altFlashSnd )
;1742://		{
;1743://			trap_S_StartSound( NULL, ent->number, CHAN_WEAPON, weap->altFlashSnd );
;1744://		}
;1745:	}
ADDRGP4 $1009
JUMPV
LABELV $1008
line 1747
;1746:	else
;1747:	{
line 1749
;1748:		// play a sound
;1749:		for ( c = 0 ; c < 4 ; c++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1020
line 1750
;1750:			if ( !weap->flashSound[c] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1024
line 1751
;1751:				break;
ADDRGP4 $1022
JUMPV
LABELV $1024
line 1753
;1752:			}
;1753:		}
LABELV $1021
line 1749
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $1020
LABELV $1022
line 1754
;1754:		if ( c > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $1026
line 1755
;1755:			c = rand() % c;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 1756
;1756:			if ( weap->flashSound[c] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1028
line 1757
;1757:			{
line 1758
;1758:				trap_S_StartSound( NULL, ent->number, CHAN_WEAPON, weap->flashSound[c] );
CNSTP4 0
ARGP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1759
;1759:			}
LABELV $1028
line 1760
;1760:		}
LABELV $1026
line 1761
;1761:	}
LABELV $1009
line 1762
;1762:}
LABELV $965
endproc CG_FireWeapon 20 16
lit
align 4
LABELV $1031
byte 4 0
byte 4 0
byte 4 1065353216
export CG_MissileHitWall
code
proc CG_MissileHitWall 24 12
line 1773
;1763:
;1764:
;1765:/*
;1766:=================
;1767:CG_MissileHitWall
;1768:
;1769:Caused by an EV_MISSILE_MISS event, or directly by local bullet tracing
;1770:=================
;1771:*/
;1772:void CG_MissileHitWall(int weapon, int clientNum, vec3_t origin, vec3_t dir, impactSound_t soundType, qboolean altFire, int charge) 
;1773:{
line 1775
;1774:	int parm;
;1775:	vec3_t up={0,0,1};
ADDRLP4 0
ADDRGP4 $1031
INDIRB
ASGNB 12
line 1777
;1776:
;1777:	switch( weapon )
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 3
LTI4 $1032
ADDRLP4 16
INDIRI4
CNSTI4 15
GTI4 $1032
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1058-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1058
address $1034
address $1038
address $1039
address $1040
address $1041
address $1044
address $1048
address $1051
address $1052
address $1032
address $1032
address $1057
address $1037
code
line 1778
;1778:	{
LABELV $1034
line 1780
;1779:	case WP_BRYAR_PISTOL:
;1780:		if ( altFire )
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $1035
line 1781
;1781:		{
line 1782
;1782:			parm = charge;
ADDRLP4 12
ADDRFP4 24
INDIRI4
ASGNI4
line 1783
;1783:			FX_BryarAltHitWall( origin, dir, parm );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 FX_BryarAltHitWall
CALLV
pop
line 1784
;1784:		}
ADDRGP4 $1033
JUMPV
LABELV $1035
line 1786
;1785:		else
;1786:		{
line 1787
;1787:			FX_BryarHitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_BryarHitWall
CALLV
pop
line 1788
;1788:		}
line 1789
;1789:		break;
ADDRGP4 $1033
JUMPV
LABELV $1037
line 1792
;1790:
;1791:	case WP_TURRET:
;1792:		FX_TurretHitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_TurretHitWall
CALLV
pop
line 1793
;1793:		break;
ADDRGP4 $1033
JUMPV
LABELV $1038
line 1796
;1794:
;1795:	case WP_BLASTER:
;1796:		FX_BlasterWeaponHitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_BlasterWeaponHitWall
CALLV
pop
line 1797
;1797:		break;
ADDRGP4 $1033
JUMPV
LABELV $1039
line 1800
;1798:
;1799:	case WP_DISRUPTOR:
;1800:		FX_DisruptorAltMiss( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_DisruptorAltMiss
CALLV
pop
line 1801
;1801:		break;
ADDRGP4 $1033
JUMPV
LABELV $1040
line 1804
;1802:
;1803:	case WP_BOWCASTER:
;1804:		FX_BowcasterHitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_BowcasterHitWall
CALLV
pop
line 1805
;1805:		break;
ADDRGP4 $1033
JUMPV
LABELV $1041
line 1808
;1806:
;1807:	case WP_REPEATER:
;1808:		if ( altFire )
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $1042
line 1809
;1809:		{
line 1810
;1810:			FX_RepeaterAltHitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_RepeaterAltHitWall
CALLV
pop
line 1811
;1811:		}
ADDRGP4 $1033
JUMPV
LABELV $1042
line 1813
;1812:		else
;1813:		{
line 1814
;1814:			FX_RepeaterHitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_RepeaterHitWall
CALLV
pop
line 1815
;1815:		}
line 1816
;1816:		break;
ADDRGP4 $1033
JUMPV
LABELV $1044
line 1819
;1817:
;1818:	case WP_DEMP2:
;1819:		if (altFire)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $1045
line 1820
;1820:		{
line 1821
;1821:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("demp2/altDetonate.efx"), origin, dir);
ADDRGP4 $1047
ARGP4
ADDRLP4 20
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1822
;1822:		}
ADDRGP4 $1033
JUMPV
LABELV $1045
line 1824
;1823:		else
;1824:		{
line 1825
;1825:			FX_DEMP2_HitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_DEMP2_HitWall
CALLV
pop
line 1826
;1826:		}
line 1827
;1827:		break;
ADDRGP4 $1033
JUMPV
LABELV $1048
line 1836
;1828:
;1829:	case WP_FLECHETTE:
;1830:		/*if (altFire)
;1831:		{
;1832:			CG_SurfaceExplosion(origin, dir, 20.0f, 12.0f, qtrue);
;1833:		}
;1834:		else
;1835:		*/
;1836:		if (!altFire)
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $1033
line 1837
;1837:		{
line 1838
;1838:			FX_FlechetteWeaponHitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_FlechetteWeaponHitWall
CALLV
pop
line 1839
;1839:		}
line 1840
;1840:		break;
ADDRGP4 $1033
JUMPV
LABELV $1051
line 1843
;1841:
;1842:	case WP_ROCKET_LAUNCHER:
;1843:		FX_RocketHitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_RocketHitWall
CALLV
pop
line 1844
;1844:		break;
ADDRGP4 $1033
JUMPV
LABELV $1052
line 1847
;1845:
;1846:	case WP_THERMAL:
;1847:		trap_FX_PlayEffectID( cgs.effects.thermalExplosionEffect, origin, dir );
ADDRGP4 cgs+71564+132
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1848
;1848:		trap_FX_PlayEffectID( cgs.effects.thermalShockwaveEffect, origin, up );
ADDRGP4 cgs+71564+136
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1849
;1849:		break;
ADDRGP4 $1033
JUMPV
LABELV $1057
line 1852
;1850:
;1851:	case WP_EMPLACED_GUN:
;1852:		FX_BlasterWeaponHitWall( origin, dir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 FX_BlasterWeaponHitWall
CALLV
pop
line 1854
;1853:		//FIXME: Give it its own hit wall effect
;1854:		break;
LABELV $1032
LABELV $1033
line 1856
;1855:	}
;1856:}
LABELV $1030
endproc CG_MissileHitWall 24 12
lit
align 4
LABELV $1061
byte 4 0
byte 4 0
byte 4 1065353216
export CG_MissileHitPlayer
code
proc CG_MissileHitPlayer 24 12
line 1865
;1857:
;1858:
;1859:/*
;1860:=================
;1861:CG_MissileHitPlayer
;1862:=================
;1863:*/
;1864:void CG_MissileHitPlayer(int weapon, vec3_t origin, vec3_t dir, int entityNum, qboolean altFire) 
;1865:{
line 1866
;1866:	qboolean	humanoid = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1867
;1867:	vec3_t up={0,0,1};
ADDRLP4 4
ADDRGP4 $1061
INDIRB
ASGNB 12
line 1887
;1868:
;1869:	/*
;1870:	// NOTENOTE Non-portable code from single player
;1871:	if ( cent->gent )
;1872:	{
;1873:		other = &g_entities[cent->gent->s.otherEntityNum];
;1874:
;1875:		if ( other->client && other->client->playerTeam == TEAM_BOTS )
;1876:		{
;1877:			humanoid = qfalse;
;1878:		}
;1879:	}
;1880:	*/	
;1881:
;1882:	// NOTENOTE No bleeding in this game
;1883://	CG_Bleed( origin, entityNum );
;1884:
;1885:	// some weapons will make an explosion with the blood, while
;1886:	// others will just make the blood
;1887:	switch ( weapon ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 3
LTI4 $1063
ADDRLP4 16
INDIRI4
CNSTI4 15
GTI4 $1063
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1085-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1085
address $1064
address $1068
address $1069
address $1070
address $1071
address $1074
address $1077
address $1078
address $1079
address $1063
address $1063
address $1084
address $1067
code
LABELV $1064
line 1889
;1888:	case WP_BRYAR_PISTOL:
;1889:		if ( altFire )
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1065
line 1890
;1890:		{
line 1891
;1891:			FX_BryarAltHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_BryarAltHitPlayer
CALLV
pop
line 1892
;1892:		}
ADDRGP4 $1063
JUMPV
LABELV $1065
line 1894
;1893:		else
;1894:		{
line 1895
;1895:			FX_BryarHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_BryarHitPlayer
CALLV
pop
line 1896
;1896:		}
line 1897
;1897:		break;
ADDRGP4 $1063
JUMPV
LABELV $1067
line 1900
;1898:
;1899:	case WP_TURRET:
;1900:		FX_TurretHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_TurretHitPlayer
CALLV
pop
line 1901
;1901:		break;
ADDRGP4 $1063
JUMPV
LABELV $1068
line 1904
;1902:
;1903:	case WP_BLASTER:
;1904:		FX_BlasterWeaponHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_BlasterWeaponHitPlayer
CALLV
pop
line 1905
;1905:		break;
ADDRGP4 $1063
JUMPV
LABELV $1069
line 1908
;1906:
;1907:	case WP_DISRUPTOR:
;1908:		FX_DisruptorAltHit( origin, dir);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 FX_DisruptorAltHit
CALLV
pop
line 1909
;1909:		break;
ADDRGP4 $1063
JUMPV
LABELV $1070
line 1912
;1910:
;1911:	case WP_BOWCASTER:
;1912:		FX_BowcasterHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_BowcasterHitPlayer
CALLV
pop
line 1913
;1913:		break;
ADDRGP4 $1063
JUMPV
LABELV $1071
line 1916
;1914:
;1915:	case WP_REPEATER:
;1916:		if ( altFire )
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1072
line 1917
;1917:		{
line 1918
;1918:			FX_RepeaterAltHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_RepeaterAltHitPlayer
CALLV
pop
line 1919
;1919:		}
ADDRGP4 $1063
JUMPV
LABELV $1072
line 1921
;1920:		else
;1921:		{
line 1922
;1922:			FX_RepeaterHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_RepeaterHitPlayer
CALLV
pop
line 1923
;1923:		}
line 1924
;1924:		break;
ADDRGP4 $1063
JUMPV
LABELV $1074
line 1936
;1925:
;1926:	case WP_DEMP2:
;1927:		// Do a full body effect here for some more feedback
;1928:		// NOTENOTE The chaining of the demp2 is not yet implemented.
;1929:		/*
;1930:		if ( other )
;1931:		{
;1932:			other->s.powerups |= ( 1 << PW_DISINT_1 );
;1933:			other->client->ps.powerups[PW_DISINT_1] = cg.time + 650;
;1934:		}
;1935:		*/
;1936:		if (altFire)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1075
line 1937
;1937:		{
line 1938
;1938:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("demp2/altDetonate.efx"), origin, dir);
ADDRGP4 $1047
ARGP4
ADDRLP4 20
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1939
;1939:		}
ADDRGP4 $1063
JUMPV
LABELV $1075
line 1941
;1940:		else
;1941:		{
line 1942
;1942:			FX_DEMP2_HitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_DEMP2_HitPlayer
CALLV
pop
line 1943
;1943:		}
line 1944
;1944:		break;
ADDRGP4 $1063
JUMPV
LABELV $1077
line 1947
;1945:
;1946:	case WP_FLECHETTE:
;1947:		FX_FlechetteWeaponHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_FlechetteWeaponHitPlayer
CALLV
pop
line 1948
;1948:		break;
ADDRGP4 $1063
JUMPV
LABELV $1078
line 1951
;1949:
;1950:	case WP_ROCKET_LAUNCHER:
;1951:		FX_RocketHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_RocketHitPlayer
CALLV
pop
line 1952
;1952:		break;
ADDRGP4 $1063
JUMPV
LABELV $1079
line 1955
;1953:
;1954:	case WP_THERMAL:
;1955:		trap_FX_PlayEffectID( cgs.effects.thermalExplosionEffect, origin, dir );
ADDRGP4 cgs+71564+132
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1956
;1956:		trap_FX_PlayEffectID( cgs.effects.thermalShockwaveEffect, origin, up );
ADDRGP4 cgs+71564+136
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1957
;1957:		break;
ADDRGP4 $1063
JUMPV
LABELV $1084
line 1960
;1958:	case WP_EMPLACED_GUN:
;1959:		//FIXME: Its own effect?
;1960:		FX_BlasterWeaponHitPlayer( origin, dir, humanoid );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 FX_BlasterWeaponHitPlayer
CALLV
pop
line 1961
;1961:		break;
line 1964
;1962:
;1963:	default:
;1964:		break;
LABELV $1063
line 1966
;1965:	}
;1966:}
LABELV $1060
endproc CG_MissileHitPlayer 24 12
export CG_Tracer
proc CG_Tracer 224 12
line 1983
;1967:
;1968:
;1969:/*
;1970:============================================================================
;1971:
;1972:BULLETS
;1973:
;1974:============================================================================
;1975:*/
;1976:
;1977:
;1978:/*
;1979:===============
;1980:CG_Tracer
;1981:===============
;1982:*/
;1983:void CG_Tracer( vec3_t source, vec3_t dest ) {
line 1992
;1984:	vec3_t		forward, right;
;1985:	polyVert_t	verts[4];
;1986:	vec3_t		line;
;1987:	float		len, begin, end;
;1988:	vec3_t		start, finish;
;1989:	vec3_t		midpoint;
;1990:
;1991:	// tracer
;1992:	VectorSubtract( dest, source, forward );
ADDRLP4 180
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
ADDRLP4 180
INDIRP4
INDIRF4
ADDRLP4 184
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 188
CNSTI4 4
ASGNI4
ADDRLP4 108+4
ADDRLP4 180
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRF4
ADDRLP4 184
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 192
CNSTI4 8
ASGNI4
ADDRLP4 108+8
ADDRFP4 4
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1993
;1993:	len = VectorNormalize( forward );
ADDRLP4 108
ARGP4
ADDRLP4 196
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 164
ADDRLP4 196
INDIRF4
ASGNF4
line 1996
;1994:
;1995:	// start at least a little ways from the muzzle
;1996:	if ( len < 100 ) {
ADDRLP4 164
INDIRF4
CNSTF4 1120403456
GEF4 $1090
line 1997
;1997:		return;
ADDRGP4 $1087
JUMPV
LABELV $1090
line 1999
;1998:	}
;1999:	begin = 50 + random() * (len - 60);
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 160
ADDRLP4 200
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 164
INDIRF4
CNSTF4 1114636288
SUBF4
MULF4
CNSTF4 1112014848
ADDF4
ASGNF4
line 2000
;2000:	end = begin + cg_tracerLength.value;
ADDRLP4 156
ADDRLP4 160
INDIRF4
ADDRGP4 cg_tracerLength+8
INDIRF4
ADDF4
ASGNF4
line 2001
;2001:	if ( end > len ) {
ADDRLP4 156
INDIRF4
ADDRLP4 164
INDIRF4
LEF4 $1093
line 2002
;2002:		end = len;
ADDRLP4 156
ADDRLP4 164
INDIRF4
ASGNF4
line 2003
;2003:	}
LABELV $1093
line 2004
;2004:	VectorMA( source, begin, forward, start );
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 204
INDIRP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 204
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 108+4
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 120+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 108+8
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ADDF4
ASGNF4
line 2005
;2005:	VectorMA( source, end, forward, finish );
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
ADDRLP4 212
INDIRP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 132+4
ADDRLP4 212
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 108+4
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 132+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 108+8
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDF4
ASGNF4
line 2007
;2006:
;2007:	line[0] = DotProduct( forward, cg.refdef.viewaxis[1] );
ADDRLP4 144
ADDRLP4 108
INDIRF4
ADDRGP4 cg+3616+36+12
INDIRF4
MULF4
ADDRLP4 108+4
INDIRF4
ADDRGP4 cg+3616+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 108+8
INDIRF4
ADDRGP4 cg+3616+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2008
;2008:	line[1] = DotProduct( forward, cg.refdef.viewaxis[2] );
ADDRLP4 144+4
ADDRLP4 108
INDIRF4
ADDRGP4 cg+3616+36+24
INDIRF4
MULF4
ADDRLP4 108+4
INDIRF4
ADDRGP4 cg+3616+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 108+8
INDIRF4
ADDRGP4 cg+3616+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2010
;2009:
;2010:	VectorScale( cg.refdef.viewaxis[1], line[1], right );
ADDRLP4 96
ADDRGP4 cg+3616+36+12
INDIRF4
ADDRLP4 144+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 96+4
ADDRGP4 cg+3616+36+12+4
INDIRF4
ADDRLP4 144+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 96+8
ADDRGP4 cg+3616+36+12+8
INDIRF4
ADDRLP4 144+4
INDIRF4
MULF4
ASGNF4
line 2011
;2011:	VectorMA( right, -line[0], cg.refdef.viewaxis[2], right );
ADDRLP4 220
ADDRLP4 144
INDIRF4
NEGF4
ASGNF4
ADDRLP4 96
ADDRLP4 96
INDIRF4
ADDRGP4 cg+3616+36+24
INDIRF4
ADDRLP4 220
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg+3616+36+24+4
INDIRF4
ADDRLP4 220
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+8
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg+3616+36+24+8
INDIRF4
ADDRLP4 144
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 2012
;2012:	VectorNormalize( right );
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2014
;2013:
;2014:	VectorMA( finish, cg_tracerWidth.value, right, verts[0].xyz );
ADDRLP4 0
ADDRLP4 132
INDIRF4
ADDRLP4 96
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 132+4
INDIRF4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 132+8
INDIRF4
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2015
;2015:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2016
;2016:	verts[0].st[1] = 1;
ADDRLP4 0+12+4
CNSTF4 1065353216
ASGNF4
line 2017
;2017:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2018
;2018:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2019
;2019:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2020
;2020:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2022
;2021:
;2022:	VectorMA( finish, -cg_tracerWidth.value, right, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 132
INDIRF4
ADDRLP4 96
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 132+4
INDIRF4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 132+8
INDIRF4
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 2023
;2023:	verts[1].st[0] = 1;
ADDRLP4 0+24+12
CNSTF4 1065353216
ASGNF4
line 2024
;2024:	verts[1].st[1] = 0;
ADDRLP4 0+24+12+4
CNSTF4 0
ASGNF4
line 2025
;2025:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2026
;2026:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2027
;2027:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2028
;2028:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2030
;2029:
;2030:	VectorMA( start, -cg_tracerWidth.value, right, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 120
INDIRF4
ADDRLP4 96
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+48+4
ADDRLP4 120+4
INDIRF4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+48+8
ADDRLP4 120+8
INDIRF4
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 2031
;2031:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2032
;2032:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2033
;2033:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2034
;2034:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2035
;2035:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2036
;2036:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2038
;2037:
;2038:	VectorMA( start, cg_tracerWidth.value, right, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 120
INDIRF4
ADDRLP4 96
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+72+4
ADDRLP4 120+4
INDIRF4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+72+8
ADDRLP4 120+8
INDIRF4
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2039
;2039:	verts[3].st[0] = 0;
ADDRLP4 0+72+12
CNSTF4 0
ASGNF4
line 2040
;2040:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2041
;2041:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2042
;2042:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2043
;2043:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2044
;2044:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2046
;2045:
;2046:	trap_R_AddPolyToScene( cgs.media.tracerShader, 4, verts );
ADDRGP4 cgs+70296+196
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 2048
;2047:
;2048:	midpoint[0] = ( start[0] + finish[0] ) * 0.5;
ADDRLP4 168
CNSTF4 1056964608
ADDRLP4 120
INDIRF4
ADDRLP4 132
INDIRF4
ADDF4
MULF4
ASGNF4
line 2049
;2049:	midpoint[1] = ( start[1] + finish[1] ) * 0.5;
ADDRLP4 168+4
CNSTF4 1056964608
ADDRLP4 120+4
INDIRF4
ADDRLP4 132+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 2050
;2050:	midpoint[2] = ( start[2] + finish[2] ) * 0.5;
ADDRLP4 168+8
CNSTF4 1056964608
ADDRLP4 120+8
INDIRF4
ADDRLP4 132+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 2055
;2051:
;2052:	// add the tracer sound
;2053:	//trap_S_StartSound( midpoint, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.tracerSound );
;2054:
;2055:}
LABELV $1087
endproc CG_Tracer 224 12
export CG_CalcMuzzlePoint
proc CG_CalcMuzzlePoint 92 16
line 2062
;2056:
;2057:/*
;2058:======================
;2059:CG_CalcMuzzlePoint
;2060:======================
;2061:*/
;2062:qboolean CG_CalcMuzzlePoint( int entityNum, vec3_t muzzle ) {
line 2068
;2063:	vec3_t		forward, right;
;2064:	vec3_t		gunpoint;
;2065:	centity_t	*cent;
;2066:	int			anim;
;2067:
;2068:	if ( entityNum == cg.snap->ps.clientNum )
ADDRFP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1273
line 2069
;2069:	{ //I'm not exactly sure why we'd be rendering someone else's crosshair, but hey.
line 2070
;2070:		int weapontype = cg.snap->ps.weapon;
ADDRLP4 56
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 2073
;2071:		vec3_t weaponMuzzle;
;2072:
;2073:		VectorCopy(WP_MuzzlePoint[weapontype], weaponMuzzle);
ADDRLP4 44
CNSTI4 12
ADDRLP4 56
INDIRI4
MULI4
ADDRGP4 WP_MuzzlePoint
ADDP4
INDIRB
ASGNB 12
line 2075
;2074:
;2075:		if (weapontype == WP_DISRUPTOR || weapontype == WP_STUN_BATON || weapontype == WP_SABER)
ADDRLP4 56
INDIRI4
CNSTI4 5
EQI4 $1280
ADDRLP4 56
INDIRI4
CNSTI4 1
EQI4 $1280
ADDRLP4 56
INDIRI4
CNSTI4 2
NEI4 $1277
LABELV $1280
line 2076
;2076:		{
line 2077
;2077:			VectorClear(weaponMuzzle);
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 44+8
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 44
ADDRLP4 64
INDIRF4
ASGNF4
line 2078
;2078:		}
LABELV $1277
line 2080
;2079:
;2080:		if (cg.snap->ps.usingATST)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1283
line 2081
;2081:		{
line 2082
;2082:			VectorClear(weaponMuzzle);
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 44+8
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 44
ADDRLP4 64
INDIRF4
ASGNF4
line 2083
;2083:			weaponMuzzle[0] = 16;
ADDRLP4 44
CNSTF4 1098907648
ASGNF4
line 2084
;2084:			weaponMuzzle[2] = 128;
ADDRLP4 44+8
CNSTF4 1124073472
ASGNF4
line 2085
;2085:		}
LABELV $1283
line 2087
;2086:
;2087:		if (cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1289
line 2088
;2088:		{
line 2089
;2089:			VectorCopy( cg.predictedPlayerEntity.lerpOrigin, gunpoint );
ADDRLP4 32
ADDRGP4 cg+1476+928
INDIRB
ASGNB 12
line 2090
;2090:			AngleVectors( cg.predictedPlayerEntity.lerpAngles, forward, right, NULL );
ADDRGP4 cg+1476+940
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2091
;2091:		}
ADDRGP4 $1290
JUMPV
LABELV $1289
line 2093
;2092:		else
;2093:		{
line 2094
;2094:			VectorCopy( cg.refdef.vieworg, gunpoint );
ADDRLP4 32
ADDRGP4 cg+3616+24
INDIRB
ASGNB 12
line 2095
;2095:			AngleVectors( cg.refdefViewAngles, forward, right, NULL );
ADDRGP4 cg+3984
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2096
;2096:		}
LABELV $1290
line 2098
;2097:
;2098:		if (weapontype == WP_EMPLACED_GUN && cg.snap->ps.emplacedIndex)
ADDRLP4 56
INDIRI4
CNSTI4 14
NEI4 $1299
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1299
line 2099
;2099:		{
line 2100
;2100:			centity_t *gunEnt = &cg_entities[cg.snap->ps.emplacedIndex];
ADDRLP4 64
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2102
;2101:
;2102:			if (gunEnt)
ADDRLP4 64
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1303
line 2103
;2103:			{
line 2106
;2104:				vec3_t pitchConstraint;
;2105:
;2106:				VectorCopy(gunEnt->lerpOrigin, gunpoint);
ADDRLP4 32
ADDRLP4 64
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2107
;2107:				gunpoint[2] += 46;
ADDRLP4 32+8
ADDRLP4 32+8
INDIRF4
CNSTF4 1110966272
ADDF4
ASGNF4
line 2109
;2108:
;2109:				if (cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1306
line 2110
;2110:				{
line 2111
;2111:					VectorCopy(cg.predictedPlayerEntity.lerpAngles, pitchConstraint);
ADDRLP4 68
ADDRGP4 cg+1476+940
INDIRB
ASGNB 12
line 2112
;2112:				}
ADDRGP4 $1307
JUMPV
LABELV $1306
line 2114
;2113:				else
;2114:				{
line 2115
;2115:					VectorCopy(cg.refdefViewAngles, pitchConstraint);
ADDRLP4 68
ADDRGP4 cg+3984
INDIRB
ASGNB 12
line 2116
;2116:				}
LABELV $1307
line 2118
;2117:
;2118:				if (pitchConstraint[PITCH] > 40)
ADDRLP4 68
INDIRF4
CNSTF4 1109393408
LEF4 $1312
line 2119
;2119:				{
line 2120
;2120:					pitchConstraint[PITCH] = 40;
ADDRLP4 68
CNSTF4 1109393408
ASGNF4
line 2121
;2121:				}
LABELV $1312
line 2122
;2122:				AngleVectors( pitchConstraint, forward, right, NULL );
ADDRLP4 68
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2123
;2123:			}
LABELV $1303
line 2124
;2124:		}
LABELV $1299
line 2126
;2125:
;2126:		VectorCopy(gunpoint, muzzle);
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRB
ASGNB 12
line 2128
;2127:
;2128:		VectorMA(muzzle, weaponMuzzle[0], forward, muzzle);
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
line 2129
;2129:		VectorMA(muzzle, weaponMuzzle[1], right, muzzle);
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 20+4
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 20+8
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2131
;2130:
;2131:		if (weapontype == WP_EMPLACED_GUN && cg.snap->ps.emplacedIndex)
ADDRLP4 56
INDIRI4
CNSTI4 14
NEI4 $1321
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1321
line 2132
;2132:		{
line 2134
;2133:			//Do nothing
;2134:		}
ADDRGP4 $1322
JUMPV
LABELV $1321
line 2135
;2135:		else if (cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1324
line 2136
;2136:		{
line 2137
;2137:			muzzle[2] += cg.snap->ps.viewheight + weaponMuzzle[2];
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 44+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 2138
;2138:		}
ADDRGP4 $1325
JUMPV
LABELV $1324
line 2140
;2139:		else
;2140:		{
line 2141
;2141:			muzzle[2] += weaponMuzzle[2];
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDF4
ASGNF4
line 2142
;2142:		}
LABELV $1325
LABELV $1322
line 2144
;2143:
;2144:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1272
JUMPV
LABELV $1273
line 2147
;2145:	}
;2146:
;2147:	cent = &cg_entities[entityNum];
ADDRLP4 12
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2148
;2148:	if ( !cent->currentValid ) {
ADDRLP4 12
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1330
line 2149
;2149:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1272
JUMPV
LABELV $1330
line 2152
;2150:	}
;2151:
;2152:	VectorCopy( cent->currentState.pos.trBase, muzzle );
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2154
;2153:
;2154:	AngleVectors( cent->currentState.apos.trBase, forward, NULL, NULL );
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 44
CNSTP4 0
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2155
;2155:	anim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2156
;2156:	if ( anim == BOTH_CROUCH1WALK || anim == BOTH_CROUCH1IDLE ) {
ADDRLP4 16
INDIRI4
CNSTI4 798
EQI4 $1334
ADDRLP4 16
INDIRI4
CNSTI4 797
NEI4 $1332
LABELV $1334
line 2157
;2157:		muzzle[2] += CROUCH_VIEWHEIGHT;
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 2158
;2158:	} else {
ADDRGP4 $1333
JUMPV
LABELV $1332
line 2159
;2159:		muzzle[2] += DEFAULT_VIEWHEIGHT;
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1108344832
ADDF4
ASGNF4
line 2160
;2160:	}
LABELV $1333
line 2162
;2161:
;2162:	VectorMA( muzzle, 14, forward, muzzle );
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2164
;2163:
;2164:	return qtrue;
CNSTI4 1
RETI4
LABELV $1272
endproc CG_CalcMuzzlePoint 92 16
export CG_InitG2Weapons
proc CG_InitG2Weapons 20 28
line 2177
;2165:
;2166:}
;2167:
;2168:
;2169:
;2170:/*
;2171:Ghoul2 Insert Start
;2172:*/
;2173:
;2174:// create one instance of all the weapons we are going to use so we can just copy this info into each clients gun ghoul2 object in fast way
;2175:void *g2WeaponInstances[MAX_WEAPONS];
;2176:void CG_InitG2Weapons(void)
;2177:{
line 2178
;2178:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2180
;2179:	gitem_t		*item;
;2180:	memset(g2WeaponInstances, 0, sizeof(g2WeaponInstances));
ADDRGP4 g2WeaponInstances
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2181
;2181:	for ( item = bg_itemlist + 1 ; item->classname ; item++ ) 
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $1341
JUMPV
LABELV $1338
line 2182
;2182:	{
line 2183
;2183:		if ( item->giType == IT_WEAPON )
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1343
line 2184
;2184:		{
line 2186
;2185:			// initialise model
;2186:			trap_G2API_InitGhoul2Model(&g2WeaponInstances[/*i*/item->giTag], item->world_model[0], 0, 0, 0, 0, 0);
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 2188
;2187://			trap_G2API_InitGhoul2Model(&g2WeaponInstances[i], item->world_model[0],G_ModelIndex( item->world_model[0] ) , 0, 0, 0, 0);
;2188:			if (g2WeaponInstances[/*i*/item->giTag])
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1345
line 2189
;2189:			{
line 2191
;2190:				// indicate we will be bolted to model 0 (ie the player) on bolt 0 (always the right hand) when we get copied
;2191:				trap_G2API_SetBoltInfo(g2WeaponInstances[/*i*/item->giTag], 0, 0);
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoltInfo
CALLV
pop
line 2193
;2192:				// now set up the gun bolt on it
;2193:				trap_G2API_AddBolt(g2WeaponInstances[/*i*/item->giTag], 0, "*flash");
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1347
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 2194
;2194:				i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2195
;2195:			}
LABELV $1345
line 2196
;2196:			if (i == MAX_WEAPONS)
ADDRLP4 4
INDIRI4
CNSTI4 16
NEI4 $1348
line 2197
;2197:			{
line 2198
;2198:				assert(0);	
line 2199
;2199:				break;
ADDRGP4 $1340
JUMPV
LABELV $1348
line 2202
;2200:			}
;2201:			
;2202:		}
LABELV $1343
line 2203
;2203:	}
LABELV $1339
line 2181
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $1341
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1338
LABELV $1340
line 2204
;2204:}
LABELV $1337
endproc CG_InitG2Weapons 20 28
export CG_ShutDownG2Weapons
proc CG_ShutDownG2Weapons 4 4
line 2208
;2205:
;2206:// clean out any g2 models we instanciated for copying purposes
;2207:void CG_ShutDownG2Weapons(void)
;2208:{
line 2210
;2209:	int i;
;2210:	for (i=0; i<MAX_WEAPONS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1351
line 2211
;2211:	{
line 2212
;2212:		trap_G2API_CleanGhoul2Models(&g2WeaponInstances[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 2213
;2213:	}
LABELV $1352
line 2210
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1351
line 2214
;2214:}
LABELV $1350
endproc CG_ShutDownG2Weapons 4 4
export CG_CopyG2WeaponInstance
proc CG_CopyG2WeaponInstance 4 16
line 2218
;2215:
;2216:// what ghoul2 model do we want to copy ?
;2217:void CG_CopyG2WeaponInstance(int weaponNum, void *toGhoul2)
;2218:{
line 2220
;2219:	//rww - the -1 is because there is no "weapon" for WP_NONE
;2220:	assert(weaponNum < MAX_WEAPONS);
line 2221
;2221:	if (g2WeaponInstances[weaponNum/*-1*/])
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1356
line 2222
;2222:	{
line 2223
;2223:		if (weaponNum == WP_EMPLACED_GUN)
ADDRFP4 0
INDIRI4
CNSTI4 14
NEI4 $1358
line 2224
;2224:		{ //a bit of a hack to remove gun model when using an emplaced weap
line 2225
;2225:			if (trap_G2API_HasGhoul2ModelOnIndex(&(toGhoul2), 1))
ADDRFP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1359
line 2226
;2226:			{
line 2227
;2227:				trap_G2API_RemoveGhoul2Model(&(toGhoul2), 1);
ADDRFP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 2228
;2228:			}
line 2229
;2229:		}
ADDRGP4 $1359
JUMPV
LABELV $1358
line 2231
;2230:		else
;2231:		{
line 2232
;2232:			trap_G2API_CopySpecificGhoul2Model(g2WeaponInstances[weaponNum/*-1*/], 0, toGhoul2, 1); 
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
CALLV
pop
line 2233
;2233:		}
LABELV $1359
line 2234
;2234:	}
LABELV $1356
line 2235
;2235:}
LABELV $1355
endproc CG_CopyG2WeaponInstance 4 16
export CG_CheckPlayerG2Weapons
proc CG_CheckPlayerG2Weapons 32 16
line 2238
;2236:
;2237:void CG_CheckPlayerG2Weapons(playerState_t *ps, centity_t *cent) 
;2238:{
line 2240
;2239:	// should we change the gun model on this player?
;2240:	if (cent->currentState.saberInFlight)
ADDRFP4 4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1363
line 2241
;2241:	{
line 2242
;2242:		cent->ghoul2weapon = g2WeaponInstances[WP_SABER];
ADDRFP4 4
INDIRP4
CNSTI4 960
ADDP4
ADDRGP4 g2WeaponInstances+8
INDIRP4
ASGNP4
line 2243
;2243:	}
LABELV $1363
line 2245
;2244:
;2245:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1366
line 2246
;2246:	{ //no updating weapons when dead
line 2247
;2247:		cent->ghoul2weapon = NULL;
ADDRFP4 4
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 2248
;2248:		return;
ADDRGP4 $1362
JUMPV
LABELV $1366
line 2251
;2249:	}
;2250:
;2251:	if (cent->torsoBolt)
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1368
line 2252
;2252:	{ //got our limb cut off, no updating weapons until it's restored
line 2253
;2253:		cent->ghoul2weapon = NULL;
ADDRFP4 4
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 2254
;2254:		return;
ADDRGP4 $1362
JUMPV
LABELV $1368
line 2257
;2255:	}
;2256:
;2257:	if (ps && ps->usingATST)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1370
ADDRLP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1370
line 2258
;2258:	{
line 2259
;2259:		cent->ghoul2weapon = NULL;
ADDRFP4 4
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 2260
;2260:	}
LABELV $1370
line 2262
;2261:
;2262:	if (cent->isATST)
ADDRFP4 4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1372
line 2263
;2263:	{
line 2264
;2264:		cent->ghoul2weapon = NULL;
ADDRFP4 4
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 2265
;2265:		return;
ADDRGP4 $1362
JUMPV
LABELV $1372
line 2268
;2266:	}
;2267:
;2268:	if (cent->ghoul2 && cent->ghoul2weapon != g2WeaponInstances[ps->weapon] &&
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1374
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 960
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
CVPU4 4
EQU4 $1374
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
NEI4 $1374
line 2270
;2269:		ps->clientNum == cent->currentState.number) //don't want spectator mode forcing one client's weapon instance over another's
;2270:	{
line 2271
;2271:		CG_CopyG2WeaponInstance(ps->weapon, cent->ghoul2);
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_CopyG2WeaponInstance
CALLV
pop
line 2272
;2272:		cent->ghoul2weapon = g2WeaponInstances[ps->weapon];
ADDRFP4 4
INDIRP4
CNSTI4 960
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
ASGNP4
line 2273
;2273:		if (cent->weapon == WP_SABER && cg_entities[cent->currentState.number].weapon != ps->weapon && !ps->saberHolstered)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1376
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 12
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+956
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
EQI4 $1376
ADDRLP4 16
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1376
line 2274
;2274:		{ //switching away from the saber
line 2275
;2275:			trap_S_StartSound(cent->lerpOrigin, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberoffquick.wav" ));
ADDRGP4 $1379
ARGP4
ADDRLP4 20
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2276
;2276:		}
ADDRGP4 $1377
JUMPV
LABELV $1376
line 2277
;2277:		else if (ps->weapon == WP_SABER && cg_entities[cent->currentState.number].weapon != ps->weapon)
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
NEI4 $1380
CNSTI4 1920
ADDRFP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+956
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $1380
line 2278
;2278:		{ //switching to the saber
line 2279
;2279:			trap_S_StartSound(cent->lerpOrigin, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberon.wav" ));
ADDRGP4 $1383
ARGP4
ADDRLP4 24
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2280
;2280:		}
LABELV $1380
LABELV $1377
line 2281
;2281:		cent->weapon = ps->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 956
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 2282
;2282:		cg_entities[cent->currentState.number].weapon = ps->weapon;
CNSTI4 1920
ADDRFP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+956
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 2283
;2283:	}
LABELV $1374
line 2284
;2284:}
LABELV $1362
endproc CG_CheckPlayerG2Weapons 32 16
import hudTintColor
import redhudtint
import bluehudtint
import FX_RocketHitPlayer
import FX_RocketHitWall
import FX_RocketAltProjectileThink
import FX_RocketProjectileThink
import FX_FlechetteAltProjectileThink
import FX_FlechetteWeaponHitPlayer
import FX_FlechetteWeaponHitWall
import FX_FlechetteProjectileThink
import FX_DEMP2_AltDetonate
import FX_DEMP2_HitPlayer
import FX_DEMP2_HitWall
import FX_DEMP2_ProjectileThink
import FX_RepeaterAltHitPlayer
import FX_RepeaterHitPlayer
import FX_RepeaterAltHitWall
import FX_RepeaterHitWall
import FX_RepeaterAltProjectileThink
import FX_RepeaterProjectileThink
import FX_BowcasterHitPlayer
import FX_BowcasterHitWall
import FX_BowcasterAltProjectileThink
import FX_BowcasterProjectileThink
import FX_DisruptorHitPlayer
import FX_DisruptorHitWall
import FX_DisruptorAltHit
import FX_DisruptorAltMiss
import FX_DisruptorAltShot
import FX_DisruptorMainShot
import FX_BryarAltProjectileThink
import FX_BryarProjectileThink
bss
export g2WeaponInstances
align 4
LABELV g2WeaponInstances
skip 64
import CG_CreateBBRefEnts
import CG_SetGhoul2Info
import CG_Init_CGents
import CG_Init_CG
import trap_G2API_SetNewOrigin
import trap_G2API_SetSurfaceOnOff
import trap_G2API_SetRootSurface
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CleanGhoul2Models
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_GiveMeVectorFromMatrix
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import trap_G2API_CollisionDetect
import FX_ForceDrained
import FX_BlasterWeaponHitPlayer
import FX_BlasterWeaponHitWall
import FX_BlasterAltFireThink
import FX_BlasterProjectileThink
import FX_BryarAltHitPlayer
import FX_BryarHitPlayer
import FX_BryarAltHitWall
import FX_BryarHitWall
import CG_Spark
import FX_TurretHitPlayer
import FX_TurretHitWall
import FX_TurretProjectileThink
import CG_NewParticleArea
import initparticles
import CG_GetStripEdString
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_CG_RegisterSharedMemory
import trap_SP_GetStringTextString
import trap_SP_Print
import trap_FX_AddSprite
import trap_FX_AddPrimitive
import trap_FX_AddBezier
import trap_FX_AddPoly
import trap_FX_AdjustTime
import trap_FX_FreeSystem
import trap_FX_InitSystem
import trap_FX_AddScheduledEffects
import trap_FX_PlayBoltedEffectID
import trap_FX_PlayEntityEffectID
import trap_FX_PlayEffectID
import trap_FX_PlaySimpleEffectID
import trap_FX_PlayEntityEffect
import trap_FX_PlayEffect
import trap_FX_PlaySimpleEffect
import trap_FX_RegisterEffect
import trap_R_inPVS
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import BG_CycleForce
import BG_ProperForceIndex
import BG_CycleInven
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_OpenUIMenu
import trap_SetClientTurnExtent
import trap_SetClientForceAngle
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_FX_AddLine
import trap_R_GetBModelVerts
import trap_R_SetLightStyle
import trap_R_GetLightStyle
import trap_R_RemapShader
import trap_R_DrawRotatePic2
import trap_R_DrawRotatePic
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_AnyLanguage_ReadCharFromString
import trap_Language_UsesSpaces
import trap_Language_IsAsian
import trap_R_Font_DrawString
import trap_R_Font_HeightPixels
import trap_R_Font_StrLenChars
import trap_R_Font_StrLenPixels
import trap_R_RegisterFont
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_S_MuteSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_SagaObjectiveCompleted
import CG_SagaRoundOver
import CG_InitSagaMode
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_IsMindTricked
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_InitGlass
import CG_TestLine
import CG_SurfaceExplosion
import CG_MakeExplosion
import CG_Bleed
import CG_ScorePlum
import CG_CreateDebris
import CG_GlassShatter
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_RegisterWeapon
import TurretClientRun
import ScaleModelAxis
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_ManualEntityRender
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_ReattachLimb
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_PlayerShieldHit
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_DeferMenuScript
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawScaledProportionalString
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawNumField
import CG_DrawString
import CG_DrawRotatePic2
import CG_DrawRotatePic
import CG_DrawPic
import CG_FillRect
import CG_TestModelAnimate_f
import CG_TestModelSetAnglespost_f
import CG_TestModelSetAnglespre_f
import CG_ListModelBones_f
import CG_ListModelSurfaces_f
import CG_TestModelSurfaceOnOff_f
import CG_TestG2Model_f
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_PrevForcePower_f
import CG_NextForcePower_f
import CG_PrevInventory_f
import CG_NextInventory_f
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import pug_demos_cameraMode
import ui_fragsOnly
import cam_autorecord
import pug_demospec
import cg_debugBB
import ui_myteam
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_trueLightning
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_hudFiles
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawEnemyInfo
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPersonHorzOffset
import cg_thirdPersonAlpha
import cg_thirdPersonTargetDamp
import cg_thirdPersonCameraDamp
import cg_thirdPersonVertOffset
import cg_thirdPersonPitchOffset
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_thirdPerson
import cg_dismember
import cg_animBlend
import cg_auraShell
import cg_speedTrail
import cg_duelHeadAngles
import cg_saberTrail
import cg_saberContact
import cg_saberDynamicMarkTime
import cg_saberDynamicMarks
import cg_fpls
import cg_saberModelTraceEffect
import cg_oldPainSounds
import cg_swingAngles
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_dynamicCrosshair
import cg_drawScores
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_shadows
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import CGCam_SetMusicMult
import CGCam_Shake
import cgScreenEffects
import ammoTicPos
import forceTicPos
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
LABELV $1383
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
LABELV $1379
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
LABELV $1347
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 0
align 1
LABELV $1047
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 47
char 1 97
char 1 108
char 1 116
char 1 68
char 1 101
char 1 116
char 1 111
char 1 110
char 1 97
char 1 116
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $972
char 1 67
char 1 71
char 1 95
char 1 70
char 1 105
char 1 114
char 1 101
char 1 87
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 58
char 1 32
char 1 101
char 1 110
char 1 116
char 1 45
char 1 62
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 32
char 1 62
char 1 61
char 1 32
char 1 87
char 1 80
char 1 95
char 1 78
char 1 85
char 1 77
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 83
char 1 0
align 1
LABELV $953
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
char 1 97
char 1 116
char 1 115
char 1 116
char 1 47
char 1 65
char 1 84
char 1 83
char 1 84
char 1 102
char 1 105
char 1 114
char 1 101
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $896
char 1 115
char 1 118
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 115
char 1 119
char 1 105
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $754
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 95
char 1 37
char 1 115
char 1 0
align 1
LABELV $282
char 1 116
char 1 97
char 1 103
char 1 95
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 0
align 1
LABELV $271
char 1 116
char 1 97
char 1 103
char 1 95
char 1 98
char 1 97
char 1 114
char 1 114
char 1 101
char 1 108
char 1 51
char 1 0
align 1
LABELV $270
char 1 116
char 1 97
char 1 103
char 1 95
char 1 98
char 1 97
char 1 114
char 1 114
char 1 101
char 1 108
char 1 50
char 1 0
align 1
LABELV $267
char 1 116
char 1 97
char 1 103
char 1 95
char 1 98
char 1 97
char 1 114
char 1 114
char 1 101
char 1 108
char 1 0
align 1
LABELV $261
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
char 1 116
char 1 117
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 95
char 1 98
char 1 97
char 1 114
char 1 114
char 1 101
char 1 108
char 1 51
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $259
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
char 1 116
char 1 117
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 95
char 1 98
char 1 97
char 1 114
char 1 114
char 1 101
char 1 108
char 1 50
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $255
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
char 1 116
char 1 117
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 95
char 1 98
char 1 97
char 1 114
char 1 114
char 1 101
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $240
char 1 116
char 1 97
char 1 103
char 1 95
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 0
align 1
LABELV $138
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $125
char 1 67
char 1 71
char 1 95
char 1 82
char 1 101
char 1 103
char 1 105
char 1 115
char 1 116
char 1 101
char 1 114
char 1 73
char 1 116
char 1 101
char 1 109
char 1 86
char 1 105
char 1 115
char 1 117
char 1 97
char 1 108
char 1 115
char 1 58
char 1 32
char 1 105
char 1 116
char 1 101
char 1 109
char 1 78
char 1 117
char 1 109
char 1 32
char 1 37
char 1 100
char 1 32
char 1 111
char 1 117
char 1 116
char 1 32
char 1 111
char 1 102
char 1 32
char 1 114
char 1 97
char 1 110
char 1 103
char 1 101
char 1 32
char 1 91
char 1 48
char 1 45
char 1 37
char 1 100
char 1 93
char 1 0
