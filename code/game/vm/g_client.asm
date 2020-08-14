data
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "../g_client.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:#include "..\ghoul2\g2.h"
;5:
;6:// g_client.c -- client functions that don't happen every frame
;7:
;8:static vec3_t	playerMins = {-15, -15, DEFAULT_MINS_2};
;9:static vec3_t	playerMaxs = {15, 15, DEFAULT_MAXS_2};
;10:
;11:forcedata_t Client_Force[MAX_CLIENTS];
;12:
;13:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;14:potential spawning position for deathmatch games.
;15:The first time a player enters the game, they will be at an 'initial' spot.
;16:Targets will be fired when someone spawns in on them.
;17:"nobots" will prevent bots from using this spot.
;18:"nohumans" will prevent non-bots from using this spot.
;19:*/
;20:void SP_info_player_deathmatch( gentity_t *ent ) {
line 23
;21:	int		i;
;22:
;23:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $79
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 24
;24:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $81
line 25
;25:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 26
;26:	}
LABELV $81
line 27
;27:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $83
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 28
;28:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $84
line 29
;29:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 30
;30:	}
LABELV $84
line 31
;31:}
LABELV $78
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 36
;32:
;33:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;34:equivelant to info_player_deathmatch
;35:*/
;36:void SP_info_player_start(gentity_t *ent) {
line 37
;37:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $87
ASGNP4
line 38
;38:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 39
;39:}
LABELV $86
endproc SP_info_player_start 0 4
export SP_info_player_imperial
proc SP_info_player_imperial 0 4
line 44
;40:
;41:/*QUAKED info_player_imperial (1 0 0) (-16 -16 -24) (16 16 32)
;42:saga start point - imperial
;43:*/
;44:void SP_info_player_imperial(gentity_t *ent) {
line 45
;45:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $89
line 46
;46:	{ //turn into a DM spawn if not in saga game mode
line 47
;47:		ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $87
ASGNP4
line 48
;48:		SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 49
;49:	}
LABELV $89
line 50
;50:}
LABELV $88
endproc SP_info_player_imperial 0 4
export SP_info_player_rebel
proc SP_info_player_rebel 0 4
line 55
;51:
;52:/*QUAKED info_player_rebel (1 0 0) (-16 -16 -24) (16 16 32)
;53:saga start point - rebel
;54:*/
;55:void SP_info_player_rebel(gentity_t *ent) {
line 56
;56:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $93
line 57
;57:	{ //turn into a DM spawn if not in saga game mode
line 58
;58:		ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $87
ASGNP4
line 59
;59:		SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 60
;60:	}
LABELV $93
line 61
;61:}
LABELV $92
endproc SP_info_player_rebel 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 66
;62:
;63:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;64:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;65:*/
;66:void SP_info_player_intermission( gentity_t *ent ) {
line 68
;67:
;68:}
LABELV $96
endproc SP_info_player_intermission 0 0
export ThrowSaberToAttacker
proc ThrowSaberToAttacker 68 8
line 73
;69:
;70:#define JMSABER_RESPAWN_TIME 20000 //in case it gets stuck somewhere no one can reach
;71:
;72:void ThrowSaberToAttacker(gentity_t *self, gentity_t *attacker)
;73:{
line 74
;74:	gentity_t *ent = &g_entities[self->client->ps.saberIndex];
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 76
;75:	vec3_t a;
;76:	int altVelocity = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 78
;77:
;78:	if (!ent || ent->enemy != self)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $100
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $98
LABELV $100
line 79
;79:	{ //something has gone very wrong (this should never happen)
line 84
;80:		//but in case it does.. find the saber manually
;81:#ifdef _DEBUG
;82:		Com_Printf("Lost the saber! Attempting to use global pointer..\n");
;83:#endif
;84:		ent = gJMSaberEnt;
ADDRLP4 0
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
line 86
;85:
;86:		if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $101
line 87
;87:		{
line 91
;88:#ifdef _DEBUG
;89:			Com_Printf("The global pointer was NULL. This is a bad thing.\n");
;90:#endif
;91:			return;
ADDRGP4 $97
JUMPV
LABELV $101
line 98
;92:		}
;93:
;94:#ifdef _DEBUG
;95:		Com_Printf("Got it (%i). Setting enemy to client %i.\n", ent->s.number, self->s.number);
;96:#endif
;97:
;98:		ent->enemy = self;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 99
;99:		self->client->ps.saberIndex = ent->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 100
;100:	}
LABELV $98
line 102
;101:
;102:	trap_SetConfigstring ( CS_CLIENT_JEDIMASTER, "-1" );
CNSTI4 28
ARGI4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 104
;103:
;104:	if (attacker && attacker->client && self->client->ps.saberInFlight)
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $104
ADDRLP4 32
CNSTI4 408
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $104
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $104
line 105
;105:	{ //someone killed us and we had the saber thrown, so actually move this saber to the saber location
line 108
;106:	  //if we killed ourselves with saber thrown, however, same suicide rules of respawning at spawn spot still
;107:	  //apply.
;108:		gentity_t *flyingsaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 36
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
line 110
;109:
;110:		if (flyingsaber && flyingsaber->inuse)
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $106
ADDRLP4 36
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $106
line 111
;111:		{
line 112
;112:			VectorCopy(flyingsaber->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 44
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 113
;113:			VectorCopy(flyingsaber->s.pos.trDelta, ent->s.pos.trDelta);
ADDRLP4 48
CNSTI4 36
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 114
;114:			VectorCopy(flyingsaber->s.apos.trBase, ent->s.apos.trBase);
ADDRLP4 52
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 115
;115:			VectorCopy(flyingsaber->s.apos.trDelta, ent->s.apos.trDelta);
ADDRLP4 56
CNSTI4 72
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 117
;116:
;117:			VectorCopy(flyingsaber->r.currentOrigin, ent->r.currentOrigin);
ADDRLP4 60
CNSTI4 368
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 118
;118:			VectorCopy(flyingsaber->r.currentAngles, ent->r.currentAngles);
ADDRLP4 64
CNSTI4 380
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 119
;119:			altVelocity = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 120
;120:		}
LABELV $106
line 121
;121:	}
LABELV $104
line 123
;122:
;123:	self->client->ps.saberInFlight = qtrue; //say he threw it anyway in order to properly remove from dead body
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 125
;124:
;125:	ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $108
ARGP4
ADDRLP4 36
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 126
;126:	ent->s.eFlags &= ~(EF_NODRAW);
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 127
;127:	ent->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 128
;128:	ent->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 129
;129:	ent->enemy = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 131
;130:
;131:	if (!attacker || !attacker->client)
ADDRLP4 44
ADDRFP4 4
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
EQU4 $111
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
NEU4 $109
LABELV $111
line 132
;132:	{
line 133
;133:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 134
;134:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 135
;135:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 136
;136:		ent->pos2[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 0
ASGNF4
line 137
;137:		trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 138
;138:		return;
ADDRGP4 $97
JUMPV
LABELV $109
line 141
;139:	}
;140:
;141:	if (!altVelocity)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $112
line 142
;142:	{
line 143
;143:		VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 52
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 144
;144:		VectorCopy(self->s.pos.trBase, ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 145
;145:		VectorCopy(self->s.pos.trBase, ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 147
;146:
;147:		VectorSubtract(attacker->client->ps.origin, ent->s.pos.trBase, a);
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 64
CNSTI4 24
ASGNI4
ADDRLP4 4
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 149
;148:
;149:		VectorNormalize(a);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 151
;150:
;151:		ent->s.pos.trDelta[0] = a[0]*256;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1132462080
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 152
;152:		ent->s.pos.trDelta[1] = a[1]*256;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132462080
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
line 153
;153:		ent->s.pos.trDelta[2] = 256;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1132462080
ASGNF4
line 154
;154:	}
LABELV $112
line 156
;155:
;156:	trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 157
;157:}
LABELV $97
endproc ThrowSaberToAttacker 68 8
export JMSaberThink
proc JMSaberThink 28 4
line 160
;158:
;159:void JMSaberThink(gentity_t *ent)
;160:{
line 161
;161:	gJMSaberEnt = ent;
ADDRGP4 gJMSaberEnt
ADDRFP4 0
INDIRP4
ASGNP4
line 163
;162:
;163:	if (ent->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 164
;164:	{
line 165
;165:		if (!ent->enemy->client || !ent->enemy->inuse)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $122
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $120
LABELV $122
line 166
;166:		{ //disconnected?
line 167
;167:			VectorCopy(ent->enemy->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 24
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 168
;168:			VectorCopy(ent->enemy->s.pos.trBase, ent->s.origin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 169
;169:			VectorCopy(ent->enemy->s.pos.trBase, ent->r.currentOrigin);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 170
;170:			ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $108
ARGP4
ADDRLP4 20
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 171
;171:			ent->s.eFlags &= ~(EF_NODRAW);
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
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 172
;172:			ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 173
;173:			ent->s.eType = ET_MISSILE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 174
;174:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 176
;175:
;176:			ent->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 1065353216
ASGNF4
line 177
;177:			ent->pos2[1] = 0; //respawn next think
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 0
ASGNF4
line 178
;178:			trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 179
;179:		}
ADDRGP4 $119
JUMPV
LABELV $120
line 181
;180:		else
;181:		{
line 182
;182:			ent->pos2[1] = level.time + JMSABER_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
ADDI4
CVIF4 4
ASGNF4
line 183
;183:		}
line 184
;184:	}
ADDRGP4 $119
JUMPV
LABELV $118
line 185
;185:	else if (ent->pos2[0] && ent->pos2[1] < level.time)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
CNSTF4 0
EQF4 $124
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $124
line 186
;186:	{
line 187
;187:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 188
;188:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 189
;189:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 190
;190:		ent->pos2[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 0
ASGNF4
line 191
;191:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 192
;192:	}
LABELV $124
LABELV $119
line 194
;193:
;194:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 195
;195:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 196
;196:}
LABELV $117
endproc JMSaberThink 28 4
export JMSaberTouch
proc JMSaberTouch 36 12
line 199
;197:
;198:void JMSaberTouch(gentity_t *self, gentity_t *other, trace_t *trace)
;199:{
line 200
;200:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 203
;201://	gentity_t *te;
;202:
;203:	if (!other || !other->client || other->health < 1)
ADDRLP4 4
ADDRFP4 4
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
EQU4 $132
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $132
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $129
LABELV $132
line 204
;204:	{
line 205
;205:		return;
ADDRGP4 $128
JUMPV
LABELV $129
line 208
;206:	}
;207:
;208:	if (self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $133
line 209
;209:	{
line 210
;210:		return;
ADDRGP4 $128
JUMPV
LABELV $133
line 213
;211:	}
;212:
;213:	if (!self->s.modelindex)
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $135
line 214
;214:	{
line 215
;215:		return;
ADDRGP4 $128
JUMPV
LABELV $135
line 218
;216:	}
;217:
;218:	if (other->client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $137
line 219
;219:	{
line 220
;220:		return;
ADDRGP4 $128
JUMPV
LABELV $137
line 223
;221:	}
;222:
;223:	if (other->client->ps.isJediMaster)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
line 224
;224:	{
line 225
;225:		return;
ADDRGP4 $128
JUMPV
LABELV $139
line 228
;226:	}
;227:
;228:	self->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 229
;229:	other->client->ps.stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 230
;230:	other->client->ps.weapon = WP_SABER;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 231
;231:	other->s.weapon = WP_SABER;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 232
;232:	G_AddEvent(other, EV_BECOME_JEDIMASTER, 0);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 30
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 235
;233:
;234:	// Track the jedi master 
;235:	trap_SetConfigstring ( CS_CLIENT_JEDIMASTER, va("%i", other->s.number ) );
ADDRGP4 $141
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 28
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 237
;236:
;237:	if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $142
line 238
;238:	{
line 239
;239:		other->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 240
;240:		other->client->invulnerableTimer = level.time + g_spawnInvulnerability.integer;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDI4
ASGNI4
line 241
;241:	}
LABELV $142
line 243
;242:
;243:	trap_SendServerCommand( -1, va("cp \"%s %s\n\"", other->client->pers.netname, G_GetStripEdString("SVINGAME", "BECOMEJM")) );
ADDRGP4 $148
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 16
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $147
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 245
;244:
;245:	other->client->ps.isJediMaster = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 246
;246:	other->client->ps.saberIndex = self->s.number;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 248
;247:
;248:	if (other->health < 200 && other->health > 0)
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 200
GEI4 $150
ADDRLP4 24
INDIRI4
CNSTI4 0
LEI4 $150
line 249
;249:	{ //full health when you become the Jedi Master
line 250
;250:		other->client->ps.stats[STAT_HEALTH] = other->health = 200;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 200
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 251
;251:	}
LABELV $150
line 253
;252:
;253:	if (other->client->ps.fd.forcePower < 100)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
GEI4 $155
line 254
;254:	{
line 255
;255:		other->client->ps.fd.forcePower = 100;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 100
ASGNI4
line 256
;256:	}
ADDRGP4 $155
JUMPV
LABELV $154
line 259
;257:
;258:	while (i < NUM_FORCE_POWERS)
;259:	{
line 260
;260:		other->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 261
;261:		other->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 263
;262:
;263:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 264
;264:	}
LABELV $155
line 258
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $154
line 266
;265:
;266:	self->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 1065353216
ASGNF4
line 267
;267:	self->pos2[1] = level.time + JMSABER_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
ADDI4
CVIF4 4
ASGNF4
line 269
;268:
;269:	self->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 270
;270:	self->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 271
;271:	self->s.modelGhoul2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 272
;272:	self->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 279
;273:
;274:	/*
;275:	te = G_TempEntity( vec3_origin, EV_DESTROY_GHOUL2_INSTANCE );
;276:	te->r.svFlags |= SVF_BROADCAST;
;277:	te->s.eventParm = self->s.number;
;278:	*/
;279:	G_KillG2Queue(self->s.number);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_KillG2Queue
CALLV
pop
line 281
;280:
;281:	return;
LABELV $128
endproc JMSaberTouch 36 12
data
export gJMSaberEnt
align 4
LABELV gJMSaberEnt
byte 4 0
export SP_info_jedimaster_start
code
proc SP_info_jedimaster_start 8 4
line 290
;282:}
;283:
;284:gentity_t *gJMSaberEnt = NULL;
;285:
;286:/*QUAKED info_jedimaster_start (1 0 0) (-16 -16 -24) (16 16 32)
;287:"jedi master" saber spawn point
;288:*/
;289:void SP_info_jedimaster_start(gentity_t *ent)
;290:{
line 291
;291:	if (g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $159
line 292
;292:	{
line 293
;293:		gJMSaberEnt = NULL;
ADDRGP4 gJMSaberEnt
CNSTP4 0
ASGNP4
line 294
;294:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 295
;295:		return;
ADDRGP4 $158
JUMPV
LABELV $159
line 298
;296:	}
;297:
;298:	ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 300
;299:
;300:	ent->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 302
;301:
;302:	ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $108
ARGP4
ADDRLP4 0
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 303
;303:	ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 304
;304:	ent->s.g2radius = 20;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 20
ASGNI4
line 306
;305:	//ent->s.eType = ET_GENERAL;
;306:	ent->s.eType = ET_MISSILE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 307
;307:	ent->s.weapon = WP_SABER;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 308
;308:	ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 309
;309:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 310
;310:	VectorSet( ent->r.maxs, 3, 3, 3 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 311
;311:	VectorSet( ent->r.mins, -3, -3, -3 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 312
;312:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 313
;313:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 315
;314:
;315:	ent->isSaberEntity = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 1
ASGNI4
line 317
;316:
;317:	ent->bounceCount = -5;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 -5
ASGNI4
line 319
;318:
;319:	ent->physicsObject = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 321
;320:
;321:	VectorCopy(ent->s.pos.trBase, ent->s.origin2); //remember the spawn spot
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 323
;322:
;323:	ent->touch = JMSaberTouch;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 JMSaberTouch
ASGNP4
line 325
;324:
;325:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 327
;326:
;327:	ent->think = JMSaberThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 JMSaberThink
ASGNP4
line 328
;328:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 329
;329:}
LABELV $158
endproc SP_info_jedimaster_start 8 4
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 345
;330:
;331:/*
;332:=======================================================================
;333:
;334:  SelectSpawnPoint
;335:
;336:=======================================================================
;337:*/
;338:
;339:/*
;340:================
;341:SpotWouldTelefrag
;342:
;343:================
;344:*/
;345:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 351
;346:	int			i, num;
;347:	int			touch[MAX_GENTITIES];
;348:	gentity_t	*hit;
;349:	vec3_t		mins, maxs;
;350:
;351:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 352
;352:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 353
;353:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 355
;354:
;355:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $176
JUMPV
LABELV $173
line 356
;356:		hit = &g_entities[touch[i]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 358
;357:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;358:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $177
line 359
;359:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $164
JUMPV
LABELV $177
line 362
;360:		}
;361:
;362:	}
LABELV $174
line 355
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $176
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $173
line 364
;363:
;364:	return qfalse;
CNSTI4 0
RETI4
LABELV $164
endproc SpotWouldTelefrag 4144 16
export SelectNearestDeathmatchSpawnPoint
proc SelectNearestDeathmatchSpawnPoint 40 12
line 375
;365:}
;366:
;367:/*
;368:================
;369:SelectNearestDeathmatchSpawnPoint
;370:
;371:Find the spot that we DON'T want to use
;372:================
;373:*/
;374:#define	MAX_SPAWN_POINTS	128
;375:gentity_t *SelectNearestDeathmatchSpawnPoint( vec3_t from ) {
line 381
;376:	gentity_t	*spot;
;377:	vec3_t		delta;
;378:	float		dist, nearestDist;
;379:	gentity_t	*nearestSpot;
;380:
;381:	nearestDist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 382
;382:	nearestSpot = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 383
;383:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $181
JUMPV
LABELV $180
line 385
;384:
;385:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 387
;386:
;387:		VectorSubtract( spot->s.origin, from, delta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 388
;388:		dist = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 389
;389:		if ( dist < nearestDist ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $185
line 390
;390:			nearestDist = dist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 391
;391:			nearestSpot = spot;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 392
;392:		}
LABELV $185
line 393
;393:	}
LABELV $181
line 385
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $180
line 395
;394:
;395:	return nearestSpot;
ADDRLP4 24
INDIRP4
RETP4
LABELV $179
endproc SelectNearestDeathmatchSpawnPoint 40 12
export SelectRandomDeathmatchSpawnPoint
proc SelectRandomDeathmatchSpawnPoint 532 12
line 407
;396:}
;397:
;398:
;399:/*
;400:================
;401:SelectRandomDeathmatchSpawnPoint
;402:
;403:go to a random point that doesn't telefrag
;404:================
;405:*/
;406:#define	MAX_SPAWN_POINTS	128
;407:gentity_t *SelectRandomDeathmatchSpawnPoint( void ) {
line 413
;408:	gentity_t	*spot;
;409:	int			count;
;410:	int			selection;
;411:	gentity_t	*spots[MAX_SPAWN_POINTS];
;412:
;413:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 414
;414:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $189
JUMPV
LABELV $188
line 416
;415:
;416:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 417
;417:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
EQI4 $191
line 418
;418:			continue;
ADDRGP4 $189
JUMPV
LABELV $191
line 420
;419:		}
;420:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 421
;421:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 422
;422:	}
LABELV $189
line 416
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $188
line 424
;423:
;424:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $193
line 425
;425:		return G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 528
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $187
JUMPV
LABELV $193
line 428
;426:	}
;427:
;428:	selection = rand() % count;
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 528
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 429
;429:	return spots[ selection ];
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $187
endproc SelectRandomDeathmatchSpawnPoint 532 12
export SelectRandomFurthestSpawnPoint
proc SelectRandomFurthestSpawnPoint 572 12
line 439
;430:}
;431:
;432:/*
;433:===========
;434:SelectRandomFurthestSpawnPoint
;435:
;436:Chooses a player start, deathmatch start, etc
;437:============
;438:*/
;439:gentity_t *SelectRandomFurthestSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 447
;440:	gentity_t	*spot;
;441:	vec3_t		delta;
;442:	float		dist;
;443:	float		list_dist[64];
;444:	gentity_t	*list_spot[64];
;445:	int			numSpots, rnd, i, j;
;446:
;447:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 448
;448:	spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
ADDRGP4 $197
JUMPV
LABELV $196
line 450
;449:
;450:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 451
;451:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $199
line 452
;452:			continue;
ADDRGP4 $197
JUMPV
LABELV $199
line 454
;453:		}
;454:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 556
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 455
;455:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 560
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 560
INDIRF4
ASGNF4
line 456
;456:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 457
;457:			if ( dist > list_dist[i] ) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $207
line 458
;458:				if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $209
line 459
;459:					numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $209
line 460
;460:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 461
;461:					list_dist[j] = list_dist[j-1];
ADDRLP4 564
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 564
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 564
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 462
;462:					list_spot[j] = list_spot[j-1];
ADDRLP4 568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 568
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 568
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 463
;463:				}
LABELV $212
line 460
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $211
line 464
;464:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 465
;465:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 466
;466:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 467
;467:				if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $205
line 468
;468:					numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 469
;469:				break;
ADDRGP4 $205
JUMPV
LABELV $207
line 471
;470:			}
;471:		}
LABELV $204
line 456
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $203
LABELV $205
line 472
;472:		if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $219
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $219
line 473
;473:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 474
;474:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 475
;475:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 476
;476:		}
LABELV $219
line 477
;477:	}
LABELV $197
line 450
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 548
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 548
INDIRP4
ASGNP4
ADDRLP4 548
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $196
line 478
;478:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $221
line 479
;479:		spot = G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 552
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 552
INDIRP4
ASGNP4
line 480
;480:		if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $223
line 481
;481:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $225
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $223
line 482
;482:		VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 483
;483:		origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 484
;484:		VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 485
;485:		return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $195
JUMPV
LABELV $221
line 489
;486:	}
;487:
;488:	// select a random spot from the spawn points furthest away
;489:	rnd = random() * (numSpots / 2);
ADDRLP4 552
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
ADDRLP4 552
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 491
;490:
;491:	VectorCopy (list_spot[rnd]->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 492
;492:	origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 493
;493:	VectorCopy (list_spot[rnd]->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 495
;494:
;495:	return list_spot[rnd];
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
RETP4
LABELV $195
endproc SelectRandomFurthestSpawnPoint 572 12
export SelectSpawnPoint
proc SelectSpawnPoint 4 12
line 505
;496:}
;497:
;498:/*
;499:===========
;500:SelectSpawnPoint
;501:
;502:Chooses a player start, deathmatch start, etc
;503:============
;504:*/
;505:gentity_t *SelectSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 506
;506:	return SelectRandomFurthestSpawnPoint( avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $226
endproc SelectSpawnPoint 4 12
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 12
line 545
;507:
;508:	/*
;509:	gentity_t	*spot;
;510:	gentity_t	*nearestSpot;
;511:
;512:	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );
;513:
;514:	spot = SelectRandomDeathmatchSpawnPoint ( );
;515:	if ( spot == nearestSpot ) {
;516:		// roll again if it would be real close to point of death
;517:		spot = SelectRandomDeathmatchSpawnPoint ( );
;518:		if ( spot == nearestSpot ) {
;519:			// last try
;520:			spot = SelectRandomDeathmatchSpawnPoint ( );
;521:		}		
;522:	}
;523:
;524:	// find a single player start spot
;525:	if (!spot) {
;526:		G_Error( "Couldn't find a spawn point" );
;527:	}
;528:
;529:	VectorCopy (spot->s.origin, origin);
;530:	origin[2] += 9;
;531:	VectorCopy (spot->s.angles, angles);
;532:
;533:	return spot;
;534:	*/
;535:}
;536:
;537:/*
;538:===========
;539:SelectInitialSpawnPoint
;540:
;541:Try to find a spawn point marked 'initial', otherwise
;542:use normal spawn selection.
;543:============
;544:*/
;545:gentity_t *SelectInitialSpawnPoint( vec3_t origin, vec3_t angles ) {
line 548
;546:	gentity_t	*spot;
;547:
;548:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $229
JUMPV
LABELV $228
line 549
;549:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 550
;550:		if ( spot->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $231
line 551
;551:			break;
ADDRGP4 $230
JUMPV
LABELV $231
line 553
;552:		}
;553:	}
LABELV $229
line 549
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $228
LABELV $230
line 555
;554:
;555:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $235
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $233
LABELV $235
line 556
;556:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $227
JUMPV
LABELV $233
line 559
;557:	}
;558:
;559:	VectorCopy (spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 560
;560:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 561
;561:	VectorCopy (spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 563
;562:
;563:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $227
endproc SelectInitialSpawnPoint 20 12
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 572
;564:}
;565:
;566:/*
;567:===========
;568:SelectSpectatorSpawnPoint
;569:
;570:============
;571:*/
;572:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 573
;573:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 575
;574:
;575:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+9024
INDIRB
ASGNB 12
line 576
;576:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+9036
INDIRB
ASGNB 12
line 578
;577:
;578:	return NULL;
CNSTP4 0
RETP4
LABELV $236
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 604
;579:}
;580:
;581:/*
;582:=======================================================================
;583:
;584:BODYQUE
;585:
;586:=======================================================================
;587:*/
;588:
;589:/*
;590:=======================================================================
;591:
;592:BODYQUE
;593:
;594:=======================================================================
;595:*/
;596:
;597:#define BODY_SINK_TIME		45000
;598:
;599:/*
;600:===============
;601:InitBodyQue
;602:===============
;603:*/
;604:void InitBodyQue (void) {
line 608
;605:	int		i;
;606:	gentity_t	*ent;
;607:
;608:	level.bodyQueIndex = 0;
ADDRGP4 level+9056
CNSTI4 0
ASGNI4
line 609
;609:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $241
line 610
;610:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 611
;611:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $245
ASGNP4
line 612
;612:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 613
;613:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9060
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 614
;614:	}
LABELV $242
line 609
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $241
line 615
;615:}
LABELV $239
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 624
;616:
;617:/*
;618:=============
;619:BodySink
;620:
;621:After sitting around for five seconds, fall into the ground and dissapear
;622:=============
;623:*/
;624:void BodySink( gentity_t *ent ) {
line 625
;625:	if ( level.time - ent->timestamp > BODY_SINK_TIME + 1500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
SUBI4
CNSTI4 46500
LEI4 $248
line 627
;626:		// the body ques are never actually freed, they are just unlinked
;627:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 628
;628:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 0
ASGNI4
line 629
;629:		return;	
ADDRGP4 $247
JUMPV
LABELV $248
line 631
;630:	}
;631:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 632
;632:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 633
;633:}
LABELV $247
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 64 12
line 643
;634:
;635:/*
;636:=============
;637:CopyToBodyQue
;638:
;639:A player is respawning, so make an entity that looks
;640:just like the existing corpse to leave behind.
;641:=============
;642:*/
;643:void CopyToBodyQue( gentity_t *ent ) {
line 647
;644:	gentity_t		*body;
;645:	int			contents;
;646:
;647:	if (level.intermissiontime)
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $253
line 648
;648:	{
line 649
;649:		return;
ADDRGP4 $252
JUMPV
LABELV $253
line 652
;650:	}
;651:
;652:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 655
;653:
;654:	// if client is in a nodrop area, don't leave the body
;655:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 656
;656:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $256
line 657
;657:		return;
ADDRGP4 $252
JUMPV
LABELV $256
line 660
;658:	}
;659:
;660:	if (ent->client && (ent->client->ps.eFlags & EF_DISINTEGRATION))
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $258
ADDRLP4 12
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $258
line 661
;661:	{ //for now, just don't spawn a body if you got disint'd
line 662
;662:		return;
ADDRGP4 $252
JUMPV
LABELV $258
line 666
;663:	}
;664:
;665:	// grab a body que and cycle to the next one
;666:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+9056
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9060
ADDP4
INDIRP4
ASGNP4
line 667
;667:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+9056
ADDRGP4 level+9056
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 669
;668:
;669:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 670
;670:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 296
line 673
;671:
;672:	//avoid oddly angled corpses floating around
;673:	body->s.angles[PITCH] = body->s.angles[ROLL] = body->s.apos.trBase[PITCH] = body->s.apos.trBase[ROLL] = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 675
;674:
;675:	body->s.g2radius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 100
ASGNI4
line 677
;676:
;677:	body->s.eType = ET_BODY;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 15
ASGNI4
line 678
;678:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 680
;679:
;680:	if (ent->client && (ent->client->ps.eFlags & EF_DISINTEGRATION))
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $264
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $264
line 681
;681:	{
line 682
;682:		body->s.eFlags |= EF_DISINTEGRATION;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 683
;683:	}
LABELV $264
line 685
;684:
;685:	VectorCopy(ent->client->ps.lastHitLoc, body->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 687
;686:
;687:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 688
;688:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 689
;689:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ASGNI4
line 690
;690:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 691
;691:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 692
;692:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTF4 0
ASGNF4
line 693
;693:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $267
line 694
;694:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 695
;695:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 696
;696:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 697
;697:	} else {
ADDRGP4 $268
JUMPV
LABELV $267
line 698
;698:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 699
;699:	}
LABELV $268
line 700
;700:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 702
;701:
;702:	body->s.weapon = ent->s.bolt2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 704
;703:
;704:	if (body->s.weapon == WP_SABER && ent->client->ps.saberInFlight)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $270
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $270
line 705
;705:	{
line 706
;706:		body->s.weapon = WP_BLASTER; //lie to keep from putting a saber on the corpse, because it was thrown at death
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 707
;707:	}
LABELV $270
line 709
;708:
;709:	G_AddEvent(body, EV_BODY_QUEUE_COPY, ent->s.clientNum);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 109
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 711
;710:
;711:	body->r.svFlags = ent->r.svFlags | SVF_BROADCAST;
ADDRLP4 32
CNSTI4 304
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 712
;712:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 36
CNSTI4 316
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 713
;713:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 40
CNSTI4 328
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 714
;714:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 44
CNSTI4 344
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 715
;715:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 48
CNSTI4 356
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
line 717
;716:
;717:	body->s.torsoAnim = body->s.legsAnim = ent->client->ps.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 56
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
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 719
;718:
;719:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 17
ASGNI4
line 720
;720:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 512
ASGNI4
line 721
;721:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 723
;722:
;723:	body->nextthink = level.time + BODY_SINK_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 45000
ADDI4
ASGNI4
line 724
;724:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 BodySink
ASGNP4
line 726
;725:
;726:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 body_die
ASGNP4
line 729
;727:
;728:	// don't take more damage if already gibbed
;729:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $273
line 730
;730:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 731
;731:	} else {
ADDRGP4 $274
JUMPV
LABELV $273
line 732
;732:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 733
;733:	}
LABELV $274
line 735
;734:
;735:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 736
;736:	trap_LinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 737
;737:}
LABELV $252
endproc CopyToBodyQue 64 12
export SetClientViewAngle
proc SetClientViewAngle 16 0
line 748
;738:
;739://======================================================================
;740:
;741:
;742:/*
;743:==================
;744:SetClientViewAngle
;745:
;746:==================
;747:*/
;748:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 752
;749:	int			i;
;750:
;751:	// set the delta angle
;752:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 755
;753:		int		cmdAngle;
;754:
;755:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 4
CNSTF4 1199570944
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 756
;756:		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 1388
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 757
;757:	}
LABELV $277
line 752
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $276
line 758
;758:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 759
;759:	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 760
;760:}
LABELV $275
endproc SetClientViewAngle 16 0
export respawn
proc respawn 12 8
line 767
;761:
;762:/*
;763:================
;764:respawn
;765:================
;766:*/
;767:void respawn( gentity_t *ent ) {
line 770
;768:	gentity_t	*tent;
;769:
;770:	CopyToBodyQue (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 772
;771:
;772:	if (gEscaping)
ADDRGP4 gEscaping
INDIRI4
CNSTI4 0
EQI4 $281
line 773
;773:	{
line 774
;774:		ent->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 3
ASGNI4
line 775
;775:		ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 776
;776:		ent->client->sess.spectatorClient = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 0
ASGNI4
line 778
;777:
;778:		ent->client->pers.teamState.state = TEAM_BEGIN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 0
ASGNI4
line 779
;779:	}
LABELV $281
line 781
;780:
;781:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 782
;782:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 785
;783:
;784:	// add a teleportation effect
;785:	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 786
;786:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
CNSTI4 220
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 787
;787:}
LABELV $280
endproc respawn 12 8
export TeamCount
proc TeamCount 8 0
line 796
;788:
;789:/*
;790:================
;791:TeamCount
;792:
;793:Returns number of players on a team
;794:================
;795:*/
;796:team_t TeamCount( int ignoreClientNum, int team ) {
line 798
;797:	int		i;
;798:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 800
;799:
;800:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $284
line 801
;801:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $289
line 802
;802:			continue;
ADDRGP4 $285
JUMPV
LABELV $289
line 804
;803:		}
;804:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $291
line 805
;805:			continue;
ADDRGP4 $285
JUMPV
LABELV $291
line 807
;806:		}
;807:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $293
line 808
;808:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 809
;809:		}
LABELV $293
line 810
;810:	}
LABELV $285
line 800
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $287
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $284
line 812
;811:
;812:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $283
endproc TeamCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 822
;813:}
;814:
;815:/*
;816:================
;817:TeamLeader
;818:
;819:Returns the client number of the team leader
;820:================
;821:*/
;822:int TeamLeader( int team ) {
line 825
;823:	int		i;
;824:
;825:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $299
JUMPV
LABELV $296
line 826
;826:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 827
;827:			continue;
ADDRGP4 $297
JUMPV
LABELV $301
line 829
;828:		}
;829:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $303
line 830
;830:			if ( level.clients[i].sess.teamLeader )
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1572
ADDP4
INDIRI4
CNSTI4 0
EQI4 $305
line 831
;831:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $295
JUMPV
LABELV $305
line 832
;832:		}
LABELV $303
line 833
;833:	}
LABELV $297
line 825
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $299
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $296
line 835
;834:
;835:	return -1;
CNSTI4 -1
RETI4
LABELV $295
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 845
;836:}
;837:
;838:
;839:/*
;840:================
;841:PickTeam
;842:
;843:================
;844:*/
;845:team_t PickTeam( int ignoreClientNum ) {
line 848
;846:	int		counts[TEAM_NUM_TEAMS];
;847:
;848:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 849
;849:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 851
;850:
;851:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $310
line 852
;852:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $307
JUMPV
LABELV $310
line 854
;853:	}
;854:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $314
line 855
;855:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $307
JUMPV
LABELV $314
line 858
;856:	}
;857:	// equal team count, so join the team with the lowest score
;858:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $318
line 859
;859:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $307
JUMPV
LABELV $318
line 861
;860:	}
;861:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $307
endproc PickTeam 24 8
proc ClientCleanName 40 12
line 889
;862:}
;863:
;864:/*
;865:===========
;866:ForceClientSkin
;867:
;868:Forces a client's skin (for teamplay)
;869:===========
;870:*/
;871:/*
;872:static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
;873:	char *p;
;874:
;875:	if ((p = Q_strrchr(model, '/')) != 0) {
;876:		*p = 0;
;877:	}
;878:
;879:	Q_strcat(model, MAX_QPATH, "/");
;880:	Q_strcat(model, MAX_QPATH, skin);
;881:}
;882:*/
;883:
;884:/*
;885:===========
;886:ClientCheckName
;887:============
;888:*/
;889:static void ClientCleanName( const char *in, char *out, int outSize ) {
line 896
;890:	int		len, colorlessLen;
;891:	char	ch;
;892:	char	*p;
;893:	int		spaces;
;894:
;895:	//save room for trailing null byte
;896:	outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 898
;897:
;898:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 899
;899:	colorlessLen = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 900
;900:	p = out;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
line 901
;901:	*p = 0;
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 902
;902:	spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $326
JUMPV
LABELV $325
line 904
;903:
;904:	while( 1 ) {
line 905
;905:		ch = *in++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
INDIRI1
ASGNI1
line 906
;906:		if( !ch ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $328
line 907
;907:			break;
ADDRGP4 $327
JUMPV
LABELV $328
line 911
;908:		}
;909:
;910:		// don't allow leading spaces
;911:		if( !*p && ch == ' ' ) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $330
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $330
line 912
;912:			continue;
ADDRGP4 $326
JUMPV
LABELV $330
line 916
;913:		}
;914:
;915:		// check colors
;916:		if( ch == Q_COLOR_ESCAPE ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $332
line 918
;917:			// solo trailing carat is not a color prefix
;918:			if( !*in ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $334
line 919
;919:				break;
ADDRGP4 $327
JUMPV
LABELV $334
line 923
;920:			}
;921:
;922:			// don't allow black in a name, period
;923:			if( ColorIndex(*in) == 0 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $336
line 924
;924:				in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 925
;925:				continue;
ADDRGP4 $326
JUMPV
LABELV $336
line 929
;926:			}
;927:
;928:			// make sure room in dest for both chars
;929:			if( len > outSize - 2 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $338
line 930
;930:				break;
ADDRGP4 $327
JUMPV
LABELV $338
line 933
;931:			}
;932:
;933:			*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 934
;934:			*out++ = *in++;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI1
ASGNI1
line 935
;935:			len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 936
;936:			continue;
ADDRGP4 $326
JUMPV
LABELV $332
line 940
;937:		}
;938:
;939:		// don't allow too many consecutive spaces
;940:		if( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $340
line 941
;941:			spaces++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 942
;942:			if( spaces > 3 ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LEI4 $341
line 943
;943:				continue;
ADDRGP4 $326
JUMPV
line 945
;944:			}
;945:		}
LABELV $340
line 946
;946:		else {
line 947
;947:			spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 948
;948:		}
LABELV $341
line 950
;949:
;950:		if( len > outSize - 1 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $344
line 951
;951:			break;
ADDRGP4 $327
JUMPV
LABELV $344
line 954
;952:		}
;953:
;954:		*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 955
;955:		colorlessLen++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 956
;956:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 957
;957:	}
LABELV $326
line 904
ADDRGP4 $325
JUMPV
LABELV $327
line 958
;958:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 961
;959:
;960:	// don't allow empty names
;961:	if( *p == 0 || colorlessLen == 0 ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
EQI4 $348
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $346
LABELV $348
line 962
;962:		Q_strncpyz( p, "Padawan", outSize );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $349
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 963
;963:	}
LABELV $346
line 964
;964:}
LABELV $324
endproc ClientCleanName 40 12
data
export g2SaberInstance
align 4
LABELV g2SaberInstance
byte 4 0
lit
align 4
LABELV $351
byte 4 0
byte 4 0
byte 4 0
export SetupGameGhoul2Model
code
proc SetupGameGhoul2Model 188 44
line 989
;965:
;966:#ifdef _DEBUG
;967:void G_DebugWrite(const char *path, const char *text)
;968:{
;969:	fileHandle_t f;
;970:
;971:	trap_FS_FOpenFile( path, &f, FS_APPEND );
;972:	trap_FS_Write(text, strlen(text), f);
;973:	trap_FS_FCloseFile(f);
;974:}
;975:#endif
;976:
;977:/*
;978:===========
;979:SetupGameGhoul2Model
;980:
;981:There are two ghoul2 model instances per player (actually three).  One is on the clientinfo (the base for the client side 
;982:player, and copied for player spawns and for corpses).  One is attached to the centity itself, which is the model acutally 
;983:animated and rendered by the system.  The final is the game ghoul2 model.  This is animated by pmove on the server, and
;984:is used for determining where the lightsaber should be, and for per-poly collision tests.
;985:===========
;986:*/
;987:void *g2SaberInstance = NULL;
;988:void SetupGameGhoul2Model(gclient_t *client, char *modelname)
;989:{
line 994
;990:	int handle;
;991:	char		afilename[MAX_QPATH];
;992:	char		/**GLAName,*/ *slash;
;993:	char		GLAName[MAX_QPATH];
;994:	vec3_t	tempVec = {0,0,0};
ADDRLP4 64
ADDRGP4 $351
INDIRB
ASGNB 12
line 997
;995:
;996:	// First things first.  If this is a ghoul2 model, then let's make sure we demolish this first.
;997:	if (client->ghoul2 && trap_G2_HaveWeGhoul2Models(client->ghoul2))
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $352
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $352
line 998
;998:	{
line 999
;999:		trap_G2API_CleanGhoul2Models(&(client->ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 1000
;1000:	}
LABELV $352
line 1018
;1001:
;1002:	/*
;1003:	Com_sprintf( afilename, sizeof( afilename ), "models/players/%s/model.glm", modelname );
;1004:	handle = trap_G2API_InitGhoul2Model(&client->ghoul2, afilename, 0, 0, -20, 0, 0);
;1005:	if (handle<0)
;1006:	{
;1007:		Com_sprintf( afilename, sizeof( afilename ), "models/players/kyle/model.glm" );
;1008:		handle = trap_G2API_InitGhoul2Model(&client->ghoul2, afilename, 0, 0, -20, 0, 0);
;1009:
;1010:		if (handle<0)
;1011:		{
;1012:			return;
;1013:		}
;1014:	}
;1015:	*/
;1016:
;1017:	//rww - just load the "standard" model for the server"
;1018:	if (!precachedKyle)
ADDRGP4 precachedKyle
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $354
line 1019
;1019:	{
line 1020
;1020:		Com_sprintf( afilename, sizeof( afilename ), "models/players/kyle/model.glm" );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $356
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1021
;1021:		handle = trap_G2API_InitGhoul2Model(&precachedKyle, afilename, 0, 0, -20, 0, 0);
ADDRGP4 precachedKyle
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 156
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 160
INDIRI4
ASGNI4
line 1023
;1022:
;1023:		if (handle<0)
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $357
line 1024
;1024:		{
line 1025
;1025:			return;
ADDRGP4 $350
JUMPV
LABELV $357
line 1027
;1026:		}
;1027:	}
LABELV $354
line 1029
;1028:
;1029:	if (precachedKyle && trap_G2_HaveWeGhoul2Models(precachedKyle))
ADDRLP4 156
ADDRGP4 precachedKyle
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $350
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $350
line 1030
;1030:	{
line 1031
;1031:		trap_G2API_DuplicateGhoul2Instance(precachedKyle, &client->ghoul2);
ADDRGP4 precachedKyle
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 1032
;1032:	}
line 1034
;1033:	else
;1034:	{
line 1035
;1035:		return;
LABELV $360
line 1040
;1036:	}
;1037:
;1038:	// The model is now loaded.
;1039:
;1040:	GLAName[0] = 0;
ADDRLP4 76
CNSTI1 0
ASGNI1
line 1042
;1041:
;1042:	if (!BGPAFtextLoaded)
ADDRGP4 BGPAFtextLoaded
INDIRI4
CNSTI4 0
NEI4 $361
line 1043
;1043:	{
line 1046
;1044:		//get the location of the animation.cfg
;1045:		//GLAName = trap_G2API_GetGLAName( client->ghoul2, 0);
;1046:		trap_G2API_GetGLAName( client->ghoul2, 0, GLAName);
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ARGP4
ADDRGP4 trap_G2API_GetGLAName
CALLV
pop
line 1048
;1047:
;1048:		if (!GLAName[0])
ADDRLP4 76
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $363
line 1049
;1049:		{
line 1050
;1050:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $367
ARGP4
ADDRLP4 164
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $350
line 1051
;1051:			{
line 1052
;1052:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $368
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1053
;1053:				return;
ADDRGP4 $350
JUMPV
line 1055
;1054:			}
;1055:			return;
LABELV $363
line 1057
;1056:		}
;1057:		Q_strncpyz( afilename, GLAName, sizeof( afilename ));
ADDRLP4 0
ARGP4
ADDRLP4 76
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1058
;1058:		slash = Q_strrchr( afilename, '/' );
ADDRLP4 0
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 164
INDIRP4
ASGNP4
line 1059
;1059:		if ( slash )
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $350
line 1060
;1060:		{
line 1061
;1061:			strcpy(slash, "/animation.cfg");
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 $371
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1062
;1062:		}	// Now afilename holds just the path to the animation.cfg
line 1064
;1063:		else 
;1064:		{	// Didn't find any slashes, this is a raw filename right in base (whish isn't a good thing)
line 1065
;1065:			return;
LABELV $370
line 1069
;1066:		}
;1067:
;1068:		// Try to load the animation.cfg for this model then.
;1069:		if ( !BG_ParseAnimationFile( afilename ) )
ADDRLP4 0
ARGP4
ADDRLP4 168
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $372
line 1070
;1070:		{	// The GLA's animations failed
line 1071
;1071:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $367
ARGP4
ADDRLP4 172
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
NEI4 $374
line 1072
;1072:			{
line 1073
;1073:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $368
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1074
;1074:				return;
ADDRGP4 $350
JUMPV
LABELV $374
line 1076
;1075:			}
;1076:		}
LABELV $372
line 1077
;1077:	}
LABELV $361
line 1079
;1078:
;1079:	trap_G2API_AddBolt(client->ghoul2, 0, "*r_hand");
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $376
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 1080
;1080:	trap_G2API_AddBolt(client->ghoul2, 0, "*l_hand");
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $377
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 1083
;1081:
;1082:	// NOTE - ensure this sequence of bolt and bone accessing are always the same because the client expects them in a certain order
;1083:	trap_G2API_SetBoneAnim(client->ghoul2, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, level.time, -1, -1);
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 164
CNSTI4 0
ASGNI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 $378
ARGP4
ADDRLP4 164
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1084
;1084:	trap_G2API_SetBoneAngles(client->ghoul2, 0, "upper_lumbar", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time);
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRI4
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 64
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
ADDRLP4 168
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1085
;1085:	trap_G2API_SetBoneAngles(client->ghoul2, 0, "cranium", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, level.time);
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRGP4 $382
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 176
CNSTI4 2
ASGNI4
ADDRLP4 176
INDIRI4
ARGI4
ADDRLP4 176
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 172
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1087
;1086:
;1087:	if (!g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $384
line 1088
;1088:	{
line 1089
;1089:		trap_G2API_InitGhoul2Model(&g2SaberInstance, "models/weapons2/saber/saber_w.glm", 0, 0, -20, 0, 0);
ADDRGP4 g2SaberInstance
ARGP4
ADDRGP4 $108
ARGP4
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 1091
;1090:
;1091:		if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $386
line 1092
;1092:		{
line 1094
;1093:			// indicate we will be bolted to model 0 (ie the player) on bolt 0 (always the right hand) when we get copied
;1094:			trap_G2API_SetBoltInfo(g2SaberInstance, 0, 0);
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRLP4 184
INDIRI4
ARGI4
ADDRLP4 184
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoltInfo
CALLV
pop
line 1096
;1095:			// now set up the gun bolt on it
;1096:			trap_G2API_AddBolt(g2SaberInstance, 0, "*flash");
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $388
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 1097
;1097:		}
LABELV $386
line 1098
;1098:	}
LABELV $384
line 1100
;1099:
;1100:	if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $389
line 1101
;1101:	{
line 1102
;1102:		trap_G2API_CopySpecificGhoul2Model(g2SaberInstance, 0, client->ghoul2, 1); 
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
CALLV
pop
line 1103
;1103:	}
LABELV $389
line 1104
;1104:}
LABELV $350
endproc SetupGameGhoul2Model 188 44
export ClientUserinfoChanged
proc ClientUserinfoChanged 6372 52
line 1120
;1105:
;1106:
;1107:
;1108:
;1109:/*
;1110:===========
;1111:ClientUserInfoChanged
;1112:
;1113:Called from ClientConnect when the player first connects and
;1114:directly by the server system when the player updates a userinfo variable.
;1115:
;1116:The game can override any of the settings and call trap_SetUserinfo
;1117:if desired.
;1118:============
;1119:*/
;1120:void ClientUserinfoChanged( int clientNum ) {
line 1135
;1121:	gentity_t *ent;
;1122:	int		teamTask, teamLeader, team, health;
;1123:	char	*s;
;1124:	char	model[MAX_QPATH];
;1125:	//char	headModel[MAX_QPATH];
;1126:	char	forcePowers[MAX_QPATH];
;1127:	char	oldname[MAX_STRING_CHARS];
;1128:	gclient_t	*client;
;1129:	char	c1[MAX_INFO_STRING];
;1130:	char	c2[MAX_INFO_STRING];
;1131:	char	redTeam[MAX_INFO_STRING];
;1132:	char	blueTeam[MAX_INFO_STRING];
;1133:	char	userinfo[MAX_INFO_STRING];
;1134:
;1135:	ent = g_entities + clientNum;
ADDRLP4 1032
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1136
;1136:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1138
;1137:
;1138:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1141
;1139:
;1140:	// check for malformed or illegal info strings
;1141:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 4
ARGP4
ADDRLP4 6300
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 6300
INDIRI4
CNSTI4 0
NEI4 $392
line 1142
;1142:		strcpy (userinfo, "\\name\\badinfo");
ADDRLP4 4
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1143
;1143:	}
LABELV $392
line 1146
;1144:
;1145:	// check for local client
;1146:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 4
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 6304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6304
INDIRP4
ASGNP4
line 1147
;1147:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $398
ARGP4
ADDRLP4 6308
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6308
INDIRI4
CNSTI4 0
NEI4 $396
line 1148
;1148:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1412
ADDP4
CNSTI4 1
ASGNI4
line 1149
;1149:	}
LABELV $396
line 1152
;1150:
;1151:	// check the item prediction
;1152:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 4
ARGP4
ADDRGP4 $399
ARGP4
ADDRLP4 6312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6312
INDIRP4
ASGNP4
line 1153
;1153:	if ( !atoi( s ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6316
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6316
INDIRI4
CNSTI4 0
NEI4 $400
line 1154
;1154:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1420
ADDP4
CNSTI4 0
ASGNI4
line 1155
;1155:	} else {
ADDRGP4 $401
JUMPV
LABELV $400
line 1156
;1156:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1420
ADDP4
CNSTI4 1
ASGNI4
line 1157
;1157:	}
LABELV $401
line 1160
;1158:
;1159:	// set name
;1160:	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1161
;1161:	s = Info_ValueForKey (userinfo, "name");
ADDRLP4 4
ARGP4
ADDRGP4 $402
ARGP4
ADDRLP4 6320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6320
INDIRP4
ASGNP4
line 1162
;1162:	ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname) );
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 1164
;1163:
;1164:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $403
line 1165
;1165:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 3
NEI4 $405
line 1166
;1166:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 $407
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1167
;1167:		}
LABELV $405
line 1168
;1168:	}
LABELV $403
line 1170
;1169:
;1170:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $408
line 1171
;1171:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6324
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6324
INDIRI4
CNSTI4 0
EQI4 $410
line 1172
;1172:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s %s\n\"", oldname, G_GetStripEdString("SVINGAME", "PLRENAME"),
ADDRGP4 $148
ARGP4
ADDRGP4 $413
ARGP4
ADDRLP4 6328
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $412
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 6328
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6332
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 6332
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1174
;1173:				client->pers.netname) );
;1174:		}
LABELV $410
line 1175
;1175:	}
LABELV $408
line 1178
;1176:
;1177:	// set max health
;1178:	health = 100; //atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 2132
CNSTI4 100
ASGNI4
line 1179
;1179:	client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
ADDRLP4 2132
INDIRI4
ASGNI4
line 1180
;1180:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 6324
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6324
INDIRI4
CNSTI4 1
LTI4 $416
ADDRLP4 6324
INDIRI4
CNSTI4 100
LEI4 $414
LABELV $416
line 1181
;1181:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 100
ASGNI4
line 1182
;1182:	}
LABELV $414
line 1183
;1183:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
line 1186
;1184:
;1185:	// set model
;1186:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $417
line 1187
;1187:		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
ADDRLP4 4
ARGP4
ADDRGP4 $420
ARGP4
ADDRLP4 6332
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 6332
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1189
;1188:		//Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
;1189:	} else {
ADDRGP4 $418
JUMPV
LABELV $417
line 1190
;1190:		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
ADDRLP4 4
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 6332
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 6332
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1192
;1191:		//Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
;1192:	}
LABELV $418
line 1194
;1193:
;1194:	Q_strncpyz( forcePowers, Info_ValueForKey (userinfo, "forcepowers"), sizeof( forcePowers ) );
ADDRLP4 4
ARGP4
ADDRGP4 $422
ARGP4
ADDRLP4 6332
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2136
ARGP4
ADDRLP4 6332
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1197
;1195:
;1196:	// bots set their team a few frames later
;1197:	if (g_gametype.integer >= GT_TEAM && g_entities[clientNum].r.svFlags & SVF_BOT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $423
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $423
line 1198
;1198:		s = Info_ValueForKey( userinfo, "team" );
ADDRLP4 4
ARGP4
ADDRGP4 $428
ARGP4
ADDRLP4 6336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6336
INDIRP4
ASGNP4
line 1199
;1199:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $431
ARGP4
ADDRLP4 6340
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6340
INDIRI4
CNSTI4 0
EQI4 $433
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 6344
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6344
INDIRI4
CNSTI4 0
NEI4 $429
LABELV $433
line 1200
;1200:			team = TEAM_RED;
ADDRLP4 4248
CNSTI4 1
ASGNI4
line 1201
;1201:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $424
JUMPV
LABELV $429
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 6348
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6348
INDIRI4
CNSTI4 0
EQI4 $438
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $437
ARGP4
ADDRLP4 6352
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6352
INDIRI4
CNSTI4 0
NEI4 $434
LABELV $438
line 1202
;1202:			team = TEAM_BLUE;
ADDRLP4 4248
CNSTI4 2
ASGNI4
line 1203
;1203:		} else {
ADDRGP4 $424
JUMPV
LABELV $434
line 1205
;1204:			// pick the team with the least number of players
;1205:			team = PickTeam( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 6356
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4248
ADDRLP4 6356
INDIRI4
ASGNI4
line 1206
;1206:		}
line 1207
;1207:	}
ADDRGP4 $424
JUMPV
LABELV $423
line 1208
;1208:	else {
line 1209
;1209:		team = client->sess.sessionTeam;
ADDRLP4 4248
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1210
;1210:	}
LABELV $424
line 1233
;1211:
;1212:/*	NOTE: all client side now
;1213:
;1214:	// team
;1215:	switch( team ) {
;1216:	case TEAM_RED:
;1217:		ForceClientSkin(client, model, "red");
;1218://		ForceClientSkin(client, headModel, "red");
;1219:		break;
;1220:	case TEAM_BLUE:
;1221:		ForceClientSkin(client, model, "blue");
;1222://		ForceClientSkin(client, headModel, "blue");
;1223:		break;
;1224:	}
;1225:	// don't ever use a default skin in teamplay, it would just waste memory
;1226:	// however bots will always join a team but they spawn in as spectator
;1227:	if ( g_gametype.integer >= GT_TEAM && team == TEAM_SPECTATOR) {
;1228:		ForceClientSkin(client, model, "red");
;1229://		ForceClientSkin(client, headModel, "red");
;1230:	}
;1231:*/
;1232:
;1233:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $439
line 1234
;1234:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 1
ASGNI4
line 1235
;1235:	} else {
ADDRGP4 $440
JUMPV
LABELV $439
line 1236
;1236:		s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 4
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 6336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6336
INDIRP4
ASGNP4
line 1237
;1237:		if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $445
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6344
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6344
INDIRI4
CNSTI4 0
EQI4 $443
LABELV $445
line 1238
;1238:			client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 1
ASGNI4
line 1239
;1239:		} else {
ADDRGP4 $444
JUMPV
LABELV $443
line 1240
;1240:			client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 0
ASGNI4
line 1241
;1241:		}
LABELV $444
line 1242
;1242:	}
LABELV $440
line 1254
;1243:	/*
;1244:	s = Info_ValueForKey( userinfo, "cg_pmove_fixed" );
;1245:	if ( !*s || atoi( s ) == 0 ) {
;1246:		client->pers.pmoveFixed = qfalse;
;1247:	}
;1248:	else {
;1249:		client->pers.pmoveFixed = qtrue;
;1250:	}
;1251:	*/
;1252:
;1253:	// team task (0 = none, 1 = offence, 2 = defence)
;1254:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 6336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6336
INDIRP4
ARGP4
ADDRLP4 6340
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2124
ADDRLP4 6340
INDIRI4
ASGNI4
line 1256
;1255:	// team Leader (1 = leader, 0 is normal player)
;1256:	teamLeader = client->sess.teamLeader;
ADDRLP4 2128
ADDRLP4 0
INDIRP4
CNSTI4 1572
ADDP4
INDIRI4
ASGNI4
line 1259
;1257:
;1258:	// colors
;1259:	strcpy(c1, Info_ValueForKey( userinfo, "color1" ));
ADDRLP4 4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 6344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2200
ARGP4
ADDRLP4 6344
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1260
;1260:	strcpy(c2, Info_ValueForKey( userinfo, "color2" ));
ADDRLP4 4
ARGP4
ADDRGP4 $448
ARGP4
ADDRLP4 6348
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3224
ARGP4
ADDRLP4 6348
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1262
;1261:
;1262:	strcpy(redTeam, Info_ValueForKey( userinfo, "g_redteam" ));
ADDRLP4 4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 6352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4252
ARGP4
ADDRLP4 6352
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1263
;1263:	strcpy(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ));
ADDRLP4 4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 6356
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 5276
ARGP4
ADDRLP4 6356
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1267
;1264:
;1265:	// send over a subset of the userinfo keys so other clients can
;1266:	// print scoreboards, display models, and play custom sounds
;1267:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $451
line 1268
;1268:		s = va("n\\%s\\t\\%i\\model\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 4
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 6360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $453
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4248
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 2200
ARGP4
ADDRLP4 3224
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 6360
INDIRP4
ARGP4
ADDRLP4 2124
INDIRI4
ARGI4
ADDRLP4 2128
INDIRI4
ARGI4
ADDRLP4 6368
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6368
INDIRP4
ASGNP4
line 1272
;1269:			client->pers.netname, team, model,  c1, c2, 
;1270:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;1271:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;1272:	} else {
ADDRGP4 $452
JUMPV
LABELV $451
line 1273
;1273:		s = va("n\\%s\\t\\%i\\model\\%s\\g_redteam\\%s\\g_blueteam\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $455
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 4252
ARGP4
ADDRLP4 5276
ARGP4
ADDRLP4 2200
ARGP4
ADDRLP4 3224
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 2124
INDIRI4
ARGI4
ADDRLP4 2128
INDIRI4
ARGI4
ADDRLP4 6364
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6364
INDIRP4
ASGNP4
line 1276
;1274:			client->pers.netname, client->sess.sessionTeam, model, redTeam, blueTeam, c1, c2, 
;1275:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
;1276:	}
LABELV $452
line 1278
;1277:
;1278:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1280
;1279:
;1280:	if (g_logClientInfo.integer)
ADDRGP4 g_logClientInfo+12
INDIRI4
CNSTI4 0
EQI4 $456
line 1281
;1281:	{
line 1282
;1282:		G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $459
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1283
;1283:	}
LABELV $456
line 1284
;1284:}
LABELV $391
endproc ClientUserinfoChanged 6372 52
bss
align 1
LABELV $474
skip 1024
export ClientConnect
code
proc ClientConnect 1068 12
line 1307
;1285:
;1286:
;1287:/*
;1288:===========
;1289:ClientConnect
;1290:
;1291:Called when a player begins connecting to the server.
;1292:Called again for every map change or tournement restart.
;1293:
;1294:The session information will be valid after exit.
;1295:
;1296:Return NULL if the client should be allowed, otherwise return
;1297:a string with the reason for denial.
;1298:
;1299:Otherwise, the client will be sent the current gamestate
;1300:and will eventually get to ClientBegin.
;1301:
;1302:firstTime will be qtrue the very first time a client connects
;1303:to the server machine, but qfalse on map changes and tournement
;1304:restarts.
;1305:============
;1306:*/
;1307:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 1315
;1308:	char		*value;
;1309://	char		*areabits;
;1310:	gclient_t	*client;
;1311:	char		userinfo[MAX_INFO_STRING];
;1312:	gentity_t	*ent;
;1313:	gentity_t	*te;
;1314:
;1315:	ent = &g_entities[ clientNum ];
ADDRLP4 4
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1317
;1316:
;1317:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1320
;1318:
;1319:	// check to see if they are on the banned IP list
;1320:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 8
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1040
INDIRP4
ASGNP4
line 1321
;1321:	if ( G_FilterPacket( value ) ) {
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $461
line 1322
;1322:		return "Banned.";
ADDRGP4 $463
RETP4
ADDRGP4 $460
JUMPV
LABELV $461
line 1325
;1323:	}
;1324:
;1325:	if ( !( ent->r.svFlags & SVF_BOT ) && !isBot && g_needpass.integer ) {
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1048
INDIRI4
NEI4 $464
ADDRFP4 8
INDIRI4
ADDRLP4 1048
INDIRI4
NEI4 $464
ADDRGP4 g_needpass+12
INDIRI4
ADDRLP4 1048
INDIRI4
EQI4 $464
line 1327
;1326:		// check for a password
;1327:		value = Info_ValueForKey (userinfo, "password");
ADDRLP4 8
ARGP4
ADDRGP4 $467
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1052
INDIRP4
ASGNP4
line 1328
;1328:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $468
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $472
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $468
ADDRGP4 g_password+16
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $468
line 1329
;1329:			strcmp( g_password.string, value) != 0) {
line 1331
;1330:			static char sTemp[1024];
;1331:			Q_strncpyz(sTemp, G_GetStripEdString("SVINGAME","INVALID_PASSWORD"), sizeof (sTemp) );
ADDRGP4 $148
ARGP4
ADDRGP4 $475
ARGP4
ADDRLP4 1064
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $474
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1332
;1332:			return sTemp;// return "Invalid password";
ADDRGP4 $474
RETP4
ADDRGP4 $460
JUMPV
LABELV $468
line 1334
;1333:		}
;1334:	}
LABELV $464
line 1337
;1335:
;1336:	// they can connect
;1337:	ent->client = level.clients + clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 1800
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1338
;1338:	client = ent->client;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1342
;1339:
;1340://	areabits = client->areabits;
;1341:
;1342:	memset( client, 0, sizeof(*client) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1800
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1344
;1343:
;1344:	client->pers.connected = CON_CONNECTING;
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 1
ASGNI4
line 1347
;1345:
;1346:	// read or initialize the session data
;1347:	if ( firstTime || level.newSession ) {
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1052
INDIRI4
NEI4 $479
ADDRGP4 level+64
INDIRI4
ADDRLP4 1052
INDIRI4
EQI4 $476
LABELV $479
line 1348
;1348:		G_InitSessionData( client, userinfo, isBot );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitSessionData
CALLV
pop
line 1349
;1349:	}
LABELV $476
line 1350
;1350:	G_ReadSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1352
;1351:
;1352:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $480
line 1353
;1353:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1056
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1354
;1354:		ent->inuse = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 1355
;1355:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $485
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $486
JUMPV
LABELV $485
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $486
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $482
line 1356
;1356:			return "BotConnectfailed";
ADDRGP4 $487
RETP4
ADDRGP4 $460
JUMPV
LABELV $482
line 1358
;1357:		}
;1358:	}
LABELV $480
line 1361
;1359:
;1360:	// get and distribute relevent paramters
;1361:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $488
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1362
;1362:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1365
;1363:
;1364:	// don't do the "xxx connected" messages if they were caried over from previous level
;1365:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $489
line 1366
;1366:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s\n\"", client->pers.netname, G_GetStripEdString("SVINGAME", "PLCONNECT")) );
ADDRGP4 $148
ARGP4
ADDRGP4 $492
ARGP4
ADDRLP4 1056
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $491
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1367
;1367:	}
LABELV $489
line 1369
;1368:
;1369:	if ( g_gametype.integer >= GT_TEAM &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $493
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $493
line 1370
;1370:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1371
;1371:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1372
;1372:	}
LABELV $493
line 1375
;1373:
;1374:	// count current clients and rank for scoreboard
;1375:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1377
;1376:
;1377:	te = G_TempEntity( vec3_origin, EV_CLIENTJOIN );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1056
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1036
ADDRLP4 1056
INDIRP4
ASGNP4
line 1378
;1378:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1060
ADDRLP4 1036
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1379
;1379:	te->s.eventParm = clientNum;
ADDRLP4 1036
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1386
;1380:
;1381:	// for statistics
;1382://	client->areabits = areabits;
;1383://	if ( !client->areabits )
;1384://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;1385:
;1386:	return NULL;
CNSTP4 0
RETP4
LABELV $460
endproc ClientConnect 1068 12
export ClientBegin
proc ClientBegin 1108 12
line 1400
;1387:}
;1388:
;1389:void G_WriteClientSessionData( gclient_t *client );
;1390:
;1391:/*
;1392:===========
;1393:ClientBegin
;1394:
;1395:called when a client has finished connecting, and is ready
;1396:to be placed into the level.  This will happen every level load,
;1397:and on transition between teams, but doesn't happen on respawns
;1398:============
;1399:*/
;1400:void ClientBegin( int clientNum, qboolean allowTeamReset ) {
line 1407
;1401:	gentity_t	*ent;
;1402:	gclient_t	*client;
;1403:	gentity_t	*tent;
;1404:	int			flags, i;
;1405:	char		userinfo[MAX_INFO_VALUE], *modelname;
;1406:
;1407:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1409
;1408:
;1409:	if ((ent->r.svFlags & SVF_BOT) && g_gametype.integer >= GT_TEAM)
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $497
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $497
line 1410
;1410:	{
line 1411
;1411:		if (allowTeamReset)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $500
line 1412
;1412:		{
line 1413
;1413:			const char *team = "Red";
ADDRLP4 1048
ADDRGP4 $502
ASGNP4
line 1417
;1414:			int preSess;
;1415:
;1416:			//SetTeam(ent, "");
;1417:			ent->client->sess.sessionTeam = PickTeam(-1);
CNSTI4 -1
ARGI4
ADDRLP4 1056
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 1418
;1418:			trap_GetUserinfo(clientNum, userinfo, MAX_INFO_STRING);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1420
;1419:
;1420:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $503
line 1421
;1421:			{
line 1422
;1422:				ent->client->sess.sessionTeam = TEAM_RED;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 1
ASGNI4
line 1423
;1423:			}
LABELV $503
line 1425
;1424:
;1425:			if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $505
line 1426
;1426:			{
line 1427
;1427:				team = "Red";
ADDRLP4 1048
ADDRGP4 $502
ASGNP4
line 1428
;1428:			}
ADDRGP4 $506
JUMPV
LABELV $505
line 1430
;1429:			else
;1430:			{
line 1431
;1431:				team = "Blue";
ADDRLP4 1048
ADDRGP4 $507
ASGNP4
line 1432
;1432:			}
LABELV $506
line 1434
;1433:
;1434:			Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 12
ARGP4
ADDRGP4 $428
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1436
;1435:
;1436:			trap_SetUserinfo( clientNum, userinfo );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 1438
;1437:
;1438:			ent->client->ps.persistant[ PERS_TEAM ] = ent->client->sess.sessionTeam;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 1060
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1440
;1439:
;1440:			preSess = ent->client->sess.sessionTeam;
ADDRLP4 1052
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1441
;1441:			G_ReadSessionData( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1442
;1442:			ent->client->sess.sessionTeam = preSess;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1443
;1443:			G_WriteClientSessionData(ent->client);
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 1444
;1444:			ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1445
;1445:			ClientBegin(clientNum, qfalse);
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1446
;1446:			return;
ADDRGP4 $496
JUMPV
LABELV $500
line 1448
;1447:		}
;1448:	}
LABELV $497
line 1450
;1449:
;1450:	client = level.clients + clientNum;
ADDRLP4 8
CNSTI4 1800
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1452
;1451:
;1452:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $508
line 1453
;1453:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1454
;1454:	}
LABELV $508
line 1455
;1455:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1456
;1456:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 1457
;1457:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 1458
;1458:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 1460
;1459:
;1460:	client->pers.connected = CON_CONNECTED;
ADDRLP4 8
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 2
ASGNI4
line 1461
;1461:	client->pers.enterTime = level.time;
ADDRLP4 8
INDIRP4
CNSTI4 1468
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1462
;1462:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 8
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 0
ASGNI4
line 1469
;1463:
;1464:	// save eflags around this, because changing teams will
;1465:	// cause this to happen with a valid entity, and we
;1466:	// want to make sure the teleport bit is set right
;1467:	// so the viewpoint doesn't interpolate through the
;1468:	// world to the new position
;1469:	flags = client->ps.eFlags;
ADDRLP4 1036
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1471
;1470:
;1471:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $512
JUMPV
LABELV $511
line 1474
;1472:
;1473:	while (i < NUM_FORCE_POWERS)
;1474:	{
line 1475
;1475:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRLP4 4
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
EQI4 $514
line 1476
;1476:		{
line 1477
;1477:			WP_ForcePowerStop(ent, i);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1478
;1478:		}
LABELV $514
line 1479
;1479:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1480
;1480:	}
LABELV $512
line 1473
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $511
line 1482
;1481:
;1482:	i = TRACK_CHANNEL_1;
ADDRLP4 0
CNSTI4 51
ASGNI4
ADDRGP4 $517
JUMPV
LABELV $516
line 1485
;1483:
;1484:	while (i < NUM_TRACK_CHANNELS)
;1485:	{
line 1486
;1486:		if (ent->client->ps.fd.killSoundEntIndex[i-50] && ent->client->ps.fd.killSoundEntIndex[i-50] < MAX_GENTITIES && ent->client->ps.fd.killSoundEntIndex[i-50] > 0)
ADDRLP4 1048
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1048
INDIRI4
ADDRLP4 1052
INDIRI4
EQI4 $519
ADDRLP4 1048
INDIRI4
CNSTI4 1024
GEI4 $519
ADDRLP4 1048
INDIRI4
ADDRLP4 1052
INDIRI4
LEI4 $519
line 1487
;1487:		{
line 1488
;1488:			G_MuteSound(ent->client->ps.fd.killSoundEntIndex[i-50], CHAN_VOICE);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 1489
;1489:		}
LABELV $519
line 1490
;1490:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1491
;1491:	}
LABELV $517
line 1484
ADDRLP4 0
INDIRI4
CNSTI4 56
LTI4 $516
line 1492
;1492:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1494
;1493:
;1494:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1380
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1495
;1495:	client->ps.eFlags = flags;
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 1497
;1496:
;1497:	client->ps.hasDetPackPlanted = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 1500
;1498:
;1499:	//first-time force power initialization
;1500:	WP_InitForcePowers( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 1503
;1501:
;1502:	//init saber ent
;1503:	WP_SaberInitBladeData( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 WP_SaberInitBladeData
CALLV
pop
line 1506
;1504:
;1505:	// First time model setup for that player.
;1506:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1507
;1507:	modelname = Info_ValueForKey (userinfo, "model");
ADDRLP4 12
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1048
INDIRP4
ASGNP4
line 1508
;1508:	SetupGameGhoul2Model(client, modelname);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 SetupGameGhoul2Model
CALLV
pop
line 1510
;1509:
;1510:	if (ent->client->ghoul2)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $521
line 1511
;1511:	{
line 1512
;1512:		ent->bolt_Head = trap_G2API_AddBolt(ent->client->ghoul2, 0, "cranium");
ADDRLP4 4
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
ADDRGP4 $382
ARGP4
ADDRLP4 1056
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 1513
;1513:		ent->bolt_Waist = trap_G2API_AddBolt(ent->client->ghoul2, 0, "thoracic");
ADDRLP4 4
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
ADDRGP4 $523
ARGP4
ADDRLP4 1064
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 1064
INDIRI4
ASGNI4
line 1514
;1514:		ent->bolt_LArm = trap_G2API_AddBolt(ent->client->ghoul2, 0, "lradius");
ADDRLP4 4
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
ADDRGP4 $524
ARGP4
ADDRLP4 1072
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 1072
INDIRI4
ASGNI4
line 1515
;1515:		ent->bolt_RArm = trap_G2API_AddBolt(ent->client->ghoul2, 0, "rradius");
ADDRLP4 4
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
ADDRGP4 $525
ARGP4
ADDRLP4 1080
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 1080
INDIRI4
ASGNI4
line 1516
;1516:		ent->bolt_LLeg = trap_G2API_AddBolt(ent->client->ghoul2, 0, "ltibia");
ADDRLP4 4
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
ADDRGP4 $526
ARGP4
ADDRLP4 1088
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
ADDRLP4 1088
INDIRI4
ASGNI4
line 1517
;1517:		ent->bolt_RLeg = trap_G2API_AddBolt(ent->client->ghoul2, 0, "rtibia");
ADDRLP4 4
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
ADDRGP4 $527
ARGP4
ADDRLP4 1096
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 1096
INDIRI4
ASGNI4
line 1518
;1518:		ent->bolt_Motion = trap_G2API_AddBolt(ent->client->ghoul2, 0, "Motion");
ADDRLP4 4
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
ADDRGP4 $528
ARGP4
ADDRLP4 1104
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 1104
INDIRI4
ASGNI4
line 1519
;1519:	}
LABELV $521
line 1522
;1520:
;1521:	// locate ent at a spawn point
;1522:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1524
;1523:
;1524:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $529
line 1526
;1525:		// send event
;1526:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1052
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1052
INDIRP4
ASGNP4
line 1527
;1527:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 1056
CNSTI4 220
ASGNI4
ADDRLP4 1044
INDIRP4
ADDRLP4 1056
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 1056
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1529
;1528:
;1529:		if ( g_gametype.integer != GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $531
line 1530
;1530:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s\n\"", client->pers.netname, G_GetStripEdString("SVINGAME", "PLENTER")) );
ADDRGP4 $148
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 1060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $491
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1531
;1531:		}
LABELV $531
line 1532
;1532:	}
LABELV $529
line 1533
;1533:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $535
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1536
;1534:
;1535:	// count current clients and rank for scoreboard
;1536:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1538
;1537:
;1538:	G_ClearClientLog(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_ClearClientLog
CALLV
pop
line 1539
;1539:}
LABELV $496
endproc ClientBegin 1108 12
proc AllForceDisabled 4 0
line 1542
;1540:
;1541:static qboolean AllForceDisabled(int force)
;1542:{
line 1545
;1543:	int i;
;1544:
;1545:	if (force)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $537
line 1546
;1546:	{
line 1547
;1547:		for (i=0;i<NUM_FORCE_POWERS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $539
line 1548
;1548:		{
line 1549
;1549:			if (!(force & (1<<i)))
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $543
line 1550
;1550:			{
line 1551
;1551:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $536
JUMPV
LABELV $543
line 1553
;1552:			}
;1553:		}
LABELV $540
line 1547
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $539
line 1555
;1554:
;1555:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $536
JUMPV
LABELV $537
line 1558
;1556:	}
;1557:
;1558:	return qfalse;
CNSTI4 0
RETI4
LABELV $536
endproc AllForceDisabled 4 0
export ClientSpawn
proc ClientSpawn 872 16
line 1571
;1559:}
;1560:
;1561:/*
;1562:===========
;1563:ClientSpawn
;1564:
;1565:Called every time a client is placed fresh in the world:
;1566:after the first ClientBegin, and after each respawn
;1567:Initializes all non-persistant parts of playerState
;1568:============
;1569:*/
;1570:extern qboolean WP_HasForcePowers( const playerState_t *ps );
;1571:void ClientSpawn(gentity_t *ent) {
line 1588
;1572:	int		index;
;1573:	vec3_t	spawn_origin, spawn_angles;
;1574:	gclient_t	*client;
;1575:	int		i;
;1576:	clientPersistant_t	saved;
;1577:	clientSession_t		savedSess;
;1578:	int		persistant[MAX_PERSISTANT];
;1579:	gentity_t	*spawnPoint;
;1580:	int		flags;
;1581:	int		savedPing;
;1582://	char	*savedAreaBits;
;1583:	int		accuracy_hits, accuracy_shots;
;1584:	int		eventSequence;
;1585://	char	userinfo[MAX_INFO_STRING];
;1586:	forcedata_t			savedForce;
;1587:	void		*ghoul2save;
;1588:	int		saveSaberNum = ENTITYNUM_NONE;
ADDRLP4 112
CNSTI4 1023
ASGNI4
line 1589
;1589:	int		wDisable = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 1591
;1590:
;1591:	index = ent - g_entities;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ASGNI4
line 1592
;1592:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1594
;1593:
;1594:	if (client->ps.fd.forceDoInit)
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
INDIRI4
CNSTI4 0
EQI4 $546
line 1595
;1595:	{ //force a reread of force powers
line 1596
;1596:		WP_InitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 1597
;1597:		client->ps.fd.forceDoInit = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 1598
;1598:	}
LABELV $546
line 1602
;1599:	// find a spawn point
;1600:	// do it before setting health back up, so farthest
;1601:	// ranging doesn't count this client
;1602:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $548
line 1603
;1603:		spawnPoint = SelectSpectatorSpawnPoint ( 
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 804
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 804
INDIRP4
ASGNP4
line 1605
;1604:						spawn_origin, spawn_angles);
;1605:	} else if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
ADDRGP4 $549
JUMPV
LABELV $548
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $554
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $550
LABELV $554
line 1607
;1606:		// all base oriented team games use the CTF spawn points
;1607:		spawnPoint = SelectCTFSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 808
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 808
INDIRP4
ASGNP4
line 1611
;1608:						client->sess.sessionTeam, 
;1609:						client->pers.teamState.state, 
;1610:						spawn_origin, spawn_angles);
;1611:	}
ADDRGP4 $551
JUMPV
LABELV $550
line 1612
;1612:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $555
line 1613
;1613:	{
line 1614
;1614:		spawnPoint = SelectSagaSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 808
ADDRGP4 SelectSagaSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 808
INDIRP4
ASGNP4
line 1618
;1615:						client->sess.sessionTeam, 
;1616:						client->pers.teamState.state, 
;1617:						spawn_origin, spawn_angles);
;1618:	}
ADDRGP4 $556
JUMPV
LABELV $555
line 1619
;1619:	else {
LABELV $558
line 1620
;1620:		do {
line 1622
;1621:			// the first spawn should be at a good looking spot
;1622:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 808
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1416
ADDP4
INDIRI4
ADDRLP4 808
INDIRI4
NEI4 $561
ADDRLP4 0
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
ADDRLP4 808
INDIRI4
EQI4 $561
line 1623
;1623:				client->pers.initialSpawn = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1416
ADDP4
CNSTI4 1
ASGNI4
line 1624
;1624:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 812
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 812
INDIRP4
ASGNP4
line 1625
;1625:			} else {
ADDRGP4 $562
JUMPV
LABELV $561
line 1627
;1626:				// don't spawn near existing origin if possible
;1627:				spawnPoint = SelectSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 812
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 812
INDIRP4
ASGNP4
line 1630
;1628:					client->ps.origin, 
;1629:					spawn_origin, spawn_angles);
;1630:			}
LABELV $562
line 1634
;1631:
;1632:			// Tim needs to prevent bots from spawning at the initial point
;1633:			// on q3dm0...
;1634:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 812
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 812
INDIRI4
EQI4 $563
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 812
INDIRI4
EQI4 $563
line 1635
;1635:				continue;	// try again
ADDRGP4 $559
JUMPV
LABELV $563
line 1638
;1636:			}
;1637:			// just to be symetric, we have a nohumans option...
;1638:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 816
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 816
INDIRI4
EQI4 $560
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 816
INDIRI4
NEI4 $560
line 1639
;1639:				continue;	// try again
line 1642
;1640:			}
;1641:
;1642:			break;
LABELV $559
line 1644
;1643:
;1644:		} while ( 1 );
ADDRGP4 $558
JUMPV
LABELV $560
line 1645
;1645:	}
LABELV $556
LABELV $551
LABELV $549
line 1646
;1646:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 1
ASGNI4
line 1650
;1647:
;1648:	// toggle the teleport bit so the client knows to not lerp
;1649:	// and never clear the voted flag
;1650:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1651
;1651:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1655
;1652:
;1653:	// clear everything but the persistant data
;1654:
;1655:	saved = client->pers;
ADDRLP4 116
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRB
ASGNB 152
line 1656
;1656:	savedSess = client->sess;
ADDRLP4 268
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRB
ASGNB 44
line 1657
;1657:	savedPing = client->ps.ping;
ADDRLP4 312
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
line 1659
;1658://	savedAreaBits = client->areabits;
;1659:	accuracy_hits = client->accuracy_hits;
ADDRLP4 316
ADDRLP4 0
INDIRP4
CNSTI4 1668
ADDP4
INDIRI4
ASGNI4
line 1660
;1660:	accuracy_shots = client->accuracy_shots;
ADDRLP4 320
ADDRLP4 0
INDIRP4
CNSTI4 1664
ADDP4
INDIRI4
ASGNI4
line 1661
;1661:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $567
line 1662
;1662:		persistant[i] = client->ps.persistant[i];
ADDRLP4 804
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 804
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 804
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1663
;1663:	}
LABELV $568
line 1661
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $567
line 1664
;1664:	eventSequence = client->ps.eventSequence;
ADDRLP4 324
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 1666
;1665:
;1666:	savedForce = client->ps.fd;
ADDRLP4 328
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRB
ASGNB 472
line 1668
;1667:
;1668:	ghoul2save = client->ghoul2;
ADDRLP4 800
ADDRLP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRP4
ASGNP4
line 1670
;1669:
;1670:	saveSaberNum = client->ps.saberEntityNum;
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 1672
;1671:
;1672:	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1800
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1675
;1673:
;1674:	//rww - Don't wipe the ghoul2 instance or the animation data
;1675:	client->ghoul2 = ghoul2save;
ADDRLP4 0
INDIRP4
CNSTI4 1728
ADDP4
ADDRLP4 800
INDIRP4
ASGNP4
line 1678
;1676:
;1677:	//or the saber ent num
;1678:	client->ps.saberEntityNum = saveSaberNum;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 112
INDIRI4
ASGNI4
line 1680
;1679:
;1680:	client->ps.fd = savedForce;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 328
INDIRB
ASGNB 472
line 1682
;1681:
;1682:	client->ps.duelIndex = ENTITYNUM_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 1296
ADDP4
CNSTI4 1023
ASGNI4
line 1684
;1683:
;1684:	client->pers = saved;
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
ADDRLP4 116
INDIRB
ASGNB 152
line 1685
;1685:	client->sess = savedSess;
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 268
INDIRB
ASGNB 44
line 1686
;1686:	client->ps.ping = savedPing;
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 312
INDIRI4
ASGNI4
line 1688
;1687://	client->areabits = savedAreaBits;
;1688:	client->accuracy_hits = accuracy_hits;
ADDRLP4 0
INDIRP4
CNSTI4 1668
ADDP4
ADDRLP4 316
INDIRI4
ASGNI4
line 1689
;1689:	client->accuracy_shots = accuracy_shots;
ADDRLP4 0
INDIRP4
CNSTI4 1664
ADDP4
ADDRLP4 320
INDIRI4
ASGNI4
line 1690
;1690:	client->lastkilled_client = -1;
ADDRLP4 0
INDIRP4
CNSTI4 1672
ADDP4
CNSTI4 -1
ASGNI4
line 1692
;1691:
;1692:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $571
line 1693
;1693:		client->ps.persistant[i] = persistant[i];
ADDRLP4 804
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 804
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDP4
ADDRLP4 804
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1694
;1694:	}
LABELV $572
line 1692
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $571
line 1695
;1695:	client->ps.eventSequence = eventSequence;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 324
INDIRI4
ASGNI4
line 1697
;1696:	// increment the spawncount so the client will detect the respawn
;1697:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 804
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 804
INDIRP4
ADDRLP4 804
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1698
;1698:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1700
;1699:
;1700:	client->airOutTime = level.time + 12000;
ADDRLP4 0
INDIRP4
CNSTI4 1700
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1704
;1701:
;1702://	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
;1703:	// set max health
;1704:	client->pers.maxHealth = 100;//atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 100
ASGNI4
line 1705
;1705:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 812
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
ADDRLP4 812
INDIRI4
CNSTI4 1
LTI4 $578
ADDRLP4 812
INDIRI4
CNSTI4 100
LEI4 $576
LABELV $578
line 1706
;1706:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 100
ASGNI4
line 1707
;1707:	}
LABELV $576
line 1709
;1708:	// clear entity values
;1709:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
line 1710
;1710:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
line 1712
;1711:
;1712:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1023
ASGNI4
line 1713
;1713:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 1800
ADDRLP4 104
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1714
;1714:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 1715
;1715:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 1716
;1716:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $579
ASGNP4
line 1717
;1717:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 256
ASGNI4
line 1718
;1718:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 273
ASGNI4
line 1719
;1719:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 player_die
ASGNP4
line 1720
;1720:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 1721
;1721:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 0
ASGNI4
line 1722
;1722:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 0
ASGNI4
line 1724
;1723:	
;1724:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1725
;1725:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1727
;1726:
;1727:	client->ps.clientNum = index;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1729
;1728:	//give default weapons
;1729:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_NONE );
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 1
ASGNI4
line 1731
;1730:
;1731:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $580
line 1732
;1732:	{
line 1733
;1733:		wDisable = g_duelWeaponDisable.integer;
ADDRLP4 76
ADDRGP4 g_duelWeaponDisable+12
INDIRI4
ASGNI4
line 1734
;1734:	}
ADDRGP4 $581
JUMPV
LABELV $580
line 1736
;1735:	else
;1736:	{
line 1737
;1737:		wDisable = g_weaponDisable.integer;
ADDRLP4 76
ADDRGP4 g_weaponDisable+12
INDIRI4
ASGNI4
line 1738
;1738:	}
LABELV $581
line 1742
;1739:
;1740:
;1741:
;1742:	if ( g_gametype.integer != GT_HOLOCRON 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $585
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $585
ADDRLP4 820
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 820
INDIRI4
CNSTI4 0
NEI4 $585
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 824
ADDRGP4 AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 828
CNSTI4 0
ASGNI4
ADDRLP4 824
INDIRI4
ADDRLP4 828
INDIRI4
NEI4 $585
ADDRGP4 g_trueJedi+12
INDIRI4
ADDRLP4 828
INDIRI4
EQI4 $585
line 1747
;1743:		&& g_gametype.integer != GT_JEDIMASTER 
;1744:		&& !HasSetSaberOnly()
;1745:		&& !AllForceDisabled( g_forcePowerDisable.integer )
;1746:		&& g_trueJedi.integer )
;1747:	{
line 1748
;1748:		if ( g_gametype.integer >= GT_TEAM && (client->sess.sessionTeam == TEAM_BLUE || client->sess.sessionTeam == TEAM_RED) )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $591
ADDRLP4 832
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 832
INDIRI4
CNSTI4 2
EQI4 $594
ADDRLP4 832
INDIRI4
CNSTI4 1
NEI4 $591
LABELV $594
line 1749
;1749:		{//In Team games, force one side to be merc and other to be jedi
line 1750
;1750:			if ( level.numPlayingClients > 0 )
ADDRGP4 level+80
INDIRI4
CNSTI4 0
LEI4 $595
line 1751
;1751:			{//already someone in the game
line 1752
;1752:				int		i, forceTeam = TEAM_SPECTATOR;
ADDRLP4 840
CNSTI4 3
ASGNI4
line 1753
;1753:				for ( i = 0 ; i < level.maxclients ; i++ ) 
ADDRLP4 836
CNSTI4 0
ASGNI4
ADDRGP4 $601
JUMPV
LABELV $598
line 1754
;1754:				{
line 1755
;1755:					if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $603
line 1756
;1756:						continue;
ADDRGP4 $599
JUMPV
LABELV $603
line 1758
;1757:					}
;1758:					if ( level.clients[i].sess.sessionTeam == TEAM_BLUE || level.clients[i].sess.sessionTeam == TEAM_RED ) 
ADDRLP4 844
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 844
INDIRI4
CNSTI4 2
EQI4 $607
ADDRLP4 844
INDIRI4
CNSTI4 1
NEI4 $605
LABELV $607
line 1759
;1759:					{//in-game
line 1760
;1760:						if ( WP_HasForcePowers( &level.clients[i].ps ) )
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRLP4 848
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 848
INDIRI4
CNSTI4 0
EQI4 $608
line 1761
;1761:						{//this side is using force
line 1762
;1762:							forceTeam = level.clients[i].sess.sessionTeam;
ADDRLP4 840
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1763
;1763:						}
ADDRGP4 $600
JUMPV
LABELV $608
line 1765
;1764:						else
;1765:						{//other team is using force
line 1766
;1766:							if ( level.clients[i].sess.sessionTeam == TEAM_BLUE )
CNSTI4 1800
ADDRLP4 836
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 2
NEI4 $610
line 1767
;1767:							{
line 1768
;1768:								forceTeam = TEAM_RED;
ADDRLP4 840
CNSTI4 1
ASGNI4
line 1769
;1769:							}
ADDRGP4 $600
JUMPV
LABELV $610
line 1771
;1770:							else
;1771:							{
line 1772
;1772:								forceTeam = TEAM_BLUE;
ADDRLP4 840
CNSTI4 2
ASGNI4
line 1773
;1773:							}
line 1774
;1774:						}
line 1775
;1775:						break;
ADDRGP4 $600
JUMPV
LABELV $605
line 1777
;1776:					}
;1777:				}
LABELV $599
line 1753
ADDRLP4 836
ADDRLP4 836
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $601
ADDRLP4 836
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $598
LABELV $600
line 1778
;1778:				if ( WP_HasForcePowers( &client->ps ) && client->sess.sessionTeam != forceTeam )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 844
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 844
INDIRI4
CNSTI4 0
EQI4 $612
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ADDRLP4 840
INDIRI4
EQI4 $612
line 1779
;1779:				{//using force but not on right team, switch him over
line 1780
;1780:					const char *teamName = TeamName( forceTeam );
ADDRLP4 840
INDIRI4
ARGI4
ADDRLP4 852
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRLP4 848
ADDRLP4 852
INDIRP4
ASGNP4
line 1782
;1781:					//client->sess.sessionTeam = forceTeam;
;1782:					SetTeam( ent, (char *)teamName );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 848
INDIRP4
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1783
;1783:					return;
ADDRGP4 $545
JUMPV
LABELV $612
line 1785
;1784:				}
;1785:			}
LABELV $595
line 1786
;1786:		}
LABELV $591
line 1788
;1787:
;1788:		if ( WP_HasForcePowers( &client->ps ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 836
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $614
line 1789
;1789:		{
line 1790
;1790:			client->ps.trueNonJedi = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1791
;1791:			client->ps.trueJedi = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1793
;1792:			//make sure they only use the saber
;1793:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1794
;1794:			client->ps.stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 1795
;1795:		}
ADDRGP4 $586
JUMPV
LABELV $614
line 1797
;1796:		else
;1797:		{//no force powers set
line 1798
;1798:			client->ps.trueNonJedi = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 1
ASGNI4
line 1799
;1799:			client->ps.trueJedi = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1800
;1800:			if (!wDisable || !(wDisable & (1 << WP_BRYAR_PISTOL)))
ADDRLP4 844
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 844
INDIRI4
EQI4 $618
ADDRLP4 76
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 844
INDIRI4
NEI4 $616
LABELV $618
line 1801
;1801:			{
line 1802
;1802:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 848
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 848
INDIRP4
ADDRLP4 848
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1803
;1803:			}
LABELV $616
line 1804
;1804:			if (!wDisable || !(wDisable & (1 << WP_BLASTER)))
ADDRLP4 852
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 852
INDIRI4
EQI4 $621
ADDRLP4 76
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 852
INDIRI4
NEI4 $619
LABELV $621
line 1805
;1805:			{
line 1806
;1806:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BLASTER );
ADDRLP4 856
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 856
INDIRP4
ADDRLP4 856
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1807
;1807:			}
LABELV $619
line 1808
;1808:			if (!wDisable || !(wDisable & (1 << WP_BOWCASTER)))
ADDRLP4 860
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 860
INDIRI4
EQI4 $624
ADDRLP4 76
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 860
INDIRI4
NEI4 $622
LABELV $624
line 1809
;1809:			{
line 1810
;1810:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BOWCASTER );
ADDRLP4 864
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 864
INDIRP4
ADDRLP4 864
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1811
;1811:			}
LABELV $622
line 1812
;1812:			client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
ADDRLP4 864
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 864
INDIRP4
ADDRLP4 864
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1813
;1813:			client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 868
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 868
INDIRP4
ADDRLP4 868
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1814
;1814:			client->ps.ammo[AMMO_POWERCELL] = ammoData[AMMO_POWERCELL].max;
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRGP4 ammoData+12
INDIRI4
ASGNI4
line 1815
;1815:			client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1816
;1816:		}
line 1817
;1817:	}
ADDRGP4 $586
JUMPV
LABELV $585
line 1819
;1818:	else
;1819:	{//jediVmerc is incompatible with this gametype, turn it off!
line 1820
;1820:		trap_Cvar_Set( "g_jediVmerc", "0" );
ADDRGP4 $626
ARGP4
ADDRGP4 $80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1821
;1821:		if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $627
line 1822
;1822:		{
line 1824
;1823:			//always get free saber level 1 in holocron
;1824:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 832
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 832
INDIRP4
ADDRLP4 832
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1825
;1825:		}
ADDRGP4 $628
JUMPV
LABELV $627
line 1827
;1826:		else
;1827:		{
line 1828
;1828:			if (client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 0
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 0
EQI4 $630
line 1829
;1829:			{
line 1830
;1830:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 832
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 832
INDIRP4
ADDRLP4 832
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1831
;1831:			}
ADDRGP4 $631
JUMPV
LABELV $630
line 1833
;1832:			else
;1833:			{ //if you don't have saber attack rank then you don't get a saber
line 1834
;1834:				client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 832
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 832
INDIRP4
ADDRLP4 832
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1835
;1835:			}
LABELV $631
line 1836
;1836:		}
LABELV $628
line 1838
;1837:
;1838:		if (!wDisable || !(wDisable & (1 << WP_BRYAR_PISTOL)))
ADDRLP4 836
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 836
INDIRI4
EQI4 $634
ADDRLP4 76
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 836
INDIRI4
NEI4 $632
LABELV $634
line 1839
;1839:		{
line 1840
;1840:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 840
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 840
INDIRP4
ADDRLP4 840
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1841
;1841:		}
ADDRGP4 $633
JUMPV
LABELV $632
line 1842
;1842:		else if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $635
line 1843
;1843:		{
line 1844
;1844:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 840
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 840
INDIRP4
ADDRLP4 840
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1845
;1845:		}
LABELV $635
LABELV $633
line 1847
;1846:
;1847:		if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $638
line 1848
;1848:		{
line 1849
;1849:			client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
ADDRLP4 840
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 840
INDIRP4
ADDRLP4 840
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1850
;1850:			client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 844
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 844
INDIRP4
ADDRLP4 844
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1851
;1851:		}
LABELV $638
line 1853
;1852:
;1853:		if (client->ps.stats[STAT_WEAPONS] & (1 << WP_BRYAR_PISTOL))
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $641
line 1854
;1854:		{
line 1855
;1855:			client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1856
;1856:		}
ADDRGP4 $642
JUMPV
LABELV $641
line 1857
;1857:		else if (client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $643
line 1858
;1858:		{
line 1859
;1859:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1860
;1860:		}
ADDRGP4 $644
JUMPV
LABELV $643
line 1862
;1861:		else
;1862:		{
line 1863
;1863:			client->ps.weapon = WP_STUN_BATON;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1864
;1864:		}
LABELV $644
LABELV $642
line 1865
;1865:	}
LABELV $586
line 1872
;1866:
;1867:	/*
;1868:	client->ps.stats[STAT_HOLDABLE_ITEMS] |= ( 1 << HI_BINOCULARS );
;1869:	client->ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_BINOCULARS, IT_HOLDABLE);
;1870:	*/
;1871:
;1872:	client->ps.stats[STAT_HOLDABLE_ITEMS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 1873
;1873:	client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 1875
;1874:
;1875:	if ( client->sess.sessionTeam == TEAM_SPECTATOR )
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $645
line 1876
;1876:	{
line 1877
;1877:		client->ps.stats[STAT_WEAPONS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 0
ASGNI4
line 1878
;1878:		client->ps.stats[STAT_HOLDABLE_ITEMS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 1879
;1879:		client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 1880
;1880:	}
LABELV $645
line 1882
;1881:
;1882:	client->ps.ammo[AMMO_BLASTER] = 100; //ammoData[AMMO_BLASTER].max; //100 seems fair.
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 100
ASGNI4
line 1895
;1883://	client->ps.ammo[AMMO_POWERCELL] = ammoData[AMMO_POWERCELL].max;
;1884://	client->ps.ammo[AMMO_FORCE] = ammoData[AMMO_FORCE].max;
;1885://	client->ps.ammo[AMMO_METAL_BOLTS] = ammoData[AMMO_METAL_BOLTS].max;
;1886://	client->ps.ammo[AMMO_ROCKETS] = ammoData[AMMO_ROCKETS].max;
;1887:/*
;1888:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_BRYAR_PISTOL);
;1889:	if ( g_gametype.integer == GT_TEAM ) {
;1890:		client->ps.ammo[WP_BRYAR_PISTOL] = 50;
;1891:	} else {
;1892:		client->ps.ammo[WP_BRYAR_PISTOL] = 100;
;1893:	}
;1894:*/
;1895:	client->ps.rocketLockIndex = MAX_CLIENTS;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 1896
;1896:	client->ps.rocketLockTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 1907
;1897:
;1898:	//rww - Set here to initialize the circling seeker drone to off.
;1899:	//A quick note about this so I don't forget how it works again:
;1900:	//ps.genericEnemyIndex is kept in sync between the server and client.
;1901:	//When it gets set then an entitystate value of the same name gets
;1902:	//set along with an entitystate flag in the shared bg code. Which
;1903:	//is why a value needs to be both on the player state and entity state.
;1904:	//(it doesn't seem to just carry over the entitystate value automatically
;1905:	//because entity state value is derived from player state data or some
;1906:	//such)
;1907:	client->ps.genericEnemyIndex = -1;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 1909
;1908:
;1909:	client->ps.isJediMaster = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 1911
;1910:
;1911:	client->ps.fallingToDeath = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1352
ADDP4
CNSTI4 0
ASGNI4
line 1914
;1912:
;1913:	//Do per-spawn force power initialization
;1914:	WP_SpawnInitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_SpawnInitForcePowers
CALLV
pop
line 1917
;1915:
;1916:	// health will count down towards max_health
;1917:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] * 1.25;
ADDRLP4 836
CNSTF4 1067450368
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 836
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 836
INDIRI4
ASGNI4
line 1920
;1918:
;1919:	// Start with a small amount of armor as well.
;1920:	client->ps.stats[STAT_ARMOR] = client->ps.stats[STAT_MAX_HEALTH] * 0.25;
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
CNSTF4 1048576000
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1922
;1921:
;1922:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1923
;1923:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 80
INDIRB
ASGNB 12
line 1926
;1924:
;1925:	// the respawned flag will be cleared after the attack and jump keys come up
;1926:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 844
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 844
INDIRP4
ADDRLP4 844
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1928
;1927:
;1928:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1800
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1929
;1929:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1931
;1930:
;1931:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $647
line 1933
;1932:
;1933:	} else {
ADDRGP4 $648
JUMPV
LABELV $647
line 1934
;1934:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 1935
;1935:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1938
;1936:
;1937:		// force the base weapon up
;1938:		client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1939
;1939:		client->ps.weaponstate = FIRST_WEAPON;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 1941
;1940:
;1941:	}
LABELV $648
line 1944
;1942:
;1943:	// don't allow full run speed for a bit
;1944:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 848
INDIRP4
ADDRLP4 848
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1945
;1945:	client->ps.pm_time = 100;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1947
;1946:
;1947:	client->respawnTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1948
;1948:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 1688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1949
;1949:	client->latched_buttons = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1604
ADDP4
CNSTI4 0
ASGNI4
line 1952
;1950:
;1951:	// set default animations
;1952:	client->ps.torsoAnim = WeaponReadyAnim[client->ps.weapon];
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ASGNI4
line 1953
;1953:	client->ps.legsAnim = WeaponReadyAnim[client->ps.weapon];
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ASGNI4
line 1955
;1954:
;1955:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $652
line 1956
;1956:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1957
;1957:	} else {
ADDRGP4 $653
JUMPV
LABELV $652
line 1959
;1958:		// fire the targets of the spawn point
;1959:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1963
;1960:
;1961:		// select the highest weapon number available, after any
;1962:		// spawn given items have fired
;1963:		client->ps.weapon = 1;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1964
;1964:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 4
CNSTI4 15
ASGNI4
LABELV $655
line 1965
;1965:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $659
line 1966
;1966:				client->ps.weapon = i;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1967
;1967:				break;
ADDRGP4 $657
JUMPV
LABELV $659
line 1969
;1968:			}
;1969:		}
LABELV $656
line 1964
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $655
LABELV $657
line 1970
;1970:	}
LABELV $653
line 1974
;1971:
;1972:	// run a client frame to drop exactly to the floor,
;1973:	// initialize animations and other things
;1974:	client->ps.commandTime = level.time - 100;
ADDRLP4 0
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1975
;1975:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1976
;1976:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 1979
;1977:
;1978:	// positively link the client, even if the command times are weird
;1979:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $663
line 1980
;1980:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1981
;1981:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 860
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 860
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 860
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1982
;1982:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1983
;1983:	}
LABELV $663
line 1985
;1984:
;1985:	if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $665
line 1986
;1986:	{
line 1987
;1987:		ent->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 860
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 860
INDIRP4
ADDRLP4 860
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 1988
;1988:		ent->client->invulnerableTimer = level.time + g_spawnInvulnerability.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDI4
ASGNI4
line 1989
;1989:	}
LABELV $665
line 1992
;1990:
;1991:	// run the presend to set anything else
;1992:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1995
;1993:
;1994:	// clear entity state values
;1995:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1996
;1996:}
LABELV $545
endproc ClientSpawn 872 16
export ClientDisconnect
proc ClientDisconnect 24 8
line 2011
;1997:
;1998:
;1999:/*
;2000:===========
;2001:ClientDisconnect
;2002:
;2003:Called when a player drops from the server.
;2004:Will not be called between levels.
;2005:
;2006:This should NOT be called directly by any game logic,
;2007:call trap_DropClient(), which will call this and do
;2008:server system housekeeping.
;2009:============
;2010:*/
;2011:void ClientDisconnect( int clientNum ) {
line 2018
;2012:	gentity_t	*ent;
;2013:	gentity_t	*tent;
;2014:	int			i;
;2015:
;2016:	// cleanup if we are kicking a bot that
;2017:	// hasn't spawned yet
;2018:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 2020
;2019:
;2020:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2021
;2021:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $671
line 2022
;2022:		return;
ADDRGP4 $670
JUMPV
LABELV $671
line 2025
;2023:	}
;2024:
;2025:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $674
JUMPV
LABELV $673
line 2028
;2026:
;2027:	while (i < NUM_FORCE_POWERS)
;2028:	{
line 2029
;2029:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRLP4 4
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
EQI4 $676
line 2030
;2030:		{
line 2031
;2031:			WP_ForcePowerStop(ent, i);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 2032
;2032:		}
LABELV $676
line 2033
;2033:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2034
;2034:	}
LABELV $674
line 2027
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $673
line 2036
;2035:
;2036:	i = TRACK_CHANNEL_1;
ADDRLP4 0
CNSTI4 51
ASGNI4
ADDRGP4 $679
JUMPV
LABELV $678
line 2039
;2037:
;2038:	while (i < NUM_TRACK_CHANNELS)
;2039:	{
line 2040
;2040:		if (ent->client->ps.fd.killSoundEntIndex[i-50] && ent->client->ps.fd.killSoundEntIndex[i-50] < MAX_GENTITIES && ent->client->ps.fd.killSoundEntIndex[i-50] > 0)
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $681
ADDRLP4 12
INDIRI4
CNSTI4 1024
GEI4 $681
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $681
line 2041
;2041:		{
line 2042
;2042:			G_MuteSound(ent->client->ps.fd.killSoundEntIndex[i-50], CHAN_VOICE);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2043
;2043:		}
LABELV $681
line 2044
;2044:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2045
;2045:	}
LABELV $679
line 2038
ADDRLP4 0
INDIRI4
CNSTI4 56
LTI4 $678
line 2046
;2046:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2049
;2047:
;2048:	// stop any following clients
;2049:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $686
JUMPV
LABELV $683
line 2050
;2050:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 12
CNSTI4 1800
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
NEI4 $688
ADDRLP4 12
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 2
NEI4 $688
ADDRLP4 12
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $688
line 2052
;2051:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;2052:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 2053
;2053:			StopFollowing( &g_entities[i] );
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 2054
;2054:		}
LABELV $688
line 2055
;2055:	}
LABELV $684
line 2049
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $686
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $683
line 2058
;2056:
;2057:	// send effect if they were completely connected
;2058:	if ( ent->client->pers.connected == CON_CONNECTED 
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $690
ADDRLP4 12
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 3
EQI4 $690
line 2059
;2059:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 2060
;2060:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2061
;2061:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 20
CNSTI4 220
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 2065
;2062:
;2063:		// They don't get to take powerups with them!
;2064:		// Especially important for stuff like CTF flags
;2065:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 2066
;2066:	}
LABELV $690
line 2068
;2067:
;2068:	G_LogPrintf( "ClientDisconnect: %i\n", clientNum );
ADDRGP4 $692
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2071
;2069:
;2070:	// if we are playing in tourney mode, give a win to the other player and clear his frags for this round
;2071:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $693
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 level+9008
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $693
ADDRGP4 level+16
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $693
line 2073
;2072:		&& !level.intermissiontime
;2073:		&& !level.warmupTime ) {
line 2074
;2074:		if ( level.sortedClients[1] == clientNum ) {
ADDRGP4 level+84+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $698
line 2075
;2075:			level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] = 0;
CNSTI4 1800
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 2076
;2076:			level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 20
CNSTI4 1800
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1548
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
line 2077
;2077:			ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2078
;2078:		}
ADDRGP4 $699
JUMPV
LABELV $698
line 2079
;2079:		else if ( level.sortedClients[0] == clientNum ) {
ADDRGP4 level+84
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $705
line 2080
;2080:			level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE] = 0;
CNSTI4 1800
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 2081
;2081:			level.clients[ level.sortedClients[1] ].sess.wins++;
ADDRLP4 20
CNSTI4 1800
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1548
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
line 2082
;2082:			ClientUserinfoChanged( level.sortedClients[1] );
ADDRGP4 level+84+4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2083
;2083:		}
LABELV $705
LABELV $699
line 2084
;2084:	}
LABELV $693
line 2086
;2085:
;2086:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2087
;2087:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 2088
;2088:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 2089
;2089:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $714
ASGNP4
line 2090
;2090:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 0
ASGNI4
line 2091
;2091:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 0
ASGNI4
line 2092
;2092:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 0
ASGNI4
line 2094
;2093:
;2094:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $715
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2096
;2095:
;2096:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2098
;2097:
;2098:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $716
line 2099
;2099:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 2100
;2100:	}
LABELV $716
line 2102
;2101:
;2102:	G_ClearClientLog(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_ClearClientLog
CALLV
pop
line 2103
;2103:}
LABELV $670
endproc ClientDisconnect 24 8
import WP_HasForcePowers
import G_WriteClientSessionData
bss
export Client_Force
align 4
LABELV Client_Force
skip 15104
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
import WP_SaberInitBladeData
import WP_SaberCanBlock
import WP_SaberPositionUpdate
import WP_ForcePowerStop
import HasSetSaberOnly
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
import CalculateRanks
import AddScore
import player_die
import BeginIntermission
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
LABELV $715
char 1 0
align 1
LABELV $714
char 1 100
char 1 105
char 1 115
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $692
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 68
char 1 105
char 1 115
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $626
char 1 103
char 1 95
char 1 106
char 1 101
char 1 100
char 1 105
char 1 86
char 1 109
char 1 101
char 1 114
char 1 99
char 1 0
align 1
LABELV $579
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $535
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 66
char 1 101
char 1 103
char 1 105
char 1 110
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $534
char 1 80
char 1 76
char 1 69
char 1 78
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $528
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $527
char 1 114
char 1 116
char 1 105
char 1 98
char 1 105
char 1 97
char 1 0
align 1
LABELV $526
char 1 108
char 1 116
char 1 105
char 1 98
char 1 105
char 1 97
char 1 0
align 1
LABELV $525
char 1 114
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $524
char 1 108
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $523
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
LABELV $507
char 1 66
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $502
char 1 82
char 1 101
char 1 100
char 1 0
align 1
LABELV $492
char 1 80
char 1 76
char 1 67
char 1 79
char 1 78
char 1 78
char 1 69
char 1 67
char 1 84
char 1 0
align 1
LABELV $491
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 94
char 1 55
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $488
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 67
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $487
char 1 66
char 1 111
char 1 116
char 1 67
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 102
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 0
align 1
LABELV $475
char 1 73
char 1 78
char 1 86
char 1 65
char 1 76
char 1 73
char 1 68
char 1 95
char 1 80
char 1 65
char 1 83
char 1 83
char 1 87
char 1 79
char 1 82
char 1 68
char 1 0
align 1
LABELV $472
char 1 110
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $467
char 1 112
char 1 97
char 1 115
char 1 115
char 1 119
char 1 111
char 1 114
char 1 100
char 1 0
align 1
LABELV $463
char 1 66
char 1 97
char 1 110
char 1 110
char 1 101
char 1 100
char 1 46
char 1 0
align 1
LABELV $459
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 85
char 1 115
char 1 101
char 1 114
char 1 105
char 1 110
char 1 102
char 1 111
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 58
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $455
char 1 110
char 1 92
char 1 37
char 1 115
char 1 92
char 1 116
char 1 92
char 1 37
char 1 105
char 1 92
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 92
char 1 37
char 1 115
char 1 92
char 1 103
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 92
char 1 37
char 1 115
char 1 92
char 1 103
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 49
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 50
char 1 92
char 1 37
char 1 115
char 1 92
char 1 104
char 1 99
char 1 92
char 1 37
char 1 105
char 1 92
char 1 119
char 1 92
char 1 37
char 1 105
char 1 92
char 1 108
char 1 92
char 1 37
char 1 105
char 1 92
char 1 116
char 1 116
char 1 92
char 1 37
char 1 100
char 1 92
char 1 116
char 1 108
char 1 92
char 1 37
char 1 100
char 1 0
align 1
LABELV $454
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $453
char 1 110
char 1 92
char 1 37
char 1 115
char 1 92
char 1 116
char 1 92
char 1 37
char 1 105
char 1 92
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 49
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 50
char 1 92
char 1 37
char 1 115
char 1 92
char 1 104
char 1 99
char 1 92
char 1 37
char 1 105
char 1 92
char 1 119
char 1 92
char 1 37
char 1 105
char 1 92
char 1 108
char 1 92
char 1 37
char 1 105
char 1 92
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 92
char 1 37
char 1 115
char 1 92
char 1 116
char 1 116
char 1 92
char 1 37
char 1 100
char 1 92
char 1 116
char 1 108
char 1 92
char 1 37
char 1 100
char 1 0
align 1
LABELV $450
char 1 103
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $449
char 1 103
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $448
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 50
char 1 0
align 1
LABELV $447
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 49
char 1 0
align 1
LABELV $446
char 1 116
char 1 101
char 1 97
char 1 109
char 1 116
char 1 97
char 1 115
char 1 107
char 1 0
align 1
LABELV $442
char 1 116
char 1 101
char 1 97
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $437
char 1 98
char 1 0
align 1
LABELV $436
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $432
char 1 114
char 1 0
align 1
LABELV $431
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $428
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $422
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
LABELV $421
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $420
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $413
char 1 80
char 1 76
char 1 82
char 1 69
char 1 78
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $412
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 94
char 1 55
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $407
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 98
char 1 111
char 1 97
char 1 114
char 1 100
char 1 0
align 1
LABELV $402
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $399
char 1 99
char 1 103
char 1 95
char 1 112
char 1 114
char 1 101
char 1 100
char 1 105
char 1 99
char 1 116
char 1 73
char 1 116
char 1 101
char 1 109
char 1 115
char 1 0
align 1
LABELV $398
char 1 108
char 1 111
char 1 99
char 1 97
char 1 108
char 1 104
char 1 111
char 1 115
char 1 116
char 1 0
align 1
LABELV $395
char 1 105
char 1 112
char 1 0
align 1
LABELV $394
char 1 92
char 1 110
char 1 97
char 1 109
char 1 101
char 1 92
char 1 98
char 1 97
char 1 100
char 1 105
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $388
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 0
align 1
LABELV $382
char 1 99
char 1 114
char 1 97
char 1 110
char 1 105
char 1 117
char 1 109
char 1 0
align 1
LABELV $380
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
LABELV $378
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
LABELV $377
char 1 42
char 1 108
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $376
char 1 42
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $371
char 1 47
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $368
char 1 70
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 108
char 1 111
char 1 97
char 1 100
char 1 32
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $367
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 95
char 1 104
char 1 117
char 1 109
char 1 97
char 1 110
char 1 111
char 1 105
char 1 100
char 1 47
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $356
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 107
char 1 121
char 1 108
char 1 101
char 1 47
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $349
char 1 80
char 1 97
char 1 100
char 1 97
char 1 119
char 1 97
char 1 110
char 1 0
align 1
LABELV $245
char 1 98
char 1 111
char 1 100
char 1 121
char 1 113
char 1 117
char 1 101
char 1 0
align 1
LABELV $225
char 1 67
char 1 111
char 1 117
char 1 108
char 1 100
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 97
char 1 32
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 32
char 1 112
char 1 111
char 1 105
char 1 110
char 1 116
char 1 0
align 1
LABELV $149
char 1 66
char 1 69
char 1 67
char 1 79
char 1 77
char 1 69
char 1 74
char 1 77
char 1 0
align 1
LABELV $148
char 1 83
char 1 86
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $147
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $141
char 1 37
char 1 105
char 1 0
align 1
LABELV $108
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
LABELV $103
char 1 45
char 1 49
char 1 0
align 1
LABELV $87
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $83
char 1 110
char 1 111
char 1 104
char 1 117
char 1 109
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $80
char 1 48
char 1 0
align 1
LABELV $79
char 1 110
char 1 111
char 1 98
char 1 111
char 1 116
char 1 115
char 1 0
