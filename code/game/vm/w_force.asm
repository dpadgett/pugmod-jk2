data
export speedLoopSound
align 4
LABELV speedLoopSound
byte 4 0
export rageLoopSound
align 4
LABELV rageLoopSound
byte 4 0
export protectLoopSound
align 4
LABELV protectLoopSound
byte 4 0
export absorbLoopSound
align 4
LABELV absorbLoopSound
byte 4 0
export seeLoopSound
align 4
LABELV seeLoopSound
byte 4 0
export ysalamiriLoopSound
align 4
LABELV ysalamiriLoopSound
byte 4 0
export G_PreDefSound
code
proc G_PreDefSound 8 8
file "../w_force.c"
line 27
;1:#include "g_local.h"
;2:#include "w_saber.h"
;3:#include "ai_main.h"
;4:#include "..\ghoul2\g2.h"
;5:
;6:#define METROID_JUMP 1
;7:
;8:extern bot_state_t *botstates[MAX_CLIENTS];
;9:
;10:int speedLoopSound = 0;
;11: 
;12:int rageLoopSound = 0;
;13:
;14:int protectLoopSound = 0;
;15:
;16:int absorbLoopSound = 0;
;17:
;18:int seeLoopSound = 0;
;19:
;20:int	ysalamiriLoopSound = 0;
;21:
;22:#define FORCE_VELOCITY_DAMAGE 0
;23:
;24:int ForceShootDrain( gentity_t *self );
;25:
;26:gentity_t *G_PreDefSound(vec3_t org, int pdSound)
;27:{
line 30
;28:	gentity_t	*te;
;29:
;30:	te = G_TempEntity( org, EV_PREDEFSOUND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 31
;31:	te->s.eventParm = pdSound;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 32
;32:	VectorCopy(org, te->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 34
;33:
;34:	return te;
ADDRLP4 0
INDIRP4
RETP4
LABELV $82
endproc G_PreDefSound 8 8
export InFront
proc InFront 64 16
line 38
;35:}
;36:
;37:qboolean InFront( vec3_t spot, vec3_t from, vec3_t fromAngles, float threshHold )
;38:{
line 42
;39:	vec3_t	dir, forward, angles;
;40:	float	dot;
;41:
;42:	VectorSubtract( spot, from, dir );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 0+8
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
ASGNF4
line 43
;43:	dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 44
;44:	VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 46
;45:
;46:	VectorCopy( fromAngles, angles );
ADDRLP4 24
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 47
;47:	angles[0] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 48
;48:	AngleVectors( angles, forward, NULL, NULL );
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 56
CNSTP4 0
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 50
;49:
;50:	dot = DotProduct( dir, forward );
ADDRLP4 36
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 52
;51:
;52:	return (dot > threshHold);
ADDRLP4 36
INDIRF4
ADDRFP4 12
INDIRF4
LEF4 $92
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $93
JUMPV
LABELV $92
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $93
ADDRLP4 60
INDIRI4
RETI4
LABELV $83
endproc InFront 64 16
data
export forcePowerMinRank
align 4
LABELV forcePowerMinRank
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 10
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 10
byte 4 15
byte 4 10
byte 4 15
byte 4 15
byte 4 15
byte 4 10
byte 4 10
byte 4 10
byte 4 5
byte 4 0
byte 4 0
byte 4 0
byte 4 10
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 10
byte 4 15
byte 4 10
byte 4 15
byte 4 15
byte 4 15
byte 4 10
byte 4 10
byte 4 10
byte 4 5
byte 4 5
byte 4 5
byte 4 5
byte 4 10
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 10
byte 4 15
byte 4 10
byte 4 15
byte 4 15
byte 4 15
byte 4 10
byte 4 10
byte 4 10
byte 4 5
byte 4 10
byte 4 10
byte 4 10
export WP_InitForcePowers
code
proc WP_InitForcePowers 1632 24
line 144
;53:}
;54:
;55:int forcePowerMinRank[NUM_FORCE_POWER_LEVELS][NUM_FORCE_POWERS] = //0 == neutral
;56:{
;57:	{
;58:		999,//FP_HEAL,//instant
;59:		999,//FP_LEVITATION,//hold/duration
;60:		999,//FP_SPEED,//duration
;61:		999,//FP_PUSH,//hold/duration
;62:		999,//FP_PULL,//hold/duration
;63:		999,//FP_TELEPATHY,//instant
;64:		999,//FP_GRIP,//hold/duration
;65:		999,//FP_LIGHTNING,//hold/duration
;66:		999,//FP_RAGE,//duration
;67:		999,//FP_PROTECT,//duration
;68:		999,//FP_ABSORB,//duration
;69:		999,//FP_TEAM_HEAL,//instant
;70:		999,//FP_TEAM_FORCE,//instant
;71:		999,//FP_DRAIN,//hold/duration
;72:		999,//FP_SEE,//duration
;73:		999,//FP_SABERATTACK,
;74:		999,//FP_SABERDEFEND,
;75:		999//FP_SABERTHROW,
;76:		//NUM_FORCE_POWERS
;77:	},
;78:	{
;79:		10,//FP_HEAL,//instant
;80:		0,//FP_LEVITATION,//hold/duration
;81:		0,//FP_SPEED,//duration
;82:		0,//FP_PUSH,//hold/duration
;83:		0,//FP_PULL,//hold/duration
;84:		10,//FP_TELEPATHY,//instant
;85:		15,//FP_GRIP,//hold/duration
;86:		10,//FP_LIGHTNING,//hold/duration
;87:		15,//FP_RAGE,//duration
;88:		15,//FP_PROTECT,//duration
;89:		15,//FP_ABSORB,//duration
;90:		10,//FP_TEAM_HEAL,//instant
;91:		10,//FP_TEAM_FORCE,//instant
;92:		10,//FP_DRAIN,//hold/duration
;93:		5,//FP_SEE,//duration
;94:		0,//FP_SABERATTACK,
;95:		0,//FP_SABERDEFEND,
;96:		0//FP_SABERTHROW,
;97:		//NUM_FORCE_POWERS
;98:	},
;99:	{
;100:		10,//FP_HEAL,//instant
;101:		0,//FP_LEVITATION,//hold/duration
;102:		0,//FP_SPEED,//duration
;103:		0,//FP_PUSH,//hold/duration
;104:		0,//FP_PULL,//hold/duration
;105:		10,//FP_TELEPATHY,//instant
;106:		15,//FP_GRIP,//hold/duration
;107:		10,//FP_LIGHTNING,//hold/duration
;108:		15,//FP_RAGE,//duration
;109:		15,//FP_PROTECT,//duration
;110:		15,//FP_ABSORB,//duration
;111:		10,//FP_TEAM_HEAL,//instant
;112:		10,//FP_TEAM_FORCE,//instant
;113:		10,//FP_DRAIN,//hold/duration
;114:		5,//FP_SEE,//duration
;115:		5,//FP_SABERATTACK,
;116:		5,//FP_SABERDEFEND,
;117:		5//FP_SABERTHROW,
;118:		//NUM_FORCE_POWERS
;119:	},
;120:	{
;121:		10,//FP_HEAL,//instant
;122:		0,//FP_LEVITATION,//hold/duration
;123:		0,//FP_SPEED,//duration
;124:		0,//FP_PUSH,//hold/duration
;125:		0,//FP_PULL,//hold/duration
;126:		10,//FP_TELEPATHY,//instant
;127:		15,//FP_GRIP,//hold/duration
;128:		10,//FP_LIGHTNING,//hold/duration
;129:		15,//FP_RAGE,//duration
;130:		15,//FP_PROTECT,//duration
;131:		15,//FP_ABSORB,//duration
;132:		10,//FP_TEAM_HEAL,//instant
;133:		10,//FP_TEAM_FORCE,//instant
;134:		10,//FP_DRAIN,//hold/duration
;135:		5,//FP_SEE,//duration
;136:		10,//FP_SABERATTACK,
;137:		10,//FP_SABERDEFEND,
;138:		10//FP_SABERTHROW,
;139:		//NUM_FORCE_POWERS
;140:	}
;141:};
;142:
;143:void WP_InitForcePowers( gentity_t *ent )
;144:{
line 147
;145:	int i;
;146:	int i_r;
;147:	int maxRank = g_maxForceRank.integer;
ADDRLP4 520
ADDRGP4 g_maxForceRank+12
INDIRI4
ASGNI4
line 148
;148:	qboolean warnClient = qfalse;
ADDRLP4 528
CNSTI4 0
ASGNI4
line 149
;149:	qboolean warnClientLimit = qfalse;
ADDRLP4 1560
CNSTI4 0
ASGNI4
line 153
;150:	char userinfo[MAX_INFO_STRING];
;151:	char forcePowers[256];
;152:	char readBuf[256];
;153:	int lastFPKnown = -1;
ADDRLP4 524
CNSTI4 -1
ASGNI4
line 154
;154:	qboolean didEvent = qfalse;
ADDRLP4 1556
CNSTI4 0
ASGNI4
line 156
;155:
;156:	if (!maxRank)
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $96
line 157
;157:	{ //if server has no max rank, default to max (50)
line 158
;158:		maxRank = FORCE_MASTERY_JEDI_MASTER;
ADDRLP4 520
CNSTI4 7
ASGNI4
line 159
;159:	}
LABELV $96
line 169
;160:
;161:	/*
;162:	if (g_forcePowerDisable.integer)
;163:	{
;164:		maxRank = FORCE_MASTERY_UNINITIATED;
;165:	}
;166:	*/
;167:	//rww - don't do this
;168:
;169:	if ( !ent || !ent->client )
ADDRLP4 1564
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1568
CNSTU4 0
ASGNU4
ADDRLP4 1564
INDIRP4
CVPU4 4
ADDRLP4 1568
INDIRU4
EQU4 $100
ADDRLP4 1564
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1568
INDIRU4
NEU4 $98
LABELV $100
line 170
;170:	{
line 171
;171:		return;
ADDRGP4 $94
JUMPV
LABELV $98
line 174
;172:	}
;173:
;174:	ent->client->ps.fd.saberAnimLevel = ent->client->sess.saberLevel;
ADDRLP4 1572
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1572
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 1572
INDIRP4
CNSTI4 1560
ADDP4
INDIRI4
ASGNI4
line 176
;175:
;176:	if (ent->client->ps.fd.saberAnimLevel < FORCE_LEVEL_1 ||
ADDRLP4 1576
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1576
INDIRI4
CNSTI4 1
LTI4 $103
ADDRLP4 1576
INDIRI4
CNSTI4 3
LEI4 $101
LABELV $103
line 178
;177:		ent->client->ps.fd.saberAnimLevel > FORCE_LEVEL_3)
;178:	{
line 179
;179:		ent->client->ps.fd.saberAnimLevel = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 1
ASGNI4
line 180
;180:	}
LABELV $101
line 182
;181:
;182:	if (!speedLoopSound)
ADDRGP4 speedLoopSound
INDIRI4
CNSTI4 0
NEI4 $104
line 183
;183:	{ //so that the client configstring is already modified with this when we need it
line 184
;184:		speedLoopSound = G_SoundIndex("sound/weapons/force/speedloop.wav");
ADDRGP4 $106
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 speedLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 185
;185:	}
LABELV $104
line 187
;186:
;187:	if (!rageLoopSound)
ADDRGP4 rageLoopSound
INDIRI4
CNSTI4 0
NEI4 $107
line 188
;188:	{
line 189
;189:		rageLoopSound = G_SoundIndex("sound/weapons/force/rageloop.wav");
ADDRGP4 $109
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 rageLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 190
;190:	}
LABELV $107
line 192
;191:
;192:	if (!absorbLoopSound)
ADDRGP4 absorbLoopSound
INDIRI4
CNSTI4 0
NEI4 $110
line 193
;193:	{
line 194
;194:		absorbLoopSound = G_SoundIndex("sound/weapons/force/absorbloop.wav");
ADDRGP4 $112
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 absorbLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 195
;195:	}
LABELV $110
line 197
;196:
;197:	if (!protectLoopSound)
ADDRGP4 protectLoopSound
INDIRI4
CNSTI4 0
NEI4 $113
line 198
;198:	{
line 199
;199:		protectLoopSound = G_SoundIndex("sound/weapons/force/protectloop.wav");
ADDRGP4 $115
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 protectLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 200
;200:	}
LABELV $113
line 202
;201:
;202:	if (!seeLoopSound)
ADDRGP4 seeLoopSound
INDIRI4
CNSTI4 0
NEI4 $116
line 203
;203:	{
line 204
;204:		seeLoopSound = G_SoundIndex("sound/weapons/force/seeloop.wav");
ADDRGP4 $118
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 seeLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 205
;205:	}
LABELV $116
line 207
;206:
;207:	if (!ysalamiriLoopSound)
ADDRGP4 ysalamiriLoopSound
INDIRI4
CNSTI4 0
NEI4 $119
line 208
;208:	{
line 209
;209:		ysalamiriLoopSound = G_SoundIndex("sound/player/nullifyloop.wav");
ADDRGP4 $121
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 ysalamiriLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 210
;210:	}
LABELV $119
line 212
;211:
;212:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $123
JUMPV
LABELV $122
line 214
;213:	while (i < NUM_FORCE_POWERS)
;214:	{
line 215
;215:		ent->client->ps.fd.forcePowerLevel[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 216
;216:		ent->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 1580
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1580
INDIRP4
ADDRLP4 1580
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 217
;217:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 218
;218:	}
LABELV $123
line 213
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $122
line 220
;219:
;220:	ent->client->ps.fd.forcePowerSelected = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 -1
ASGNI4
line 222
;221:
;222:	ent->client->ps.fd.forceSide = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
CNSTI4 0
ASGNI4
line 224
;223:
;224:	trap_GetUserinfo( ent->s.number, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 532
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 226
;225:
;226:	Q_strncpyz( forcePowers, Info_ValueForKey (userinfo, "forcepowers"), sizeof( forcePowers ) );
ADDRLP4 532
ARGP4
ADDRGP4 $125
ARGP4
ADDRLP4 1580
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 1580
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 228
;227:
;228:	if ( ent->r.svFlags & SVF_BOT && botstates[ent->s.number] )
ADDRLP4 1584
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1584
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $126
ADDRLP4 1584
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $126
line 229
;229:	{ //if it's a bot just copy the info directly from its personality
line 230
;230:		Com_sprintf(forcePowers, sizeof(forcePowers), "%s\0", botstates[ent->s.number]->forceinfo);
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $128
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2744
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 231
;231:	}
LABELV $126
line 234
;232:
;233:	//rww - parse through the string manually and eat out all the appropriate data
;234:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 236
;235:
;236:	if (g_forceBasedTeams.integer)
ADDRGP4 g_forceBasedTeams+12
INDIRI4
CNSTI4 0
EQI4 $129
line 237
;237:	{
line 238
;238:		if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $132
line 239
;239:		{
line 240
;240:			warnClient = !(BG_LegalizedForcePowers(forcePowers, maxRank, HasSetSaberOnly(), FORCE_DARKSIDE, g_gametype.integer, g_forcePowerDisable.integer));
ADDRLP4 1592
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 8
ARGP4
ADDRLP4 520
INDIRI4
ARGI4
ADDRLP4 1592
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 1596
ADDRGP4 BG_LegalizedForcePowers
CALLI4
ASGNI4
ADDRLP4 1596
INDIRI4
CNSTI4 0
NEI4 $137
ADDRLP4 1588
CNSTI4 1
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $137
ADDRLP4 1588
CNSTI4 0
ASGNI4
LABELV $138
ADDRLP4 528
ADDRLP4 1588
INDIRI4
ASGNI4
line 241
;241:		}
ADDRGP4 $130
JUMPV
LABELV $132
line 242
;242:		else if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 2
NEI4 $139
line 243
;243:		{
line 244
;244:			warnClient = !(BG_LegalizedForcePowers(forcePowers, maxRank, HasSetSaberOnly(), FORCE_LIGHTSIDE, g_gametype.integer, g_forcePowerDisable.integer));
ADDRLP4 1592
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 8
ARGP4
ADDRLP4 520
INDIRI4
ARGI4
ADDRLP4 1592
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 1596
ADDRGP4 BG_LegalizedForcePowers
CALLI4
ASGNI4
ADDRLP4 1596
INDIRI4
CNSTI4 0
NEI4 $144
ADDRLP4 1588
CNSTI4 1
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $144
ADDRLP4 1588
CNSTI4 0
ASGNI4
LABELV $145
ADDRLP4 528
ADDRLP4 1588
INDIRI4
ASGNI4
line 245
;245:		}
ADDRGP4 $130
JUMPV
LABELV $139
line 247
;246:		else
;247:		{
line 248
;248:			warnClient = !(BG_LegalizedForcePowers(forcePowers, maxRank, HasSetSaberOnly(), 0, g_gametype.integer, g_forcePowerDisable.integer));
ADDRLP4 1592
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 8
ARGP4
ADDRLP4 520
INDIRI4
ARGI4
ADDRLP4 1592
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 1596
ADDRGP4 BG_LegalizedForcePowers
CALLI4
ASGNI4
ADDRLP4 1596
INDIRI4
CNSTI4 0
NEI4 $149
ADDRLP4 1588
CNSTI4 1
ASGNI4
ADDRGP4 $150
JUMPV
LABELV $149
ADDRLP4 1588
CNSTI4 0
ASGNI4
LABELV $150
ADDRLP4 528
ADDRLP4 1588
INDIRI4
ASGNI4
line 249
;249:		}
line 250
;250:	}
ADDRGP4 $130
JUMPV
LABELV $129
line 252
;251:	else
;252:	{
line 253
;253:		warnClient = !(BG_LegalizedForcePowers(forcePowers, maxRank, HasSetSaberOnly(), 0, g_gametype.integer, g_forcePowerDisable.integer));
ADDRLP4 1592
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 8
ARGP4
ADDRLP4 520
INDIRI4
ARGI4
ADDRLP4 1592
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 1596
ADDRGP4 BG_LegalizedForcePowers
CALLI4
ASGNI4
ADDRLP4 1596
INDIRI4
CNSTI4 0
NEI4 $154
ADDRLP4 1588
CNSTI4 1
ASGNI4
ADDRGP4 $155
JUMPV
LABELV $154
ADDRLP4 1588
CNSTI4 0
ASGNI4
LABELV $155
ADDRLP4 528
ADDRLP4 1588
INDIRI4
ASGNI4
line 254
;254:	}
LABELV $130
line 256
;255:
;256:	i_r = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 258
;257:	while (forcePowers[i] && forcePowers[i] != '-')
;258:	{
line 259
;259:		readBuf[i_r] = forcePowers[i];
ADDRLP4 4
INDIRI4
ADDRLP4 264
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
ASGNI1
line 260
;260:		i_r++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 261
;261:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 262
;262:	}
LABELV $157
line 257
ADDRLP4 1588
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1588
INDIRI4
CNSTI4 0
EQI4 $159
ADDRLP4 1588
INDIRI4
CNSTI4 45
NEI4 $156
LABELV $159
line 263
;263:	readBuf[i_r] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 264
ADDP4
CNSTI1 0
ASGNI1
line 265
;264:	//THE RANK
;265:	ent->client->ps.fd.forceRank = atoi(readBuf);
ADDRLP4 264
ARGP4
ADDRLP4 1592
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1192
ADDP4
ADDRLP4 1592
INDIRI4
ASGNI4
line 266
;266:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 268
;267:
;268:	i_r = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $161
JUMPV
LABELV $160
line 270
;269:	while (forcePowers[i] && forcePowers[i] != '-')
;270:	{
line 271
;271:		readBuf[i_r] = forcePowers[i];
ADDRLP4 4
INDIRI4
ADDRLP4 264
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
ASGNI1
line 272
;272:		i_r++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 273
;273:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 274
;274:	}
LABELV $161
line 269
ADDRLP4 1596
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1596
INDIRI4
CNSTI4 0
EQI4 $163
ADDRLP4 1596
INDIRI4
CNSTI4 45
NEI4 $160
LABELV $163
line 275
;275:	readBuf[i_r] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 264
ADDP4
CNSTI1 0
ASGNI1
line 277
;276:	//THE SIDE
;277:	ent->client->ps.fd.forceSide = atoi(readBuf);
ADDRLP4 264
ARGP4
ADDRLP4 1600
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
ADDRLP4 1600
INDIRI4
ASGNI4
line 278
;278:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 280
;279:
;280:	i_r = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $165
JUMPV
LABELV $164
line 283
;281:	while (forcePowers[i] && forcePowers[i] != '\n' &&
;282:		i_r < NUM_FORCE_POWERS)
;283:	{
line 284
;284:		readBuf[0] = forcePowers[i];
ADDRLP4 264
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
ASGNI1
line 285
;285:		readBuf[1] = 0;
ADDRLP4 264+1
CNSTI1 0
ASGNI1
line 287
;286:
;287:		ent->client->ps.fd.forcePowerLevel[i_r] = atoi(readBuf);
ADDRLP4 264
ARGP4
ADDRLP4 1604
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1604
INDIRI4
ASGNI4
line 288
;288:		if (ent->client->ps.fd.forcePowerLevel[i_r])
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $168
line 289
;289:		{
line 290
;290:			ent->client->ps.fd.forcePowersKnown |= (1 << i_r);
ADDRLP4 1608
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1608
INDIRP4
ADDRLP4 1608
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 291
;291:		}
ADDRGP4 $169
JUMPV
LABELV $168
line 293
;292:		else
;293:		{
line 294
;294:			ent->client->ps.fd.forcePowersKnown &= ~(1 << i_r);
ADDRLP4 1608
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1608
INDIRP4
ADDRLP4 1608
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 295
;295:		}
LABELV $169
line 296
;296:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 297
;297:		i_r++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 298
;298:	}
LABELV $165
line 281
ADDRLP4 1604
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1604
INDIRI4
CNSTI4 0
EQI4 $171
ADDRLP4 1604
INDIRI4
CNSTI4 10
EQI4 $171
ADDRLP4 4
INDIRI4
CNSTI4 18
LTI4 $164
LABELV $171
line 301
;299:	//THE POWERS
;300:
;301:	if (HasSetSaberOnly())
ADDRLP4 1608
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 1608
INDIRI4
CNSTI4 0
EQI4 $172
line 302
;302:	{
line 303
;303:		gentity_t *te = G_TempEntity( vec3_origin, EV_SET_FREE_SABER );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 93
ARGI4
ADDRLP4 1616
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1612
ADDRLP4 1616
INDIRP4
ASGNP4
line 304
;304:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1620
ADDRLP4 1612
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1620
INDIRP4
ADDRLP4 1620
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 305
;305:		te->s.eventParm = 1;
ADDRLP4 1612
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 306
;306:	}
ADDRGP4 $173
JUMPV
LABELV $172
line 308
;307:	else
;308:	{
line 309
;309:		gentity_t *te = G_TempEntity( vec3_origin, EV_SET_FREE_SABER );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 93
ARGI4
ADDRLP4 1616
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1612
ADDRLP4 1616
INDIRP4
ASGNP4
line 310
;310:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1620
ADDRLP4 1612
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1620
INDIRP4
ADDRLP4 1620
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 311
;311:		te->s.eventParm = 0;
ADDRLP4 1612
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 312
;312:	}
LABELV $173
line 314
;313:
;314:	if (g_forcePowerDisable.integer)
ADDRGP4 g_forcePowerDisable+12
INDIRI4
CNSTI4 0
EQI4 $174
line 315
;315:	{
line 316
;316:		gentity_t *te = G_TempEntity( vec3_origin, EV_SET_FORCE_DISABLE );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 1616
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1612
ADDRLP4 1616
INDIRP4
ASGNP4
line 317
;317:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1620
ADDRLP4 1612
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1620
INDIRP4
ADDRLP4 1620
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 318
;318:		te->s.eventParm = 1;
ADDRLP4 1612
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 319
;319:	}
ADDRGP4 $175
JUMPV
LABELV $174
line 321
;320:	else
;321:	{
line 322
;322:		gentity_t *te = G_TempEntity( vec3_origin, EV_SET_FORCE_DISABLE );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 1616
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1612
ADDRLP4 1616
INDIRP4
ASGNP4
line 323
;323:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1620
ADDRLP4 1612
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1620
INDIRP4
ADDRLP4 1620
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 324
;324:		te->s.eventParm = 0;
ADDRLP4 1612
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 325
;325:	}
LABELV $175
line 329
;326:
;327:	//rww - It seems we currently want to always do this, even if the player isn't exceeding the max
;328:	//rank, so..
;329:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $177
line 330
;330:	{ //totally messes duel up to force someone into spec mode, and besides, each "round" is
line 332
;331:	  //counted as a full restart
;332:		ent->client->sess.setForce = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 1
ASGNI4
line 333
;333:	}
LABELV $177
line 335
;334:
;335:	if (warnClient || !ent->client->sess.setForce)
ADDRLP4 1612
CNSTI4 0
ASGNI4
ADDRLP4 528
INDIRI4
ADDRLP4 1612
INDIRI4
NEI4 $182
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
ADDRLP4 1612
INDIRI4
NEI4 $180
LABELV $182
line 336
;336:	{ //the client's rank is too high for the server and has been autocapped, so tell them
line 337
;337:		if (g_gametype.integer != GT_HOLOCRON && g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $183
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $183
line 338
;338:		{
line 347
;339:#ifdef EVENT_FORCE_RANK
;340:			gentity_t *te = G_TempEntity( vec3_origin, EV_GIVE_NEW_RANK );
;341:
;342:			te->r.svFlags |= SVF_BROADCAST;
;343:			te->s.trickedentindex = ent->s.number;
;344:			te->s.eventParm = maxRank;
;345:			te->s.bolt1 = 0;
;346:#endif
;347:			didEvent = qtrue;
ADDRLP4 1556
CNSTI4 1
ASGNI4
line 349
;348:
;349:			if (!(ent->r.svFlags & SVF_BOT) && g_gametype.integer != GT_TOURNAMENT)
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $187
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $187
line 350
;350:			{
line 351
;351:				if (g_gametype.integer < GT_TEAM || !g_teamAutoJoin.integer)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $194
ADDRGP4 g_teamAutoJoin+12
INDIRI4
CNSTI4 0
NEI4 $190
LABELV $194
line 352
;352:				{
line 354
;353:					//Make them a spectator so they can set their powerups up without being bothered.
;354:					ent->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 3
ASGNI4
line 355
;355:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 356
;356:					ent->client->sess.spectatorClient = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 0
ASGNI4
line 358
;357:
;358:					ent->client->pers.teamState.state = TEAM_BEGIN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 0
ASGNI4
line 359
;359:				}
LABELV $190
line 360
;360:			}
LABELV $187
line 367
;361:
;362:#ifdef EVENT_FORCE_RANK
;363:			te->s.bolt2 = ent->client->sess.sessionTeam;
;364:#else
;365:			//Event isn't very reliable, I made it a string. This way I can send it to just one
;366:			//client also, as opposed to making a broadcast event.
;367:			trap_SendServerCommand(ent->s.number, va("nfr %i %i %i", maxRank, 1, ent->client->sess.sessionTeam));
ADDRGP4 $195
ARGP4
ADDRLP4 520
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 1616
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1616
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 370
;368:			//Arg1 is new max rank, arg2 is non-0 if force menu should be shown, arg3 is the current team
;369:#endif
;370:		}
LABELV $183
line 371
;371:		ent->client->sess.setForce = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 1
ASGNI4
line 372
;372:	}
LABELV $180
line 374
;373:
;374:	if (!didEvent)
ADDRLP4 1556
INDIRI4
CNSTI4 0
NEI4 $196
line 375
;375:	{
line 385
;376:#ifdef EVENT_FORCE_RANK
;377:		gentity_t *te = G_TempEntity( vec3_origin, EV_GIVE_NEW_RANK );
;378:
;379:		te->r.svFlags |= SVF_BROADCAST;
;380:		te->s.trickedentindex = ent->s.number;
;381:		te->s.eventParm = maxRank;
;382:		te->s.bolt1 = 1;
;383:		te->s.bolt2 = ent->client->sess.sessionTeam;
;384:#else
;385:		trap_SendServerCommand(ent->s.number, va("nfr %i %i %i", maxRank, 0, ent->client->sess.sessionTeam));
ADDRGP4 $195
ARGP4
ADDRLP4 520
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 1616
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1616
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 387
;386:#endif
;387:	}
LABELV $196
line 389
;388:
;389:	if (warnClientLimit)
ADDRLP4 1560
INDIRI4
CNSTI4 0
EQI4 $198
line 390
;390:	{ //the server has one or more force powers disabled and the client is using them in his config
line 392
;391:		//trap_SendServerCommand(ent-g_entities, va("print \"The server has one or more force powers that you have chosen disabled.\nYou will not be able to use the disable force power(s) while playing on this server.\n\""));
;392:	}
LABELV $198
line 394
;393:
;394:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $201
JUMPV
LABELV $200
line 396
;395:	while (i < NUM_FORCE_POWERS)
;396:	{
line 397
;397:		if ((ent->client->ps.fd.forcePowersKnown & (1 << i)) &&
ADDRLP4 1616
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1624
CNSTI4 0
ASGNI4
ADDRLP4 1616
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 1624
INDIRI4
EQI4 $203
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1616
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ADDRLP4 1624
INDIRI4
NEI4 $203
line 399
;398:			!ent->client->ps.fd.forcePowerLevel[i])
;399:		{ //err..
line 400
;400:			ent->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 1628
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1628
INDIRP4
ADDRLP4 1628
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 401
;401:		}
ADDRGP4 $204
JUMPV
LABELV $203
line 403
;402:		else
;403:		{
line 404
;404:			if (i != FP_LEVITATION && i != FP_SABERATTACK && i != FP_SABERDEFEND && i != FP_SABERTHROW)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $205
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $205
ADDRLP4 0
INDIRI4
CNSTI4 16
EQI4 $205
ADDRLP4 0
INDIRI4
CNSTI4 17
EQI4 $205
line 405
;405:			{
line 406
;406:				lastFPKnown = i;
ADDRLP4 524
ADDRLP4 0
INDIRI4
ASGNI4
line 407
;407:			}
LABELV $205
line 408
;408:		}
LABELV $204
line 410
;409:
;410:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 411
;411:	}
LABELV $201
line 395
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $200
line 413
;412:
;413:	if (ent->client->ps.fd.forcePowersKnown & ent->client->sess.selectedFP)
ADDRLP4 1616
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1616
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDRLP4 1616
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $207
line 414
;414:	{
line 415
;415:		ent->client->ps.fd.forcePowerSelected = ent->client->sess.selectedFP;
ADDRLP4 1620
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1620
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 1620
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ASGNI4
line 416
;416:	}
LABELV $207
line 418
;417:
;418:	if (!(ent->client->ps.fd.forcePowersKnown & (1 << ent->client->ps.fd.forcePowerSelected)))
ADDRLP4 1620
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1620
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 1620
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $214
line 419
;419:	{
line 420
;420:		if (lastFPKnown != -1)
ADDRLP4 524
INDIRI4
CNSTI4 -1
EQI4 $211
line 421
;421:		{
line 422
;422:			ent->client->ps.fd.forcePowerSelected = lastFPKnown;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 524
INDIRI4
ASGNI4
line 423
;423:		}
ADDRGP4 $214
JUMPV
LABELV $211
line 425
;424:		else
;425:		{
line 426
;426:			ent->client->ps.fd.forcePowerSelected = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 427
;427:		}
line 428
;428:	}
ADDRGP4 $214
JUMPV
LABELV $213
line 431
;429:
;430:	while (i < NUM_FORCE_POWERS)
;431:	{
line 432
;432:		ent->client->ps.fd.forcePowerBaseLevel[i] = ent->client->ps.fd.forcePowerLevel[i];
ADDRLP4 1624
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1628
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1624
INDIRI4
ADDRLP4 1628
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ADDRLP4 1624
INDIRI4
ADDRLP4 1628
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ASGNI4
line 433
;433:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 434
;434:	}
LABELV $214
line 430
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $213
line 435
;435:	ent->client->ps.fd.forceUsingAdded = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 0
ASGNI4
line 436
;436:}
LABELV $94
endproc WP_InitForcePowers 1632 24
export WP_SpawnInitForcePowers
proc WP_SpawnInitForcePowers 28 8
line 439
;437:
;438:void WP_SpawnInitForcePowers( gentity_t *ent )
;439:{
line 440
;440:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 442
;441:
;442:	ent->client->ps.saberAttackChainCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1308
ADDP4
CNSTI4 0
ASGNI4
line 444
;443:
;444:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $218
JUMPV
LABELV $217
line 447
;445:
;446:	while (i < NUM_FORCE_POWERS)
;447:	{
line 448
;448:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $220
line 449
;449:		{
line 450
;450:			WP_ForcePowerStop(ent, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 451
;451:		}
LABELV $220
line 453
;452:
;453:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 454
;454:	}
LABELV $218
line 446
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $217
line 456
;455:
;456:	ent->client->ps.fd.forceDeactivateAll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1196
ADDP4
CNSTI4 0
ASGNI4
line 458
;457:
;458:	ent->client->ps.fd.forcePower = ent->client->ps.fd.forcePowerMax = FORCE_POWER_MAX;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 100
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 936
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 932
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 459
;459:	ent->client->ps.fd.forcePowerRegenDebounceTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 940
ADDP4
CNSTI4 0
ASGNI4
line 460
;460:	ent->client->ps.fd.forceGripEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1023
ASGNI4
line 461
;461:	ent->client->ps.fd.forceMindtrickTargetIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1156
ADDP4
CNSTI4 0
ASGNI4
line 462
;462:	ent->client->ps.fd.forceMindtrickTargetIndex2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1160
ADDP4
CNSTI4 0
ASGNI4
line 463
;463:	ent->client->ps.fd.forceMindtrickTargetIndex3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1164
ADDP4
CNSTI4 0
ASGNI4
line 464
;464:	ent->client->ps.fd.forceMindtrickTargetIndex4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1168
ADDP4
CNSTI4 0
ASGNI4
line 466
;465:
;466:	ent->client->ps.holocronBits = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 0
ASGNI4
line 468
;467:
;468:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $223
JUMPV
LABELV $222
line 470
;469:	while (i < NUM_FORCE_POWERS)
;470:	{
line 471
;471:		ent->client->ps.holocronsCarried[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 472
;472:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 473
;473:	}
LABELV $223
line 469
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $222
line 475
;474:
;475:	if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $225
line 476
;476:	{
line 477
;477:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $229
JUMPV
LABELV $228
line 479
;478:		while (i < NUM_FORCE_POWERS)
;479:		{
line 480
;480:			ent->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 481
;481:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 482
;482:		}
LABELV $229
line 478
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $228
line 484
;483:
;484:		if (HasSetSaberOnly())
ADDRLP4 12
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $231
line 485
;485:		{
line 486
;486:			if (ent->client->ps.fd.forcePowerLevel[FP_SABERATTACK] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1
GEI4 $233
line 487
;487:			{
line 488
;488:				ent->client->ps.fd.forcePowerLevel[FP_SABERATTACK] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
CNSTI4 1
ASGNI4
line 489
;489:			}
LABELV $233
line 490
;490:			if (ent->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 1
GEI4 $235
line 491
;491:			{
line 492
;492:				ent->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 1
ASGNI4
line 493
;493:			}
LABELV $235
line 494
;494:		}
LABELV $231
line 495
;495:	}
LABELV $225
line 497
;496:
;497:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $238
JUMPV
LABELV $237
line 500
;498:
;499:	while (i < NUM_FORCE_POWERS)
;500:	{
line 501
;501:		ent->client->ps.fd.forcePowerDebounce[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 502
;502:		ent->client->ps.fd.forcePowerDuration[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 504
;503:
;504:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 505
;505:	}
LABELV $238
line 499
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $237
line 507
;506:
;507:	ent->client->ps.fd.forcePowerRegenDebounceTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 940
ADDP4
CNSTI4 0
ASGNI4
line 508
;508:	ent->client->ps.fd.forceJumpZStart = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1092
ADDP4
CNSTF4 0
ASGNF4
line 509
;509:	ent->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 510
;510:	ent->client->ps.fd.forceJumpSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 0
ASGNI4
line 511
;511:	ent->client->ps.fd.forceGripDamageDebounceTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 0
ASGNI4
line 512
;512:	ent->client->ps.fd.forceGripBeingGripped = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
CNSTF4 0
ASGNF4
line 513
;513:	ent->client->ps.fd.forceGripCripple = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 0
ASGNI4
line 514
;514:	ent->client->ps.fd.forceGripUseTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1124
ADDP4
CNSTI4 0
ASGNI4
line 515
;515:	ent->client->ps.fd.forceGripSoundTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1128
ADDP4
CNSTF4 0
ASGNF4
line 516
;516:	ent->client->ps.fd.forceGripStarted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
CNSTF4 0
ASGNF4
line 517
;517:	ent->client->ps.fd.forceSpeedSmash = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 0
ASGNF4
line 518
;518:	ent->client->ps.fd.forceSpeedDoDamage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
CNSTF4 0
ASGNF4
line 519
;519:	ent->client->ps.fd.forceSpeedHitIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1144
ADDP4
CNSTI4 0
ASGNI4
line 520
;520:	ent->client->ps.fd.forceHealTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1148
ADDP4
CNSTI4 0
ASGNI4
line 521
;521:	ent->client->ps.fd.forceHealAmount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
CNSTI4 0
ASGNI4
line 522
;522:	ent->client->ps.fd.forceRageRecoveryTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1172
ADDP4
CNSTI4 0
ASGNI4
line 523
;523:	ent->client->ps.fd.forceDrainEntNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1176
ADDP4
CNSTI4 1023
ASGNI4
line 524
;524:	ent->client->ps.fd.forceDrainTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1180
ADDP4
CNSTF4 0
ASGNF4
line 526
;525:
;526:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $241
JUMPV
LABELV $240
line 528
;527:	while (i < NUM_FORCE_POWERS)
;528:	{
line 529
;529:		if ((ent->client->ps.fd.forcePowersKnown & (1 << i)) &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $243
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $243
line 531
;530:			!ent->client->ps.fd.forcePowerLevel[i])
;531:		{ //err..
line 532
;532:			ent->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 533
;533:		}
LABELV $243
line 535
;534:
;535:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 536
;536:	}
LABELV $241
line 527
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $240
line 537
;537:}
LABELV $216
endproc WP_SpawnInitForcePowers 28 8
export ForcePowerUsableOn
proc ForcePowerUsableOn 68 16
line 540
;538:
;539:int ForcePowerUsableOn(gentity_t *attacker, gentity_t *other, forcePowers_t forcePower)
;540:{
line 541
;541:	if (other && other->client && other->client->ps.usingATST)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $246
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $246
ADDRLP4 8
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $246
line 542
;542:	{
line 543
;543:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $245
JUMPV
LABELV $246
line 546
;544:	}
;545:
;546:	if (other && other->client && BG_HasYsalamiri(g_gametype.integer, &other->client->ps))
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $248
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $248
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $248
line 547
;547:	{
line 548
;548:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $245
JUMPV
LABELV $248
line 551
;549:	}
;550:
;551:	if (attacker && attacker->client && !BG_CanUseFPNow(g_gametype.integer, &attacker->client->ps, level.time, forcePower))
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $251
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $251
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $251
line 552
;552:	{
line 553
;553:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $245
JUMPV
LABELV $251
line 557
;554:	}
;555:
;556:	//Dueling fighters cannot use force powers on others, with the exception of force push when locked with each other
;557:	if (attacker && attacker->client && attacker->client->ps.duelInProgress)
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $255
ADDRLP4 52
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $255
ADDRLP4 52
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $255
line 558
;558:	{
line 559
;559:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $245
JUMPV
LABELV $255
line 562
;560:	}
;561:
;562:	if (other && other->client && other->client->ps.duelInProgress)
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTU4 0
ASGNU4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $257
ADDRLP4 64
ADDRLP4 56
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $257
ADDRLP4 64
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $257
line 563
;563:	{
line 564
;564:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $245
JUMPV
LABELV $257
line 567
;565:	}
;566:
;567:	return 1;
CNSTI4 1
RETI4
LABELV $245
endproc ForcePowerUsableOn 68 16
export WP_ForcePowerAvailable
proc WP_ForcePowerAvailable 8 0
line 571
;568:}
;569:
;570:qboolean WP_ForcePowerAvailable( gentity_t *self, forcePowers_t forcePower )
;571:{
line 572
;572:	int	drain = forcePowerNeeded[self->client->ps.fd.forcePowerLevel[forcePower]][forcePower];
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 72
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
ADDP4
ADDP4
INDIRI4
ASGNI4
line 574
;573:
;574:	if (self->client->ps.fd.forcePowersActive & (1 << forcePower))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $260
line 575
;575:	{ //we're probably going to deactivate it..
line 576
;576:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $259
JUMPV
LABELV $260
line 579
;577:	}
;578:
;579:	if ( forcePower == FP_LEVITATION )
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $262
line 580
;580:	{
line 581
;581:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $259
JUMPV
LABELV $262
line 583
;582:	}
;583:	if ( !drain )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $264
line 584
;584:	{
line 585
;585:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $259
JUMPV
LABELV $264
line 587
;586:	}
;587:	if ( self->client->ps.fd.forcePower < drain )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $266
line 588
;588:	{
line 589
;589:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $259
JUMPV
LABELV $266
line 591
;590:	}
;591:	return qtrue;
CNSTI4 1
RETI4
LABELV $259
endproc WP_ForcePowerAvailable 8 0
export WP_ForcePowerInUse
proc WP_ForcePowerInUse 0 0
line 595
;592:}
;593:
;594:qboolean WP_ForcePowerInUse( gentity_t *self, forcePowers_t forcePower )
;595:{
line 596
;596:	if ( (self->client->ps.fd.forcePowersActive & ( 1 << forcePower )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $269
line 597
;597:	{//already using this power
line 598
;598:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $268
JUMPV
LABELV $269
line 601
;599:	}
;600:
;601:	return qfalse;
CNSTI4 0
RETI4
LABELV $268
endproc WP_ForcePowerInUse 0 0
export WP_ForcePowerUsable
proc WP_ForcePowerUsable 24 16
line 605
;602:}
;603:
;604:qboolean WP_ForcePowerUsable( gentity_t *self, forcePowers_t forcePower )
;605:{
line 606
;606:	if (BG_HasYsalamiri(g_gametype.integer, &self->client->ps))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $272
line 607
;607:	{
line 608
;608:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $272
line 611
;609:	}
;610:
;611:	if (self->health <= 0 || self->client->ps.stats[STAT_HEALTH] <= 0 ||
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $278
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $278
ADDRLP4 12
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $275
LABELV $278
line 613
;612:		(self->client->ps.eFlags & EF_DEAD))
;613:	{
line 614
;614:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $275
line 617
;615:	}
;616:
;617:	if (self->client->ps.pm_flags & PMF_FOLLOW)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $279
line 618
;618:	{ //specs can't use powers through people
line 619
;619:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $279
line 621
;620:	}
;621:	if (self->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $281
line 622
;622:	{
line 623
;623:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $281
line 626
;624:	}
;625:
;626:	if (!BG_CanUseFPNow(g_gametype.integer, &self->client->ps, level.time, forcePower))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $283
line 627
;627:	{
line 628
;628:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $283
line 631
;629:	}
;630:
;631:	if ( !(self->client->ps.fd.forcePowersKnown & ( 1 << forcePower )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $287
line 632
;632:	{//don't know this power
line 633
;633:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $287
line 636
;634:	}
;635:	
;636:	if ( (self->client->ps.fd.forcePowersActive & ( 1 << forcePower )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $289
line 637
;637:	{//already using this power
line 638
;638:		if (forcePower != FP_LEVITATION)
ADDRFP4 4
INDIRI4
CNSTI4 1
EQI4 $291
line 639
;639:		{
line 640
;640:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $291
line 642
;641:		}
;642:	}
LABELV $289
line 644
;643:
;644:	if (forcePower == FP_LEVITATION && self->client->fjDidJump)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $293
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1796
ADDP4
INDIRI4
CNSTI4 0
EQI4 $293
line 645
;645:	{
line 646
;646:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $293
line 649
;647:	}
;648:
;649:	if (!self->client->ps.fd.forcePowerLevel[forcePower])
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $295
line 650
;650:	{
line 651
;651:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $295
line 654
;652:	}
;653:
;654:	return WP_ForcePowerAvailable( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
LABELV $271
endproc WP_ForcePowerUsable 24 16
export WP_AbsorbConversion
proc WP_AbsorbConversion 28 8
line 658
;655:}
;656:
;657:int WP_AbsorbConversion(gentity_t *attacked, int atdAbsLevel, gentity_t *attacker, int atPower, int atPowerLevel, int atForceSpent)
;658:{
line 659
;659:	int getLevel = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 660
;660:	int addTot = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 663
;661:	gentity_t *abSound;
;662:
;663:	if (atPower != FP_LIGHTNING &&
ADDRLP4 12
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 7
EQI4 $298
ADDRLP4 12
INDIRI4
CNSTI4 13
EQI4 $298
ADDRLP4 12
INDIRI4
CNSTI4 6
EQI4 $298
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $298
ADDRLP4 12
INDIRI4
CNSTI4 4
EQI4 $298
line 668
;664:		atPower != FP_DRAIN &&
;665:		atPower != FP_GRIP &&
;666:		atPower != FP_PUSH &&
;667:		atPower != FP_PULL)
;668:	{ //Only these powers can be absorbed
line 669
;669:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $297
JUMPV
LABELV $298
line 672
;670:	}
;671:
;672:	if (!atdAbsLevel)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $300
line 673
;673:	{ //looks like attacker doesn't have any absorb power
line 674
;674:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $297
JUMPV
LABELV $300
line 677
;675:	}
;676:
;677:	if (!(attacked->client->ps.fd.forcePowersActive & (1 << FP_ABSORB)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $302
line 678
;678:	{ //absorb is not active
line 679
;679:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $297
JUMPV
LABELV $302
line 683
;680:	}
;681:
;682:	//Subtract absorb power level from the offensive force power
;683:	getLevel = atPowerLevel;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 684
;684:	getLevel -= atdAbsLevel;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
SUBI4
ASGNI4
line 686
;685:
;686:	if (getLevel < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $304
line 687
;687:	{
line 688
;688:		getLevel = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 689
;689:	}
LABELV $304
line 692
;690:
;691:	//let the attacker absorb an amount of force used in this attack based on his level of absorb
;692:	addTot = (atForceSpent/3)*attacked->client->ps.fd.forcePowerLevel[FP_ABSORB];
ADDRLP4 4
ADDRFP4 20
INDIRI4
CNSTI4 3
DIVI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
MULI4
ASGNI4
line 694
;693:
;694:	if (addTot < 1 && atForceSpent >= 1)
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $306
ADDRFP4 20
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $306
line 695
;695:	{
line 696
;696:		addTot = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 697
;697:	}
LABELV $306
line 698
;698:	attacked->client->ps.fd.forcePower += addTot;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 699
;699:	if (attacked->client->ps.fd.forcePower > 100)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
LEI4 $308
line 700
;700:	{
line 701
;701:		attacked->client->ps.fd.forcePower = 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 100
ASGNI4
line 702
;702:	}
LABELV $308
line 705
;703:
;704:	//play sound indicating that attack was absorbed
;705:	if (attacked->client->forcePowerSoundDebounce < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $310
line 706
;706:	{
line 707
;707:		abSound = G_PreDefSound(attacked->client->ps.origin, PDSOUND_ABSORBHIT);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 24
ADDRGP4 G_PreDefSound
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 708
;708:		abSound->s.trickedentindex = attacked->s.number;
ADDRLP4 8
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 710
;709:
;710:		attacked->client->forcePowerSoundDebounce = level.time + 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1792
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 711
;711:	}
LABELV $310
line 713
;712:
;713:	return getLevel;
ADDRLP4 0
INDIRI4
RETI4
LABELV $297
endproc WP_AbsorbConversion 28 8
export WP_ForcePowerRegenerate
proc WP_ForcePowerRegenerate 8 0
line 717
;714:}
;715:
;716:void WP_ForcePowerRegenerate( gentity_t *self, int overrideAmt )
;717:{ //called on a regular interval to regenerate force power.
line 718
;718:	if ( !self->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $315
line 719
;719:	{
line 720
;720:		return;
ADDRGP4 $314
JUMPV
LABELV $315
line 723
;721:	}
;722:
;723:	if ( overrideAmt )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $317
line 724
;724:	{ //custom regen amount
line 725
;725:		self->client->ps.fd.forcePower += overrideAmt;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 726
;726:	}
ADDRGP4 $318
JUMPV
LABELV $317
line 728
;727:	else
;728:	{ //otherwise, just 1
line 729
;729:		self->client->ps.fd.forcePower++;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 730
;730:	}
LABELV $318
line 732
;731:
;732:	if ( self->client->ps.fd.forcePower > self->client->ps.fd.forcePowerMax )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRI4
LEI4 $319
line 733
;733:	{ //cap it off at the max (default 100)
line 734
;734:		self->client->ps.fd.forcePower = self->client->ps.fd.forcePowerMax;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 932
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 936
ADDP4
INDIRI4
ASGNI4
line 735
;735:	}
LABELV $319
line 736
;736:}
LABELV $314
endproc WP_ForcePowerRegenerate 8 0
export WP_ForcePowerStart
proc WP_ForcePowerStart 80 12
line 739
;737:
;738:void WP_ForcePowerStart( gentity_t *self, forcePowers_t forcePower, int overrideAmt )
;739:{ //activate the given force power
line 740
;740:	int	duration = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 741
;741:	qboolean hearable = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 742
;742:	float hearDist = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 744
;743:
;744:	if (!WP_ForcePowerAvailable( self, forcePower ))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $322
line 745
;745:	{
line 746
;746:		return;
ADDRGP4 $321
JUMPV
LABELV $322
line 751
;747:	}
;748:
;749:	//hearable and hearDist are merely for the benefit of bots, and not related to if a sound is actually played.
;750:	//If duration is set, the force power will assume to be timer-based.
;751:	switch( (int)forcePower )
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $325
ADDRLP4 16
INDIRI4
CNSTI4 17
GTI4 $325
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $372
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $372
address $327
address $328
address $329
address $338
address $339
address $340
address $347
address $349
address $350
address $357
address $358
address $359
address $360
address $361
address $362
address $325
address $325
address $325
code
line 752
;752:	{
LABELV $327
line 754
;753:	case FP_HEAL:
;754:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 755
;755:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 756
;756:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 757
;757:		break;
ADDRGP4 $325
JUMPV
LABELV $328
line 759
;758:	case FP_LEVITATION:
;759:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 760
;760:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 761
;761:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 762
;762:		break;
ADDRGP4 $325
JUMPV
LABELV $329
line 764
;763:	case FP_SPEED:
;764:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 765
;765:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 766
;766:		if (self->client->ps.fd.forcePowerLevel[FP_SPEED] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 1
NEI4 $330
line 767
;767:		{
line 768
;768:			duration = 10000;
ADDRLP4 4
CNSTI4 10000
ASGNI4
line 769
;769:		}
ADDRGP4 $331
JUMPV
LABELV $330
line 770
;770:		else if (self->client->ps.fd.forcePowerLevel[FP_SPEED] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 2
NEI4 $332
line 771
;771:		{
line 772
;772:			duration = 15000;
ADDRLP4 4
CNSTI4 15000
ASGNI4
line 773
;773:		}
ADDRGP4 $333
JUMPV
LABELV $332
line 774
;774:		else if (self->client->ps.fd.forcePowerLevel[FP_SPEED] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 3
NEI4 $325
line 775
;775:		{
line 776
;776:			duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 777
;777:		}
line 779
;778:		else //shouldn't get here
;779:		{
line 780
;780:			break;
LABELV $335
LABELV $333
LABELV $331
line 783
;781:		}
;782:
;783:		if (overrideAmt)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $336
line 784
;784:		{
line 785
;785:			duration = overrideAmt;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
line 786
;786:		}
LABELV $336
line 788
;787:
;788:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 789
;789:		break;
ADDRGP4 $325
JUMPV
LABELV $338
line 791
;790:	case FP_PUSH:
;791:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 792
;792:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 793
;793:		break;
ADDRGP4 $325
JUMPV
LABELV $339
line 795
;794:	case FP_PULL:
;795:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 796
;796:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 797
;797:		break;
ADDRGP4 $325
JUMPV
LABELV $340
line 799
;798:	case FP_TELEPATHY:
;799:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 800
;800:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 801
;801:		if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 1
NEI4 $341
line 802
;802:		{
line 803
;803:			duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 804
;804:		}
ADDRGP4 $342
JUMPV
LABELV $341
line 805
;805:		else if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 2
NEI4 $343
line 806
;806:		{
line 807
;807:			duration = 25000;
ADDRLP4 4
CNSTI4 25000
ASGNI4
line 808
;808:		}
ADDRGP4 $344
JUMPV
LABELV $343
line 809
;809:		else if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 3
NEI4 $325
line 810
;810:		{
line 811
;811:			duration = 30000;
ADDRLP4 4
CNSTI4 30000
ASGNI4
line 812
;812:		}
line 814
;813:		else //shouldn't get here
;814:		{
line 815
;815:			break;
LABELV $346
LABELV $344
LABELV $342
line 818
;816:		}
;817:
;818:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 819
;819:		break;
ADDRGP4 $325
JUMPV
LABELV $347
line 821
;820:	case FP_GRIP:
;821:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 822
;822:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 823
;823:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 824
;824:		self->client->ps.powerups[PW_DISINT_4] = level.time + 60000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 825
;825:		break;
ADDRGP4 $325
JUMPV
LABELV $349
line 827
;826:	case FP_LIGHTNING:
;827:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 828
;828:		hearDist = 512;
ADDRLP4 8
CNSTF4 1140850688
ASGNF4
line 829
;829:		duration = overrideAmt;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
line 830
;830:		overrideAmt = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 831
;831:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 832
;832:		self->client->ps.activeForcePass = self->client->ps.fd.forcePowerLevel[FP_LIGHTNING];
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
ASGNI4
line 833
;833:		break;
ADDRGP4 $325
JUMPV
LABELV $350
line 835
;834:	case FP_RAGE:
;835:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 836
;836:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 837
;837:		if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 1
NEI4 $351
line 838
;838:		{
line 839
;839:			duration = 8000;
ADDRLP4 4
CNSTI4 8000
ASGNI4
line 840
;840:		}
ADDRGP4 $352
JUMPV
LABELV $351
line 841
;841:		else if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 2
NEI4 $353
line 842
;842:		{
line 843
;843:			duration = 14000;
ADDRLP4 4
CNSTI4 14000
ASGNI4
line 844
;844:		}
ADDRGP4 $354
JUMPV
LABELV $353
line 845
;845:		else if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 3
NEI4 $325
line 846
;846:		{
line 847
;847:			duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 848
;848:		}
line 850
;849:		else //shouldn't get here
;850:		{
line 851
;851:			break;
LABELV $356
LABELV $354
LABELV $352
line 854
;852:		}
;853:
;854:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 855
;855:		break;
ADDRGP4 $325
JUMPV
LABELV $357
line 857
;856:	case FP_PROTECT:
;857:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 858
;858:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 859
;859:		duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 860
;860:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 861
;861:		break;
ADDRGP4 $325
JUMPV
LABELV $358
line 863
;862:	case FP_ABSORB:
;863:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 864
;864:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 865
;865:		duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 866
;866:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 867
;867:		break;
ADDRGP4 $325
JUMPV
LABELV $359
line 869
;868:	case FP_TEAM_HEAL:
;869:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 870
;870:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 871
;871:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 872
;872:		break;
ADDRGP4 $325
JUMPV
LABELV $360
line 874
;873:	case FP_TEAM_FORCE:
;874:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 875
;875:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 876
;876:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 877
;877:		break;
ADDRGP4 $325
JUMPV
LABELV $361
line 879
;878:	case FP_DRAIN:
;879:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 880
;880:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 881
;881:		duration = overrideAmt;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
line 882
;882:		overrideAmt = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 883
;883:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 885
;884:		//self->client->ps.activeForcePass = self->client->ps.fd.forcePowerLevel[FP_DRAIN];
;885:		break;
ADDRGP4 $325
JUMPV
LABELV $362
line 887
;886:	case FP_SEE:
;887:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 888
;888:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 889
;889:		if (self->client->ps.fd.forcePowerLevel[FP_SEE] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 1
NEI4 $363
line 890
;890:		{
line 891
;891:			duration = 10000;
ADDRLP4 4
CNSTI4 10000
ASGNI4
line 892
;892:		}
ADDRGP4 $364
JUMPV
LABELV $363
line 893
;893:		else if (self->client->ps.fd.forcePowerLevel[FP_SEE] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 2
NEI4 $365
line 894
;894:		{
line 895
;895:			duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 896
;896:		}
ADDRGP4 $366
JUMPV
LABELV $365
line 897
;897:		else if (self->client->ps.fd.forcePowerLevel[FP_SEE] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 3
NEI4 $325
line 898
;898:		{
line 899
;899:			duration = 30000;
ADDRLP4 4
CNSTI4 30000
ASGNI4
line 900
;900:		}
line 902
;901:		else //shouldn't get here
;902:		{
line 903
;903:			break;
LABELV $368
LABELV $366
LABELV $364
line 906
;904:		}
;905:
;906:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 907
;907:		break;
line 909
;908:	case FP_SABERATTACK:
;909:		break;
line 911
;910:	case FP_SABERDEFEND:
;911:		break;
line 913
;912:	case FP_SABERTHROW:
;913:		break;
line 915
;914:	default:
;915:		break;
LABELV $325
line 918
;916:	}
;917:
;918:	if ( duration )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $373
line 919
;919:	{
line 920
;920:		self->client->ps.fd.forcePowerDuration[forcePower] = level.time + duration;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 921
;921:	}
ADDRGP4 $374
JUMPV
LABELV $373
line 923
;922:	else
;923:	{
line 924
;924:		self->client->ps.fd.forcePowerDuration[forcePower] = 0;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 925
;925:	}
LABELV $374
line 927
;926:
;927:	if (hearable)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $376
line 928
;928:	{
line 929
;929:		self->client->ps.otherSoundLen = hearDist;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1280
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 930
;930:		self->client->ps.otherSoundTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1276
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 931
;931:	}
LABELV $376
line 933
;932:	
;933:	self->client->ps.fd.forcePowerDebounce[forcePower] = 0;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 935
;934:
;935:	if ((int)forcePower == FP_SPEED && overrideAmt)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $379
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $379
line 936
;936:	{
line 937
;937:		BG_ForcePowerDrain( &self->client->ps, forcePower, overrideAmt*0.025 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTF4 1020054733
ADDRFP4 8
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 938
;938:	}
ADDRGP4 $380
JUMPV
LABELV $379
line 939
;939:	else if ((int)forcePower != FP_GRIP && (int)forcePower != FP_DRAIN)
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 6
EQI4 $381
ADDRLP4 24
INDIRI4
CNSTI4 13
EQI4 $381
line 940
;940:	{ //grip and drain drain as damage is done
line 941
;941:		BG_ForcePowerDrain( &self->client->ps, forcePower, overrideAmt );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 942
;942:	}
LABELV $381
LABELV $380
line 943
;943:}
LABELV $321
endproc WP_ForcePowerStart 80 12
export ForceHeal
proc ForceHeal 20 12
line 946
;944:
;945:void ForceHeal( gentity_t *self )
;946:{
line 947
;947:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $384
line 948
;948:	{
line 949
;949:		return;
ADDRGP4 $383
JUMPV
LABELV $384
line 952
;950:	}
;951:
;952:	if ( !WP_ForcePowerUsable( self, FP_HEAL ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $386
line 953
;953:	{
line 954
;954:		return;
ADDRGP4 $383
JUMPV
LABELV $386
line 957
;955:	}
;956:
;957:	if ( self->health >= self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LTI4 $388
line 958
;958:	{
line 959
;959:		return;
ADDRGP4 $383
JUMPV
LABELV $388
line 962
;960:	}
;961:
;962:	if (self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 3
NEI4 $390
line 963
;963:	{
line 964
;964:		self->health += 25; //This was 50, but that angered the Balance God.
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 966
;965:		
;966:		if (self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $392
line 967
;967:		{
line 968
;968:			self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 969
;969:		}
LABELV $392
line 970
;970:		BG_ForcePowerDrain( &self->client->ps, FP_HEAL, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 408
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
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 971
;971:	}
ADDRGP4 $391
JUMPV
LABELV $390
line 972
;972:	else if (self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 2
NEI4 $394
line 973
;973:	{
line 974
;974:		self->health += 10;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 976
;975:		
;976:		if (self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $396
line 977
;977:		{
line 978
;978:			self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 979
;979:		}
LABELV $396
line 980
;980:		BG_ForcePowerDrain( &self->client->ps, FP_HEAL, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 408
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
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 981
;981:	}
ADDRGP4 $395
JUMPV
LABELV $394
line 983
;982:	else
;983:	{
line 984
;984:		self->health += 5;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 986
;985:		
;986:		if (self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $398
line 987
;987:		{
line 988
;988:			self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 989
;989:		}
LABELV $398
line 990
;990:		BG_ForcePowerDrain( &self->client->ps, FP_HEAL, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 408
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
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 991
;991:	}
LABELV $395
LABELV $391
line 1000
;992:	/*
;993:	else
;994:	{
;995:		WP_ForcePowerStart( self, FP_HEAL, 0 );
;996:	}
;997:	*/
;998:	//NOTE: Decided to make all levels instant.
;999:
;1000:	G_Sound( self, CHAN_ITEM, G_SoundIndex("sound/weapons/force/heal.wav") );
ADDRGP4 $400
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1001
;1001:}
LABELV $383
endproc ForceHeal 20 12
export WP_AddToClientBitflags
proc WP_AddToClientBitflags 4 0
line 1004
;1002:
;1003:void WP_AddToClientBitflags(gentity_t *ent, int entNum)
;1004:{
line 1005
;1005:	if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $402
line 1006
;1006:	{
line 1007
;1007:		return;
ADDRGP4 $401
JUMPV
LABELV $402
line 1010
;1008:	}
;1009:
;1010:	if (entNum > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $404
line 1011
;1011:	{
line 1012
;1012:		ent->s.trickedentindex4 |= (1 << (entNum-48));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 48
SUBI4
LSHI4
BORI4
ASGNI4
line 1013
;1013:	}
ADDRGP4 $405
JUMPV
LABELV $404
line 1014
;1014:	else if (entNum > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $406
line 1015
;1015:	{
line 1016
;1016:		ent->s.trickedentindex3 |= (1 << (entNum-32));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 32
SUBI4
LSHI4
BORI4
ASGNI4
line 1017
;1017:	}
ADDRGP4 $407
JUMPV
LABELV $406
line 1018
;1018:	else if (entNum > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $408
line 1019
;1019:	{
line 1020
;1020:		ent->s.trickedentindex2 |= (1 << (entNum-16));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 16
SUBI4
LSHI4
BORI4
ASGNI4
line 1021
;1021:	}
ADDRGP4 $409
JUMPV
LABELV $408
line 1023
;1022:	else
;1023:	{
line 1024
;1024:		ent->s.trickedentindex |= (1 << entNum);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1025
;1025:	}
LABELV $409
LABELV $407
LABELV $405
line 1026
;1026:}
LABELV $401
endproc WP_AddToClientBitflags 4 0
export ForceTeamHeal
proc ForceTeamHeal 252 12
line 1029
;1027:
;1028:void ForceTeamHeal( gentity_t *self )
;1029:{
line 1030
;1030:	float radius = 256;
ADDRLP4 156
CNSTF4 1132462080
ASGNF4
line 1031
;1031:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1034
;1032:	gentity_t *ent;
;1033:	vec3_t a;
;1034:	int numpl = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 1036
;1035:	int pl[MAX_CLIENTS];
;1036:	int healthadd = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 1037
;1037:	gentity_t *te = NULL;
ADDRLP4 152
CNSTP4 0
ASGNP4
line 1039
;1038:
;1039:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $411
line 1040
;1040:	{
line 1041
;1041:		return;
ADDRGP4 $410
JUMPV
LABELV $411
line 1044
;1042:	}
;1043:
;1044:	if ( !WP_ForcePowerUsable( self, FP_TEAM_HEAL ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRLP4 164
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $413
line 1045
;1045:	{
line 1046
;1046:		return;
ADDRGP4 $410
JUMPV
LABELV $413
line 1049
;1047:	}
;1048:
;1049:	if (self->client->ps.fd.forcePowerLevel[FP_TEAM_HEAL] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 2
NEI4 $415
line 1050
;1050:	{
line 1051
;1051:		radius *= 1.5;
ADDRLP4 156
CNSTF4 1069547520
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 1052
;1052:	}
LABELV $415
line 1053
;1053:	if (self->client->ps.fd.forcePowerLevel[FP_TEAM_HEAL] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 3
NEI4 $420
line 1054
;1054:	{
line 1055
;1055:		radius *= 2;
ADDRLP4 156
CNSTF4 1073741824
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 1056
;1056:	}
ADDRGP4 $420
JUMPV
LABELV $419
line 1059
;1057:
;1058:	while (i < MAX_CLIENTS)
;1059:	{
line 1060
;1060:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1062
;1061:
;1062:		if (ent && ent->client && self != ent && OnSameTeam(self, ent) && ent->client->ps.stats[STAT_HEALTH] < ent->client->ps.stats[STAT_MAX_HEALTH] && ent->client->ps.stats[STAT_HEALTH] > 0 && ForcePowerUsableOn(self, ent, FP_TEAM_HEAL) &&
ADDRLP4 172
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 176
CNSTU4 0
ASGNU4
ADDRLP4 172
INDIRU4
ADDRLP4 176
INDIRU4
EQU4 $422
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $422
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $422
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 188
CNSTI4 0
ASGNI4
ADDRLP4 184
INDIRI4
ADDRLP4 188
INDIRI4
EQI4 $422
ADDRLP4 196
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 200
ADDRLP4 196
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
INDIRI4
ADDRLP4 196
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
GEI4 $422
ADDRLP4 200
INDIRI4
ADDRLP4 188
INDIRI4
LEI4 $422
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRLP4 204
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $422
ADDRLP4 208
CNSTI4 408
ASGNI4
ADDRLP4 212
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
ARGP4
ADDRLP4 216
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $422
line 1064
;1063:			trap_InPVS(self->client->ps.origin, ent->client->ps.origin))
;1064:		{
line 1065
;1065:			VectorSubtract(self->client->ps.origin, ent->client->ps.origin, a);
ADDRLP4 220
CNSTI4 408
ASGNI4
ADDRLP4 224
ADDRFP4 0
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
ASGNP4
ADDRLP4 228
CNSTI4 20
ASGNI4
ADDRLP4 232
ADDRLP4 0
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
ASGNP4
ADDRLP4 136
ADDRLP4 224
INDIRP4
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRF4
ADDRLP4 232
INDIRP4
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 236
CNSTI4 24
ASGNI4
ADDRLP4 136+4
ADDRLP4 224
INDIRP4
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRF4
ADDRLP4 232
INDIRP4
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 240
CNSTI4 408
ASGNI4
ADDRLP4 244
CNSTI4 28
ASGNI4
ADDRLP4 136+8
ADDRFP4 0
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1067
;1066:
;1067:			if (VectorLength(a) <= radius)
ADDRLP4 136
ARGP4
ADDRLP4 248
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 248
INDIRF4
ADDRLP4 156
INDIRF4
GTF4 $426
line 1068
;1068:			{
line 1069
;1069:				pl[numpl] = i;
ADDRLP4 148
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1070
;1070:				numpl++;
ADDRLP4 148
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1071
;1071:			}
LABELV $426
line 1072
;1072:		}
LABELV $422
line 1074
;1073:
;1074:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1075
;1075:	}
LABELV $420
line 1058
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $419
line 1077
;1076:
;1077:	if (numpl < 1)
ADDRLP4 148
INDIRI4
CNSTI4 1
GEI4 $428
line 1078
;1078:	{
line 1079
;1079:		return;
ADDRGP4 $410
JUMPV
LABELV $428
line 1082
;1080:	}
;1081:
;1082:	if (numpl == 1)
ADDRLP4 148
INDIRI4
CNSTI4 1
NEI4 $430
line 1083
;1083:	{
line 1084
;1084:		healthadd = 50;
ADDRLP4 160
CNSTI4 50
ASGNI4
line 1085
;1085:	}
ADDRGP4 $431
JUMPV
LABELV $430
line 1086
;1086:	else if (numpl == 2)
ADDRLP4 148
INDIRI4
CNSTI4 2
NEI4 $432
line 1087
;1087:	{
line 1088
;1088:		healthadd = 33;
ADDRLP4 160
CNSTI4 33
ASGNI4
line 1089
;1089:	}
ADDRGP4 $433
JUMPV
LABELV $432
line 1091
;1090:	else
;1091:	{
line 1092
;1092:		healthadd = 25;
ADDRLP4 160
CNSTI4 25
ASGNI4
line 1093
;1093:	}
LABELV $433
LABELV $431
line 1095
;1094:
;1095:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $435
JUMPV
LABELV $434
line 1098
;1096:
;1097:	while (i < numpl)
;1098:	{
line 1099
;1099:		if (g_entities[pl[i]].client->ps.stats[STAT_HEALTH] > 0 &&
ADDRLP4 168
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
LEI4 $437
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
LEI4 $437
line 1101
;1100:			g_entities[pl[i]].health > 0)
;1101:		{
line 1102
;1102:			g_entities[pl[i]].client->ps.stats[STAT_HEALTH] += healthadd;
ADDRLP4 176
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
ADDRLP4 160
INDIRI4
ADDI4
ASGNI4
line 1103
;1103:			if (g_entities[pl[i]].client->ps.stats[STAT_HEALTH] > g_entities[pl[i]].client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 180
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 180
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 180
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $442
line 1104
;1104:			{
line 1105
;1105:				g_entities[pl[i]].client->ps.stats[STAT_HEALTH] = g_entities[pl[i]].client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 184
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 184
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 184
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1106
;1106:			}
LABELV $442
line 1108
;1107:
;1108:			g_entities[pl[i]].health = g_entities[pl[i]].client->ps.stats[STAT_HEALTH];
ADDRLP4 184
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 184
INDIRI4
ADDRGP4 g_entities+676
ADDP4
ADDRLP4 184
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 1111
;1109:
;1110:			//At this point we know we got one, so add him into the collective event client bitflag
;1111:			if (!te)
ADDRLP4 152
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $450
line 1112
;1112:			{
line 1113
;1113:				te = G_TempEntity( self->client->ps.origin, EV_TEAM_POWER);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 37
ARGI4
ADDRLP4 188
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 188
INDIRP4
ASGNP4
line 1114
;1114:				te->s.eventParm = 1; //eventParm 1 is heal, eventParm 2 is force regen
ADDRLP4 152
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1117
;1115:
;1116:				//since we had an extra check above, do the drain now because we got at least one guy
;1117:				BG_ForcePowerDrain( &self->client->ps, FP_TEAM_HEAL, forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_TEAM_HEAL]][FP_TEAM_HEAL] );
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 72
ADDRLP4 192
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1118
;1118:			}
LABELV $450
line 1120
;1119:
;1120:			WP_AddToClientBitflags(te, pl[i]);
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 WP_AddToClientBitflags
CALLV
pop
line 1122
;1121:			//Now cramming it all into one event.. doing this many g_sound events at once was a Bad Thing.
;1122:		}
LABELV $437
line 1123
;1123:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1124
;1124:	}
LABELV $435
line 1097
ADDRLP4 4
INDIRI4
ADDRLP4 148
INDIRI4
LTI4 $434
line 1125
;1125:}
LABELV $410
endproc ForceTeamHeal 252 12
export ForceTeamForceReplenish
proc ForceTeamForceReplenish 240 12
line 1128
;1126:
;1127:void ForceTeamForceReplenish( gentity_t *self )
;1128:{
line 1129
;1129:	float radius = 256;
ADDRLP4 160
CNSTF4 1132462080
ASGNF4
line 1130
;1130:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1133
;1131:	gentity_t *ent;
;1132:	vec3_t a;
;1133:	int numpl = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 1135
;1134:	int pl[MAX_CLIENTS];
;1135:	int poweradd = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 1136
;1136:	gentity_t *te = NULL;
ADDRLP4 136
CNSTP4 0
ASGNP4
line 1138
;1137:
;1138:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $454
line 1139
;1139:	{
line 1140
;1140:		return;
ADDRGP4 $453
JUMPV
LABELV $454
line 1143
;1141:	}
;1142:
;1143:	if ( !WP_ForcePowerUsable( self, FP_TEAM_FORCE ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 164
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $456
line 1144
;1144:	{
line 1145
;1145:		return;
ADDRGP4 $453
JUMPV
LABELV $456
line 1148
;1146:	}
;1147:
;1148:	if (self->client->ps.fd.forcePowerLevel[FP_TEAM_FORCE] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 2
NEI4 $458
line 1149
;1149:	{
line 1150
;1150:		radius *= 1.5;
ADDRLP4 160
CNSTF4 1069547520
ADDRLP4 160
INDIRF4
MULF4
ASGNF4
line 1151
;1151:	}
LABELV $458
line 1152
;1152:	if (self->client->ps.fd.forcePowerLevel[FP_TEAM_FORCE] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 3
NEI4 $463
line 1153
;1153:	{
line 1154
;1154:		radius *= 2;
ADDRLP4 160
CNSTF4 1073741824
ADDRLP4 160
INDIRF4
MULF4
ASGNF4
line 1155
;1155:	}
ADDRGP4 $463
JUMPV
LABELV $462
line 1158
;1156:
;1157:	while (i < MAX_CLIENTS)
;1158:	{
line 1159
;1159:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1161
;1160:
;1161:		if (ent && ent->client && self != ent && OnSameTeam(self, ent) && ent->client->ps.fd.forcePower < 100 && ForcePowerUsableOn(self, ent, FP_TEAM_FORCE) &&
ADDRLP4 172
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 176
CNSTU4 0
ASGNU4
ADDRLP4 172
INDIRU4
ADDRLP4 176
INDIRU4
EQU4 $465
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $465
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $465
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $465
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
GEI4 $465
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 192
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $465
ADDRLP4 196
CNSTI4 408
ASGNI4
ADDRLP4 200
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 196
INDIRI4
ADDP4
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 196
INDIRI4
ADDP4
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
ARGP4
ADDRLP4 204
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $465
line 1163
;1162:			trap_InPVS(self->client->ps.origin, ent->client->ps.origin))
;1163:		{
line 1164
;1164:			VectorSubtract(self->client->ps.origin, ent->client->ps.origin, a);
ADDRLP4 208
CNSTI4 408
ASGNI4
ADDRLP4 212
ADDRFP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
ASGNP4
ADDRLP4 216
CNSTI4 20
ASGNI4
ADDRLP4 220
ADDRLP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
ASGNP4
ADDRLP4 140
ADDRLP4 212
INDIRP4
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRF4
ADDRLP4 220
INDIRP4
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 224
CNSTI4 24
ASGNI4
ADDRLP4 140+4
ADDRLP4 212
INDIRP4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 220
INDIRP4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 228
CNSTI4 408
ASGNI4
ADDRLP4 232
CNSTI4 28
ASGNI4
ADDRLP4 140+8
ADDRFP4 0
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1166
;1165:
;1166:			if (VectorLength(a) <= radius)
ADDRLP4 140
ARGP4
ADDRLP4 236
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 236
INDIRF4
ADDRLP4 160
INDIRF4
GTF4 $469
line 1167
;1167:			{
line 1168
;1168:				pl[numpl] = i;
ADDRLP4 152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1169
;1169:				numpl++;
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1170
;1170:			}
LABELV $469
line 1171
;1171:		}
LABELV $465
line 1173
;1172:
;1173:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1174
;1174:	}
LABELV $463
line 1157
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $462
line 1176
;1175:
;1176:	if (numpl < 1)
ADDRLP4 152
INDIRI4
CNSTI4 1
GEI4 $471
line 1177
;1177:	{
line 1178
;1178:		return;
ADDRGP4 $453
JUMPV
LABELV $471
line 1181
;1179:	}
;1180:
;1181:	if (numpl == 1)
ADDRLP4 152
INDIRI4
CNSTI4 1
NEI4 $473
line 1182
;1182:	{
line 1183
;1183:		poweradd = 50;
ADDRLP4 156
CNSTI4 50
ASGNI4
line 1184
;1184:	}
ADDRGP4 $474
JUMPV
LABELV $473
line 1185
;1185:	else if (numpl == 2)
ADDRLP4 152
INDIRI4
CNSTI4 2
NEI4 $475
line 1186
;1186:	{
line 1187
;1187:		poweradd = 33;
ADDRLP4 156
CNSTI4 33
ASGNI4
line 1188
;1188:	}
ADDRGP4 $476
JUMPV
LABELV $475
line 1190
;1189:	else
;1190:	{
line 1191
;1191:		poweradd = 25;
ADDRLP4 156
CNSTI4 25
ASGNI4
line 1192
;1192:	}
LABELV $476
LABELV $474
line 1194
;1193:
;1194:	BG_ForcePowerDrain( &self->client->ps, FP_TEAM_FORCE, forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_TEAM_FORCE]][FP_TEAM_FORCE] );
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 72
ADDRLP4 168
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1196
;1195:
;1196:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $479
JUMPV
LABELV $478
line 1199
;1197:
;1198:	while (i < numpl)
;1199:	{
line 1200
;1200:		g_entities[pl[i]].client->ps.fd.forcePower += poweradd;
ADDRLP4 172
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ASGNI4
line 1201
;1201:		if (g_entities[pl[i]].client->ps.fd.forcePower > 100)
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
LEI4 $482
line 1202
;1202:		{
line 1203
;1203:			g_entities[pl[i]].client->ps.fd.forcePower = 100;
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 100
ASGNI4
line 1204
;1204:		}
LABELV $482
line 1207
;1205:
;1206:		//At this point we know we got one, so add him into the collective event client bitflag
;1207:		if (!te)
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $486
line 1208
;1208:		{
line 1209
;1209:			te = G_TempEntity( self->client->ps.origin, EV_TEAM_POWER);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 37
ARGI4
ADDRLP4 176
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 136
ADDRLP4 176
INDIRP4
ASGNP4
line 1210
;1210:			te->s.eventParm = 2; //eventParm 1 is heal, eventParm 2 is force regen
ADDRLP4 136
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 2
ASGNI4
line 1211
;1211:		}
LABELV $486
line 1213
;1212:
;1213:		WP_AddToClientBitflags(te, pl[i]);
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 WP_AddToClientBitflags
CALLV
pop
line 1216
;1214:		//Now cramming it all into one event.. doing this many g_sound events at once was a Bad Thing.
;1215:		
;1216:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1217
;1217:	}
LABELV $479
line 1198
ADDRLP4 4
INDIRI4
ADDRLP4 152
INDIRI4
LTI4 $478
line 1218
;1218:}
LABELV $453
endproc ForceTeamForceReplenish 240 12
export ForceGrip
proc ForceGrip 1144 28
line 1221
;1219:
;1220:void ForceGrip( gentity_t *self )
;1221:{
line 1225
;1222:	trace_t tr;
;1223:	vec3_t tfrom, tto, fwd;
;1224:
;1225:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $489
line 1226
;1226:	{
line 1227
;1227:		return;
ADDRGP4 $488
JUMPV
LABELV $489
line 1230
;1228:	}
;1229:
;1230:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $491
line 1231
;1231:	{
line 1232
;1232:		return;
ADDRGP4 $488
JUMPV
LABELV $491
line 1235
;1233:	}
;1234:
;1235:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $493
line 1236
;1236:	{
line 1237
;1237:		return;
ADDRGP4 $488
JUMPV
LABELV $493
line 1240
;1238:	}
;1239:
;1240:	if (self->client->ps.fd.forceGripUseTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1124
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $495
line 1241
;1241:	{
line 1242
;1242:		return;
ADDRGP4 $488
JUMPV
LABELV $495
line 1245
;1243:	}
;1244:
;1245:	if ( !WP_ForcePowerUsable( self, FP_GRIP ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1116
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $498
line 1246
;1246:	{
line 1247
;1247:		return;
ADDRGP4 $488
JUMPV
LABELV $498
line 1250
;1248:	}
;1249:
;1250:	VectorCopy(self->client->ps.origin, tfrom);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1251
;1251:	tfrom[2] += self->client->ps.viewheight;
ADDRLP4 1080+8
ADDRLP4 1080+8
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
line 1252
;1252:	AngleVectors(self->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1120
CNSTP4 0
ASGNP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1253
;1253:	tto[0] = tfrom[0] + fwd[0]*MAX_GRIP_DISTANCE;
ADDRLP4 1092
ADDRLP4 1080
INDIRF4
CNSTF4 1132462080
ADDRLP4 1104
INDIRF4
MULF4
ADDF4
ASGNF4
line 1254
;1254:	tto[1] = tfrom[1] + fwd[1]*MAX_GRIP_DISTANCE;
ADDRLP4 1092+4
ADDRLP4 1080+4
INDIRF4
CNSTF4 1132462080
ADDRLP4 1104+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1255
;1255:	tto[2] = tfrom[2] + fwd[2]*MAX_GRIP_DISTANCE;
ADDRLP4 1092+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1132462080
ADDRLP4 1104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1257
;1256:
;1257:	trap_Trace(&tr, tfrom, NULL, NULL, tto, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1124
CNSTP4 0
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1259
;1258:
;1259:	if ( tr.fraction != 1.0 &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $507
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $507
ADDRLP4 1128
CNSTI4 828
ASGNI4
ADDRLP4 1128
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $507
ADDRLP4 1128
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 0
NEI4 $507
ADDRLP4 1128
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $507
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1128
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1132
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 1136
CNSTI4 0
ASGNI4
ADDRLP4 1132
INDIRI4
ADDRLP4 1136
INDIRI4
EQI4 $507
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 1136
INDIRI4
NEI4 $521
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
ADDRLP4 1140
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $507
LABELV $521
line 1266
;1260:		tr.entityNum != ENTITYNUM_NONE &&
;1261:		g_entities[tr.entityNum].client &&
;1262:		!g_entities[tr.entityNum].client->ps.fd.forceGripCripple &&
;1263:		g_entities[tr.entityNum].client->ps.fd.forceGripBeingGripped < level.time &&
;1264:		ForcePowerUsableOn(self, &g_entities[tr.entityNum], FP_GRIP) &&
;1265:		(g_friendlyFire.integer || !OnSameTeam(self, &g_entities[tr.entityNum])) ) //don't grip someone who's still crippled
;1266:	{
line 1267
;1267:		self->client->ps.fd.forceGripEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 1268
;1268:		g_entities[tr.entityNum].client->ps.fd.forceGripStarted = level.time;
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 1269
;1269:		self->client->ps.fd.forceGripDamageDebounceTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 0
ASGNI4
line 1271
;1270:
;1271:		self->client->ps.forceHandExtend = HANDEXTEND_FORCEGRIP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 3
ASGNI4
line 1272
;1272:		self->client->ps.forceHandExtendTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1273
;1273:	}
ADDRGP4 $508
JUMPV
LABELV $507
line 1275
;1274:	else
;1275:	{
line 1276
;1276:		self->client->ps.fd.forceGripEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1023
ASGNI4
line 1277
;1277:		return;
LABELV $508
line 1279
;1278:	}
;1279:}
LABELV $488
endproc ForceGrip 1144 28
export ForceSpeed
proc ForceSpeed 12 12
line 1282
;1280:
;1281:void ForceSpeed( gentity_t *self, int forceDuration )
;1282:{
line 1283
;1283:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $528
line 1284
;1284:	{
line 1285
;1285:		return;
ADDRGP4 $527
JUMPV
LABELV $528
line 1288
;1286:	}
;1287:
;1288:	if (self->client->ps.forceAllowDeactivateTime < level.time &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $530
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $530
line 1290
;1289:		(self->client->ps.fd.forcePowersActive & (1 << FP_SPEED)) )
;1290:	{
line 1291
;1291:		WP_ForcePowerStop( self, FP_SPEED );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1292
;1292:		return;
ADDRGP4 $527
JUMPV
LABELV $530
line 1295
;1293:	}
;1294:
;1295:	if ( !WP_ForcePowerUsable( self, FP_SPEED ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $533
line 1296
;1296:	{
line 1297
;1297:		return;
ADDRGP4 $527
JUMPV
LABELV $533
line 1300
;1298:	}
;1299:
;1300:	self->client->ps.forceAllowDeactivateTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1302
;1301:
;1302:	WP_ForcePowerStart( self, FP_SPEED, forceDuration );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1303
;1303:	G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/force/speed.wav") );
ADDRGP4 $536
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1304
;1304:	G_Sound( self, TRACK_CHANNEL_2, speedLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 52
ARGI4
ADDRGP4 speedLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1305
;1305:	self->client->ps.fd.forceSpeedSmash = 2; //initial boost (will automax to whatever is appropriate for force level)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 1073741824
ASGNF4
line 1306
;1306:	self->client->ps.fd.forceSpeedDoDamage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
CNSTF4 0
ASGNF4
line 1307
;1307:}
LABELV $527
endproc ForceSpeed 12 12
export ForceSeeing
proc ForceSeeing 12 12
line 1310
;1308:
;1309:void ForceSeeing( gentity_t *self )
;1310:{
line 1311
;1311:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $538
line 1312
;1312:	{
line 1313
;1313:		return;
ADDRGP4 $537
JUMPV
LABELV $538
line 1316
;1314:	}
;1315:
;1316:	if (self->client->ps.forceAllowDeactivateTime < level.time &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $540
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $540
line 1318
;1317:		(self->client->ps.fd.forcePowersActive & (1 << FP_SEE)) )
;1318:	{
line 1319
;1319:		WP_ForcePowerStop( self, FP_SEE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1320
;1320:		return;
ADDRGP4 $537
JUMPV
LABELV $540
line 1323
;1321:	}
;1322:
;1323:	if ( !WP_ForcePowerUsable( self, FP_SEE ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $543
line 1324
;1324:	{
line 1325
;1325:		return;
ADDRGP4 $537
JUMPV
LABELV $543
line 1328
;1326:	}
;1327:
;1328:	self->client->ps.forceAllowDeactivateTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1330
;1329:
;1330:	WP_ForcePowerStart( self, FP_SEE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1332
;1331:
;1332:	G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/see.wav") );
ADDRGP4 $546
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1333
;1333:	G_Sound( self, TRACK_CHANNEL_5, seeLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 55
ARGI4
ADDRGP4 seeLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1334
;1334:}
LABELV $537
endproc ForceSeeing 12 12
export ForceProtect
proc ForceProtect 8 12
line 1337
;1335:
;1336:void ForceProtect( gentity_t *self )
;1337:{
line 1338
;1338:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $548
line 1339
;1339:	{
line 1340
;1340:		return;
ADDRGP4 $547
JUMPV
LABELV $548
line 1343
;1341:	}
;1342:
;1343:	if (self->client->ps.forceAllowDeactivateTime < level.time &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $550
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $550
line 1345
;1344:		(self->client->ps.fd.forcePowersActive & (1 << FP_PROTECT)) )
;1345:	{
line 1346
;1346:		WP_ForcePowerStop( self, FP_PROTECT );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1347
;1347:		return;
ADDRGP4 $547
JUMPV
LABELV $550
line 1350
;1348:	}
;1349:
;1350:	if ( !WP_ForcePowerUsable( self, FP_PROTECT ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $553
line 1351
;1351:	{
line 1352
;1352:		return;
ADDRGP4 $547
JUMPV
LABELV $553
line 1356
;1353:	}
;1354:
;1355:	// Make sure to turn off Force Rage and Force Absorb.
;1356:	if (self->client->ps.fd.forcePowersActive & (1 << FP_RAGE) )
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
EQI4 $555
line 1357
;1357:	{
line 1358
;1358:		WP_ForcePowerStop( self, FP_RAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1359
;1359:	}
LABELV $555
line 1360
;1360:	if (self->client->ps.fd.forcePowersActive & (1 << FP_ABSORB) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $557
line 1361
;1361:	{
line 1362
;1362:		WP_ForcePowerStop( self, FP_ABSORB );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1363
;1363:	}
LABELV $557
line 1365
;1364:
;1365:	self->client->ps.forceAllowDeactivateTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1367
;1366:
;1367:	WP_ForcePowerStart( self, FP_PROTECT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1368
;1368:	G_PreDefSound(self->client->ps.origin, PDSOUND_PROTECT);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 1369
;1369:	G_Sound( self, TRACK_CHANNEL_3, protectLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRGP4 protectLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1370
;1370:}
LABELV $547
endproc ForceProtect 8 12
export ForceAbsorb
proc ForceAbsorb 8 12
line 1373
;1371:
;1372:void ForceAbsorb( gentity_t *self )
;1373:{
line 1374
;1374:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $561
line 1375
;1375:	{
line 1376
;1376:		return;
ADDRGP4 $560
JUMPV
LABELV $561
line 1379
;1377:	}
;1378:
;1379:	if (self->client->ps.forceAllowDeactivateTime < level.time &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $563
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $563
line 1381
;1380:		(self->client->ps.fd.forcePowersActive & (1 << FP_ABSORB)) )
;1381:	{
line 1382
;1382:		WP_ForcePowerStop( self, FP_ABSORB );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1383
;1383:		return;
ADDRGP4 $560
JUMPV
LABELV $563
line 1386
;1384:	}
;1385:
;1386:	if ( !WP_ForcePowerUsable( self, FP_ABSORB ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $566
line 1387
;1387:	{
line 1388
;1388:		return;
ADDRGP4 $560
JUMPV
LABELV $566
line 1392
;1389:	}
;1390:
;1391:	// Make sure to turn off Force Rage and Force Protection.
;1392:	if (self->client->ps.fd.forcePowersActive & (1 << FP_RAGE) )
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
EQI4 $568
line 1393
;1393:	{
line 1394
;1394:		WP_ForcePowerStop( self, FP_RAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1395
;1395:	}
LABELV $568
line 1396
;1396:	if (self->client->ps.fd.forcePowersActive & (1 << FP_PROTECT) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $570
line 1397
;1397:	{
line 1398
;1398:		WP_ForcePowerStop( self, FP_PROTECT );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1399
;1399:	}
LABELV $570
line 1401
;1400:
;1401:	self->client->ps.forceAllowDeactivateTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1403
;1402:
;1403:	WP_ForcePowerStart( self, FP_ABSORB, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1404
;1404:	G_PreDefSound(self->client->ps.origin, PDSOUND_ABSORB);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 1405
;1405:	G_Sound( self, TRACK_CHANNEL_3, absorbLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRGP4 absorbLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1406
;1406:}
LABELV $560
endproc ForceAbsorb 8 12
export ForceRage
proc ForceRage 12 12
line 1409
;1407:
;1408:void ForceRage( gentity_t *self )
;1409:{
line 1410
;1410:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $574
line 1411
;1411:	{
line 1412
;1412:		return;
ADDRGP4 $573
JUMPV
LABELV $574
line 1415
;1413:	}
;1414:
;1415:	if (self->client->ps.forceAllowDeactivateTime < level.time &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $576
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $576
line 1417
;1416:		(self->client->ps.fd.forcePowersActive & (1 << FP_RAGE)) )
;1417:	{
line 1418
;1418:		WP_ForcePowerStop( self, FP_RAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1419
;1419:		return;
ADDRGP4 $573
JUMPV
LABELV $576
line 1422
;1420:	}
;1421:
;1422:	if ( !WP_ForcePowerUsable( self, FP_RAGE ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $579
line 1423
;1423:	{
line 1424
;1424:		return;
ADDRGP4 $573
JUMPV
LABELV $579
line 1427
;1425:	}
;1426:
;1427:	if (self->client->ps.fd.forceRageRecoveryTime >= level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $581
line 1428
;1428:	{
line 1429
;1429:		return;
ADDRGP4 $573
JUMPV
LABELV $581
line 1432
;1430:	}
;1431:
;1432:	if (self->health < 10)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 10
GEI4 $584
line 1433
;1433:	{
line 1434
;1434:		return;
ADDRGP4 $573
JUMPV
LABELV $584
line 1438
;1435:	}
;1436:
;1437:	// Make sure to turn off Force Protection and Force Absorb.
;1438:	if (self->client->ps.fd.forcePowersActive & (1 << FP_PROTECT) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $586
line 1439
;1439:	{
line 1440
;1440:		WP_ForcePowerStop( self, FP_PROTECT );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1441
;1441:	}
LABELV $586
line 1442
;1442:	if (self->client->ps.fd.forcePowersActive & (1 << FP_ABSORB) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $588
line 1443
;1443:	{
line 1444
;1444:		WP_ForcePowerStop( self, FP_ABSORB );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1445
;1445:	}
LABELV $588
line 1447
;1446:
;1447:	self->client->ps.forceAllowDeactivateTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1449
;1448:
;1449:	WP_ForcePowerStart( self, FP_RAGE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1451
;1450:
;1451:	G_Sound( self, TRACK_CHANNEL_4, G_SoundIndex("sound/weapons/force/rage.wav") );
ADDRGP4 $591
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1452
;1452:	G_Sound( self, TRACK_CHANNEL_3, rageLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRGP4 rageLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1453
;1453:}
LABELV $573
endproc ForceRage 12 12
export ForceLightning
proc ForceLightning 12 12
line 1456
;1454:
;1455:void ForceLightning( gentity_t *self )
;1456:{
line 1457
;1457:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $593
line 1458
;1458:	{
line 1459
;1459:		return;
ADDRGP4 $592
JUMPV
LABELV $593
line 1461
;1460:	}
;1461:	if ( self->client->ps.fd.forcePower < 25 || !WP_ForcePowerUsable( self, FP_LIGHTNING ) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 25
LTI4 $597
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $595
LABELV $597
line 1462
;1462:	{
line 1463
;1463:		return;
ADDRGP4 $592
JUMPV
LABELV $595
line 1465
;1464:	}
;1465:	if ( self->client->ps.fd.forcePowerDebounce[FP_LIGHTNING] > level.time )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $598
line 1466
;1466:	{//stops it while using it and also after using it, up to 3 second delay
line 1467
;1467:		return;
ADDRGP4 $592
JUMPV
LABELV $598
line 1470
;1468:	}
;1469:
;1470:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $601
line 1471
;1471:	{
line 1472
;1472:		return;
ADDRGP4 $592
JUMPV
LABELV $601
line 1475
;1473:	}
;1474:
;1475:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $603
line 1476
;1476:	{
line 1477
;1477:		return;
ADDRGP4 $592
JUMPV
LABELV $603
line 1482
;1478:	}
;1479:
;1480:	//Shoot lightning from hand
;1481:	//using grip anim now, to extend the burst time
;1482:	self->client->ps.forceHandExtend = HANDEXTEND_FORCEGRIP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 3
ASGNI4
line 1483
;1483:	self->client->ps.forceHandExtendTime = level.time + 20000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 1485
;1484:
;1485:	G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/force/lightning.wav") );
ADDRGP4 $606
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1487
;1486:	
;1487:	WP_ForcePowerStart( self, FP_LIGHTNING, 500 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
CNSTI4 500
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1488
;1488:}
LABELV $592
endproc ForceLightning 12 12
export ForceLightningDamage
proc ForceLightningDamage 44 32
line 1491
;1489:
;1490:void ForceLightningDamage( gentity_t *self, gentity_t *traceEnt, vec3_t dir, vec3_t impactPoint )
;1491:{
line 1492
;1492:	self->client->dangerTime = level.time;
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
line 1493
;1493:	self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1494
;1494:	self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
CNSTI4 0
ASGNI4
line 1496
;1495:
;1496:	if ( traceEnt && traceEnt->takedamage )
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $609
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $609
line 1497
;1497:	{
line 1498
;1498:		if (!traceEnt->client && traceEnt->s.eType == ET_GRAPPLE)
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $611
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $611
line 1499
;1499:		{ //g2animent
line 1500
;1500:			if (traceEnt->s.genericenemyindex < level.time)
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $613
line 1501
;1501:			{
line 1502
;1502:				traceEnt->s.genericenemyindex = level.time + 2000;
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1503
;1503:			}
LABELV $613
line 1504
;1504:		}
LABELV $611
line 1505
;1505:		if ( traceEnt->client )
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $617
line 1506
;1506:		{//an enemy or object
line 1507
;1507:			if (ForcePowerUsableOn(self, traceEnt, FP_LIGHTNING))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 12
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $619
line 1508
;1508:			{
line 1509
;1509:				int	dmg = Q_irand(1,2); //Q_irand( 1, 3 );
CNSTI4 1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 24
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 1511
;1510:				
;1511:				int modPowerLevel = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 1513
;1512:				
;1513:				if (traceEnt->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $621
line 1514
;1514:				{
line 1515
;1515:					modPowerLevel = WP_AbsorbConversion(traceEnt, traceEnt->client->ps.fd.forcePowerLevel[FP_ABSORB], self, FP_LIGHTNING, self->client->ps.fd.forcePowerLevel[FP_LIGHTNING], 1);
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 408
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 36
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 WP_AbsorbConversion
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 40
INDIRI4
ASGNI4
line 1516
;1516:				}
LABELV $621
line 1518
;1517:
;1518:				if (modPowerLevel != -1)
ADDRLP4 16
INDIRI4
CNSTI4 -1
EQI4 $623
line 1519
;1519:				{
line 1520
;1520:					if (!modPowerLevel)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $625
line 1521
;1521:					{
line 1522
;1522:						dmg = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1523
;1523:					}
ADDRGP4 $626
JUMPV
LABELV $625
line 1524
;1524:					else if (modPowerLevel == 1)
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $627
line 1525
;1525:					{
line 1526
;1526:						dmg = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1527
;1527:					}
ADDRGP4 $628
JUMPV
LABELV $627
line 1528
;1528:					else if (modPowerLevel == 2)
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $629
line 1529
;1529:					{
line 1530
;1530:						dmg = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1531
;1531:					}
LABELV $629
LABELV $628
LABELV $626
line 1532
;1532:				}
LABELV $623
line 1534
;1533:
;1534:				if (dmg)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $631
line 1535
;1535:				{
line 1537
;1536:					//rww - Shields can now absorb lightning too.
;1537:					G_Damage( traceEnt, self, self, dir, impactPoint, dmg, 0, MOD_FORCE_DARK );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1538
;1538:				}
LABELV $631
line 1539
;1539:				if ( traceEnt->client )
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $633
line 1540
;1540:				{
line 1541
;1541:					if ( !Q_irand( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $635
line 1542
;1542:					{
line 1543
;1543:						G_Sound( traceEnt, CHAN_BODY, G_SoundIndex( "sound/weapons/force/lightninghit.wav" ) );
ADDRGP4 $637
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1544
;1544:					}
LABELV $635
line 1546
;1545:
;1546:					if (traceEnt->client->ps.electrifyTime < (level.time + 400))
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 400
ADDI4
GEI4 $638
line 1547
;1547:					{ //only update every 400ms to reduce bandwidth usage (as it is passing a 32-bit time value)
line 1548
;1548:						traceEnt->client->ps.electrifyTime = level.time + 800;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 800
ADDI4
ASGNI4
line 1549
;1549:					}
LABELV $638
line 1550
;1550:				}
LABELV $633
line 1551
;1551:			}
LABELV $619
line 1552
;1552:		}
LABELV $617
line 1553
;1553:	}
LABELV $609
line 1554
;1554:}
LABELV $607
endproc ForceLightningDamage 44 32
export ForceShootLightning
proc ForceShootLightning 9460 28
line 1557
;1555:
;1556:void ForceShootLightning( gentity_t *self )
;1557:{
line 1562
;1558:	trace_t	tr;
;1559:	vec3_t	end, forward;
;1560:	gentity_t	*traceEnt;
;1561:
;1562:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $643
line 1563
;1563:	{
line 1564
;1564:		return;
ADDRGP4 $642
JUMPV
LABELV $643
line 1566
;1565:	}
;1566:	AngleVectors( self->client->ps.viewangles, forward, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1108
CNSTP4 0
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1567
;1567:	VectorNormalize( forward );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1569
;1568:
;1569:	if ( self->client->ps.fd.forcePowerLevel[FP_LIGHTNING] > FORCE_LEVEL_2 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 2
LEI4 $645
line 1570
;1570:	{//arc
line 1572
;1571:		vec3_t	center, mins, maxs, dir, ent_org, size, v;
;1572:		float	radius = FORCE_LIGHTNING_RADIUS, dot, dist;
ADDRLP4 1176
CNSTF4 1133903872
ASGNF4
line 1577
;1573:		gentity_t	*entityList[MAX_GENTITIES];
;1574:		int			iEntityList[MAX_GENTITIES];
;1575:		int		e, numListedEntities, i;
;1576:
;1577:		VectorCopy( self->client->ps.origin, center );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1578
;1578:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 1112
CNSTI4 0
ASGNI4
LABELV $647
line 1579
;1579:		{
line 1580
;1580:			mins[i] = center[i] - radius;
ADDRLP4 9412
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9412
INDIRI4
ADDRLP4 5288
ADDP4
ADDRLP4 9412
INDIRI4
ADDRLP4 1116
ADDP4
INDIRF4
ADDRLP4 1176
INDIRF4
SUBF4
ASGNF4
line 1581
;1581:			maxs[i] = center[i] + radius;
ADDRLP4 9416
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9416
INDIRI4
ADDRLP4 5300
ADDP4
ADDRLP4 9416
INDIRI4
ADDRLP4 1116
ADDP4
INDIRF4
ADDRLP4 1176
INDIRF4
ADDF4
ASGNF4
line 1582
;1582:		}
LABELV $648
line 1578
ADDRLP4 1112
ADDRLP4 1112
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 3
LTI4 $647
line 1583
;1583:		numListedEntities = trap_EntitiesInBox( mins, maxs, iEntityList, MAX_GENTITIES );
ADDRLP4 5288
ARGP4
ADDRLP4 5300
ARGP4
ADDRLP4 5312
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 9412
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 1184
ADDRLP4 9412
INDIRI4
ASGNI4
line 1585
;1584:
;1585:		i = 0;
ADDRLP4 1112
CNSTI4 0
ASGNI4
ADDRGP4 $652
JUMPV
LABELV $651
line 1587
;1586:		while (i < numListedEntities)
;1587:		{
line 1588
;1588:			entityList[i] = &g_entities[iEntityList[i]];
ADDRLP4 9416
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9416
INDIRI4
ADDRLP4 1192
ADDP4
CNSTI4 828
ADDRLP4 9416
INDIRI4
ADDRLP4 5312
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1590
;1589:
;1590:			i++;
ADDRLP4 1112
ADDRLP4 1112
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1591
;1591:		}
LABELV $652
line 1586
ADDRLP4 1112
INDIRI4
ADDRLP4 1184
INDIRI4
LTI4 $651
line 1593
;1592:
;1593:		for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 1180
CNSTI4 0
ASGNI4
ADDRGP4 $657
JUMPV
LABELV $654
line 1594
;1594:		{
line 1595
;1595:			traceEnt = entityList[e];
ADDRLP4 0
ADDRLP4 1180
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1192
ADDP4
INDIRP4
ASGNP4
line 1597
;1596:
;1597:			if ( !traceEnt )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $658
line 1598
;1598:				continue;
ADDRGP4 $655
JUMPV
LABELV $658
line 1599
;1599:			if ( traceEnt == self )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $660
line 1600
;1600:				continue;
ADDRGP4 $655
JUMPV
LABELV $660
line 1601
;1601:			if ( traceEnt->r.ownerNum == self->s.number && traceEnt->s.weapon != WP_THERMAL )//can push your own thermals
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $662
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 11
EQI4 $662
line 1602
;1602:				continue;
ADDRGP4 $655
JUMPV
LABELV $662
line 1603
;1603:			if ( !traceEnt->inuse )
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $664
line 1604
;1604:				continue;
ADDRGP4 $655
JUMPV
LABELV $664
line 1605
;1605:			if ( !traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
NEI4 $666
line 1606
;1606:				continue;
ADDRGP4 $655
JUMPV
LABELV $666
line 1607
;1607:			if ( traceEnt->health <= 0 )//no torturing corpses
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $668
line 1608
;1608:				continue;
ADDRGP4 $655
JUMPV
LABELV $668
line 1609
;1609:			if ( !g_friendlyFire.integer && OnSameTeam(self, traceEnt))
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $670
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 9420
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 9420
INDIRI4
CNSTI4 0
EQI4 $670
line 1610
;1610:				continue;
ADDRGP4 $655
JUMPV
LABELV $670
line 1613
;1611:			//this is all to see if we need to start a saber attack, if it's in flight, this doesn't matter
;1612:			// find the distance from the edge of the bounding box
;1613:			for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 1112
CNSTI4 0
ASGNI4
LABELV $673
line 1614
;1614:			{
line 1615
;1615:				if ( center[i] < traceEnt->r.absmin[i] ) 
ADDRLP4 9424
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9424
INDIRI4
ADDRLP4 1116
ADDP4
INDIRF4
ADDRLP4 9424
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $677
line 1616
;1616:				{
line 1617
;1617:					v[i] = traceEnt->r.absmin[i] - center[i];
ADDRLP4 9428
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9428
INDIRI4
ADDRLP4 1128
ADDP4
ADDRLP4 9428
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 9428
INDIRI4
ADDRLP4 1116
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1618
;1618:				} else if ( center[i] > traceEnt->r.absmax[i] ) 
ADDRGP4 $678
JUMPV
LABELV $677
ADDRLP4 9428
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9428
INDIRI4
ADDRLP4 1116
ADDP4
INDIRF4
ADDRLP4 9428
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $679
line 1619
;1619:				{
line 1620
;1620:					v[i] = center[i] - traceEnt->r.absmax[i];
ADDRLP4 9432
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9432
INDIRI4
ADDRLP4 1128
ADDP4
ADDRLP4 9432
INDIRI4
ADDRLP4 1116
ADDP4
INDIRF4
ADDRLP4 9432
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1621
;1621:				} else 
ADDRGP4 $680
JUMPV
LABELV $679
line 1622
;1622:				{
line 1623
;1623:					v[i] = 0;
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1128
ADDP4
CNSTF4 0
ASGNF4
line 1624
;1624:				}
LABELV $680
LABELV $678
line 1625
;1625:			}
LABELV $674
line 1613
ADDRLP4 1112
ADDRLP4 1112
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 3
LTI4 $673
line 1627
;1626:
;1627:			VectorSubtract( traceEnt->r.absmax, traceEnt->r.absmin, size );
ADDRLP4 1164
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1164+4
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1164+8
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1628
;1628:			VectorMA( traceEnt->r.absmin, 0.5, size, ent_org );
ADDRLP4 9436
CNSTF4 1056964608
ASGNF4
ADDRLP4 1140
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 9436
INDIRF4
ADDRLP4 1164
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1140+4
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 9436
INDIRF4
ADDRLP4 1164+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1140+8
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 1164+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1632
;1629:
;1630:			//see if they're in front of me
;1631:			//must be within the forward cone
;1632:			VectorSubtract( ent_org, center, dir );
ADDRLP4 1152
ADDRLP4 1140
INDIRF4
ADDRLP4 1116
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1152+4
ADDRLP4 1140+4
INDIRF4
ADDRLP4 1116+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1152+8
ADDRLP4 1140+8
INDIRF4
ADDRLP4 1116+8
INDIRF4
SUBF4
ASGNF4
line 1633
;1633:			VectorNormalize( dir );
ADDRLP4 1152
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1634
;1634:			if ( (dot = DotProduct( dir, forward )) < 0.5 )
ADDRLP4 9440
ADDRLP4 1152
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 1152+4
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1152+8
INDIRF4
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9408
ADDRLP4 9440
INDIRF4
ASGNF4
ADDRLP4 9440
INDIRF4
CNSTF4 1056964608
GEF4 $693
line 1635
;1635:				continue;
ADDRGP4 $655
JUMPV
LABELV $693
line 1638
;1636:
;1637:			//must be close enough
;1638:			dist = VectorLength( v );
ADDRLP4 1128
ARGP4
ADDRLP4 9444
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1188
ADDRLP4 9444
INDIRF4
ASGNF4
line 1639
;1639:			if ( dist >= radius ) 
ADDRLP4 1188
INDIRF4
ADDRLP4 1176
INDIRF4
LTF4 $699
line 1640
;1640:			{
line 1641
;1641:				continue;
ADDRGP4 $655
JUMPV
LABELV $699
line 1645
;1642:			}
;1643:		
;1644:			//in PVS?
;1645:			if ( !traceEnt->r.bmodel && !trap_InPVS( ent_org, self->client->ps.origin ) )
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $701
ADDRLP4 1140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9448
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 9448
INDIRI4
CNSTI4 0
NEI4 $701
line 1646
;1646:			{//must be in PVS
line 1647
;1647:				continue;
ADDRGP4 $655
JUMPV
LABELV $701
line 1651
;1648:			}
;1649:
;1650:			//Now check and see if we can actually hit it
;1651:			trap_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, ent_org, self->s.number, MASK_SHOT );
ADDRLP4 16
ARGP4
ADDRLP4 9452
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9452
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9456
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 9456
INDIRP4
ARGP4
ADDRLP4 9456
INDIRP4
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 9452
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1652
;1652:			if ( tr.fraction < 1.0f && tr.entityNum != traceEnt->s.number )
ADDRLP4 16+8
INDIRF4
CNSTF4 1065353216
GEF4 $703
ADDRLP4 16+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $703
line 1653
;1653:			{//must have clear LOS
line 1654
;1654:				continue;
ADDRGP4 $655
JUMPV
LABELV $703
line 1658
;1655:			}
;1656:
;1657:			// ok, we are within the radius, add us to the incoming list
;1658:			ForceLightningDamage( self, traceEnt, dir, ent_org );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1140
ARGP4
ADDRGP4 ForceLightningDamage
CALLV
pop
line 1659
;1659:		}
LABELV $655
line 1593
ADDRLP4 1180
ADDRLP4 1180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $657
ADDRLP4 1180
INDIRI4
ADDRLP4 1184
INDIRI4
LTI4 $654
line 1660
;1660:	}
ADDRGP4 $646
JUMPV
LABELV $645
line 1662
;1661:	else
;1662:	{//trace-line
line 1663
;1663:		VectorMA( self->client->ps.origin, 2048, forward, end );
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1116
CNSTF4 1157627904
ASGNF4
ADDRLP4 1096
ADDRLP4 1112
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1116
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1096+4
ADDRLP4 1112
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1116
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1096+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1157627904
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1665
;1664:		
;1665:		trap_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, end, self->s.number, MASK_SHOT );
ADDRLP4 16
ARGP4
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1124
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1096
ARGP4
ADDRLP4 1120
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1666
;1666:		if ( tr.entityNum == ENTITYNUM_NONE || tr.fraction == 1.0 || tr.allsolid || tr.startsolid )
ADDRLP4 16+52
INDIRI4
CNSTI4 1023
EQI4 $718
ADDRLP4 16+8
INDIRF4
CNSTF4 1065353216
EQF4 $718
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $718
ADDRLP4 16+4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $711
LABELV $718
line 1667
;1667:		{
line 1668
;1668:			return;
ADDRGP4 $642
JUMPV
LABELV $711
line 1671
;1669:		}
;1670:		
;1671:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 828
ADDRLP4 16+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1672
;1672:		ForceLightningDamage( self, traceEnt, forward, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16+12
ARGP4
ADDRGP4 ForceLightningDamage
CALLV
pop
line 1673
;1673:	}
LABELV $646
line 1674
;1674:}
LABELV $642
endproc ForceShootLightning 9460 28
export ForceDrain
proc ForceDrain 12 12
line 1677
;1675:
;1676:void ForceDrain( gentity_t *self )
;1677:{
line 1678
;1678:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $722
line 1679
;1679:	{
line 1680
;1680:		return;
ADDRGP4 $721
JUMPV
LABELV $722
line 1683
;1681:	}
;1682:
;1683:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $724
line 1684
;1684:	{
line 1685
;1685:		return;
ADDRGP4 $721
JUMPV
LABELV $724
line 1688
;1686:	}
;1687:
;1688:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $726
line 1689
;1689:	{
line 1690
;1690:		return;
ADDRGP4 $721
JUMPV
LABELV $726
line 1693
;1691:	}
;1692:
;1693:	if ( self->client->ps.fd.forcePower < 25 || !WP_ForcePowerUsable( self, FP_DRAIN ) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 25
LTI4 $730
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $728
LABELV $730
line 1694
;1694:	{
line 1695
;1695:		return;
ADDRGP4 $721
JUMPV
LABELV $728
line 1697
;1696:	}
;1697:	if ( self->client->ps.fd.forcePowerDebounce[FP_DRAIN] > level.time )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $731
line 1698
;1698:	{//stops it while using it and also after using it, up to 3 second delay
line 1699
;1699:		return;
ADDRGP4 $721
JUMPV
LABELV $731
line 1704
;1700:	}
;1701:
;1702://	self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
;1703://	self->client->ps.forceHandExtendTime = level.time + 1000;
;1704:	self->client->ps.forceHandExtend = HANDEXTEND_FORCEGRIP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 3
ASGNI4
line 1705
;1705:	self->client->ps.forceHandExtendTime = level.time + 20000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 1707
;1706:
;1707:	G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/force/drain.wav") );
ADDRGP4 $735
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1709
;1708:	
;1709:	WP_ForcePowerStart( self, FP_DRAIN, 500 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 500
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1710
;1710:}
LABELV $721
endproc ForceDrain 12 12
export ForceDrainDamage
proc ForceDrainDamage 72 24
line 1713
;1711:
;1712:void ForceDrainDamage( gentity_t *self, gentity_t *traceEnt, vec3_t dir, vec3_t impactPoint )
;1713:{
line 1716
;1714:	gentity_t *tent;
;1715:
;1716:	self->client->dangerTime = level.time;
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
line 1717
;1717:	self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1718
;1718:	self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
CNSTI4 0
ASGNI4
line 1720
;1719:
;1720:	if ( traceEnt && traceEnt->takedamage )
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $738
ADDRLP4 8
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $738
line 1721
;1721:	{
line 1722
;1722:		if ( traceEnt->client && (!OnSameTeam(self, traceEnt) || g_friendlyFire.integer) && self->client->ps.fd.forceDrainTime < level.time && traceEnt->client->ps.fd.forcePower )
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $740
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $744
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $740
LABELV $744
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
CNSTI4 1180
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $740
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
EQI4 $740
line 1723
;1723:		{//an enemy or object
line 1724
;1724:			if (!traceEnt->client && traceEnt->s.eType == ET_GRAPPLE)
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $745
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $745
line 1725
;1725:			{ //g2animent
line 1726
;1726:				if (traceEnt->s.genericenemyindex < level.time)
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $747
line 1727
;1727:				{
line 1728
;1728:					traceEnt->s.genericenemyindex = level.time + 2000;
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1729
;1729:				}
LABELV $747
line 1730
;1730:			}
LABELV $745
line 1731
;1731:			if (ForcePowerUsableOn(self, traceEnt, FP_DRAIN))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 32
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $751
line 1732
;1732:			{
line 1733
;1733:				int modPowerLevel = -1;
ADDRLP4 40
CNSTI4 -1
ASGNI4
line 1734
;1734:				int	dmg = 0; //Q_irand( 1, 3 );
ADDRLP4 36
CNSTI4 0
ASGNI4
line 1735
;1735:				if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 1
NEI4 $753
line 1736
;1736:				{
line 1737
;1737:					dmg = 2; //because it's one-shot
ADDRLP4 36
CNSTI4 2
ASGNI4
line 1738
;1738:				}
ADDRGP4 $754
JUMPV
LABELV $753
line 1739
;1739:				else if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 2
NEI4 $755
line 1740
;1740:				{
line 1741
;1741:					dmg = 3;
ADDRLP4 36
CNSTI4 3
ASGNI4
line 1742
;1742:				}
ADDRGP4 $756
JUMPV
LABELV $755
line 1743
;1743:				else if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 3
NEI4 $757
line 1744
;1744:				{
line 1745
;1745:					dmg = 4;
ADDRLP4 36
CNSTI4 4
ASGNI4
line 1746
;1746:				}
LABELV $757
LABELV $756
LABELV $754
line 1748
;1747:			
;1748:				if (traceEnt->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $759
line 1749
;1749:				{
line 1750
;1750:					modPowerLevel = WP_AbsorbConversion(traceEnt, traceEnt->client->ps.fd.forcePowerLevel[FP_ABSORB], self, FP_DRAIN, self->client->ps.fd.forcePowerLevel[FP_DRAIN], 0);
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
CNSTI4 408
ASGNI4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 52
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 56
ADDRGP4 WP_AbsorbConversion
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 56
INDIRI4
ASGNI4
line 1752
;1751:					//Since this is drain, don't absorb any power, but nullify the affect it has
;1752:				}
LABELV $759
line 1754
;1753:
;1754:				if (modPowerLevel != -1)
ADDRLP4 40
INDIRI4
CNSTI4 -1
EQI4 $761
line 1755
;1755:				{
line 1756
;1756:					if (!modPowerLevel)
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $763
line 1757
;1757:					{
line 1758
;1758:						dmg = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 1759
;1759:					}
ADDRGP4 $764
JUMPV
LABELV $763
line 1760
;1760:					else if (modPowerLevel == 1)
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $765
line 1761
;1761:					{
line 1762
;1762:						dmg = 1;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 1763
;1763:					}
ADDRGP4 $766
JUMPV
LABELV $765
line 1764
;1764:					else if (modPowerLevel == 2)
ADDRLP4 40
INDIRI4
CNSTI4 2
NEI4 $767
line 1765
;1765:					{
line 1766
;1766:						dmg = 2;
ADDRLP4 36
CNSTI4 2
ASGNI4
line 1767
;1767:					}
LABELV $767
LABELV $766
LABELV $764
line 1768
;1768:				}
LABELV $761
line 1771
;1769:				//G_Damage( traceEnt, self, self, dir, impactPoint, dmg, 0, MOD_FORCE_DARK );
;1770:
;1771:				if (dmg)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $769
line 1772
;1772:				{
line 1773
;1773:					traceEnt->client->ps.fd.forcePower -= (dmg);
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ASGNI4
line 1774
;1774:				}
LABELV $769
line 1775
;1775:				if (traceEnt->client->ps.fd.forcePower < 0)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
GEI4 $771
line 1776
;1776:				{
line 1777
;1777:					traceEnt->client->ps.fd.forcePower = 0;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 1778
;1778:				}
LABELV $771
line 1780
;1779:
;1780:				if (self->client->ps.stats[STAT_HEALTH] < self->client->ps.stats[STAT_MAX_HEALTH] &&
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
GEI4 $773
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $773
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $773
line 1782
;1781:					self->health > 0 && self->client->ps.stats[STAT_HEALTH] > 0)
;1782:				{
line 1783
;1783:					self->health += dmg;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
ASGNI4
line 1784
;1784:					if (self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $775
line 1785
;1785:					{
line 1786
;1786:						self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1787
;1787:					}
LABELV $775
line 1788
;1788:					self->client->ps.stats[STAT_HEALTH] = self->health;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
line 1789
;1789:				}
LABELV $773
line 1791
;1790:
;1791:				traceEnt->client->ps.fd.forcePowerRegenDebounceTime = level.time + 800; //don't let the client being drained get force power back right away
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 940
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 800
ADDI4
ASGNI4
line 1815
;1792:
;1793:				//Drain the standard amount since we just drained someone else
;1794:
;1795:				/*
;1796:				if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_1)
;1797:				{
;1798:					BG_ForcePowerDrain( &self->client->ps, FP_DRAIN, 0 );
;1799:				}
;1800:				else
;1801:				{
;1802:					BG_ForcePowerDrain( &self->client->ps, FP_DRAIN, forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_DRAIN]][FP_DRAIN]/5 );
;1803:				}
;1804:
;1805:				if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_1)
;1806:				{
;1807:					self->client->ps.fd.forceDrainTime = level.time + 100;
;1808:				}
;1809:				else
;1810:				{
;1811:					self->client->ps.fd.forceDrainTime = level.time + 20;
;1812:				}
;1813:				*/
;1814:
;1815:				if ( traceEnt->client )
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $778
line 1816
;1816:				{
line 1817
;1817:					if ( !Q_irand( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 60
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $780
line 1818
;1818:					{
line 1820
;1819:						//G_Sound( traceEnt, CHAN_BODY, G_SoundIndex( "sound/weapons/force/lightninghit.wav" ) );
;1820:					}
LABELV $780
line 1824
;1821:				//	traceEnt->s.powerups |= ( 1 << PW_DISINT_1 );
;1822:
;1823:				//	traceEnt->client->ps.powerups[PW_DISINT_1] = level.time + 500;
;1824:				}
LABELV $778
line 1826
;1825:
;1826:				if (traceEnt->client->forcePowerSoundDebounce < level.time)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $782
line 1827
;1827:				{
line 1828
;1828:					tent = G_TempEntity( impactPoint, EV_FORCE_DRAINED);
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 84
ARGI4
ADDRLP4 60
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 1829
;1829:					tent->s.eventParm = DirToByte(dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 1830
;1830:					tent->s.owner = traceEnt->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1832
;1831:
;1832:					traceEnt->client->forcePowerSoundDebounce = level.time + 400;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1792
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 1833
;1833:				}
LABELV $782
line 1834
;1834:			}
LABELV $751
line 1835
;1835:		}
LABELV $740
line 1836
;1836:	}
LABELV $738
line 1837
;1837:}
LABELV $736
endproc ForceDrainDamage 72 24
export ForceShootDrain
proc ForceShootDrain 9460 28
line 1840
;1838:
;1839:int ForceShootDrain( gentity_t *self )
;1840:{
line 1844
;1841:	trace_t	tr;
;1842:	vec3_t	end, forward;
;1843:	gentity_t	*traceEnt;
;1844:	int			gotOneOrMore = 0;
ADDRLP4 1096
CNSTI4 0
ASGNI4
line 1846
;1845:
;1846:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $787
line 1847
;1847:	{
line 1848
;1848:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $786
JUMPV
LABELV $787
line 1850
;1849:	}
;1850:	AngleVectors( self->client->ps.viewangles, forward, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1112
CNSTP4 0
ASGNP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1851
;1851:	VectorNormalize( forward );
ADDRLP4 1084
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1853
;1852:
;1853:	if ( self->client->ps.fd.forcePowerLevel[FP_DRAIN] > FORCE_LEVEL_2 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 2
LEI4 $789
line 1854
;1854:	{//arc
line 1856
;1855:		vec3_t	center, mins, maxs, dir, ent_org, size, v;
;1856:		float	radius = MAX_DRAIN_DISTANCE, dot, dist;
ADDRLP4 1180
CNSTF4 1140850688
ASGNF4
line 1861
;1857:		gentity_t	*entityList[MAX_GENTITIES];
;1858:		int			iEntityList[MAX_GENTITIES];
;1859:		int		e, numListedEntities, i;
;1860:
;1861:		VectorCopy( self->client->ps.origin, center );
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1862
;1862:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 1116
CNSTI4 0
ASGNI4
LABELV $791
line 1863
;1863:		{
line 1864
;1864:			mins[i] = center[i] - radius;
ADDRLP4 9416
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9416
INDIRI4
ADDRLP4 5292
ADDP4
ADDRLP4 9416
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 1180
INDIRF4
SUBF4
ASGNF4
line 1865
;1865:			maxs[i] = center[i] + radius;
ADDRLP4 9420
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9420
INDIRI4
ADDRLP4 5304
ADDP4
ADDRLP4 9420
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 1180
INDIRF4
ADDF4
ASGNF4
line 1866
;1866:		}
LABELV $792
line 1862
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 3
LTI4 $791
line 1867
;1867:		numListedEntities = trap_EntitiesInBox( mins, maxs, iEntityList, MAX_GENTITIES );
ADDRLP4 5292
ARGP4
ADDRLP4 5304
ARGP4
ADDRLP4 5316
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 9416
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 1188
ADDRLP4 9416
INDIRI4
ASGNI4
line 1869
;1868:
;1869:		i = 0;
ADDRLP4 1116
CNSTI4 0
ASGNI4
ADDRGP4 $796
JUMPV
LABELV $795
line 1871
;1870:		while (i < numListedEntities)
;1871:		{
line 1872
;1872:			entityList[i] = &g_entities[iEntityList[i]];
ADDRLP4 9420
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9420
INDIRI4
ADDRLP4 1196
ADDP4
CNSTI4 828
ADDRLP4 9420
INDIRI4
ADDRLP4 5316
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1874
;1873:
;1874:			i++;
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1875
;1875:		}
LABELV $796
line 1870
ADDRLP4 1116
INDIRI4
ADDRLP4 1188
INDIRI4
LTI4 $795
line 1877
;1876:
;1877:		for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 1184
CNSTI4 0
ASGNI4
ADDRGP4 $801
JUMPV
LABELV $798
line 1878
;1878:		{
line 1879
;1879:			traceEnt = entityList[e];
ADDRLP4 0
ADDRLP4 1184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1196
ADDP4
INDIRP4
ASGNP4
line 1881
;1880:
;1881:			if ( !traceEnt )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $802
line 1882
;1882:				continue;
ADDRGP4 $799
JUMPV
LABELV $802
line 1883
;1883:			if ( traceEnt == self )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $804
line 1884
;1884:				continue;
ADDRGP4 $799
JUMPV
LABELV $804
line 1885
;1885:			if ( !traceEnt->inuse )
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $806
line 1886
;1886:				continue;
ADDRGP4 $799
JUMPV
LABELV $806
line 1887
;1887:			if ( !traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
NEI4 $808
line 1888
;1888:				continue;
ADDRGP4 $799
JUMPV
LABELV $808
line 1889
;1889:			if ( traceEnt->health <= 0 )//no torturing corpses
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $810
line 1890
;1890:				continue;
ADDRGP4 $799
JUMPV
LABELV $810
line 1891
;1891:			if ( !traceEnt->client )
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $812
line 1892
;1892:				continue;
ADDRGP4 $799
JUMPV
LABELV $812
line 1893
;1893:			if ( !traceEnt->client->ps.fd.forcePower )
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
NEI4 $814
line 1894
;1894:				continue;
ADDRGP4 $799
JUMPV
LABELV $814
line 1895
;1895:			if (OnSameTeam(self, traceEnt))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 9420
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 9420
INDIRI4
CNSTI4 0
EQI4 $816
line 1896
;1896:				continue;
ADDRGP4 $799
JUMPV
LABELV $816
line 1899
;1897:			//this is all to see if we need to start a saber attack, if it's in flight, this doesn't matter
;1898:			// find the distance from the edge of the bounding box
;1899:			for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 1116
CNSTI4 0
ASGNI4
LABELV $818
line 1900
;1900:			{
line 1901
;1901:				if ( center[i] < traceEnt->r.absmin[i] ) 
ADDRLP4 9424
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9424
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 9424
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $822
line 1902
;1902:				{
line 1903
;1903:					v[i] = traceEnt->r.absmin[i] - center[i];
ADDRLP4 9428
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9428
INDIRI4
ADDRLP4 1132
ADDP4
ADDRLP4 9428
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 9428
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1904
;1904:				} else if ( center[i] > traceEnt->r.absmax[i] ) 
ADDRGP4 $823
JUMPV
LABELV $822
ADDRLP4 9428
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9428
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 9428
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $824
line 1905
;1905:				{
line 1906
;1906:					v[i] = center[i] - traceEnt->r.absmax[i];
ADDRLP4 9432
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9432
INDIRI4
ADDRLP4 1132
ADDP4
ADDRLP4 9432
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 9432
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1907
;1907:				} else 
ADDRGP4 $825
JUMPV
LABELV $824
line 1908
;1908:				{
line 1909
;1909:					v[i] = 0;
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1132
ADDP4
CNSTF4 0
ASGNF4
line 1910
;1910:				}
LABELV $825
LABELV $823
line 1911
;1911:			}
LABELV $819
line 1899
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 3
LTI4 $818
line 1913
;1912:
;1913:			VectorSubtract( traceEnt->r.absmax, traceEnt->r.absmin, size );
ADDRLP4 1168
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1168+4
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1168+8
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1914
;1914:			VectorMA( traceEnt->r.absmin, 0.5, size, ent_org );
ADDRLP4 9436
CNSTF4 1056964608
ASGNF4
ADDRLP4 1144
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 9436
INDIRF4
ADDRLP4 1168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1144+4
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 9436
INDIRF4
ADDRLP4 1168+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1144+8
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 1168+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1918
;1915:
;1916:			//see if they're in front of me
;1917:			//must be within the forward cone
;1918:			VectorSubtract( ent_org, center, dir );
ADDRLP4 1156
ADDRLP4 1144
INDIRF4
ADDRLP4 1120
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1156+4
ADDRLP4 1144+4
INDIRF4
ADDRLP4 1120+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1156+8
ADDRLP4 1144+8
INDIRF4
ADDRLP4 1120+8
INDIRF4
SUBF4
ASGNF4
line 1919
;1919:			VectorNormalize( dir );
ADDRLP4 1156
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1920
;1920:			if ( (dot = DotProduct( dir, forward )) < 0.5 )
ADDRLP4 9440
ADDRLP4 1156
INDIRF4
ADDRLP4 1084
INDIRF4
MULF4
ADDRLP4 1156+4
INDIRF4
ADDRLP4 1084+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1156+8
INDIRF4
ADDRLP4 1084+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9412
ADDRLP4 9440
INDIRF4
ASGNF4
ADDRLP4 9440
INDIRF4
CNSTF4 1056964608
GEF4 $838
line 1921
;1921:				continue;
ADDRGP4 $799
JUMPV
LABELV $838
line 1924
;1922:
;1923:			//must be close enough
;1924:			dist = VectorLength( v );
ADDRLP4 1132
ARGP4
ADDRLP4 9444
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1192
ADDRLP4 9444
INDIRF4
ASGNF4
line 1925
;1925:			if ( dist >= radius ) 
ADDRLP4 1192
INDIRF4
ADDRLP4 1180
INDIRF4
LTF4 $844
line 1926
;1926:			{
line 1927
;1927:				continue;
ADDRGP4 $799
JUMPV
LABELV $844
line 1931
;1928:			}
;1929:		
;1930:			//in PVS?
;1931:			if ( !traceEnt->r.bmodel && !trap_InPVS( ent_org, self->client->ps.origin ) )
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $846
ADDRLP4 1144
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9448
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 9448
INDIRI4
CNSTI4 0
NEI4 $846
line 1932
;1932:			{//must be in PVS
line 1933
;1933:				continue;
ADDRGP4 $799
JUMPV
LABELV $846
line 1937
;1934:			}
;1935:
;1936:			//Now check and see if we can actually hit it
;1937:			trap_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, ent_org, self->s.number, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRLP4 9452
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9452
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9456
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 9456
INDIRP4
ARGP4
ADDRLP4 9456
INDIRP4
ARGP4
ADDRLP4 1144
ARGP4
ADDRLP4 9452
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1938
;1938:			if ( tr.fraction < 1.0f && tr.entityNum != traceEnt->s.number )
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
GEF4 $848
ADDRLP4 4+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $848
line 1939
;1939:			{//must have clear LOS
line 1940
;1940:				continue;
ADDRGP4 $799
JUMPV
LABELV $848
line 1944
;1941:			}
;1942:
;1943:			// ok, we are within the radius, add us to the incoming list
;1944:			ForceDrainDamage( self, traceEnt, dir, ent_org );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1156
ARGP4
ADDRLP4 1144
ARGP4
ADDRGP4 ForceDrainDamage
CALLV
pop
line 1945
;1945:			gotOneOrMore = 1;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 1946
;1946:		}
LABELV $799
line 1877
ADDRLP4 1184
ADDRLP4 1184
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $801
ADDRLP4 1184
INDIRI4
ADDRLP4 1188
INDIRI4
LTI4 $798
line 1947
;1947:	}
ADDRGP4 $790
JUMPV
LABELV $789
line 1949
;1948:	else
;1949:	{//trace-line
line 1950
;1950:		VectorMA( self->client->ps.origin, 2048, forward, end );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1120
CNSTF4 1157627904
ASGNF4
ADDRLP4 1100
ADDRLP4 1116
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1120
INDIRF4
ADDRLP4 1084
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1116
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1120
INDIRF4
ADDRLP4 1084+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1157627904
ADDRLP4 1084+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1952
;1951:		
;1952:		trap_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, end, self->s.number, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1128
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1124
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1953
;1953:		if ( tr.entityNum == ENTITYNUM_NONE || tr.fraction == 1.0 || tr.allsolid || tr.startsolid || !g_entities[tr.entityNum].client || !g_entities[tr.entityNum].inuse )
ADDRLP4 4+52
INDIRI4
CNSTI4 1023
EQI4 $869
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
EQF4 $869
ADDRLP4 1132
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $869
ADDRLP4 4+4
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $869
ADDRLP4 1136
CNSTI4 828
ASGNI4
ADDRLP4 1136
INDIRI4
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $869
ADDRLP4 1136
INDIRI4
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $856
LABELV $869
line 1954
;1954:		{
line 1955
;1955:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $786
JUMPV
LABELV $856
line 1958
;1956:		}
;1957:		
;1958:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1959
;1959:		ForceDrainDamage( self, traceEnt, forward, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 4+12
ARGP4
ADDRGP4 ForceDrainDamage
CALLV
pop
line 1960
;1960:		gotOneOrMore = 1;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 1961
;1961:	}
LABELV $790
line 1963
;1962:
;1963:	self->client->ps.activeForcePass = self->client->ps.fd.forcePowerLevel[FP_DRAIN] + FORCE_LEVEL_3;
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 1116
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 1965
;1964:
;1965:	BG_ForcePowerDrain( &self->client->ps, FP_DRAIN, 5 ); //used to be 1, but this did, too, anger the God of Balance.
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1967
;1966:
;1967:	self->client->ps.fd.forcePowerRegenDebounceTime = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 940
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1969
;1968:
;1969:	return gotOneOrMore;
ADDRLP4 1096
INDIRI4
RETI4
LABELV $786
endproc ForceShootDrain 9460 28
export ForceJumpCharge
proc ForceJumpCharge 24 12
line 1973
;1970:}
;1971:
;1972:void ForceJumpCharge( gentity_t *self, usercmd_t *ucmd )
;1973:{ //I guess this is unused now. Was used for the "charge" jump type.
line 1974
;1974:	float forceJumpChargeInterval = forceJumpStrength[0] / (FORCE_JUMP_CHARGE_TIME/FRAMETIME);
ADDRLP4 0
ADDRGP4 forceJumpStrength
INDIRF4
CNSTF4 1115684864
DIVF4
ASGNF4
line 1976
;1975:
;1976:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $874
line 1977
;1977:	{
line 1978
;1978:		return;
ADDRGP4 $873
JUMPV
LABELV $874
line 1981
;1979:	}
;1980:
;1981:	if (!self->client->ps.fd.forceJumpCharge && self->client->ps.groundEntityNum == ENTITYNUM_NONE)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
NEF4 $876
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $876
line 1982
;1982:	{
line 1983
;1983:		return;
ADDRGP4 $873
JUMPV
LABELV $876
line 1986
;1984:	}
;1985:
;1986:	if (self->client->ps.fd.forcePower < forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION])
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 8
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+4
ADDP4
INDIRI4
GEI4 $878
line 1987
;1987:	{
line 1988
;1988:		G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 1989
;1989:		return;
ADDRGP4 $873
JUMPV
LABELV $878
line 1992
;1990:	}
;1991:
;1992:	if (!self->client->ps.fd.forceJumpCharge)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
NEF4 $881
line 1993
;1993:	{
line 1994
;1994:		self->client->ps.fd.forceJumpAddTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1104
ADDP4
CNSTI4 0
ASGNI4
line 1995
;1995:	}
LABELV $881
line 1997
;1996:
;1997:	if (self->client->ps.fd.forceJumpAddTime >= level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1104
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $883
line 1998
;1998:	{
line 1999
;1999:		return;
ADDRGP4 $873
JUMPV
LABELV $883
line 2003
;2000:	}
;2001:
;2002:	//need to play sound
;2003:	if ( !self->client->ps.fd.forceJumpCharge )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
NEF4 $886
line 2004
;2004:	{
line 2005
;2005:		G_Sound( self, TRACK_CHANNEL_1, G_SoundIndex("sound/weapons/force/jumpbuild.wav") );
ADDRGP4 $888
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2006
;2006:	}
LABELV $886
line 2009
;2007:
;2008:	//Increment
;2009:	if (self->client->ps.fd.forceJumpAddTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1104
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $889
line 2010
;2010:	{
line 2011
;2011:		self->client->ps.fd.forceJumpCharge += forceJumpChargeInterval*50;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1112014848
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2012
;2012:		self->client->ps.fd.forceJumpAddTime = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1104
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2013
;2013:	}
LABELV $889
line 2016
;2014:
;2015:	//clamp to max strength for current level
;2016:	if ( self->client->ps.fd.forceJumpCharge > forceJumpStrength[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]] )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
LEF4 $893
line 2017
;2017:	{
line 2018
;2018:		self->client->ps.fd.forceJumpCharge = forceJumpStrength[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]];
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
ASGNF4
line 2019
;2019:		G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2020
;2020:	}
LABELV $893
line 2023
;2021:
;2022:	//clamp to max available force power
;2023:	if ( self->client->ps.fd.forceJumpCharge/forceJumpChargeInterval/(FORCE_JUMP_CHARGE_TIME/FRAMETIME)*forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION] > self->client->ps.fd.forcePower )
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
CNSTF4 1115684864
DIVF4
CNSTI4 72
ADDRLP4 16
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CVIF4 4
LEF4 $895
line 2024
;2024:	{//can't use more than you have
line 2025
;2025:		G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2026
;2026:		self->client->ps.fd.forceJumpCharge = self->client->ps.fd.forcePower*forceJumpChargeInterval/(FORCE_JUMP_CHARGE_TIME/FRAMETIME);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1115684864
DIVF4
ASGNF4
line 2027
;2027:	}
LABELV $895
line 2030
;2028:	
;2029:	//G_Printf("%f\n", self->client->ps.fd.forceJumpCharge);
;2030:}
LABELV $873
endproc ForceJumpCharge 24 12
export WP_GetVelocityForForceJump
proc WP_GetVelocityForForceJump 64 16
line 2033
;2031:
;2032:int WP_GetVelocityForForceJump( gentity_t *self, vec3_t jumpVel, usercmd_t *ucmd )
;2033:{
line 2034
;2034:	float pushFwd = 0, pushRt = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 4
CNSTF4 0
ASGNF4
line 2036
;2035:	vec3_t	view, forward, right;
;2036:	VectorCopy( self->client->ps.viewangles, view );
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2037
;2037:	view[0] = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 2038
;2038:	AngleVectors( view, forward, right, NULL );
ADDRLP4 32
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2039
;2039:	if ( ucmd->forwardmove && ucmd->rightmove )
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 48
INDIRI4
EQI4 $899
ADDRLP4 44
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 48
INDIRI4
EQI4 $899
line 2040
;2040:	{
line 2041
;2041:		if ( ucmd->forwardmove > 0 )
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $901
line 2042
;2042:		{
line 2043
;2043:			pushFwd = 50;
ADDRLP4 0
CNSTF4 1112014848
ASGNF4
line 2044
;2044:		}
ADDRGP4 $902
JUMPV
LABELV $901
line 2046
;2045:		else
;2046:		{
line 2047
;2047:			pushFwd = -50;
ADDRLP4 0
CNSTF4 3259498496
ASGNF4
line 2048
;2048:		}
LABELV $902
line 2049
;2049:		if ( ucmd->rightmove > 0 )
ADDRFP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $903
line 2050
;2050:		{
line 2051
;2051:			pushRt = 50;
ADDRLP4 4
CNSTF4 1112014848
ASGNF4
line 2052
;2052:		}
ADDRGP4 $900
JUMPV
LABELV $903
line 2054
;2053:		else
;2054:		{
line 2055
;2055:			pushRt = -50;
ADDRLP4 4
CNSTF4 3259498496
ASGNF4
line 2056
;2056:		}
line 2057
;2057:	}
ADDRGP4 $900
JUMPV
LABELV $899
line 2058
;2058:	else if ( ucmd->forwardmove || ucmd->rightmove )
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 56
INDIRI4
NEI4 $907
ADDRLP4 52
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 56
INDIRI4
EQI4 $905
LABELV $907
line 2059
;2059:	{
line 2060
;2060:		if ( ucmd->forwardmove > 0 )
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $908
line 2061
;2061:		{
line 2062
;2062:			pushFwd = 100;
ADDRLP4 0
CNSTF4 1120403456
ASGNF4
line 2063
;2063:		}
ADDRGP4 $909
JUMPV
LABELV $908
line 2064
;2064:		else if ( ucmd->forwardmove < 0 )
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $910
line 2065
;2065:		{
line 2066
;2066:			pushFwd = -100;
ADDRLP4 0
CNSTF4 3267887104
ASGNF4
line 2067
;2067:		}
ADDRGP4 $911
JUMPV
LABELV $910
line 2068
;2068:		else if ( ucmd->rightmove > 0 )
ADDRFP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $912
line 2069
;2069:		{
line 2070
;2070:			pushRt = 100;
ADDRLP4 4
CNSTF4 1120403456
ASGNF4
line 2071
;2071:		}
ADDRGP4 $913
JUMPV
LABELV $912
line 2072
;2072:		else if ( ucmd->rightmove < 0 )
ADDRFP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $914
line 2073
;2073:		{
line 2074
;2074:			pushRt = -100;
ADDRLP4 4
CNSTF4 3267887104
ASGNF4
line 2075
;2075:		}
LABELV $914
LABELV $913
LABELV $911
LABELV $909
line 2076
;2076:	}
LABELV $905
LABELV $900
line 2078
;2077:
;2078:	G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2080
;2079:
;2080:	G_PreDefSound(self->client->ps.origin, PDSOUND_FORCEJUMP);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 2082
;2081:
;2082:	if (self->client->ps.fd.forceJumpCharge < JUMP_VELOCITY+40)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1132756992
GEF4 $916
line 2083
;2083:	{ //give him at least a tiny boost from just a tap
line 2084
;2084:		self->client->ps.fd.forceJumpCharge = JUMP_VELOCITY+400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 1142702080
ASGNF4
line 2085
;2085:	}
LABELV $916
line 2087
;2086:
;2087:	if (self->client->ps.velocity[2] < -30)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 3253731328
GEF4 $918
line 2088
;2088:	{ //so that we can get a good boost when force jumping in a fall
line 2089
;2089:		self->client->ps.velocity[2] = -30;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3253731328
ASGNF4
line 2090
;2090:	}
LABELV $918
line 2092
;2091:
;2092:	VectorMA( self->client->ps.velocity, pushFwd, forward, jumpVel );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 8+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 8+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2093
;2093:	VectorMA( self->client->ps.velocity, pushRt, right, jumpVel );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2094
;2094:	jumpVel[2] += self->client->ps.fd.forceJumpCharge;
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
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2095
;2095:	if ( pushFwd > 0 && self->client->ps.fd.forceJumpCharge > 200 )
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $924
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $924
line 2096
;2096:	{
line 2097
;2097:		return FJ_FORWARD;
CNSTI4 0
RETI4
ADDRGP4 $898
JUMPV
LABELV $924
line 2099
;2098:	}
;2099:	else if ( pushFwd < 0 && self->client->ps.fd.forceJumpCharge > 200 )
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $926
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $926
line 2100
;2100:	{
line 2101
;2101:		return FJ_BACKWARD;
CNSTI4 1
RETI4
ADDRGP4 $898
JUMPV
LABELV $926
line 2103
;2102:	}
;2103:	else if ( pushRt > 0 && self->client->ps.fd.forceJumpCharge > 200 )
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $928
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $928
line 2104
;2104:	{
line 2105
;2105:		return FJ_RIGHT;
CNSTI4 2
RETI4
ADDRGP4 $898
JUMPV
LABELV $928
line 2107
;2106:	}
;2107:	else if ( pushRt < 0 && self->client->ps.fd.forceJumpCharge > 200 )
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $930
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $930
line 2108
;2108:	{
line 2109
;2109:		return FJ_LEFT;
CNSTI4 3
RETI4
ADDRGP4 $898
JUMPV
LABELV $930
line 2112
;2110:	}
;2111:	else
;2112:	{
line 2113
;2113:		return FJ_UP;
CNSTI4 4
RETI4
LABELV $898
endproc WP_GetVelocityForForceJump 64 16
export ForceJump
proc ForceJump 32 12
line 2118
;2114:	}
;2115:}
;2116:
;2117:void ForceJump( gentity_t *self, usercmd_t *ucmd )
;2118:{
line 2122
;2119:	float forceJumpChargeInterval;
;2120:	vec3_t	jumpVel;
;2121:
;2122:	if ( self->client->ps.fd.forcePowerDuration[FP_LEVITATION] > level.time )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 864
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $933
line 2123
;2123:	{
line 2124
;2124:		return;
ADDRGP4 $932
JUMPV
LABELV $933
line 2126
;2125:	}
;2126:	if ( !WP_ForcePowerUsable( self, FP_LEVITATION ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $936
line 2127
;2127:	{
line 2128
;2128:		return;
ADDRGP4 $932
JUMPV
LABELV $936
line 2130
;2129:	}
;2130:	if ( self->s.groundEntityNum == ENTITYNUM_NONE )
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $938
line 2131
;2131:	{
line 2132
;2132:		return;
ADDRGP4 $932
JUMPV
LABELV $938
line 2134
;2133:	}
;2134:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $940
line 2135
;2135:	{
line 2136
;2136:		return;
ADDRGP4 $932
JUMPV
LABELV $940
line 2139
;2137:	}
;2138:
;2139:	self->client->fjDidJump = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1796
ADDP4
CNSTI4 1
ASGNI4
line 2141
;2140:
;2141:	forceJumpChargeInterval = forceJumpStrength[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]]/(FORCE_JUMP_CHARGE_TIME/FRAMETIME);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
CNSTF4 1115684864
DIVF4
ASGNF4
line 2143
;2142:
;2143:	WP_GetVelocityForForceJump( self, jumpVel, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 WP_GetVelocityForForceJump
CALLI4
pop
line 2146
;2144:
;2145:	//FIXME: sound effect
;2146:	self->client->ps.fd.forceJumpZStart = self->client->ps.origin[2];//remember this for when we land
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1092
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 2147
;2147:	VectorCopy( jumpVel, self->client->ps.velocity );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2151
;2148:	//wasn't allowing them to attack when jumping, but that was annoying
;2149:	//self->client->ps.weaponTime = self->client->ps.torsoAnimTimer;
;2150:
;2151:	WP_ForcePowerStart( self, FP_LEVITATION, self->client->ps.fd.forceJumpCharge/forceJumpChargeInterval/(FORCE_JUMP_CHARGE_TIME/FRAMETIME)*forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
CNSTF4 1115684864
DIVF4
CNSTI4 72
ADDRLP4 28
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+4
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2153
;2152:	//self->client->ps.fd.forcePowerDuration[FP_LEVITATION] = level.time + self->client->ps.weaponTime;
;2153:	self->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 2154
;2154:	self->client->ps.forceJumpFlip = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 1
ASGNI4
line 2155
;2155:}
LABELV $932
endproc ForceJump 32 12
export WP_AddAsMindtricked
proc WP_AddAsMindtricked 4 0
line 2158
;2156:
;2157:void WP_AddAsMindtricked(forcedata_t *fd, int entNum)
;2158:{
line 2159
;2159:	if (!fd)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $944
line 2160
;2160:	{
line 2161
;2161:		return;
ADDRGP4 $943
JUMPV
LABELV $944
line 2164
;2162:	}
;2163:
;2164:	if (entNum > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $946
line 2165
;2165:	{
line 2166
;2166:		fd->forceMindtrickTargetIndex4 |= (1 << (entNum-48));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 48
SUBI4
LSHI4
BORI4
ASGNI4
line 2167
;2167:	}
ADDRGP4 $947
JUMPV
LABELV $946
line 2168
;2168:	else if (entNum > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $948
line 2169
;2169:	{
line 2170
;2170:		fd->forceMindtrickTargetIndex3 |= (1 << (entNum-32));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 32
SUBI4
LSHI4
BORI4
ASGNI4
line 2171
;2171:	}
ADDRGP4 $949
JUMPV
LABELV $948
line 2172
;2172:	else if (entNum > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $950
line 2173
;2173:	{
line 2174
;2174:		fd->forceMindtrickTargetIndex2 |= (1 << (entNum-16));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 16
SUBI4
LSHI4
BORI4
ASGNI4
line 2175
;2175:	}
ADDRGP4 $951
JUMPV
LABELV $950
line 2177
;2176:	else
;2177:	{
line 2178
;2178:		fd->forceMindtrickTargetIndex |= (1 << entNum);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 2179
;2179:	}
LABELV $951
LABELV $949
LABELV $947
line 2180
;2180:}
LABELV $943
endproc WP_AddAsMindtricked 4 0
export ForceTelepathy
proc ForceTelepathy 5388 28
line 2183
;2181:
;2182:void ForceTelepathy(gentity_t *self)
;2183:{
line 2195
;2184:	trace_t tr;
;2185:	vec3_t tfrom, tto, fwd, thispush_org, a;
;2186:	vec3_t mins, maxs, fwdangles, forward, right, center;
;2187:	int i, e;
;2188:	int entityList[MAX_GENTITIES];
;2189:	int numListedEntities;
;2190:	int gotatleastone;
;2191:	float visionArc;
;2192:	float radius;
;2193:	gentity_t *ent;
;2194:
;2195:	visionArc = 0;
ADDRLP4 5284
CNSTF4 0
ASGNF4
line 2197
;2196:
;2197:	radius = MAX_TRICK_DISTANCE;
ADDRLP4 12
CNSTF4 1140850688
ASGNF4
line 2199
;2198:
;2199:	gotatleastone = 0;
ADDRLP4 4164
CNSTI4 0
ASGNI4
line 2201
;2200:
;2201:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $953
line 2202
;2202:	{
line 2203
;2203:		return;
ADDRGP4 $952
JUMPV
LABELV $953
line 2206
;2204:	}
;2205:
;2206:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $955
line 2207
;2207:	{
line 2208
;2208:		return;
ADDRGP4 $952
JUMPV
LABELV $955
line 2211
;2209:	}
;2210:
;2211:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $957
line 2212
;2212:	{
line 2213
;2213:		return;
ADDRGP4 $952
JUMPV
LABELV $957
line 2216
;2214:	}
;2215:
;2216:	if (self->client->ps.powerups[PW_REDFLAG] ||
ADDRLP4 5336
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5340
CNSTI4 0
ASGNI4
ADDRLP4 5336
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
ADDRLP4 5340
INDIRI4
NEI4 $961
ADDRLP4 5336
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 5340
INDIRI4
EQI4 $959
LABELV $961
line 2218
;2217:		self->client->ps.powerups[PW_BLUEFLAG])
;2218:	{ //can't mindtrick while carrying the flag
line 2219
;2219:		return;
ADDRGP4 $952
JUMPV
LABELV $959
line 2222
;2220:	}
;2221:
;2222:	if (self->client->ps.forceAllowDeactivateTime < level.time &&
ADDRLP4 5344
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5344
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $962
ADDRLP4 5344
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $962
line 2224
;2223:		(self->client->ps.fd.forcePowersActive & (1 << FP_TELEPATHY)) )
;2224:	{
line 2225
;2225:		WP_ForcePowerStop( self, FP_TELEPATHY );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 2226
;2226:		return;
ADDRGP4 $952
JUMPV
LABELV $962
line 2229
;2227:	}
;2228:
;2229:	if ( !WP_ForcePowerUsable( self, FP_TELEPATHY ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 5348
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 5348
INDIRI4
CNSTI4 0
NEI4 $965
line 2230
;2230:	{
line 2231
;2231:		return;
ADDRGP4 $952
JUMPV
LABELV $965
line 2234
;2232:	}
;2233:
;2234:	if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 2
NEI4 $967
line 2235
;2235:	{
line 2236
;2236:		visionArc = 360;
ADDRLP4 5284
CNSTF4 1135869952
ASGNF4
line 2237
;2237:	}
ADDRGP4 $968
JUMPV
LABELV $967
line 2238
;2238:	else if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 3
NEI4 $969
line 2239
;2239:	{
line 2240
;2240:		visionArc = 360;
ADDRLP4 5284
CNSTF4 1135869952
ASGNF4
line 2241
;2241:	}
LABELV $969
LABELV $968
line 2243
;2242:
;2243:	VectorCopy( self->client->ps.viewangles, fwdangles );
ADDRLP4 5300
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2244
;2244:	AngleVectors( fwdangles, forward, right, NULL );
ADDRLP4 5300
ARGP4
ADDRLP4 5312
ARGP4
ADDRLP4 5324
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2245
;2245:	VectorCopy( self->client->ps.origin, center );
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2247
;2246:
;2247:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $971
line 2248
;2248:	{
line 2249
;2249:		mins[i] = center[i] - radius;
ADDRLP4 5352
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 5352
INDIRI4
ADDRLP4 4128
ADDP4
ADDRLP4 5352
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 2250
;2250:		maxs[i] = center[i] + radius;
ADDRLP4 5356
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 5356
INDIRI4
ADDRLP4 4140
ADDP4
ADDRLP4 5356
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 2251
;2251:	}
LABELV $972
line 2247
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $971
line 2253
;2252:
;2253:	if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 1
NEI4 $975
line 2254
;2254:	{
line 2255
;2255:		VectorCopy(self->client->ps.origin, tfrom);
ADDRLP4 5272
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2256
;2256:		tfrom[2] += self->client->ps.viewheight;
ADDRLP4 5272+8
ADDRLP4 5272+8
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
line 2257
;2257:		AngleVectors(self->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 5288
ARGP4
ADDRLP4 5352
CNSTP4 0
ASGNP4
ADDRLP4 5352
INDIRP4
ARGP4
ADDRLP4 5352
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2258
;2258:		tto[0] = tfrom[0] + fwd[0]*radius/2;
ADDRLP4 4152
ADDRLP4 5272
INDIRF4
ADDRLP4 5288
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2259
;2259:		tto[1] = tfrom[1] + fwd[1]*radius/2;
ADDRLP4 4152+4
ADDRLP4 5272+4
INDIRF4
ADDRLP4 5288+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2260
;2260:		tto[2] = tfrom[2] + fwd[2]*radius/2;
ADDRLP4 4152+8
ADDRLP4 5272+8
INDIRF4
ADDRLP4 5288+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2262
;2261:
;2262:		trap_Trace(&tr, tfrom, NULL, NULL, tto, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 4192
ARGP4
ADDRLP4 5272
ARGP4
ADDRLP4 5356
CNSTP4 0
ASGNP4
ADDRLP4 5356
INDIRP4
ARGP4
ADDRLP4 5356
INDIRP4
ARGP4
ADDRLP4 4152
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2264
;2263:
;2264:		if (tr.fraction != 1.0 &&
ADDRLP4 4192+8
INDIRF4
CNSTF4 1065353216
EQF4 $952
ADDRLP4 4192+52
INDIRI4
CNSTI4 1023
EQI4 $952
ADDRLP4 5360
CNSTI4 828
ASGNI4
ADDRLP4 5364
CNSTI4 0
ASGNI4
ADDRLP4 5360
INDIRI4
ADDRLP4 4192+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 5364
INDIRI4
EQI4 $952
ADDRLP4 5360
INDIRI4
ADDRLP4 4192+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $952
ADDRLP4 5360
INDIRI4
ADDRLP4 4192+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ADDRLP4 5364
INDIRI4
EQI4 $952
ADDRLP4 5360
INDIRI4
ADDRLP4 4192+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $952
line 2270
;2265:			tr.entityNum != ENTITYNUM_NONE &&
;2266:			g_entities[tr.entityNum].inuse &&
;2267:			g_entities[tr.entityNum].client &&
;2268:			g_entities[tr.entityNum].client->pers.connected &&
;2269:			g_entities[tr.entityNum].client->sess.sessionTeam != TEAM_SPECTATOR)
;2270:		{
line 2271
;2271:			WP_AddAsMindtricked(&self->client->ps.fd, tr.entityNum);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 4192+52
INDIRI4
ARGI4
ADDRGP4 WP_AddAsMindtricked
CALLV
pop
line 2272
;2272:			WP_ForcePowerStart( self, FP_TELEPATHY, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2274
;2273:
;2274:			G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/distract.wav") );
ADDRGP4 $997
ARGP4
ADDRLP4 5368
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 5368
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2276
;2275:
;2276:			self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 2277
;2277:			self->client->ps.forceHandExtendTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2279
;2278:
;2279:			return;
ADDRGP4 $952
JUMPV
line 2282
;2280:		}
;2281:		else
;2282:		{
line 2283
;2283:			return;
LABELV $975
line 2286
;2284:		}
;2285:	}
;2286:	else if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 3
NEI4 $999
line 2287
;2287:	{ //Level 3 tricks everyone on the level..
line 2289
;2288:		gentity_t *ent;
;2289:		qboolean gotAtLeastOne = qfalse;
ADDRLP4 5356
CNSTI4 0
ASGNI4
line 2291
;2290:
;2291:		e = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1002
JUMPV
LABELV $1001
line 2294
;2292:
;2293:		while (e < MAX_CLIENTS)
;2294:		{
line 2295
;2295:			ent = &g_entities[e];
ADDRLP4 5352
CNSTI4 828
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2296
;2296:			e++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2298
;2297:
;2298:			if (ent && ent->inuse && ent->client)
ADDRLP4 5364
CNSTU4 0
ASGNU4
ADDRLP4 5352
INDIRP4
CVPU4 4
ADDRLP4 5364
INDIRU4
EQU4 $1004
ADDRLP4 5352
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1004
ADDRLP4 5352
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 5364
INDIRU4
EQU4 $1004
line 2299
;2299:			{
line 2300
;2300:				if (!ForcePowerUsableOn(self, ent, FP_TELEPATHY))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 5352
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 5368
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 5368
INDIRI4
CNSTI4 0
NEI4 $1006
line 2301
;2301:				{
line 2302
;2302:					continue;
ADDRGP4 $1002
JUMPV
LABELV $1006
line 2305
;2303:				}
;2304:				
;2305:				if (OnSameTeam(self, ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 5352
INDIRP4
ARGP4
ADDRLP4 5372
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 5372
INDIRI4
CNSTI4 0
EQI4 $1008
line 2306
;2306:				{
line 2307
;2307:					continue;
ADDRGP4 $1002
JUMPV
LABELV $1008
line 2310
;2308:				}
;2309:
;2310:				if (self == ent)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 5352
INDIRP4
CVPU4 4
NEU4 $1010
line 2311
;2311:				{
line 2312
;2312:					continue;
ADDRGP4 $1002
JUMPV
LABELV $1010
line 2315
;2313:				}
;2314:
;2315:				if (self->s.number == ent->s.number)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 5352
INDIRP4
INDIRI4
NEI4 $1012
line 2316
;2316:				{
line 2317
;2317:					continue;
ADDRGP4 $1002
JUMPV
LABELV $1012
line 2320
;2318:				}
;2319:
;2320:				if (!ent->client->pers.connected)
ADDRLP4 5352
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1014
line 2321
;2321:				{
line 2322
;2322:					continue;
ADDRGP4 $1002
JUMPV
LABELV $1014
line 2325
;2323:				}
;2324:
;2325:				if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 5352
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1016
line 2326
;2326:				{
line 2327
;2327:					continue;
ADDRGP4 $1002
JUMPV
LABELV $1016
line 2330
;2328:				}
;2329:
;2330:				if (!trap_InPVS(self->client->ps.origin, ent->client->ps.origin))
ADDRLP4 5376
CNSTI4 408
ASGNI4
ADDRLP4 5380
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 5376
INDIRI4
ADDP4
INDIRP4
ADDRLP4 5380
INDIRI4
ADDP4
ARGP4
ADDRLP4 5352
INDIRP4
ADDRLP4 5376
INDIRI4
ADDP4
INDIRP4
ADDRLP4 5380
INDIRI4
ADDP4
ARGP4
ADDRLP4 5384
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 5384
INDIRI4
CNSTI4 0
NEI4 $1018
line 2331
;2331:				{
line 2332
;2332:					continue;
ADDRGP4 $1002
JUMPV
LABELV $1018
line 2335
;2333:				}
;2334:
;2335:				WP_AddAsMindtricked(&self->client->ps.fd, ent->s.number);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 5352
INDIRP4
INDIRI4
ARGI4
ADDRGP4 WP_AddAsMindtricked
CALLV
pop
line 2336
;2336:				gotAtLeastOne = qtrue;
ADDRLP4 5356
CNSTI4 1
ASGNI4
line 2337
;2337:			}
LABELV $1004
line 2338
;2338:		}
LABELV $1002
line 2293
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $1001
line 2340
;2339:
;2340:		if (gotAtLeastOne)
ADDRLP4 5356
INDIRI4
CNSTI4 0
EQI4 $952
line 2341
;2341:		{
line 2342
;2342:			self->client->ps.forceAllowDeactivateTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 2344
;2343:
;2344:			WP_ForcePowerStart( self, FP_TELEPATHY, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2346
;2345:
;2346:			G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/distract.wav") );
ADDRGP4 $997
ARGP4
ADDRLP4 5360
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 5360
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2348
;2347:
;2348:			self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 2349
;2349:			self->client->ps.forceHandExtendTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2350
;2350:		}
line 2352
;2351:
;2352:		return;
ADDRGP4 $952
JUMPV
LABELV $999
line 2355
;2353:	}
;2354:	else
;2355:	{
line 2356
;2356:		numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4128
ARGP4
ADDRLP4 4140
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 5352
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4124
ADDRLP4 5352
INDIRI4
ASGNI4
line 2358
;2357:
;2358:		e = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1025
JUMPV
LABELV $1024
line 2361
;2359:
;2360:		while (e < numListedEntities)
;2361:		{
line 2362
;2362:			ent = &g_entities[entityList[e]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2364
;2363:
;2364:			if (ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1027
line 2365
;2365:			{
line 2366
;2366:				if (ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1029
line 2367
;2367:				{
line 2368
;2368:					VectorCopy(ent->client->ps.origin, thispush_org);
ADDRLP4 4180
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2369
;2369:				}
ADDRGP4 $1030
JUMPV
LABELV $1029
line 2371
;2370:				else
;2371:				{
line 2372
;2372:					VectorCopy(ent->s.pos.trBase, thispush_org);
ADDRLP4 4180
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2373
;2373:				}
LABELV $1030
line 2374
;2374:			}
LABELV $1027
line 2376
;2375:
;2376:			if (ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1031
line 2377
;2377:			{ //not in the arc, don't consider it
line 2378
;2378:				VectorCopy(self->client->ps.origin, tto);
ADDRLP4 4152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2379
;2379:				tto[2] += self->client->ps.viewheight;
ADDRLP4 4152+8
ADDRLP4 4152+8
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
line 2380
;2380:				VectorSubtract(thispush_org, tto, a);
ADDRLP4 4168
ADDRLP4 4180
INDIRF4
ADDRLP4 4152
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4168+4
ADDRLP4 4180+4
INDIRF4
ADDRLP4 4152+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4168+8
ADDRLP4 4180+8
INDIRF4
ADDRLP4 4152+8
INDIRF4
SUBF4
ASGNF4
line 2381
;2381:				vectoangles(a, a);
ADDRLP4 4168
ARGP4
ADDRLP4 4168
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2383
;2382:
;2383:				if (!ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1040
line 2384
;2384:				{
line 2385
;2385:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
CNSTI4 1023
ASGNI4
line 2386
;2386:				}
ADDRGP4 $1041
JUMPV
LABELV $1040
line 2387
;2387:				else if (!InFieldOfVision(self->client->ps.viewangles, visionArc, a))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 5284
INDIRF4
ARGF4
ADDRLP4 4168
ARGP4
ADDRLP4 5356
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 5356
INDIRI4
CNSTI4 0
NEI4 $1042
line 2388
;2388:				{ //only bother with arc rules if the victim is a client
line 2389
;2389:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
CNSTI4 1023
ASGNI4
line 2390
;2390:				}
ADDRGP4 $1043
JUMPV
LABELV $1042
line 2391
;2391:				else if (!ForcePowerUsableOn(self, ent, FP_TELEPATHY))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 5360
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 5360
INDIRI4
CNSTI4 0
NEI4 $1044
line 2392
;2392:				{
line 2393
;2393:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
CNSTI4 1023
ASGNI4
line 2394
;2394:				}
ADDRGP4 $1045
JUMPV
LABELV $1044
line 2395
;2395:				else if (OnSameTeam(self, ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 5364
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 5364
INDIRI4
CNSTI4 0
EQI4 $1046
line 2396
;2396:				{
line 2397
;2397:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
CNSTI4 1023
ASGNI4
line 2398
;2398:				}
LABELV $1046
LABELV $1045
LABELV $1043
LABELV $1041
line 2399
;2399:			}
LABELV $1031
line 2400
;2400:			e++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2401
;2401:		}
LABELV $1025
line 2360
ADDRLP4 8
INDIRI4
ADDRLP4 4124
INDIRI4
LTI4 $1024
line 2402
;2402:	}
line 2404
;2403:
;2404:	e = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1049
JUMPV
LABELV $1048
line 2407
;2405:
;2406:	while (e < numListedEntities)
;2407:	{
line 2408
;2408:		ent = &g_entities[entityList[e]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2410
;2409:
;2410:		if (ent && ent != self && ent->client)
ADDRLP4 5356
ADDRLP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 5360
CNSTU4 0
ASGNU4
ADDRLP4 5356
INDIRU4
ADDRLP4 5360
INDIRU4
EQU4 $1051
ADDRLP4 5356
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $1051
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 5360
INDIRU4
EQU4 $1051
line 2411
;2411:		{
line 2412
;2412:			gotatleastone = 1;
ADDRLP4 4164
CNSTI4 1
ASGNI4
line 2413
;2413:			WP_AddAsMindtricked(&self->client->ps.fd, ent->s.number);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRGP4 WP_AddAsMindtricked
CALLV
pop
line 2414
;2414:		}
LABELV $1051
line 2416
;2415:
;2416:		e++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2417
;2417:	}
LABELV $1049
line 2406
ADDRLP4 8
INDIRI4
ADDRLP4 4124
INDIRI4
LTI4 $1048
line 2419
;2418:
;2419:	if (gotatleastone)
ADDRLP4 4164
INDIRI4
CNSTI4 0
EQI4 $1053
line 2420
;2420:	{
line 2421
;2421:		self->client->ps.forceAllowDeactivateTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 2423
;2422:
;2423:		WP_ForcePowerStart( self, FP_TELEPATHY, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2425
;2424:
;2425:		G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/distract.wav") );
ADDRGP4 $997
ARGP4
ADDRLP4 5352
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 5352
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2427
;2426:
;2427:		self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 2428
;2428:		self->client->ps.forceHandExtendTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2429
;2429:	}
LABELV $1053
line 2430
;2430:}
LABELV $952
endproc ForceTelepathy 5388 28
export GEntity_UseFunc
proc GEntity_UseFunc 4 12
line 2433
;2431:
;2432:void GEntity_UseFunc( gentity_t *self, gentity_t *other, gentity_t *activator )
;2433:{
line 2434
;2434:	self->use(self, other, activator);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CALLV
pop
line 2435
;2435:}
LABELV $1057
endproc GEntity_UseFunc 4 12
export CanCounterThrow
proc CanCounterThrow 8 8
line 2438
;2436:
;2437:qboolean CanCounterThrow(gentity_t *self, qboolean pull)
;2438:{
line 2439
;2439:	int powerUse = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2441
;2440:
;2441:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1059
line 2442
;2442:	{
line 2443
;2443:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1059
line 2446
;2444:	}
;2445:
;2446:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1061
line 2447
;2447:	{
line 2448
;2448:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1061
line 2451
;2449:	}
;2450:
;2451:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1063
line 2452
;2452:	{
line 2453
;2453:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1063
line 2456
;2454:	}
;2455:
;2456:	if ( self->client->ps.powerups[PW_DISINT_4] > level.time )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1065
line 2457
;2457:	{
line 2458
;2458:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1065
line 2461
;2459:	}
;2460:
;2461:	if (pull)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1068
line 2462
;2462:	{
line 2463
;2463:		powerUse = FP_PULL;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 2464
;2464:	}
ADDRGP4 $1069
JUMPV
LABELV $1068
line 2466
;2465:	else
;2466:	{
line 2467
;2467:		powerUse = FP_PUSH;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 2468
;2468:	}
LABELV $1069
line 2470
;2469:
;2470:	if ( !WP_ForcePowerUsable( self, powerUse ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1070
line 2471
;2471:	{
line 2472
;2472:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1070
line 2475
;2473:	}
;2474:
;2475:	if (self->client->ps.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1072
line 2476
;2476:	{ //you cannot counter a push/pull if you're in the air
line 2477
;2477:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1072
line 2480
;2478:	}
;2479:
;2480:	return 1;
CNSTI4 1
RETI4
LABELV $1058
endproc CanCounterThrow 8 8
export G_InGetUpAnim
proc G_InGetUpAnim 16 0
line 2484
;2481:}
;2482:
;2483:qboolean G_InGetUpAnim(playerState_t *ps)
;2484:{
line 2485
;2485:	switch( (ps->legsAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 929
LTI4 $1075
ADDRLP4 0
INDIRI4
CNSTI4 942
GTI4 $1075
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1079-3716
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1079
address $1078
address $1078
address $1078
address $1078
address $1078
address $1075
address $1075
address $1078
address $1078
address $1078
address $1078
address $1078
address $1078
address $1078
code
line 2486
;2486:	{
LABELV $1078
line 2499
;2487:	case BOTH_GETUP1:
;2488:	case BOTH_GETUP2:
;2489:	case BOTH_GETUP3:
;2490:	case BOTH_GETUP4:
;2491:	case BOTH_GETUP5:
;2492:	case BOTH_FORCE_GETUP_F1:
;2493:	case BOTH_FORCE_GETUP_F2:
;2494:	case BOTH_FORCE_GETUP_B1:
;2495:	case BOTH_FORCE_GETUP_B2:
;2496:	case BOTH_FORCE_GETUP_B3:
;2497:	case BOTH_FORCE_GETUP_B4:
;2498:	case BOTH_FORCE_GETUP_B5:
;2499:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1074
JUMPV
LABELV $1075
line 2502
;2500:	}
;2501:
;2502:	switch( (ps->torsoAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 929
LTI4 $1081
ADDRLP4 8
INDIRI4
CNSTI4 942
GTI4 $1081
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1085-3716
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1085
address $1084
address $1084
address $1084
address $1084
address $1084
address $1081
address $1081
address $1084
address $1084
address $1084
address $1084
address $1084
address $1084
address $1084
code
line 2503
;2503:	{
LABELV $1084
line 2516
;2504:	case BOTH_GETUP1:
;2505:	case BOTH_GETUP2:
;2506:	case BOTH_GETUP3:
;2507:	case BOTH_GETUP4:
;2508:	case BOTH_GETUP5:
;2509:	case BOTH_FORCE_GETUP_F1:
;2510:	case BOTH_FORCE_GETUP_F2:
;2511:	case BOTH_FORCE_GETUP_B1:
;2512:	case BOTH_FORCE_GETUP_B2:
;2513:	case BOTH_FORCE_GETUP_B3:
;2514:	case BOTH_FORCE_GETUP_B4:
;2515:	case BOTH_FORCE_GETUP_B5:
;2516:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1074
JUMPV
LABELV $1081
line 2519
;2517:	}
;2518:
;2519:	return qfalse;
CNSTI4 0
RETI4
LABELV $1074
endproc G_InGetUpAnim 16 0
lit
align 4
LABELV $1088
byte 4 0
skip 8
export ForceThrow
code
proc ForceThrow 9680 28
line 2524
;2520:}
;2521:
;2522:extern void Touch_Button(gentity_t *ent, gentity_t *other, trace_t *trace );
;2523:void ForceThrow( gentity_t *self, qboolean pull )
;2524:{
line 2534
;2525:	//shove things in front of you away
;2526:	float		dist;
;2527:	gentity_t	*ent;
;2528:	int			entityList[MAX_GENTITIES];
;2529:	gentity_t	*push_list[MAX_GENTITIES];
;2530:	int			numListedEntities;
;2531:	vec3_t		mins, maxs;
;2532:	vec3_t		v;
;2533:	int			i, e;
;2534:	int			ent_count = 0;
ADDRLP4 9364
CNSTI4 0
ASGNI4
line 2535
;2535:	int			radius = 1024; //since it's view-based now. //350;
ADDRLP4 9360
CNSTI4 1024
ASGNI4
line 2540
;2536:	int			powerLevel;
;2537:	int			visionArc;
;2538:	int			pushPower;
;2539:	int			pushPowerMod;
;2540:	vec3_t		center, ent_org, size, forward, right, end, dir, fwdangles = {0};
ADDRLP4 9476
ADDRGP4 $1088
INDIRB
ASGNB 12
line 2547
;2541:	float		dot1;
;2542:	trace_t		tr;
;2543:	int			x;
;2544:	vec3_t		pushDir;
;2545:	vec3_t		thispush_org;
;2546:	vec3_t		tfrom, tto, fwd, a;
;2547:	float		knockback = pull?0:200;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1090
ADDRLP4 9536
CNSTI4 0
ASGNI4
ADDRGP4 $1091
JUMPV
LABELV $1090
ADDRLP4 9536
CNSTI4 200
ASGNI4
LABELV $1091
ADDRLP4 9472
ADDRLP4 9536
INDIRI4
CVIF4 4
ASGNF4
line 2548
;2548:	int			powerUse = 0;
ADDRLP4 9396
CNSTI4 0
ASGNI4
line 2550
;2549:
;2550:	visionArc = 0;
ADDRLP4 9468
CNSTI4 0
ASGNI4
line 2552
;2551:
;2552:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE && (self->client->ps.forceHandExtend != HANDEXTEND_KNOCKDOWN || !G_InGetUpAnim(&self->client->ps)))
ADDRLP4 9540
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9544
ADDRLP4 9540
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 9544
INDIRI4
CNSTI4 0
EQI4 $1092
ADDRLP4 9544
INDIRI4
CNSTI4 8
NEI4 $1094
ADDRLP4 9540
INDIRP4
ARGP4
ADDRLP4 9548
ADDRGP4 G_InGetUpAnim
CALLI4
ASGNI4
ADDRLP4 9548
INDIRI4
CNSTI4 0
NEI4 $1092
LABELV $1094
line 2553
;2553:	{
line 2554
;2554:		return;
ADDRGP4 $1087
JUMPV
LABELV $1092
line 2557
;2555:	}
;2556:
;2557:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1095
line 2558
;2558:	{
line 2559
;2559:		return;
ADDRGP4 $1087
JUMPV
LABELV $1095
line 2562
;2560:	}
;2561:
;2562:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1097
line 2563
;2563:	{
line 2564
;2564:		return;
ADDRGP4 $1087
JUMPV
LABELV $1097
line 2566
;2565:	}
;2566:	if ( self->client->ps.powerups[PW_DISINT_4] > level.time )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1099
line 2567
;2567:	{
line 2568
;2568:		return;
ADDRGP4 $1087
JUMPV
LABELV $1099
line 2570
;2569:	}
;2570:	if (pull)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1102
line 2571
;2571:	{
line 2572
;2572:		powerUse = FP_PULL;
ADDRLP4 9396
CNSTI4 4
ASGNI4
line 2573
;2573:	}
ADDRGP4 $1103
JUMPV
LABELV $1102
line 2575
;2574:	else
;2575:	{
line 2576
;2576:		powerUse = FP_PUSH;
ADDRLP4 9396
CNSTI4 3
ASGNI4
line 2577
;2577:	}
LABELV $1103
line 2579
;2578:
;2579:	if ( !WP_ForcePowerUsable( self, powerUse ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 9396
INDIRI4
ARGI4
ADDRLP4 9552
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 9552
INDIRI4
CNSTI4 0
NEI4 $1104
line 2580
;2580:	{
line 2581
;2581:		return;
ADDRGP4 $1087
JUMPV
LABELV $1104
line 2584
;2582:	}
;2583:
;2584:	if (!pull && self->client->ps.saberLockTime > level.time && self->client->ps.saberLockFrame)
ADDRLP4 9556
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 9556
INDIRI4
NEI4 $1106
ADDRLP4 9560
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9560
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1106
ADDRLP4 9560
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 9556
INDIRI4
EQI4 $1106
line 2585
;2585:	{
line 2586
;2586:		G_Sound( self, CHAN_BODY, G_SoundIndex( "sound/weapons/force/push.wav" ) );
ADDRGP4 $1109
ARGP4
ADDRLP4 9564
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9564
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2587
;2587:		self->client->ps.powerups[PW_DISINT_4] = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 2589
;2588:
;2589:		self->client->ps.saberLockHits += self->client->ps.fd.forcePowerLevel[FP_PUSH]*2;
ADDRLP4 9568
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9572
ADDRLP4 9568
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 9572
INDIRP4
ADDRLP4 9572
INDIRP4
INDIRI4
ADDRLP4 9568
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
line 2591
;2590:
;2591:		WP_ForcePowerStart( self, FP_PUSH, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2592
;2592:		return;
ADDRGP4 $1087
JUMPV
LABELV $1106
line 2595
;2593:	}
;2594:
;2595:	WP_ForcePowerStart( self, powerUse, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 9396
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2598
;2596:
;2597:	//make sure this plays and that you cannot press fire for about 1 second after this
;2598:	if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1111
line 2599
;2599:	{
line 2600
;2600:		G_Sound( self, CHAN_BODY, G_SoundIndex( "sound/weapons/force/pull.wav" ) );
ADDRGP4 $1113
ARGP4
ADDRLP4 9564
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9564
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2601
;2601:		if (self->client->ps.forceHandExtend == HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1114
line 2602
;2602:		{
line 2603
;2603:			self->client->ps.forceHandExtend = HANDEXTEND_FORCEPULL;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 2
ASGNI4
line 2604
;2604:			self->client->ps.forceHandExtendTime = level.time + 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 2605
;2605:		}
LABELV $1114
line 2606
;2606:		self->client->ps.powerups[PW_DISINT_4] = self->client->ps.forceHandExtendTime + 200;
ADDRLP4 9568
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9568
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 9568
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 2607
;2607:	}
ADDRGP4 $1112
JUMPV
LABELV $1111
line 2609
;2608:	else
;2609:	{
line 2610
;2610:		G_Sound( self, CHAN_BODY, G_SoundIndex( "sound/weapons/force/push.wav" ) );
ADDRGP4 $1109
ARGP4
ADDRLP4 9564
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9564
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2611
;2611:		if (self->client->ps.forceHandExtend == HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1117
line 2612
;2612:		{
line 2613
;2613:			self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 2614
;2614:			self->client->ps.forceHandExtendTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2615
;2615:		}
ADDRGP4 $1118
JUMPV
LABELV $1117
line 2616
;2616:		else if (self->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN && G_InGetUpAnim(&self->client->ps))
ADDRLP4 9568
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9568
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1120
ADDRLP4 9568
INDIRP4
ARGP4
ADDRLP4 9572
ADDRGP4 G_InGetUpAnim
CALLI4
ASGNI4
ADDRLP4 9572
INDIRI4
CNSTI4 0
EQI4 $1120
line 2617
;2617:		{
line 2618
;2618:			if (self->client->ps.forceDodgeAnim > 4)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 4
LEI4 $1122
line 2619
;2619:			{
line 2620
;2620:				self->client->ps.forceDodgeAnim -= 8;
ADDRLP4 9576
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
ASGNP4
ADDRLP4 9576
INDIRP4
ADDRLP4 9576
INDIRP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 2621
;2621:			}
LABELV $1122
line 2622
;2622:			self->client->ps.forceDodgeAnim += 8; //special case, play push on upper torso, but keep playing current knockdown anim on legs
ADDRLP4 9576
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
ASGNP4
ADDRLP4 9576
INDIRP4
ADDRLP4 9576
INDIRP4
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 2623
;2623:		}
LABELV $1120
LABELV $1118
line 2624
;2624:		self->client->ps.powerups[PW_DISINT_4] = level.time + 1100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
line 2625
;2625:	}
LABELV $1112
line 2627
;2626:
;2627:	VectorCopy( self->client->ps.viewangles, fwdangles );
ADDRLP4 9476
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2628
;2628:	AngleVectors( fwdangles, forward, right, NULL );
ADDRLP4 9476
ARGP4
ADDRLP4 9348
ARGP4
ADDRLP4 9524
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2629
;2629:	VectorCopy( self->client->ps.origin, center );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2631
;2630:
;2631:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1125
line 2632
;2632:	{
line 2633
;2633:		mins[i] = center[i] - radius;
ADDRLP4 9564
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9564
INDIRI4
ADDRLP4 9436
ADDP4
ADDRLP4 9564
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 2634
;2634:		maxs[i] = center[i] + radius;
ADDRLP4 9568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9568
INDIRI4
ADDRLP4 9448
ADDP4
ADDRLP4 9568
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2635
;2635:	}
LABELV $1126
line 2631
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1125
line 2638
;2636:
;2637:
;2638:	if (pull)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1129
line 2639
;2639:	{
line 2640
;2640:		powerLevel = self->client->ps.fd.forcePowerLevel[FP_PULL];
ADDRLP4 9428
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
ASGNI4
line 2641
;2641:		pushPower = 256*self->client->ps.fd.forcePowerLevel[FP_PULL];
ADDRLP4 9464
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ASGNI4
line 2642
;2642:	}
ADDRGP4 $1130
JUMPV
LABELV $1129
line 2644
;2643:	else
;2644:	{
line 2645
;2645:		powerLevel = self->client->ps.fd.forcePowerLevel[FP_PUSH];
ADDRLP4 9428
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ASGNI4
line 2646
;2646:		pushPower = 256*self->client->ps.fd.forcePowerLevel[FP_PUSH];
ADDRLP4 9464
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ASGNI4
line 2647
;2647:	}
LABELV $1130
line 2649
;2648:
;2649:	if (!powerLevel)
ADDRLP4 9428
INDIRI4
CNSTI4 0
NEI4 $1131
line 2650
;2650:	{ //Shouldn't have made it here..
line 2651
;2651:		return;
ADDRGP4 $1087
JUMPV
LABELV $1131
line 2654
;2652:	}
;2653:
;2654:	if (powerLevel == FORCE_LEVEL_2)
ADDRLP4 9428
INDIRI4
CNSTI4 2
NEI4 $1133
line 2655
;2655:	{
line 2656
;2656:		visionArc = 60;
ADDRLP4 9468
CNSTI4 60
ASGNI4
line 2657
;2657:	}
ADDRGP4 $1134
JUMPV
LABELV $1133
line 2658
;2658:	else if (powerLevel == FORCE_LEVEL_3)
ADDRLP4 9428
INDIRI4
CNSTI4 3
NEI4 $1135
line 2659
;2659:	{
line 2660
;2660:		visionArc = 180;
ADDRLP4 9468
CNSTI4 180
ASGNI4
line 2661
;2661:	}
LABELV $1135
LABELV $1134
line 2663
;2662:
;2663:	if (powerLevel == FORCE_LEVEL_1)
ADDRLP4 9428
INDIRI4
CNSTI4 1
NEI4 $1137
line 2664
;2664:	{ //can only push/pull targeted things at level 1
line 2665
;2665:		VectorCopy(self->client->ps.origin, tfrom);
ADDRLP4 9488
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2666
;2666:		tfrom[2] += self->client->ps.viewheight;
ADDRLP4 9488+8
ADDRLP4 9488+8
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
line 2667
;2667:		AngleVectors(self->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 9512
ARGP4
ADDRLP4 9564
CNSTP4 0
ASGNP4
ADDRLP4 9564
INDIRP4
ARGP4
ADDRLP4 9564
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2668
;2668:		tto[0] = tfrom[0] + fwd[0]*radius/2;
ADDRLP4 9416
ADDRLP4 9488
INDIRF4
ADDRLP4 9512
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2669
;2669:		tto[1] = tfrom[1] + fwd[1]*radius/2;
ADDRLP4 9416+4
ADDRLP4 9488+4
INDIRF4
ADDRLP4 9512+4
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2670
;2670:		tto[2] = tfrom[2] + fwd[2]*radius/2;
ADDRLP4 9416+8
ADDRLP4 9488+8
INDIRF4
ADDRLP4 9512+8
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2672
;2671:
;2672:		trap_Trace(&tr, tfrom, NULL, NULL, tto, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 8268
ARGP4
ADDRLP4 9488
ARGP4
ADDRLP4 9568
CNSTP4 0
ASGNP4
ADDRLP4 9568
INDIRP4
ARGP4
ADDRLP4 9568
INDIRP4
ARGP4
ADDRLP4 9416
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2674
;2673:
;2674:		if (tr.fraction != 1.0 &&
ADDRLP4 8268+8
INDIRF4
CNSTF4 1065353216
EQF4 $1087
ADDRLP4 8268+52
INDIRI4
CNSTI4 1023
EQI4 $1087
line 2676
;2675:			tr.entityNum != ENTITYNUM_NONE)
;2676:		{
line 2677
;2677:			if (!g_entities[tr.entityNum].client && g_entities[tr.entityNum].s.eType == ET_GRAPPLE)
ADDRLP4 9572
CNSTI4 828
ASGNI4
ADDRLP4 9572
INDIRI4
ADDRLP4 8268+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1150
ADDRLP4 9572
INDIRI4
ADDRLP4 8268+52
INDIRI4
MULI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1150
line 2678
;2678:			{ //g2animent
line 2679
;2679:				if (g_entities[tr.entityNum].s.genericenemyindex < level.time)
CNSTI4 828
ADDRLP4 8268+52
INDIRI4
MULI4
ADDRGP4 g_entities+172
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1156
line 2680
;2680:				{
line 2681
;2681:					g_entities[tr.entityNum].s.genericenemyindex = level.time + 2000;
CNSTI4 828
ADDRLP4 8268+52
INDIRI4
MULI4
ADDRGP4 g_entities+172
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2682
;2682:				}
LABELV $1156
line 2683
;2683:			}
LABELV $1150
line 2685
;2684:
;2685:			numListedEntities = 0;
ADDRLP4 9400
CNSTI4 0
ASGNI4
line 2686
;2686:			entityList[numListedEntities] = tr.entityNum;
ADDRLP4 9400
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
ADDRLP4 8268+52
INDIRI4
ASGNI4
line 2687
;2687:			numListedEntities++;
ADDRLP4 9400
ADDRLP4 9400
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2688
;2688:		}
line 2690
;2689:		else
;2690:		{
line 2692
;2691:			//didn't get anything, so just
;2692:			return;
line 2694
;2693:		}
;2694:	}
ADDRGP4 $1138
JUMPV
LABELV $1137
line 2696
;2695:	else
;2696:	{
line 2697
;2697:		numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 9436
ARGP4
ADDRLP4 9448
ARGP4
ADDRLP4 4172
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 9564
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 9400
ADDRLP4 9564
INDIRI4
ASGNI4
line 2699
;2698:
;2699:		e = 0;
ADDRLP4 4144
CNSTI4 0
ASGNI4
ADDRGP4 $1166
JUMPV
LABELV $1165
line 2702
;2700:
;2701:		while (e < numListedEntities)
;2702:		{
line 2703
;2703:			ent = &g_entities[entityList[e]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2705
;2704:
;2705:			if (!ent->client && ent->s.eType == ET_GRAPPLE)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1168
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1168
line 2706
;2706:			{ //g2animent
line 2707
;2707:				if (ent->s.genericenemyindex < level.time)
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1170
line 2708
;2708:				{
line 2709
;2709:					ent->s.genericenemyindex = level.time + 2000;
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2710
;2710:				}
LABELV $1170
line 2711
;2711:			}
LABELV $1168
line 2713
;2712:
;2713:			if (ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1174
line 2714
;2714:			{
line 2715
;2715:				if (ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1176
line 2716
;2716:				{
line 2717
;2717:					VectorCopy(ent->client->ps.origin, thispush_org);
ADDRLP4 9368
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2718
;2718:				}
ADDRGP4 $1177
JUMPV
LABELV $1176
line 2720
;2719:				else
;2720:				{
line 2721
;2721:					VectorCopy(ent->s.pos.trBase, thispush_org);
ADDRLP4 9368
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2722
;2722:				}
LABELV $1177
line 2723
;2723:			}
LABELV $1174
line 2725
;2724:
;2725:			if (ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1178
line 2726
;2726:			{ //not in the arc, don't consider it
line 2727
;2727:				VectorCopy(self->client->ps.origin, tto);
ADDRLP4 9416
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2728
;2728:				tto[2] += self->client->ps.viewheight;
ADDRLP4 9416+8
ADDRLP4 9416+8
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
line 2729
;2729:				VectorSubtract(thispush_org, tto, a);
ADDRLP4 9404
ADDRLP4 9368
INDIRF4
ADDRLP4 9416
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9404+4
ADDRLP4 9368+4
INDIRF4
ADDRLP4 9416+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9404+8
ADDRLP4 9368+8
INDIRF4
ADDRLP4 9416+8
INDIRF4
SUBF4
ASGNF4
line 2730
;2730:				vectoangles(a, a);
ADDRLP4 9404
ARGP4
ADDRLP4 9404
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2732
;2731:
;2732:				if (ent->client && !InFieldOfVision(self->client->ps.viewangles, visionArc, a) &&
ADDRLP4 9572
CNSTI4 408
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 9572
INDIRI4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1187
ADDRFP4 0
INDIRP4
ADDRLP4 9572
INDIRI4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 9468
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 9404
ARGP4
ADDRLP4 9576
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 9576
INDIRI4
CNSTI4 0
NEI4 $1187
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 9396
INDIRI4
ARGI4
ADDRLP4 9580
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 9580
INDIRI4
CNSTI4 0
EQI4 $1187
line 2734
;2733:					ForcePowerUsableOn(self, ent, powerUse))
;2734:				{ //only bother with arc rules if the victim is a client
line 2735
;2735:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
CNSTI4 1023
ASGNI4
line 2736
;2736:				}
ADDRGP4 $1188
JUMPV
LABELV $1187
line 2737
;2737:				else if (ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1189
line 2738
;2738:				{
line 2739
;2739:					if (pull)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1191
line 2740
;2740:					{
line 2741
;2741:						if (!ForcePowerUsableOn(self, ent, FP_PULL))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 9584
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 9584
INDIRI4
CNSTI4 0
NEI4 $1192
line 2742
;2742:						{
line 2743
;2743:							entityList[e] = ENTITYNUM_NONE;
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
CNSTI4 1023
ASGNI4
line 2744
;2744:						}
line 2745
;2745:					}
ADDRGP4 $1192
JUMPV
LABELV $1191
line 2747
;2746:					else
;2747:					{
line 2748
;2748:						if (!ForcePowerUsableOn(self, ent, FP_PUSH))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 9584
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 9584
INDIRI4
CNSTI4 0
NEI4 $1195
line 2749
;2749:						{
line 2750
;2750:							entityList[e] = ENTITYNUM_NONE;
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
CNSTI4 1023
ASGNI4
line 2751
;2751:						}
LABELV $1195
line 2752
;2752:					}
LABELV $1192
line 2753
;2753:				}
LABELV $1189
LABELV $1188
line 2754
;2754:			}
LABELV $1178
line 2755
;2755:			e++;
ADDRLP4 4144
ADDRLP4 4144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2756
;2756:		}
LABELV $1166
line 2701
ADDRLP4 4144
INDIRI4
ADDRLP4 9400
INDIRI4
LTI4 $1165
line 2757
;2757:	}
LABELV $1138
line 2759
;2758:
;2759:	for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 4144
CNSTI4 0
ASGNI4
ADDRGP4 $1200
JUMPV
LABELV $1197
line 2760
;2760:	{
line 2761
;2761:		if (entityList[e] != ENTITYNUM_NONE &&
ADDRLP4 9564
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
INDIRI4
ASGNI4
ADDRLP4 9564
INDIRI4
CNSTI4 1023
EQI4 $1201
ADDRLP4 9564
INDIRI4
CNSTI4 0
LTI4 $1201
ADDRLP4 9564
INDIRI4
CNSTI4 1024
GEI4 $1201
line 2764
;2762:			entityList[e] >= 0 &&
;2763:			entityList[e] < MAX_GENTITIES)
;2764:		{
line 2765
;2765:			ent = &g_entities[entityList[e]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2766
;2766:		}
ADDRGP4 $1202
JUMPV
LABELV $1201
line 2768
;2767:		else
;2768:		{
line 2769
;2769:			ent = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2770
;2770:		}
LABELV $1202
line 2772
;2771:
;2772:		if (!ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1203
line 2773
;2773:			continue;
ADDRGP4 $1198
JUMPV
LABELV $1203
line 2774
;2774:		if (ent == self)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $1205
line 2775
;2775:			continue;
ADDRGP4 $1198
JUMPV
LABELV $1205
line 2776
;2776:		if (ent->client && OnSameTeam(ent, self))
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1207
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 9572
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 9572
INDIRI4
CNSTI4 0
EQI4 $1207
line 2777
;2777:		{
line 2778
;2778:			continue;
ADDRGP4 $1198
JUMPV
LABELV $1207
line 2780
;2779:		}
;2780:		if ( !(ent->inuse) )
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1209
line 2781
;2781:			continue;
ADDRGP4 $1198
JUMPV
LABELV $1209
line 2782
;2782:		if ( ent->s.eType != ET_MISSILE )
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1211
line 2783
;2783:		{
line 2784
;2784:			if ( ent->s.eType != ET_ITEM )
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1212
line 2785
;2785:			{
line 2787
;2786:				//FIXME: need pushable objects
;2787:				if ( Q_stricmp( "func_button", ent->classname ) == 0 )
ADDRGP4 $1217
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9576
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9576
INDIRI4
CNSTI4 0
NEI4 $1215
line 2788
;2788:				{//we might push it
line 2789
;2789:					if ( pull || !(ent->spawnflags&SPF_BUTTON_FPUSHABLE) )
ADDRLP4 9580
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 9580
INDIRI4
NEI4 $1220
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 9580
INDIRI4
NEI4 $1212
LABELV $1220
line 2790
;2790:					{//not force-pushable, never pullable
line 2791
;2791:						continue;
ADDRGP4 $1198
JUMPV
line 2793
;2792:					}
;2793:				}
LABELV $1215
line 2795
;2794:				else
;2795:				{
line 2796
;2796:					if ( ent->s.eFlags & EF_NODRAW )
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1221
line 2797
;2797:					{
line 2798
;2798:						continue;
ADDRGP4 $1198
JUMPV
LABELV $1221
line 2800
;2799:					}
;2800:					if ( !ent->client )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1212
line 2801
;2801:					{
line 2802
;2802:						if ( Q_stricmp( "lightsaber", ent->classname ) != 0 )
ADDRGP4 $1227
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9580
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9580
INDIRI4
CNSTI4 0
EQI4 $1212
line 2803
;2803:						{//not a lightsaber 
line 2804
;2804:							if ( Q_stricmp( "func_door", ent->classname ) != 0 || !(ent->spawnflags & 2/*MOVER_FORCE_ACTIVATE*/) )
ADDRGP4 $1230
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9584
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9588
CNSTI4 0
ASGNI4
ADDRLP4 9584
INDIRI4
ADDRLP4 9588
INDIRI4
NEI4 $1231
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 9588
INDIRI4
NEI4 $1228
LABELV $1231
line 2805
;2805:							{//not a force-usable door
line 2806
;2806:								if ( Q_stricmp( "limb", ent->classname ) )
ADDRGP4 $1234
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9592
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9592
INDIRI4
CNSTI4 0
EQI4 $1212
line 2807
;2807:								{//not a limb
line 2808
;2808:									continue;
ADDRGP4 $1198
JUMPV
line 2810
;2809:								}
;2810:							}
LABELV $1228
line 2811
;2811:							else if ( ent->moverState != MOVER_POS1 && ent->moverState != MOVER_POS2 )
ADDRLP4 9592
ADDRLP4 4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 9592
INDIRI4
CNSTI4 0
EQI4 $1212
ADDRLP4 9592
INDIRI4
CNSTI4 1
EQI4 $1212
line 2812
;2812:							{//not at rest
line 2813
;2813:								continue;
ADDRGP4 $1198
JUMPV
line 2815
;2814:							}
;2815:						}
line 2816
;2816:					}
line 2817
;2817:				}
line 2818
;2818:			}
line 2819
;2819:		}
LABELV $1211
line 2821
;2820:		else
;2821:		{
line 2822
;2822:			if ( ent->s.pos.trType == TR_STATIONARY && (ent->s.eFlags&EF_MISSILE_STICK) )
ADDRLP4 9580
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 9580
INDIRI4
NEI4 $1237
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
ADDRLP4 9580
INDIRI4
EQI4 $1237
line 2823
;2823:			{//can't force-push/pull stuck missiles (detpacks, tripmines)
line 2824
;2824:				continue;
ADDRGP4 $1198
JUMPV
LABELV $1237
line 2826
;2825:			}
;2826:			if ( ent->s.pos.trType == TR_STATIONARY && ent->s.weapon != WP_THERMAL )
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1239
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 11
EQI4 $1239
line 2827
;2827:			{//only thermal detonators can be pushed once stopped
line 2828
;2828:				continue;
ADDRGP4 $1198
JUMPV
LABELV $1239
line 2830
;2829:			}
;2830:		}
LABELV $1212
line 2834
;2831:
;2832:		//this is all to see if we need to start a saber attack, if it's in flight, this doesn't matter
;2833:		// find the distance from the edge of the bounding box
;2834:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1241
line 2835
;2835:		{
line 2836
;2836:			if ( center[i] < ent->r.absmin[i] ) 
ADDRLP4 9576
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9576
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9576
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $1245
line 2837
;2837:			{
line 2838
;2838:				v[i] = ent->r.absmin[i] - center[i];
ADDRLP4 9580
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9580
INDIRI4
ADDRLP4 20
ADDP4
ADDRLP4 9580
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 9580
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2839
;2839:			} else if ( center[i] > ent->r.absmax[i] ) 
ADDRGP4 $1246
JUMPV
LABELV $1245
ADDRLP4 9580
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9580
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9580
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $1247
line 2840
;2840:			{
line 2841
;2841:				v[i] = center[i] - ent->r.absmax[i];
ADDRLP4 9584
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9584
INDIRI4
ADDRLP4 20
ADDP4
ADDRLP4 9584
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9584
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2842
;2842:			} else 
ADDRGP4 $1248
JUMPV
LABELV $1247
line 2843
;2843:			{
line 2844
;2844:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 0
ASGNF4
line 2845
;2845:			}
LABELV $1248
LABELV $1246
line 2846
;2846:		}
LABELV $1242
line 2834
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1241
line 2848
;2847:
;2848:		VectorSubtract( ent->r.absmax, ent->r.absmin, size );
ADDRLP4 4160
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4160+4
ADDRLP4 4
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4160+8
ADDRLP4 4
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2849
;2849:		VectorMA( ent->r.absmin, 0.5, size, ent_org );
ADDRLP4 9588
CNSTF4 1056964608
ASGNF4
ADDRLP4 4132
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 9588
INDIRF4
ADDRLP4 4160
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4132+4
ADDRLP4 4
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 9588
INDIRF4
ADDRLP4 4160+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4132+8
ADDRLP4 4
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 4160+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2851
;2850:
;2851:		VectorSubtract( ent_org, center, dir );
ADDRLP4 4148
ADDRLP4 4132
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4148+4
ADDRLP4 4132+4
INDIRF4
ADDRLP4 8+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4148+8
ADDRLP4 4132+8
INDIRF4
ADDRLP4 8+8
INDIRF4
SUBF4
ASGNF4
line 2852
;2852:		VectorNormalize( dir );
ADDRLP4 4148
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2853
;2853:		if ( (dot1 = DotProduct( dir, forward )) < 0.6 )
ADDRLP4 9592
ADDRLP4 4148
INDIRF4
ADDRLP4 9348
INDIRF4
MULF4
ADDRLP4 4148+4
INDIRF4
ADDRLP4 9348+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4148+8
INDIRF4
ADDRLP4 9348+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9460
ADDRLP4 9592
INDIRF4
ASGNF4
ADDRLP4 9592
INDIRF4
CNSTF4 1058642330
GEF4 $1261
line 2854
;2854:			continue;
ADDRGP4 $1198
JUMPV
LABELV $1261
line 2856
;2855:
;2856:		dist = VectorLength( v );
ADDRLP4 20
ARGP4
ADDRLP4 9596
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 9380
ADDRLP4 9596
INDIRF4
ASGNF4
line 2861
;2857:
;2858:		//Now check and see if we can actually deflect it
;2859:		//method1
;2860:		//if within a certain range, deflect it
;2861:		if ( dist >= radius ) 
ADDRLP4 9380
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
LTF4 $1267
line 2862
;2862:		{
line 2863
;2863:			continue;
ADDRGP4 $1198
JUMPV
LABELV $1267
line 2867
;2864:		}
;2865:	
;2866:		//in PVS?
;2867:		if ( !ent->r.bmodel && !trap_InPVS( ent_org, self->client->ps.origin ) )
ADDRLP4 4
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1269
ADDRLP4 4132
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9600
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 9600
INDIRI4
CNSTI4 0
NEI4 $1269
line 2868
;2868:		{//must be in PVS
line 2869
;2869:			continue;
ADDRGP4 $1198
JUMPV
LABELV $1269
line 2873
;2870:		}
;2871:
;2872:		//really should have a clear LOS to this thing...
;2873:		trap_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, ent_org, self->s.number, MASK_SHOT );
ADDRLP4 8268
ARGP4
ADDRLP4 9604
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9604
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9608
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 9608
INDIRP4
ARGP4
ADDRLP4 9608
INDIRP4
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 9604
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2874
;2874:		if ( tr.fraction < 1.0f && tr.entityNum != ent->s.number )
ADDRLP4 8268+8
INDIRF4
CNSTF4 1065353216
GEF4 $1271
ADDRLP4 8268+52
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
EQI4 $1271
line 2875
;2875:		{//must have clear LOS
line 2876
;2876:			continue;
ADDRGP4 $1198
JUMPV
LABELV $1271
line 2880
;2877:		}
;2878:
;2879:		// ok, we are within the radius, add us to the incoming list
;2880:		push_list[ent_count] = ent;
ADDRLP4 9364
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 2881
;2881:		ent_count++;
ADDRLP4 9364
ADDRLP4 9364
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2882
;2882:	}
LABELV $1198
line 2759
ADDRLP4 4144
ADDRLP4 4144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1200
ADDRLP4 4144
INDIRI4
ADDRLP4 9400
INDIRI4
LTI4 $1197
line 2884
;2883:
;2884:	if ( ent_count )
ADDRLP4 9364
INDIRI4
CNSTI4 0
EQI4 $1275
line 2885
;2885:	{
line 2887
;2886:		//method1:
;2887:		for ( x = 0; x < ent_count; x++ )
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $1280
JUMPV
LABELV $1277
line 2888
;2888:		{
line 2889
;2889:			int modPowerLevel = powerLevel;
ADDRLP4 9564
ADDRLP4 9428
INDIRI4
ASGNI4
line 2892
;2890:
;2891:	
;2892:			if (push_list[x]->client)
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1281
line 2893
;2893:			{
line 2894
;2894:				modPowerLevel = WP_AbsorbConversion(push_list[x], push_list[x]->client->ps.fd.forcePowerLevel[FP_ABSORB], self, powerUse, powerLevel, forcePowerNeeded[self->client->ps.fd.forcePowerLevel[powerUse]][powerUse]);
ADDRLP4 9568
CNSTI4 2
ASGNI4
ADDRLP4 9572
ADDRLP4 32
INDIRI4
ADDRLP4 9568
INDIRI4
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9572
INDIRP4
ARGP4
ADDRLP4 9576
CNSTI4 408
ASGNI4
ADDRLP4 9572
INDIRP4
ADDRLP4 9576
INDIRI4
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 9580
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9580
INDIRP4
ARGP4
ADDRLP4 9396
INDIRI4
ARGI4
ADDRLP4 9428
INDIRI4
ARGI4
ADDRLP4 9588
ADDRLP4 9396
INDIRI4
ADDRLP4 9568
INDIRI4
LSHI4
ASGNI4
ADDRLP4 9588
INDIRI4
CNSTI4 72
ADDRLP4 9588
INDIRI4
ADDRLP4 9580
INDIRP4
ADDRLP4 9576
INDIRI4
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 9592
ADDRGP4 WP_AbsorbConversion
CALLI4
ASGNI4
ADDRLP4 9564
ADDRLP4 9592
INDIRI4
ASGNI4
line 2895
;2895:				if (modPowerLevel == -1)
ADDRLP4 9564
INDIRI4
CNSTI4 -1
NEI4 $1283
line 2896
;2896:				{
line 2897
;2897:					modPowerLevel = powerLevel;
ADDRLP4 9564
ADDRLP4 9428
INDIRI4
ASGNI4
line 2898
;2898:				}
LABELV $1283
line 2899
;2899:			}
LABELV $1281
line 2901
;2900:
;2901:			pushPower = 256*modPowerLevel;
ADDRLP4 9464
ADDRLP4 9564
INDIRI4
CNSTI4 8
LSHI4
ASGNI4
line 2903
;2902:
;2903:			if (push_list[x]->client)
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1285
line 2904
;2904:			{
line 2905
;2905:				VectorCopy(push_list[x]->client->ps.origin, thispush_org);
ADDRLP4 9368
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2906
;2906:			}
ADDRGP4 $1286
JUMPV
LABELV $1285
line 2908
;2907:			else
;2908:			{
line 2909
;2909:				VectorCopy(push_list[x]->s.origin, thispush_org);
ADDRLP4 9368
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2910
;2910:			}
LABELV $1286
line 2912
;2911:
;2912:			if ( push_list[x]->client )
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1287
line 2913
;2913:			{//FIXME: make enemy jedi able to hunker down and resist this?
line 2914
;2914:				int otherPushPower = push_list[x]->client->ps.fd.forcePowerLevel[powerUse];
ADDRLP4 9580
CNSTI4 2
ASGNI4
ADDRLP4 9568
ADDRLP4 9396
INDIRI4
ADDRLP4 9580
INDIRI4
LSHI4
ADDRLP4 32
INDIRI4
ADDRLP4 9580
INDIRI4
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ASGNI4
line 2915
;2915:				qboolean canPullWeapon = qtrue;
ADDRLP4 9576
CNSTI4 1
ASGNI4
line 2916
;2916:				float dirLen = 0;
ADDRLP4 9572
CNSTF4 0
ASGNF4
line 2918
;2917:
;2918:				knockback = pull?0:200;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1290
ADDRLP4 9584
CNSTI4 0
ASGNI4
ADDRGP4 $1291
JUMPV
LABELV $1290
ADDRLP4 9584
CNSTI4 200
ASGNI4
LABELV $1291
ADDRLP4 9472
ADDRLP4 9584
INDIRI4
CVIF4 4
ASGNF4
line 2920
;2919:
;2920:				pushPowerMod = pushPower;
ADDRLP4 9432
ADDRLP4 9464
INDIRI4
ASGNI4
line 2922
;2921:
;2922:				if (push_list[x]->client->pers.cmd.forwardmove ||
ADDRLP4 9588
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9592
CNSTI4 0
ASGNI4
ADDRLP4 9588
INDIRP4
CNSTI4 1408
ADDP4
INDIRI1
CVII4 1
ADDRLP4 9592
INDIRI4
NEI4 $1294
ADDRLP4 9588
INDIRP4
CNSTI4 1409
ADDP4
INDIRI1
CVII4 1
ADDRLP4 9592
INDIRI4
EQI4 $1292
LABELV $1294
line 2924
;2923:					push_list[x]->client->pers.cmd.rightmove)
;2924:				{ //if you are moving, you get one less level of defense
line 2925
;2925:					otherPushPower--;
ADDRLP4 9568
ADDRLP4 9568
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2927
;2926:
;2927:					if (otherPushPower < 0)
ADDRLP4 9568
INDIRI4
CNSTI4 0
GEI4 $1295
line 2928
;2928:					{
line 2929
;2929:						otherPushPower = 0;
ADDRLP4 9568
CNSTI4 0
ASGNI4
line 2930
;2930:					}
LABELV $1295
line 2931
;2931:				}
LABELV $1292
line 2933
;2932:
;2933:				if (otherPushPower && CanCounterThrow(push_list[x], pull))
ADDRLP4 9568
INDIRI4
CNSTI4 0
EQI4 $1297
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 9596
ADDRGP4 CanCounterThrow
CALLI4
ASGNI4
ADDRLP4 9596
INDIRI4
CNSTI4 0
EQI4 $1297
line 2934
;2934:				{
line 2935
;2935:					if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1299
line 2936
;2936:					{
line 2937
;2937:						G_Sound( push_list[x], CHAN_BODY, G_SoundIndex( "sound/weapons/force/pull.wav" ) );
ADDRGP4 $1113
ARGP4
ADDRLP4 9600
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9600
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2938
;2938:						push_list[x]->client->ps.forceHandExtend = HANDEXTEND_FORCEPULL;
ADDRLP4 9604
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 9604
INDIRI4
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
ADDRLP4 9604
INDIRI4
ASGNI4
line 2939
;2939:						push_list[x]->client->ps.forceHandExtendTime = level.time + 400;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 2940
;2940:					}
ADDRGP4 $1300
JUMPV
LABELV $1299
line 2942
;2941:					else
;2942:					{
line 2943
;2943:						G_Sound( push_list[x], CHAN_BODY, G_SoundIndex( "sound/weapons/force/push.wav" ) );
ADDRGP4 $1109
ARGP4
ADDRLP4 9600
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9600
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2944
;2944:						push_list[x]->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 2945
;2945:						push_list[x]->client->ps.forceHandExtendTime = level.time + 1000;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2946
;2946:					}
LABELV $1300
line 2947
;2947:					push_list[x]->client->ps.powerups[PW_DISINT_4] = push_list[x]->client->ps.forceHandExtendTime + 200;
ADDRLP4 9600
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9600
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 9600
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 2951
;2948:
;2949:					//Make a counter-throw effect
;2950:
;2951:					if (otherPushPower >= modPowerLevel)
ADDRLP4 9568
INDIRI4
ADDRLP4 9564
INDIRI4
LTI4 $1303
line 2952
;2952:					{
line 2953
;2953:						pushPowerMod = 0;
ADDRLP4 9432
CNSTI4 0
ASGNI4
line 2954
;2954:						canPullWeapon = qfalse;
ADDRLP4 9576
CNSTI4 0
ASGNI4
line 2955
;2955:					}
ADDRGP4 $1304
JUMPV
LABELV $1303
line 2957
;2956:					else
;2957:					{
line 2958
;2958:						int powerDif = (modPowerLevel - otherPushPower);
ADDRLP4 9604
ADDRLP4 9564
INDIRI4
ADDRLP4 9568
INDIRI4
SUBI4
ASGNI4
line 2960
;2959:
;2960:						if (powerDif >= 3)
ADDRLP4 9604
INDIRI4
CNSTI4 3
LTI4 $1305
line 2961
;2961:						{
line 2962
;2962:							pushPowerMod -= pushPowerMod*0.2;
ADDRLP4 9608
ADDRLP4 9432
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 9432
ADDRLP4 9608
INDIRF4
CNSTF4 1045220557
ADDRLP4 9608
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 2963
;2963:						}
ADDRGP4 $1306
JUMPV
LABELV $1305
line 2964
;2964:						else if (powerDif == 2)
ADDRLP4 9604
INDIRI4
CNSTI4 2
NEI4 $1307
line 2965
;2965:						{
line 2966
;2966:							pushPowerMod -= pushPowerMod*0.4;
ADDRLP4 9608
ADDRLP4 9432
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 9432
ADDRLP4 9608
INDIRF4
CNSTF4 1053609165
ADDRLP4 9608
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 2967
;2967:						}
ADDRGP4 $1308
JUMPV
LABELV $1307
line 2968
;2968:						else if (powerDif == 1)
ADDRLP4 9604
INDIRI4
CNSTI4 1
NEI4 $1309
line 2969
;2969:						{
line 2970
;2970:							pushPowerMod -= pushPowerMod*0.8;
ADDRLP4 9608
ADDRLP4 9432
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 9432
ADDRLP4 9608
INDIRF4
CNSTF4 1061997773
ADDRLP4 9608
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 2971
;2971:						}
LABELV $1309
LABELV $1308
LABELV $1306
line 2973
;2972:
;2973:						if (pushPowerMod < 0)
ADDRLP4 9432
INDIRI4
CNSTI4 0
GEI4 $1311
line 2974
;2974:						{
line 2975
;2975:							pushPowerMod = 0;
ADDRLP4 9432
CNSTI4 0
ASGNI4
line 2976
;2976:						}
LABELV $1311
line 2977
;2977:					}
LABELV $1304
line 2978
;2978:				}
LABELV $1297
line 2981
;2979:
;2980:				//shove them
;2981:				if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1313
line 2982
;2982:				{
line 2983
;2983:					VectorSubtract( self->client->ps.origin, thispush_org, pushDir );
ADDRLP4 9600
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 9384
ADDRLP4 9600
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 9368
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9384+4
ADDRLP4 9600
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 9368+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9384+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 9368+8
INDIRF4
SUBF4
ASGNF4
line 2985
;2984:
;2985:					if (push_list[x]->client && VectorLength(pushDir) <= 256)
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1314
ADDRLP4 9384
ARGP4
ADDRLP4 9604
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 9604
INDIRF4
CNSTF4 1132462080
GTF4 $1314
line 2986
;2986:					{
line 2987
;2987:						int randfact = 0;
ADDRLP4 9608
CNSTI4 0
ASGNI4
line 2989
;2988:
;2989:						if (modPowerLevel == FORCE_LEVEL_1)
ADDRLP4 9564
INDIRI4
CNSTI4 1
NEI4 $1321
line 2990
;2990:						{
line 2991
;2991:							randfact = 3;
ADDRLP4 9608
CNSTI4 3
ASGNI4
line 2992
;2992:						}
ADDRGP4 $1322
JUMPV
LABELV $1321
line 2993
;2993:						else if (modPowerLevel == FORCE_LEVEL_2)
ADDRLP4 9564
INDIRI4
CNSTI4 2
NEI4 $1323
line 2994
;2994:						{
line 2995
;2995:							randfact = 7;
ADDRLP4 9608
CNSTI4 7
ASGNI4
line 2996
;2996:						}
ADDRGP4 $1324
JUMPV
LABELV $1323
line 2997
;2997:						else if (modPowerLevel == FORCE_LEVEL_3)
ADDRLP4 9564
INDIRI4
CNSTI4 3
NEI4 $1325
line 2998
;2998:						{
line 2999
;2999:							randfact = 10;
ADDRLP4 9608
CNSTI4 10
ASGNI4
line 3000
;3000:						}
LABELV $1325
LABELV $1324
LABELV $1322
line 3002
;3001:
;3002:						if (!OnSameTeam(self, push_list[x]) && Q_irand(1, 10) <= randfact && canPullWeapon)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 9612
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 9612
INDIRI4
CNSTI4 0
NEI4 $1314
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 9616
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 9616
INDIRI4
ADDRLP4 9608
INDIRI4
GTI4 $1314
ADDRLP4 9576
INDIRI4
CNSTI4 0
EQI4 $1314
line 3003
;3003:						{
line 3006
;3004:							vec3_t uorg, vecnorm;
;3005:
;3006:							VectorCopy(self->client->ps.origin, uorg);
ADDRLP4 9620
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3007
;3007:							uorg[2] += 64;
ADDRLP4 9620+8
ADDRLP4 9620+8
INDIRF4
CNSTF4 1115684864
ADDF4
ASGNF4
line 3009
;3008:
;3009:							VectorSubtract(uorg, thispush_org, vecnorm);
ADDRLP4 9632
ADDRLP4 9620
INDIRF4
ADDRLP4 9368
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9632+4
ADDRLP4 9620+4
INDIRF4
ADDRLP4 9368+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9632+8
ADDRLP4 9620+8
INDIRF4
ADDRLP4 9368+8
INDIRF4
SUBF4
ASGNF4
line 3010
;3010:							VectorNormalize(vecnorm);
ADDRLP4 9632
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3012
;3011:
;3012:							TossClientWeapon(push_list[x], vecnorm, 500);
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 9632
ARGP4
CNSTF4 1140457472
ARGF4
ADDRGP4 TossClientWeapon
CALLV
pop
line 3013
;3013:						}
line 3014
;3014:					}
line 3015
;3015:				}
ADDRGP4 $1314
JUMPV
LABELV $1313
line 3017
;3016:				else
;3017:				{
line 3018
;3018:					VectorSubtract( thispush_org, self->client->ps.origin, pushDir );
ADDRLP4 9600
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 9384
ADDRLP4 9368
INDIRF4
ADDRLP4 9600
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9384+4
ADDRLP4 9368+4
INDIRF4
ADDRLP4 9600
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9384+8
ADDRLP4 9368+8
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
line 3019
;3019:				}
LABELV $1314
line 3021
;3020:
;3021:				if (modPowerLevel > otherPushPower && push_list[x]->client)
ADDRLP4 9564
INDIRI4
ADDRLP4 9568
INDIRI4
LEI4 $1340
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1340
line 3022
;3022:				{
line 3023
;3023:					if (modPowerLevel == FORCE_LEVEL_3 &&
ADDRLP4 9564
INDIRI4
CNSTI4 3
NEI4 $1342
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
EQI4 $1342
line 3025
;3024:						push_list[x]->client->ps.forceHandExtend != HANDEXTEND_KNOCKDOWN)
;3025:					{
line 3026
;3026:						dirLen = VectorLength(pushDir);
ADDRLP4 9384
ARGP4
ADDRLP4 9600
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 9572
ADDRLP4 9600
INDIRF4
ASGNF4
line 3028
;3027:
;3028:						if (dirLen <= (64*((modPowerLevel - otherPushPower)-1)))
ADDRLP4 9572
INDIRF4
ADDRLP4 9564
INDIRI4
ADDRLP4 9568
INDIRI4
SUBI4
CNSTI4 6
LSHI4
CNSTI4 64
SUBI4
CVIF4 4
GTF4 $1344
line 3029
;3029:						{ //can only do a knockdown if fairly close
line 3030
;3030:							push_list[x]->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 3031
;3031:							push_list[x]->client->ps.forceHandExtendTime = level.time + 700;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 3032
;3032:							push_list[x]->client->ps.forceDodgeAnim = 0; //this toggles between 1 and 0, when it's 1 we should play the get up anim
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 3033
;3033:							push_list[x]->client->ps.quickerGetup = qtrue;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 1
ASGNI4
line 3034
;3034:						}
LABELV $1344
line 3035
;3035:					}
LABELV $1342
line 3036
;3036:				}
LABELV $1340
line 3038
;3037:
;3038:				if (!dirLen)
ADDRLP4 9572
INDIRF4
CNSTF4 0
NEF4 $1347
line 3039
;3039:				{
line 3040
;3040:					dirLen = VectorLength(pushDir);
ADDRLP4 9384
ARGP4
ADDRLP4 9600
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 9572
ADDRLP4 9600
INDIRF4
ASGNF4
line 3041
;3041:				}
LABELV $1347
line 3043
;3042:
;3043:				VectorNormalize(pushDir);
ADDRLP4 9384
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3045
;3044:
;3045:				if (push_list[x]->client)
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1288
line 3046
;3046:				{
line 3048
;3047:					//escape a force grip if we're in one
;3048:					if (self->client->ps.fd.forceGripBeingGripped > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $1351
line 3049
;3049:					{ //force the enemy to stop gripping me if I managed to push him
line 3050
;3050:						if (push_list[x]->client->ps.fd.forceGripEntityNum == self->s.number)
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $1354
line 3051
;3051:						{
line 3052
;3052:							if (modPowerLevel >= push_list[x]->client->ps.fd.forcePowerLevel[FP_GRIP])
ADDRLP4 9564
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
LTI4 $1356
line 3053
;3053:							{ //only break the grip if our push/pull level is >= their grip level
line 3054
;3054:								WP_ForcePowerStop(push_list[x], FP_GRIP);
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3055
;3055:								self->client->ps.fd.forceGripBeingGripped = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
CNSTF4 0
ASGNF4
line 3056
;3056:								push_list[x]->client->ps.fd.forceGripUseTime = level.time + 1000; //since we just broke out of it..
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1124
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3057
;3057:							}
LABELV $1356
line 3058
;3058:						}
LABELV $1354
line 3059
;3059:					}
LABELV $1351
line 3061
;3060:
;3061:					push_list[x]->client->ps.otherKiller = self->s.number;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3062
;3062:					push_list[x]->client->ps.otherKillerTime = level.time + 5000;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 3063
;3063:					push_list[x]->client->ps.otherKillerDebounceTime = level.time + 100;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3065
;3064:
;3065:					pushPowerMod -= (dirLen*0.7);
ADDRLP4 9432
ADDRLP4 9432
INDIRI4
CVIF4 4
CNSTF4 1060320051
ADDRLP4 9572
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 3066
;3066:					if (pushPowerMod < 16)
ADDRLP4 9432
INDIRI4
CNSTI4 16
GEI4 $1361
line 3067
;3067:					{
line 3068
;3068:						pushPowerMod = 16;
ADDRLP4 9432
CNSTI4 16
ASGNI4
line 3069
;3069:					}
LABELV $1361
line 3071
;3070:
;3071:					push_list[x]->client->ps.velocity[0] = pushDir[0]*pushPowerMod;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 9384
INDIRF4
ADDRLP4 9432
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 3072
;3072:					push_list[x]->client->ps.velocity[1] = pushDir[1]*pushPowerMod;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 9384+4
INDIRF4
ADDRLP4 9432
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 3074
;3073:
;3074:					if ((int)push_list[x]->client->ps.velocity[2] == 0)
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CNSTI4 0
NEI4 $1364
line 3075
;3075:					{ //if not going anywhere vertically, boost them up a bit
line 3076
;3076:						push_list[x]->client->ps.velocity[2] = pushDir[2]*pushPowerMod;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 9384+8
INDIRF4
ADDRLP4 9432
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 3078
;3077:
;3078:						if (push_list[x]->client->ps.velocity[2] < 128)
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1124073472
GEF4 $1288
line 3079
;3079:						{
line 3080
;3080:							push_list[x]->client->ps.velocity[2] = 128;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1124073472
ASGNF4
line 3081
;3081:						}
line 3082
;3082:					}
ADDRGP4 $1288
JUMPV
LABELV $1364
line 3084
;3083:					else
;3084:					{
line 3085
;3085:						push_list[x]->client->ps.velocity[2] = pushDir[2]*pushPowerMod;
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 9384+8
INDIRF4
ADDRLP4 9432
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 3086
;3086:					}
line 3087
;3087:				}
line 3088
;3088:			}
ADDRGP4 $1288
JUMPV
LABELV $1287
line 3089
;3089:			else if ( push_list[x]->s.eType == ET_MISSILE && push_list[x]->s.pos.trType != TR_STATIONARY && (push_list[x]->s.pos.trType != TR_INTERPOLATE||push_list[x]->s.weapon != WP_THERMAL) )//rolling and stationary thermal detonators are dealt with below
ADDRLP4 9568
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9568
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1370
ADDRLP4 9572
ADDRLP4 9568
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 9572
INDIRI4
CNSTI4 0
EQI4 $1370
ADDRLP4 9572
INDIRI4
CNSTI4 1
NEI4 $1372
ADDRLP4 9568
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 11
EQI4 $1370
LABELV $1372
line 3090
;3090:			{
line 3091
;3091:				if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1373
line 3092
;3092:				{//deflect rather than reflect?
line 3093
;3093:				}
ADDRGP4 $1371
JUMPV
LABELV $1373
line 3095
;3094:				else 
;3095:				{
line 3096
;3096:					G_ReflectMissile( self, push_list[x], forward );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 9348
ARGP4
ADDRGP4 G_ReflectMissile
CALLV
pop
line 3097
;3097:				}
line 3098
;3098:			}
ADDRGP4 $1371
JUMPV
LABELV $1370
line 3099
;3099:			else if ( !Q_stricmp( "func_door", push_list[x]->classname ) && (push_list[x]->spawnflags&2) )
ADDRGP4 $1230
ARGP4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9576
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9580
CNSTI4 0
ASGNI4
ADDRLP4 9576
INDIRI4
ADDRLP4 9580
INDIRI4
NEI4 $1375
ADDRLP4 9584
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 9584
INDIRI4
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ADDRLP4 9584
INDIRI4
BANDI4
ADDRLP4 9580
INDIRI4
EQI4 $1375
line 3100
;3100:			{//push/pull the door
line 3103
;3101:				vec3_t	pos1, pos2;
;3102:
;3103:				AngleVectors( self->client->ps.viewangles, forward, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 9348
ARGP4
ADDRLP4 9612
CNSTP4 0
ASGNP4
ADDRLP4 9612
INDIRP4
ARGP4
ADDRLP4 9612
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3104
;3104:				VectorNormalize( forward );
ADDRLP4 9348
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3105
;3105:				VectorMA( self->client->ps.origin, radius, forward, end );
ADDRLP4 9616
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 9620
ADDRLP4 9360
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 9500
ADDRLP4 9616
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 9348
INDIRF4
ADDRLP4 9620
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9500+4
ADDRLP4 9616
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 9348+4
INDIRF4
ADDRLP4 9620
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9500+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 9348+8
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 3106
;3106:				trap_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, end, self->s.number, MASK_SHOT );
ADDRLP4 8268
ARGP4
ADDRLP4 9624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9624
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9628
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 9628
INDIRP4
ARGP4
ADDRLP4 9628
INDIRP4
ARGP4
ADDRLP4 9500
ARGP4
ADDRLP4 9624
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3107
;3107:				if ( tr.entityNum != push_list[x]->s.number || tr.fraction == 1.0 || tr.allsolid || tr.startsolid )
ADDRLP4 8268+52
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
INDIRI4
NEI4 $1388
ADDRLP4 8268+8
INDIRF4
CNSTF4 1065353216
EQF4 $1388
ADDRLP4 9632
CNSTI4 0
ASGNI4
ADDRLP4 8268
INDIRI4
ADDRLP4 9632
INDIRI4
NEI4 $1388
ADDRLP4 8268+4
INDIRI4
ADDRLP4 9632
INDIRI4
EQI4 $1381
LABELV $1388
line 3108
;3108:				{//must be pointing right at it
line 3109
;3109:					continue;
ADDRGP4 $1278
JUMPV
LABELV $1381
line 3112
;3110:				}
;3111:
;3112:				VectorSubtract( push_list[x]->r.absmax, push_list[x]->r.absmin, size );
ADDRLP4 9636
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
ASGNP4
ADDRLP4 9640
ADDRLP4 9636
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4160
ADDRLP4 9640
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 9640
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9644
ADDRLP4 9636
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4160+4
ADDRLP4 9644
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 9644
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9648
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4160+8
ADDRLP4 9648
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 9648
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3113
;3113:				VectorMA( push_list[x]->r.absmin, 0.5, size, center );
ADDRLP4 9652
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
ASGNP4
ADDRLP4 9656
CNSTF4 1056964608
ASGNF4
ADDRLP4 8
ADDRLP4 9652
INDIRP4
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 9656
INDIRF4
ADDRLP4 4160
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 9652
INDIRP4
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 9656
INDIRF4
ADDRLP4 4160+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 4160+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3114
;3114:				VectorAdd( center, push_list[x]->pos1, pos1 );
ADDRLP4 9660
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
ASGNP4
ADDRLP4 9588
ADDRLP4 8
INDIRF4
ADDRLP4 9660
INDIRP4
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9588+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 9660
INDIRP4
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9588+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3115
;3115:				VectorAdd( center, push_list[x]->pos2, pos2 );
ADDRLP4 9664
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
ASGNP4
ADDRLP4 9600
ADDRLP4 8
INDIRF4
ADDRLP4 9664
INDIRP4
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9600+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 9664
INDIRP4
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9600+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3117
;3116:
;3117:				if ( Distance( pos1, self->client->ps.origin ) < Distance( pos2, self->client->ps.origin ) )
ADDRLP4 9588
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9668
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 9600
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9672
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 9668
INDIRF4
ADDRLP4 9672
INDIRF4
GEF4 $1403
line 3118
;3118:				{//pos1 is closer
line 3119
;3119:					if ( push_list[x]->moverState == MOVER_POS1 )
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1405
line 3120
;3120:					{//at the closest pos
line 3121
;3121:						if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1404
line 3122
;3122:						{//trying to pull, but already at closest point, so screw it
line 3123
;3123:							continue;
ADDRGP4 $1278
JUMPV
line 3125
;3124:						}
;3125:					}
LABELV $1405
line 3126
;3126:					else if ( push_list[x]->moverState == MOVER_POS2 )
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1404
line 3127
;3127:					{//at farthest pos
line 3128
;3128:						if ( !pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1404
line 3129
;3129:						{//trying to push, but already at farthest point, so screw it
line 3130
;3130:							continue;
ADDRGP4 $1278
JUMPV
line 3132
;3131:						}
;3132:					}
line 3133
;3133:				}
LABELV $1403
line 3135
;3134:				else
;3135:				{//pos2 is closer
line 3136
;3136:					if ( push_list[x]->moverState == MOVER_POS1 )
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1413
line 3137
;3137:					{//at the farthest pos
line 3138
;3138:						if ( !pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1414
line 3139
;3139:						{//trying to push, but already at farthest point, so screw it
line 3140
;3140:							continue;
ADDRGP4 $1278
JUMPV
line 3142
;3141:						}
;3142:					}
LABELV $1413
line 3143
;3143:					else if ( push_list[x]->moverState == MOVER_POS2 )
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1417
line 3144
;3144:					{//at closest pos
line 3145
;3145:						if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1419
line 3146
;3146:						{//trying to pull, but already at closest point, so screw it
line 3147
;3147:							continue;
ADDRGP4 $1278
JUMPV
LABELV $1419
line 3149
;3148:						}
;3149:					}
LABELV $1417
LABELV $1414
line 3150
;3150:				}
LABELV $1404
line 3151
;3151:				GEntity_UseFunc( push_list[x], self, self );
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 9676
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9676
INDIRP4
ARGP4
ADDRLP4 9676
INDIRP4
ARGP4
ADDRGP4 GEntity_UseFunc
CALLV
pop
line 3152
;3152:			}
ADDRGP4 $1376
JUMPV
LABELV $1375
line 3153
;3153:			else if ( Q_stricmp( "func_button", push_list[x]->classname ) == 0 )
ADDRGP4 $1217
ARGP4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9588
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9588
INDIRI4
CNSTI4 0
NEI4 $1421
line 3154
;3154:			{//pretend you pushed it
line 3155
;3155:				Touch_Button( push_list[x], self, NULL );
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 36
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 Touch_Button
CALLV
pop
line 3156
;3156:				continue;
LABELV $1421
LABELV $1376
LABELV $1371
LABELV $1288
line 3158
;3157:			}
;3158:		}
LABELV $1278
line 2887
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1280
ADDRLP4 32
INDIRI4
ADDRLP4 9364
INDIRI4
LTI4 $1277
line 3159
;3159:	}
LABELV $1275
line 3163
;3160:
;3161:	//attempt to break any leftover grips
;3162:	//if we're still in a current grip that wasn't broken by the push, it will still remain
;3163:	self->client->dangerTime = level.time;
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
line 3164
;3164:	self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 9564
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 9564
INDIRP4
ADDRLP4 9564
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 3165
;3165:	self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
CNSTI4 0
ASGNI4
line 3167
;3166:
;3167:	if (self->client->ps.fd.forceGripBeingGripped > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $1424
line 3168
;3168:	{
line 3169
;3169:		self->client->ps.fd.forceGripBeingGripped = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
CNSTF4 0
ASGNF4
line 3170
;3170:	}
LABELV $1424
line 3171
;3171:}
LABELV $1087
endproc ForceThrow 9680 28
export WP_ForcePowerStop
proc WP_ForcePowerStop 32 12
line 3174
;3172:
;3173:void WP_ForcePowerStop( gentity_t *self, forcePowers_t forcePower )
;3174:{
line 3175
;3175:	int wasActive = self->client->ps.fd.forcePowersActive;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
line 3177
;3176:
;3177:	self->client->ps.fd.forcePowersActive &= ~( 1 << forcePower );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3179
;3178:
;3179:	switch( (int)forcePower )
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $1429
ADDRLP4 8
INDIRI4
CNSTI4 14
GTI4 $1429
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1488
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1488
address $1431
address $1429
address $1433
address $1429
address $1429
address $1438
address $1445
address $1464
address $1471
address $1478
address $1475
address $1429
address $1429
address $1481
address $1442
code
line 3180
;3180:	{
LABELV $1431
line 3182
;3181:	case FP_HEAL:
;3182:		self->client->ps.fd.forceHealAmount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
CNSTI4 0
ASGNI4
line 3183
;3183:		self->client->ps.fd.forceHealTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1148
ADDP4
CNSTI4 0
ASGNI4
line 3184
;3184:		break;
ADDRGP4 $1429
JUMPV
line 3186
;3185:	case FP_LEVITATION:
;3186:		break;
LABELV $1433
line 3188
;3187:	case FP_SPEED:
;3188:		if (wasActive & (1 << FP_SPEED))
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1429
line 3189
;3189:		{
line 3190
;3190:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_2-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3191
;3191:		}
line 3192
;3192:		break;
ADDRGP4 $1429
JUMPV
line 3194
;3193:	case FP_PUSH:
;3194:		break;
line 3196
;3195:	case FP_PULL:
;3196:		break;
LABELV $1438
line 3198
;3197:	case FP_TELEPATHY:
;3198:		if (wasActive & (1 << FP_TELEPATHY))
ADDRLP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1439
line 3199
;3199:		{
line 3200
;3200:			G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/distractstop.wav") );
ADDRGP4 $1441
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 3201
;3201:		}
LABELV $1439
line 3202
;3202:		self->client->ps.fd.forceMindtrickTargetIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1156
ADDP4
CNSTI4 0
ASGNI4
line 3203
;3203:		self->client->ps.fd.forceMindtrickTargetIndex2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1160
ADDP4
CNSTI4 0
ASGNI4
line 3204
;3204:		self->client->ps.fd.forceMindtrickTargetIndex3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1164
ADDP4
CNSTI4 0
ASGNI4
line 3205
;3205:		self->client->ps.fd.forceMindtrickTargetIndex4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1168
ADDP4
CNSTI4 0
ASGNI4
line 3206
;3206:		break;
ADDRGP4 $1429
JUMPV
LABELV $1442
line 3208
;3207:	case FP_SEE:
;3208:		if (wasActive & (1 << FP_SEE))
ADDRLP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1429
line 3209
;3209:		{
line 3210
;3210:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_5-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3211
;3211:		}
line 3212
;3212:		break;
ADDRGP4 $1429
JUMPV
LABELV $1445
line 3214
;3213:	case FP_GRIP:
;3214:		self->client->ps.fd.forceGripUseTime = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1124
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 3215
;3215:		if (self->client->ps.fd.forcePowerLevel[FP_GRIP] > FORCE_LEVEL_1 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1447
ADDRLP4 20
CNSTI4 828
ADDRLP4 16
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1447
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $1447
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1447
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1140457472
LEF4 $1447
line 3220
;3216:			g_entities[self->client->ps.fd.forceGripEntityNum].client &&
;3217:			g_entities[self->client->ps.fd.forceGripEntityNum].health > 0 &&
;3218:			g_entities[self->client->ps.fd.forceGripEntityNum].inuse &&
;3219:			(level.time - g_entities[self->client->ps.fd.forceGripEntityNum].client->ps.fd.forceGripStarted) > 500)
;3220:		{ //if we had our throat crushed in for more than half a second, gasp for air when we're let go
line 3221
;3221:			if (wasActive & (1 << FP_GRIP))
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1454
line 3222
;3222:			{
line 3223
;3223:				G_EntitySound( &g_entities[self->client->ps.fd.forceGripEntityNum], CHAN_VOICE, G_SoundIndex("*gasp.wav") );
ADDRGP4 $1456
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 3224
;3224:			}
LABELV $1454
line 3225
;3225:		}
LABELV $1447
line 3227
;3226:
;3227:		if (g_entities[self->client->ps.fd.forceGripEntityNum].client &&
ADDRLP4 28
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1457
ADDRLP4 28
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1457
line 3229
;3228:			g_entities[self->client->ps.fd.forceGripEntityNum].inuse)
;3229:		{
line 3231
;3230:			
;3231:			g_entities[self->client->ps.fd.forceGripEntityNum].client->ps.forceGripChangeMovetype = PM_NORMAL;
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 0
ASGNI4
line 3232
;3232:		}
LABELV $1457
line 3234
;3233:
;3234:		if (self->client->ps.forceHandExtend == HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1462
line 3235
;3235:		{
line 3236
;3236:			self->client->ps.forceHandExtendTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 3237
;3237:		}
LABELV $1462
line 3239
;3238:
;3239:		self->client->ps.fd.forceGripEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1023
ASGNI4
line 3241
;3240:
;3241:		self->client->ps.powerups[PW_DISINT_4] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 0
ASGNI4
line 3242
;3242:		break;
ADDRGP4 $1429
JUMPV
LABELV $1464
line 3244
;3243:	case FP_LIGHTNING:
;3244:		if ( self->client->ps.fd.forcePowerLevel[FP_LIGHTNING] < FORCE_LEVEL_2 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 2
GEI4 $1465
line 3245
;3245:		{//don't do it again for 3 seconds, minimum... FIXME: this should be automatic once regeneration is slower (normal)
line 3246
;3246:			self->client->ps.fd.forcePowerDebounce[FP_LIGHTNING] = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 800
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 3247
;3247:		}
ADDRGP4 $1466
JUMPV
LABELV $1465
line 3249
;3248:		else
;3249:		{
line 3250
;3250:			self->client->ps.fd.forcePowerDebounce[FP_LIGHTNING] = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 800
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 3251
;3251:		}
LABELV $1466
line 3252
;3252:		if (self->client->ps.forceHandExtend == HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1469
line 3253
;3253:		{
line 3254
;3254:			self->client->ps.forceHandExtendTime = 0; //reset hand position
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 3255
;3255:		}
LABELV $1469
line 3257
;3256:
;3257:		self->client->ps.activeForcePass = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 3258
;3258:		break;
ADDRGP4 $1429
JUMPV
LABELV $1471
line 3260
;3259:	case FP_RAGE:
;3260:		self->client->ps.fd.forceRageRecoveryTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1172
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 3261
;3261:		if (wasActive & (1 << FP_RAGE))
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1429
line 3262
;3262:		{
line 3263
;3263:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_3-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3264
;3264:		}
line 3265
;3265:		break;
ADDRGP4 $1429
JUMPV
LABELV $1475
line 3267
;3266:	case FP_ABSORB:
;3267:		if (wasActive & (1 << FP_ABSORB))
ADDRLP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1429
line 3268
;3268:		{
line 3269
;3269:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_3-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3270
;3270:		}
line 3271
;3271:		break;
ADDRGP4 $1429
JUMPV
LABELV $1478
line 3273
;3272:	case FP_PROTECT:
;3273:		if (wasActive & (1 << FP_PROTECT))
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1429
line 3274
;3274:		{
line 3275
;3275:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_3-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3276
;3276:		}
line 3277
;3277:		break;
ADDRGP4 $1429
JUMPV
LABELV $1481
line 3279
;3278:	case FP_DRAIN:
;3279:		if ( self->client->ps.fd.forcePowerLevel[FP_DRAIN] < FORCE_LEVEL_2 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 2
GEI4 $1482
line 3280
;3280:		{//don't do it again for 3 seconds, minimum...
line 3281
;3281:			self->client->ps.fd.forcePowerDebounce[FP_DRAIN] = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 824
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 3282
;3282:		}
ADDRGP4 $1483
JUMPV
LABELV $1482
line 3284
;3283:		else
;3284:		{
line 3285
;3285:			self->client->ps.fd.forcePowerDebounce[FP_DRAIN] = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 824
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 3286
;3286:		}
LABELV $1483
line 3288
;3287:
;3288:		if (self->client->ps.forceHandExtend == HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1486
line 3289
;3289:		{
line 3290
;3290:			self->client->ps.forceHandExtendTime = 0; //reset hand position
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 3291
;3291:		}
LABELV $1486
line 3293
;3292:
;3293:		self->client->ps.activeForcePass = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 3295
;3294:	default:
;3295:		break;
LABELV $1429
line 3297
;3296:	}
;3297:}
LABELV $1427
endproc WP_ForcePowerStop 32 12
export DoGripAction
proc DoGripAction 1272 32
line 3300
;3298:
;3299:void DoGripAction(gentity_t *self, forcePowers_t forcePower)
;3300:{
line 3302
;3301:	gentity_t *gripEnt;
;3302:	int gripLevel = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3307
;3303:	trace_t tr;
;3304:	vec3_t a;
;3305:	vec3_t fwd, fwd_o, start_o, nvel;
;3306:
;3307:	self->client->dangerTime = level.time;
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
line 3308
;3308:	self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1148
INDIRP4
ADDRLP4 1148
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 3309
;3309:	self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
CNSTI4 0
ASGNI4
line 3311
;3310:
;3311:	gripEnt = &g_entities[self->client->ps.fd.forceGripEntityNum];
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3313
;3312:
;3313:	if (!gripEnt || !gripEnt->client || !gripEnt->inuse || gripEnt->health < 1 || !ForcePowerUsableOn(self, gripEnt, FP_GRIP))
ADDRLP4 1156
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $1496
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $1496
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1496
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1496
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1160
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1491
LABELV $1496
line 3314
;3314:	{
line 3315
;3315:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3316
;3316:		self->client->ps.fd.forceGripEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1023
ASGNI4
line 3318
;3317:
;3318:		if (gripEnt && gripEnt->client && gripEnt->inuse)
ADDRLP4 1168
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1168
INDIRU4
EQU4 $1489
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1168
INDIRU4
EQU4 $1489
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1489
line 3319
;3319:		{
line 3320
;3320:			gripEnt->client->ps.forceGripChangeMovetype = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 0
ASGNI4
line 3321
;3321:		}
line 3322
;3322:		return;
ADDRGP4 $1489
JUMPV
LABELV $1491
line 3325
;3323:	}
;3324:
;3325:	VectorSubtract(gripEnt->client->ps.origin, self->client->ps.origin, a);
ADDRLP4 1164
CNSTI4 408
ASGNI4
ADDRLP4 1168
ADDRLP4 0
INDIRP4
ADDRLP4 1164
INDIRI4
ADDP4
ASGNP4
ADDRLP4 1172
CNSTI4 20
ASGNI4
ADDRLP4 1176
ADDRFP4 0
INDIRP4
ADDRLP4 1164
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 1168
INDIRP4
INDIRP4
ADDRLP4 1172
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1176
INDIRP4
INDIRP4
ADDRLP4 1172
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1180
CNSTI4 24
ASGNI4
ADDRLP4 8+4
ADDRLP4 1168
INDIRP4
INDIRP4
ADDRLP4 1180
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1176
INDIRP4
INDIRP4
ADDRLP4 1180
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1184
CNSTI4 408
ASGNI4
ADDRLP4 1188
CNSTI4 28
ASGNI4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
ADDRLP4 1184
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1188
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 1184
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1188
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3327
;3326:	
;3327:	trap_Trace(&tr, self->client->ps.origin, NULL, NULL, gripEnt->client->ps.origin, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 20
ARGP4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
CNSTI4 408
ASGNI4
ADDRLP4 1200
CNSTI4 20
ASGNI4
ADDRLP4 1192
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1200
INDIRI4
ADDP4
ARGP4
ADDRLP4 1204
CNSTP4 0
ASGNP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1200
INDIRI4
ADDP4
ARGP4
ADDRLP4 1192
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3329
;3328:
;3329:	gripLevel = WP_AbsorbConversion(gripEnt, gripEnt->client->ps.fd.forcePowerLevel[FP_ABSORB], self, FP_GRIP, self->client->ps.fd.forcePowerLevel[FP_GRIP], forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_GRIP]][FP_GRIP]);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1212
CNSTI4 408
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1220
ADDRLP4 1216
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1220
INDIRI4
ARGI4
CNSTI4 72
ADDRLP4 1220
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+24
ADDP4
INDIRI4
ARGI4
ADDRLP4 1224
ADDRGP4 WP_AbsorbConversion
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1224
INDIRI4
ASGNI4
line 3331
;3330:
;3331:	if (gripLevel == -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $1502
line 3332
;3332:	{
line 3333
;3333:		gripLevel = self->client->ps.fd.forcePowerLevel[FP_GRIP];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
ASGNI4
line 3334
;3334:	}
LABELV $1502
line 3336
;3335:
;3336:	if (!gripLevel)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1504
line 3337
;3337:	{
line 3338
;3338:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3339
;3339:		return;
ADDRGP4 $1489
JUMPV
LABELV $1504
line 3342
;3340:	}
;3341:
;3342:	if (VectorLength(a) > MAX_GRIP_DISTANCE)
ADDRLP4 8
ARGP4
ADDRLP4 1228
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1228
INDIRF4
CNSTF4 1132462080
LEF4 $1506
line 3343
;3343:	{
line 3344
;3344:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3345
;3345:		return;
ADDRGP4 $1489
JUMPV
LABELV $1506
line 3348
;3346:	}
;3347:
;3348:	if ( !InFront( gripEnt->client->ps.origin, self->client->ps.origin, self->client->ps.viewangles, 0.9f ) &&
ADDRLP4 1232
CNSTI4 408
ASGNI4
ADDRLP4 1236
CNSTI4 20
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 1232
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1236
INDIRI4
ADDP4
ARGP4
ADDRLP4 1240
ADDRFP4 0
INDIRP4
ADDRLP4 1232
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1240
INDIRP4
ADDRLP4 1236
INDIRI4
ADDP4
ARGP4
ADDRLP4 1240
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1063675494
ARGF4
ADDRLP4 1244
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
NEI4 $1508
ADDRLP4 4
INDIRI4
CNSTI4 3
GEI4 $1508
line 3350
;3349:		gripLevel < FORCE_LEVEL_3)
;3350:	{
line 3351
;3351:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3352
;3352:		return;
ADDRGP4 $1489
JUMPV
LABELV $1508
line 3355
;3353:	}
;3354:
;3355:	if (tr.fraction != 1 &&
ADDRLP4 20+8
INDIRF4
CNSTF4 1065353216
EQF4 $1510
ADDRLP4 20+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $1510
ADDRLP4 4
INDIRI4
CNSTI4 3
GEI4 $1510
line 3358
;3356:		tr.entityNum != gripEnt->s.number &&
;3357:		gripLevel < FORCE_LEVEL_3)
;3358:	{
line 3359
;3359:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3360
;3360:		return;
ADDRGP4 $1489
JUMPV
LABELV $1510
line 3363
;3361:	}
;3362:
;3363:	if (self->client->ps.fd.forcePowerDebounce[FP_GRIP] < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1514
line 3364
;3364:	{ //2 damage per second while choking, resulting in 10 damage total (not including The Squeeze<tm>)
line 3365
;3365:		self->client->ps.fd.forcePowerDebounce[FP_GRIP] = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3366
;3366:		G_Damage(gripEnt, self, self, NULL, NULL, 2, DAMAGE_NO_ARMOR, MOD_FORCE_DARK);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1248
INDIRP4
ARGP4
ADDRLP4 1248
INDIRP4
ARGP4
ADDRLP4 1252
CNSTP4 0
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1256
CNSTI4 2
ASGNI4
ADDRLP4 1256
INDIRI4
ARGI4
ADDRLP4 1256
INDIRI4
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3367
;3367:	}
LABELV $1514
line 3369
;3368:
;3369:	if (gripLevel == FORCE_LEVEL_1)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1518
line 3370
;3370:	{
line 3371
;3371:		gripEnt->client->ps.fd.forceGripBeingGripped = level.time + 1000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 3373
;3372:		
;3373:		if ((level.time - gripEnt->client->ps.fd.forceGripStarted) > 5000)
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1167867904
LEF4 $1489
line 3374
;3374:		{
line 3375
;3375:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3376
;3376:		}
line 3377
;3377:		return;
ADDRGP4 $1489
JUMPV
LABELV $1518
line 3380
;3378:	}
;3379:
;3380:	if (gripLevel == FORCE_LEVEL_2)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1524
line 3381
;3381:	{
line 3382
;3382:		gripEnt->client->ps.fd.forceGripBeingGripped = level.time + 1000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 3384
;3383:
;3384:		if (gripEnt->client->ps.forceGripMoveInterval < level.time)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1527
line 3385
;3385:		{
line 3386
;3386:			gripEnt->client->ps.velocity[2] = 30;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1106247680
ASGNF4
line 3388
;3387:
;3388:			gripEnt->client->ps.forceGripMoveInterval = level.time + 300; //only update velocity every 300ms, so as to avoid heavy bandwidth usage
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 3389
;3389:		}
LABELV $1527
line 3391
;3390:
;3391:		gripEnt->client->ps.otherKiller = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3392
;3392:		gripEnt->client->ps.otherKillerTime = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 3393
;3393:		gripEnt->client->ps.otherKillerDebounceTime = level.time + 100;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3395
;3394:
;3395:		gripEnt->client->ps.forceGripChangeMovetype = PM_FLOAT;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 1
ASGNI4
line 3397
;3396:
;3397:		if ((level.time - gripEnt->client->ps.fd.forceGripStarted) > 3000 && !self->client->ps.fd.forceGripDamageDebounceTime)
ADDRLP4 1248
CNSTI4 408
ASGNI4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
ADDRLP4 1248
INDIRI4
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1161527296
LEF4 $1533
ADDRFP4 0
INDIRP4
ADDRLP4 1248
INDIRI4
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1533
line 3398
;3398:		{ //if we managed to lift him into the air for 2 seconds, give him a crack
line 3399
;3399:			self->client->ps.fd.forceGripDamageDebounceTime = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 1
ASGNI4
line 3400
;3400:			G_Damage(gripEnt, self, self, NULL, NULL, 20, DAMAGE_NO_ARMOR, MOD_FORCE_DARK);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1256
CNSTP4 0
ASGNP4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRLP4 1256
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 2
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3403
;3401:
;3402:			//Must play custom sounds on the actual entity. Don't use G_Sound (it creates a temp entity for the sound)
;3403:			G_EntitySound( gripEnt, CHAN_VOICE, G_SoundIndex(va( "*choke%d.wav", Q_irand( 1, 3 ) )) );
CNSTI4 1
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1260
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $1536
ARGP4
ADDRLP4 1260
INDIRI4
ARGI4
ADDRLP4 1264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1268
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 3405
;3404:
;3405:			gripEnt->client->ps.forceHandExtend = HANDEXTEND_CHOKE;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 5
ASGNI4
line 3406
;3406:			gripEnt->client->ps.forceHandExtendTime = level.time + 2000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 3408
;3407:
;3408:			if (gripEnt->client->ps.fd.forcePowersActive & (1 << FP_GRIP))
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1489
line 3409
;3409:			{ //choking, so don't let him keep gripping himself
line 3410
;3410:				WP_ForcePowerStop(gripEnt, FP_GRIP);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3411
;3411:			}
line 3412
;3412:		}
ADDRGP4 $1489
JUMPV
LABELV $1533
line 3413
;3413:		else if ((level.time - gripEnt->client->ps.fd.forceGripStarted) > 4000)
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1165623296
LEF4 $1489
line 3414
;3414:		{
line 3415
;3415:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3416
;3416:		}
line 3417
;3417:		return;
ADDRGP4 $1489
JUMPV
LABELV $1524
line 3420
;3418:	}
;3419:
;3420:	if (gripLevel == FORCE_LEVEL_3)
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $1543
line 3421
;3421:	{
line 3422
;3422:		gripEnt->client->ps.fd.forceGripBeingGripped = level.time + 1000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 3424
;3423:
;3424:		gripEnt->client->ps.otherKiller = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3425
;3425:		gripEnt->client->ps.otherKillerTime = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 3426
;3426:		gripEnt->client->ps.otherKillerDebounceTime = level.time + 100;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3428
;3427:
;3428:		gripEnt->client->ps.forceGripChangeMovetype = PM_FLOAT;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 1
ASGNI4
line 3430
;3429:
;3430:		if (gripEnt->client->ps.forceGripMoveInterval < level.time)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1548
line 3431
;3431:		{
line 3432
;3432:			float nvLen = 0;
ADDRLP4 1248
CNSTF4 0
ASGNF4
line 3434
;3433:
;3434:			VectorCopy(gripEnt->client->ps.origin, start_o);
ADDRLP4 1136
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3435
;3435:			AngleVectors(self->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 1124
ARGP4
ADDRLP4 1252
CNSTP4 0
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3436
;3436:			fwd_o[0] = self->client->ps.origin[0] + fwd[0]*128;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1124
INDIRF4
MULF4
ADDF4
ASGNF4
line 3437
;3437:			fwd_o[1] = self->client->ps.origin[1] + fwd[1]*128;
ADDRLP4 1112+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1124+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3438
;3438:			fwd_o[2] = self->client->ps.origin[2] + fwd[2]*128;
ADDRLP4 1112+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1124+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3439
;3439:			fwd_o[2] += 16;
ADDRLP4 1112+8
ADDRLP4 1112+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3440
;3440:			VectorSubtract(fwd_o, start_o, nvel);
ADDRLP4 1100
ADDRLP4 1112
INDIRF4
ADDRLP4 1136
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 1136+8
INDIRF4
SUBF4
ASGNF4
line 3442
;3441:
;3442:			nvLen = VectorLength(nvel);
ADDRLP4 1100
ARGP4
ADDRLP4 1256
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1248
ADDRLP4 1256
INDIRF4
ASGNF4
line 3444
;3443:
;3444:			if (nvLen < 16)
ADDRLP4 1248
INDIRF4
CNSTF4 1098907648
GEF4 $1562
line 3445
;3445:			{ //within x units of desired spot
line 3446
;3446:				VectorNormalize(nvel);
ADDRLP4 1100
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3447
;3447:				gripEnt->client->ps.velocity[0] = nvel[0]*8;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ADDRLP4 1100
INDIRF4
MULF4
ASGNF4
line 3448
;3448:				gripEnt->client->ps.velocity[1] = nvel[1]*8;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ADDRLP4 1100+4
INDIRF4
MULF4
ASGNF4
line 3449
;3449:				gripEnt->client->ps.velocity[2] = nvel[2]*8;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ADDRLP4 1100+8
INDIRF4
MULF4
ASGNF4
line 3450
;3450:			}
ADDRGP4 $1563
JUMPV
LABELV $1562
line 3451
;3451:			else if (nvLen < 64)
ADDRLP4 1248
INDIRF4
CNSTF4 1115684864
GEF4 $1566
line 3452
;3452:			{
line 3453
;3453:				VectorNormalize(nvel);
ADDRLP4 1100
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3454
;3454:				gripEnt->client->ps.velocity[0] = nvel[0]*128;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1124073472
ADDRLP4 1100
INDIRF4
MULF4
ASGNF4
line 3455
;3455:				gripEnt->client->ps.velocity[1] = nvel[1]*128;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1124073472
ADDRLP4 1100+4
INDIRF4
MULF4
ASGNF4
line 3456
;3456:				gripEnt->client->ps.velocity[2] = nvel[2]*128;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1124073472
ADDRLP4 1100+8
INDIRF4
MULF4
ASGNF4
line 3457
;3457:			}
ADDRGP4 $1567
JUMPV
LABELV $1566
line 3458
;3458:			else if (nvLen < 128)
ADDRLP4 1248
INDIRF4
CNSTF4 1124073472
GEF4 $1570
line 3459
;3459:			{
line 3460
;3460:				VectorNormalize(nvel);
ADDRLP4 1100
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3461
;3461:				gripEnt->client->ps.velocity[0] = nvel[0]*256;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1132462080
ADDRLP4 1100
INDIRF4
MULF4
ASGNF4
line 3462
;3462:				gripEnt->client->ps.velocity[1] = nvel[1]*256;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1132462080
ADDRLP4 1100+4
INDIRF4
MULF4
ASGNF4
line 3463
;3463:				gripEnt->client->ps.velocity[2] = nvel[2]*256;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132462080
ADDRLP4 1100+8
INDIRF4
MULF4
ASGNF4
line 3464
;3464:			}
ADDRGP4 $1571
JUMPV
LABELV $1570
line 3465
;3465:			else if (nvLen < 200)
ADDRLP4 1248
INDIRF4
CNSTF4 1128792064
GEF4 $1574
line 3466
;3466:			{
line 3467
;3467:				VectorNormalize(nvel);
ADDRLP4 1100
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3468
;3468:				gripEnt->client->ps.velocity[0] = nvel[0]*512;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1140850688
ADDRLP4 1100
INDIRF4
MULF4
ASGNF4
line 3469
;3469:				gripEnt->client->ps.velocity[1] = nvel[1]*512;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1140850688
ADDRLP4 1100+4
INDIRF4
MULF4
ASGNF4
line 3470
;3470:				gripEnt->client->ps.velocity[2] = nvel[2]*512;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1140850688
ADDRLP4 1100+8
INDIRF4
MULF4
ASGNF4
line 3471
;3471:			}
ADDRGP4 $1575
JUMPV
LABELV $1574
line 3473
;3472:			else
;3473:			{
line 3474
;3474:				VectorNormalize(nvel);
ADDRLP4 1100
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3475
;3475:				gripEnt->client->ps.velocity[0] = nvel[0]*700;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1143930880
ADDRLP4 1100
INDIRF4
MULF4
ASGNF4
line 3476
;3476:				gripEnt->client->ps.velocity[1] = nvel[1]*700;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRLP4 1100+4
INDIRF4
MULF4
ASGNF4
line 3477
;3477:				gripEnt->client->ps.velocity[2] = nvel[2]*700;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRLP4 1100+8
INDIRF4
MULF4
ASGNF4
line 3478
;3478:			}
LABELV $1575
LABELV $1571
LABELV $1567
LABELV $1563
line 3480
;3479:
;3480:			gripEnt->client->ps.forceGripMoveInterval = level.time + 300; //only update velocity every 300ms, so as to avoid heavy bandwidth usage
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 3481
;3481:		}
LABELV $1548
line 3483
;3482:
;3483:		if ((level.time - gripEnt->client->ps.fd.forceGripStarted) > 3000 && !self->client->ps.fd.forceGripDamageDebounceTime)
ADDRLP4 1248
CNSTI4 408
ASGNI4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
ADDRLP4 1248
INDIRI4
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1161527296
LEF4 $1581
ADDRFP4 0
INDIRP4
ADDRLP4 1248
INDIRI4
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1581
line 3484
;3484:		{ //if we managed to lift him into the air for 2 seconds, give him a crack
line 3485
;3485:			self->client->ps.fd.forceGripDamageDebounceTime = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 1
ASGNI4
line 3486
;3486:			G_Damage(gripEnt, self, self, NULL, NULL, 40, DAMAGE_NO_ARMOR, MOD_FORCE_DARK);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1256
CNSTP4 0
ASGNP4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRLP4 1256
INDIRP4
ARGP4
CNSTI4 40
ARGI4
CNSTI4 2
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3489
;3487:
;3488:			//Must play custom sounds on the actual entity. Don't use G_Sound (it creates a temp entity for the sound)
;3489:			G_EntitySound( gripEnt, CHAN_VOICE, G_SoundIndex(va( "*choke%d.wav", Q_irand( 1, 3 ) )) );
CNSTI4 1
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1260
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $1536
ARGP4
ADDRLP4 1260
INDIRI4
ARGI4
ADDRLP4 1264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1268
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 3491
;3490:
;3491:			gripEnt->client->ps.forceHandExtend = HANDEXTEND_CHOKE;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 5
ASGNI4
line 3492
;3492:			gripEnt->client->ps.forceHandExtendTime = level.time + 2000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 3494
;3493:
;3494:			if (gripEnt->client->ps.fd.forcePowersActive & (1 << FP_GRIP))
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1489
line 3495
;3495:			{ //choking, so don't let him keep gripping himself
line 3496
;3496:				WP_ForcePowerStop(gripEnt, FP_GRIP);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3497
;3497:			}
line 3498
;3498:		}
ADDRGP4 $1489
JUMPV
LABELV $1581
line 3499
;3499:		else if ((level.time - gripEnt->client->ps.fd.forceGripStarted) > 4000)
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1165623296
LEF4 $1489
line 3500
;3500:		{
line 3501
;3501:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3502
;3502:		}
line 3503
;3503:		return;
LABELV $1543
line 3505
;3504:	}
;3505:}
LABELV $1489
endproc DoGripAction 1272 32
export G_IsMindTricked
proc G_IsMindTricked 24 0
line 3508
;3506:
;3507:qboolean G_IsMindTricked(forcedata_t *fd, int client)
;3508:{
line 3511
;3509:	int checkIn;
;3510:	int trickIndex1, trickIndex2, trickIndex3, trickIndex4;
;3511:	int sub = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3513
;3512:
;3513:	if (!fd)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1591
line 3514
;3514:	{
line 3515
;3515:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1590
JUMPV
LABELV $1591
line 3518
;3516:	}
;3517:
;3518:	trickIndex1 = fd->forceMindtrickTargetIndex;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ASGNI4
line 3519
;3519:	trickIndex2 = fd->forceMindtrickTargetIndex2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ASGNI4
line 3520
;3520:	trickIndex3 = fd->forceMindtrickTargetIndex3;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ASGNI4
line 3521
;3521:	trickIndex4 = fd->forceMindtrickTargetIndex4;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
line 3523
;3522:
;3523:	if (client > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $1593
line 3524
;3524:	{
line 3525
;3525:		checkIn = trickIndex4;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 3526
;3526:		sub = 48;
ADDRLP4 0
CNSTI4 48
ASGNI4
line 3527
;3527:	}
ADDRGP4 $1594
JUMPV
LABELV $1593
line 3528
;3528:	else if (client > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $1595
line 3529
;3529:	{
line 3530
;3530:		checkIn = trickIndex3;
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3531
;3531:		sub = 32;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 3532
;3532:	}
ADDRGP4 $1596
JUMPV
LABELV $1595
line 3533
;3533:	else if (client > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $1597
line 3534
;3534:	{
line 3535
;3535:		checkIn = trickIndex2;
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 3536
;3536:		sub = 16;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 3537
;3537:	}
ADDRGP4 $1598
JUMPV
LABELV $1597
line 3539
;3538:	else
;3539:	{
line 3540
;3540:		checkIn = trickIndex1;
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 3541
;3541:	}
LABELV $1598
LABELV $1596
LABELV $1594
line 3543
;3542:
;3543:	if (checkIn & (1 << (client-sub)))
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1599
line 3544
;3544:	{
line 3545
;3545:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1590
JUMPV
LABELV $1599
line 3548
;3546:	}
;3547:	
;3548:	return qfalse;
CNSTI4 0
RETI4
LABELV $1590
endproc G_IsMindTricked 24 0
proc RemoveTrickedEnt 4 0
line 3552
;3549:}
;3550:
;3551:static void RemoveTrickedEnt(forcedata_t *fd, int client)
;3552:{
line 3553
;3553:	if (!fd)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1602
line 3554
;3554:	{
line 3555
;3555:		return;
ADDRGP4 $1601
JUMPV
LABELV $1602
line 3558
;3556:	}
;3557:
;3558:	if (client > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $1604
line 3559
;3559:	{
line 3560
;3560:		fd->forceMindtrickTargetIndex4 &= ~(1 << (client-48));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 48
SUBI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3561
;3561:	}
ADDRGP4 $1605
JUMPV
LABELV $1604
line 3562
;3562:	else if (client > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $1606
line 3563
;3563:	{
line 3564
;3564:		fd->forceMindtrickTargetIndex3 &= ~(1 << (client-32));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 32
SUBI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3565
;3565:	}
ADDRGP4 $1607
JUMPV
LABELV $1606
line 3566
;3566:	else if (client > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $1608
line 3567
;3567:	{
line 3568
;3568:		fd->forceMindtrickTargetIndex2 &= ~(1 << (client-16));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 16
SUBI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3569
;3569:	}
ADDRGP4 $1609
JUMPV
LABELV $1608
line 3571
;3570:	else
;3571:	{
line 3572
;3572:		fd->forceMindtrickTargetIndex &= ~(1 << client);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3573
;3573:	}
LABELV $1609
LABELV $1607
LABELV $1605
line 3574
;3574:}
LABELV $1601
endproc RemoveTrickedEnt 4 0
proc WP_UpdateMindtrickEnts 56 12
line 3580
;3575:
;3576:extern int g_LastFrameTime;
;3577:extern int g_TimeSinceLastFrame;
;3578:
;3579:static void WP_UpdateMindtrickEnts(gentity_t *self)
;3580:{
line 3581
;3581:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1612
JUMPV
LABELV $1611
line 3584
;3582:
;3583:	while (i < MAX_CLIENTS)
;3584:	{
line 3585
;3585:		if (G_IsMindTricked(&self->client->ps.fd, i))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 G_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1614
line 3586
;3586:		{
line 3587
;3587:			gentity_t *ent = &g_entities[i];
ADDRLP4 8
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3589
;3588:
;3589:			if ( !ent || !ent->client || !ent->inuse || ent->health < 1 ||
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $1621
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $1621
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1621
ADDRLP4 8
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1621
ADDRLP4 20
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $1616
LABELV $1621
line 3591
;3590:				(ent->client->ps.fd.forcePowersActive & (1 << FP_SEE)) )
;3591:			{
line 3592
;3592:				RemoveTrickedEnt(&self->client->ps.fd, i);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 RemoveTrickedEnt
CALLV
pop
line 3593
;3593:			}
ADDRGP4 $1617
JUMPV
LABELV $1616
line 3594
;3594:			else if ((level.time - self->client->dangerTime) < g_TimeSinceLastFrame*4)
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1788
ADDP4
INDIRI4
SUBI4
ADDRGP4 g_TimeSinceLastFrame
INDIRI4
CNSTI4 2
LSHI4
GEI4 $1622
line 3595
;3595:			{ //Untrick this entity if the tricker (self) fires while in his fov
line 3596
;3596:				if (trap_InPVS(ent->client->ps.origin, self->client->ps.origin) &&
ADDRLP4 28
CNSTI4 408
ASGNI4
ADDRLP4 32
CNSTI4 20
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1623
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 48
CNSTI4 20
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $1623
line 3598
;3597:					OrgVisible(ent->client->ps.origin, self->client->ps.origin, ent->s.number))
;3598:				{
line 3599
;3599:					RemoveTrickedEnt(&self->client->ps.fd, i);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 RemoveTrickedEnt
CALLV
pop
line 3600
;3600:				}
line 3601
;3601:			}
ADDRGP4 $1623
JUMPV
LABELV $1622
line 3602
;3602:			else if (BG_HasYsalamiri(g_gametype.integer, &ent->client->ps))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1627
line 3603
;3603:			{
line 3604
;3604:				RemoveTrickedEnt(&self->client->ps.fd, i);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 RemoveTrickedEnt
CALLV
pop
line 3605
;3605:			}
LABELV $1627
LABELV $1623
LABELV $1617
line 3606
;3606:		}
LABELV $1614
line 3608
;3607:
;3608:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3609
;3609:	}
LABELV $1612
line 3583
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1611
line 3611
;3610:
;3611:	if (!self->client->ps.fd.forceMindtrickTargetIndex &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1630
ADDRLP4 4
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1630
ADDRLP4 4
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1630
ADDRLP4 4
INDIRP4
CNSTI4 1168
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1630
line 3615
;3612:		!self->client->ps.fd.forceMindtrickTargetIndex2 &&
;3613:		!self->client->ps.fd.forceMindtrickTargetIndex3 &&
;3614:		!self->client->ps.fd.forceMindtrickTargetIndex4)
;3615:	{ //everyone who we had tricked is no longer tricked, so stop the power
line 3616
;3616:		WP_ForcePowerStop(self, FP_TELEPATHY);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3617
;3617:	}
ADDRGP4 $1631
JUMPV
LABELV $1630
line 3618
;3618:	else if (self->client->ps.powerups[PW_REDFLAG] ||
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1634
ADDRLP4 12
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1632
LABELV $1634
line 3620
;3619:		self->client->ps.powerups[PW_BLUEFLAG])
;3620:	{
line 3621
;3621:		WP_ForcePowerStop(self, FP_TELEPATHY);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3622
;3622:	}
LABELV $1632
LABELV $1631
line 3623
;3623:}
LABELV $1610
endproc WP_UpdateMindtrickEnts 56 12
proc WP_ForcePowerRun 64 12
line 3626
;3624:
;3625:static void WP_ForcePowerRun( gentity_t *self, forcePowers_t forcePower, usercmd_t *cmd )
;3626:{
line 3629
;3627:	extern usercmd_t	ucmd;
;3628:
;3629:	switch( (int)forcePower )
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1637
ADDRLP4 0
INDIRI4
CNSTI4 17
GTI4 $1637
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1735
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1735
address $1639
address $1671
address $1637
address $1637
address $1637
address $1717
address $1662
address $1703
address $1674
address $1721
address $1728
address $1637
address $1637
address $1689
address $1637
address $1637
address $1637
address $1637
code
line 3630
;3630:	{
LABELV $1639
line 3632
;3631:	case FP_HEAL:
;3632:		if (self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1640
line 3633
;3633:		{
line 3634
;3634:			if (self->client->ps.velocity[0] || self->client->ps.velocity[1] || self->client->ps.velocity[2])
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $1645
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $1645
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
EQF4 $1642
LABELV $1645
line 3635
;3635:			{
line 3636
;3636:				WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3637
;3637:				break;
ADDRGP4 $1637
JUMPV
LABELV $1642
line 3639
;3638:			}
;3639:		}
LABELV $1640
line 3641
;3640:
;3641:		if (self->health < 1 || self->client->ps.stats[STAT_HEALTH] < 1)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $1648
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $1646
LABELV $1648
line 3642
;3642:		{
line 3643
;3643:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3644
;3644:			break;
ADDRGP4 $1637
JUMPV
LABELV $1646
line 3647
;3645:		}
;3646:
;3647:		if (self->client->ps.fd.forceHealTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1148
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1649
line 3648
;3648:		{
line 3649
;3649:			break;
ADDRGP4 $1637
JUMPV
LABELV $1649
line 3651
;3650:		}
;3651:		if ( self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $1652
line 3652
;3652:		{ //rww - we might start out over max_health and we don't want force heal taking us down to 100 or whatever max_health is
line 3653
;3653:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3654
;3654:			break;
ADDRGP4 $1637
JUMPV
LABELV $1652
line 3656
;3655:		}
;3656:		self->client->ps.fd.forceHealTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1148
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3657
;3657:		self->health++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3658
;3658:		self->client->ps.fd.forceHealAmount++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3660
;3659:
;3660:		if ( self->health > self->client->ps.stats[STAT_MAX_HEALTH])	// Past max health
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $1655
line 3661
;3661:		{
line 3662
;3662:			self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 3663
;3663:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3664
;3664:		}
LABELV $1655
line 3666
;3665:
;3666:		if ( (self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_1 && self->client->ps.fd.forceHealAmount >= 25) ||
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1660
ADDRLP4 32
INDIRP4
CNSTI4 1152
ADDP4
INDIRI4
CNSTI4 25
GEI4 $1659
LABELV $1660
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1637
ADDRLP4 36
INDIRP4
CNSTI4 1152
ADDP4
INDIRI4
CNSTI4 33
LTI4 $1637
LABELV $1659
line 3668
;3667:			(self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_2 && self->client->ps.fd.forceHealAmount >= 33))
;3668:		{
line 3669
;3669:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3670
;3670:		}
line 3671
;3671:		break;
ADDRGP4 $1637
JUMPV
line 3674
;3672:	case FP_SPEED:
;3673:		//This is handled in PM_WalkMove and PM_StepSlideMove
;3674:		break;
LABELV $1662
line 3676
;3675:	case FP_GRIP:
;3676:		if (self->client->ps.forceHandExtend != HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1663
line 3677
;3677:		{
line 3678
;3678:			WP_ForcePowerStop(self, FP_GRIP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3679
;3679:			break;
ADDRGP4 $1637
JUMPV
LABELV $1663
line 3682
;3680:		}
;3681:
;3682:		if (self->client->ps.fd.forcePowerDebounce[FP_PULL] < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1665
line 3683
;3683:		{ //This is sort of not ideal. Using the debounce value reserved for pull for this because pull doesn't need it.
line 3684
;3684:			BG_ForcePowerDrain( &self->client->ps, forcePower, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 3685
;3685:			self->client->ps.fd.forcePowerDebounce[FP_PULL] = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3686
;3686:		}
LABELV $1665
line 3688
;3687:
;3688:		if (self->client->ps.fd.forcePower < 1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1669
line 3689
;3689:		{
line 3690
;3690:			WP_ForcePowerStop(self, FP_GRIP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3691
;3691:			break;
ADDRGP4 $1637
JUMPV
LABELV $1669
line 3694
;3692:		}
;3693:
;3694:		DoGripAction(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 DoGripAction
CALLV
pop
line 3695
;3695:		break;
ADDRGP4 $1637
JUMPV
LABELV $1671
line 3697
;3696:	case FP_LEVITATION:
;3697:		if ( self->client->ps.groundEntityNum != ENTITYNUM_NONE && !self->client->ps.fd.forceJumpZStart )
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $1637
ADDRLP4 40
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1637
line 3698
;3698:		{//done with jump
line 3699
;3699:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3700
;3700:		}
line 3701
;3701:		break;
ADDRGP4 $1637
JUMPV
LABELV $1674
line 3703
;3702:	case FP_RAGE:
;3703:		if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1675
line 3704
;3704:		{
line 3705
;3705:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3706
;3706:			break;
ADDRGP4 $1637
JUMPV
LABELV $1675
line 3708
;3707:		}
;3708:		if (self->client->ps.forceRageDrainTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1677
line 3709
;3709:		{
line 3710
;3710:			int addTime = 400;
ADDRLP4 44
CNSTI4 400
ASGNI4
line 3712
;3711:
;3712:			self->health -= 2;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 3714
;3713:
;3714:			if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1680
line 3715
;3715:			{
line 3716
;3716:				addTime = 150;
ADDRLP4 44
CNSTI4 150
ASGNI4
line 3717
;3717:			}
ADDRGP4 $1681
JUMPV
LABELV $1680
line 3718
;3718:			else if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1682
line 3719
;3719:			{
line 3720
;3720:				addTime = 300;
ADDRLP4 44
CNSTI4 300
ASGNI4
line 3721
;3721:			}
ADDRGP4 $1683
JUMPV
LABELV $1682
line 3722
;3722:			else if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1684
line 3723
;3723:			{
line 3724
;3724:				addTime = 450;
ADDRLP4 44
CNSTI4 450
ASGNI4
line 3725
;3725:			}
LABELV $1684
LABELV $1683
LABELV $1681
line 3726
;3726:			self->client->ps.forceRageDrainTime = level.time + addTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1256
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ASGNI4
line 3727
;3727:		}
LABELV $1677
line 3729
;3728:
;3729:		if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1687
line 3730
;3730:		{
line 3731
;3731:			self->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 3732
;3732:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3733
;3733:		}
LABELV $1687
line 3735
;3734:
;3735:		self->client->ps.stats[STAT_HEALTH] = self->health;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
line 3736
;3736:		break;
ADDRGP4 $1637
JUMPV
LABELV $1689
line 3738
;3737:	case FP_DRAIN:
;3738:		if (self->client->ps.forceHandExtend != HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1690
line 3739
;3739:		{
line 3740
;3740:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3741
;3741:			break;
ADDRGP4 $1637
JUMPV
LABELV $1690
line 3744
;3742:		}
;3743:
;3744:		if ( self->client->ps.fd.forcePowerLevel[FP_DRAIN] > FORCE_LEVEL_1 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1692
line 3745
;3745:		{//higher than level 1
line 3746
;3746:			if ( (cmd->buttons & BUTTON_FORCE_DRAIN) || ((cmd->buttons & BUTTON_FORCEPOWER) && self->client->ps.fd.forcePowerSelected == FP_DRAIN) )
ADDRLP4 48
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 52
INDIRI4
NEI4 $1696
ADDRLP4 48
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 52
INDIRI4
EQI4 $1694
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1694
LABELV $1696
line 3747
;3747:			{//holding it keeps it going
line 3748
;3748:				self->client->ps.fd.forcePowerDuration[FP_DRAIN] = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 912
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3749
;3749:			}
LABELV $1694
line 3750
;3750:		}
LABELV $1692
line 3751
;3751:		if ( !WP_ForcePowerAvailable( self, forcePower ) || self->client->ps.fd.forcePowerDuration[FP_DRAIN] < level.time ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1702
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 912
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $1702
ADDRLP4 52
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 25
GEI4 $1698
LABELV $1702
line 3753
;3752:			self->client->ps.fd.forcePower < 25)
;3753:		{
line 3754
;3754:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3755
;3755:		}
ADDRGP4 $1637
JUMPV
LABELV $1698
line 3757
;3756:		else
;3757:		{
line 3758
;3758:			ForceShootDrain( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceShootDrain
CALLI4
pop
line 3759
;3759:		}
line 3760
;3760:		break;
ADDRGP4 $1637
JUMPV
LABELV $1703
line 3762
;3761:	case FP_LIGHTNING:
;3762:		if (self->client->ps.forceHandExtend != HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1704
line 3763
;3763:		{ //Animation for hand extend doesn't end with hand out, so we have to limit lightning intervals by animation intervals (once hand starts to go in in animation, lightning should stop)
line 3764
;3764:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3765
;3765:			break;
ADDRGP4 $1637
JUMPV
LABELV $1704
line 3768
;3766:		}
;3767:
;3768:		if ( self->client->ps.fd.forcePowerLevel[FP_LIGHTNING] > FORCE_LEVEL_1 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1706
line 3769
;3769:		{//higher than level 1
line 3770
;3770:			if ( (cmd->buttons & BUTTON_FORCE_LIGHTNING) || ((cmd->buttons & BUTTON_FORCEPOWER) && self->client->ps.fd.forcePowerSelected == FP_LIGHTNING) )
ADDRLP4 56
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $1710
ADDRLP4 56
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 60
INDIRI4
EQI4 $1708
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 7
NEI4 $1708
LABELV $1710
line 3771
;3771:			{//holding it keeps it going
line 3772
;3772:				self->client->ps.fd.forcePowerDuration[FP_LIGHTNING] = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 888
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3773
;3773:			}
LABELV $1708
line 3774
;3774:		}
LABELV $1706
line 3775
;3775:		if ( !WP_ForcePowerAvailable( self, forcePower ) || self->client->ps.fd.forcePowerDuration[FP_LIGHTNING] < level.time ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $1716
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $1716
ADDRLP4 60
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 25
GEI4 $1712
LABELV $1716
line 3777
;3776:			self->client->ps.fd.forcePower < 25)
;3777:		{
line 3778
;3778:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3779
;3779:		}
ADDRGP4 $1637
JUMPV
LABELV $1712
line 3781
;3780:		else
;3781:		{
line 3782
;3782:			ForceShootLightning( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceShootLightning
CALLV
pop
line 3783
;3783:			BG_ForcePowerDrain( &self->client->ps, forcePower, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 3784
;3784:		}
line 3785
;3785:		break;
ADDRGP4 $1637
JUMPV
LABELV $1717
line 3787
;3786:	case FP_TELEPATHY:
;3787:		WP_UpdateMindtrickEnts(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_UpdateMindtrickEnts
CALLV
pop
line 3788
;3788:		break;
ADDRGP4 $1637
JUMPV
line 3790
;3789:	case FP_SABERATTACK:
;3790:		break;
line 3792
;3791:	case FP_SABERDEFEND:
;3792:		break;
line 3794
;3793:	case FP_SABERTHROW:
;3794:		break;
LABELV $1721
line 3796
;3795:	case FP_PROTECT:
;3796:		if (self->client->ps.fd.forcePowerDebounce[forcePower] < level.time)
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1637
line 3797
;3797:		{
line 3798
;3798:			BG_ForcePowerDrain( &self->client->ps, forcePower, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 3799
;3799:			if (self->client->ps.fd.forcePower < 1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1725
line 3800
;3800:			{
line 3801
;3801:				WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3802
;3802:			}
LABELV $1725
line 3804
;3803:
;3804:			self->client->ps.fd.forcePowerDebounce[forcePower] = level.time + 300;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 3805
;3805:		}
line 3806
;3806:		break;
ADDRGP4 $1637
JUMPV
LABELV $1728
line 3808
;3807:	case FP_ABSORB:
;3808:		if (self->client->ps.fd.forcePowerDebounce[forcePower] < level.time)
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1637
line 3809
;3809:		{
line 3810
;3810:			BG_ForcePowerDrain( &self->client->ps, forcePower, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 3811
;3811:			if (self->client->ps.fd.forcePower < 1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1732
line 3812
;3812:			{
line 3813
;3813:				WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3814
;3814:			}
LABELV $1732
line 3816
;3815:
;3816:			self->client->ps.fd.forcePowerDebounce[forcePower] = level.time + 600;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 600
ADDI4
ASGNI4
line 3817
;3817:		}
line 3818
;3818:		break;
line 3820
;3819:	default:
;3820:		break;
LABELV $1637
line 3822
;3821:	}
;3822:}
LABELV $1635
endproc WP_ForcePowerRun 64 12
export WP_DoSpecificPower
proc WP_DoSpecificPower 16 12
line 3825
;3823:
;3824:int WP_DoSpecificPower( gentity_t *self, usercmd_t *ucmd, forcePowers_t forcepower)
;3825:{
line 3828
;3826:	int powerSucceeded;
;3827:
;3828:	powerSucceeded = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3830
;3829:
;3830:	if ( !WP_ForcePowerAvailable( self, forcepower ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1737
line 3831
;3831:	{
line 3832
;3832:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1736
JUMPV
LABELV $1737
line 3835
;3833:	}
;3834:
;3835:	switch(forcepower)
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $1740
ADDRLP4 8
INDIRI4
CNSTI4 17
GTI4 $1740
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1790
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1790
address $1742
address $1745
address $1748
address $1759
address $1762
address $1765
address $1751
address $1758
address $1768
address $1771
address $1774
address $1777
address $1780
address $1783
address $1784
address $1740
address $1740
address $1740
code
line 3836
;3836:	{
LABELV $1742
line 3838
;3837:	case FP_HEAL:
;3838:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3839
;3839:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1743
line 3840
;3840:		{ //need to release before we can use nonhold powers again
line 3841
;3841:			break;
ADDRGP4 $1740
JUMPV
LABELV $1743
line 3843
;3842:		}
;3843:		ForceHeal(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceHeal
CALLV
pop
line 3844
;3844:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3845
;3845:		break;
ADDRGP4 $1740
JUMPV
LABELV $1745
line 3849
;3846:	case FP_LEVITATION:
;3847:		//if leave the ground by some other means, cancel the force jump so we don't suddenly jump when we land.
;3848:		
;3849:		if ( self->client->ps.groundEntityNum == ENTITYNUM_NONE )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1746
line 3850
;3850:		{
line 3851
;3851:			self->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 3852
;3852:			G_MuteSound( self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3854
;3853:			//This only happens if the groundEntityNum == ENTITYNUM_NONE when the button is actually released
;3854:		}
ADDRGP4 $1740
JUMPV
LABELV $1746
line 3856
;3855:		else
;3856:		{//still on ground, so jump
line 3857
;3857:			ForceJump( self, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ForceJump
CALLV
pop
line 3858
;3858:		}
line 3859
;3859:		break;
ADDRGP4 $1740
JUMPV
LABELV $1748
line 3861
;3860:	case FP_SPEED:
;3861:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3862
;3862:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1749
line 3863
;3863:		{ //need to release before we can use nonhold powers again
line 3864
;3864:			break;
ADDRGP4 $1740
JUMPV
LABELV $1749
line 3866
;3865:		}
;3866:		ForceSpeed(self, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceSpeed
CALLV
pop
line 3867
;3867:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3868
;3868:		break;
ADDRGP4 $1740
JUMPV
LABELV $1751
line 3870
;3869:	case FP_GRIP:
;3870:		if (self->client->ps.fd.forceGripEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1752
line 3871
;3871:		{
line 3872
;3872:			ForceGrip( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceGrip
CALLV
pop
line 3873
;3873:		}
LABELV $1752
line 3875
;3874:
;3875:		if (self->client->ps.fd.forceGripEntityNum != ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $1754
line 3876
;3876:		{
line 3877
;3877:			if (!(self->client->ps.fd.forcePowersActive & (1 << FP_GRIP)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $1740
line 3878
;3878:			{
line 3879
;3879:				WP_ForcePowerStart( self, FP_GRIP, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 3880
;3880:				BG_ForcePowerDrain( &self->client->ps, FP_GRIP, GRIP_DRAIN_AMOUNT );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 3881
;3881:			}
line 3882
;3882:		}
ADDRGP4 $1740
JUMPV
LABELV $1754
line 3884
;3883:		else
;3884:		{
line 3885
;3885:			powerSucceeded = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3886
;3886:		}
line 3887
;3887:		break;
ADDRGP4 $1740
JUMPV
LABELV $1758
line 3889
;3888:	case FP_LIGHTNING:
;3889:		ForceLightning(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceLightning
CALLV
pop
line 3890
;3890:		break;
ADDRGP4 $1740
JUMPV
LABELV $1759
line 3892
;3891:	case FP_PUSH:
;3892:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3893
;3893:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1760
line 3894
;3894:		{ //need to release before we can use nonhold powers again
line 3895
;3895:			break;
ADDRGP4 $1740
JUMPV
LABELV $1760
line 3897
;3896:		}
;3897:		ForceThrow(self, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 3898
;3898:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3899
;3899:		break;
ADDRGP4 $1740
JUMPV
LABELV $1762
line 3901
;3900:	case FP_PULL:
;3901:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3902
;3902:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1763
line 3903
;3903:		{ //need to release before we can use nonhold powers again
line 3904
;3904:			break;
ADDRGP4 $1740
JUMPV
LABELV $1763
line 3906
;3905:		}
;3906:		ForceThrow(self, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 3907
;3907:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3908
;3908:		break;
ADDRGP4 $1740
JUMPV
LABELV $1765
line 3910
;3909:	case FP_TELEPATHY:
;3910:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3911
;3911:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1766
line 3912
;3912:		{ //need to release before we can use nonhold powers again
line 3913
;3913:			break;
ADDRGP4 $1740
JUMPV
LABELV $1766
line 3915
;3914:		}
;3915:		ForceTelepathy(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTelepathy
CALLV
pop
line 3916
;3916:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3917
;3917:		break;
ADDRGP4 $1740
JUMPV
LABELV $1768
line 3919
;3918:	case FP_RAGE:
;3919:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3920
;3920:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1769
line 3921
;3921:		{ //need to release before we can use nonhold powers again
line 3922
;3922:			break;
ADDRGP4 $1740
JUMPV
LABELV $1769
line 3924
;3923:		}
;3924:		ForceRage(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceRage
CALLV
pop
line 3925
;3925:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3926
;3926:		break;
ADDRGP4 $1740
JUMPV
LABELV $1771
line 3928
;3927:	case FP_PROTECT:
;3928:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3929
;3929:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1772
line 3930
;3930:		{ //need to release before we can use nonhold powers again
line 3931
;3931:			break;
ADDRGP4 $1740
JUMPV
LABELV $1772
line 3933
;3932:		}
;3933:		ForceProtect(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceProtect
CALLV
pop
line 3934
;3934:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3935
;3935:		break;
ADDRGP4 $1740
JUMPV
LABELV $1774
line 3937
;3936:	case FP_ABSORB:
;3937:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3938
;3938:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1775
line 3939
;3939:		{ //need to release before we can use nonhold powers again
line 3940
;3940:			break;
ADDRGP4 $1740
JUMPV
LABELV $1775
line 3942
;3941:		}
;3942:		ForceAbsorb(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceAbsorb
CALLV
pop
line 3943
;3943:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3944
;3944:		break;
ADDRGP4 $1740
JUMPV
LABELV $1777
line 3946
;3945:	case FP_TEAM_HEAL:
;3946:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3947
;3947:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1778
line 3948
;3948:		{ //need to release before we can use nonhold powers again
line 3949
;3949:			break;
ADDRGP4 $1740
JUMPV
LABELV $1778
line 3951
;3950:		}
;3951:		ForceTeamHeal(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamHeal
CALLV
pop
line 3952
;3952:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3953
;3953:		break;
ADDRGP4 $1740
JUMPV
LABELV $1780
line 3955
;3954:	case FP_TEAM_FORCE:
;3955:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3956
;3956:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1781
line 3957
;3957:		{ //need to release before we can use nonhold powers again
line 3958
;3958:			break;
ADDRGP4 $1740
JUMPV
LABELV $1781
line 3960
;3959:		}
;3960:		ForceTeamForceReplenish(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamForceReplenish
CALLV
pop
line 3961
;3961:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3962
;3962:		break;
ADDRGP4 $1740
JUMPV
LABELV $1783
line 3964
;3963:	case FP_DRAIN:
;3964:		ForceDrain(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceDrain
CALLV
pop
line 3965
;3965:		break;
ADDRGP4 $1740
JUMPV
LABELV $1784
line 3967
;3966:	case FP_SEE:
;3967:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3968
;3968:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1785
line 3969
;3969:		{ //need to release before we can use nonhold powers again
line 3970
;3970:			break;
ADDRGP4 $1740
JUMPV
LABELV $1785
line 3972
;3971:		}
;3972:		ForceSeeing(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceSeeing
CALLV
pop
line 3973
;3973:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 3974
;3974:		break;
line 3976
;3975:	case FP_SABERATTACK:
;3976:		break;
line 3978
;3977:	case FP_SABERDEFEND:
;3978:		break;
line 3980
;3979:	case FP_SABERTHROW:
;3980:		break;
line 3982
;3981:	default:
;3982:		break;
LABELV $1740
line 3985
;3983:	}
;3984:
;3985:	return powerSucceeded;
ADDRLP4 0
INDIRI4
RETI4
LABELV $1736
endproc WP_DoSpecificPower 16 12
export FindGenericEnemyIndex
proc FindGenericEnemyIndex 116 16
line 3989
;3986:}
;3987:
;3988:void FindGenericEnemyIndex(gentity_t *self)
;3989:{ //Find another client that would be considered a threat.
line 3990
;3990:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3993
;3991:	float tlen;
;3992:	gentity_t *ent;
;3993:	gentity_t *besten = NULL;
ADDRLP4 28
CNSTP4 0
ASGNP4
line 3994
;3994:	float blen = 99999999;
ADDRLP4 24
CNSTF4 1287568416
ASGNF4
ADDRGP4 $1793
JUMPV
LABELV $1792
line 3998
;3995:	vec3_t a;
;3996:
;3997:	while (i < MAX_CLIENTS)
;3998:	{
line 3999
;3999:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4001
;4000:
;4001:		if (ent && ent->client && ent->s.number != self->s.number && ent->health > 0 && !OnSameTeam(self, ent) && ent->client->ps.pm_type != PM_INTERMISSION && ent->client->ps.pm_type != PM_SPECTATOR)
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1795
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1795
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 40
INDIRP4
INDIRI4
EQI4 $1795
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1795
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1795
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 6
EQI4 $1795
ADDRLP4 48
INDIRI4
CNSTI4 3
EQI4 $1795
line 4002
;4002:		{
line 4003
;4003:			VectorSubtract(ent->client->ps.origin, self->client->ps.origin, a);
ADDRLP4 52
CNSTI4 408
ASGNI4
ADDRLP4 56
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 60
CNSTI4 20
ASGNI4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 24
ASGNI4
ADDRLP4 8+4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 72
CNSTI4 408
ASGNI4
ADDRLP4 76
CNSTI4 28
ASGNI4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4004
;4004:			tlen = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 80
INDIRF4
ASGNF4
line 4006
;4005:
;4006:			if (tlen < blen &&
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
GEF4 $1799
ADDRLP4 84
CNSTI4 408
ASGNI4
ADDRLP4 88
CNSTI4 20
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1061997773
ARGF4
ADDRLP4 96
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $1799
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 408
ASGNI4
ADDRLP4 108
CNSTI4 20
ASGNI4
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $1799
line 4009
;4007:				InFront(ent->client->ps.origin, self->client->ps.origin, self->client->ps.viewangles, 0.8f ) &&
;4008:				OrgVisible(self->client->ps.origin, ent->client->ps.origin, self->s.number))
;4009:			{
line 4010
;4010:				blen = tlen;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ASGNF4
line 4011
;4011:				besten = ent;
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
line 4012
;4012:			}
LABELV $1799
line 4013
;4013:		}
LABELV $1795
line 4015
;4014:
;4015:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4016
;4016:	}
LABELV $1793
line 3997
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1792
line 4018
;4017:
;4018:	if (!besten)
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1801
line 4019
;4019:	{
line 4020
;4020:		return;
ADDRGP4 $1791
JUMPV
LABELV $1801
line 4023
;4021:	}
;4022:
;4023:	self->client->ps.genericEnemyIndex = besten->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 28
INDIRP4
INDIRI4
ASGNI4
line 4024
;4024:}
LABELV $1791
endproc FindGenericEnemyIndex 116 16
export SeekerDroneUpdate
proc SeekerDroneUpdate 1204 28
line 4027
;4025:
;4026:void SeekerDroneUpdate(gentity_t *self)
;4027:{
line 4031
;4028:	vec3_t org, elevated, dir, a, endir;
;4029:	gentity_t *en;
;4030:	float angle;
;4031:	float prefig = 0;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 4034
;4032:	trace_t tr;
;4033:
;4034:	if (!(self->client->ps.eFlags & EF_SEEKERDRONE))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
NEI4 $1804
line 4035
;4035:	{
line 4036
;4036:		self->client->ps.genericEnemyIndex = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 4037
;4037:		return;
ADDRGP4 $1803
JUMPV
LABELV $1804
line 4040
;4038:	}
;4039:
;4040:	if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1806
line 4041
;4041:	{
line 4042
;4042:		VectorCopy(self->client->ps.origin, elevated);
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
line 4043
;4043:		elevated[2] += 40;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 4045
;4044:
;4045:		angle = ((level.time / 12) & 255) * (M_PI * 2) / 255; //magical numbers make magic happen
ADDRLP4 36
CNSTF4 1086918619
ADDRGP4 level+32
INDIRI4
CNSTI4 12
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 4046
;4046:		dir[0] = cos(angle) * 20;
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 1152
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1101004800
ADDRLP4 1152
INDIRF4
MULF4
ASGNF4
line 4047
;4047:		dir[1] = sin(angle) * 20;
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 1156
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1101004800
ADDRLP4 1156
INDIRF4
MULF4
ASGNF4
line 4048
;4048:		dir[2] = cos(angle) * 5;
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 1160
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1084227584
ADDRLP4 1160
INDIRF4
MULF4
ASGNF4
line 4049
;4049:		VectorAdd(elevated, dir, org);
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 4051
;4050:
;4051:		a[ROLL] = 0;
ADDRLP4 44+8
CNSTF4 0
ASGNF4
line 4052
;4052:		a[YAW] = 0;
ADDRLP4 44+4
CNSTF4 0
ASGNF4
line 4053
;4053:		a[PITCH] = 1;
ADDRLP4 44
CNSTF4 1065353216
ASGNF4
line 4055
;4054:
;4055:		G_PlayEffect(EFFECT_SPARK_EXPLOSION, org, a);
CNSTI4 4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 4057
;4056:
;4057:		self->client->ps.eFlags -= EF_SEEKERDRONE;
ADDRLP4 1164
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1164
INDIRP4
ADDRLP4 1164
INDIRP4
INDIRI4
CNSTI4 1048576
SUBI4
ASGNI4
line 4058
;4058:		self->client->ps.genericEnemyIndex = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 4060
;4059:
;4060:		return;
ADDRGP4 $1803
JUMPV
LABELV $1806
line 4063
;4061:	}
;4062:
;4063:	if (self->client->ps.droneExistTime >= level.time && 
ADDRLP4 1152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1152
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LTF4 $1820
ADDRLP4 1152
INDIRF4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
CVIF4 4
GEF4 $1820
line 4065
;4064:		self->client->ps.droneExistTime < (level.time+5000))
;4065:	{
line 4066
;4066:		self->client->ps.genericEnemyIndex = 1024+self->client->ps.droneExistTime;
ADDRLP4 1156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 1156
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
CNSTF4 1149239296
ADDF4
CVFI4 4
ASGNI4
line 4067
;4067:		if (self->client->ps.droneFireTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1803
line 4068
;4068:		{
line 4069
;4069:			G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/laser_trap/warning.wav") );
ADDRGP4 $1827
ARGP4
ADDRLP4 1160
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 1160
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 4070
;4070:			self->client->ps.droneFireTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 4071
;4071:		}
line 4072
;4072:		return;
ADDRGP4 $1803
JUMPV
LABELV $1820
line 4074
;4073:	}
;4074:	else if (self->client->ps.droneExistTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1829
line 4075
;4075:	{
line 4076
;4076:		VectorCopy(self->client->ps.origin, elevated);
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
line 4077
;4077:		elevated[2] += 40;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 4079
;4078:
;4079:		prefig = (self->client->ps.droneExistTime-level.time)/80;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1117782016
DIVF4
ASGNF4
line 4081
;4080:
;4081:		if (prefig > 55)
ADDRLP4 56
INDIRF4
CNSTF4 1113325568
LEF4 $1834
line 4082
;4082:		{
line 4083
;4083:			prefig = 55;
ADDRLP4 56
CNSTF4 1113325568
ASGNF4
line 4084
;4084:		}
ADDRGP4 $1835
JUMPV
LABELV $1834
line 4085
;4085:		else if (prefig < 1)
ADDRLP4 56
INDIRF4
CNSTF4 1065353216
GEF4 $1836
line 4086
;4086:		{
line 4087
;4087:			prefig = 1;
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
line 4088
;4088:		}
LABELV $1836
LABELV $1835
line 4090
;4089:
;4090:		elevated[2] -= 55-prefig;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1113325568
ADDRLP4 56
INDIRF4
SUBF4
SUBF4
ASGNF4
line 4092
;4091:
;4092:		angle = ((level.time / 12) & 255) * (M_PI * 2) / 255; //magical numbers make magic happen
ADDRLP4 36
CNSTF4 1086918619
ADDRGP4 level+32
INDIRI4
CNSTI4 12
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 4093
;4093:		dir[0] = cos(angle) * 20;
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 1156
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1101004800
ADDRLP4 1156
INDIRF4
MULF4
ASGNF4
line 4094
;4094:		dir[1] = sin(angle) * 20;
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 1160
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1101004800
ADDRLP4 1160
INDIRF4
MULF4
ASGNF4
line 4095
;4095:		dir[2] = cos(angle) * 5;
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 1164
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1084227584
ADDRLP4 1164
INDIRF4
MULF4
ASGNF4
line 4096
;4096:		VectorAdd(elevated, dir, org);
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 4098
;4097:
;4098:		a[ROLL] = 0;
ADDRLP4 44+8
CNSTF4 0
ASGNF4
line 4099
;4099:		a[YAW] = 0;
ADDRLP4 44+4
CNSTF4 0
ASGNF4
line 4100
;4100:		a[PITCH] = 1;
ADDRLP4 44
CNSTF4 1065353216
ASGNF4
line 4102
;4101:
;4102:		G_PlayEffect(EFFECT_SPARK_EXPLOSION, org, a);
CNSTI4 4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 4104
;4103:
;4104:		self->client->ps.eFlags -= EF_SEEKERDRONE;
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1168
INDIRP4
ADDRLP4 1168
INDIRP4
INDIRI4
CNSTI4 1048576
SUBI4
ASGNI4
line 4105
;4105:		self->client->ps.genericEnemyIndex = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 4107
;4106:
;4107:		return;
ADDRGP4 $1803
JUMPV
LABELV $1829
line 4110
;4108:	}
;4109:
;4110:	if (self->client->ps.genericEnemyIndex == -1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1850
line 4111
;4111:	{
line 4112
;4112:		self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4113
;4113:	}
LABELV $1850
line 4115
;4114:
;4115:	if (self->client->ps.genericEnemyIndex != ENTITYNUM_NONE && self->client->ps.genericEnemyIndex != -1)
ADDRLP4 1156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 1023
EQI4 $1852
ADDRLP4 1156
INDIRI4
CNSTI4 -1
EQI4 $1852
line 4116
;4116:	{
line 4117
;4117:		en = &g_entities[self->client->ps.genericEnemyIndex];
ADDRLP4 40
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4119
;4118:
;4119:		if (!en || !en->client)
ADDRLP4 1164
CNSTU4 0
ASGNU4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $1856
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
NEU4 $1854
LABELV $1856
line 4120
;4120:		{
line 4121
;4121:			self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4122
;4122:		}
ADDRGP4 $1855
JUMPV
LABELV $1854
line 4123
;4123:		else if (en->s.number == self->s.number)
ADDRLP4 40
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $1857
line 4124
;4124:		{
line 4125
;4125:			self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4126
;4126:		}
ADDRGP4 $1858
JUMPV
LABELV $1857
line 4127
;4127:		else if (en->health < 1)
ADDRLP4 40
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1859
line 4128
;4128:		{
line 4129
;4129:			self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4130
;4130:		}
ADDRGP4 $1860
JUMPV
LABELV $1859
line 4131
;4131:		else if (OnSameTeam(self, en))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
EQI4 $1861
line 4132
;4132:		{
line 4133
;4133:			self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4134
;4134:		}
ADDRGP4 $1862
JUMPV
LABELV $1861
line 4136
;4135:		else
;4136:		{
line 4137
;4137:			if (!InFront(en->client->ps.origin, self->client->ps.origin, self->client->ps.viewangles, 0.8f ))
ADDRLP4 1172
CNSTI4 408
ASGNI4
ADDRLP4 1176
CNSTI4 20
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 1172
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1176
INDIRI4
ADDP4
ARGP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ADDRLP4 1172
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
ADDRLP4 1176
INDIRI4
ADDP4
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1061997773
ARGF4
ADDRLP4 1184
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1863
line 4138
;4138:			{
line 4139
;4139:				self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4140
;4140:			}
ADDRGP4 $1864
JUMPV
LABELV $1863
line 4141
;4141:			else if (!OrgVisible(self->client->ps.origin, en->client->ps.origin, self->s.number))
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1192
CNSTI4 408
ASGNI4
ADDRLP4 1196
CNSTI4 20
ASGNI4
ADDRLP4 1188
INDIRP4
ADDRLP4 1192
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ARGP4
ADDRLP4 40
INDIRP4
ADDRLP4 1192
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ARGP4
ADDRLP4 1188
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1200
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $1865
line 4142
;4142:			{
line 4143
;4143:				self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4144
;4144:			}
LABELV $1865
LABELV $1864
line 4145
;4145:		}
LABELV $1862
LABELV $1860
LABELV $1858
LABELV $1855
line 4146
;4146:	}
LABELV $1852
line 4148
;4147:
;4148:	if (self->client->ps.genericEnemyIndex == ENTITYNUM_NONE || self->client->ps.genericEnemyIndex == -1)
ADDRLP4 1160
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 1023
EQI4 $1869
ADDRLP4 1160
INDIRI4
CNSTI4 -1
NEI4 $1867
LABELV $1869
line 4149
;4149:	{
line 4150
;4150:		FindGenericEnemyIndex(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FindGenericEnemyIndex
CALLV
pop
line 4151
;4151:	}
LABELV $1867
line 4153
;4152:
;4153:	if (self->client->ps.genericEnemyIndex != ENTITYNUM_NONE && self->client->ps.genericEnemyIndex != -1)
ADDRLP4 1164
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 1023
EQI4 $1870
ADDRLP4 1164
INDIRI4
CNSTI4 -1
EQI4 $1870
line 4154
;4154:	{
line 4155
;4155:		en = &g_entities[self->client->ps.genericEnemyIndex];
ADDRLP4 40
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4157
;4156:
;4157:		VectorCopy(self->client->ps.origin, elevated);
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
line 4158
;4158:		elevated[2] += 40;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 4160
;4159:
;4160:		angle = ((level.time / 12) & 255) * (M_PI * 2) / 255; //magical numbers make magic happen
ADDRLP4 36
CNSTF4 1086918619
ADDRGP4 level+32
INDIRI4
CNSTI4 12
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 4161
;4161:		dir[0] = cos(angle) * 20;
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 1168
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1101004800
ADDRLP4 1168
INDIRF4
MULF4
ASGNF4
line 4162
;4162:		dir[1] = sin(angle) * 20;
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 1172
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1101004800
ADDRLP4 1172
INDIRF4
MULF4
ASGNF4
line 4163
;4163:		dir[2] = cos(angle) * 5;
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 1176
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1084227584
ADDRLP4 1176
INDIRF4
MULF4
ASGNF4
line 4164
;4164:		VectorAdd(elevated, dir, org);
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 4167
;4165:
;4166:		//org is now where the thing should be client-side because it uses the same time-based offset
;4167:		if (self->client->ps.droneFireTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1882
line 4168
;4168:		{
line 4169
;4169:			trap_Trace(&tr, org, NULL, NULL, en->client->ps.origin, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1180
CNSTP4 0
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4171
;4170:
;4171:			if (tr.fraction == 1 && !tr.startsolid && !tr.allsolid)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $1885
ADDRLP4 1184
CNSTI4 0
ASGNI4
ADDRLP4 60+4
INDIRI4
ADDRLP4 1184
INDIRI4
NEI4 $1885
ADDRLP4 60
INDIRI4
ADDRLP4 1184
INDIRI4
NEI4 $1885
line 4172
;4172:			{
line 4173
;4173:				VectorSubtract(en->client->ps.origin, org, endir);
ADDRLP4 1188
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1188
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1140+4
ADDRLP4 1188
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1140+8
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
ASGNF4
line 4174
;4174:				VectorNormalize(endir);
ADDRLP4 1140
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4176
;4175:
;4176:				WP_FireGenericBlasterMissile(self, org, endir, 0, 15, 2000, MOD_BLASTER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 15
ARGI4
CNSTI4 2000
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 WP_FireGenericBlasterMissile
CALLV
pop
line 4177
;4177:				G_SoundAtLoc( org, CHAN_WEAPON, G_SoundIndex("sound/weapons/bryar/fire.wav") );
ADDRGP4 $1893
ARGP4
ADDRLP4 1192
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 24
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1192
INDIRI4
ARGI4
ADDRGP4 G_SoundAtLoc
CALLV
pop
line 4179
;4178:
;4179:				self->client->ps.droneFireTime = level.time + Q_irand(400, 700);
CNSTI4 400
ARGI4
CNSTI4 700
ARGI4
ADDRLP4 1196
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1196
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4180
;4180:			}
LABELV $1885
line 4181
;4181:		}
LABELV $1882
line 4182
;4182:	}
LABELV $1870
line 4183
;4183:}
LABELV $1803
endproc SeekerDroneUpdate 1204 28
export HolocronUpdate
proc HolocronUpdate 28 8
line 4186
;4184:
;4185:void HolocronUpdate(gentity_t *self)
;4186:{ //keep holocron status updated in holocron mode
line 4187
;4187:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4188
;4188:	int noHRank = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4190
;4189:
;4190:	if (noHRank < FORCE_LEVEL_0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1896
line 4191
;4191:	{
line 4192
;4192:		noHRank = FORCE_LEVEL_0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4193
;4193:	}
LABELV $1896
line 4194
;4194:	if (noHRank > FORCE_LEVEL_3)
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1898
line 4195
;4195:	{
line 4196
;4196:		noHRank = FORCE_LEVEL_3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 4197
;4197:	}
LABELV $1898
line 4199
;4198:
;4199:	trap_Cvar_Update(&g_MaxHolocronCarry);
ADDRGP4 g_MaxHolocronCarry
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
ADDRGP4 $1901
JUMPV
LABELV $1900
line 4202
;4200:
;4201:	while (i < NUM_FORCE_POWERS)
;4202:	{
line 4203
;4203:		if (self->client->ps.holocronsCarried[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1903
line 4204
;4204:		{ //carrying it, make sure we have the power
line 4205
;4205:			self->client->ps.holocronBits |= (1 << i);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 4206
;4206:			self->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 4207
;4207:			self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 4208
;4208:		}
ADDRGP4 $1904
JUMPV
LABELV $1903
line 4210
;4209:		else
;4210:		{ //otherwise, make sure the power is cleared from us
line 4211
;4211:			self->client->ps.fd.forcePowerLevel[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4212
;4212:			if (self->client->ps.holocronBits & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1905
line 4213
;4213:			{
line 4214
;4214:				self->client->ps.holocronBits -= (1 << i);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
SUBI4
ASGNI4
line 4215
;4215:			}
LABELV $1905
line 4217
;4216:
;4217:			if ((self->client->ps.fd.forcePowersKnown & (1 << i)) && i != FP_LEVITATION && i != FP_SABERATTACK)
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1907
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1907
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $1907
line 4218
;4218:			{
line 4219
;4219:				self->client->ps.fd.forcePowersKnown -= (1 << i);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
SUBI4
ASGNI4
line 4220
;4220:			}
LABELV $1907
line 4222
;4221:
;4222:			if ((self->client->ps.fd.forcePowersActive & (1 << i)) && i != FP_LEVITATION && i != FP_SABERATTACK)
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1909
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1909
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $1909
line 4223
;4223:			{
line 4224
;4224:				WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4225
;4225:			}
LABELV $1909
line 4227
;4226:
;4227:			if (i == FP_LEVITATION)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1911
line 4228
;4228:			{
line 4229
;4229:				if (noHRank >= FORCE_LEVEL_1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $1913
line 4230
;4230:				{
line 4231
;4231:					self->client->ps.fd.forcePowerLevel[i] = noHRank;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 4232
;4232:				}
ADDRGP4 $1912
JUMPV
LABELV $1913
line 4234
;4233:				else
;4234:				{
line 4235
;4235:					self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4236
;4236:				}
line 4237
;4237:			}
ADDRGP4 $1912
JUMPV
LABELV $1911
line 4238
;4238:			else if (i == FP_SABERATTACK)
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $1915
line 4239
;4239:			{
line 4240
;4240:				self->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 4242
;4241:
;4242:				if (noHRank >= FORCE_LEVEL_1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $1917
line 4243
;4243:				{
line 4244
;4244:					self->client->ps.fd.forcePowerLevel[i] = noHRank;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 4245
;4245:				}
ADDRGP4 $1916
JUMPV
LABELV $1917
line 4247
;4246:				else
;4247:				{
line 4248
;4248:					self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4249
;4249:				}
line 4250
;4250:			}
ADDRGP4 $1916
JUMPV
LABELV $1915
line 4252
;4251:			else
;4252:			{
line 4253
;4253:				self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4254
;4254:			}
LABELV $1916
LABELV $1912
line 4255
;4255:		}
LABELV $1904
line 4257
;4256:
;4257:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4258
;4258:	}
LABELV $1901
line 4201
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1900
line 4260
;4259:
;4260:	if (HasSetSaberOnly())
ADDRLP4 8
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1919
line 4261
;4261:	{ //if saberonly, we get these powers no matter what (still need the holocrons for level 3)
line 4262
;4262:		if (self->client->ps.fd.forcePowerLevel[FP_SABERATTACK] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1921
line 4263
;4263:		{
line 4264
;4264:			self->client->ps.fd.forcePowerLevel[FP_SABERATTACK] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
CNSTI4 1
ASGNI4
line 4265
;4265:		}
LABELV $1921
line 4266
;4266:		if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1923
line 4267
;4267:		{
line 4268
;4268:			self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 1
ASGNI4
line 4269
;4269:		}
LABELV $1923
line 4270
;4270:	}
LABELV $1919
line 4271
;4271:}
LABELV $1895
endproc HolocronUpdate 28 8
export JediMasterUpdate
proc JediMasterUpdate 20 8
line 4274
;4272:
;4273:void JediMasterUpdate(gentity_t *self)
;4274:{ //keep jedi master status updated for JM gametype
line 4275
;4275:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4277
;4276:
;4277:	trap_Cvar_Update(&g_MaxHolocronCarry);
ADDRGP4 g_MaxHolocronCarry
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
ADDRGP4 $1927
JUMPV
LABELV $1926
line 4280
;4278:
;4279:	while (i < NUM_FORCE_POWERS)
;4280:	{
line 4281
;4281:		if (self->client->ps.isJediMaster)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1929
line 4282
;4282:		{
line 4283
;4283:			self->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 4284
;4284:			self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 4286
;4285:
;4286:			if (i == FP_TEAM_HEAL || i == FP_TEAM_FORCE ||
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $1935
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $1935
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1935
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1931
LABELV $1935
line 4288
;4287:				i == FP_DRAIN || i == FP_ABSORB)
;4288:			{ //team powers are useless in JM, absorb is too because no one else has powers to absorb. Drain is just
line 4291
;4289:			  //relatively useless in comparison, because its main intent is not to heal, but rather to cripple others
;4290:			  //by draining their force at the same time. And no one needs force in JM except the JM himself.
;4291:				self->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 4292
;4292:				self->client->ps.fd.forcePowerLevel[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4293
;4293:			}
LABELV $1931
line 4295
;4294:
;4295:			if (i == FP_TELEPATHY)
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $1930
line 4296
;4296:			{ //this decision was made because level 3 mindtrick allows the JM to just hide too much, and no one else has force
line 4299
;4297:			  //sight to counteract it. Since the JM himself is the focus of gameplay in this mode, having him hidden for large
;4298:			  //durations is indeed a bad thing.
;4299:				self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_2;
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 4300
;4300:			}
line 4301
;4301:		}
ADDRGP4 $1930
JUMPV
LABELV $1929
line 4303
;4302:		else
;4303:		{
line 4304
;4304:			if ((self->client->ps.fd.forcePowersKnown & (1 << i)) && i != FP_LEVITATION)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1938
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1938
line 4305
;4305:			{
line 4306
;4306:				self->client->ps.fd.forcePowersKnown -= (1 << i);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
SUBI4
ASGNI4
line 4307
;4307:			}
LABELV $1938
line 4309
;4308:
;4309:			if ((self->client->ps.fd.forcePowersActive & (1 << i)) && i != FP_LEVITATION)
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1940
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1940
line 4310
;4310:			{
line 4311
;4311:				WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4312
;4312:			}
LABELV $1940
line 4314
;4313:
;4314:			if (i == FP_LEVITATION)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1942
line 4315
;4315:			{
line 4316
;4316:				self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4317
;4317:			}
ADDRGP4 $1943
JUMPV
LABELV $1942
line 4319
;4318:			else
;4319:			{
line 4320
;4320:				self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4321
;4321:			}
LABELV $1943
line 4322
;4322:		}
LABELV $1930
line 4324
;4323:
;4324:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4325
;4325:	}
LABELV $1927
line 4279
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1926
line 4326
;4326:}
LABELV $1925
endproc JediMasterUpdate 20 8
export WP_HasForcePowers
proc WP_HasForcePowers 4 0
line 4329
;4327:
;4328:qboolean WP_HasForcePowers( const playerState_t *ps )
;4329:{
line 4331
;4330:	int i;
;4331:	if ( ps )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1945
line 4332
;4332:	{
line 4333
;4333:		for ( i = 0; i < NUM_FORCE_POWERS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1947
line 4334
;4334:		{
line 4335
;4335:			if ( i == FP_LEVITATION )
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1951
line 4336
;4336:			{
line 4337
;4337:				if ( ps->fd.forcePowerLevel[i] > FORCE_LEVEL_1 )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1952
line 4338
;4338:				{
line 4339
;4339:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1944
JUMPV
line 4341
;4340:				}
;4341:			}
LABELV $1951
line 4342
;4342:			else if ( ps->fd.forcePowerLevel[i] > FORCE_LEVEL_0 )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1955
line 4343
;4343:			{
line 4344
;4344:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1944
JUMPV
LABELV $1955
LABELV $1952
line 4346
;4345:			}
;4346:		}
LABELV $1948
line 4333
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1947
line 4347
;4347:	}
LABELV $1945
line 4348
;4348:	return qfalse;
CNSTI4 0
RETI4
LABELV $1944
endproc WP_HasForcePowers 4 0
export WP_ForcePowersUpdate
proc WP_ForcePowersUpdate 136 32
line 4352
;4349:}
;4350:
;4351:void WP_ForcePowersUpdate( gentity_t *self, usercmd_t *ucmd )
;4352:{
line 4353
;4353:	qboolean	usingForce = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4356
;4354:	vec3_t		dmgdir;
;4355:	int			i, holo, holoregen;
;4356:	int			prepower = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4358
;4357:	//see if any force powers are running
;4358:	if ( !self )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1958
line 4359
;4359:	{
line 4360
;4360:		return;
ADDRGP4 $1957
JUMPV
LABELV $1958
line 4363
;4361:	}
;4362:
;4363:	if ( !self->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1960
line 4364
;4364:	{
line 4365
;4365:		return;
ADDRGP4 $1957
JUMPV
LABELV $1960
line 4368
;4366:	}
;4367:
;4368:	if (self->client->ps.pm_flags & PMF_FOLLOW)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1962
line 4369
;4369:	{ //not a "real" game client, it's a spectator following someone
line 4370
;4370:		return;
ADDRGP4 $1957
JUMPV
LABELV $1962
line 4372
;4371:	}
;4372:	if (self->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1964
line 4373
;4373:	{
line 4374
;4374:		return;
ADDRGP4 $1957
JUMPV
LABELV $1964
line 4377
;4375:	}
;4376:
;4377:	if (self->client->ps.fd.saberAnimLevel > self->client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
LEI4 $1966
line 4378
;4378:	{
line 4379
;4379:		self->client->ps.fd.saberAnimLevel = self->client->ps.fd.forcePowerLevel[FP_SABERATTACK];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
ASGNI4
line 4380
;4380:	}
ADDRGP4 $1967
JUMPV
LABELV $1966
line 4381
;4381:	else if (!self->client->ps.fd.saberAnimLevel)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1968
line 4382
;4382:	{
line 4383
;4383:		self->client->ps.fd.saberAnimLevel = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 1
ASGNI4
line 4384
;4384:	}
LABELV $1968
LABELV $1967
line 4386
;4385:
;4386:	if (!(self->client->ps.fd.forcePowersKnown & (1 << FP_LEVITATION)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $1970
line 4387
;4387:	{
line 4388
;4388:		self->client->ps.fd.forcePowersKnown |= (1 << FP_LEVITATION);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 4389
;4389:	}
LABELV $1970
line 4391
;4390:
;4391:	if (self->client->ps.fd.forcePowerLevel[FP_LEVITATION] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1972
line 4392
;4392:	{
line 4393
;4393:		self->client->ps.fd.forcePowerLevel[FP_LEVITATION] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 948
ADDP4
CNSTI4 1
ASGNI4
line 4394
;4394:	}
LABELV $1972
line 4396
;4395:
;4396:	if (self->client->ps.fd.forcePowerSelected < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1974
line 4397
;4397:	{ //bad
line 4398
;4398:		self->client->ps.fd.forcePowerSelected = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 4399
;4399:	}
LABELV $1974
line 4401
;4400:
;4401:	if ( ((self->client->sess.selectedFP != self->client->ps.fd.forcePowerSelected) ||
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
NEI4 $1978
ADDRLP4 36
INDIRP4
CNSTI4 1560
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
EQI4 $1976
LABELV $1978
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1976
line 4404
;4402:		(self->client->sess.saberLevel != self->client->ps.fd.saberAnimLevel)) &&
;4403:		!(self->r.svFlags & SVF_BOT) )
;4404:	{
line 4405
;4405:		if (self->client->sess.updateUITime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1568
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1979
line 4406
;4406:		{ //a bit hackish, but we don't want the client to flood with userinfo updates if they rapidly cycle
line 4409
;4407:		  //through their force powers or saber attack levels
;4408:
;4409:			self->client->sess.selectedFP = self->client->ps.fd.forcePowerSelected;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1556
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
line 4410
;4410:			self->client->sess.saberLevel = self->client->ps.fd.saberAnimLevel;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1560
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 4411
;4411:		}
LABELV $1979
line 4412
;4412:	}
LABELV $1976
line 4414
;4413:
;4414:	if (!g_LastFrameTime)
ADDRGP4 g_LastFrameTime
INDIRI4
CNSTI4 0
NEI4 $1982
line 4415
;4415:	{
line 4416
;4416:		g_LastFrameTime = level.time;
ADDRGP4 g_LastFrameTime
ADDRGP4 level+32
INDIRI4
ASGNI4
line 4417
;4417:	}
LABELV $1982
line 4419
;4418:
;4419:	if (self->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1985
line 4420
;4420:	{
line 4421
;4421:		self->client->ps.zoomFov = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 0
ASGNF4
line 4422
;4422:		self->client->ps.zoomMode = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 4423
;4423:		self->client->ps.zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 4424
;4424:		self->client->ps.zoomTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1336
ADDP4
CNSTI4 0
ASGNI4
line 4425
;4425:	}
LABELV $1985
line 4427
;4426:
;4427:	if (self->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN &&
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1987
ADDRLP4 40
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $1987
line 4429
;4428:		self->client->ps.forceHandExtendTime >= level.time)
;4429:	{
line 4430
;4430:		self->client->ps.saberMove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 4431
;4431:		self->client->ps.saberBlocking = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 0
ASGNI4
line 4432
;4432:		self->client->ps.saberBlocked = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 4433
;4433:		self->client->ps.weaponTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 4434
;4434:	}
ADDRGP4 $1988
JUMPV
LABELV $1987
line 4435
;4435:	else if (self->client->ps.forceHandExtend != HANDEXTEND_NONE &&
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1990
ADDRLP4 44
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1990
line 4437
;4436:		self->client->ps.forceHandExtendTime < level.time)
;4437:	{
line 4438
;4438:		if (self->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN &&
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1993
ADDRLP4 48
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1993
line 4440
;4439:			!self->client->ps.forceDodgeAnim)
;4440:		{
line 4441
;4441:			if (self->health < 1 || (self->client->ps.eFlags & EF_DEAD))
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $1997
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1995
LABELV $1997
line 4442
;4442:			{
line 4443
;4443:				self->client->ps.forceHandExtend = HANDEXTEND_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 4444
;4444:			}
ADDRGP4 $1994
JUMPV
LABELV $1995
line 4446
;4445:			else
;4446:			{
line 4447
;4447:				if (self->client->pers.cmd.upmove &&
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1998
ADDRLP4 60
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1998
line 4449
;4448:					self->client->ps.fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1)
;4449:				{ //force getup
line 4450
;4450:					G_PreDefSound(self->client->ps.origin, PDSOUND_FORCEJUMP);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 4451
;4451:					self->client->ps.forceDodgeAnim = 2;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 2
ASGNI4
line 4452
;4452:					self->client->ps.forceHandExtendTime = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4454
;4453:
;4454:					self->client->ps.velocity[2] = 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1137180672
ASGNF4
line 4455
;4455:				}
ADDRGP4 $1994
JUMPV
LABELV $1998
line 4456
;4456:				else if (self->client->ps.quickerGetup)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2001
line 4457
;4457:				{
line 4458
;4458:					self->client->ps.quickerGetup = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 0
ASGNI4
line 4459
;4459:					G_EntitySound( self, CHAN_VOICE, G_SoundIndex("*jump1.wav") );
ADDRGP4 $2003
ARGP4
ADDRLP4 64
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 4460
;4460:					self->client->ps.forceDodgeAnim = 3;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 3
ASGNI4
line 4461
;4461:					self->client->ps.forceHandExtendTime = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4462
;4462:					self->client->ps.velocity[2] = 300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ASGNF4
line 4463
;4463:				}
ADDRGP4 $1994
JUMPV
LABELV $2001
line 4465
;4464:				else
;4465:				{
line 4466
;4466:					self->client->ps.forceDodgeAnim = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 1
ASGNI4
line 4467
;4467:					self->client->ps.forceHandExtendTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 4468
;4468:				}
line 4469
;4469:			}
line 4470
;4470:		}
ADDRGP4 $1994
JUMPV
LABELV $1993
line 4472
;4471:		else
;4472:		{
line 4473
;4473:			self->client->ps.forceHandExtend = HANDEXTEND_WEAPONREADY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 6
ASGNI4
line 4474
;4474:		}
LABELV $1994
line 4475
;4475:	}
LABELV $1990
LABELV $1988
line 4477
;4476:
;4477:	if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $2006
line 4478
;4478:	{
line 4479
;4479:		HolocronUpdate(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronUpdate
CALLV
pop
line 4480
;4480:	}
LABELV $2006
line 4481
;4481:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $2009
line 4482
;4482:	{
line 4483
;4483:		JediMasterUpdate(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 JediMasterUpdate
CALLV
pop
line 4484
;4484:	}
LABELV $2009
line 4486
;4485:
;4486:	SeekerDroneUpdate(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SeekerDroneUpdate
CALLV
pop
line 4488
;4487:
;4488:	if (self->client->ps.powerups[PW_FORCE_BOON])
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2012
line 4489
;4489:	{
line 4490
;4490:		prepower = self->client->ps.fd.forcePower;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ASGNI4
line 4491
;4491:	}
LABELV $2012
line 4493
;4492:
;4493:	if (self && self->client && (BG_HasYsalamiri(g_gametype.integer, &self->client->ps) ||
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
CNSTU4 0
ASGNU4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $2014
ADDRLP4 56
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $2014
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $2017
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1196
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $2014
LABELV $2017
line 4495
;4494:		self->client->ps.fd.forceDeactivateAll))
;4495:	{ //has ysalamiri.. or we want to forcefully stop all his active powers
line 4496
;4496:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2019
JUMPV
LABELV $2018
line 4499
;4497:
;4498:		while (i < NUM_FORCE_POWERS)
;4499:		{
line 4500
;4500:			if ((self->client->ps.fd.forcePowersActive & (1 << i)) && i != FP_LEVITATION)
ADDRLP4 68
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2021
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $2021
line 4501
;4501:			{
line 4502
;4502:				WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4503
;4503:			}
LABELV $2021
line 4505
;4504:
;4505:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4506
;4506:		}
LABELV $2019
line 4498
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2018
line 4508
;4507:
;4508:		self->client->ps.fd.forceDeactivateAll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1196
ADDP4
CNSTI4 0
ASGNI4
line 4510
;4509:
;4510:		if (self->client->ps.fd.forceJumpCharge)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2015
line 4511
;4511:		{
line 4512
;4512:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 4513
;4513:			self->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 4514
;4514:		}
line 4515
;4515:	}
ADDRGP4 $2015
JUMPV
LABELV $2014
line 4517
;4516:	else
;4517:	{ //otherwise just do a check through them all to see if they need to be stopped for any reason.
line 4518
;4518:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2026
JUMPV
LABELV $2025
line 4521
;4519:
;4520:		while (i < NUM_FORCE_POWERS)
;4521:		{
line 4522
;4522:			if ((self->client->ps.fd.forcePowersActive & (1 << i)) && i != FP_LEVITATION &&
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2028
ADDRLP4 0
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $2028
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $2028
line 4524
;4523:				!BG_CanUseFPNow(g_gametype.integer, &self->client->ps, level.time, i))
;4524:			{
line 4525
;4525:				WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4526
;4526:			}
LABELV $2028
line 4528
;4527:
;4528:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4529
;4529:		}
LABELV $2026
line 4520
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2025
line 4530
;4530:	}
LABELV $2015
line 4532
;4531:
;4532:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4534
;4533:
;4534:	if (self->client->ps.powerups[PW_FORCE_ENLIGHTENED_LIGHT] || self->client->ps.powerups[PW_FORCE_ENLIGHTENED_DARK])
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $2034
ADDRLP4 68
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $2032
LABELV $2034
line 4535
;4535:	{ //enlightenment
line 4536
;4536:		if (!self->client->ps.fd.forceUsingAdded)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2033
line 4537
;4537:		{
line 4538
;4538:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2038
JUMPV
LABELV $2037
line 4541
;4539:
;4540:			while (i < NUM_FORCE_POWERS)
;4541:			{
line 4542
;4542:				self->client->ps.fd.forcePowerBaseLevel[i] = self->client->ps.fd.forcePowerLevel[i];
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ASGNI4
line 4544
;4543:
;4544:				if (!forcePowerDarkLight[i] ||
ADDRLP4 84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $2042
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $2040
LABELV $2042
line 4546
;4545:					self->client->ps.fd.forceSide == forcePowerDarkLight[i])
;4546:				{
line 4547
;4547:					self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 4548
;4548:					self->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 4549
;4549:				}
LABELV $2040
line 4551
;4550:
;4551:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4552
;4552:			}
LABELV $2038
line 4540
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2037
line 4554
;4553:
;4554:			self->client->ps.fd.forceUsingAdded = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 1
ASGNI4
line 4555
;4555:		}
line 4556
;4556:	}
ADDRGP4 $2033
JUMPV
LABELV $2032
line 4557
;4557:	else if (self->client->ps.fd.forceUsingAdded)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2043
line 4558
;4558:	{ //we don't have enlightenment but we're still using enlightened powers, so clear them back to how they should be.
line 4559
;4559:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2046
JUMPV
LABELV $2045
line 4562
;4560:
;4561:		while (i < NUM_FORCE_POWERS)
;4562:		{
line 4563
;4563:			self->client->ps.fd.forcePowerLevel[i] = self->client->ps.fd.forcePowerBaseLevel[i];
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
INDIRI4
ASGNI4
line 4564
;4564:			if (!self->client->ps.fd.forcePowerLevel[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2048
line 4565
;4565:			{
line 4566
;4566:				if (self->client->ps.fd.forcePowersActive & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2050
line 4567
;4567:				{
line 4568
;4568:					WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4569
;4569:				}
LABELV $2050
line 4570
;4570:				self->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 4571
;4571:			}
LABELV $2048
line 4573
;4572:
;4573:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4574
;4574:		}
LABELV $2046
line 4561
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2045
line 4576
;4575:
;4576:		self->client->ps.fd.forceUsingAdded = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 0
ASGNI4
line 4577
;4577:	}
LABELV $2043
LABELV $2033
line 4579
;4578:
;4579:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4581
;4580:
;4581:	if (!(self->client->ps.fd.forcePowersActive & (1 << FP_TELEPATHY)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $2052
line 4582
;4582:	{ //clear the mindtrick index values
line 4583
;4583:		self->client->ps.fd.forceMindtrickTargetIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1156
ADDP4
CNSTI4 0
ASGNI4
line 4584
;4584:		self->client->ps.fd.forceMindtrickTargetIndex2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1160
ADDP4
CNSTI4 0
ASGNI4
line 4585
;4585:		self->client->ps.fd.forceMindtrickTargetIndex3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1164
ADDP4
CNSTI4 0
ASGNI4
line 4586
;4586:		self->client->ps.fd.forceMindtrickTargetIndex4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1168
ADDP4
CNSTI4 0
ASGNI4
line 4587
;4587:	}
LABELV $2052
line 4589
;4588:	
;4589:	if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2054
line 4590
;4590:	{
line 4591
;4591:		self->client->ps.fd.forceGripBeingGripped = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
CNSTF4 0
ASGNF4
line 4592
;4592:	}
LABELV $2054
line 4594
;4593:
;4594:	if (self->client->ps.fd.forceGripBeingGripped > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2056
line 4595
;4595:	{
line 4596
;4596:		self->client->ps.fd.forceGripCripple = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 1
ASGNI4
line 4597
;4597:	}
ADDRGP4 $2057
JUMPV
LABELV $2056
line 4599
;4598:	else
;4599:	{
line 4600
;4600:		self->client->ps.fd.forceGripCripple = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 0
ASGNI4
line 4601
;4601:	}
LABELV $2057
line 4603
;4602:
;4603:	if (self->client->ps.fd.forceJumpSound)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1100
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2059
line 4604
;4604:	{
line 4605
;4605:		G_PreDefSound(self->client->ps.origin, PDSOUND_FORCEJUMP);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 4606
;4606:		self->client->ps.fd.forceJumpSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 0
ASGNI4
line 4607
;4607:	}
LABELV $2059
line 4609
;4608:
;4609:	if (self->client->ps.fd.forceGripCripple)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2061
line 4610
;4610:	{
line 4611
;4611:		if (self->client->ps.fd.forceGripSoundTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1128
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2063
line 4612
;4612:		{
line 4613
;4613:			G_PreDefSound(self->client->ps.origin, PDSOUND_FORCEGRIP);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 4614
;4614:			self->client->ps.fd.forceGripSoundTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1128
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 4615
;4615:		}
LABELV $2063
line 4616
;4616:	}
LABELV $2061
line 4618
;4617:
;4618:	if (self->client->ps.fd.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2067
line 4619
;4619:	{
line 4620
;4620:		self->client->ps.powerups[PW_SPEED] = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 384
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 4621
;4621:	}
LABELV $2067
line 4623
;4622:
;4623:	if (self->client->ps.fd.forceSpeedDoDamage && FORCE_VELOCITY_DAMAGE) //You used to be able to run into walls and crack your face on them (like JK1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2070
ADDRGP4 $2070
JUMPV
line 4624
;4624:	{ //we set the flag somewhere to do damage for some reason, so do it
line 4625
;4625:		G_Damage (self, NULL, NULL, NULL, NULL, self->client->ps.fd.forceSpeedDoDamage, DAMAGE_NO_ARMOR, MOD_FALLING);
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
CNSTP4 0
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 4627
;4626:
;4627:		if (self->client->ps.fd.forceSpeedHitIndex != ENTITYNUM_NONE &&
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 1023
EQI4 $2072
CNSTI4 828
ADDRLP4 88
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2072
line 4629
;4628:			g_entities[self->client->ps.fd.forceSpeedHitIndex].client)
;4629:		{
line 4630
;4630:			VectorSubtract(g_entities[self->client->ps.fd.forceSpeedHitIndex].client->ps.origin, self->client->ps.origin, dmgdir);
ADDRLP4 92
CNSTI4 828
ASGNI4
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 1144
ASGNI4
ADDRLP4 108
CNSTI4 20
ASGNI4
ADDRLP4 16
ADDRLP4 92
INDIRI4
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112
ADDRLP4 96
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 116
CNSTI4 24
ASGNI4
ADDRLP4 16+4
ADDRLP4 92
INDIRI4
ADDRLP4 112
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRLP4 112
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 124
CNSTI4 28
ASGNI4
ADDRLP4 16+8
CNSTI4 828
ADDRLP4 120
INDIRP4
CNSTI4 1144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
ADDRLP4 120
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4632
;4631:
;4632:			G_Damage (&g_entities[self->client->ps.fd.forceSpeedHitIndex], self, self, dmgdir, NULL, self->client->ps.fd.forceSpeedDoDamage, DAMAGE_NO_ARMOR, MOD_CRUSH);
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
ADDRLP4 128
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
CNSTI4 828
ADDRLP4 132
INDIRP4
CNSTI4 1144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 132
INDIRP4
CNSTI4 1140
ADDP4
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 4633
;4633:			self->client->ps.fd.forceSpeedHitIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1144
ADDP4
CNSTI4 1023
ASGNI4
line 4634
;4634:		}
LABELV $2072
line 4636
;4635:
;4636:		self->client->ps.fd.forceSpeedDoDamage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
CNSTF4 0
ASGNF4
line 4637
;4637:	}
LABELV $2070
line 4639
;4638:
;4639:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2080
line 4640
;4640:	{//if dead, deactivate any active force powers
line 4641
;4641:		for ( i = 0; i < NUM_FORCE_POWERS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2082
line 4642
;4642:		{
line 4643
;4643:			if ( self->client->ps.fd.forcePowerDuration[i] || (self->client->ps.fd.forcePowersActive&( 1 << i )) )
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 80
INDIRP4
CNSTI4 860
ADDP4
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $2088
ADDRLP4 80
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $2086
LABELV $2088
line 4644
;4644:			{
line 4645
;4645:				WP_ForcePowerStop( self, (forcePowers_t)i );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4646
;4646:				self->client->ps.fd.forcePowerDuration[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4647
;4647:			}
LABELV $2086
line 4648
;4648:		}
LABELV $2083
line 4641
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2082
line 4649
;4649:		goto powersetcheck;
ADDRGP4 $2089
JUMPV
LABELV $2080
line 4652
;4650:	}
;4651:
;4652:	if (self->client->ps.groundEntityNum != ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $2090
line 4653
;4653:	{
line 4654
;4654:		self->client->fjDidJump = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1796
ADDP4
CNSTI4 0
ASGNI4
line 4655
;4655:	}
LABELV $2090
line 4657
;4656:
;4657:	if (self->client->ps.fd.forceJumpCharge && self->client->ps.groundEntityNum == ENTITYNUM_NONE && self->client->fjDidJump)
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2092
ADDRLP4 76
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2092
ADDRLP4 76
INDIRP4
CNSTI4 1796
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2092
line 4658
;4658:	{ //this was for the "charge" jump method... I guess
line 4659
;4659:		if (ucmd->upmove < 10 && (!(ucmd->buttons & BUTTON_FORCEPOWER) || self->client->ps.fd.forcePowerSelected != FP_LEVITATION))
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $2094
ADDRLP4 80
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2096
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2094
LABELV $2096
line 4660
;4660:		{
line 4661
;4661:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 4662
;4662:			self->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 4663
;4663:		}
LABELV $2094
line 4664
;4664:	}
LABELV $2092
line 4678
;4665:
;4666:#ifndef METROID_JUMP
;4667:	else if ( (ucmd->upmove > 10) && (self->client->ps.pm_flags & PMF_JUMP_HELD) && self->client->ps.groundTime && (level.time - self->client->ps.groundTime) > 150 && !BG_HasYsalamiri(g_gametype.integer, &self->client->ps) && BG_CanUseFPNow(g_gametype.integer, &self->client->ps, level.time, FP_LEVITATION) )
;4668:	{//just charging up
;4669:		ForceJumpCharge( self, ucmd );
;4670:		usingForce = qtrue;
;4671:	}
;4672:	else if (ucmd->upmove < 10 && self->client->ps.groundEntityNum == ENTITYNUM_NONE && self->client->ps.fd.forceJumpCharge)
;4673:	{
;4674:		self->client->ps.pm_flags &= ~(PMF_JUMP_HELD);
;4675:	}
;4676:#endif
;4677:
;4678:	if (!(self->client->ps.pm_flags & PMF_JUMP_HELD) && self->client->ps.fd.forceJumpCharge)
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $2097
ADDRLP4 80
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2097
line 4679
;4679:	{
line 4680
;4680:		if (!(ucmd->buttons & BUTTON_FORCEPOWER) ||
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2101
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2099
LABELV $2101
line 4682
;4681:			self->client->ps.fd.forcePowerSelected != FP_LEVITATION)
;4682:		{
line 4683
;4683:			if (WP_DoSpecificPower( self, ucmd, FP_LEVITATION ))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 84
ADDRGP4 WP_DoSpecificPower
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $2102
line 4684
;4684:			{
line 4685
;4685:				usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4686
;4686:			}
LABELV $2102
line 4687
;4687:		}
LABELV $2099
line 4688
;4688:	}
LABELV $2097
line 4690
;4689:
;4690:	if ( ucmd->buttons & BUTTON_FORCEGRIP )
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2104
line 4691
;4691:	{ //grip is one of the powers with its own button.. if it's held, call the specific grip power function.
line 4692
;4692:		if (WP_DoSpecificPower( self, ucmd, FP_GRIP ))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 84
ADDRGP4 WP_DoSpecificPower
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $2106
line 4693
;4693:		{
line 4694
;4694:			usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4695
;4695:		}
ADDRGP4 $2105
JUMPV
LABELV $2106
line 4697
;4696:		else
;4697:		{ //don't let recharge even if the grip misses if the player still has the button down
line 4698
;4698:			usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4699
;4699:		}
line 4700
;4700:	}
ADDRGP4 $2105
JUMPV
LABELV $2104
line 4702
;4701:	else
;4702:	{ //see if we're using it generically.. if not, stop.
line 4703
;4703:		if (self->client->ps.fd.forcePowersActive & (1 << FP_GRIP))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2108
line 4704
;4704:		{
line 4705
;4705:			if (!(ucmd->buttons & BUTTON_FORCEPOWER) || self->client->ps.fd.forcePowerSelected != FP_GRIP)
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 6
EQI4 $2110
LABELV $2112
line 4706
;4706:			{
line 4707
;4707:				WP_ForcePowerStop(self, FP_GRIP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4708
;4708:			}
LABELV $2110
line 4709
;4709:		}
LABELV $2108
line 4710
;4710:	}
LABELV $2105
line 4712
;4711:
;4712:	if ( ucmd->buttons & BUTTON_FORCE_LIGHTNING )
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2113
line 4713
;4713:	{ //lightning
line 4714
;4714:		WP_DoSpecificPower(self, ucmd, FP_LIGHTNING);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 WP_DoSpecificPower
CALLI4
pop
line 4715
;4715:		usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4716
;4716:	}
ADDRGP4 $2114
JUMPV
LABELV $2113
line 4718
;4717:	else
;4718:	{ //see if we're using it generically.. if not, stop.
line 4719
;4719:		if (self->client->ps.fd.forcePowersActive & (1 << FP_LIGHTNING))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2115
line 4720
;4720:		{
line 4721
;4721:			if (!(ucmd->buttons & BUTTON_FORCEPOWER) || self->client->ps.fd.forcePowerSelected != FP_LIGHTNING)
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2119
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 7
EQI4 $2117
LABELV $2119
line 4722
;4722:			{
line 4723
;4723:				WP_ForcePowerStop(self, FP_LIGHTNING);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4724
;4724:			}
LABELV $2117
line 4725
;4725:		}
LABELV $2115
line 4726
;4726:	}
LABELV $2114
line 4728
;4727:
;4728:	if ( ucmd->buttons & BUTTON_FORCE_DRAIN )
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $2120
line 4729
;4729:	{ //drain
line 4730
;4730:		WP_DoSpecificPower(self, ucmd, FP_DRAIN);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 WP_DoSpecificPower
CALLI4
pop
line 4731
;4731:		usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4732
;4732:	}
ADDRGP4 $2121
JUMPV
LABELV $2120
line 4734
;4733:	else
;4734:	{ //see if we're using it generically.. if not, stop.
line 4735
;4735:		if (self->client->ps.fd.forcePowersActive & (1 << FP_DRAIN))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $2122
line 4736
;4736:		{
line 4737
;4737:			if (!(ucmd->buttons & BUTTON_FORCEPOWER) || self->client->ps.fd.forcePowerSelected != FP_DRAIN)
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2126
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 13
EQI4 $2124
LABELV $2126
line 4738
;4738:			{
line 4739
;4739:				WP_ForcePowerStop(self, FP_DRAIN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4740
;4740:			}
LABELV $2124
line 4741
;4741:		}
LABELV $2122
line 4742
;4742:	}
LABELV $2121
line 4744
;4743:
;4744:	if ( (ucmd->buttons & BUTTON_FORCEPOWER) &&
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2127
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 84
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $2127
line 4746
;4745:		BG_CanUseFPNow(g_gametype.integer, &self->client->ps, level.time, self->client->ps.fd.forcePowerSelected))
;4746:	{
line 4747
;4747:		if (self->client->ps.fd.forcePowerSelected == FP_LEVITATION)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2131
line 4748
;4748:		{
line 4749
;4749:			ForceJumpCharge( self, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ForceJumpCharge
CALLV
pop
line 4750
;4750:			usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4751
;4751:		}
ADDRGP4 $2128
JUMPV
LABELV $2131
line 4752
;4752:		else if (WP_DoSpecificPower( self, ucmd, self->client->ps.fd.forcePowerSelected ))
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 WP_DoSpecificPower
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $2133
line 4753
;4753:		{
line 4754
;4754:			usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4755
;4755:		}
ADDRGP4 $2128
JUMPV
LABELV $2133
line 4756
;4756:		else if (self->client->ps.fd.forcePowerSelected == FP_GRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2128
line 4757
;4757:		{
line 4758
;4758:			usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4759
;4759:		}
line 4760
;4760:	}
ADDRGP4 $2128
JUMPV
LABELV $2127
line 4762
;4761:	else
;4762:	{
line 4763
;4763:		self->client->ps.fd.forceButtonNeedRelease = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 0
ASGNI4
line 4764
;4764:	}
LABELV $2128
line 4766
;4765:
;4766:	for ( i = 0; i < NUM_FORCE_POWERS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2137
line 4767
;4767:	{
line 4768
;4768:		if ( self->client->ps.fd.forcePowerDuration[i] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2141
line 4769
;4769:		{
line 4770
;4770:			if ( self->client->ps.fd.forcePowerDuration[i] < level.time )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2143
line 4771
;4771:			{
line 4772
;4772:				if ( (self->client->ps.fd.forcePowersActive&( 1 << i )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2146
line 4773
;4773:				{//turn it off
line 4774
;4774:					WP_ForcePowerStop( self, (forcePowers_t)i );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4775
;4775:				}
LABELV $2146
line 4776
;4776:				self->client->ps.fd.forcePowerDuration[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4777
;4777:			}
LABELV $2143
line 4778
;4778:		}
LABELV $2141
line 4779
;4779:		if ( (self->client->ps.fd.forcePowersActive&( 1 << i )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2148
line 4780
;4780:		{
line 4781
;4781:			usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4782
;4782:			WP_ForcePowerRun( self, (forcePowers_t)i, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 WP_ForcePowerRun
CALLV
pop
line 4783
;4783:		}
LABELV $2148
line 4784
;4784:	}
LABELV $2138
line 4766
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2137
line 4785
;4785:	if ( self->client->ps.saberInFlight )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2150
line 4786
;4786:	{//don't regen force power while throwing saber
line 4787
;4787:		if ( self->client->ps.saberEntityNum < ENTITYNUM_NONE && self->client->ps.saberEntityNum > 0 )//player is 0
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1023
GEI4 $2152
ADDRLP4 92
INDIRI4
CNSTI4 0
LEI4 $2152
line 4788
;4788:		{//
line 4789
;4789:			if ( &g_entities[self->client->ps.saberEntityNum] != NULL && g_entities[self->client->ps.saberEntityNum].s.pos.trType == TR_LINEAR )
ADDRLP4 96
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
ASGNI4
ADDRLP4 96
INDIRI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
CNSTU4 0
EQU4 $2154
ADDRLP4 96
INDIRI4
ADDRGP4 g_entities+12
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2154
line 4790
;4790:			{//fell to the ground and we're trying to pull it back
line 4791
;4791:				usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4792
;4792:			}
LABELV $2154
line 4793
;4793:		}
LABELV $2152
line 4794
;4794:	}
LABELV $2150
line 4795
;4795:	if ( !self->client->ps.fd.forcePowersActive || self->client->ps.fd.forcePowersActive == (1 << FP_DRAIN) )
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $2159
ADDRLP4 92
INDIRI4
CNSTI4 8192
NEI4 $2157
LABELV $2159
line 4796
;4796:	{//when not using the force, regenerate at 1 point per half second
line 4797
;4797:		if ( !self->client->ps.saberInFlight && self->client->ps.fd.forcePowerRegenDebounceTime < level.time )
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2160
ADDRLP4 96
INDIRP4
CNSTI4 940
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2160
line 4798
;4798:		{
line 4799
;4799:			if (g_gametype.integer != GT_HOLOCRON || g_MaxHolocronCarry.value)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $2167
ADDRGP4 g_MaxHolocronCarry+8
INDIRF4
CNSTF4 0
EQF4 $2163
LABELV $2167
line 4800
;4800:			{
line 4803
;4801:				//if (!g_trueJedi.integer || self->client->ps.weapon == WP_SABER)
;4802:				//let non-jedi force regen since we're doing a more strict jedi/non-jedi thing... this gives dark jedi something to drain
;4803:				{
line 4804
;4804:					if (self->client->ps.powerups[PW_FORCE_BOON])
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2168
line 4805
;4805:					{
line 4806
;4806:						WP_ForcePowerRegenerate( self, 6 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerRegenerate
CALLV
pop
line 4807
;4807:					}
ADDRGP4 $2164
JUMPV
LABELV $2168
line 4808
;4808:					else if (self->client->ps.isJediMaster && g_gametype.integer == GT_JEDIMASTER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2170
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $2170
line 4809
;4809:					{
line 4810
;4810:						WP_ForcePowerRegenerate( self, 4 ); //jedi master regenerates 4 times as fast
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 WP_ForcePowerRegenerate
CALLV
pop
line 4811
;4811:					}
ADDRGP4 $2164
JUMPV
LABELV $2170
line 4813
;4812:					else
;4813:					{
line 4814
;4814:						WP_ForcePowerRegenerate( self, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerRegenerate
CALLV
pop
line 4815
;4815:					}
line 4816
;4816:				}
line 4823
;4817:				/*
;4818:				else if (g_trueJedi.integer && self->client->ps.weapon != WP_SABER)
;4819:				{
;4820:					self->client->ps.fd.forcePower = 0;
;4821:				}
;4822:				*/
;4823:			}
ADDRGP4 $2164
JUMPV
LABELV $2163
line 4825
;4824:			else
;4825:			{ //regenerate based on the number of holocrons carried
line 4826
;4826:				holoregen = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 4827
;4827:				holo = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $2174
JUMPV
LABELV $2173
line 4829
;4828:				while (holo < NUM_FORCE_POWERS)
;4829:				{
line 4830
;4830:					if (self->client->ps.holocronsCarried[holo])
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2176
line 4831
;4831:					{
line 4832
;4832:						holoregen++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4833
;4833:					}
LABELV $2176
line 4834
;4834:					holo++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4835
;4835:				}
LABELV $2174
line 4828
ADDRLP4 12
INDIRI4
CNSTI4 18
LTI4 $2173
line 4837
;4836:
;4837:				WP_ForcePowerRegenerate(self, holoregen);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerRegenerate
CALLV
pop
line 4838
;4838:			}
LABELV $2164
line 4840
;4839:
;4840:			self->client->ps.fd.forcePowerRegenDebounceTime = level.time + g_forceRegenTime.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 940
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_forceRegenTime+12
INDIRI4
ADDI4
ASGNI4
line 4841
;4841:		}
LABELV $2160
line 4842
;4842:	}
LABELV $2157
LABELV $2089
line 4846
;4843:
;4844:powersetcheck:
;4845:
;4846:	if (prepower && self->client->ps.fd.forcePower < prepower)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2180
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $2180
line 4847
;4847:	{
line 4848
;4848:		int dif = ((prepower - self->client->ps.fd.forcePower)/2);
ADDRLP4 100
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 4849
;4849:		if (dif < 1)
ADDRLP4 100
INDIRI4
CNSTI4 1
GEI4 $2182
line 4850
;4850:		{
line 4851
;4851:			dif = 1;
ADDRLP4 100
CNSTI4 1
ASGNI4
line 4852
;4852:		}
LABELV $2182
line 4854
;4853:
;4854:		self->client->ps.fd.forcePower = (prepower-dif);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 100
INDIRI4
SUBI4
ASGNI4
line 4855
;4855:	}
LABELV $2180
line 4856
;4856:}
LABELV $1957
endproc WP_ForcePowersUpdate 136 32
export Jedi_DodgeEvasion
proc Jedi_DodgeEvasion 28 12
line 4859
;4857:
;4858:qboolean Jedi_DodgeEvasion( gentity_t *self, gentity_t *shooter, trace_t *tr, int hitLoc )
;4859:{
line 4860
;4860:	int	dodgeAnim = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 4862
;4861:
;4862:	if ( !self || !self->client || self->health <= 0 )
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
EQU4 $2188
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2188
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2185
LABELV $2188
line 4863
;4863:	{
line 4864
;4864:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2185
line 4867
;4865:	}
;4866:
;4867:	if (!g_forceDodge.integer)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 0
NEI4 $2189
line 4868
;4868:	{
line 4869
;4869:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2189
line 4872
;4870:	}
;4871:
;4872:	if (g_forceDodge.integer != 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
EQI4 $2192
line 4873
;4873:	{
line 4874
;4874:		if (!(self->client->ps.fd.forcePowersActive & (1 << FP_SEE)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $2195
line 4875
;4875:		{
line 4876
;4876:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2195
line 4878
;4877:		}
;4878:	}
LABELV $2192
line 4880
;4879:
;4880:	if (self->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2197
line 4881
;4881:	{
line 4882
;4882:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2197
line 4885
;4883:	}
;4884:
;4885:	if ( self->client->ps.groundEntityNum == ENTITYNUM_NONE )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2199
line 4886
;4886:	{//can't dodge in mid-air
line 4887
;4887:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2199
line 4890
;4888:	}
;4889:
;4890:	if ( self->client->ps.weaponTime > 0 || self->client->ps.forceHandExtend != HANDEXTEND_NONE )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $2203
ADDRLP4 12
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2201
LABELV $2203
line 4891
;4891:	{//in some effect that stops me from moving on my own
line 4892
;4892:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2201
line 4895
;4893:	}
;4894:
;4895:	if (g_forceDodge.integer == 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
NEI4 $2204
line 4896
;4896:	{
line 4897
;4897:		if (self->client->ps.fd.forcePowersActive)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2207
line 4898
;4898:		{ //for now just don't let us dodge if we're using a force power at all
line 4899
;4899:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2207
line 4901
;4900:		}
;4901:	}
LABELV $2204
line 4903
;4902:
;4903:	if (g_forceDodge.integer == 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
NEI4 $2209
line 4904
;4904:	{
line 4905
;4905:		if ( !WP_ForcePowerUsable( self, FP_SPEED ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2212
line 4906
;4906:		{//make sure we have it and have enough force power
line 4907
;4907:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2212
line 4909
;4908:		}
;4909:	}
LABELV $2209
line 4911
;4910:
;4911:	if (g_forceDodge.integer == 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
NEI4 $2214
line 4912
;4912:	{
line 4913
;4913:		if ( Q_irand( 1, 7 ) > self->client->ps.fd.forcePowerLevel[FP_SPEED] )
CNSTI4 1
ARGI4
CNSTI4 7
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
LEI4 $2215
line 4914
;4914:		{//more likely to fail on lower force speed level
line 4915
;4915:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
line 4917
;4916:		}
;4917:	}
LABELV $2214
line 4919
;4918:	else
;4919:	{
line 4921
;4920:		//We now dodge all the time, but only on level 3
;4921:		if (self->client->ps.fd.forcePowerLevel[FP_SEE] < FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 3
GEI4 $2219
line 4922
;4922:		{//more likely to fail on lower force sight level
line 4923
;4923:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2219
line 4925
;4924:		}
;4925:	}
LABELV $2215
line 4927
;4926:
;4927:	switch( hitLoc )
ADDRLP4 20
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $2221
ADDRLP4 20
INDIRI4
CNSTI4 16
GTI4 $2221
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2233
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2233
address $2223
address $2224
address $2224
address $2224
address $2224
address $2229
address $2225
address $2227
address $2229
address $2226
address $2228
address $2229
address $2230
address $2231
address $2230
address $2231
address $2232
code
line 4928
;4928:	{
LABELV $2223
line 4930
;4929:	case HL_NONE:
;4930:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
line 4931
;4931:		break;
LABELV $2224
line 4937
;4932:
;4933:	case HL_FOOT_RT:
;4934:	case HL_FOOT_LT:
;4935:	case HL_LEG_RT:
;4936:	case HL_LEG_LT:
;4937:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2225
line 4940
;4938:
;4939:	case HL_BACK_RT:
;4940:		dodgeAnim = BOTH_DODGE_FL;
ADDRLP4 0
CNSTI4 897
ASGNI4
line 4941
;4941:		break;
ADDRGP4 $2222
JUMPV
LABELV $2226
line 4943
;4942:	case HL_CHEST_RT:
;4943:		dodgeAnim = BOTH_DODGE_FR;
ADDRLP4 0
CNSTI4 898
ASGNI4
line 4944
;4944:		break;
ADDRGP4 $2222
JUMPV
LABELV $2227
line 4946
;4945:	case HL_BACK_LT:
;4946:		dodgeAnim = BOTH_DODGE_FR;
ADDRLP4 0
CNSTI4 898
ASGNI4
line 4947
;4947:		break;
ADDRGP4 $2222
JUMPV
LABELV $2228
line 4949
;4948:	case HL_CHEST_LT:
;4949:		dodgeAnim = BOTH_DODGE_FR;
ADDRLP4 0
CNSTI4 898
ASGNI4
line 4950
;4950:		break;
ADDRGP4 $2222
JUMPV
LABELV $2229
line 4954
;4951:	case HL_BACK:
;4952:	case HL_CHEST:
;4953:	case HL_WAIST:
;4954:		dodgeAnim = BOTH_DODGE_FL;
ADDRLP4 0
CNSTI4 897
ASGNI4
line 4955
;4955:		break;
ADDRGP4 $2222
JUMPV
LABELV $2230
line 4958
;4956:	case HL_ARM_RT:
;4957:	case HL_HAND_RT:
;4958:		dodgeAnim = BOTH_DODGE_L;
ADDRLP4 0
CNSTI4 901
ASGNI4
line 4959
;4959:		break;
ADDRGP4 $2222
JUMPV
LABELV $2231
line 4962
;4960:	case HL_ARM_LT:
;4961:	case HL_HAND_LT:
;4962:		dodgeAnim = BOTH_DODGE_R;
ADDRLP4 0
CNSTI4 902
ASGNI4
line 4963
;4963:		break;
ADDRGP4 $2222
JUMPV
LABELV $2232
line 4965
;4964:	case HL_HEAD:
;4965:		dodgeAnim = BOTH_DODGE_FL;
ADDRLP4 0
CNSTI4 897
ASGNI4
line 4966
;4966:		break;
ADDRGP4 $2222
JUMPV
LABELV $2221
line 4968
;4967:	default:
;4968:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2222
line 4971
;4969:	}
;4970:
;4971:	if ( dodgeAnim != -1 )
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $2234
line 4972
;4972:	{
line 4974
;4973:		//Our own happy way of forcing an anim:
;4974:		self->client->ps.forceHandExtend = HANDEXTEND_DODGE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 7
ASGNI4
line 4975
;4975:		self->client->ps.forceDodgeAnim = dodgeAnim;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 4976
;4976:		self->client->ps.forceHandExtendTime = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 4978
;4977:
;4978:		self->client->ps.powerups[PW_SPEEDBURST] = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 4980
;4979:
;4980:		if (g_forceDodge.integer == 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
NEI4 $2238
line 4981
;4981:		{
line 4982
;4982:			ForceSpeed( self, 500 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 500
ARGI4
ADDRGP4 ForceSpeed
CALLV
pop
line 4983
;4983:		}
ADDRGP4 $2239
JUMPV
LABELV $2238
line 4985
;4984:		else
;4985:		{
line 4986
;4986:			G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/force/speed.wav") );
ADDRGP4 $536
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 4987
;4987:		}
LABELV $2239
line 4988
;4988:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2234
line 4990
;4989:	}
;4990:	return qfalse;
CNSTI4 0
RETI4
LABELV $2184
endproc Jedi_DodgeEvasion 28 12
import ucmd
import g_TimeSinceLastFrame
import g_LastFrameTime
import Touch_Button
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
import forcePowerNeeded
import g_MaxHolocronCarry
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
import WP_SaberInitBladeData
import WP_SaberCanBlock
import WP_SaberPositionUpdate
import HasSetSaberOnly
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
LABELV $2003
char 1 42
char 1 106
char 1 117
char 1 109
char 1 112
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1893
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
char 1 98
char 1 114
char 1 121
char 1 97
char 1 114
char 1 47
char 1 102
char 1 105
char 1 114
char 1 101
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1827
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
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 47
char 1 119
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1536
char 1 42
char 1 99
char 1 104
char 1 111
char 1 107
char 1 101
char 1 37
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1456
char 1 42
char 1 103
char 1 97
char 1 115
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1441
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 100
char 1 105
char 1 115
char 1 116
char 1 114
char 1 97
char 1 99
char 1 116
char 1 115
char 1 116
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1234
char 1 108
char 1 105
char 1 109
char 1 98
char 1 0
align 1
LABELV $1230
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 100
char 1 111
char 1 111
char 1 114
char 1 0
align 1
LABELV $1227
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
align 1
LABELV $1217
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 0
align 1
LABELV $1113
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 112
char 1 117
char 1 108
char 1 108
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1109
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 112
char 1 117
char 1 115
char 1 104
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $997
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 100
char 1 105
char 1 115
char 1 116
char 1 114
char 1 97
char 1 99
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $888
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 106
char 1 117
char 1 109
char 1 112
char 1 98
char 1 117
char 1 105
char 1 108
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $735
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 100
char 1 114
char 1 97
char 1 105
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $637
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 110
char 1 105
char 1 110
char 1 103
char 1 104
char 1 105
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $606
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 110
char 1 105
char 1 110
char 1 103
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $591
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 114
char 1 97
char 1 103
char 1 101
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $546
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 115
char 1 101
char 1 101
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $536
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $400
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 104
char 1 101
char 1 97
char 1 108
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $195
char 1 110
char 1 102
char 1 114
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $128
char 1 37
char 1 115
char 1 0
char 1 0
align 1
LABELV $125
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $121
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 110
char 1 117
char 1 108
char 1 108
char 1 105
char 1 102
char 1 121
char 1 108
char 1 111
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $118
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 115
char 1 101
char 1 101
char 1 108
char 1 111
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $115
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 108
char 1 111
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $112
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 97
char 1 98
char 1 115
char 1 111
char 1 114
char 1 98
char 1 108
char 1 111
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $109
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 114
char 1 97
char 1 103
char 1 101
char 1 108
char 1 111
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $106
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
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 108
char 1 111
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
