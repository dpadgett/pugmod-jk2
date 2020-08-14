data
export cg_customSoundNames
align 4
LABELV cg_customSoundNames
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
address $129
address $130
address $131
address $132
address $133
address $128
address $134
skip 64
export CG_CustomSound
code
proc CG_CustomSound 16 8
file "../cg_players.c"
line 35
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_players.c -- handle the media and animation for player entities
;4:#include "cg_local.h"
;5:#include "..\ghoul2\g2.h"
;6:
;7:extern stringID_table_t animTable [MAX_ANIMATIONS+1];
;8:
;9:char	*cg_customSoundNames[MAX_CUSTOM_SOUNDS] = {
;10:	"*death1.wav",
;11:	"*death2.wav",
;12:	"*death3.wav",
;13:	"*jump1.wav",
;14:	"*pain25.wav",
;15:	"*pain50.wav",
;16:	"*pain75.wav",
;17:	"*pain100.wav",
;18:	"*falling1.wav",
;19:	"*choke1.wav",
;20:	"*choke2.wav",
;21:	"*choke3.wav",
;22:	"*gasp.wav",
;23:	"*land1.wav",
;24:	"*falling1.wav",
;25:	"*taunt.wav"
;26:};
;27:
;28:
;29:/*
;30:================
;31:CG_CustomSound
;32:
;33:================
;34:*/
;35:sfxHandle_t	CG_CustomSound( int clientNum, const char *soundName ) {
line 39
;36:	clientInfo_t *ci;
;37:	int			i;
;38:
;39:	if ( soundName[0] != '*' ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $136
line 40
;40:		return trap_S_RegisterSound( soundName );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $135
JUMPV
LABELV $136
line 43
;41:	}
;42:
;43:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $140
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $138
LABELV $140
line 44
;44:		clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 45
;45:	}
LABELV $138
line 46
;46:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
CNSTI4 788
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 48
;47:
;48:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i] ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $142
line 49
;49:		if ( !strcmp( soundName, cg_customSoundNames[i] ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $146
line 50
;50:			return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 652
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $135
JUMPV
LABELV $146
line 52
;51:		}
;52:	}
LABELV $143
line 48
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $145
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $142
LABELV $148
line 54
;53:
;54:	CG_Error( "Unknown custom sound: %s", soundName );
ADDRGP4 $149
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 55
;55:	return 0;
CNSTI4 0
RETI4
LABELV $135
endproc CG_CustomSound 16 8
export CG_NeedAnimSequence
proc CG_NeedAnimSequence 12 0
line 79
;56:}
;57:
;58:
;59:
;60:/*
;61:=============================================================================
;62:
;63:CLIENT INFO
;64:
;65:=============================================================================
;66:*/
;67:
;68:/*
;69:==========================
;70:CG_NeedAnimSequence
;71:
;72:Called to check if models are missing required animation sequences
;73:We do not list all used animations here but this check should eliminate
;74:a broad range of unsupported models. At least the ones that are included,
;75:which is all we really care about.
;76:==========================
;77:*/
;78:qboolean CG_NeedAnimSequence(int anim)
;79:{
line 80
;80:	if (anim >= BOTH_DEATH1 &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $151
ADDRLP4 0
INDIRI4
CNSTI4 19
GTI4 $151
line 82
;81:		anim <= BOTH_DEATH19)
;82:	{
line 83
;83:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $150
JUMPV
LABELV $151
line 86
;84:	}
;85:
;86:	if (anim >= BOTH_DISMEMBER_HEAD1 &&
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 91
LTI4 $153
ADDRLP4 4
INDIRI4
CNSTI4 96
GTI4 $153
line 88
;87:		anim <= BOTH_DISMEMBER_LARM)
;88:	{
line 89
;89:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $150
JUMPV
LABELV $153
line 92
;90:	}
;91:
;92:	if (anim >= BOTH_A1_T__B_ &&
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 138
LTI4 $155
ADDRLP4 8
INDIRI4
CNSTI4 547
GTI4 $155
line 94
;93:		anim <= BOTH_H1_S1_BR)
;94:	{
line 95
;95:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $150
JUMPV
LABELV $155
line 98
;96:	}
;97:
;98:	return qfalse;
CNSTI4 0
RETI4
LABELV $150
endproc CG_NeedAnimSequence 12 0
proc CG_IsValidCharacterModel 20 8
line 104
;99:}
;100:
;101://To see if the client is trying to use one of the included skins not meant for MP.
;102://I don't much care for hardcoded strings, but this seems the best way to go.
;103:static qboolean CG_IsValidCharacterModel(const char *modelName, const char *skinName)
;104:{
line 105
;105:	if (!Q_stricmp(modelName, "kyle"))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $158
line 106
;106:	{
line 107
;107:		if (!Q_stricmp(skinName, "fpls"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $161
line 108
;108:		{
line 109
;109:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $161
line 111
;110:		}
;111:		else if (!Q_stricmp(skinName, "fpls2"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $164
line 112
;112:		{
line 113
;113:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $164
line 115
;114:		}
;115:		else if (!Q_stricmp(skinName, "fpls3"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $169
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $159
line 116
;116:		{
line 117
;117:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
line 119
;118:		}
;119:	}
LABELV $158
line 120
;120:	else if (!Q_stricmp(modelName, "morgan"))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $170
line 121
;121:	{
line 126
;122:		//For morgan, we want to deny if the skin is anything but one of the valid ones
;123:		//Since his default skin is actually the bad one, you could just type
;124:		//"model morgan/blah" and get it. This rules out custom morgan skins without
;125:		//programming assistance unfortunately.
;126:		if (Q_stricmp(skinName, "default_mp") &&
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $173
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $173
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $173
line 129
;127:			Q_stricmp(skinName, "red") &&
;128:			Q_stricmp(skinName, "blue"))
;129:		{
line 130
;130:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $173
line 132
;131:		}
;132:	}
LABELV $170
LABELV $159
line 134
;133:
;134:	return qtrue;
CNSTI4 1
RETI4
LABELV $157
endproc CG_IsValidCharacterModel 20 8
export CG_ParseSurfsFile
proc CG_ParseSurfsFile 20112 20
line 139
;135:}
;136:
;137:#define MAX_SURF_LIST_SIZE	1024
;138:qboolean CG_ParseSurfsFile( const char *modelName, const char *skinName, char *surfOff, char *surfOn ) 
;139:{
line 149
;140:	const char	*text_p;
;141:	int			len;
;142:	const char	*token;
;143:	const char	*value;
;144:	char		text[20000];
;145:	char		sfilename[MAX_QPATH];
;146:	fileHandle_t	f;
;147:	
;148:	// Load and parse .surf file
;149:	Com_sprintf( sfilename, sizeof( sfilename ), "models/players/%s/model_%s.surf", modelName, skinName );
ADDRLP4 20016
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $179
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 152
;150:
;151:	// load the file
;152:	len = trap_FS_FOpenFile( sfilename, &f, FS_READ );
ADDRLP4 20016
ARGP4
ADDRLP4 20080
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20084
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20084
INDIRI4
ASGNI4
line 153
;153:	if ( len <= 0 ) 
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $180
line 154
;154:	{//no file
line 155
;155:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $178
JUMPV
LABELV $180
line 157
;156:	}
;157:	if ( len >= sizeof( text ) - 1 ) 
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $182
line 158
;158:	{
line 159
;159:		Com_Printf( "File %s too long\n", sfilename );
ADDRGP4 $184
ARGP4
ADDRLP4 20016
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 160
;160:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $178
JUMPV
LABELV $182
line 163
;161:	}
;162:
;163:	trap_FS_Read( text, len, f );
ADDRLP4 16
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 20080
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 164
;164:	text[len] = 0;
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 0
ASGNI1
line 165
;165:	trap_FS_FCloseFile( f );
ADDRLP4 20080
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 168
;166:
;167:	// parse the text
;168:	text_p = text;
ADDRLP4 4
ADDRLP4 16
ASGNP4
line 170
;169:
;170:	memset( (char *)surfOff, 0, sizeof(surfOff) );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 171
;171:	memset( (char *)surfOn, 0, sizeof(surfOn) );
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $186
JUMPV
LABELV $185
line 175
;172:
;173:	// read information for surfOff and surfOn
;174:	while ( 1 ) 
;175:	{
line 176
;176:		token = COM_ParseExt( &text_p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 20088
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20088
INDIRP4
ASGNP4
line 177
;177:		if ( !token || !token[0] ) 
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $190
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $188
LABELV $190
line 178
;178:		{
line 179
;179:			break;
ADDRGP4 $187
JUMPV
LABELV $188
line 183
;180:		}
;181:
;182:		// surfOff
;183:		if ( !Q_stricmp( token, "surfOff" ) ) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $193
ARGP4
ADDRLP4 20096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20096
INDIRI4
CNSTI4 0
NEI4 $191
line 184
;184:		{
line 185
;185:			if ( COM_ParseString( &text_p, &value ) ) 
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20100
ADDRGP4 COM_ParseString
CALLI4
ASGNI4
ADDRLP4 20100
INDIRI4
CNSTI4 0
EQI4 $194
line 186
;186:			{
line 187
;187:				continue;
ADDRGP4 $186
JUMPV
LABELV $194
line 189
;188:			}
;189:			if ( surfOff && surfOff[0] )
ADDRLP4 20104
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20104
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $196
ADDRLP4 20104
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $196
line 190
;190:			{
line 191
;191:				Q_strcat( surfOff, MAX_SURF_LIST_SIZE, "," );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $198
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 192
;192:				Q_strcat( surfOff, MAX_SURF_LIST_SIZE, value );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 193
;193:			}
ADDRGP4 $186
JUMPV
LABELV $196
line 195
;194:			else
;195:			{
line 196
;196:				Q_strncpyz( surfOff, value, MAX_SURF_LIST_SIZE );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 197
;197:			}
line 198
;198:			continue;
ADDRGP4 $186
JUMPV
LABELV $191
line 202
;199:		}
;200:		
;201:		// surfOn
;202:		if ( !Q_stricmp( token, "surfOn" ) ) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $201
ARGP4
ADDRLP4 20100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20100
INDIRI4
CNSTI4 0
NEI4 $199
line 203
;203:		{
line 204
;204:			if ( COM_ParseString( &text_p, &value ) ) 
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20104
ADDRGP4 COM_ParseString
CALLI4
ASGNI4
ADDRLP4 20104
INDIRI4
CNSTI4 0
EQI4 $202
line 205
;205:			{
line 206
;206:				continue;
ADDRGP4 $186
JUMPV
LABELV $202
line 208
;207:			}
;208:			if ( surfOn && surfOn[0] )
ADDRLP4 20108
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $204
ADDRLP4 20108
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $204
line 209
;209:			{
line 210
;210:				Q_strcat( surfOn, MAX_SURF_LIST_SIZE, ",");
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $198
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 211
;211:				Q_strcat( surfOn, MAX_SURF_LIST_SIZE, value );
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 212
;212:			}
ADDRGP4 $186
JUMPV
LABELV $204
line 214
;213:			else
;214:			{
line 215
;215:				Q_strncpyz( surfOn, value, MAX_SURF_LIST_SIZE );
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 216
;216:			}
line 217
;217:			continue;
LABELV $199
line 219
;218:		}
;219:	}
LABELV $186
line 174
ADDRGP4 $185
JUMPV
LABELV $187
line 220
;220:	return qtrue;
CNSTI4 1
RETI4
LABELV $178
endproc CG_ParseSurfsFile 20112 20
lit
align 4
LABELV $207
byte 4 0
byte 4 0
byte 4 0
code
proc CG_RegisterClientModelname 2320 44
line 228
;221:}
;222:
;223:/*
;224:==========================
;225:CG_RegisterClientModelname
;226:==========================
;227:*/
;228:static qboolean CG_RegisterClientModelname( clientInfo_t *ci, const char *modelName, const char *skinName, const char *teamName, int clientNum ) {
line 233
;229:	int handle;
;230:	char		afilename[MAX_QPATH];
;231:	char		/**GLAName,*/ *slash;
;232:	char		GLAName[MAX_QPATH];
;233:	vec3_t	tempVec = {0,0,0};
ADDRLP4 132
ADDRGP4 $207
INDIRB
ASGNB 12
line 234
;234:	qboolean badModel = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 235
;235:	qboolean retriedAlready = qfalse;
ADDRLP4 2196
CNSTI4 0
ASGNI4
LABELV $208
line 240
;236:	char	surfOff[MAX_SURF_LIST_SIZE];
;237:	char	surfOn[MAX_SURF_LIST_SIZE];
;238:
;239:retryModel:
;240:	if (ci->ATST && clientNum == -1)
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
ADDRFP4 16
INDIRI4
CNSTI4 -1
NEI4 $209
line 241
;241:	{
line 242
;242:		Com_sprintf(ci->teamName, sizeof(ci->teamName), teamName);
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 243
;243:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $206
JUMPV
LABELV $209
line 246
;244:	}
;245:
;246:	if (badModel)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $211
line 247
;247:	{
line 248
;248:		modelName = "kyle";
ADDRFP4 4
ADDRGP4 $160
ASGNP4
line 249
;249:		skinName = "default";
ADDRFP4 8
ADDRGP4 $213
ASGNP4
line 250
;250:		Com_Printf("WARNING: Attempted to load an unsupported multiplayer model! (bad or missing bone, or missing animation sequence)\n");
ADDRGP4 $214
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 252
;251:
;252:		badModel = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 253
;253:		retriedAlready = qtrue;
ADDRLP4 2196
CNSTI4 1
ASGNI4
line 254
;254:	}
LABELV $211
line 256
;255:
;256:	if (!CG_IsValidCharacterModel(modelName, skinName))
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 2204
ADDRGP4 CG_IsValidCharacterModel
CALLI4
ASGNI4
ADDRLP4 2204
INDIRI4
CNSTI4 0
NEI4 $215
line 257
;257:	{
line 258
;258:		modelName = "kyle";
ADDRFP4 4
ADDRGP4 $160
ASGNP4
line 259
;259:		skinName = "default";
ADDRFP4 8
ADDRGP4 $213
ASGNP4
line 260
;260:	}
LABELV $215
line 263
;261:
;262:	// First things first.  If this is a ghoul2 model, then let's make sure we demolish this first.
;263:	if (ci->ghoul2Model && trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
ADDRLP4 2208
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $217
ADDRLP4 2208
INDIRP4
ARGP4
ADDRLP4 2212
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 2212
INDIRI4
CNSTI4 0
EQI4 $217
line 264
;264:	{
line 265
;265:		trap_G2API_CleanGhoul2Models(&(ci->ghoul2Model));
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 266
;266:	}
LABELV $217
line 268
;267:
;268:	if ( cgs.gametype >= GT_TEAM && !cgs.jediVmerc )
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $219
ADDRGP4 cgs+32996
INDIRI4
CNSTI4 0
NEI4 $219
line 269
;269:	{
line 270
;270:		if (ci->team == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $223
line 271
;271:		{
line 272
;272:			Q_strncpyz(ci->skinName, "red", sizeof(ci->skinName));
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 $176
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 273
;273:			skinName = "red";
ADDRFP4 8
ADDRGP4 $176
ASGNP4
line 274
;274:		}
ADDRGP4 $224
JUMPV
LABELV $223
line 275
;275:		else if (ci->team == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $225
line 276
;276:		{
line 277
;277:			Q_strncpyz(ci->skinName, "blue", sizeof(ci->skinName));
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 $177
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 278
;278:			skinName = "blue";
ADDRFP4 8
ADDRGP4 $177
ASGNP4
line 279
;279:		}
LABELV $225
LABELV $224
line 280
;280:	}
LABELV $219
line 282
;281:
;282:	if (clientNum != -1 && cg_entities[clientNum].currentState.teamowner && !cg_entities[clientNum].isATST)
ADDRLP4 2216
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 2216
INDIRI4
CNSTI4 -1
EQI4 $227
ADDRLP4 2220
CNSTI4 1920
ADDRLP4 2216
INDIRI4
MULI4
ASGNI4
ADDRLP4 2224
CNSTI4 0
ASGNI4
ADDRLP4 2220
INDIRI4
ADDRGP4 cg_entities+264
ADDP4
INDIRI4
ADDRLP4 2224
INDIRI4
EQI4 $227
ADDRLP4 2220
INDIRI4
ADDRGP4 cg_entities+1028
ADDP4
INDIRI4
ADDRLP4 2224
INDIRI4
NEI4 $227
line 283
;283:	{
line 284
;284:		ci->torsoSkin = 0;
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 285
;285:		ci->ATST = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 286
;286:		handle = trap_G2API_InitGhoul2Model(&ci->ghoul2Model, "models/players/atst/model.glm", 0, 0, 0, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 $231
ARGP4
ADDRLP4 2228
CNSTI4 0
ASGNI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2228
INDIRI4
ARGI4
ADDRLP4 2232
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
ASGNI4
ADDRLP4 2192
ADDRLP4 2232
INDIRI4
ASGNI4
line 287
;287:	}
ADDRGP4 $228
JUMPV
LABELV $227
line 289
;288:	else
;289:	{
line 290
;290:		ci->torsoSkin = trap_R_RegisterSkin(va("models/players/%s/model_%s.skin", modelName, skinName));
ADDRGP4 $232
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 2228
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2228
INDIRP4
ARGP4
ADDRLP4 2232
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 2232
INDIRI4
ASGNI4
line 291
;291:		ci->ATST = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 0
ASGNI4
line 292
;292:		Com_sprintf( afilename, sizeof( afilename ), "models/players/%s/model.glm", modelName );
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $233
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 293
;293:		handle = trap_G2API_InitGhoul2Model(&ci->ghoul2Model, afilename, 0, ci->torsoSkin, 0, 0, 0);
ADDRLP4 2236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2236
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 2240
CNSTI4 0
ASGNI4
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2236
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ARGI4
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2244
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
ASGNI4
ADDRLP4 2192
ADDRLP4 2244
INDIRI4
ASGNI4
line 294
;294:	}
LABELV $228
line 295
;295:	if (handle<0)
ADDRLP4 2192
INDIRI4
CNSTI4 0
GEI4 $234
line 296
;296:	{
line 297
;297:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $234
line 302
;298:	}
;299:
;300:	// The model is now loaded.
;301:
;302:	GLAName[0] = 0;
ADDRLP4 4
CNSTI1 0
ASGNI1
line 304
;303:
;304:	trap_G2API_GetGLAName( ci->ghoul2Model, 0, GLAName);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_G2API_GetGLAName
CALLV
pop
line 305
;305:	if (GLAName[0] != 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $236
line 306
;306:	{
line 307
;307:		if (!strstr(GLAName, "players/_humanoid/"))
ADDRLP4 4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 2228
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 2228
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $238
line 308
;308:		{ //Bad!
line 309
;309:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 310
;310:			goto retryModel;
ADDRGP4 $208
JUMPV
LABELV $238
line 312
;311:		}
;312:	}
LABELV $236
line 314
;313:
;314:	if (!BGPAFtextLoaded)
ADDRGP4 BGPAFtextLoaded
INDIRI4
CNSTI4 0
NEI4 $241
line 315
;315:	{
line 316
;316:		if (GLAName[0] == 0/*GLAName == NULL*/)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $243
line 317
;317:		{
line 318
;318:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $247
ARGP4
ADDRLP4 2228
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 2228
INDIRI4
CNSTI4 0
NEI4 $245
line 319
;319:			{
line 320
;320:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $248
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 321
;321:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $245
line 323
;322:			}
;323:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $206
JUMPV
LABELV $243
line 325
;324:		}
;325:		Q_strncpyz( afilename, GLAName, sizeof( afilename ));
ADDRLP4 68
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 326
;326:		slash = Q_strrchr( afilename, '/' );
ADDRLP4 68
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 2228
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 2200
ADDRLP4 2228
INDIRP4
ASGNP4
line 327
;327:		if ( slash )
ADDRLP4 2200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $249
line 328
;328:		{
line 329
;329:			strcpy(slash, "/animation.cfg");
ADDRLP4 2200
INDIRP4
ARGP4
ADDRGP4 $251
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 330
;330:		}	// Now afilename holds just the path to the animation.cfg
ADDRGP4 $250
JUMPV
LABELV $249
line 332
;331:		else 
;332:		{	// Didn't find any slashes, this is a raw filename right in base (whish isn't a good thing)
line 333
;333:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $250
line 349
;334:		}
;335:
;336:		/*
;337:		// Try to load the animation.cfg for this model then.
;338:		if ( !BG_ParseAnimationFile( afilename, ci->animations ) )
;339:		{	// The GLA's animations failed
;340:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg", ci->animations))
;341:			{
;342:				Com_Printf( "Failed to load animation file %s\n", afilename );
;343:				return qfalse;
;344:			}
;345:		}
;346:		*/
;347:		//rww - For now, we'll just ignore what animation file it wants. In theory all multiplayer-supported models
;348:		//should want _humanoid/animation.cfg, so if it doesn't want that then throw it away
;349:		if (Q_stricmp(afilename, "models/players/_humanoid/animation.cfg"))
ADDRLP4 68
ARGP4
ADDRGP4 $247
ARGP4
ADDRLP4 2232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2232
INDIRI4
CNSTI4 0
EQI4 $252
line 350
;350:		{
line 351
;351:			Com_Printf( "Model does not use supported animation config.\n");
ADDRGP4 $254
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 352
;352:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $252
line 354
;353:		}
;354:		else if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $247
ARGP4
ADDRLP4 2236
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 2236
INDIRI4
CNSTI4 0
NEI4 $255
line 355
;355:		{
line 356
;356:			Com_Printf( "Failed to load animation file models/players/_humanoid/animation.cfg\n" );
ADDRGP4 $257
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 357
;357:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $255
line 359
;358:		}
;359:		else if (!retriedAlready)
ADDRLP4 2196
INDIRI4
CNSTI4 0
NEI4 $258
line 360
;360:		{
line 363
;361:			int i;
;362:
;363:			for(i = 0; i < MAX_ANIMATIONS; i++)
ADDRLP4 2240
CNSTI4 0
ASGNI4
LABELV $260
line 364
;364:			{
line 365
;365:				if (!bgGlobalAnimations[i].firstFrame && !bgGlobalAnimations[i].numFrames && CG_NeedAnimSequence(i))
ADDRLP4 2248
CNSTI4 28
ADDRLP4 2240
INDIRI4
MULI4
ASGNI4
ADDRLP4 2252
CNSTI4 0
ASGNI4
ADDRLP4 2248
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ADDRLP4 2252
INDIRI4
NEI4 $264
ADDRLP4 2248
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDRLP4 2252
INDIRI4
NEI4 $264
ADDRLP4 2240
INDIRI4
ARGI4
ADDRLP4 2256
ADDRGP4 CG_NeedAnimSequence
CALLI4
ASGNI4
ADDRLP4 2256
INDIRI4
CNSTI4 0
EQI4 $264
line 366
;366:				{ //using default for this animation so it obviously never got filled in.
line 368
;367:					//if it's a sequence that we need, this model must be an unsupported one.
;368:					badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 369
;369:					goto retryModel;
ADDRGP4 $208
JUMPV
LABELV $264
line 371
;370:				}
;371:			}
LABELV $261
line 363
ADDRLP4 2240
ADDRLP4 2240
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2240
INDIRI4
CNSTI4 1210
LTI4 $260
line 372
;372:		}
LABELV $258
line 373
;373:	}
LABELV $241
line 375
;374:
;375:	if ( CG_ParseSurfsFile( modelName, skinName, surfOff, surfOn ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 144
ARGP4
ADDRLP4 1168
ARGP4
ADDRLP4 2228
ADDRGP4 CG_ParseSurfsFile
CALLI4
ASGNI4
ADDRLP4 2228
INDIRI4
CNSTI4 0
EQI4 $267
line 376
;376:	{//turn on/off any surfs
line 381
;377:		const char	*token;
;378:		const char	*p;
;379:
;380:		//Now turn on/off any surfaces
;381:		if ( surfOff && surfOff[0] )
ADDRLP4 144
CVPU4 4
CNSTU4 0
EQU4 $269
ADDRLP4 144
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $269
line 382
;382:		{
line 383
;383:			p = surfOff;
ADDRLP4 2236
ADDRLP4 144
ASGNP4
ADDRGP4 $272
JUMPV
LABELV $271
line 385
;384:			while ( 1 ) 
;385:			{
line 386
;386:				token = COM_ParseExt( &p, qtrue );
ADDRLP4 2236
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2240
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 2232
ADDRLP4 2240
INDIRP4
ASGNP4
line 387
;387:				if ( !token[0] ) 
ADDRLP4 2232
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $274
line 388
;388:				{//reached end of list
line 389
;389:					break;
ADDRGP4 $273
JUMPV
LABELV $274
line 392
;390:				}
;391:				//turn off this surf
;392:				trap_G2API_SetSurfaceOnOff( ci->ghoul2Model, token, 0x00000002/*G2SURFACEFLAG_OFF*/ );
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2232
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 393
;393:			}
LABELV $272
line 384
ADDRGP4 $271
JUMPV
LABELV $273
line 394
;394:		}
LABELV $269
line 395
;395:		if ( surfOn && surfOn[0] )
ADDRLP4 1168
CVPU4 4
CNSTU4 0
EQU4 $276
ADDRLP4 1168
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $276
line 396
;396:		{
line 397
;397:			p = surfOn;
ADDRLP4 2236
ADDRLP4 1168
ASGNP4
ADDRGP4 $279
JUMPV
LABELV $278
line 399
;398:			while ( 1 )
;399:			{
line 400
;400:				token = COM_ParseExt( &p, qtrue );
ADDRLP4 2236
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2240
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 2232
ADDRLP4 2240
INDIRP4
ASGNP4
line 401
;401:				if ( !token[0] ) 
ADDRLP4 2232
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $281
line 402
;402:				{//reached end of list
line 403
;403:					break;
ADDRGP4 $280
JUMPV
LABELV $281
line 406
;404:				}
;405:				//turn on this surf
;406:				trap_G2API_SetSurfaceOnOff( ci->ghoul2Model, token, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2232
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 407
;407:			}
LABELV $279
line 398
ADDRGP4 $278
JUMPV
LABELV $280
line 408
;408:		}
LABELV $276
line 409
;409:	}
LABELV $267
line 411
;410:
;411:	if (clientNum != -1 && cg_entities[clientNum].currentState.teamowner && !cg_entities[clientNum].isATST)
ADDRLP4 2232
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 2232
INDIRI4
CNSTI4 -1
EQI4 $283
ADDRLP4 2236
CNSTI4 1920
ADDRLP4 2232
INDIRI4
MULI4
ASGNI4
ADDRLP4 2240
CNSTI4 0
ASGNI4
ADDRLP4 2236
INDIRI4
ADDRGP4 cg_entities+264
ADDP4
INDIRI4
ADDRLP4 2240
INDIRI4
EQI4 $283
ADDRLP4 2236
INDIRI4
ADDRGP4 cg_entities+1028
ADDP4
INDIRI4
ADDRLP4 2240
INDIRI4
NEI4 $283
line 412
;412:	{
line 413
;413:		ci->torsoSkin = 0;
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 414
;414:		ci->bolt_rhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*flash1");
ADDRLP4 2244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2244
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $287
ARGP4
ADDRLP4 2248
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2244
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 2248
INDIRI4
ASGNI4
line 415
;415:		trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "Model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, cg.time, -1, -1);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2252
CNSTI4 0
ASGNI4
ADDRLP4 2252
INDIRI4
ARGI4
ADDRGP4 $288
ARGP4
ADDRLP4 2252
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 416
;416:		trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "l_clavical", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2256
CNSTI4 0
ASGNI4
ADDRLP4 2256
INDIRI4
ARGI4
ADDRGP4 $290
ARGP4
ADDRLP4 132
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
ADDRLP4 2256
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 417
;417:		trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "r_clavical", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2260
CNSTI4 0
ASGNI4
ADDRLP4 2260
INDIRI4
ARGI4
ADDRGP4 $292
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 2264
CNSTI4 2
ASGNI4
ADDRLP4 2264
INDIRI4
ARGI4
ADDRLP4 2264
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 2260
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 419
;418:
;419:		ci->bolt_lhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*flash2");
ADDRLP4 2268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2268
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $294
ARGP4
ADDRLP4 2272
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2268
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 2272
INDIRI4
ASGNI4
line 420
;420:		ci->bolt_head = trap_G2API_AddBolt(ci->ghoul2Model, 0, "pelvis");
ADDRLP4 2276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2276
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 2280
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2276
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 2280
INDIRI4
ASGNI4
line 421
;421:	}
ADDRGP4 $284
JUMPV
LABELV $283
line 423
;422:	else
;423:	{
line 424
;424:		ci->bolt_rhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*r_hand");
ADDRLP4 2244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2244
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $296
ARGP4
ADDRLP4 2248
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2244
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 2248
INDIRI4
ASGNI4
line 426
;425:		
;426:		if (!trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, cg.time, -1, -1))
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2252
CNSTI4 0
ASGNI4
ADDRLP4 2252
INDIRI4
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 2252
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRLP4 2256
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
ASGNI4
ADDRLP4 2256
INDIRI4
CNSTI4 0
NEI4 $297
line 427
;427:		{
line 428
;428:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 429
;429:		}
LABELV $297
line 431
;430:		
;431:		if (!trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "upper_lumbar", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, cg.time))
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2260
CNSTI4 0
ASGNI4
ADDRLP4 2260
INDIRI4
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 132
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
ADDRLP4 2260
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 2264
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
ASGNI4
ADDRLP4 2264
INDIRI4
CNSTI4 0
NEI4 $301
line 432
;432:		{
line 433
;433:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 434
;434:		}
LABELV $301
line 436
;435:
;436:		if (!trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "cranium", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, cg.time))
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 2268
CNSTI4 0
ASGNI4
ADDRLP4 2268
INDIRI4
ARGI4
ADDRGP4 $307
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 2272
CNSTI4 2
ASGNI4
ADDRLP4 2272
INDIRI4
ARGI4
ADDRLP4 2272
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 2268
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 2276
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
ASGNI4
ADDRLP4 2276
INDIRI4
CNSTI4 0
NEI4 $305
line 437
;437:		{
line 438
;438:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 439
;439:		}
LABELV $305
line 441
;440:
;441:		ci->bolt_lhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*l_hand");
ADDRLP4 2280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2280
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $309
ARGP4
ADDRLP4 2284
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2280
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 2284
INDIRI4
ASGNI4
line 442
;442:		ci->bolt_head = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*head_top");
ADDRLP4 2288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2288
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $310
ARGP4
ADDRLP4 2292
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2288
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 2292
INDIRI4
ASGNI4
line 444
;443:
;444:		ci->bolt_motion = trap_G2API_AddBolt(ci->ghoul2Model, 0, "Motion");
ADDRLP4 2296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2296
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 2300
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2296
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 2300
INDIRI4
ASGNI4
line 447
;445:
;446:		//We need a lower lumbar bolt for footsteps
;447:		ci->bolt_llumbar = trap_G2API_AddBolt(ci->ghoul2Model, 0, "lower_lumbar");
ADDRLP4 2304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2304
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 2308
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 2304
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 2308
INDIRI4
ASGNI4
line 449
;448:
;449:		if (ci->bolt_rhand == -1 || ci->bolt_lhand == -1 || ci->bolt_head == -1 || ci->bolt_motion == -1 || ci->bolt_llumbar == -1)
ADDRLP4 2312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2316
CNSTI4 -1
ASGNI4
ADDRLP4 2312
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
EQI4 $318
ADDRLP4 2312
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
EQI4 $318
ADDRLP4 2312
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
EQI4 $318
ADDRLP4 2312
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
EQI4 $318
ADDRLP4 2312
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 2316
INDIRI4
NEI4 $313
LABELV $318
line 450
;450:		{
line 451
;451:			badModel = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 452
;452:		}
LABELV $313
line 454
;453:
;454:		if (badModel)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $319
line 455
;455:		{
line 456
;456:			goto retryModel;
ADDRGP4 $208
JUMPV
LABELV $319
line 458
;457:		}
;458:	}
LABELV $284
line 462
;459:
;460://	ent->s.radius = 90;
;461:
;462:	if (clientNum != -1)
ADDRFP4 16
INDIRI4
CNSTI4 -1
EQI4 $321
line 463
;463:	{
line 464
;464:		if (cg_entities[clientNum].isATST)
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $323
line 465
;465:		{
line 468
;466:			animation_t *anim;
;467:
;468:			anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.legsAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 2244
CNSTI4 28
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 470
;469:
;470:			if (anim)
ADDRLP4 2244
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $327
line 471
;471:			{
line 472
;472:				int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 2248
CNSTI4 72
ASGNI4
line 473
;473:				int firstFrame = anim->firstFrame + anim->numFrames-1;
ADDRLP4 2256
ADDRLP4 2244
INDIRP4
ASGNP4
ADDRLP4 2252
ADDRLP4 2256
INDIRP4
INDIRI4
ADDRLP4 2256
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 475
;474:
;475:				if (anim->loopFrames != -1)
ADDRLP4 2244
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $329
line 476
;476:				{
line 477
;477:					flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 2248
CNSTI4 16
ASGNI4
line 478
;478:					firstFrame = anim->firstFrame;
ADDRLP4 2252
ADDRLP4 2244
INDIRP4
INDIRI4
ASGNI4
line 479
;479:				}
LABELV $329
line 482
;480:
;481:				//rww - Set the animation again because it just got reset due to the model change
;482:				trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", firstFrame, anim->firstFrame + anim->numFrames, flags, 1.0f, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 2252
INDIRI4
ARGI4
ADDRLP4 2260
ADDRLP4 2244
INDIRP4
ASGNP4
ADDRLP4 2260
INDIRP4
INDIRI4
ADDRLP4 2260
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 2248
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 484
;483:
;484:				cg_entities[clientNum].currentState.legsAnim = 0;
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
CNSTI4 0
ASGNI4
line 485
;485:			}
LABELV $327
line 487
;486:
;487:			anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.torsoAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 2244
CNSTI4 28
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 489
;488:
;489:			if (anim)
ADDRLP4 2244
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $334
line 490
;490:			{
line 491
;491:				int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 2248
CNSTI4 72
ASGNI4
line 492
;492:				int firstFrame = anim->firstFrame + anim->numFrames-1;
ADDRLP4 2256
ADDRLP4 2244
INDIRP4
ASGNP4
ADDRLP4 2252
ADDRLP4 2256
INDIRP4
INDIRI4
ADDRLP4 2256
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 494
;493:
;494:				if (anim->loopFrames != -1)
ADDRLP4 2244
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $336
line 495
;495:				{
line 496
;496:					flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 2248
CNSTI4 16
ASGNI4
line 497
;497:					firstFrame = anim->firstFrame;
ADDRLP4 2252
ADDRLP4 2244
INDIRP4
INDIRI4
ASGNI4
line 498
;498:				}
LABELV $336
line 501
;499:
;500:				//rww - Set the animation again because it just got reset due to the model change
;501:				trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "lower_lumbar", anim->firstFrame + anim->numFrames-1, anim->firstFrame + anim->numFrames, flags, 1.0f, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 2260
ADDRLP4 2244
INDIRP4
ASGNP4
ADDRLP4 2264
ADDRLP4 2260
INDIRP4
INDIRI4
ADDRLP4 2260
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRLP4 2264
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 2264
INDIRI4
ARGI4
ADDRLP4 2248
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 503
;502:
;503:				cg_entities[clientNum].currentState.torsoAnim = 0;
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
CNSTI4 0
ASGNI4
line 504
;504:			}
LABELV $334
line 505
;505:		}
LABELV $323
line 515
;506:
;507:		/*
;508:		if (cg_entities[clientNum].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[clientNum].ghoul2))
;509:		{
;510:			trap_G2API_CleanGhoul2Models(&(cg_entities[clientNum].ghoul2));
;511:		}
;512:		trap_G2API_DuplicateGhoul2Instance(ci->ghoul2Model, &cg_entities[clientNum].ghoul2);	
;513:		*/
;514:
;515:		cg_entities[clientNum].ghoul2weapon = NULL;
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+960
ADDP4
CNSTP4 0
ASGNP4
line 516
;516:	}
LABELV $321
line 518
;517:
;518:	Q_strncpyz (ci->teamName, teamName, sizeof(ci->teamName));
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 521
;519:
;520:	// Model icon for drawing the portrait on screen
;521:	ci->modelIcon = trap_R_RegisterShaderNoMip ( va ( "models/players/%s/icon_%s", modelName, skinName ) );
ADDRGP4 $341
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 2244
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2244
INDIRP4
ARGP4
ADDRLP4 2248
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 2248
INDIRI4
ASGNI4
line 523
;522:
;523:	return qtrue;
CNSTI4 1
RETI4
LABELV $206
endproc CG_RegisterClientModelname 2320 44
proc CG_ColorFromString 20 4
line 531
;524:}
;525:
;526:/*
;527:====================
;528:CG_ColorFromString
;529:====================
;530:*/
;531:static void CG_ColorFromString( const char *v, vec3_t color ) {
line 534
;532:	int val;
;533:
;534:	VectorClear( color );
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 536
;535:
;536:	val = atoi( v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 538
;537:
;538:	if ( val < 1 || val > 7 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $345
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $343
LABELV $345
line 539
;539:		VectorSet( color, 1, 1, 1 );
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 540
;540:		return;
ADDRGP4 $342
JUMPV
LABELV $343
line 543
;541:	}
;542:
;543:	if ( val & 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $346
line 544
;544:		color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 545
;545:	}
LABELV $346
line 546
;546:	if ( val & 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $348
line 547
;547:		color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 548
;548:	}
LABELV $348
line 549
;549:	if ( val & 4 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $350
line 550
;550:		color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 551
;551:	}
LABELV $350
line 552
;552:}
LABELV $342
endproc CG_ColorFromString 20 4
export CG_LoadClientInfo
proc CG_LoadClientInfo 1264 24
line 564
;553:
;554:#define DEFAULT_FEMALE_SOUNDPATH "chars/mp_generic_female/misc"//"chars/tavion/misc"
;555:#define DEFAULT_MALE_SOUNDPATH "chars/mp_generic_male/misc"//"chars/kyle/misc"
;556:/*
;557:===================
;558:CG_LoadClientInfo
;559:
;560:Load it now, taking the disk hits.
;561:This will usually be deferred to a safe time
;562:===================
;563:*/
;564:void CG_LoadClientInfo( clientInfo_t *ci ) {
line 570
;565:	const char	*dir, *fallback;
;566:	int			i, modelloaded;
;567:	const char	*s;
;568:	int			clientNum;
;569:	char		teamname[MAX_QPATH];
;570:	int			fLen = 0;
ADDRLP4 1184
CNSTI4 0
ASGNI4
line 573
;571:	char		soundpath[MAX_QPATH];
;572:	char		soundName[1024];
;573:	qboolean	isFemale = qfalse;
ADDRLP4 1100
CNSTI4 0
ASGNI4
line 576
;574:	fileHandle_t f;
;575:
;576:	clientNum = ci - cgs.clientinfo;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+43024
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 788
DIVI4
ASGNI4
line 578
;577:
;578:	if (clientNum < 0 || clientNum >= MAX_CLIENTS)
ADDRLP4 1096
INDIRI4
CNSTI4 0
LTI4 $356
ADDRLP4 1096
INDIRI4
CNSTI4 32
LTI4 $354
LABELV $356
line 579
;579:	{
line 580
;580:		clientNum = -1;
ADDRLP4 1096
CNSTI4 -1
ASGNI4
line 581
;581:	}
LABELV $354
line 583
;582:
;583:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 607
;584:
;585:	/*
;586:	if (ci->team == TEAM_SPECTATOR)
;587:	{
;588:		// reset any existing players and bodies, because they might be in bad
;589:		// frames for this new model
;590:		clientNum = ci - cgs.clientinfo;
;591:		for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
;592:			if ( cg_entities[i].currentState.clientNum == clientNum
;593:				&& cg_entities[i].currentState.eType == ET_PLAYER ) {
;594:				CG_ResetPlayerEntity( &cg_entities[i] );
;595:			}
;596:		}
;597:
;598:		if (ci->ghoul2Model && trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
;599:		{
;600:			trap_G2API_CleanGhoul2Models(&ci->ghoul2Model);
;601:		}
;602:
;603:		return;
;604:	}
;605:	*/
;606:
;607:	teamname[0] = 0;
ADDRLP4 1108
CNSTI1 0
ASGNI1
line 608
;608:	if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $357
line 609
;609:		if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $360
line 610
;610:			Q_strncpyz(teamname, cg_blueTeamName.string, sizeof(teamname) );
ADDRLP4 1108
ARGP4
ADDRGP4 cg_blueTeamName+16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 611
;611:		} else {
ADDRGP4 $361
JUMPV
LABELV $360
line 612
;612:			Q_strncpyz(teamname, cg_redTeamName.string, sizeof(teamname) );
ADDRLP4 1108
ARGP4
ADDRGP4 cg_redTeamName+16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 613
;613:		}
LABELV $361
line 614
;614:	}
LABELV $357
line 615
;615:	if( teamname[0] ) {
ADDRLP4 1108
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $364
line 616
;616:		strcat( teamname, "/" );
ADDRLP4 1108
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 617
;617:	}
LABELV $364
line 618
;618:	modelloaded = qtrue;
ADDRLP4 1104
CNSTI4 1
ASGNI4
line 619
;619:	if ( !CG_RegisterClientModelname( ci, ci->modelName, ci->skinName, teamname, clientNum ) ) {
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 1192
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1196
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
NEI4 $367
line 625
;620:		//CG_Error( "CG_RegisterClientModelname( %s, %s, %s, %s %s ) failed", ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname );
;621:		//rww - DO NOT error out here! Someone could just type in a nonsense model name and crash everyone's client.
;622:		//Give it a chance to load default model for this client instead.
;623:
;624:		// fall back to default team name
;625:		if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $369
line 627
;626:			// keep skin name
;627:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $372
line 628
;628:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 1108
ARGP4
ADDRGP4 $374
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 629
;629:			} else {
ADDRGP4 $373
JUMPV
LABELV $372
line 630
;630:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 1108
ARGP4
ADDRGP4 $375
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 631
;631:			}
LABELV $373
line 632
;632:			if ( !CG_RegisterClientModelname( ci, DEFAULT_TEAM_MODEL, ci->skinName, teamname, -1 ) ) {
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
ADDRLP4 1200
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 1108
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 1204
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $370
line 633
;633:				CG_Error( "DEFAULT_TEAM_MODEL / skin (%s/%s) failed to register", DEFAULT_TEAM_MODEL, ci->skinName );
ADDRGP4 $378
ARGP4
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 634
;634:			}
line 635
;635:		} else {
ADDRGP4 $370
JUMPV
LABELV $369
line 636
;636:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, "default", teamname, -1 ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 1108
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 1200
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $379
line 637
;637:				CG_Error( "DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL );
ADDRGP4 $381
ARGP4
ADDRGP4 $160
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 638
;638:			}
LABELV $379
line 639
;639:		}
LABELV $370
line 640
;640:		modelloaded = qfalse;
ADDRLP4 1104
CNSTI4 0
ASGNI4
line 641
;641:	}
LABELV $367
line 643
;642:
;643:	if (clientNum != -1 && ci->ghoul2Model && trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
ADDRLP4 1096
INDIRI4
CNSTI4 -1
EQI4 $382
ADDRLP4 1200
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $382
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1204
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
EQI4 $382
line 644
;644:	{
line 645
;645:		if (cg_entities[clientNum].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[clientNum].ghoul2))
ADDRLP4 1208
CNSTI4 1920
ADDRLP4 1096
INDIRI4
MULI4
ASGNI4
ADDRLP4 1208
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $384
ADDRLP4 1208
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $384
line 646
;646:		{
line 647
;647:			trap_G2API_CleanGhoul2Models(&cg_entities[clientNum].ghoul2);
CNSTI4 1920
ADDRLP4 1096
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 648
;648:		}
LABELV $384
line 649
;649:		trap_G2API_DuplicateGhoul2Instance(ci->ghoul2Model, &cg_entities[clientNum].ghoul2);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 1920
ADDRLP4 1096
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 650
;650:	}
LABELV $382
line 652
;651:
;652:	ci->newAnims = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 0
ASGNI4
line 653
;653:	if ( ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
EQI4 $390
line 656
;654:		orientation_t tag;
;655:		// if the torso model has the "tag_flag"
;656:		if ( trap_R_LerpTag( &tag, ci->torsoModel, 0, 0, 1, "tag_flag" ) ) {
ADDRLP4 1208
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
ARGI4
ADDRLP4 1256
CNSTI4 0
ASGNI4
ADDRLP4 1256
INDIRI4
ARGI4
ADDRLP4 1256
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 $394
ARGP4
ADDRLP4 1260
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 1260
INDIRI4
CNSTI4 0
EQI4 $392
line 657
;657:			ci->newAnims = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 1
ASGNI4
line 658
;658:		}
LABELV $392
line 659
;659:	}
LABELV $390
line 662
;660:
;661:	// sounds
;662:	dir = ci->modelName;
ADDRLP4 1172
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
line 663
;663:	fallback = DEFAULT_MALE_SOUNDPATH; //(cgs.gametype >= GT_TEAM) ? DEFAULT_TEAM_MODEL : DEFAULT_MODEL;
ADDRLP4 1180
ADDRGP4 $395
ASGNP4
line 665
;664:
;665:	if ( !ci->skinName || !Q_stricmp( "default", ci->skinName ) )
ADDRLP4 1208
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 1208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $398
ADDRGP4 $213
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
NEI4 $396
LABELV $398
line 666
;666:	{//try default sounds.cfg first
line 667
;667:		fLen = trap_FS_FOpenFile(va("models/players/%s/sounds.cfg", dir), &f, FS_READ);
ADDRGP4 $399
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1220
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1184
ADDRLP4 1220
INDIRI4
ASGNI4
line 668
;668:		if ( !f ) 
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $397
line 669
;669:		{//no?  Look for _default sounds.cfg
line 670
;670:			fLen = trap_FS_FOpenFile(va("models/players/%s/sounds_default.cfg", dir), &f, FS_READ);
ADDRGP4 $402
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1228
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1184
ADDRLP4 1228
INDIRI4
ASGNI4
line 671
;671:		}
line 672
;672:	}
ADDRGP4 $397
JUMPV
LABELV $396
line 674
;673:	else
;674:	{//use the .skin associated with this skin
line 675
;675:		fLen = trap_FS_FOpenFile(va("models/players/%s/sounds_%s.cfg", dir, ci->skinName), &f, FS_READ);
ADDRGP4 $403
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1220
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1184
ADDRLP4 1220
INDIRI4
ASGNI4
line 676
;676:		if ( !f ) 
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $404
line 677
;677:		{//fall back to default sounds
line 678
;678:			fLen = trap_FS_FOpenFile(va("models/players/%s/sounds.cfg", dir), &f, FS_READ);
ADDRGP4 $399
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1228
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1184
ADDRLP4 1228
INDIRI4
ASGNI4
line 679
;679:		}
LABELV $404
line 680
;680:	}
LABELV $397
line 682
;681:
;682:	soundpath[0] = 0;
ADDRLP4 1032
CNSTI1 0
ASGNI1
line 684
;683:
;684:	if (f)
ADDRLP4 1176
INDIRI4
CNSTI4 0
EQI4 $406
line 685
;685:	{
line 686
;686:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 688
;687:
;688:		trap_FS_Read(soundpath, fLen, f);
ADDRLP4 1032
ARGP4
ADDRLP4 1184
INDIRI4
ARGI4
ADDRLP4 1176
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 690
;689:
;690:		i = fLen;
ADDRLP4 0
ADDRLP4 1184
INDIRI4
ASGNI4
ADDRGP4 $409
JUMPV
LABELV $408
line 693
;691:
;692:		while (i >= 0 && soundpath[i] != '\n')
;693:		{
line 694
;694:			if (soundpath[i] == 'f')
ADDRLP4 0
INDIRI4
ADDRLP4 1032
ADDP4
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $411
line 695
;695:			{
line 696
;696:				isFemale = qtrue;
ADDRLP4 1100
CNSTI4 1
ASGNI4
line 697
;697:			}
LABELV $411
line 699
;698:
;699:			i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 700
;700:		}
LABELV $409
line 692
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $413
ADDRLP4 0
INDIRI4
ADDRLP4 1032
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $408
LABELV $413
line 702
;701:
;702:		soundpath[i-1] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 1032-1
ADDP4
CNSTI1 0
ASGNI1
line 704
;703:
;704:		trap_FS_FCloseFile(f);
ADDRLP4 1176
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 705
;705:	}
LABELV $406
line 707
;706:
;707:	if (isFemale)
ADDRLP4 1100
INDIRI4
CNSTI4 0
EQI4 $415
line 708
;708:	{
line 709
;709:		ci->gender = GENDER_FEMALE;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 1
ASGNI4
line 710
;710:	}
ADDRGP4 $416
JUMPV
LABELV $415
line 712
;711:	else
;712:	{
line 713
;713:		ci->gender = GENDER_MALE;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 714
;714:	}
LABELV $416
line 716
;715:
;716:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $417
line 717
;717:		s = cg_customSoundNames[i];
ADDRLP4 1028
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 718
;718:		if ( !s ) {
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
line 719
;719:			break;
ADDRGP4 $419
JUMPV
LABELV $421
line 722
;720:		}
;721:
;722:		Com_sprintf(soundName, sizeof(soundName), "%s", s+1);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $423
ARGP4
ADDRLP4 1028
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 723
;723:		COM_StripExtension(soundName, soundName);
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 728
;724:		//strip the extension because we might want .mp3's
;725:
;726:		//ci->sounds[i] = 0;
;727:		// if the model didn't load use the sounds of the default model
;728:		if (soundpath[0])
ADDRLP4 1032
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $424
line 729
;729:		{
line 730
;730:			ci->sounds[i] = trap_S_RegisterSound( va("sound/%s/%s", soundpath, soundName) );
ADDRGP4 $426
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 732
;731:
;732:			if (!ci->sounds[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $425
line 733
;733:			{
line 734
;734:				if (isFemale)
ADDRLP4 1100
INDIRI4
CNSTI4 0
EQI4 $429
line 735
;735:				{
line 736
;736:					ci->sounds[i] = trap_S_RegisterSound( va("sound/%s/%s", DEFAULT_FEMALE_SOUNDPATH, soundName) );
ADDRGP4 $426
ARGP4
ADDRGP4 $431
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 1228
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1228
INDIRI4
ASGNI4
line 737
;737:				}
ADDRGP4 $425
JUMPV
LABELV $429
line 739
;738:				else
;739:				{
line 740
;740:					ci->sounds[i] = trap_S_RegisterSound( va("sound/%s/%s", DEFAULT_MALE_SOUNDPATH, soundName) );
ADDRGP4 $426
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 1228
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1228
INDIRI4
ASGNI4
line 741
;741:				}
line 742
;742:			}
line 743
;743:		}
ADDRGP4 $425
JUMPV
LABELV $424
line 745
;744:		else
;745:		{
line 746
;746:			if (modelloaded)
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $432
line 747
;747:			{
line 748
;748:				ci->sounds[i] = trap_S_RegisterSound( va("sound/chars/%s/misc/%s", dir, soundName) );
ADDRGP4 $434
ARGP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 749
;749:			}
LABELV $432
line 751
;750:
;751:			if ( !ci->sounds[i] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $435
line 752
;752:			{
line 753
;753:				ci->sounds[i] = trap_S_RegisterSound( va("sound/%s/%s", fallback, soundName) );
ADDRGP4 $426
ARGP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 754
;754:			}
LABELV $435
line 755
;755:		}
LABELV $425
line 756
;756:	}
LABELV $418
line 716
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $417
LABELV $419
line 758
;757:
;758:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 762
;759:
;760:	// reset any existing players and bodies, because they might be in bad
;761:	// frames for this new model
;762:	clientNum = ci - cgs.clientinfo;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+43024
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 788
DIVI4
ASGNI4
line 763
;763:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $438
line 764
;764:		if ( cg_entities[i].currentState.clientNum == clientNum
ADDRLP4 1216
CNSTI4 1920
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1216
INDIRI4
ADDRGP4 cg_entities+220
ADDP4
INDIRI4
ADDRLP4 1096
INDIRI4
NEI4 $442
ADDRLP4 1216
INDIRI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $442
line 765
;765:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
line 766
;766:			CG_ResetPlayerEntity( &cg_entities[i] );
CNSTI4 1920
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 767
;767:		}
LABELV $442
line 768
;768:	}
LABELV $439
line 763
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $438
line 769
;769:}
LABELV $352
endproc CG_LoadClientInfo 1264 24
proc CG_CopyClientInfoModel 76 12
line 779
;770:
;771:
;772:
;773:
;774:/*
;775:======================
;776:CG_CopyClientInfoModel
;777:======================
;778:*/
;779:static void CG_CopyClientInfoModel( clientInfo_t *from, clientInfo_t *to ) {
line 780
;780:	VectorCopy( from->headOffset, to->headOffset );
ADDRLP4 0
CNSTI4 464
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 781
;781:	to->footsteps = from->footsteps;
ADDRLP4 4
CNSTI4 476
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 782
;782:	to->gender = from->gender;
ADDRLP4 8
CNSTI4 480
ASGNI4
ADDRFP4 4
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
line 784
;783:
;784:	to->legsModel = from->legsModel;
ADDRLP4 12
CNSTI4 484
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 785
;785:	to->legsSkin = from->legsSkin;
ADDRLP4 16
CNSTI4 488
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 786
;786:	to->torsoModel = from->torsoModel;
ADDRLP4 20
CNSTI4 492
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 787
;787:	to->torsoSkin = from->torsoSkin;
ADDRLP4 24
CNSTI4 496
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 790
;788:	//to->headModel = from->headModel;
;789:	//to->headSkin = from->headSkin;
;790:	to->modelIcon = from->modelIcon;
ADDRLP4 28
CNSTI4 508
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 792
;791:
;792:	to->newAnims = from->newAnims;
ADDRLP4 32
CNSTI4 452
ASGNI4
ADDRFP4 4
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
ASGNI4
line 796
;793:
;794:	//to->ghoul2Model = from->ghoul2Model;
;795:	//rww - Trying to use the same ghoul2 pointer for two seperate clients == DISASTER
;796:	if (to->ghoul2Model && trap_G2_HaveWeGhoul2Models(to->ghoul2Model))
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $447
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $447
line 797
;797:	{
line 798
;798:		trap_G2API_CleanGhoul2Models(&to->ghoul2Model);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 799
;799:	}
LABELV $447
line 800
;800:	if (from->ghoul2Model && trap_G2_HaveWeGhoul2Models(from->ghoul2Model))
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $449
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $449
line 801
;801:	{
line 802
;802:		trap_G2API_DuplicateGhoul2Instance(from->ghoul2Model, &to->ghoul2Model);
ADDRLP4 52
CNSTI4 504
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 803
;803:	}
LABELV $449
line 805
;804:
;805:	to->bolt_head = from->bolt_head;
ADDRLP4 52
CNSTI4 520
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 806
;806:	to->bolt_lhand = from->bolt_lhand;
ADDRLP4 56
CNSTI4 516
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 807
;807:	to->bolt_rhand = from->bolt_rhand;
ADDRLP4 60
CNSTI4 512
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 808
;808:	to->bolt_motion = from->bolt_motion;
ADDRLP4 64
CNSTI4 524
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 809
;809:	to->bolt_llumbar = from->bolt_llumbar;
ADDRLP4 68
CNSTI4 528
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 813
;810:
;811://	to->ATST = from->ATST;
;812:
;813:	memcpy( to->sounds, from->sounds, sizeof( to->sounds ) );
ADDRLP4 72
CNSTI4 652
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 814
;814:}
LABELV $446
endproc CG_CopyClientInfoModel 76 12
proc CG_ScanForExistingClientInfo 128 12
line 821
;815:
;816:/*
;817:======================
;818:CG_ScanForExistingClientInfo
;819:======================
;820:*/
;821:static qboolean CG_ScanForExistingClientInfo( clientInfo_t *ci, int clientNum ) {
line 825
;822:	int		i;
;823:	clientInfo_t	*match;
;824:
;825:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $455
JUMPV
LABELV $452
line 826
;826:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 827
;827:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $458
line 828
;828:			continue;
ADDRGP4 $453
JUMPV
LABELV $458
line 830
;829:		}
;830:		if ( match->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $460
line 831
;831:			continue;
ADDRGP4 $453
JUMPV
LABELV $460
line 833
;832:		}
;833:		if ( !Q_stricmp( ci->modelName, match->modelName )
ADDRLP4 8
CNSTI4 160
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $462
ADDRLP4 16
CNSTI4 224
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $462
ADDRLP4 24
CNSTI4 384
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $462
ADDRLP4 32
CNSTI4 352
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $462
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $465
ADDRLP4 40
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
NEI4 $462
LABELV $465
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $462
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $462
line 842
;834:			&& !Q_stricmp( ci->skinName, match->skinName )
;835://			&& !Q_stricmp( ci->headModelName, match->headModelName )
;836://			&& !Q_stricmp( ci->headSkinName, match->headSkinName ) 
;837:			&& !Q_stricmp( ci->blueTeam, match->blueTeam ) 
;838:			&& !Q_stricmp( ci->redTeam, match->redTeam )
;839:			&& (cgs.gametype < GT_TEAM || ci->team == match->team) 
;840:			&& match->ghoul2Model
;841:			&& match->bolt_head) //if the bolts haven't been initialized, this "match" is useless to us
;842:		{
line 845
;843:			// this clientinfo is identical, so use it's handles
;844:
;845:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 851
;846:
;847:			//rww - Filthy hack. If this is actually the info already belonging to us, just reassign the pointer.
;848:			//Switching instances when not necessary produces small animation glitches.
;849:			//Actually, before, were we even freeing the instance attached to the old clientinfo before copying
;850:			//this new clientinfo over it? Could be a nasty leak possibility. (though this should remedy it in theory)
;851:			if (clientNum == i)
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $466
line 852
;852:			{
line 853
;853:				if (match->ghoul2Model && trap_G2_HaveWeGhoul2Models(match->ghoul2Model))
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $467
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $467
line 854
;854:				{ //The match has a valid instance (if it didn't, we'd probably already be fudged (^_^) at this state)
line 855
;855:					if (ci->ghoul2Model && trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $470
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $470
line 856
;856:					{ //First kill the copy we have if we have one. (but it should be null)
line 857
;857:						trap_G2API_CleanGhoul2Models(&ci->ghoul2Model);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 858
;858:					}
LABELV $470
line 860
;859:
;860:					VectorCopy( match->headOffset, ci->headOffset );
ADDRLP4 64
CNSTI4 464
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 861
;861:					ci->footsteps = match->footsteps;
ADDRLP4 68
CNSTI4 476
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 862
;862:					ci->gender = match->gender;
ADDRLP4 72
CNSTI4 480
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 864
;863:
;864:					ci->legsModel = match->legsModel;
ADDRLP4 76
CNSTI4 484
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 865
;865:					ci->legsSkin = match->legsSkin;
ADDRLP4 80
CNSTI4 488
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 866
;866:					ci->torsoModel = match->torsoModel;
ADDRLP4 84
CNSTI4 492
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 867
;867:					ci->torsoSkin = match->torsoSkin;
ADDRLP4 88
CNSTI4 496
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 868
;868:					ci->modelIcon = match->modelIcon;
ADDRLP4 92
CNSTI4 508
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 870
;869:
;870:					ci->newAnims = match->newAnims;
ADDRLP4 96
CNSTI4 452
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 872
;871:
;872:					ci->bolt_head = match->bolt_head;
ADDRLP4 100
CNSTI4 520
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 873
;873:					ci->bolt_lhand = match->bolt_lhand;
ADDRLP4 104
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 874
;874:					ci->bolt_rhand = match->bolt_rhand;
ADDRLP4 108
CNSTI4 512
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 875
;875:					ci->bolt_motion = match->bolt_motion;
ADDRLP4 112
CNSTI4 524
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 876
;876:					ci->bolt_llumbar = match->bolt_llumbar;
ADDRLP4 116
CNSTI4 528
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 878
;877:
;878:					memcpy( ci->sounds, match->sounds, sizeof( ci->sounds ) );
ADDRLP4 120
CNSTI4 652
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 883
;879:
;880:					//We can share this pointer, because it already belongs to this client.
;881:					//The pointer itself and the ghoul2 instance is never actually changed, just passed between
;882:					//clientinfo structures.
;883:					ci->ghoul2Model = match->ghoul2Model;
ADDRLP4 124
CNSTI4 504
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 884
;884:				}
line 885
;885:			}
ADDRGP4 $467
JUMPV
LABELV $466
line 887
;886:			else
;887:			{
line 888
;888:				CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 889
;889:			}
LABELV $467
line 891
;890:
;891:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $451
JUMPV
LABELV $462
line 893
;892:		}
;893:	}
LABELV $453
line 825
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $455
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $452
line 896
;894:
;895:	// nothing matches, so defer the load
;896:	return qfalse;
CNSTI4 0
RETI4
LABELV $451
endproc CG_ScanForExistingClientInfo 128 12
proc CG_SetDeferredClientInfo 36 8
line 907
;897:}
;898:
;899:/*
;900:======================
;901:CG_SetDeferredClientInfo
;902:
;903:We aren't going to load it now, so grab some other
;904:client's info to use until we have some spare time.
;905:======================
;906:*/
;907:static void CG_SetDeferredClientInfo( clientInfo_t *ci ) {
line 913
;908:	int		i;
;909:	clientInfo_t	*match;
;910:
;911:	// if someone else is already the same models and skins we
;912:	// can just load the client info
;913:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $476
JUMPV
LABELV $473
line 914
;914:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 915
;915:		if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $481
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $479
LABELV $481
line 916
;916:			continue;
ADDRGP4 $474
JUMPV
LABELV $479
line 918
;917:		}
;918:		if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 224
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $486
ADDRLP4 24
CNSTI4 160
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $486
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $482
ADDRLP4 32
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $482
LABELV $486
line 922
;919:			 Q_stricmp( ci->modelName, match->modelName ) ||
;920://			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;921://			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;922:			 (cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 923
;923:			continue;
ADDRGP4 $474
JUMPV
LABELV $482
line 926
;924:		}
;925:		// just load the real info cause it uses the same models and skins
;926:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 927
;927:		return;
ADDRGP4 $472
JUMPV
LABELV $474
line 913
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $476
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $473
line 931
;928:	}
;929:
;930:	// if we are in teamplay, only grab a model if the skin is correct
;931:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $487
line 932
;932:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $493
JUMPV
LABELV $490
line 933
;933:			match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 934
;934:			if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $498
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $496
LABELV $498
line 935
;935:				continue;
ADDRGP4 $491
JUMPV
LABELV $496
line 937
;936:			}
;937:			if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 224
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $502
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $499
ADDRLP4 24
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
EQI4 $499
LABELV $502
line 938
;938:				(cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 939
;939:				continue;
ADDRGP4 $491
JUMPV
LABELV $499
line 941
;940:			}
;941:			ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 1
ASGNI4
line 942
;942:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 943
;943:			return;
ADDRGP4 $472
JUMPV
LABELV $491
line 932
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $493
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $490
line 949
;944:		}
;945:		// load the full model, because we don't ever want to show
;946:		// an improper team skin.  This will cause a hitch for the first
;947:		// player, when the second enters.  Combat shouldn't be going on
;948:		// yet, so it shouldn't matter
;949:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 950
;950:		return;
ADDRGP4 $472
JUMPV
LABELV $487
line 954
;951:	}
;952:
;953:	// find the first valid clientinfo and grab its stuff
;954:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $506
JUMPV
LABELV $503
line 955
;955:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 956
;956:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $509
line 957
;957:			continue;
ADDRGP4 $504
JUMPV
LABELV $509
line 960
;958:		}
;959:
;960:		ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 1
ASGNI4
line 961
;961:		CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 962
;962:		return;
ADDRGP4 $472
JUMPV
LABELV $504
line 954
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $506
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $503
line 966
;963:	}
;964:
;965:	// we should never get here...
;966:	CG_Printf( "CG_SetDeferredClientInfo: no valid clients!\n" );
ADDRGP4 $511
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 968
;967:
;968:	CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 969
;969:}
LABELV $472
endproc CG_SetDeferredClientInfo 36 8
export CG_NewClientInfo
proc CG_NewClientInfo 980 40
line 976
;970:
;971:/*
;972:======================
;973:CG_NewClientInfo
;974:======================
;975:*/
;976:void CG_NewClientInfo( int clientNum, qboolean entitiesInitialized ) {
line 983
;977:	clientInfo_t *ci;
;978:	clientInfo_t newInfo;
;979:	const char	*configstring;
;980:	const char	*v;
;981:	char		*slash;
;982:	void *oldGhoul2;
;983:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 984
;984:	qboolean wasATST = qfalse;
ADDRLP4 804
CNSTI4 0
ASGNI4
line 986
;985:
;986:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 800
CNSTI4 788
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 988
;987:
;988:	oldGhoul2 = ci->ghoul2Model;
ADDRLP4 812
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
line 990
;989:
;990:	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 816
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 796
ADDRLP4 816
INDIRP4
ASGNP4
line 991
;991:	if ( !configstring[0] ) {
ADDRLP4 796
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $514
line 992
;992:		memset( ci, 0, sizeof( *ci ) );
ADDRLP4 800
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ARGI4
ADDRGP4 memset
CALLP4
pop
line 993
;993:		return;		// player just left
ADDRGP4 $512
JUMPV
LABELV $514
line 996
;994:	}
;995:
;996:	if (ci)
ADDRLP4 800
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $516
line 997
;997:	{
line 998
;998:		wasATST = ci->ATST;
ADDRLP4 804
ADDRLP4 800
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ASGNI4
line 999
;999:	}
LABELV $516
line 1003
;1000:
;1001:	// build into a temp buffer so the defer checks can use
;1002:	// the old value
;1003:	memset( &newInfo, 0, sizeof( newInfo ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1006
;1004:
;1005:	// isolate the player's name
;1006:	v = Info_ValueForKey(configstring, "n");
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $518
ARGP4
ADDRLP4 820
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 820
INDIRP4
ASGNP4
line 1007
;1007:	Q_strncpyz( newInfo.name, v, sizeof( newInfo.name ) );
ADDRLP4 4+4
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1010
;1008:
;1009:	// colors
;1010:	v = Info_ValueForKey( configstring, "c1" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $521
ARGP4
ADDRLP4 824
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 824
INDIRP4
ASGNP4
line 1011
;1011:	CG_ColorFromString( v, newInfo.color1 );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 4+80
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 1013
;1012:
;1013:	newInfo.icolor1 = atoi(v);
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 828
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+104
ADDRLP4 828
INDIRI4
ASGNI4
line 1015
;1014:
;1015:	v = Info_ValueForKey( configstring, "c2" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 832
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 832
INDIRP4
ASGNP4
line 1016
;1016:	CG_ColorFromString( v, newInfo.color2 );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 4+92
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 1019
;1017:
;1018:	// bot skill
;1019:	v = Info_ValueForKey( configstring, "skill" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $526
ARGP4
ADDRLP4 836
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 836
INDIRP4
ASGNP4
line 1020
;1020:	newInfo.botSkill = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 840
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+72
ADDRLP4 840
INDIRI4
ASGNI4
line 1023
;1021:
;1022:	// handicap
;1023:	v = Info_ValueForKey( configstring, "hc" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $528
ARGP4
ADDRLP4 844
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 844
INDIRP4
ASGNP4
line 1024
;1024:	newInfo.handicap = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 848
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+128
ADDRLP4 848
INDIRI4
ASGNI4
line 1027
;1025:
;1026:	// wins
;1027:	v = Info_ValueForKey( configstring, "w" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $530
ARGP4
ADDRLP4 852
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 852
INDIRP4
ASGNP4
line 1028
;1028:	newInfo.wins = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 856
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+132
ADDRLP4 856
INDIRI4
ASGNI4
line 1031
;1029:
;1030:	// losses
;1031:	v = Info_ValueForKey( configstring, "l" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $532
ARGP4
ADDRLP4 860
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 860
INDIRP4
ASGNP4
line 1032
;1032:	newInfo.losses = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 864
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+136
ADDRLP4 864
INDIRI4
ASGNI4
line 1035
;1033:
;1034:	// team
;1035:	v = Info_ValueForKey( configstring, "t" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 868
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 868
INDIRP4
ASGNP4
line 1036
;1036:	newInfo.team = atoi( v );
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 872
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+68
ADDRLP4 872
INDIRI4
ASGNI4
line 1039
;1037:
;1038:	// team task
;1039:	v = Info_ValueForKey( configstring, "tt" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $536
ARGP4
ADDRLP4 876
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 876
INDIRP4
ASGNP4
line 1040
;1040:	newInfo.teamTask = atoi(v);
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 880
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+140
ADDRLP4 880
INDIRI4
ASGNI4
line 1043
;1041:
;1042:	// team leader
;1043:	v = Info_ValueForKey( configstring, "tl" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 884
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 884
INDIRP4
ASGNP4
line 1044
;1044:	newInfo.teamLeader = atoi(v);
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 888
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+144
ADDRLP4 888
INDIRI4
ASGNI4
line 1046
;1045:
;1046:	v = Info_ValueForKey( configstring, "g_redteam" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $540
ARGP4
ADDRLP4 892
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 892
INDIRP4
ASGNP4
line 1047
;1047:	Q_strncpyz(newInfo.redTeam, v, MAX_TEAMNAME);
ADDRLP4 4+352
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1049
;1048:
;1049:	v = Info_ValueForKey( configstring, "g_blueteam" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $542
ARGP4
ADDRLP4 896
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 896
INDIRP4
ASGNP4
line 1050
;1050:	Q_strncpyz(newInfo.blueTeam, v, MAX_TEAMNAME);
ADDRLP4 4+384
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1053
;1051:
;1052:	// model
;1053:	v = Info_ValueForKey( configstring, "model" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 900
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 900
INDIRP4
ASGNP4
line 1054
;1054:	if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $545
line 1060
;1055:		// forcemodel makes everyone use a single model
;1056:		// to prevent load hitches
;1057:		char modelStr[MAX_QPATH];
;1058:		char *skin;
;1059:
;1060:		if( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $548
line 1061
;1061:			Q_strncpyz( newInfo.modelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.modelName ) );
ADDRLP4 4+160
ARGP4
ADDRGP4 $160
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1062
;1062:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRGP4 $213
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1063
;1063:		} else {
ADDRGP4 $549
JUMPV
LABELV $548
line 1064
;1064:			trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $544
ARGP4
ADDRLP4 904
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1065
;1065:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
ADDRLP4 904
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 972
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 968
ADDRLP4 972
INDIRP4
ASGNP4
ADDRLP4 972
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $555
line 1066
;1066:				skin = "default";
ADDRLP4 968
ADDRGP4 $213
ASGNP4
line 1067
;1067:			} else {
ADDRGP4 $556
JUMPV
LABELV $555
line 1068
;1068:				*skin++ = 0;
ADDRLP4 976
ADDRLP4 968
INDIRP4
ASGNP4
ADDRLP4 968
ADDRLP4 976
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 976
INDIRP4
CNSTI1 0
ASGNI1
line 1069
;1069:			}
LABELV $556
line 1071
;1070:
;1071:			Q_strncpyz( newInfo.skinName, skin, sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1072
;1072:			Q_strncpyz( newInfo.modelName, modelStr, sizeof( newInfo.modelName ) );
ADDRLP4 4+160
ARGP4
ADDRLP4 904
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1073
;1073:		}
LABELV $549
line 1075
;1074:
;1075:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $546
line 1077
;1076:			// keep skin name
;1077:			slash = strchr( v, '/' );
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 972
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 808
ADDRLP4 972
INDIRP4
ASGNP4
line 1078
;1078:			if ( slash ) {
ADDRLP4 808
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $546
line 1079
;1079:				Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRLP4 808
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1080
;1080:			}
line 1081
;1081:		}
line 1082
;1082:	} else {
ADDRGP4 $546
JUMPV
LABELV $545
line 1083
;1083:		Q_strncpyz( newInfo.modelName, v, sizeof( newInfo.modelName ) );
ADDRLP4 4+160
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1085
;1084:
;1085:		slash = strchr( newInfo.modelName, '/' );
ADDRLP4 4+160
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 904
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 808
ADDRLP4 904
INDIRP4
ASGNP4
line 1086
;1086:		if ( !slash ) {
ADDRLP4 808
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $571
line 1088
;1087:			// modelName didn not include a skin name
;1088:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRGP4 $213
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1089
;1089:		} else {
ADDRGP4 $572
JUMPV
LABELV $571
line 1090
;1090:			Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
ADDRLP4 4+224
ARGP4
ADDRLP4 808
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1092
;1091:			// truncate modelName
;1092:			*slash = 0;
ADDRLP4 808
INDIRP4
CNSTI1 0
ASGNI1
line 1093
;1093:		}
LABELV $572
line 1094
;1094:	}
LABELV $546
line 1142
;1095:
;1096:	// head model
;1097:/*
;1098:	v = Info_ValueForKey( configstring, "hmodel" );
;1099:	if ( cg_forceModel.integer ) {
;1100:		// forcemodel makes everyone use a single model
;1101:		// to prevent load hitches
;1102:		char modelStr[MAX_QPATH];
;1103:		char *skin;
;1104:
;1105:		if( cgs.gametype >= GT_TEAM ) {
;1106:			Q_strncpyz( newInfo.headModelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.headModelName ) );
;1107:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
;1108:		} else {
;1109:			trap_Cvar_VariableStringBuffer( "headmodel", modelStr, sizeof( modelStr ) );
;1110:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
;1111:				skin = "default";
;1112:			} else {
;1113:				*skin++ = 0;
;1114:			}
;1115:
;1116:			Q_strncpyz( newInfo.headSkinName, skin, sizeof( newInfo.headSkinName ) );
;1117:			Q_strncpyz( newInfo.headModelName, modelStr, sizeof( newInfo.headModelName ) );
;1118:		}
;1119:
;1120:		if ( cgs.gametype >= GT_TEAM ) {
;1121:			// keep skin name
;1122:			slash = strchr( v, '/' );
;1123:			if ( slash ) {
;1124:				Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
;1125:			}
;1126:		}
;1127:	} else {
;1128:		Q_strncpyz( newInfo.headModelName, v, sizeof( newInfo.headModelName ) );
;1129:
;1130:		slash = strchr( newInfo.headModelName, '/' );
;1131:		if ( !slash ) {
;1132:			// modelName didn not include a skin name
;1133:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
;1134:		} else {
;1135:			Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
;1136:			// truncate modelName
;1137:			*slash = 0;
;1138:		}
;1139:	}
;1140:*/
;1141:	// force powers
;1142:	v = Info_ValueForKey( configstring, "forcepowers" );
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 $577
ARGP4
ADDRLP4 904
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 792
ADDRLP4 904
INDIRP4
ASGNP4
line 1143
;1143:	Q_strncpyz( newInfo.forcePowers, v, sizeof( newInfo.forcePowers ) );
ADDRLP4 4+288
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1145
;1144:
;1145:	newInfo.ATST = wasATST;
ADDRLP4 4+500
ADDRLP4 804
INDIRI4
ASGNI4
line 1147
;1146:
;1147:	if (cgs.gametype >= GT_TEAM	&& !cgs.jediVmerc )
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $581
ADDRGP4 cgs+32996
INDIRI4
CNSTI4 0
NEI4 $581
line 1148
;1148:	{
line 1149
;1149:		if (newInfo.team == TEAM_RED)
ADDRLP4 4+68
INDIRI4
CNSTI4 1
NEI4 $585
line 1150
;1150:		{
line 1151
;1151:			strcpy(newInfo.skinName, "red");
ADDRLP4 4+224
ARGP4
ADDRGP4 $176
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1153
;1152://			strcpy(newInfo.headSkinName, "red");
;1153:		}
LABELV $585
line 1154
;1154:		if (newInfo.team == TEAM_BLUE)
ADDRLP4 4+68
INDIRI4
CNSTI4 2
NEI4 $589
line 1155
;1155:		{
line 1156
;1156:			strcpy(newInfo.skinName, "blue");
ADDRLP4 4+224
ARGP4
ADDRGP4 $177
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1158
;1157://			strcpy(newInfo.headSkinName, "blue");
;1158:		}
LABELV $589
line 1159
;1159:	}
LABELV $581
line 1163
;1160:
;1161:	// scan for an existing clientinfo that matches this modelname
;1162:	// so we can avoid loading checks if possible
;1163:	if ( !CG_ScanForExistingClientInfo( &newInfo, clientNum ) ) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 908
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 908
INDIRI4
CNSTI4 0
NEI4 $593
line 1166
;1164:		qboolean	forceDefer;
;1165:
;1166:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 920
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 920
INDIRI4
CNSTI4 4000000
GEI4 $596
ADDRLP4 916
CNSTI4 1
ASGNI4
ADDRGP4 $597
JUMPV
LABELV $596
ADDRLP4 916
CNSTI4 0
ASGNI4
LABELV $597
ADDRLP4 912
ADDRLP4 916
INDIRI4
ASGNI4
line 1169
;1167:
;1168:		// if we are defering loads, just have it pick the first valid
;1169:		if (cg.snap && cg.snap->ps.clientNum == clientNum && !forceDefer)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $598
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $598
ADDRLP4 912
INDIRI4
CNSTI4 0
NEI4 $598
line 1170
;1170:		{ //rww - don't defer your own client info ever, unless really low on memory
line 1171
;1171:			CG_LoadClientInfo( &newInfo );
ADDRLP4 4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1172
;1172:		}
ADDRGP4 $599
JUMPV
LABELV $598
line 1173
;1173:		else if ( forceDefer || ( cg_deferPlayers.integer && !cg_buildScript.integer && !cg.loading ) ) {
ADDRLP4 924
CNSTI4 0
ASGNI4
ADDRLP4 912
INDIRI4
ADDRLP4 924
INDIRI4
NEI4 $607
ADDRGP4 cg_deferPlayers+12
INDIRI4
ADDRLP4 924
INDIRI4
EQI4 $602
ADDRGP4 cg_buildScript+12
INDIRI4
ADDRLP4 924
INDIRI4
NEI4 $602
ADDRGP4 cg+20
INDIRI4
ADDRLP4 924
INDIRI4
NEI4 $602
LABELV $607
line 1175
;1174:			// keep whatever they had if it won't violate team skins
;1175:			CG_SetDeferredClientInfo( &newInfo );
ADDRLP4 4
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 1177
;1176:			// if we are low on memory, leave them with this model
;1177:			if ( forceDefer ) {
ADDRLP4 912
INDIRI4
CNSTI4 0
EQI4 $603
line 1178
;1178:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $610
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1179
;1179:				newInfo.deferred = qfalse;
ADDRLP4 4+448
CNSTI4 0
ASGNI4
line 1180
;1180:			}
line 1181
;1181:		} else {
ADDRGP4 $603
JUMPV
LABELV $602
line 1182
;1182:			CG_LoadClientInfo( &newInfo );
ADDRLP4 4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1183
;1183:		}
LABELV $603
LABELV $599
line 1184
;1184:	}
LABELV $593
line 1187
;1185:
;1186:	// replace whatever was there with the new one
;1187:	newInfo.infoValid = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1188
;1188:	if (ci->ghoul2Model &&
ADDRLP4 912
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ASGNP4
ADDRLP4 916
ADDRLP4 912
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 916
INDIRU4
CNSTU4 0
EQU4 $612
ADDRLP4 916
INDIRU4
ADDRLP4 4+504
INDIRP4
CVPU4 4
EQU4 $612
ADDRLP4 912
INDIRP4
ARGP4
ADDRLP4 920
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 920
INDIRI4
CNSTI4 0
EQI4 $612
line 1191
;1189:		ci->ghoul2Model != newInfo.ghoul2Model &&
;1190:		trap_G2_HaveWeGhoul2Models(ci->ghoul2Model))
;1191:	{ //We must kill this instance before we remove our only pointer to it from the cgame.
line 1193
;1192:	  //Otherwise we will end up with extra instances all over the place, I think.
;1193:		trap_G2API_CleanGhoul2Models(&ci->ghoul2Model);
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 1194
;1194:	}
LABELV $612
line 1195
;1195:	*ci = newInfo;
ADDRLP4 800
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 788
ADDRGP4 $616
JUMPV
LABELV $615
line 1199
;1196:
;1197:	//force a weapon change anyway, for all clients being rendered to the current client
;1198:	while (i < MAX_CLIENTS)
;1199:	{
line 1200
;1200:		cg_entities[i].ghoul2weapon = NULL;
CNSTI4 1920
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+960
ADDP4
CNSTP4 0
ASGNP4
line 1201
;1201:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1202
;1202:	}
LABELV $616
line 1198
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $615
line 1205
;1203:
;1204:	// Check if the ghoul2 model changed in any way.  This is safer than assuming we have a legal cent shile loading info.
;1205:	if (entitiesInitialized && ci->ghoul2Model && (oldGhoul2 != ci->ghoul2Model))
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $619
ADDRLP4 924
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 924
INDIRU4
CNSTU4 0
EQU4 $619
ADDRLP4 812
INDIRP4
CVPU4 4
ADDRLP4 924
INDIRU4
EQU4 $619
line 1206
;1206:	{	// Copy the new ghoul2 model to the centity.
line 1208
;1207:		animation_t *anim;
;1208:		centity_t *cent = &cg_entities[clientNum];
ADDRLP4 932
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1210
;1209:		
;1210:		anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.legsAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 928
CNSTI4 28
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 1212
;1211:
;1212:		if (anim)
ADDRLP4 928
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $622
line 1213
;1213:		{
line 1214
;1214:			int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 936
CNSTI4 72
ASGNI4
line 1215
;1215:			int firstFrame = anim->firstFrame;
ADDRLP4 944
ADDRLP4 928
INDIRP4
INDIRI4
ASGNI4
line 1216
;1216:			int setFrame = -1;
ADDRLP4 940
CNSTI4 -1
ASGNI4
line 1217
;1217:			float animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 948
CNSTF4 1112014848
ADDRLP4 928
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1219
;1218:
;1219:			if (anim->loopFrames != -1)
ADDRLP4 928
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $624
line 1220
;1220:			{
line 1221
;1221:				flags |= BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 936
ADDRLP4 936
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1222
;1222:			}
LABELV $624
line 1224
;1223:
;1224:			if (cent->pe.legs.frame >= anim->firstFrame && cent->pe.legs.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 952
ADDRLP4 932
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
ADDRLP4 960
ADDRLP4 928
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 952
INDIRI4
ADDRLP4 960
INDIRI4
LTI4 $626
ADDRLP4 952
INDIRI4
ADDRLP4 960
INDIRI4
ADDRLP4 928
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $626
line 1225
;1225:			{
line 1226
;1226:				setFrame = cent->pe.legs.frame;
ADDRLP4 940
ADDRLP4 932
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 1227
;1227:			}
LABELV $626
line 1230
;1228:
;1229:			//rww - Set the animation again because it just got reset due to the model change
;1230:			trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, setFrame, 150);
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 944
INDIRI4
ARGI4
ADDRLP4 928
INDIRP4
INDIRI4
ADDRLP4 928
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 936
INDIRI4
ARGI4
ADDRLP4 948
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 940
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1232
;1231:
;1232:			cg_entities[clientNum].currentState.legsAnim = 0;
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
CNSTI4 0
ASGNI4
line 1233
;1233:		}
LABELV $622
line 1235
;1234:
;1235:		anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.torsoAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 928
CNSTI4 28
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 1237
;1236:
;1237:		if (anim)
ADDRLP4 928
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $631
line 1238
;1238:		{
line 1239
;1239:			int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 936
CNSTI4 72
ASGNI4
line 1240
;1240:			int firstFrame = anim->firstFrame;
ADDRLP4 944
ADDRLP4 928
INDIRP4
INDIRI4
ASGNI4
line 1241
;1241:			int setFrame = -1;
ADDRLP4 940
CNSTI4 -1
ASGNI4
line 1242
;1242:			float animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 948
CNSTF4 1112014848
ADDRLP4 928
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1244
;1243:
;1244:			if (anim->loopFrames != -1)
ADDRLP4 928
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $633
line 1245
;1245:			{
line 1246
;1246:				flags |= BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 936
ADDRLP4 936
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1247
;1247:			}
LABELV $633
line 1249
;1248:
;1249:			if (cent->pe.torso.frame >= anim->firstFrame && cent->pe.torso.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 952
ADDRLP4 932
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
ADDRLP4 960
ADDRLP4 928
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 952
INDIRI4
ADDRLP4 960
INDIRI4
LTI4 $635
ADDRLP4 952
INDIRI4
ADDRLP4 960
INDIRI4
ADDRLP4 928
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $635
line 1250
;1250:			{
line 1251
;1251:				setFrame = cent->pe.torso.frame;
ADDRLP4 940
ADDRLP4 932
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 1252
;1252:			}
LABELV $635
line 1255
;1253:
;1254:			//rww - Set the animation again because it just got reset due to the model change
;1255:			trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "lower_lumbar", firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, setFrame, 150);
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 944
INDIRI4
ARGI4
ADDRLP4 928
INDIRP4
INDIRI4
ADDRLP4 928
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 936
INDIRI4
ARGI4
ADDRLP4 948
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 940
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1257
;1256:
;1257:			cg_entities[clientNum].currentState.torsoAnim = 0;
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
CNSTI4 0
ASGNI4
line 1258
;1258:		}
LABELV $631
line 1260
;1259:
;1260:		if (cg_entities[clientNum].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[clientNum].ghoul2))
ADDRLP4 936
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 936
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $639
ADDRLP4 936
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ARGP4
ADDRLP4 940
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 940
INDIRI4
CNSTI4 0
EQI4 $639
line 1261
;1261:		{
line 1262
;1262:			trap_G2API_CleanGhoul2Models(&cg_entities[clientNum].ghoul2);
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 1263
;1263:		}
LABELV $639
line 1264
;1264:		trap_G2API_DuplicateGhoul2Instance(ci->ghoul2Model, &cg_entities[clientNum].ghoul2);
ADDRLP4 800
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 1265
;1265:	}
LABELV $619
line 1266
;1266:}
LABELV $512
endproc CG_NewClientInfo 980 40
data
export cgQueueLoad
align 4
LABELV cgQueueLoad
byte 4 0
export CG_ActualLoadDeferredPlayers
code
proc CG_ActualLoadDeferredPlayers 20 4
line 1278
;1267:
;1268:
;1269:qboolean cgQueueLoad = qfalse;
;1270:/*
;1271:======================
;1272:CG_ActualLoadDeferredPlayers
;1273:
;1274:Called at the beginning of CG_Player if cgQueueLoad is set.
;1275:======================
;1276:*/
;1277:void CG_ActualLoadDeferredPlayers( void )
;1278:{
line 1283
;1279:	int		i;
;1280:	clientInfo_t	*ci;
;1281:
;1282:	// scan for a deferred player to load
;1283:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+43024
ASGNP4
ADDRGP4 $649
JUMPV
LABELV $646
line 1284
;1284:		if ( ci->infoValid && ci->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $652
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $652
line 1286
;1285:			// if we are low on memory, leave it deferred
;1286:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 16
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 4000000
GEI4 $654
line 1287
;1287:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $610
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1288
;1288:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 1289
;1289:				continue;
ADDRGP4 $647
JUMPV
LABELV $654
line 1291
;1290:			}
;1291:			CG_LoadClientInfo( ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1293
;1292://			break;
;1293:		}
LABELV $652
line 1294
;1294:	}
LABELV $647
line 1283
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
ASGNP4
LABELV $649
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $646
line 1295
;1295:}
LABELV $645
endproc CG_ActualLoadDeferredPlayers 20 4
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 0 0
line 1306
;1296:
;1297:/*
;1298:======================
;1299:CG_LoadDeferredPlayers
;1300:
;1301:Called each frame when a player is dead
;1302:and the scoreboard is up
;1303:so deferred players can be loaded
;1304:======================
;1305:*/
;1306:void CG_LoadDeferredPlayers( void ) {
line 1307
;1307:	cgQueueLoad = qtrue;
ADDRGP4 cgQueueLoad
CNSTI4 1
ASGNI4
line 1308
;1308:}
LABELV $656
endproc CG_LoadDeferredPlayers 0 0
export CG_InRoll
proc CG_InRoll 8 0
line 1321
;1309:
;1310:/*
;1311:=============================================================================
;1312:
;1313:PLAYER ANIMATION
;1314:
;1315:=============================================================================
;1316:*/
;1317:
;1318:static qboolean CG_FirstAnimFrame(lerpFrame_t *lf, qboolean torsoOnly, float speedScale);
;1319:
;1320:qboolean CG_InRoll( centity_t *cent )
;1321:{
line 1322
;1322:	switch ( (cent->currentState.legsAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 885
LTI4 $658
ADDRLP4 0
INDIRI4
CNSTI4 888
GTI4 $658
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $665-3540
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $665
address $661
address $661
address $661
address $661
code
line 1323
;1323:	{
LABELV $661
line 1328
;1324:	case BOTH_ROLL_F:
;1325:	case BOTH_ROLL_B:
;1326:	case BOTH_ROLL_R:
;1327:	case BOTH_ROLL_L:
;1328:		if ( cent->pe.legs.animationTime > cg.time )
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $659
line 1329
;1329:		{
line 1330
;1330:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $657
JUMPV
line 1332
;1331:		}
;1332:		break;
LABELV $658
LABELV $659
line 1334
;1333:	}
;1334:	return qfalse;
CNSTI4 0
RETI4
LABELV $657
endproc CG_InRoll 8 0
export CG_InRollAnim
proc CG_InRollAnim 8 0
line 1338
;1335:}
;1336:
;1337:qboolean CG_InRollAnim( centity_t *cent )
;1338:{
line 1339
;1339:	switch ( (cent->currentState.legsAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 885
LTI4 $668
ADDRLP4 0
INDIRI4
CNSTI4 888
GTI4 $668
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $672-3540
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $672
address $671
address $671
address $671
address $671
code
line 1340
;1340:	{
LABELV $671
line 1345
;1341:	case BOTH_ROLL_F:
;1342:	case BOTH_ROLL_B:
;1343:	case BOTH_ROLL_R:
;1344:	case BOTH_ROLL_L:
;1345:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $667
JUMPV
LABELV $668
line 1347
;1346:	}
;1347:	return qfalse;
CNSTI4 0
RETI4
LABELV $667
endproc CG_InRollAnim 8 0
proc CG_SetLerpFrameAnimation 76 40
line 1357
;1348:}
;1349:
;1350:/*
;1351:===============
;1352:CG_SetLerpFrameAnimation
;1353:
;1354:may include ANIM_TOGGLEBIT
;1355:===============
;1356:*/
;1357:static void CG_SetLerpFrameAnimation( centity_t *cent, clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float animSpeedMult, qboolean torsoOnly) {
line 1360
;1358:	animation_t	*anim;
;1359:	float animSpeed;
;1360:	int	  flags=BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 4
CNSTI4 72
ASGNI4
line 1361
;1361:	int oldAnim = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 1362
;1362:	int blendTime = 150;
ADDRLP4 16
CNSTI4 150
ASGNI4
line 1364
;1363:
;1364:	if (cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $675
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $675
ADDRLP4 20
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $675
line 1367
;1365:		cent->currentState.teamowner &&
;1366:		!cent->isATST)
;1367:	{
line 1368
;1368:		return;
ADDRGP4 $674
JUMPV
LABELV $675
line 1371
;1369:	}
;1370:
;1371:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $677
line 1372
;1372:	{
line 1376
;1373:		vec3_t testVel;
;1374:		float fVel;
;1375:
;1376:		if (lf->animationNumber == BOTH_RUN1 ||
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 833
EQI4 $684
ADDRLP4 44
INDIRI4
CNSTI4 822
EQI4 $684
ADDRLP4 44
INDIRI4
CNSTI4 852
EQI4 $684
ADDRLP4 44
INDIRI4
CNSTI4 842
EQI4 $684
ADDRLP4 44
INDIRI4
CNSTI4 843
NEI4 $679
LABELV $684
line 1381
;1377:			lf->animationNumber == BOTH_WALK1 ||
;1378:			lf->animationNumber == BOTH_WALKBACK1 ||
;1379:			lf->animationNumber == BOTH_TURN_LEFT1 ||
;1380:			lf->animationNumber == BOTH_TURN_RIGHT1)
;1381:		{
line 1382
;1382:			if (cent->atstFootClang < cg.time)
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
GEI4 $685
line 1383
;1383:			{
line 1384
;1384:				if (rand() & 1)
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $688
line 1385
;1385:				{
line 1386
;1386:					trap_S_StartSound(NULL, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound("sound/chars/atst/ATSTstep1.wav"));
ADDRGP4 $690
ARGP4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1387
;1387:				}
ADDRGP4 $689
JUMPV
LABELV $688
line 1389
;1388:				else
;1389:				{
line 1390
;1390:					trap_S_StartSound(NULL, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound("sound/chars/atst/ATSTstep2.wav"));
ADDRGP4 $691
ARGP4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1391
;1391:				}
LABELV $689
line 1393
;1392:
;1393:				cent->atstFootClang = cg.time + 1300;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1300
ADDI4
ASGNI4
line 1394
;1394:			}
LABELV $685
line 1395
;1395:		}
LABELV $679
line 1397
;1396:
;1397:		VectorCopy(cent->currentState.pos.trDelta, testVel);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1399
;1398:
;1399:		fVel = VectorNormalize(testVel);
ADDRLP4 28
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 48
INDIRF4
ASGNF4
line 1401
;1400:
;1401:		if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $693
line 1402
;1402:		{
line 1403
;1403:			if (lf->animationNumber != BOTH_DEATH1 &&
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 1
EQI4 $695
ADDRLP4 52
INDIRI4
CNSTI4 47
EQI4 $695
line 1405
;1404:				lf->animationNumber != BOTH_DEAD1)
;1405:			{
line 1406
;1406:				trap_S_StartSound(NULL, cent->currentState.number, CHAN_BODY, trap_S_RegisterSound("sound/chars/atst/ATSTcrash.wav"));
ADDRGP4 $697
ARGP4
ADDRLP4 56
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1407
;1407:			}
LABELV $695
line 1408
;1408:			newAnimation = BOTH_DEATH1;
ADDRFP4 12
CNSTI4 1
ASGNI4
line 1409
;1409:		}
ADDRGP4 $694
JUMPV
LABELV $693
line 1410
;1410:		else if (fVel > 0)
ADDRLP4 40
INDIRF4
CNSTF4 0
LEF4 $698
line 1411
;1411:		{
line 1412
;1412:			qboolean doNotSet = qfalse;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1414
;1413:
;1414:			if (fVel > 250)
ADDRLP4 40
INDIRF4
CNSTF4 1132068864
LEF4 $700
line 1415
;1415:			{
line 1416
;1416:				animSpeedMult = 1.2;
ADDRFP4 16
CNSTF4 1067030938
ASGNF4
line 1417
;1417:			}
ADDRGP4 $701
JUMPV
LABELV $700
line 1418
;1418:			else if (fVel > 200)
ADDRLP4 40
INDIRF4
CNSTF4 1128792064
LEF4 $702
line 1419
;1419:			{
line 1420
;1420:				animSpeedMult = 1;
ADDRFP4 16
CNSTF4 1065353216
ASGNF4
line 1421
;1421:			}
ADDRGP4 $703
JUMPV
LABELV $702
line 1422
;1422:			else if (fVel > 100)
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
LEF4 $704
line 1423
;1423:			{
line 1424
;1424:				animSpeedMult = 0.9;
ADDRFP4 16
CNSTF4 1063675494
ASGNF4
line 1425
;1425:			}
ADDRGP4 $705
JUMPV
LABELV $704
line 1426
;1426:			else if (fVel > 0)
ADDRLP4 40
INDIRF4
CNSTF4 0
LEF4 $706
line 1427
;1427:			{
line 1428
;1428:				animSpeedMult = 0.8;
ADDRFP4 16
CNSTF4 1061997773
ASGNF4
line 1429
;1429:			}
ADDRGP4 $707
JUMPV
LABELV $706
line 1431
;1430:			else
;1431:			{
line 1432
;1432:				doNotSet = qtrue;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 1433
;1433:			}
LABELV $707
LABELV $705
LABELV $703
LABELV $701
line 1435
;1434:
;1435:			if (!doNotSet)
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $699
line 1436
;1436:			{
line 1437
;1437:				if ((cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN1 ||
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 833
EQI4 $713
ADDRLP4 56
INDIRI4
CNSTI4 852
EQI4 $713
ADDRLP4 56
INDIRI4
CNSTI4 822
NEI4 $710
LABELV $713
line 1440
;1438:					(cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_WALKBACK1 ||
;1439:					(cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK1)
;1440:				{
line 1441
;1441:					newAnimation = (cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT);
ADDRFP4 12
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1442
;1442:				}
ADDRGP4 $699
JUMPV
LABELV $710
line 1444
;1443:				else
;1444:				{
line 1445
;1445:					newAnimation = BOTH_RUN1;
ADDRFP4 12
CNSTI4 833
ASGNI4
line 1446
;1446:				}
line 1447
;1447:			}
line 1448
;1448:		}
ADDRGP4 $699
JUMPV
LABELV $698
line 1449
;1449:		else if ((cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN1START)
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 834
NEI4 $714
line 1450
;1450:		{
line 1451
;1451:			if (lf->animationNumber != BOTH_RUN1START)
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 834
EQI4 $716
line 1452
;1452:			{
line 1453
;1453:				trap_S_StartSound(NULL, cent->currentState.number, CHAN_BODY, trap_S_RegisterSound("sound/chars/atst/ATSTstart.wav"));
ADDRGP4 $718
ARGP4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1454
;1454:				cent->atstFootClang = cg.time + 650;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 650
ADDI4
ASGNI4
line 1455
;1455:			}
LABELV $716
line 1456
;1456:			newAnimation = BOTH_RUN1START;
ADDRFP4 12
CNSTI4 834
ASGNI4
line 1457
;1457:		}
ADDRGP4 $715
JUMPV
LABELV $714
line 1458
;1458:		else if (cent->pe.legs.yawing &&
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
CNSTI4 0
EQI4 $720
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 3248488448
LTF4 $722
ADDRLP4 56
INDIRF4
CNSTF4 1101004800
LEF4 $720
LABELV $722
line 1460
;1459:			(cent->pe.legs.yawSwingDif < -20 || cent->pe.legs.yawSwingDif > 20))
;1460:		{
line 1461
;1461:			if (cent->pe.legs.yawSwingDif > 0)
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
LEF4 $723
line 1462
;1462:			{
line 1463
;1463:				newAnimation = BOTH_TURN_LEFT1;//BOTH_RUN1;
ADDRFP4 12
CNSTI4 842
ASGNI4
line 1464
;1464:				if (lf->animationNumber != BOTH_TURN_LEFT1)
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 842
EQI4 $724
line 1465
;1465:				{
line 1466
;1466:					cent->atstFootClang = cg.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1467
;1467:				}
line 1468
;1468:			}
ADDRGP4 $724
JUMPV
LABELV $723
line 1470
;1469:			else
;1470:			{
line 1471
;1471:				newAnimation = BOTH_TURN_RIGHT1;//BOTH_RUN1;
ADDRFP4 12
CNSTI4 843
ASGNI4
line 1472
;1472:				if (lf->animationNumber != BOTH_TURN_RIGHT1)
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 843
EQI4 $728
line 1473
;1473:				{
line 1474
;1474:					cent->atstFootClang = cg.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1475
;1475:				}
LABELV $728
line 1476
;1476:			}
LABELV $724
line 1477
;1477:			animSpeedMult = 0.7;
ADDRFP4 16
CNSTF4 1060320051
ASGNF4
line 1478
;1478:		}
ADDRGP4 $721
JUMPV
LABELV $720
line 1480
;1479:		else
;1480:		{
line 1481
;1481:			newAnimation = BOTH_STAND1;
ADDRFP4 12
CNSTI4 571
ASGNI4
line 1482
;1482:		}
LABELV $721
LABELV $715
LABELV $699
LABELV $694
line 1484
;1483:
;1484:		if (newAnimation != BOTH_STAND1 && newAnimation != BOTH_RUN1 &&
ADDRLP4 60
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 571
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 833
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 834
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 822
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 852
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 1
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 47
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 843
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 842
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 97
EQI4 $731
ADDRLP4 60
INDIRI4
CNSTI4 98
EQI4 $731
line 1490
;1485:			newAnimation != BOTH_RUN1START && newAnimation != BOTH_WALK1 &&
;1486:			newAnimation != BOTH_WALKBACK1 && newAnimation != BOTH_DEATH1 &&
;1487:			newAnimation != BOTH_DEAD1 && newAnimation != BOTH_TURN_RIGHT1 &&
;1488:			newAnimation != BOTH_TURN_LEFT1 && newAnimation != BOTH_PAIN1 &&
;1489:			newAnimation != BOTH_PAIN2)
;1490:		{ //not a valid anim for the ATST..
line 1491
;1491:			newAnimation = BOTH_RUN1;
ADDRFP4 12
CNSTI4 833
ASGNI4
line 1492
;1492:		}
LABELV $731
line 1494
;1493:
;1494:		if (lf->animationNumber == newAnimation)
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 12
INDIRI4
NEI4 $733
line 1495
;1495:		{
line 1496
;1496:			return;
ADDRGP4 $674
JUMPV
LABELV $733
line 1498
;1497:		}
;1498:	}
LABELV $677
line 1500
;1499:
;1500:	oldAnim = lf->animationNumber;
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
line 1502
;1501:
;1502:	lf->animationNumber = newAnimation;
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 1503
;1503:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 12
ADDRFP4 12
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1505
;1504:
;1505:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $737
ADDRLP4 28
INDIRI4
CNSTI4 1211
LTI4 $735
LABELV $737
line 1506
;1506:		CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $738
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1507
;1507:	}
LABELV $735
line 1509
;1508:
;1509:	anim = &bgGlobalAnimations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 12
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 1511
;1510:
;1511:	lf->animation = anim;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1512
;1512:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1514
;1513:
;1514:	if ( cg_debugAnim.integer && (cg_debugAnim.integer < 0 || cg_debugAnim.integer == cent->currentState.clientNum) ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $739
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $744
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
NEI4 $739
LABELV $744
line 1515
;1515:		CG_Printf( "%d: %d Anim: %i, '%s'\n", cg.time, cent->currentState.clientNum, newAnimation, GetStringForID(animTable, newAnimation));
ADDRGP4 animTable
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 GetStringForID
CALLP4
ASGNP4
ADDRGP4 $745
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1516
;1516:	}
LABELV $739
line 1518
;1517:
;1518:	if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $747
line 1519
;1519:	{
line 1520
;1520:		animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 8
CNSTF4 1112014848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1521
;1521:		if (lf->animation->loopFrames != -1)
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $749
line 1522
;1522:		{
line 1523
;1523:			flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 1524
;1524:		}
LABELV $749
line 1526
;1525:
;1526:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $751
line 1527
;1527:		{
line 1528
;1528:			if (animSpeed < 0.3)
ADDRLP4 8
INDIRF4
CNSTF4 1050253722
GEF4 $753
line 1529
;1529:			{
line 1530
;1530:				animSpeed = 0.3;
ADDRLP4 8
CNSTF4 1050253722
ASGNF4
line 1531
;1531:			}
LABELV $753
line 1533
;1532:
;1533:			if (newAnimation == BOTH_WALKBACK1)
ADDRFP4 12
INDIRI4
CNSTI4 852
NEI4 $755
line 1534
;1534:			{
line 1535
;1535:				animSpeed = 0.8;
ADDRLP4 8
CNSTF4 1061997773
ASGNF4
line 1536
;1536:			}
LABELV $755
line 1538
;1537:
;1538:			if (newAnimation != BOTH_DEATH1)
ADDRFP4 12
INDIRI4
CNSTI4 1
EQI4 $757
line 1539
;1539:			{
line 1540
;1540:				flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 1541
;1541:			}
LABELV $757
line 1542
;1542:		}
LABELV $751
line 1544
;1543:
;1544:		if (cg_animBlend.integer)
ADDRGP4 cg_animBlend+12
INDIRI4
CNSTI4 0
EQI4 $759
line 1545
;1545:		{
line 1546
;1546:			flags |= BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1547
;1547:		}
LABELV $759
line 1549
;1548:
;1549:		if (!cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $762
line 1550
;1550:		{
line 1551
;1551:			if (/*BG_FlippingAnim(newAnimation) ||*/ BG_InDeathAnim(newAnimation))
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $764
line 1552
;1552:			{
line 1553
;1553:				flags &= ~BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1554
;1554:			}
ADDRGP4 $765
JUMPV
LABELV $764
line 1555
;1555:			else if ( oldAnim != -1 &&
ADDRLP4 44
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 -1
EQI4 $766
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $766
line 1557
;1556:				(/*BG_FlippingAnim(oldAnim) ||*/ BG_InDeathAnim(oldAnim)) )
;1557:			{
line 1558
;1558:				flags &= ~BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1559
;1559:			}
LABELV $766
LABELV $765
line 1561
;1560:
;1561:			if (flags & BONE_ANIM_BLEND)
ADDRLP4 4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $768
line 1562
;1562:			{
line 1563
;1563:				if (BG_FlippingAnim(newAnimation))
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $770
line 1564
;1564:				{
line 1565
;1565:					blendTime = 200;
ADDRLP4 16
CNSTI4 200
ASGNI4
line 1566
;1566:				}
ADDRGP4 $771
JUMPV
LABELV $770
line 1567
;1567:				else if ( oldAnim != -1 &&
ADDRLP4 56
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 -1
EQI4 $772
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $772
line 1569
;1568:					(BG_FlippingAnim(oldAnim)) )
;1569:				{
line 1570
;1570:					blendTime = 200;
ADDRLP4 16
CNSTI4 200
ASGNI4
line 1571
;1571:				}
LABELV $772
LABELV $771
line 1572
;1572:			}
LABELV $768
line 1573
;1573:		}
LABELV $762
line 1575
;1574:
;1575:		animSpeed *= animSpeedMult;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1577
;1576:
;1577:		BG_SaberStartTransAnim(cent->currentState.fireflag, newAnimation, &animSpeed);
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 BG_SaberStartTransAnim
CALLV
pop
line 1579
;1578:
;1579:		if (torsoOnly)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $774
line 1580
;1580:		{
line 1581
;1581:			lf->animationTorsoSpeed = animSpeedMult;
ADDRFP4 8
INDIRP4
CNSTI4 56
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 1582
;1582:		}
ADDRGP4 $775
JUMPV
LABELV $774
line 1584
;1583:		else
;1584:		{
line 1585
;1585:			lf->animationSpeed = animSpeedMult;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 1586
;1586:		}
LABELV $775
line 1588
;1587:
;1588:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $776
line 1589
;1589:		{
line 1590
;1590:			int atstBlend = 400;
ADDRLP4 40
CNSTI4 400
ASGNI4
line 1592
;1591:
;1592:			if (torsoOnly)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $778
line 1593
;1593:			{
line 1594
;1594:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "pelvis", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, atstBlend);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1595
;1595:			}
ADDRGP4 $777
JUMPV
LABELV $778
line 1597
;1596:			else
;1597:			{
line 1598
;1598:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, atstBlend);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1599
;1599:			}
line 1600
;1600:		}
ADDRGP4 $777
JUMPV
LABELV $776
line 1602
;1601:		else
;1602:		{
line 1603
;1603:			int beginFrame = anim->firstFrame;
ADDRLP4 40
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 1605
;1604:
;1605:			if (torsoOnly)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $782
line 1606
;1606:			{
line 1607
;1607:				if ((cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) == (cent->currentState.legsAnim&~ANIM_TOGGLEBIT) && cent->pe.legs.frame >= anim->firstFrame && cent->pe.legs.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 -2049
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
BANDI4
ADDRLP4 44
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
BANDI4
NEI4 $784
ADDRLP4 52
ADDRLP4 44
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $784
ADDRLP4 52
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $784
line 1608
;1608:				{
line 1609
;1609:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "lower_lumbar", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed,cg.time, cent->pe.legs.frame, blendTime);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 72
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 64
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1610
;1610:					beginFrame = cent->pe.legs.frame;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 1611
;1611:				}
ADDRGP4 $785
JUMPV
LABELV $784
line 1613
;1612:				else
;1613:				{
line 1614
;1614:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "lower_lumbar", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed,cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 68
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 68
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1615
;1615:				}
LABELV $785
line 1616
;1616:				cgs.clientinfo[cent->currentState.number].torsoAnim = newAnimation;
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 1617
;1617:			}
ADDRGP4 $783
JUMPV
LABELV $782
line 1619
;1618:			else
;1619:			{
line 1620
;1620:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1622
;1621:				//cgs.clientinfo[cent->currentState.number].torsoAnim = newAnimation;
;1622:				cgs.clientinfo[cent->currentState.number].legsAnim = newAnimation;
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 1623
;1623:			}
LABELV $783
line 1625
;1624:
;1625:			if ((cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) == newAnimation)
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRFP4 12
INDIRI4
NEI4 $793
line 1626
;1626:			{
line 1627
;1627:				if (beginFrame != anim->firstFrame)
ADDRLP4 40
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $795
line 1628
;1628:				{
line 1629
;1629:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, beginFrame, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1630
;1630:				}
ADDRGP4 $796
JUMPV
LABELV $795
line 1632
;1631:				else
;1632:				{
line 1633
;1633:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1634
;1634:				}
LABELV $796
line 1635
;1635:			}
LABELV $793
line 1636
;1636:		}
LABELV $777
line 1637
;1637:	}
LABELV $747
line 1638
;1638:}
LABELV $674
endproc CG_SetLerpFrameAnimation 76 40
proc CG_FirstAnimFrame 4 0
line 1654
;1639:
;1640:
;1641:/*
;1642:===============
;1643:CG_FirstAnimFrame
;1644:
;1645:Returns true if the lerpframe is on its first frame of animation.
;1646:Otherwise false.
;1647:
;1648:This is used to scale an animation into higher-speed without restarting
;1649:the animation before it completes at normal speed, in the case of a looping
;1650:animation (such as the leg running anim).
;1651:===============
;1652:*/
;1653:static qboolean CG_FirstAnimFrame(lerpFrame_t *lf, qboolean torsoOnly, float speedScale)
;1654:{
line 1655
;1655:	if (torsoOnly)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $800
line 1656
;1656:	{
line 1657
;1657:		if (lf->animationTorsoSpeed == speedScale)
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
NEF4 $801
line 1658
;1658:		{
line 1659
;1659:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $799
JUMPV
line 1661
;1660:		}
;1661:	}
LABELV $800
line 1663
;1662:	else
;1663:	{
line 1664
;1664:		if (lf->animationSpeed == speedScale)
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
NEF4 $804
line 1665
;1665:		{
line 1666
;1666:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $799
JUMPV
LABELV $804
line 1668
;1667:		}
;1668:	}
LABELV $801
line 1670
;1669:
;1670:	if (lf->animation->numFrames < 2)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
GEI4 $806
line 1671
;1671:	{
line 1672
;1672:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $799
JUMPV
LABELV $806
line 1675
;1673:	}
;1674:
;1675:	if (lf->animation->firstFrame == lf->frame)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $808
line 1676
;1676:	{
line 1677
;1677:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $799
JUMPV
LABELV $808
line 1680
;1678:	}
;1679:
;1680:	return qfalse;
CNSTI4 0
RETI4
LABELV $799
endproc CG_FirstAnimFrame 4 0
export CG_InWalkingAnim
proc CG_InWalkingAnim 20 0
line 1692
;1681:}
;1682:
;1683:/*
;1684:===============
;1685:CG_InWalkingAnim
;1686:
;1687:Returns last frame to step on if the animation on the frame is desired for playing footstep sounds,
;1688:otherwise 0
;1689:===============
;1690:*/
;1691:int CG_InWalkingAnim(int animNum)
;1692:{
line 1693
;1693:	int anim = animNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 1695
;1694:	
;1695:	anim &= ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1697
;1696:
;1697:	if (anim == BOTH_WALL_RUN_RIGHT ||
ADDRLP4 0
INDIRI4
CNSTI4 915
EQI4 $813
ADDRLP4 0
INDIRI4
CNSTI4 918
NEI4 $811
LABELV $813
line 1699
;1698:		anim == BOTH_WALL_RUN_LEFT)
;1699:	{
line 1700
;1700:		return 8;
CNSTI4 8
RETI4
ADDRGP4 $810
JUMPV
LABELV $811
line 1703
;1701:	}
;1702:
;1703:	if (anim >= BOTH_WALK1 &&
ADDRLP4 0
INDIRI4
CNSTI4 822
LTI4 $814
ADDRLP4 0
INDIRI4
CNSTI4 850
GTI4 $814
line 1705
;1704:		anim <= BOTH_RUNAWAY1)
;1705:	{
line 1706
;1706:		if (anim == BOTH_RUN1)
ADDRLP4 0
INDIRI4
CNSTI4 833
NEI4 $816
line 1707
;1707:		{
line 1708
;1708:			return 18;//12;
CNSTI4 18
RETI4
ADDRGP4 $810
JUMPV
LABELV $816
line 1711
;1709:		}
;1710:		else
;1711:		{
line 1713
;1712:			//return 9;
;1713:			return 18;
CNSTI4 18
RETI4
ADDRGP4 $810
JUMPV
LABELV $814
line 1717
;1714:		}
;1715:	}
;1716:
;1717:	if (anim >= BOTH_WALKBACK1 &&
ADDRLP4 0
INDIRI4
CNSTI4 852
LTI4 $818
ADDRLP4 0
INDIRI4
CNSTI4 855
GTI4 $818
line 1719
;1718:		anim <= BOTH_RUNBACK2)
;1719:	{
line 1720
;1720:		if (anim == BOTH_WALKBACK1)
ADDRLP4 0
INDIRI4
CNSTI4 852
NEI4 $820
line 1721
;1721:		{
line 1722
;1722:			return 18;
CNSTI4 18
RETI4
ADDRGP4 $810
JUMPV
LABELV $820
line 1725
;1723:		}
;1724:		else
;1725:		{
line 1726
;1726:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $810
JUMPV
LABELV $818
line 1730
;1727:		}
;1728:	}
;1729:
;1730:	if (anim >= LEGS_WALKBACK1 &&
ADDRLP4 0
INDIRI4
CNSTI4 1139
LTI4 $822
ADDRLP4 0
INDIRI4
CNSTI4 1142
GTI4 $822
line 1732
;1731:		anim <= LEGS_RUNBACK2)
;1732:	{
line 1733
;1733:		if (anim == LEGS_WALKBACK1)
ADDRLP4 0
INDIRI4
CNSTI4 1139
NEI4 $824
line 1734
;1734:		{
line 1735
;1735:			return 18;
CNSTI4 18
RETI4
ADDRGP4 $810
JUMPV
LABELV $824
line 1738
;1736:		}
;1737:		else
;1738:		{
line 1739
;1739:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $810
JUMPV
LABELV $822
line 1743
;1740:		}
;1741:	}
;1742:
;1743:	return qfalse;
CNSTI4 0
RETI4
LABELV $810
endproc CG_InWalkingAnim 20 0
lit
align 4
LABELV $827
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV $828
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
code
proc CG_FootstepForSurface 1204 36
line 1750
;1744:}
;1745:
;1746:#define FOOTSTEP_GENERIC					1
;1747:#define FOOTSTEP_METAL						2
;1748:
;1749:static int CG_FootstepForSurface( centity_t *cent, int skip )
;1750:{
line 1753
;1751:	trace_t tr;
;1752:	vec3_t org, dOrg, legDir, bAngles;
;1753:	vec3_t playerMins = {-15, -15, DEFAULT_MINS_2};
ADDRLP4 1176
ADDRGP4 $827
INDIRB
ASGNB 12
line 1754
;1754:	vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 1188
ADDRGP4 $828
INDIRB
ASGNB 12
line 1764
;1755:	mdxaBone_t boltMatrix;
;1756:
;1757://	VectorCopy(ent->lerpOrigin, org);
;1758://	VectorCopy(org, dOrg);
;1759://	dOrg[2] -= 64; //should never have to go further than this because we're already onground
;1760:
;1761:	//We are now tracing off of a bolt point for footsteps, so that if we happen to be walking sideways on a wall we will
;1762:	//still play step sounds properly.
;1763:
;1764:	VectorCopy(cent->lerpAngles, bAngles);
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 1765
;1765:	bAngles[PITCH] = 0;
ADDRLP4 1116
CNSTF4 0
ASGNF4
line 1767
;1766:
;1767:	trap_G2API_GetBoltMatrix_NoReconstruct( cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_llumbar, &boltMatrix, bAngles, cent->lerpOrigin, cg.time, /*cgs.gameModels*/0, cent->modelScale);
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1200
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+528
ADDP4
INDIRI4
ARGI4
ADDRLP4 1128
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1200
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 1200
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix_NoReconstruct
CALLI4
pop
line 1768
;1768:	trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, ORIGIN, org );
ADDRLP4 1128
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 1769
;1769:	trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_Y, legDir );
ADDRLP4 1128
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1104
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 1771
;1770:
;1771:	dOrg[0] = org[0] + legDir[0]*64;
ADDRLP4 1092
ADDRLP4 0
INDIRF4
CNSTF4 1115684864
ADDRLP4 1104
INDIRF4
MULF4
ADDF4
ASGNF4
line 1772
;1772:	dOrg[1] = org[1] + legDir[1]*64;
ADDRLP4 1092+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1104+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1773
;1773:	dOrg[2] = org[2] + legDir[2]*64;
ADDRLP4 1092+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 1104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1777
;1774:
;1775:	//CG_TestLine(org, dOrg, 100, 0x0000ff, 3);
;1776:
;1777:	CG_Trace(&tr, org, playerMins, playerMaxs, dOrg, skip, MASK_PLAYERSOLID);
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1176
ARGP4
ADDRLP4 1188
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1779
;1778:
;1779:	if (tr.fraction == 1)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $838
line 1780
;1780:	{
line 1781
;1781:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $826
JUMPV
LABELV $838
line 1784
;1782:	}
;1783:
;1784:	if ( tr.surfaceFlags & SURF_NOSTEPS )
ADDRLP4 12+44
INDIRI4
CNSTI4 4194304
BANDI4
CNSTI4 0
EQI4 $841
line 1785
;1785:	{
line 1786
;1786:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $826
JUMPV
LABELV $841
line 1789
;1787:	}
;1788:
;1789:	if ( tr.surfaceFlags & SURF_METALSTEPS )
ADDRLP4 12+44
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $844
line 1790
;1790:	{
line 1791
;1791:		return FOOTSTEP_METAL;
CNSTI4 2
RETI4
ADDRGP4 $826
JUMPV
LABELV $844
line 1794
;1792:	}
;1793:
;1794:	return FOOTSTEP_GENERIC;
CNSTI4 1
RETI4
LABELV $826
endproc CG_FootstepForSurface 1204 36
export CG_FootStep
proc CG_FootStep 28 16
line 1798
;1795:}
;1796:
;1797:void CG_FootStep(centity_t *cent, clientInfo_t *ci, int anim)
;1798:{
line 1801
;1799:	int groundType;
;1800:
;1801:	if ((anim & ~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT ||
ADDRLP4 4
ADDRFP4 8
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 915
EQI4 $850
ADDRLP4 4
INDIRI4
CNSTI4 918
NEI4 $848
LABELV $850
line 1803
;1802:		(anim & ~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT)
;1803:	{
line 1804
;1804:		groundType = FOOTSTEP_GENERIC;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1805
;1805:		goto skipCheck;
ADDRGP4 $851
JUMPV
LABELV $848
line 1808
;1806:	}
;1807:
;1808:	if (cent->currentState.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $852
line 1809
;1809:	{
line 1810
;1810:		return;
ADDRGP4 $847
JUMPV
LABELV $852
LABELV $851
line 1814
;1811:	}
;1812:
;1813:skipCheck:
;1814:	groundType = CG_FootstepForSurface(cent, cent->currentState.number);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1818
;1815:
;1816://skipCheck:
;1817:
;1818:	if (!groundType)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $854
line 1819
;1819:	{
line 1820
;1820:		return;
ADDRGP4 $847
JUMPV
LABELV $854
line 1823
;1821:	}
;1822:
;1823:	switch (groundType)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $858
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $861
ADDRGP4 $857
JUMPV
line 1824
;1824:	{
LABELV $858
line 1826
;1825:	case FOOTSTEP_GENERIC:
;1826:		trap_S_StartSound (NULL, cent->currentState.number, CHAN_BODY, 
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+70296+604
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1828
;1827:			cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;1828:		break;
ADDRGP4 $857
JUMPV
LABELV $861
line 1830
;1829:	case FOOTSTEP_METAL:
;1830:		trap_S_StartSound (NULL, cent->currentState.number, CHAN_BODY, 
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1832
;1831:			cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;1832:		break;
line 1834
;1833:	default:
;1834:		break;
LABELV $857
line 1836
;1835:	}
;1836:}
LABELV $847
endproc CG_FootStep 28 16
proc CG_RunLerpFrame 76 40
line 1846
;1837:/*
;1838:===============
;1839:CG_RunLerpFrame
;1840:
;1841:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1842:cg.time should be between oldFrameTime and frameTime after exit
;1843:===============
;1844:*/
;1845:static void CG_RunLerpFrame( centity_t *cent, clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale, qboolean torsoOnly) 
;1846:{
line 1851
;1847:	int			f, numFrames;
;1848:	animation_t	*anim;
;1849:
;1850:	// debugging tool to get no animations
;1851:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $866
line 1852
;1852:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1853
;1853:		return;
ADDRGP4 $865
JUMPV
LABELV $866
line 1857
;1854:	}
;1855:
;1856:	// see if the animation sequence is switching
;1857:	if (cent->currentState.forceFrame)
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 0
EQI4 $869
line 1858
;1858:	{
line 1859
;1859:		int flags = BONE_ANIM_OVERRIDE_FREEZE; //|BONE_ANIM_BLEND;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 1860
;1860:		float animSpeed = 1.0f;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1861
;1861:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "lower_lumbar", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1862
;1862:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1863
;1863:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1865
;1864:
;1865:		lf->animationNumber = 0;
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 1866
;1866:	}
ADDRGP4 $870
JUMPV
LABELV $869
line 1867
;1867:	else if ( (newAnimation != lf->animationNumber || !lf->animation) || (CG_FirstAnimFrame(lf, torsoOnly, speedScale)) ) 
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 12
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $876
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $876
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 CG_FirstAnimFrame
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $874
LABELV $876
line 1868
;1868:	{
line 1869
;1869:		CG_SetLerpFrameAnimation( cent, ci, lf, newAnimation, speedScale, torsoOnly);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1870
;1870:	}
ADDRGP4 $875
JUMPV
LABELV $874
line 1871
;1871:	else if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $877
line 1872
;1872:	{
line 1873
;1873:		if (cent->pe.legs.yawing != !lf->torsoYawing)
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
NEI4 $882
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $883
JUMPV
LABELV $882
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $883
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $879
line 1874
;1874:		{
line 1875
;1875:			CG_SetLerpFrameAnimation( cent, ci, lf, newAnimation, speedScale, torsoOnly);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1876
;1876:			lf->torsoYawing = cent->pe.legs.yawing;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ASGNI4
line 1877
;1877:		}
LABELV $879
line 1878
;1878:	}
LABELV $877
LABELV $875
LABELV $870
line 1882
;1879:
;1880:	// if we have passed the current frame, move it to
;1881:	// oldFrame and calculate a new frame
;1882:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $884
line 1883
;1883:		if (lf->oldFrame != lf->frame &&
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $887
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CVPU4 4
NEU4 $887
line 1885
;1884:			lf == &(cent->pe.legs))
;1885:		{
line 1886
;1886:			int addFinalFrame = CG_InWalkingAnim(lf->animationNumber); //9;
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_InWalkingAnim
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 1888
;1887:
;1888:			if (!cent->isATST &&
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $889
ADDRLP4 32
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 915
EQI4 $891
ADDRLP4 32
INDIRI4
CNSTI4 918
NEI4 $889
LABELV $891
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $889
line 1891
;1889:				((lf->animationNumber&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT || (lf->animationNumber&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT) &&
;1890:				addFinalFrame)
;1891:			{
line 1892
;1892:				if ( lf->frame >= (lf->animation->firstFrame+2) &&
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $892
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 40
INDIRI4
GEI4 $892
line 1894
;1893:					lf->oldFrame < (lf->animation->firstFrame+2))
;1894:				{
line 1895
;1895:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1896
;1896:				}
ADDRGP4 $890
JUMPV
LABELV $892
line 1897
;1897:				else if ( lf->frame >= (lf->animation->firstFrame+addFinalFrame) &&
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $894
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 48
INDIRI4
GEI4 $894
line 1899
;1898:					lf->oldFrame < (lf->animation->firstFrame+addFinalFrame))
;1899:				{
line 1900
;1900:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1901
;1901:				}
ADDRGP4 $890
JUMPV
LABELV $894
line 1902
;1902:				else if ( lf->frame >= (lf->animation->firstFrame+12) &&
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $896
ADDRLP4 52
INDIRP4
INDIRI4
ADDRLP4 56
INDIRI4
GEI4 $896
line 1904
;1903:					lf->oldFrame < (lf->animation->firstFrame+12))
;1904:				{
line 1905
;1905:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1906
;1906:				}
ADDRGP4 $890
JUMPV
LABELV $896
line 1907
;1907:				else if ( lf->frame >= (lf->animation->firstFrame+16) &&
ADDRLP4 60
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LTI4 $898
ADDRLP4 60
INDIRP4
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $898
line 1909
;1908:					lf->oldFrame < (lf->animation->firstFrame+16))
;1909:				{
line 1910
;1910:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1911
;1911:				}
ADDRGP4 $890
JUMPV
LABELV $898
line 1912
;1912:				else if (lf->oldFrame > lf->frame && lf->frame > (lf->animation->firstFrame+1))
ADDRLP4 68
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRP4
INDIRI4
ADDRLP4 72
INDIRI4
LEI4 $890
ADDRLP4 72
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $890
line 1913
;1913:				{ //missed one
line 1914
;1914:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1915
;1915:				}
line 1916
;1916:			}
ADDRGP4 $890
JUMPV
LABELV $889
line 1917
;1917:			else if (addFinalFrame && !cent->isATST)
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $902
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $902
line 1918
;1918:			{
line 1919
;1919:				if ( lf->frame >= (lf->animation->firstFrame+3) &&
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $904
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $904
line 1921
;1920:					lf->oldFrame < (lf->animation->firstFrame+3))
;1921:				{
line 1922
;1922:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1923
;1923:				}
ADDRGP4 $905
JUMPV
LABELV $904
line 1924
;1924:				else if ( lf->frame >= (lf->animation->firstFrame+addFinalFrame) &&
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LTI4 $906
ADDRLP4 48
INDIRP4
INDIRI4
ADDRLP4 52
INDIRI4
GEI4 $906
line 1926
;1925:					lf->oldFrame < (lf->animation->firstFrame+addFinalFrame))
;1926:				{
line 1927
;1927:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1928
;1928:				}
ADDRGP4 $907
JUMPV
LABELV $906
line 1929
;1929:				else if (lf->oldFrame > lf->frame && lf->frame > (lf->animation->firstFrame+1))
ADDRLP4 56
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $908
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $908
line 1930
;1930:				{ //missed one
line 1931
;1931:					CG_FootStep(cent, ci, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStep
CALLV
pop
line 1932
;1932:				}
LABELV $908
LABELV $907
LABELV $905
line 1933
;1933:			}
LABELV $902
LABELV $890
line 1934
;1934:		}
LABELV $887
line 1936
;1935:
;1936:		lf->oldFrame = lf->frame;
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1937
;1937:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1940
;1938:
;1939:		// get the next frame based on the animation
;1940:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
ASGNP4
line 1941
;1941:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $910
line 1942
;1942:			return;		// shouldn't happen
ADDRGP4 $865
JUMPV
LABELV $910
line 1945
;1943:		}
;1944:
;1945:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
GEI4 $912
line 1946
;1946:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 1947
;1947:		} else {
ADDRGP4 $913
JUMPV
LABELV $912
line 1948
;1948:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 12
ASGNI4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1949
;1949:		}
LABELV $913
line 1950
;1950:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1951
;1951:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1953
;1952:
;1953:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1954
;1954:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $915
line 1955
;1955:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1956
;1956:		}
LABELV $915
line 1957
;1957:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $917
line 1958
;1958:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1959
;1959:			if ( anim->loopFrames != -1 ) //Before 0 meant no loop
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $919
line 1960
;1960:			{
line 1961
;1961:				if(anim->numFrames - anim->loopFrames == 0)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CNSTI4 0
NEI4 $921
line 1962
;1962:				{
line 1963
;1963:					f %= anim->numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
MODI4
ASGNI4
line 1964
;1964:				}
ADDRGP4 $922
JUMPV
LABELV $921
line 1966
;1965:				else
;1966:				{
line 1967
;1967:					f %= (anim->numFrames - anim->loopFrames);
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
MODI4
ASGNI4
line 1968
;1968:				}
LABELV $922
line 1969
;1969:				f += anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1970
;1970:			} 
ADDRGP4 $920
JUMPV
LABELV $919
line 1972
;1971:			else 
;1972:			{
line 1973
;1973:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1976
;1974:				// the animation is stuck at the end, so it
;1975:				// can immediately transition to another sequence
;1976:				lf->frameTime = cg.time;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1977
;1977:			}
LABELV $920
line 1978
;1978:		}
LABELV $917
line 1979
;1979:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $924
line 1980
;1980:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1981
;1981:		}
ADDRGP4 $925
JUMPV
LABELV $924
line 1982
;1982:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $926
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $926
line 1983
;1983:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 48
INDIRI4
MODI4
SUBI4
ASGNI4
line 1984
;1984:		}
ADDRGP4 $927
JUMPV
LABELV $926
line 1985
;1985:		else {
line 1986
;1986:			lf->frame = anim->firstFrame + f;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1987
;1987:		}
LABELV $927
LABELV $925
line 1988
;1988:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $928
line 1989
;1989:			lf->frameTime = cg.time;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1990
;1990:			if ( cg_debugAnim.integer && (cg_debugAnim.integer < 0 || cg_debugAnim.integer == cent->currentState.clientNum) ) {
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $932
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $937
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
NEI4 $932
LABELV $937
line 1991
;1991:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $938
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1992
;1992:			}
LABELV $932
line 1993
;1993:		}
LABELV $928
line 1994
;1994:	}
LABELV $884
line 1996
;1995:
;1996:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
CNSTI4 200
ADDI4
LEI4 $939
line 1997
;1997:		lf->frameTime = cg.time;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1998
;1998:	}
LABELV $939
line 2000
;1999:
;2000:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $943
line 2001
;2001:		lf->oldFrameTime = cg.time;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2002
;2002:	}
LABELV $943
line 2004
;2003:	// calculate current lerp value
;2004:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $947
line 2005
;2005:		lf->backlerp = 0;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 2006
;2006:	} else {
ADDRGP4 $948
JUMPV
LABELV $947
line 2007
;2007:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+64
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 2008
;2008:	}
LABELV $948
line 2009
;2009:}
LABELV $865
endproc CG_RunLerpFrame 76 40
proc CG_ClearLerpFrame 16 24
line 2017
;2010:
;2011:
;2012:/*
;2013:===============
;2014:CG_ClearLerpFrame
;2015:===============
;2016:*/
;2017:static void CG_ClearLerpFrame( centity_t *cent, clientInfo_t *ci, lerpFrame_t *lf, int animationNumber, qboolean torsoOnly) {
line 2018
;2018:	lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2019
;2019:	CG_SetLerpFrameAnimation( cent, ci, lf, animationNumber, 1, torsoOnly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 2020
;2020:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2021
;2021:}
LABELV $950
endproc CG_ClearLerpFrame 16 24
proc CG_PlayerAnimation 16 24
line 2030
;2022:
;2023:
;2024:/*
;2025:===============
;2026:CG_PlayerAnimation
;2027:===============
;2028:*/
;2029:static void CG_PlayerAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;2030:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 2035
;2031:	clientInfo_t	*ci;
;2032:	int				clientNum;
;2033:	float			speedScale;
;2034:
;2035:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 2037
;2036:
;2037:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $953
line 2038
;2038:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2039
;2039:		return;
ADDRGP4 $952
JUMPV
LABELV $953
line 2042
;2040:	}
;2041:
;2042:	if (cent->currentState.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $956
line 2043
;2043:	{
line 2044
;2044:		speedScale = 1.3;
ADDRLP4 0
CNSTF4 1067869798
ASGNF4
line 2045
;2045:	}
ADDRGP4 $957
JUMPV
LABELV $956
line 2046
;2046:	else if (cent->currentState.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $958
line 2047
;2047:	{
line 2048
;2048:		speedScale = 1.7;
ADDRLP4 0
CNSTF4 1071225242
ASGNF4
line 2049
;2049:	}
ADDRGP4 $959
JUMPV
LABELV $958
line 2051
;2050:	else
;2051:	{
line 2052
;2052:		speedScale = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2053
;2053:	}
LABELV $959
LABELV $957
line 2055
;2054:
;2055:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
CNSTI4 788
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 2058
;2056:
;2057:	// do the shuffle turn frames locally
;2058:	if(0){//	if ( cent->pe.legs.yawing && ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) == TORSO_WEAPONREADY3) {
ADDRGP4 $961
JUMPV
line 2059
;2059:		CG_RunLerpFrame( cent, ci, &cent->pe.legs, LEGS_TURN1, speedScale, qfalse);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 644
ADDP4
ARGP4
CNSTI4 1143
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 2060
;2060:	} else {
ADDRGP4 $962
JUMPV
LABELV $961
line 2061
;2061:		CG_RunLerpFrame( cent, ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale, qfalse);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 644
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 2062
;2062:	}
LABELV $962
line 2064
;2063:
;2064:	if (!(cent->currentState.forcePowersActive & (1 << FP_RAGE)))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $963
line 2065
;2065:	{ //don't affect torso anim speed unless raged
line 2066
;2066:		speedScale = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2067
;2067:	}
ADDRGP4 $964
JUMPV
LABELV $963
line 2069
;2068:	else
;2069:	{
line 2070
;2070:		speedScale = 1.7;
ADDRLP4 0
CNSTF4 1071225242
ASGNF4
line 2071
;2071:	}
LABELV $964
line 2073
;2072:
;2073:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ASGNI4
line 2074
;2074:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 2075
;2075:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRF4
ASGNF4
line 2077
;2076:
;2077:	CG_RunLerpFrame( cent, ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale, qtrue );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 2079
;2078:
;2079:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ASGNI4
line 2080
;2080:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 2081
;2081:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ASGNF4
line 2082
;2082:}
LABELV $952
endproc CG_PlayerAnimation 16 24
proc CG_SwingAngles 28 8
line 2101
;2083:
;2084:
;2085:
;2086:
;2087:/*
;2088:=============================================================================
;2089:
;2090:PLAYER ANGLES
;2091:
;2092:=============================================================================
;2093:*/
;2094:
;2095:/*
;2096:==================
;2097:CG_SwingAngles
;2098:==================
;2099:*/
;2100:static float CG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;2101:					float speed, float *angle, qboolean *swinging ) {
line 2106
;2102:	float	swing;
;2103:	float	move;
;2104:	float	scale;
;2105:
;2106:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $966
line 2108
;2107:		// see if a swing should be started
;2108:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2109
;2109:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $970
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $968
LABELV $970
line 2110
;2110:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 2111
;2111:		}
LABELV $968
line 2112
;2112:	}
LABELV $966
line 2114
;2113:
;2114:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $971
line 2115
;2115:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $965
JUMPV
LABELV $971
line 2120
;2116:	}
;2117:	
;2118:	// modify the speed depending on the delta
;2119:	// so it doesn't seem so linear
;2120:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2121
;2121:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 2122
;2122:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $973
line 2123
;2123:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 2124
;2124:	} else if ( scale < swingTolerance ) {
ADDRGP4 $974
JUMPV
LABELV $973
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $975
line 2125
;2125:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 2126
;2126:	} else {
ADDRGP4 $976
JUMPV
LABELV $975
line 2127
;2127:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 2128
;2128:	}
LABELV $976
LABELV $974
line 2131
;2129:
;2130:	// swing towards the destination angle
;2131:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $977
line 2132
;2132:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+60
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 2133
;2133:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $980
line 2134
;2134:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 2135
;2135:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 2136
;2136:		}
LABELV $980
line 2137
;2137:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2138
;2138:	} else if ( swing < 0 ) {
ADDRGP4 $978
JUMPV
LABELV $977
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $982
line 2139
;2139:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+60
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 2140
;2140:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $985
line 2141
;2141:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 2142
;2142:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 2143
;2143:		}
LABELV $985
line 2144
;2144:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2145
;2145:	}
LABELV $982
LABELV $978
line 2148
;2146:
;2147:	// clamp to no more than tolerance
;2148:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 2149
;2149:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $987
line 2150
;2150:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2151
;2151:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $988
JUMPV
LABELV $987
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $989
line 2152
;2152:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2153
;2153:	}
LABELV $989
LABELV $988
line 2155
;2154:
;2155:	return swing;
ADDRLP4 0
INDIRF4
RETF4
LABELV $965
endproc CG_SwingAngles 28 8
proc CG_SwingAnglesATST 36 8
line 2164
;2156:}
;2157:
;2158:/*
;2159:==================
;2160:CG_SwingAngles
;2161:==================
;2162:*/
;2163:static float CG_SwingAnglesATST( centity_t *cent, float destination, float swingTolerance, float clampTolerance,
;2164:					float speed, float *angle, qboolean *swinging ) {
line 2169
;2165:	float	swing;
;2166:	float	move;
;2167:	float	scale;
;2168:
;2169:	if ( !*swinging ) {
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $992
line 2171
;2170:		// see if a swing should be started
;2171:		swing = AngleSubtract( *angle, destination );
ADDRFP4 20
INDIRP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2172
;2172:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $996
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $994
LABELV $996
line 2173
;2173:			*swinging = qtrue;
ADDRFP4 24
INDIRP4
CNSTI4 1
ASGNI4
line 2174
;2174:		}
LABELV $994
line 2175
;2175:	}
LABELV $992
line 2177
;2176:
;2177:	if ( !*swinging ) {
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $997
line 2178
;2178:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $991
JUMPV
LABELV $997
line 2183
;2179:	}
;2180:	
;2181:	// modify the speed depending on the delta
;2182:	// so it doesn't seem so linear
;2183:	swing = AngleSubtract( destination, *angle );
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2184
;2184:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 2185
;2185:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 8
INDIRF4
MULF4
GEF4 $999
line 2186
;2186:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 2187
;2187:	} else if ( scale < swingTolerance ) {
ADDRGP4 $1000
JUMPV
LABELV $999
ADDRLP4 4
INDIRF4
ADDRFP4 8
INDIRF4
GEF4 $1001
line 2188
;2188:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 2189
;2189:	} else {
ADDRGP4 $1002
JUMPV
LABELV $1001
line 2190
;2190:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 2191
;2191:	}
LABELV $1002
LABELV $1000
line 2193
;2192:
;2193:	if (swing < 10 && swing > -10)
ADDRLP4 0
INDIRF4
CNSTF4 1092616192
GEF4 $1003
ADDRLP4 0
INDIRF4
CNSTF4 3240099840
LEF4 $1003
line 2194
;2194:	{
line 2195
;2195:		cent->atstSwinging = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
CNSTI4 0
ASGNI4
line 2196
;2196:	}
LABELV $1003
line 2197
;2197:	if (swing < 60 && swing > -60 && !cent->atstSwinging)
ADDRLP4 0
INDIRF4
CNSTF4 1114636288
GEF4 $1005
ADDRLP4 0
INDIRF4
CNSTF4 3262119936
LEF4 $1005
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1005
line 2198
;2198:	{
line 2199
;2199:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $991
JUMPV
LABELV $1005
line 2202
;2200:	}
;2201:
;2202:	cent->atstSwinging = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
CNSTI4 1
ASGNI4
line 2205
;2203:
;2204:	// swing towards the destination angle
;2205:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $1007
line 2206
;2206:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+60
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 2207
;2207:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $1010
line 2208
;2208:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 2209
;2209:			*swinging = qfalse;
ADDRFP4 24
INDIRP4
CNSTI4 0
ASGNI4
line 2210
;2210:		}
LABELV $1010
line 2211
;2211:		*angle = AngleMod( *angle + move );
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2212
;2212:	} else if ( swing < 0 ) {
ADDRGP4 $1008
JUMPV
LABELV $1007
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $1012
line 2213
;2213:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+60
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
NEGF4
MULF4
ASGNF4
line 2214
;2214:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $1015
line 2215
;2215:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 2216
;2216:			*swinging = qfalse;
ADDRFP4 24
INDIRP4
CNSTI4 0
ASGNI4
line 2217
;2217:		}
LABELV $1015
line 2218
;2218:		*angle = AngleMod( *angle + move );
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2219
;2219:	}
LABELV $1012
LABELV $1008
line 2222
;2220:
;2221:	// clamp to no more than tolerance
;2222:	swing = AngleSubtract( destination, *angle );
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 2223
;2223:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 12
INDIRF4
LEF4 $1017
line 2224
;2224:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 20
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2225
;2225:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $1018
JUMPV
LABELV $1017
ADDRLP4 0
INDIRF4
ADDRFP4 12
INDIRF4
NEGF4
GEF4 $1019
line 2226
;2226:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 20
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2227
;2227:	}
LABELV $1019
LABELV $1018
line 2229
;2228:
;2229:	return swing;
ADDRLP4 0
INDIRF4
RETF4
LABELV $991
endproc CG_SwingAnglesATST 36 8
proc CG_AddPainTwitch 12 0
line 2237
;2230:}
;2231:
;2232:/*
;2233:=================
;2234:CG_AddPainTwitch
;2235:=================
;2236:*/
;2237:static void CG_AddPainTwitch( centity_t *cent, vec3_t torsoAngles ) {
line 2241
;2238:	int		t;
;2239:	float	f;
;2240:
;2241:	t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2242
;2242:	if ( t >= PAIN_TWITCH_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $1023
line 2243
;2243:		return;
ADDRGP4 $1021
JUMPV
LABELV $1023
line 2246
;2244:	}
;2245:
;2246:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 2248
;2247:
;2248:	if ( cent->pe.painDirection ) {
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1025
line 2249
;2249:		torsoAngles[ROLL] += 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2250
;2250:	} else {
ADDRGP4 $1026
JUMPV
LABELV $1025
line 2251
;2251:		torsoAngles[ROLL] -= 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2252
;2252:	}
LABELV $1026
line 2253
;2253:}
LABELV $1021
endproc CG_AddPainTwitch 12 0
export CG_G2SetBoneAngles
proc CG_G2SetBoneAngles 0 44
ADDRFP4 16
ADDRFP4 16
INDIRI4
ASGNI4
ADDRFP4 20
ADDRFP4 20
INDIRI4
ASGNI4
ADDRFP4 24
ADDRFP4 24
INDIRI4
ASGNI4
ADDRFP4 28
ADDRFP4 28
INDIRI4
ASGNI4
line 2277
;2254:
;2255:
;2256:typedef struct boneAngleParms_s {
;2257:	void *ghoul2;
;2258:	int modelIndex;
;2259:	char *boneName;
;2260:	vec3_t angles;
;2261:	int flags;
;2262:	int up;
;2263:	int right;
;2264:	int forward;
;2265:	qhandle_t *modelList;
;2266:	int blendTime;
;2267:	int currentTime;
;2268:
;2269:	qboolean refreshSet;
;2270:} boneAngleParms_t;
;2271:
;2272:boneAngleParms_t cgBoneAnglePostSet;
;2273:
;2274:void CG_G2SetBoneAngles(void *ghoul2, int modelIndex, const char *boneName, const vec3_t angles, const int flags,
;2275:								const int up, const int right, const int forward, qhandle_t *modelList,
;2276:								int blendTime , int currentTime )
;2277:{ //we want to hold off on setting the bone angles until the end of the frame, because every time we set
line 2302
;2278:  //them the entire skeleton has to be reconstructed.
;2279:#if 0
;2280:	//This function should ONLY be called from CG_Player() or a function that is called only within CG_Player().
;2281:	//At the end of the frame we will check to use this information to call SetBoneAngles
;2282:	memset(&cgBoneAnglePostSet, 0, sizeof(cgBoneAnglePostSet));
;2283:	cgBoneAnglePostSet.ghoul2 = ghoul2;
;2284:	cgBoneAnglePostSet.modelIndex = modelIndex;
;2285:	cgBoneAnglePostSet.boneName = (char *)boneName;
;2286:
;2287:	cgBoneAnglePostSet.angles[0] = angles[0];
;2288:	cgBoneAnglePostSet.angles[1] = angles[1];
;2289:	cgBoneAnglePostSet.angles[2] = angles[2];
;2290:
;2291:	cgBoneAnglePostSet.flags = flags;
;2292:	cgBoneAnglePostSet.up = up;
;2293:	cgBoneAnglePostSet.right = right;
;2294:	cgBoneAnglePostSet.forward = forward;
;2295:	cgBoneAnglePostSet.modelList = modelList;
;2296:	cgBoneAnglePostSet.blendTime = blendTime;
;2297:	cgBoneAnglePostSet.currentTime = currentTime;
;2298:
;2299:	cgBoneAnglePostSet.refreshSet = qtrue;
;2300:#endif
;2301:	//Unfortunately the above doesn't really work.
;2302:	trap_G2API_SetBoneAngles(ghoul2, modelIndex, boneName, angles, flags, up, right, forward, modelList,
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRFP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 2304
;2303:		blendTime, currentTime);
;2304:}
LABELV $1027
endproc CG_G2SetBoneAngles 0 44
export CG_InKnockDown
proc CG_InKnockDown 8 0
line 2307
;2305:
;2306:qboolean CG_InKnockDown( int anim )
;2307:{
line 2308
;2308:	switch ( (anim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 924
LTI4 $1029
ADDRLP4 0
INDIRI4
CNSTI4 942
GTI4 $1029
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1034-3696
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1034
address $1032
address $1032
address $1032
address $1032
address $1032
address $1033
address $1033
address $1033
address $1033
address $1033
address $1029
address $1029
address $1033
address $1033
address $1033
address $1033
address $1033
address $1033
address $1033
code
line 2309
;2309:	{
LABELV $1032
line 2315
;2310:	case BOTH_KNOCKDOWN1:
;2311:	case BOTH_KNOCKDOWN2:
;2312:	case BOTH_KNOCKDOWN3:
;2313:	case BOTH_KNOCKDOWN4:
;2314:	case BOTH_KNOCKDOWN5:
;2315:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1028
JUMPV
line 2316
;2316:		break;
LABELV $1033
line 2329
;2317:	case BOTH_GETUP1:
;2318:	case BOTH_GETUP2:
;2319:	case BOTH_GETUP3:
;2320:	case BOTH_GETUP4:
;2321:	case BOTH_GETUP5:
;2322:	case BOTH_FORCE_GETUP_F1:
;2323:	case BOTH_FORCE_GETUP_F2:
;2324:	case BOTH_FORCE_GETUP_B1:
;2325:	case BOTH_FORCE_GETUP_B2:
;2326:	case BOTH_FORCE_GETUP_B3:
;2327:	case BOTH_FORCE_GETUP_B4:
;2328:	case BOTH_FORCE_GETUP_B5:
;2329:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1028
JUMPV
line 2330
;2330:		break;
LABELV $1029
line 2332
;2331:	}
;2332:	return qfalse;
CNSTI4 0
RETI4
LABELV $1028
endproc CG_InKnockDown 8 0
export CG_G2ClientSpineAngles
proc CG_G2ClientSpineAngles 248 36
line 2336
;2333:}
;2334:
;2335:void CG_G2ClientSpineAngles( centity_t *cent, vec3_t viewAngles, const vec3_t angles, vec3_t thoracicAngles, vec3_t ulAngles, vec3_t llAngles )
;2336:{
line 2337
;2337:	float legDif = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2339
;2338://	cent->pe.torso.pitchAngle = viewAngles[PITCH];
;2339:	viewAngles[YAW] = AngleDelta( cent->lerpAngles[YAW], angles[YAW] );
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 2340
;2340:	legDif = viewAngles[YAW];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 2350
;2341://	cent->pe.torso.yawAngle = viewAngles[YAW];
;2342:
;2343:	/*
;2344:	if ( !BG_FlippingAnim( cent->currentState.legsAnim ) 
;2345:		&& !BG_SpinningSaberAnim( cent->currentState.legsAnim ) 
;2346:		&& !BG_SpinningSaberAnim( cent->currentState.torsoAnim )
;2347:		&& !BG_SaberInSpecial(cent->currentState.saberMove)
;2348:		&& cent->currentState.legsAnim != cent->currentState.torsoAnim )//NOTE: presumes your legs & torso are on the same frame, though they *should* be because PM_SetAnimFinal tries to keep them in synch
;2349:	*/
;2350:	if ( !BG_FlippingAnim( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_InRoll
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 CG_InRollAnim
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 CG_InKnockDown
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1037
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 CG_InKnockDown
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_InKnockDown
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 CG_InKnockDown
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $1037
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 108
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $1037
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 112
INDIRI4
NEI4 $1037
ADDRLP4 120
CNSTI4 -2049
ASGNI4
ADDRLP4 116
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
BANDI4
ADDRLP4 116
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
BANDI4
EQI4 $1037
ADDRLP4 124
CNSTI4 788
ADDRLP4 116
INDIRP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 124
INDIRI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
BANDI4
ADDRLP4 124
INDIRI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
BANDI4
EQI4 $1037
line 2381
;2351:		!BG_SpinningSaberAnim( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
;2352:		!BG_SpinningSaberAnim( cent->currentState.torsoAnim&~ANIM_TOGGLEBIT ) &&
;2353:		!BG_InSpecialJump( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
;2354:		!BG_InSpecialJump( cent->currentState.torsoAnim&~ANIM_TOGGLEBIT ) &&
;2355:		!BG_InDeathAnim(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) &&
;2356:		!BG_InDeathAnim(cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2357:		!CG_InRoll(cent) &&
;2358:		!CG_InRollAnim(cent) &&
;2359:		!BG_SaberInSpecial(cent->currentState.saberMove) &&
;2360:		!BG_SaberInSpecialAttack(cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2361:		!BG_SaberInSpecialAttack(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) &&
;2362:
;2363:		!CG_InKnockDown(cent->currentState.torsoAnim) &&
;2364:		!CG_InKnockDown(cent->currentState.legsAnim) &&
;2365:		!CG_InKnockDown(cgs.clientinfo[cent->currentState.number].torsoAnim) &&
;2366:		!CG_InKnockDown(cgs.clientinfo[cent->currentState.number].legsAnim) &&
;2367:
;2368:		!BG_FlippingAnim( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2369:		!BG_SpinningSaberAnim( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2370:		!BG_SpinningSaberAnim( cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT ) &&
;2371:		!BG_InSpecialJump( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2372:		!BG_InSpecialJump( cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT ) &&
;2373:		!BG_InDeathAnim(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) &&
;2374:		!BG_InDeathAnim(cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT) &&
;2375:		!BG_SaberInSpecialAttack(cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT) &&
;2376:		!BG_SaberInSpecialAttack(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) &&
;2377:
;2378:		!(cent->currentState.eFlags & EF_DEAD) &&
;2379:		(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) != (cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2380:		(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) != (cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT))
;2381:	{//FIXME: no need to do this if legs and torso on are same frame
line 2388
;2382:		//adjust for motion offset
;2383:		mdxaBone_t	boltMatrix;
;2384:		vec3_t		motionFwd, motionAngles;
;2385:		vec3_t		motionRt, tempAng;
;2386:		int			ang;
;2387:
;2388:		trap_G2API_GetBoltMatrix_NoRecNoRot( cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_motion, &boltMatrix, vec3_origin, cent->lerpOrigin, cg.time, /*cgs.gameModels*/0, cent->modelScale);
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 228
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+524
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 228
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 228
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix_NoRecNoRot
CALLI4
pop
line 2389
;2389:		trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_Y, motionFwd );
ADDRLP4 144
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 2391
;2390:
;2391:		vectoangles( motionFwd, motionAngles );
ADDRLP4 192
ARGP4
ADDRLP4 132
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2393
;2392:
;2393:		trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_X, motionRt );
ADDRLP4 144
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 204
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 2394
;2394:		vectoangles( motionRt, tempAng );
ADDRLP4 204
ARGP4
ADDRLP4 216
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2395
;2395:		motionAngles[ROLL] = -tempAng[PITCH];
ADDRLP4 132+8
ADDRLP4 216
INDIRF4
NEGF4
ASGNF4
line 2397
;2396:
;2397:		for ( ang = 0; ang < 3; ang++ )
ADDRLP4 128
CNSTI4 0
ASGNI4
LABELV $1069
line 2398
;2398:		{
line 2399
;2399:			viewAngles[ang] = AngleNormalize180( viewAngles[ang] - AngleNormalize180( motionAngles[ang] ) );
ADDRLP4 232
ADDRLP4 128
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 232
INDIRI4
ADDRLP4 132
ADDP4
INDIRF4
ARGF4
ADDRLP4 236
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 240
ADDRLP4 232
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
INDIRF4
ADDRLP4 236
INDIRF4
SUBF4
ARGF4
ADDRLP4 244
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 240
INDIRP4
ADDRLP4 244
INDIRF4
ASGNF4
line 2400
;2400:		}
LABELV $1070
line 2397
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 3
LTI4 $1069
line 2401
;2401:	}
LABELV $1037
line 2426
;2402:
;2403:	//Keep it within 80 degrees of the leg angles, on either side. Will hopefully prevent spine twisting.
;2404:	/*
;2405:	if (legDif > 0)
;2406:	{
;2407:		legDif += 80;
;2408:	}
;2409:	else
;2410:	{
;2411:		legDif -= 80;
;2412:	}
;2413:	
;2414:	if (legDif < 0 && viewAngles[YAW] < legDif)
;2415:	{
;2416:		viewAngles[YAW] = legDif;
;2417:	}
;2418:	if (legDif > 0 && viewAngles[YAW] > legDif)
;2419:	{
;2420:		viewAngles[YAW] = legDif;
;2421:	}
;2422:	*/
;2423:		
;2424:	//distribute the angles differently up the spine
;2425:	//NOTE: each of these distributions must add up to 1.0f
;2426:	thoracicAngles[PITCH] = viewAngles[PITCH]*0.20f;
ADDRFP4 12
INDIRP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2427
;2427:	llAngles[PITCH] = viewAngles[PITCH]*0.40f;
ADDRFP4 20
INDIRP4
CNSTF4 1053609165
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2428
;2428:	ulAngles[PITCH] = viewAngles[PITCH]*0.40f;
ADDRFP4 16
INDIRP4
CNSTF4 1053609165
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2430
;2429:
;2430:	thoracicAngles[YAW] = viewAngles[YAW]*0.20f;
ADDRLP4 128
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2431
;2431:	ulAngles[YAW] = viewAngles[YAW]*0.35f;
ADDRLP4 132
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2432
;2432:	llAngles[YAW] = viewAngles[YAW]*0.45f;
ADDRLP4 136
CNSTI4 4
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2434
;2433:
;2434:	thoracicAngles[ROLL] = viewAngles[ROLL]*0.20f;
ADDRLP4 140
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2435
;2435:	ulAngles[ROLL] = viewAngles[ROLL]*0.35f;
ADDRLP4 144
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2436
;2436:	llAngles[ROLL] = viewAngles[ROLL]*0.45f;
ADDRLP4 148
CNSTI4 8
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2437
;2437:}
LABELV $1036
endproc CG_G2ClientSpineAngles 248 36
data
align 4
LABELV $1074
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
LABELV $1075
byte 4 0
byte 4 0
byte 4 0
code
proc CG_G2PlayerAngles 1460 44
line 2439
;2438:
;2439:static void CG_G2PlayerAngles( centity_t *cent, vec3_t legs[3], vec3_t legsAngles){
line 2447
;2440:	vec3_t		torsoAngles, headAngles;
;2441:	float		dest;
;2442:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;2443:	vec3_t		velocity;
;2444:	float		speed; //, speed_dif, speed_desired;
;2445:	int			dir;
;2446:	vec3_t		velPos, velAng;
;2447:	int			adddir = 0;
ADDRLP4 120
CNSTI4 0
ASGNI4
line 2449
;2448:	float		dif;
;2449:	float		degrees_negative = 0;
ADDRLP4 108
CNSTF4 0
ASGNF4
line 2450
;2450:	float		degrees_positive = 0;
ADDRLP4 112
CNSTF4 0
ASGNF4
line 2451
;2451:	vec3_t		ulAngles, llAngles, viewAngles, angles, thoracicAngles = {0,0,0};
ADDRLP4 96
ADDRGP4 $1075
INDIRB
ASGNB 12
line 2453
;2452:
;2453:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2454
;2454:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 148
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 148
INDIRF4
ASGNF4
line 2455
;2455:	VectorClear( legsAngles );
ADDRLP4 152
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 156
CNSTF4 0
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 156
INDIRF4
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 156
INDIRF4
ASGNF4
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRF4
ASGNF4
line 2456
;2456:	VectorClear( torsoAngles );
ADDRLP4 160
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 160
INDIRF4
ASGNF4
line 2461
;2457:
;2458:	// --------- yaw -------------
;2459:
;2460:	// allow yaw to drift a bit
;2461:	if ((( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != BOTH_STAND1) || 
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
CNSTI4 -2049
ASGNI4
ADDRLP4 164
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
BANDI4
CNSTI4 571
NEI4 $1082
ADDRLP4 164
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
BANDI4
ADDRLP4 164
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
EQI4 $1080
LABELV $1082
line 2463
;2462:			( cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT ) != WeaponReadyAnim[cent->currentState.weapon]  ) 
;2463:	{
line 2465
;2464:		// if not standing still, always point all in the same direction
;2465:		cent->pe.torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 1
ASGNI4
line 2466
;2466:		cent->pe.torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 1
ASGNI4
line 2467
;2467:		cent->pe.legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTI4 1
ASGNI4
line 2468
;2468:	}
LABELV $1080
line 2471
;2469:
;2470:	// adjust legs for movement dir
;2471:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1083
line 2473
;2472:		// don't let dead bodies twitch
;2473:		dir = 0;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 2474
;2474:	} else {
ADDRGP4 $1084
JUMPV
LABELV $1083
line 2475
;2475:		dir = cent->currentState.angles2[YAW];
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 2476
;2476:		if ( dir < 0 || dir > 7 ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
LTI4 $1087
ADDRLP4 88
INDIRI4
CNSTI4 7
LEI4 $1085
LABELV $1087
line 2477
;2477:			CG_Error( "Bad player movement angle" );
ADDRGP4 $1088
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2478
;2478:		}
LABELV $1085
line 2479
;2479:	}
LABELV $1084
line 2480
;2480:	if (!cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1089
line 2481
;2481:	{
line 2482
;2482:		torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 88
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1074
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2483
;2483:	}
ADDRGP4 $1090
JUMPV
LABELV $1089
line 2485
;2484:	else
;2485:	{
line 2486
;2486:		torsoAngles[YAW] = headAngles[YAW];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2487
;2487:	}
LABELV $1090
line 2494
;2488:
;2489:	// torso
;2490://	CG_SwingAngles( torsoAngles[YAW], 25, 90, /*cg_swingSpeed.value*/ 0.3, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing );
;2491://	torsoAngles[YAW] = cent->pe.torso.yawAngle;
;2492:
;2493:	//for now, turn torso instantly and let the legs swing to follow
;2494:	cent->pe.torso.yawAngle = torsoAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 2498
;2495:
;2496:	// --------- pitch -------------
;2497:
;2498:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 2499
;2499:	speed = VectorNormalize( velocity );
ADDRLP4 36
ARGP4
ADDRLP4 172
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 172
INDIRF4
ASGNF4
line 2501
;2500:
;2501:	if (!speed)
ADDRLP4 84
INDIRF4
CNSTF4 0
NEF4 $1096
line 2502
;2502:	{
line 2503
;2503:		torsoAngles[YAW] = headAngles[YAW];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2504
;2504:	}
LABELV $1096
line 2507
;2505:
;2506:	// only show a fraction of the pitch angle in the torso
;2507:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $1100
line 2508
;2508:		dest = (-360 + headAngles[PITCH]) * 0.75;
ADDRLP4 116
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 2509
;2509:	} else {
ADDRGP4 $1101
JUMPV
LABELV $1100
line 2510
;2510:		dest = headAngles[PITCH] * 0.75;
ADDRLP4 116
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 2511
;2511:	}
LABELV $1101
line 2512
;2512:	CG_SwingAngles( dest, 15, 30, 0.1, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
ADDRLP4 116
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 736
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLF4
pop
line 2513
;2513:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRF4
ASGNF4
line 2541
;2514:
;2515:	// --------- roll -------------
;2516:
;2517:
;2518:	// lean towards the direction of travel
;2519:
;2520:	/*
;2521:	speed_desired = cent->currentState.speed/4;
;2522:
;2523:	if (!speed)
;2524:	{
;2525:		speed_dif = 0;
;2526:	}
;2527:	else
;2528:	{
;2529:		speed_dif = (speed/speed_desired);
;2530:	}
;2531:
;2532:	if (speed_dif > 1)
;2533:	{
;2534:		speed_dif = 1;
;2535:	}
;2536:	else if (speed_dif < 0)
;2537:	{
;2538:		speed_dif = 0;
;2539:	}
;2540:	*/
;2541:	if ( speed ) {
ADDRLP4 84
INDIRF4
CNSTF4 0
EQF4 $1102
line 2545
;2542:		vec3_t	axis[3];
;2543:		float	side;
;2544:
;2545:		speed *= 0.05;
ADDRLP4 84
CNSTF4 1028443341
ADDRLP4 84
INDIRF4
MULF4
ASGNF4
line 2547
;2546:
;2547:		AnglesToAxis( legsAngles, axis );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2548
;2548:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 216
ADDRLP4 84
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 180+12
INDIRF4
MULF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 180+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 180+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 2549
;2549:		legsAngles[ROLL] -= side;
ADDRLP4 220
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 220
INDIRP4
ADDRLP4 220
INDIRP4
INDIRF4
ADDRLP4 216
INDIRF4
SUBF4
ASGNF4
line 2551
;2550:
;2551:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 216
ADDRLP4 84
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 180+4
INDIRF4
MULF4
ADDF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 180+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 2552
;2552:		legsAngles[PITCH] += side;
ADDRLP4 224
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 216
INDIRF4
ADDF4
ASGNF4
line 2553
;2553:	}
LABELV $1102
line 2558
;2554:
;2555:	//legsAngles[YAW] = headAngles[YAW] + (movementOffsets[ dir ]*speed_dif);
;2556:
;2557:	//rww - crazy velocity-based leg angle calculation
;2558:	legsAngles[YAW] = headAngles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2559
;2559:	velPos[0] = cent->lerpOrigin[0] + velocity[0];
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
line 2560
;2560:	velPos[1] = cent->lerpOrigin[1] + velocity[1];
ADDRLP4 48+4
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
line 2561
;2561:	velPos[2] = cent->lerpOrigin[2];// + velocity[2];
ADDRLP4 48+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ASGNF4
line 2563
;2562:
;2563:	if (cent->currentState.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1119
line 2564
;2564:	{ //off the ground, no direction-based leg angles
line 2565
;2565:		VectorCopy(cent->lerpOrigin, velPos);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2566
;2566:	}
LABELV $1119
line 2568
;2567:
;2568:	VectorSubtract(cent->lerpOrigin, velPos, velAng);
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 180
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 180
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 48+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 48+8
INDIRF4
SUBF4
ASGNF4
line 2570
;2569:
;2570:	if (!VectorCompare(velAng, vec3_origin))
ADDRLP4 60
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 184
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
NEI4 $1125
line 2571
;2571:	{
line 2572
;2572:		vectoangles(velAng, velAng);
ADDRLP4 60
ARGP4
ADDRLP4 60
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2574
;2573:
;2574:		if (velAng[YAW] <= legsAngles[YAW])
ADDRLP4 60+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
GTF4 $1127
line 2575
;2575:		{
line 2576
;2576:			degrees_negative = (legsAngles[YAW] - velAng[YAW]);
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 60+4
INDIRF4
SUBF4
ASGNF4
line 2577
;2577:			degrees_positive = (360 - legsAngles[YAW]) + velAng[YAW];
ADDRLP4 112
CNSTF4 1135869952
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ADDRLP4 60+4
INDIRF4
ADDF4
ASGNF4
line 2578
;2578:		}
ADDRGP4 $1128
JUMPV
LABELV $1127
line 2580
;2579:		else
;2580:		{
line 2581
;2581:			degrees_negative = legsAngles[YAW] + (360 - velAng[YAW]);
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1135869952
ADDRLP4 60+4
INDIRF4
SUBF4
ADDF4
ASGNF4
line 2582
;2582:			degrees_positive = (velAng[YAW] - legsAngles[YAW]);
ADDRLP4 112
ADDRLP4 60+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2583
;2583:		}
LABELV $1128
line 2585
;2584:
;2585:		if (degrees_negative < degrees_positive)
ADDRLP4 108
INDIRF4
ADDRLP4 112
INDIRF4
GEF4 $1134
line 2586
;2586:		{
line 2587
;2587:			dif = degrees_negative;
ADDRLP4 92
ADDRLP4 108
INDIRF4
ASGNF4
line 2588
;2588:			adddir = 0;
ADDRLP4 120
CNSTI4 0
ASGNI4
line 2589
;2589:		}
ADDRGP4 $1135
JUMPV
LABELV $1134
line 2591
;2590:		else
;2591:		{
line 2592
;2592:			dif = degrees_positive;
ADDRLP4 92
ADDRLP4 112
INDIRF4
ASGNF4
line 2593
;2593:			adddir = 1;
ADDRLP4 120
CNSTI4 1
ASGNI4
line 2594
;2594:		}
LABELV $1135
line 2596
;2595:
;2596:		if (dif > 90)
ADDRLP4 92
INDIRF4
CNSTF4 1119092736
LEF4 $1136
line 2597
;2597:		{
line 2598
;2598:			dif = (180 - dif);
ADDRLP4 92
CNSTF4 1127481344
ADDRLP4 92
INDIRF4
SUBF4
ASGNF4
line 2599
;2599:		}
LABELV $1136
line 2601
;2600:
;2601:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1138
line 2602
;2602:		{
line 2603
;2603:			if (dif > 360)
ADDRLP4 92
INDIRF4
CNSTF4 1135869952
LEF4 $1139
line 2604
;2604:			{
line 2605
;2605:				dif = 360;
ADDRLP4 92
CNSTF4 1135869952
ASGNF4
line 2606
;2606:			}
line 2607
;2607:		}
ADDRGP4 $1139
JUMPV
LABELV $1138
line 2609
;2608:		else
;2609:		{
line 2610
;2610:			if (dif > 60)
ADDRLP4 92
INDIRF4
CNSTF4 1114636288
LEF4 $1142
line 2611
;2611:			{
line 2612
;2612:				dif = 60;
ADDRLP4 92
CNSTF4 1114636288
ASGNF4
line 2613
;2613:			}
LABELV $1142
line 2614
;2614:		}
LABELV $1139
line 2617
;2615:
;2616:		//Slight hack for when playing is running backward
;2617:		if (dir == 3 || dir == 5)
ADDRLP4 88
INDIRI4
CNSTI4 3
EQI4 $1146
ADDRLP4 88
INDIRI4
CNSTI4 5
NEI4 $1144
LABELV $1146
line 2618
;2618:		{
line 2619
;2619:			dif = -dif;
ADDRLP4 92
ADDRLP4 92
INDIRF4
NEGF4
ASGNF4
line 2620
;2620:		}
LABELV $1144
line 2622
;2621:
;2622:		if (adddir)
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $1147
line 2623
;2623:		{
line 2624
;2624:			legsAngles[YAW] -= dif;
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ASGNF4
line 2625
;2625:		}
ADDRGP4 $1148
JUMPV
LABELV $1147
line 2627
;2626:		else
;2627:		{
line 2628
;2628:			legsAngles[YAW] += dif;
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 92
INDIRF4
ADDF4
ASGNF4
line 2629
;2629:		}
LABELV $1148
line 2630
;2630:	}
LABELV $1125
line 2632
;2631:
;2632:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1149
line 2633
;2633:	{
line 2634
;2634:		cent->pe.legs.yawSwingDif = CG_SwingAnglesATST( cent, legsAngles[YAW], 40, 360, /*cg_swingSpeed.value*/ 0.05, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1135869952
ARGF4
CNSTF4 1028443341
ARGF4
ADDRLP4 188
INDIRP4
CNSTI4 664
ADDP4
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 668
ADDP4
ARGP4
ADDRLP4 192
ADDRGP4 CG_SwingAnglesATST
CALLF4
ASGNF4
ADDRLP4 188
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 192
INDIRF4
ASGNF4
line 2635
;2635:	}
ADDRGP4 $1150
JUMPV
LABELV $1149
line 2637
;2636:	else
;2637:	{
line 2638
;2638:		if (!cg_swingAngles.integer)
ADDRGP4 cg_swingAngles+12
INDIRI4
CNSTI4 0
NEI4 $1151
line 2639
;2639:		{
line 2640
;2640:			cent->pe.legs.yawAngle = legsAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 2641
;2641:		}
ADDRGP4 $1152
JUMPV
LABELV $1151
line 2643
;2642:		else
;2643:		{
line 2644
;2644:			CG_SwingAngles( legsAngles[YAW], 40, 90, /*cg_swingSpeed.value*/ 0.3, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 664
ADDP4
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 668
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLF4
pop
line 2645
;2645:		}
LABELV $1152
line 2646
;2646:	}
LABELV $1150
line 2647
;2647:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRF4
ASGNF4
line 2650
;2648:
;2649:	// pain twitch
;2650:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 2652
;2651:
;2652:	legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 2653
;2653:	torsoAngles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2655
;2654:
;2655:	VectorCopy(legsAngles, cent->turAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2657
;2656:
;2657:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1155
line 2658
;2658:	{
line 2659
;2659:		legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 2660
;2660:		legsAngles[PITCH] = 0;
ADDRFP4 8
INDIRP4
CNSTF4 0
ASGNF4
line 2661
;2661:	}
LABELV $1155
line 2664
;2662:
;2663:	// pull the angles back out of the hierarchial chain
;2664:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 2665
;2665:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
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
line 2667
;2666:
;2667:	legsAngles[PITCH] = 0;
ADDRFP4 8
INDIRP4
CNSTF4 0
ASGNF4
line 2669
;2668:
;2669:	AnglesToAxis( legsAngles, legs );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2672
;2670:	// we assume that model 0 is the player model.
;2671:
;2672:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1157
line 2673
;2673:	{
line 2676
;2674:		vec3_t flatYaw;
;2675:
;2676:		flatYaw[YAW] = 0;//cent->lerpAngles[YAW];
ADDRLP4 188+4
CNSTF4 0
ASGNF4
line 2677
;2677:		flatYaw[ROLL] = 0;
ADDRLP4 188+8
CNSTF4 0
ASGNF4
line 2678
;2678:		flatYaw[PITCH] = 0;
ADDRLP4 188
CNSTF4 0
ASGNF4
line 2679
;2679:		CG_G2SetBoneAngles(cent->ghoul2, 0, "pelvis", flatYaw, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 188
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2681
;2680:
;2681:		CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", torsoAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $1163
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2683
;2682:
;2683:		return;
ADDRGP4 $1073
JUMPV
LABELV $1157
line 2688
;2684:	}
;2685:
;2686://	trap_G2API_SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", torsoAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
;2687:
;2688:	VectorCopy( cent->lerpAngles, viewAngles );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2689
;2689:	viewAngles[YAW] = viewAngles[ROLL] = 0;
ADDRLP4 188
CNSTF4 0
ASGNF4
ADDRLP4 72+8
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 72+4
ADDRLP4 188
INDIRF4
ASGNF4
line 2690
;2690:	viewAngles[PITCH] *= 0.5;
ADDRLP4 72
CNSTF4 1056964608
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
line 2692
;2691:
;2692:	VectorSet( angles, 0, legsAngles[1], 0 );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 24+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 2694
;2693:
;2694:	angles[0] = legsAngles[0];
ADDRLP4 24
ADDRFP4 8
INDIRP4
INDIRF4
ASGNF4
line 2695
;2695:	if ( angles[0] > 30 )
ADDRLP4 24
INDIRF4
CNSTF4 1106247680
LEF4 $1170
line 2696
;2696:	{
line 2697
;2697:		angles[0] = 30;
ADDRLP4 24
CNSTF4 1106247680
ASGNF4
line 2698
;2698:	}
ADDRGP4 $1171
JUMPV
LABELV $1170
line 2699
;2699:	else if ( angles[0] < -30 )
ADDRLP4 24
INDIRF4
CNSTF4 3253731328
GEF4 $1172
line 2700
;2700:	{
line 2701
;2701:		angles[0] = -30;
ADDRLP4 24
CNSTF4 3253731328
ASGNF4
line 2702
;2702:	}
LABELV $1172
LABELV $1171
line 2706
;2703:
;2704://	VectorCopy(legsAngles, angles);
;2705:
;2706:	CG_G2ClientSpineAngles(cent, viewAngles, angles, thoracicAngles, ulAngles, llAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 CG_G2ClientSpineAngles
CALLV
pop
line 2708
;2707:
;2708:	if ( cent->currentState.otherEntityNum2 && !(cent->currentState.eFlags & EF_DEAD) )
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRLP4 192
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $1174
ADDRLP4 192
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 196
INDIRI4
NEI4 $1174
line 2709
;2709:	{ //using an emplaced gun
line 2710
;2710:		centity_t *empEnt = &cg_entities[cent->currentState.otherEntityNum2];
ADDRLP4 212
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2713
;2711:		vec3_t headAng;
;2712:
;2713:		VectorClear(headAng);
ADDRLP4 216
CNSTF4 0
ASGNF4
ADDRLP4 200+8
ADDRLP4 216
INDIRF4
ASGNF4
ADDRLP4 200+4
ADDRLP4 216
INDIRF4
ASGNF4
ADDRLP4 200
ADDRLP4 216
INDIRF4
ASGNF4
line 2715
;2714:
;2715:		if (empEnt)
ADDRLP4 212
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1178
line 2716
;2716:		{
line 2719
;2717:			vec3_t dif, empOrg, originalAngle;
;2718:
;2719:			VectorCopy(cent->lerpAngles, originalAngle);
ADDRLP4 244
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2721
;2720:
;2721:			VectorCopy(empEnt->lerpOrigin, empOrg);
ADDRLP4 232
ADDRLP4 212
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2723
;2722:
;2723:			empOrg[2] += 32;
ADDRLP4 232+8
ADDRLP4 232+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2725
;2724:
;2725:			VectorSubtract(empOrg, cent->lerpOrigin, dif);
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
ADDRLP4 232
INDIRF4
ADDRLP4 256
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 220+4
ADDRLP4 232+4
INDIRF4
ADDRLP4 256
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 220+8
ADDRLP4 232+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2726
;2726:			VectorNormalize(dif);
ADDRLP4 220
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2727
;2727:			vectoangles(dif, dif);
ADDRLP4 220
ARGP4
ADDRLP4 220
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2729
;2728:			
;2729:			VectorCopy(dif, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 220
INDIRB
ASGNB 12
line 2731
;2730:
;2731:			VectorCopy(cent->lerpAngles, legsAngles);
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2733
;2732:
;2733:			VectorSubtract(originalAngle, cent->lerpAngles, headAng);
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
ADDRLP4 244
INDIRF4
ADDRLP4 260
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200+4
ADDRLP4 244+4
INDIRF4
ADDRLP4 260
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200+8
ADDRLP4 244+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2735
;2734:
;2735:			headAng[PITCH] /= 3; //scale it down so that you can't bend your neck all the way back
ADDRLP4 200
ADDRLP4 200
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 2736
;2736:		}
ADDRGP4 $1179
JUMPV
LABELV $1178
line 2738
;2737:		else
;2738:		{
line 2739
;2739:			VectorClear(cent->lerpAngles);
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
CNSTF4 0
ASGNF4
ADDRLP4 220
INDIRP4
CNSTI4 948
ADDP4
ADDRLP4 224
INDIRF4
ASGNF4
ADDRLP4 220
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 224
INDIRF4
ASGNF4
ADDRLP4 220
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 224
INDIRF4
ASGNF4
line 2740
;2740:			VectorClear(legsAngles);
ADDRLP4 228
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 232
CNSTF4 0
ASGNF4
ADDRLP4 228
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 232
INDIRF4
ASGNF4
ADDRLP4 228
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 232
INDIRF4
ASGNF4
ADDRLP4 228
INDIRP4
ADDRLP4 232
INDIRF4
ASGNF4
line 2741
;2741:		}
LABELV $1179
line 2743
;2742:
;2743:		AnglesToAxis( legsAngles, legs );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2745
;2744:
;2745:		CG_G2SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 220
CNSTI4 0
ASGNI4
ADDRLP4 220
INDIRI4
ARGI4
ADDRGP4 $303
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 220
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2746
;2746:		CG_G2SetBoneAngles(cent->ghoul2, 0, "lower_lumbar", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 224
CNSTI4 0
ASGNI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRGP4 $312
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 224
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2747
;2747:		CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRLP4 228
INDIRI4
ARGI4
ADDRGP4 $1163
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 228
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2749
;2748:
;2749:		CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", headAng, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 232
CNSTI4 0
ASGNI4
ADDRLP4 232
INDIRI4
ARGI4
ADDRGP4 $1195
ARGP4
ADDRLP4 200
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 232
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2750
;2750:	}
ADDRGP4 $1175
JUMPV
LABELV $1174
line 2752
;2751:	else
;2752:	{
line 2753
;2753:		CG_G2SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2754
;2754:		CG_G2SetBoneAngles(cent->ghoul2, 0, "lower_lumbar", llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2755
;2755:		CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", thoracicAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 $1163
ARGP4
ADDRLP4 96
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2757
;2756:
;2757:		if (cg_duelHeadAngles.integer && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRGP4 cg_duelHeadAngles+12
INDIRI4
ADDRLP4 212
INDIRI4
EQI4 $1204
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 212
INDIRI4
NEI4 $1204
line 2758
;2758:		{
line 2759
;2759:			if ( !BG_FlippingAnim( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 216
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 220
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 224
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 228
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 232
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 236
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 240
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
ADDRGP4 CG_InRoll
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 248
ADDRGP4 CG_InRollAnim
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 252
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 256
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $1207
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 260
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 264
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 268
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 272
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 276
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 280
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 284
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 288
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+784
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 292
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $1207
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+780
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 296
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $1207
line 2781
;2760:				!BG_SpinningSaberAnim( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
;2761:				!BG_SpinningSaberAnim( cent->currentState.torsoAnim&~ANIM_TOGGLEBIT ) &&
;2762:				!BG_InSpecialJump( cent->currentState.legsAnim&~ANIM_TOGGLEBIT ) &&
;2763:				!BG_InSpecialJump( cent->currentState.torsoAnim&~ANIM_TOGGLEBIT ) &&
;2764:				!BG_InDeathAnim(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) &&
;2765:				!BG_InDeathAnim(cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2766:				!CG_InRoll(cent) &&
;2767:				!CG_InRollAnim(cent) &&
;2768:				!BG_SaberInSpecial(cent->currentState.saberMove) &&
;2769:				!BG_SaberInSpecialAttack(cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) &&
;2770:				!BG_SaberInSpecialAttack(cent->currentState.legsAnim&~ANIM_TOGGLEBIT) &&
;2771:
;2772:				!BG_FlippingAnim( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2773:				!BG_SpinningSaberAnim( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2774:				!BG_SpinningSaberAnim( cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT ) &&
;2775:				!BG_InSpecialJump( cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT ) &&
;2776:				!BG_InSpecialJump( cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT ) &&
;2777:				!BG_InDeathAnim(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) &&
;2778:				!BG_InDeathAnim(cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT) &&
;2779:				!BG_SaberInSpecialAttack(cgs.clientinfo[cent->currentState.number].torsoAnim&~ANIM_TOGGLEBIT) &&
;2780:				!BG_SaberInSpecialAttack(cgs.clientinfo[cent->currentState.number].legsAnim&~ANIM_TOGGLEBIT) )
;2781:			{ //use similar check to spine correction, these are the "safe" anims to be in for twisting around
line 2783
;2782:				vec3_t headAngles;
;2783:				int duelClient = -1;
ADDRLP4 300
CNSTI4 -1
ASGNI4
line 2785
;2784:
;2785:				if (cgs.gametype == GT_TOURNAMENT && (cent->currentState.number == cgs.duelist1 || cent->currentState.number == cgs.duelist2))
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $1227
ADDRLP4 316
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 316
INDIRI4
ADDRGP4 cgs+36340
INDIRI4
EQI4 $1232
ADDRLP4 316
INDIRI4
ADDRGP4 cgs+36344
INDIRI4
NEI4 $1227
LABELV $1232
line 2786
;2786:				{
line 2787
;2787:					if (cgs.duelist1 >= 0 && cgs.duelist1 < MAX_CLIENTS &&
ADDRLP4 320
CNSTI4 0
ASGNI4
ADDRGP4 cgs+36340
INDIRI4
ADDRLP4 320
INDIRI4
LTI4 $1228
ADDRLP4 324
CNSTI4 32
ASGNI4
ADDRGP4 cgs+36340
INDIRI4
ADDRLP4 324
INDIRI4
GEI4 $1228
ADDRGP4 cgs+36344
INDIRI4
ADDRLP4 320
INDIRI4
LTI4 $1228
ADDRGP4 cgs+36344
INDIRI4
ADDRLP4 324
INDIRI4
GEI4 $1228
line 2789
;2788:						cgs.duelist2 >= 0 && cgs.duelist2 < MAX_CLIENTS)
;2789:					{
line 2790
;2790:						if (cent->currentState.number == cgs.duelist1)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cgs+36340
INDIRI4
NEI4 $1239
line 2791
;2791:						{
line 2792
;2792:							duelClient = cgs.duelist2;
ADDRLP4 300
ADDRGP4 cgs+36344
INDIRI4
ASGNI4
line 2793
;2793:						}
ADDRGP4 $1228
JUMPV
LABELV $1239
line 2795
;2794:						else
;2795:						{
line 2796
;2796:							duelClient = cgs.duelist1;
ADDRLP4 300
ADDRGP4 cgs+36340
INDIRI4
ASGNI4
line 2797
;2797:						}
line 2798
;2798:					}
line 2799
;2799:				}
ADDRGP4 $1228
JUMPV
LABELV $1227
line 2800
;2800:				else if (cg.snap && cg.snap->ps.duelInProgress)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1244
ADDRGP4 cg+36
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1244
line 2801
;2801:				{
line 2802
;2802:					if (cent->currentState.number == cg.snap->ps.duelIndex)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
NEI4 $1248
line 2803
;2803:					{
line 2804
;2804:						duelClient = cg.snap->ps.clientNum;
ADDRLP4 300
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 2805
;2805:					}
ADDRGP4 $1249
JUMPV
LABELV $1248
line 2806
;2806:					else if (cent->currentState.number == cg.snap->ps.clientNum)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1252
line 2807
;2807:					{
line 2808
;2808:						duelClient = cg.snap->ps.duelIndex;
ADDRLP4 300
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ASGNI4
line 2809
;2809:					}
LABELV $1252
LABELV $1249
line 2810
;2810:				}
LABELV $1244
LABELV $1228
line 2812
;2811:
;2812:				if (duelClient != -1)
ADDRLP4 300
INDIRI4
CNSTI4 -1
EQI4 $1256
line 2813
;2813:				{
line 2816
;2814:					trace_t tr;
;2815:
;2816:					CG_Trace( &tr, cent->lerpOrigin, NULL, NULL, cg_entities[duelClient].lerpOrigin, cent->currentState.number, MASK_PLAYERSOLID );
ADDRLP4 320
ARGP4
ADDRLP4 1400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1400
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 1404
CNSTP4 0
ASGNP4
ADDRLP4 1404
INDIRP4
ARGP4
ADDRLP4 1404
INDIRP4
ARGP4
CNSTI4 1920
ADDRLP4 300
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
ARGP4
ADDRLP4 1400
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2818
;2817:
;2818:					if (tr.fraction == 1.0 ||
ADDRLP4 320+8
INDIRF4
CNSTF4 1065353216
EQF4 $1263
ADDRLP4 320+52
INDIRI4
ADDRLP4 300
INDIRI4
NEI4 $1259
LABELV $1263
line 2820
;2819:						tr.entityNum == duelClient)
;2820:					{
line 2821
;2821:						centity_t *duelCEnt = &cg_entities[duelClient];
ADDRLP4 1408
CNSTI4 1920
ADDRLP4 300
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2824
;2822:						vec3_t headSub;
;2823:
;2824:						VectorSubtract(duelCEnt->lerpOrigin, cent->lerpOrigin, headSub);
ADDRLP4 1424
ADDRLP4 1408
INDIRP4
ASGNP4
ADDRLP4 1428
CNSTI4 928
ASGNI4
ADDRLP4 1432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1412
ADDRLP4 1424
INDIRP4
ADDRLP4 1428
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1432
INDIRP4
ADDRLP4 1428
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1436
CNSTI4 932
ASGNI4
ADDRLP4 1412+4
ADDRLP4 1424
INDIRP4
ADDRLP4 1436
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1432
INDIRP4
ADDRLP4 1436
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1440
CNSTI4 936
ASGNI4
ADDRLP4 1412+8
ADDRLP4 1408
INDIRP4
ADDRLP4 1440
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 1440
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2825
;2825:						vectoangles(headSub, headSub);
ADDRLP4 1412
ARGP4
ADDRLP4 1412
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2827
;2826:
;2827:						headAngles[ROLL] = AngleSubtract(headSub[ROLL], cent->lerpAngles[ROLL]);
ADDRLP4 1412+8
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRF4
ARGF4
ADDRLP4 1444
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 304+8
ADDRLP4 1444
INDIRF4
ASGNF4
line 2828
;2828:						headAngles[YAW] = AngleSubtract(headSub[YAW], cent->lerpAngles[YAW]);
ADDRLP4 1412+4
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ARGF4
ADDRLP4 1448
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 304+4
ADDRLP4 1448
INDIRF4
ASGNF4
line 2830
;2829:
;2830:						if (headAngles[YAW] > 55)
ADDRLP4 304+4
INDIRF4
CNSTF4 1113325568
LEF4 $1270
line 2831
;2831:						{
line 2832
;2832:							headAngles[YAW] = 55;
ADDRLP4 304+4
CNSTF4 1113325568
ASGNF4
line 2833
;2833:						}
LABELV $1270
line 2834
;2834:						if (headAngles[YAW] < -55)
ADDRLP4 304+4
INDIRF4
CNSTF4 3260809216
GEF4 $1274
line 2835
;2835:						{
line 2836
;2836:							headAngles[YAW] = -55;
ADDRLP4 304+4
CNSTF4 3260809216
ASGNF4
line 2837
;2837:						}
LABELV $1274
line 2839
;2838:
;2839:						VectorCopy( cent->lerpAngles, viewAngles );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 2840
;2840:						viewAngles[YAW] = viewAngles[ROLL] = 0;
ADDRLP4 1452
CNSTF4 0
ASGNF4
ADDRLP4 72+8
ADDRLP4 1452
INDIRF4
ASGNF4
ADDRLP4 72+4
ADDRLP4 1452
INDIRF4
ASGNF4
line 2841
;2841:						viewAngles[PITCH] *= 0.5;
ADDRLP4 72
CNSTF4 1056964608
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
line 2843
;2842:
;2843:						headAngles[PITCH] = AngleSubtract(headSub[PITCH], viewAngles[PITCH]);
ADDRLP4 1412
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 1456
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 304
ADDRLP4 1456
INDIRF4
ASGNF4
line 2844
;2844:						if (headAngles[PITCH] > 16)
ADDRLP4 304
INDIRF4
CNSTF4 1098907648
LEF4 $1280
line 2845
;2845:						{
line 2846
;2846:							headAngles[PITCH] = 16;
ADDRLP4 304
CNSTF4 1098907648
ASGNF4
line 2847
;2847:						}
LABELV $1280
line 2848
;2848:						if (headAngles[PITCH] < -16)
ADDRLP4 304
INDIRF4
CNSTF4 3246391296
GEF4 $1282
line 2849
;2849:						{
line 2850
;2850:							headAngles[PITCH] = -16;
ADDRLP4 304
CNSTF4 3246391296
ASGNF4
line 2851
;2851:						}
LABELV $1282
line 2852
;2852:						headAngles[PITCH] += 6;
ADDRLP4 304
ADDRLP4 304
INDIRF4
CNSTF4 1086324736
ADDF4
ASGNF4
line 2853
;2853:					}
ADDRGP4 $1257
JUMPV
LABELV $1259
line 2855
;2854:					else
;2855:					{
line 2856
;2856:						VectorClear(headAngles);
ADDRLP4 1408
CNSTF4 0
ASGNF4
ADDRLP4 304+8
ADDRLP4 1408
INDIRF4
ASGNF4
ADDRLP4 304+4
ADDRLP4 1408
INDIRF4
ASGNF4
ADDRLP4 304
ADDRLP4 1408
INDIRF4
ASGNF4
line 2857
;2857:					}
line 2858
;2858:				}
ADDRGP4 $1257
JUMPV
LABELV $1256
line 2860
;2859:				else
;2860:				{
line 2861
;2861:					VectorClear(headAngles);
ADDRLP4 320
CNSTF4 0
ASGNF4
ADDRLP4 304+8
ADDRLP4 320
INDIRF4
ASGNF4
ADDRLP4 304+4
ADDRLP4 320
INDIRF4
ASGNF4
ADDRLP4 304
ADDRLP4 320
INDIRF4
ASGNF4
line 2862
;2862:				}
LABELV $1257
line 2864
;2863:
;2864:				CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", headAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 320
CNSTI4 0
ASGNI4
ADDRLP4 320
INDIRI4
ARGI4
ADDRGP4 $1195
ARGP4
ADDRLP4 304
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 320
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2865
;2865:			}
ADDRGP4 $1205
JUMPV
LABELV $1207
line 2867
;2866:			else
;2867:			{
line 2868
;2868:				VectorClear(headAngles);
ADDRLP4 300
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 300
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 300
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 300
INDIRF4
ASGNF4
line 2869
;2869:				CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", headAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 304
CNSTI4 0
ASGNI4
ADDRLP4 304
INDIRI4
ARGI4
ADDRGP4 $1195
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 304
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2870
;2870:			}
line 2871
;2871:		}
ADDRGP4 $1205
JUMPV
LABELV $1204
line 2873
;2872:		else
;2873:		{
line 2874
;2874:			CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 216
CNSTI4 0
ASGNI4
ADDRLP4 216
INDIRI4
ARGI4
ADDRGP4 $1195
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 216
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 2875
;2875:		}
LABELV $1205
line 2876
;2876:	}
LABELV $1175
line 2879
;2877:
;2878:	//trap_G2API_SetBoneAngles(cent->ghoul2, 0, "cranium", headAngles, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, cgs.gameModels, 0, cg.time); 
;2879:}
LABELV $1073
endproc CG_G2PlayerAngles 1460 44
proc CG_HasteTrail 40 48
line 2887
;2880://==========================================================================
;2881:
;2882:/*
;2883:===============
;2884:CG_HasteTrail
;2885:===============
;2886:*/
;2887:static void CG_HasteTrail( centity_t *cent ) {
line 2892
;2888:	localEntity_t	*smoke;
;2889:	vec3_t			origin;
;2890:	int				anim;
;2891:
;2892:	if ( cent->trailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $1297
line 2893
;2893:		return;
ADDRGP4 $1296
JUMPV
LABELV $1297
line 2895
;2894:	}
;2895:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2896
;2896:	if ( anim != BOTH_RUN1 && anim != BOTH_RUNBACK1 ) {
ADDRLP4 12
INDIRI4
CNSTI4 833
EQI4 $1300
ADDRLP4 12
INDIRI4
CNSTI4 854
EQI4 $1300
line 2897
;2897:		return;
ADDRGP4 $1296
JUMPV
LABELV $1300
line 2900
;2898:	}
;2899:
;2900:	cent->trailTime += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2901
;2901:	if ( cent->trailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
GEI4 $1302
line 2902
;2902:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2903
;2903:	}
LABELV $1302
line 2905
;2904:
;2905:	VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 2906
;2906:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 2908
;2907:
;2908:	smoke = CG_SmokePuff( origin, vec3_origin, 
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1090519040
ARGF4
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 cgs+70296+476
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 2918
;2909:				  8, 
;2910:				  1, 1, 1, 1,
;2911:				  500, 
;2912:				  cg.time,
;2913:				  0,
;2914:				  0,
;2915:				  cgs.media.hastePuffShader );
;2916:
;2917:	// use the optimized local entity add
;2918:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 9
ASGNI4
line 2919
;2919:}
LABELV $1296
endproc CG_HasteTrail 40 48
proc CG_PlayerFlag 368 36
line 3005
;2920:
;2921:/*
;2922:===============
;2923:CG_DustTrail
;2924:===============
;2925:*/
;2926:/*
;2927:static void CG_DustTrail( centity_t *cent ) {
;2928:	int				anim;
;2929:	localEntity_t	*dust;
;2930:	vec3_t end, vel;
;2931:	trace_t tr;
;2932:
;2933:	if (!cg_enableDust.integer)
;2934:		return;
;2935:
;2936:	if ( cent->dustTrailTime > cg.time ) {
;2937:		return;
;2938:	}
;2939:
;2940:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
;2941:	if ( anim != LEGS_LANDB && anim != LEGS_LAND ) {
;2942:		return;
;2943:	}
;2944:
;2945:	cent->dustTrailTime += 40;
;2946:	if ( cent->dustTrailTime < cg.time ) {
;2947:		cent->dustTrailTime = cg.time;
;2948:	}
;2949:
;2950:	VectorCopy(cent->currentState.pos.trBase, end);
;2951:	end[2] -= 64;
;2952:	CG_Trace( &tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID );
;2953:
;2954:	if ( !(tr.surfaceFlags & SURF_DUST) )
;2955:		return;
;2956:
;2957:	VectorCopy( cent->currentState.pos.trBase, end );
;2958:	end[2] -= 16;
;2959:
;2960:	VectorSet(vel, 0, 0, -30);
;2961:	dust = CG_SmokePuff( end, vel,
;2962:				  24,
;2963:				  .8f, .8f, 0.7f, 0.33f,
;2964:				  500,
;2965:				  cg.time,
;2966:				  0,
;2967:				  0,
;2968:				  cgs.media.dustPuffShader );
;2969:}
;2970:*/
;2971:
;2972:/*
;2973:===============
;2974:CG_TrailItem
;2975:===============
;2976:*/
;2977:#if 0
;2978:static void CG_TrailItem( centity_t *cent, qhandle_t hModel ) {
;2979:	refEntity_t		ent;
;2980:	vec3_t			angles;
;2981:	vec3_t			axis[3];
;2982:
;2983:	VectorCopy( cent->lerpAngles, angles );
;2984:	angles[PITCH] = 0;
;2985:	angles[ROLL] = 0;
;2986:	AnglesToAxis( angles, axis );
;2987:
;2988:	memset( &ent, 0, sizeof( ent ) );
;2989:	VectorMA( cent->lerpOrigin, -16, axis[0], ent.origin );
;2990:	ent.origin[2] += 16;
;2991:	angles[YAW] += 90;
;2992:	AnglesToAxis( angles, ent.axis );
;2993:
;2994:	ent.hModel = hModel;
;2995:	trap_R_AddRefEntityToScene( &ent );
;2996:}
;2997:#endif
;2998:
;2999:
;3000:/*
;3001:===============
;3002:CG_PlayerFlag
;3003:===============
;3004:*/
;3005:static void CG_PlayerFlag( centity_t *cent, qhandle_t hModel ) {
line 3012
;3006:	refEntity_t		ent;
;3007:	vec3_t			angles;
;3008:	vec3_t			axis[3];
;3009:	vec3_t			boltOrg, tAng, getAng, right;
;3010:	mdxaBone_t		boltMatrix;
;3011:
;3012:	if (cent->currentState.number == cg.snap->ps.clientNum &&
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1311
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $1311
line 3014
;3013:		!cg.renderingThirdPerson)
;3014:	{
line 3015
;3015:		return;
ADDRGP4 $1310
JUMPV
LABELV $1311
line 3018
;3016:	}
;3017:
;3018:	if (!cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1315
line 3019
;3019:	{
line 3020
;3020:		return;
ADDRGP4 $1310
JUMPV
LABELV $1315
line 3023
;3021:	}
;3022:
;3023:	VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
ADDRLP4 356
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 224+4
ADDRLP4 356
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 224+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 3025
;3024:
;3025:	trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_llumbar, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 360
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+528
ADDP4
INDIRI4
ARGI4
ADDRLP4 308
ARGP4
ADDRLP4 224
ARGP4
ADDRLP4 360
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 360
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 3026
;3026:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, boltOrg);
ADDRLP4 308
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 212
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 3028
;3027:
;3028:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, POSITIVE_X, tAng);
ADDRLP4 308
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 224
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 3029
;3029:	vectoangles(tAng, tAng);
ADDRLP4 224
ARGP4
ADDRLP4 224
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3031
;3030:
;3031:	VectorCopy(cent->lerpAngles, angles);
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 3033
;3032:
;3033:	boltOrg[2] -= 12;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 3034
;3034:	VectorSet(getAng, 0, cent->lerpAngles[1], 0);
ADDRLP4 284
CNSTF4 0
ASGNF4
ADDRLP4 284+4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ASGNF4
ADDRLP4 284+8
CNSTF4 0
ASGNF4
line 3035
;3035:	AngleVectors(getAng, 0, right, 0);
ADDRLP4 284
ARGP4
ADDRLP4 364
CNSTP4 0
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 296
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3036
;3036:	boltOrg[0] += right[0]*8;
ADDRLP4 212
ADDRLP4 212
INDIRF4
CNSTF4 1090519040
ADDRLP4 296
INDIRF4
MULF4
ADDF4
ASGNF4
line 3037
;3037:	boltOrg[1] += right[1]*8;
ADDRLP4 212+4
ADDRLP4 212+4
INDIRF4
CNSTF4 1090519040
ADDRLP4 296+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3038
;3038:	boltOrg[2] += right[2]*8;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1090519040
ADDRLP4 296+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3040
;3039:
;3040:	angles[PITCH] = -cent->lerpAngles[PITCH]/2-30;
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
CNSTF4 1106247680
SUBF4
ASGNF4
line 3041
;3041:	angles[YAW] = tAng[YAW]+270;
ADDRLP4 236+4
ADDRLP4 224+4
INDIRF4
CNSTF4 1132920832
ADDF4
ASGNF4
line 3043
;3042:
;3043:	AnglesToAxis(angles, axis);
ADDRLP4 236
ARGP4
ADDRLP4 248
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3045
;3044:
;3045:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3046
;3046:	VectorMA( boltOrg, 24, axis[0], ent.origin );
ADDRLP4 0+52
ADDRLP4 212
INDIRF4
CNSTF4 1103101952
ADDRLP4 248
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+4
ADDRLP4 212+4
INDIRF4
CNSTF4 1103101952
ADDRLP4 248+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+52+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDRLP4 248+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3048
;3047:
;3048:	angles[ROLL] += 20;
ADDRLP4 236+8
ADDRLP4 236+8
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 3049
;3049:	AnglesToAxis( angles, ent.axis );
ADDRLP4 236
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3051
;3050:
;3051:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 3053
;3052:
;3053:	ent.modelScale[0] = 0.5;
ADDRLP4 0+196
CNSTF4 1056964608
ASGNF4
line 3054
;3054:	ent.modelScale[1] = 0.5;
ADDRLP4 0+196+4
CNSTF4 1056964608
ASGNF4
line 3055
;3055:	ent.modelScale[2] = 0.5;
ADDRLP4 0+196+8
CNSTF4 1056964608
ASGNF4
line 3056
;3056:	ScaleModelAxis(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 3067
;3057:
;3058:	/*
;3059:	if (cent->currentState.number == cg.snap->ps.clientNum)
;3060:	{ //If we're the current client (in third person), render the flag on our back transparently
;3061:		ent.renderfx |= RF_FORCE_ENT_ALPHA;
;3062:		ent.shaderRGBA[3] = 100;
;3063:	}
;3064:	*/
;3065:	//FIXME: Not doing this at the moment because sorting totally messes up
;3066:
;3067:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3068
;3068:}
LABELV $1310
endproc CG_PlayerFlag 368 36
proc CG_PlayerPowerups 16 20
line 3076
;3069:
;3070:
;3071:/*
;3072:===============
;3073:CG_PlayerPowerups
;3074:===============
;3075:*/
;3076:static void CG_PlayerPowerups( centity_t *cent, refEntity_t *torso ) {
line 3080
;3077:	int		powerups;
;3078:	clientInfo_t	*ci;
;3079:
;3080:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
line 3081
;3081:	if ( !powerups ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1350
line 3082
;3082:		return;
ADDRGP4 $1349
JUMPV
LABELV $1350
line 3086
;3083:	}
;3084:
;3085:	// quad gives a dlight
;3086:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1352
line 3087
;3087:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3088
;3088:	}
LABELV $1352
line 3090
;3089:
;3090:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 4
CNSTI4 788
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 3092
;3091:	// redflag
;3092:	if ( powerups & ( 1 << PW_REDFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1355
line 3093
;3093:		CG_PlayerFlag( cent, cgs.media.redFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+36
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 3094
;3094:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3095
;3095:	}
LABELV $1355
line 3098
;3096:
;3097:	// blueflag
;3098:	if ( powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1359
line 3099
;3099:		CG_PlayerFlag( cent, cgs.media.blueFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+40
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 3100
;3100:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1.0 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3101
;3101:	}
LABELV $1359
line 3104
;3102:
;3103:	// neutralflag
;3104:	if ( powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1363
line 3105
;3105:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 1.0, 1.0 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3106
;3106:	}
LABELV $1363
line 3109
;3107:
;3108:	// haste leaves smoke trails
;3109:	if ( powerups & ( 1 << PW_HASTE ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1365
line 3110
;3110:		CG_HasteTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 3111
;3111:	}
LABELV $1365
line 3112
;3112:}
LABELV $1349
endproc CG_PlayerPowerups 16 20
proc CG_PlayerFloatSprite 216 12
line 3122
;3113:
;3114:
;3115:/*
;3116:===============
;3117:CG_PlayerFloatSprite
;3118:
;3119:Float a sprite over the player's head
;3120:===============
;3121:*/
;3122:static void CG_PlayerFloatSprite( centity_t *cent, qhandle_t shader ) {
line 3126
;3123:	int				rf;
;3124:	refEntity_t		ent;
;3125:
;3126:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1368
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $1368
line 3127
;3127:		rf = RF_THIRD_PERSON;		// only show in mirrors
ADDRLP4 212
CNSTI4 2
ASGNI4
line 3128
;3128:	} else {
ADDRGP4 $1369
JUMPV
LABELV $1368
line 3129
;3129:		rf = 0;
ADDRLP4 212
CNSTI4 0
ASGNI4
line 3130
;3130:	}
LABELV $1369
line 3132
;3131:
;3132:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3133
;3133:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 3134
;3134:	ent.origin[2] += 48;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 3135
;3135:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 3136
;3136:	ent.customShader = shader;
ADDRLP4 0+76
ADDRFP4 4
INDIRI4
ASGNI4
line 3137
;3137:	ent.radius = 10;
ADDRLP4 0+92
CNSTF4 1092616192
ASGNF4
line 3138
;3138:	ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 212
INDIRI4
ASGNI4
line 3139
;3139:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 3140
;3140:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 3141
;3141:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 3142
;3142:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+80+3
CNSTU1 255
ASGNU1
line 3143
;3143:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3144
;3144:}
LABELV $1367
endproc CG_PlayerFloatSprite 216 12
proc CG_PlayerSprites 8 20
line 3189
;3145:
;3146:
;3147:
;3148:/*
;3149:===============
;3150:CG_PlayerFloatSprite
;3151:
;3152:Same as above but allows custom RGBA values
;3153:===============
;3154:*/
;3155:#if 0
;3156:static void CG_PlayerFloatSpriteRGBA( centity_t *cent, qhandle_t shader, vec4_t rgba ) {
;3157:	int				rf;
;3158:	refEntity_t		ent;
;3159:
;3160:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
;3161:		rf = RF_THIRD_PERSON;		// only show in mirrors
;3162:	} else {
;3163:		rf = 0;
;3164:	}
;3165:
;3166:	memset( &ent, 0, sizeof( ent ) );
;3167:	VectorCopy( cent->lerpOrigin, ent.origin );
;3168:	ent.origin[2] += 48;
;3169:	ent.reType = RT_SPRITE;
;3170:	ent.customShader = shader;
;3171:	ent.radius = 10;
;3172:	ent.renderfx = rf;
;3173:	ent.shaderRGBA[0] = rgba[0];
;3174:	ent.shaderRGBA[1] = rgba[1];
;3175:	ent.shaderRGBA[2] = rgba[2];
;3176:	ent.shaderRGBA[3] = rgba[3];
;3177:	trap_R_AddRefEntityToScene( &ent );
;3178:}
;3179:#endif
;3180:
;3181:
;3182:/*
;3183:===============
;3184:CG_PlayerSprites
;3185:
;3186:Float sprites over the player's head
;3187:===============
;3188:*/
;3189:static void CG_PlayerSprites( centity_t *cent ) {
line 3192
;3190://	int		team;
;3191:
;3192:	if (cg.snap &&
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1386
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
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
ADDRLP4 4
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1386
line 3198
;3193:		CG_IsMindTricked(cent->currentState.trickedentindex,
;3194:		cent->currentState.trickedentindex2,
;3195:		cent->currentState.trickedentindex3,
;3196:		cent->currentState.trickedentindex4,
;3197:		cg.snap->ps.clientNum))
;3198:	{
line 3199
;3199:		return; //this entity is mind-tricking the current client, so don't render it
ADDRGP4 $1385
JUMPV
LABELV $1386
line 3202
;3200:	}
;3201:
;3202:	if ( cent->currentState.eFlags & EF_CONNECTION ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1390
line 3203
;3203:		CG_PlayerFloatSprite( cent, cgs.media.connectionShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+188
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 3204
;3204:		return;
ADDRGP4 $1385
JUMPV
LABELV $1390
line 3207
;3205:	}
;3206:
;3207:	if ( cent->currentState.eFlags & EF_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1394
line 3208
;3208:		CG_PlayerFloatSprite( cent, cgs.media.balloonShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+184
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 3209
;3209:		return;
LABELV $1394
line 3252
;3210:	}
;3211:/*
;3212:	if ( cent->currentState.eFlags & EF_AWARD_IMPRESSIVE ) {
;3213:		CG_PlayerFloatSprite( cent, cgs.media.medalImpressive );
;3214:		return;
;3215:	}
;3216:
;3217:	if ( cent->currentState.eFlags & EF_AWARD_EXCELLENT ) {
;3218:		CG_PlayerFloatSprite( cent, cgs.media.medalExcellent );
;3219:		return;
;3220:	}
;3221:
;3222:	if ( cent->currentState.eFlags & EF_AWARD_GAUNTLET ) {
;3223:		CG_PlayerFloatSprite( cent, cgs.media.medalGauntlet );
;3224:		return;
;3225:	}
;3226:
;3227:	if ( cent->currentState.eFlags & EF_AWARD_DEFEND ) {
;3228:		CG_PlayerFloatSprite( cent, cgs.media.medalDefend );
;3229:		return;
;3230:	}
;3231:
;3232:	if ( cent->currentState.eFlags & EF_AWARD_ASSIST ) {
;3233:		CG_PlayerFloatSprite( cent, cgs.media.medalAssist );
;3234:		return;
;3235:	}
;3236:
;3237:	if ( cent->currentState.eFlags & EF_AWARD_CAP ) {
;3238:		CG_PlayerFloatSprite( cent, cgs.media.medalCapture );
;3239:		return;
;3240:	}
;3241:
;3242:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
;3243:	if ( !(cent->currentState.eFlags & EF_DEAD) && 
;3244:		cg.snap->ps.persistant[PERS_TEAM] == team &&
;3245:		cgs.gametype >= GT_TEAM) {
;3246:		if (cg_drawFriend.integer) {
;3247:			CG_PlayerFloatSprite( cent, cgs.media.friendShader );
;3248:		}
;3249:		return;
;3250:	}
;3251:*/
;3252:}
LABELV $1385
endproc CG_PlayerSprites 8 20
lit
align 4
LABELV $1399
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $1400
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 1136 44
line 3264
;3253:
;3254:/*
;3255:===============
;3256:CG_PlayerShadow
;3257:
;3258:Returns the Z component of the surface being shadowed
;3259:
;3260:  should it return a full plane instead of a Z?
;3261:===============
;3262:*/
;3263:#define	SHADOW_DISTANCE		128
;3264:static qboolean CG_PlayerShadow( centity_t *cent, float *shadowPlane ) {
line 3265
;3265:	vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 1096
ADDRGP4 $1399
INDIRB
ASGNB 12
ADDRLP4 1108
ADDRGP4 $1400
INDIRB
ASGNB 12
line 3269
;3266:	trace_t		trace;
;3267:	float		alpha;
;3268:
;3269:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 3271
;3270:
;3271:	if ( cg_shadows.integer == 0 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1401
line 3272
;3272:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1401
line 3275
;3273:	}
;3274:
;3275:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1404
line 3276
;3276:	{
line 3277
;3277:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1404
line 3280
;3278:	}
;3279:
;3280:	if (CG_IsMindTricked(cent->currentState.trickedentindex,
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
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
ADDRLP4 1124
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $1406
line 3285
;3281:		cent->currentState.trickedentindex2,
;3282:		cent->currentState.trickedentindex3,
;3283:		cent->currentState.trickedentindex4,
;3284:		cg.snap->ps.clientNum))
;3285:	{
line 3286
;3286:		return qfalse; //this entity is mind-tricking the current client, so don't render it
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1406
line 3290
;3287:	}
;3288:
;3289:	// send a trace down from the player to the ground
;3290:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 3291
;3291:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 1084+8
ADDRLP4 1084+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 3293
;3292:
;3293:	trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1096
ARGP4
ADDRLP4 1108
ARGP4
CNSTI4 0
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 3296
;3294:
;3295:	// no shadow if too high
;3296:	if ( trace.fraction == 1.0 || trace.startsolid || trace.allsolid ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1415
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $1415
ADDRLP4 0
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1410
LABELV $1415
line 3297
;3297:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1410
line 3300
;3298:	}
;3299:
;3300:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3302
;3301:
;3302:	if ( cg_shadows.integer != 1 ) {	// no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $1418
line 3303
;3303:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1418
line 3307
;3304:	}
;3305:
;3306:	// fade the shadow out with height
;3307:	alpha = 1.0 - trace.fraction;
ADDRLP4 1080
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 3314
;3308:
;3309:	// bk0101022 - hack / FPE - bogus planes?
;3310:	//assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f ) 
;3311:
;3312:	// add the mark as a temporary, so it goes directly to the renderer
;3313:	// without taking a spot in the cg_marks array
;3314:	CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal, 
ADDRGP4 cgs+70296+404
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRF4
ARGF4
ADDRLP4 1080
INDIRF4
ARGF4
ADDRLP4 1080
INDIRF4
ARGF4
ADDRLP4 1080
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1103101952
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 3317
;3315:		cent->pe.legs.yawAngle, alpha,alpha,alpha,1, qfalse, 24, qtrue );
;3316:
;3317:	return qtrue;
CNSTI4 1
RETI4
LABELV $1398
endproc CG_PlayerShadow 1136 44
proc CG_PlayerSplash 1216 28
line 3328
;3318:}
;3319:
;3320:
;3321:/*
;3322:===============
;3323:CG_PlayerSplash
;3324:
;3325:Draw a mark at the water surface
;3326:===============
;3327:*/
;3328:static void CG_PlayerSplash( centity_t *cent ) {
line 3334
;3329:	vec3_t		start, end;
;3330:	trace_t		trace;
;3331:	int			contents;
;3332:	polyVert_t	verts[4];
;3333:
;3334:	if ( !cg_shadows.integer ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1427
line 3335
;3335:		return;
ADDRGP4 $1426
JUMPV
LABELV $1427
line 3338
;3336:	}
;3337:
;3338:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 1188
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 3339
;3339:	end[2] -= 24;
ADDRLP4 1188+8
ADDRLP4 1188+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 3343
;3340:
;3341:	// if the feet aren't in liquid, don't make a mark
;3342:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;3343:	contents = trap_CM_PointContents( end, 0 );
ADDRLP4 1188
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1204
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 1200
ADDRLP4 1204
INDIRI4
ASGNI4
line 3344
;3344:	if ( !( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) ) {
ADDRLP4 1200
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
NEI4 $1431
line 3345
;3345:		return;
ADDRGP4 $1426
JUMPV
LABELV $1431
line 3348
;3346:	}
;3347:
;3348:	VectorCopy( cent->lerpOrigin, start );
ADDRLP4 1176
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 3349
;3349:	start[2] += 32;
ADDRLP4 1176+8
ADDRLP4 1176+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3352
;3350:
;3351:	// if the head isn't out of liquid, don't make a mark
;3352:	contents = trap_CM_PointContents( start, 0 );
ADDRLP4 1176
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1208
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 1200
ADDRLP4 1208
INDIRI4
ASGNI4
line 3353
;3353:	if ( contents & ( CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 1200
INDIRI4
CNSTI4 131079
BANDI4
CNSTI4 0
EQI4 $1434
line 3354
;3354:		return;
ADDRGP4 $1426
JUMPV
LABELV $1434
line 3358
;3355:	}
;3356:
;3357:	// trace down to find the surface
;3358:	trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) );
ADDRLP4 96
ARGP4
ADDRLP4 1176
ARGP4
ADDRLP4 1188
ARGP4
ADDRLP4 1212
CNSTP4 0
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1212
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 131078
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 3360
;3359:
;3360:	if ( trace.fraction == 1.0 ) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $1436
line 3361
;3361:		return;
ADDRGP4 $1426
JUMPV
LABELV $1436
line 3365
;3362:	}
;3363:
;3364:	// create a mark polygon
;3365:	VectorCopy( trace.endpos, verts[0].xyz );
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 3366
;3366:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3367
;3367:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3368
;3368:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 3369
;3369:	verts[0].st[1] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 3370
;3370:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 3371
;3371:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 3372
;3372:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 3373
;3373:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 3375
;3374:
;3375:	VectorCopy( trace.endpos, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 3376
;3376:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3377
;3377:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3378
;3378:	verts[1].st[0] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 3379
;3379:	verts[1].st[1] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 3380
;3380:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 3381
;3381:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 3382
;3382:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 3383
;3383:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 3385
;3384:
;3385:	VectorCopy( trace.endpos, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 3386
;3386:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3387
;3387:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3388
;3388:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 3389
;3389:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 3390
;3390:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 3391
;3391:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 3392
;3392:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 3393
;3393:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 3395
;3394:
;3395:	VectorCopy( trace.endpos, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 3396
;3396:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3397
;3397:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 3398
;3398:	verts[3].st[0] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 3399
;3399:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 3400
;3400:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 3401
;3401:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 3402
;3402:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 3403
;3403:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 3405
;3404:
;3405:	trap_R_AddPolyToScene( cgs.media.wakeMarkShader, 4, verts );
ADDRGP4 cgs+70296+412
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 3406
;3406:}
LABELV $1426
endproc CG_PlayerSplash 1216 28
export CG_ForcePushBlur
proc CG_ForcePushBlur 28 4
line 3409
;3407:
;3408:void CG_ForcePushBlur( vec3_t org )
;3409:{
line 3412
;3410:	localEntity_t	*ex;
;3411:
;3412:	ex = CG_AllocLocalEntity();
ADDRLP4 4
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 3413
;3413:	ex->leType = LE_PUFF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 5
ASGNI4
line 3414
;3414:	ex->refEntity.reType = RT_SPRITE;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3415
;3415:	ex->radius = 2.0f;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
CNSTF4 1073741824
ASGNF4
line 3416
;3416:	ex->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3417
;3417:	ex->endTime = ex->startTime + 120;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 120
ADDI4
ASGNI4
line 3418
;3418:	VectorCopy( org, ex->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3419
;3419:	ex->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3420
;3420:	ex->pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 2
ASGNI4
line 3421
;3421:	VectorScale( cg.refdef.viewaxis[1], 55, ex->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12+8
INDIRF4
MULF4
ASGNF4
line 3423
;3422:		
;3423:	ex->color[0] = 24;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1103101952
ASGNF4
line 3424
;3424:	ex->color[1] = 32;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 1107296256
ASGNF4
line 3425
;3425:	ex->color[2] = 40;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1109393408
ASGNF4
line 3426
;3426:	ex->refEntity.customShader = trap_R_RegisterShader( "gfx/effects/forcePush" );
ADDRGP4 $1530
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 3428
;3427:
;3428:	ex = CG_AllocLocalEntity();
ADDRLP4 16
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 3429
;3429:	ex->leType = LE_PUFF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 5
ASGNI4
line 3430
;3430:	ex->refEntity.reType = RT_SPRITE;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3431
;3431:	ex->refEntity.rotation = 180.0f;
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
CNSTF4 1127481344
ASGNF4
line 3432
;3432:	ex->radius = 2.0f;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
CNSTF4 1073741824
ASGNF4
line 3433
;3433:	ex->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3434
;3434:	ex->endTime = ex->startTime + 120;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 120
ADDI4
ASGNI4
line 3435
;3435:	VectorCopy( org, ex->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3436
;3436:	ex->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3437
;3437:	ex->pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 2
ASGNI4
line 3438
;3438:	VectorScale( cg.refdef.viewaxis[1], -55, ex->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12+8
INDIRF4
MULF4
ASGNF4
line 3440
;3439:		
;3440:	ex->color[0] = 24;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1103101952
ASGNF4
line 3441
;3441:	ex->color[1] = 32;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 1107296256
ASGNF4
line 3442
;3442:	ex->color[2] = 40;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1109393408
ASGNF4
line 3443
;3443:	ex->refEntity.customShader = trap_R_RegisterShader( "gfx/effects/forcePush" );
ADDRGP4 $1530
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 3444
;3444:}
LABELV $1516
endproc CG_ForcePushBlur 28 4
export CG_ForceGripEffect
proc CG_ForceGripEffect 32 4
line 3447
;3445:
;3446:void CG_ForceGripEffect( vec3_t org )
;3447:{
line 3449
;3448:	localEntity_t	*ex;
;3449:	float wv = sin( cg.time * 0.004f ) * 0.08f + 0.1f;
CNSTF4 998445679
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 8
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1034147594
ADDRLP4 8
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 3451
;3450:
;3451:	ex = CG_AllocLocalEntity();
ADDRLP4 12
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 3452
;3452:	ex->leType = LE_PUFF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 5
ASGNI4
line 3453
;3453:	ex->refEntity.reType = RT_SPRITE;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3454
;3454:	ex->radius = 2.0f;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
CNSTF4 1073741824
ASGNF4
line 3455
;3455:	ex->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3456
;3456:	ex->endTime = ex->startTime + 120;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 120
ADDI4
ASGNI4
line 3457
;3457:	VectorCopy( org, ex->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3458
;3458:	ex->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3459
;3459:	ex->pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 2
ASGNI4
line 3460
;3460:	VectorScale( cg.refdef.viewaxis[1], 55, ex->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 1113325568
ADDRGP4 cg+3616+36+12+8
INDIRF4
MULF4
ASGNF4
line 3462
;3461:		
;3462:	ex->color[0] = 200+((wv*255));
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1132396544
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1128792064
ADDF4
ASGNF4
line 3463
;3463:	if (ex->color[0] > 255)
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
CNSTF4 1132396544
LEF4 $1559
line 3464
;3464:	{
line 3465
;3465:		ex->color[0] = 255;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1132396544
ASGNF4
line 3466
;3466:	}
LABELV $1559
line 3467
;3467:	ex->color[1] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 0
ASGNF4
line 3468
;3468:	ex->color[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 0
ASGNF4
line 3469
;3469:	ex->refEntity.customShader = trap_R_RegisterShader( "gfx/effects/forcePush" );
ADDRGP4 $1530
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 3471
;3470:
;3471:	ex = CG_AllocLocalEntity();
ADDRLP4 24
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 3472
;3472:	ex->leType = LE_PUFF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 5
ASGNI4
line 3473
;3473:	ex->refEntity.reType = RT_SPRITE;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3474
;3474:	ex->refEntity.rotation = 180.0f;
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
CNSTF4 1127481344
ASGNF4
line 3475
;3475:	ex->radius = 2.0f;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
CNSTF4 1073741824
ASGNF4
line 3476
;3476:	ex->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3477
;3477:	ex->endTime = ex->startTime + 120;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 120
ADDI4
ASGNI4
line 3478
;3478:	VectorCopy( org, ex->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3479
;3479:	ex->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3480
;3480:	ex->pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 2
ASGNI4
line 3481
;3481:	VectorScale( cg.refdef.viewaxis[1], -55, ex->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 3260809216
ADDRGP4 cg+3616+36+12+8
INDIRF4
MULF4
ASGNF4
line 3490
;3482:
;3483:	/*
;3484:	ex->color[0] = 200+((wv*255));
;3485:	if (ex->color[0] > 255)
;3486:	{
;3487:		ex->color[0] = 255;
;3488:	}
;3489:	*/
;3490:	ex->color[0] = 255;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1132396544
ASGNF4
line 3491
;3491:	ex->color[1] = 255;
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 1132396544
ASGNF4
line 3492
;3492:	ex->color[2] = 255;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1132396544
ASGNF4
line 3493
;3493:	ex->refEntity.customShader = cgs.media.redSaberGlowShader;//trap_R_RegisterShader( "gfx/effects/forcePush" );
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 3494
;3494:}
LABELV $1544
endproc CG_ForceGripEffect 32 4
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 8 20
line 3505
;3495:
;3496:
;3497:/*
;3498:===============
;3499:CG_AddRefEntityWithPowerups
;3500:
;3501:Adds a piece with modifications or duplications for powerups
;3502:Also called by CG_Missile for quad rockets, but nobody can tell...
;3503:===============
;3504:*/
;3505:void CG_AddRefEntityWithPowerups( refEntity_t *ent, entityState_t *state, int team ) {
line 3507
;3506:
;3507:	if (CG_IsMindTricked(state->trickedentindex,
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
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
ADDRLP4 4
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1577
line 3512
;3508:		state->trickedentindex2,
;3509:		state->trickedentindex3,
;3510:		state->trickedentindex4,
;3511:		cg.snap->ps.clientNum))
;3512:	{
line 3513
;3513:		return; //this entity is mind-tricking the current client, so don't render it
ADDRGP4 $1576
JUMPV
LABELV $1577
line 3516
;3514:	}
;3515:
;3516:	trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3518
;3517:
;3518:	if ( state->powerups & ( 1 << PW_QUAD ) )
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1580
line 3519
;3519:	{
line 3520
;3520:		if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1582
line 3521
;3521:			ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 cgs+70296+452
INDIRI4
ASGNI4
ADDRGP4 $1583
JUMPV
LABELV $1582
line 3523
;3522:		else
;3523:			ent->customShader = cgs.media.quadShader;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 cgs+70296+448
INDIRI4
ASGNI4
LABELV $1583
line 3524
;3524:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3525
;3525:	}
LABELV $1580
line 3526
;3526:	if ( state->powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1588
line 3527
;3527:		ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 cgs+70296+468
INDIRI4
ASGNI4
line 3528
;3528:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3529
;3529:	}
LABELV $1588
line 3530
;3530:}
LABELV $1576
endproc CG_AddRefEntityWithPowerups 8 20
export CG_PlayerShieldHit
proc CG_PlayerShieldHit 24 8
line 3537
;3531:
;3532:#define MAX_SHIELD_TIME	2000.0
;3533:#define MIN_SHIELD_TIME	2000.0
;3534:
;3535:
;3536:void CG_PlayerShieldHit(int entitynum, vec3_t dir, int amount)
;3537:{
line 3541
;3538:	centity_t *cent;
;3539:	int	time;
;3540:
;3541:	if (entitynum<0 || entitynum >= MAX_CLIENTS)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $1595
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $1593
LABELV $1595
line 3542
;3542:	{
line 3543
;3543:		return;
ADDRGP4 $1592
JUMPV
LABELV $1593
line 3546
;3544:	}
;3545:
;3546:	cent = &cg_entities[entitynum];
ADDRLP4 0
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 3548
;3547:
;3548:	if (amount > 100)
ADDRFP4 8
INDIRI4
CNSTI4 100
LEI4 $1596
line 3549
;3549:	{
line 3550
;3550:		time = cg.time + MAX_SHIELD_TIME;		// 2 sec.
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
CNSTF4 1157234688
ADDF4
CVFI4 4
ASGNI4
line 3551
;3551:	}
ADDRGP4 $1597
JUMPV
LABELV $1596
line 3553
;3552:	else
;3553:	{
line 3554
;3554:		time = cg.time + 500 + amount*15;
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
CNSTI4 500
ADDI4
CNSTI4 15
ADDRFP4 8
INDIRI4
MULI4
ADDI4
ASGNI4
line 3555
;3555:	}
LABELV $1597
line 3557
;3556:
;3557:	if (time > cent->damageTime)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
LEI4 $1600
line 3558
;3558:	{
line 3559
;3559:		cent->damageTime = time;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 3560
;3560:		VectorScale(dir, -1, dir);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 3212836864
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 3212836864
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTF4 3212836864
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 3561
;3561:		vectoangles(dir, cent->damageAngles);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3562
;3562:	}
LABELV $1600
line 3563
;3563:}
LABELV $1592
endproc CG_PlayerShieldHit 24 8
export CG_DrawPlayerShield
proc CG_DrawPlayerShield 224 12
line 3567
;3564:
;3565:
;3566:void CG_DrawPlayerShield(centity_t *cent, vec3_t origin)
;3567:{
line 3573
;3568:	refEntity_t ent;
;3569:	int			alpha;
;3570:	float		scale;
;3571:	
;3572:	// Don't draw the shield when the player is dead.
;3573:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1603
line 3574
;3574:	{
line 3575
;3575:		return;
ADDRGP4 $1602
JUMPV
LABELV $1603
line 3578
;3576:	}
;3577:
;3578:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3580
;3579:
;3580:	VectorCopy( origin, ent.origin );
ADDRLP4 0+52
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 3581
;3581:	ent.origin[2] += 10.0;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 3582
;3582:	AnglesToAxis( cent->damageAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3584
;3583:
;3584:	alpha = 255.0 * ((cent->damageTime - cg.time) / MIN_SHIELD_TIME) + random()*16;
ADDRLP4 220
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 216
CNSTF4 1132396544
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1157234688
DIVF4
MULF4
CNSTF4 1098907648
ADDRLP4 220
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3585
;3585:	if (alpha>255)
ADDRLP4 216
INDIRI4
CNSTI4 255
LEI4 $1610
line 3586
;3586:		alpha=255;
ADDRLP4 216
CNSTI4 255
ASGNI4
LABELV $1610
line 3589
;3587:
;3588:	// Make it bigger, but tighter if more solid
;3589:	scale = 1.4 - ((float)alpha*(0.4/255.0));		// Range from 1.0 to 1.4
ADDRLP4 212
CNSTF4 1068708659
CNSTF4 986552935
ADDRLP4 216
INDIRI4
CVIF4 4
MULF4
SUBF4
ASGNF4
line 3590
;3590:	VectorScale( ent.axis[0], scale, ent.axis[0] );
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
line 3591
;3591:	VectorScale( ent.axis[1], scale, ent.axis[1] );
ADDRLP4 0+12+12
ADDRLP4 0+12+12
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+4
ADDRLP4 0+12+12+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+8
ADDRLP4 0+12+12+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
line 3592
;3592:	VectorScale( ent.axis[2], scale, ent.axis[2] );
ADDRLP4 0+12+24
ADDRLP4 0+12+24
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+24+4
ADDRLP4 0+12+24+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+24+8
ADDRLP4 0+12+24+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
line 3594
;3593:
;3594:	ent.hModel = cgs.media.halfShieldModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+900
INDIRI4
ASGNI4
line 3595
;3595:	ent.customShader = cgs.media.halfShieldShader;
ADDRLP4 0+76
ADDRGP4 cgs+70296+904
INDIRI4
ASGNI4
line 3596
;3596:	ent.shaderRGBA[0] = alpha;
ADDRLP4 0+80
ADDRLP4 216
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3597
;3597:	ent.shaderRGBA[1] = alpha;
ADDRLP4 0+80+1
ADDRLP4 216
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3598
;3598:	ent.shaderRGBA[2] = alpha;
ADDRLP4 0+80+2
ADDRLP4 216
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3599
;3599:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+80+3
CNSTU1 255
ASGNU1
line 3600
;3600:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3601
;3601:}
LABELV $1602
endproc CG_DrawPlayerShield 224 12
export CG_PlayerHitFX
proc CG_PlayerHitFX 4 8
line 3605
;3602:
;3603:
;3604:void CG_PlayerHitFX(centity_t *cent)
;3605:{
line 3609
;3606:	centity_t *curent;
;3607:
;3608:	// only do the below fx if the cent in question is...uh...me, and it's first person.
;3609:	if (cent->currentState.clientNum != cg.predictedPlayerState.clientNum || cg.renderingThirdPerson)
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ADDRGP4 cg+96+144
INDIRI4
NEI4 $1673
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1668
LABELV $1673
line 3610
;3610:	{
line 3612
;3611:		// Get the NON-PREDICTED player entity, because the predicted one doesn't have the damage info on it.
;3612:		curent = &cg_entities[cent->currentState.number];
ADDRLP4 0
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 3614
;3613:
;3614:		if (curent->damageTime > cg.time)
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $1667
line 3615
;3615:		{
line 3616
;3616:			CG_DrawPlayerShield(curent, cent->lerpOrigin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 CG_DrawPlayerShield
CALLV
pop
line 3617
;3617:		}
line 3619
;3618:
;3619:		return;
LABELV $1668
line 3621
;3620:	}
;3621:}
LABELV $1667
endproc CG_PlayerHitFX 4 8
export CG_LightVerts
proc CG_LightVerts 88 16
line 3631
;3622:
;3623:
;3624:
;3625:/*
;3626:=================
;3627:CG_LightVerts
;3628:=================
;3629:*/
;3630:int CG_LightVerts( vec3_t normal, int numVerts, polyVert_t *verts )
;3631:{
line 3638
;3632:	int				i, j;
;3633:	float			incoming;
;3634:	vec3_t			ambientLight;
;3635:	vec3_t			lightDir;
;3636:	vec3_t			directedLight;
;3637:
;3638:	trap_R_LightForPoint( verts[0].xyz, ambientLight, directedLight, lightDir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 3640
;3639:
;3640:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1681
JUMPV
LABELV $1678
line 3641
;3641:		incoming = DotProduct (normal, lightDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3642
;3642:		if ( incoming <= 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1684
line 3643
;3643:			verts[i].modulate[0] = ambientLight[0];
ADDRLP4 56
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $1687
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1688
JUMPV
LABELV $1687
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1688
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 3644
;3644:			verts[i].modulate[1] = ambientLight[1];
ADDRLP4 68
ADDRLP4 12+4
INDIRF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $1691
ADDRLP4 64
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1692
JUMPV
LABELV $1691
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1692
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 3645
;3645:			verts[i].modulate[2] = ambientLight[2];
ADDRLP4 80
ADDRLP4 12+8
INDIRF4
ASGNF4
ADDRLP4 84
CNSTF4 1325400064
ASGNF4
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
LTF4 $1695
ADDRLP4 76
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1696
JUMPV
LABELV $1695
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1696
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 76
INDIRU4
CVUU1 4
ASGNU1
line 3646
;3646:			verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 3647
;3647:			continue;
ADDRGP4 $1679
JUMPV
LABELV $1684
line 3649
;3648:		} 
;3649:		j = ( ambientLight[0] + incoming * directedLight[0] );
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3650
;3650:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1697
line 3651
;3651:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 3652
;3652:		}
LABELV $1697
line 3653
;3653:		verts[i].modulate[0] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3655
;3654:
;3655:		j = ( ambientLight[1] + incoming * directedLight[1] );
ADDRLP4 0
ADDRLP4 12+4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3656
;3656:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1701
line 3657
;3657:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 3658
;3658:		}
LABELV $1701
line 3659
;3659:		verts[i].modulate[1] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3661
;3660:
;3661:		j = ( ambientLight[2] + incoming * directedLight[2] );
ADDRLP4 0
ADDRLP4 12+8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3662
;3662:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1705
line 3663
;3663:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 3664
;3664:		}
LABELV $1705
line 3665
;3665:		verts[i].modulate[2] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3667
;3666:
;3667:		verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 3668
;3668:	}
LABELV $1679
line 3640
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1681
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1678
line 3669
;3669:	return qtrue;
CNSTI4 1
RETI4
LABELV $1677
endproc CG_LightVerts 88 16
lit
align 4
LABELV $1708
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export CG_DoSaber
code
proc CG_DoSaber 313 20
line 3673
;3670:}
;3671:
;3672:void CG_DoSaber( vec3_t origin, vec3_t dir, float length, saber_colors_t color, int rfx )
;3673:{
line 3674
;3674:	vec3_t		mid, rgb={1,1,1};
ADDRLP4 212
ADDRGP4 $1708
INDIRB
ASGNB 12
line 3675
;3675:	qhandle_t	blade = 0, glow = 0;
ADDRLP4 240
CNSTI4 0
ASGNI4
ADDRLP4 244
CNSTI4 0
ASGNI4
line 3679
;3676:	refEntity_t saber;
;3677:	float radiusmult;
;3678:
;3679:	if ( length < 0.5f )
ADDRFP4 8
INDIRF4
CNSTF4 1056964608
GEF4 $1709
line 3680
;3680:	{
line 3682
;3681:		// if the thing is so short, just forget even adding me.
;3682:		return;
ADDRGP4 $1707
JUMPV
LABELV $1709
line 3686
;3683:	}
;3684:
;3685:	// Find the midpoint of the saber for lighting purposes
;3686:	VectorMA( origin, length * 0.5f, dir, mid );
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 256
CNSTF4 1056964608
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 224
ADDRLP4 248
INDIRP4
INDIRF4
ADDRLP4 252
INDIRP4
INDIRF4
ADDRLP4 256
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 260
CNSTI4 4
ASGNI4
ADDRLP4 224+4
ADDRLP4 248
INDIRP4
ADDRLP4 260
INDIRI4
ADDP4
INDIRF4
ADDRLP4 252
INDIRP4
ADDRLP4 260
INDIRI4
ADDP4
INDIRF4
ADDRLP4 256
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 264
CNSTI4 8
ASGNI4
ADDRLP4 224+8
ADDRFP4 0
INDIRP4
ADDRLP4 264
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 264
INDIRI4
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRFP4 8
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 3688
;3687:
;3688:	switch( color )
ADDRLP4 268
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
LTI4 $1713
ADDRLP4 268
INDIRI4
CNSTI4 5
GTI4 $1713
ADDRLP4 268
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1764
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1764
address $1716
address $1723
address $1730
address $1737
address $1744
address $1751
code
line 3689
;3689:	{
LABELV $1716
line 3691
;3690:		case SABER_RED:
;3691:			glow = cgs.media.redSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 3692
;3692:			blade = cgs.media.redSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+120
INDIRI4
ASGNI4
line 3693
;3693:			VectorSet( rgb, 1.0f, 0.2f, 0.2f );
ADDRLP4 212
CNSTF4 1065353216
ASGNF4
ADDRLP4 212+4
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+8
CNSTF4 1045220557
ASGNF4
line 3694
;3694:			break;
ADDRGP4 $1714
JUMPV
LABELV $1723
line 3696
;3695:		case SABER_ORANGE:
;3696:			glow = cgs.media.orangeSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+124
INDIRI4
ASGNI4
line 3697
;3697:			blade = cgs.media.orangeSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+128
INDIRI4
ASGNI4
line 3698
;3698:			VectorSet( rgb, 1.0f, 0.5f, 0.1f );
ADDRLP4 212
CNSTF4 1065353216
ASGNF4
ADDRLP4 212+4
CNSTF4 1056964608
ASGNF4
ADDRLP4 212+8
CNSTF4 1036831949
ASGNF4
line 3699
;3699:			break;
ADDRGP4 $1714
JUMPV
LABELV $1730
line 3701
;3700:		case SABER_YELLOW:
;3701:			glow = cgs.media.yellowSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+132
INDIRI4
ASGNI4
line 3702
;3702:			blade = cgs.media.yellowSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+136
INDIRI4
ASGNI4
line 3703
;3703:			VectorSet( rgb, 1.0f, 1.0f, 0.2f );
ADDRLP4 276
CNSTF4 1065353216
ASGNF4
ADDRLP4 212
ADDRLP4 276
INDIRF4
ASGNF4
ADDRLP4 212+4
ADDRLP4 276
INDIRF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1045220557
ASGNF4
line 3704
;3704:			break;
ADDRGP4 $1714
JUMPV
LABELV $1737
line 3706
;3705:		case SABER_GREEN:
;3706:			glow = cgs.media.greenSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 3707
;3707:			blade = cgs.media.greenSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+144
INDIRI4
ASGNI4
line 3708
;3708:			VectorSet( rgb, 0.2f, 1.0f, 0.2f );
ADDRLP4 212
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 212+8
CNSTF4 1045220557
ASGNF4
line 3709
;3709:			break;
ADDRGP4 $1714
JUMPV
LABELV $1744
line 3711
;3710:		case SABER_BLUE:
;3711:			glow = cgs.media.blueSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 3712
;3712:			blade = cgs.media.blueSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+152
INDIRI4
ASGNI4
line 3713
;3713:			VectorSet( rgb, 0.2f, 0.4f, 1.0f );
ADDRLP4 212
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+4
CNSTF4 1053609165
ASGNF4
ADDRLP4 212+8
CNSTF4 1065353216
ASGNF4
line 3714
;3714:			break;
ADDRGP4 $1714
JUMPV
LABELV $1751
line 3716
;3715:		case SABER_PURPLE:
;3716:			glow = cgs.media.purpleSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+156
INDIRI4
ASGNI4
line 3717
;3717:			blade = cgs.media.purpleSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+160
INDIRI4
ASGNI4
line 3718
;3718:			VectorSet( rgb, 0.9f, 0.2f, 1.0f );
ADDRLP4 212
CNSTF4 1063675494
ASGNF4
ADDRLP4 212+4
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+8
CNSTF4 1065353216
ASGNF4
line 3719
;3719:			break;
ADDRGP4 $1714
JUMPV
LABELV $1713
line 3721
;3720:		default:
;3721:			glow = cgs.media.blueSaberGlowShader;
ADDRLP4 244
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 3722
;3722:			blade = cgs.media.blueSaberCoreShader;
ADDRLP4 240
ADDRGP4 cgs+70296+152
INDIRI4
ASGNI4
line 3723
;3723:			VectorSet( rgb, 0.2f, 0.4f, 1.0f );
ADDRLP4 212
CNSTF4 1045220557
ASGNF4
ADDRLP4 212+4
CNSTF4 1053609165
ASGNF4
ADDRLP4 212+8
CNSTF4 1065353216
ASGNF4
line 3724
;3724:			break;
LABELV $1714
line 3728
;3725:	}
;3726:
;3727:	// always add a light because sabers cast a nice glow before they slice you in half!!  or something...
;3728:	trap_R_AddLightToScene( mid, (length*2.0f) + (random()*8.0f), rgb[0], rgb[1], rgb[2] );
ADDRLP4 276
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 224
ARGP4
CNSTF4 1073741824
ADDRFP4 8
INDIRF4
MULF4
CNSTF4 1090519040
ADDRLP4 276
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ARGF4
ADDRLP4 212
INDIRF4
ARGF4
ADDRLP4 212+4
INDIRF4
ARGF4
ADDRLP4 212+8
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 3730
;3729:
;3730:	memset( &saber, 0, sizeof( refEntity_t ));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3734
;3731:
;3732:	// Saber glow is it's own ref type because it uses a ton of sprites, otherwise it would eat up too many
;3733:	//	refEnts to do each glow blob individually
;3734:	saber.saberLength = length;
ADDRLP4 0+180
ADDRFP4 8
INDIRF4
ASGNF4
line 3738
;3735:
;3736:	// Jeff, I did this because I foolishly wished to have a bright halo as the saber is unleashed.  
;3737:	// It's not quite what I'd hoped tho.  If you have any ideas, go for it!  --Pat
;3738:	if (length < SABER_LENGTH_MAX)
ADDRFP4 8
INDIRF4
CNSTF4 1109393408
GEF4 $1768
line 3739
;3739:	{
line 3740
;3740:		radiusmult = 1.0 + (2.0 / length);		// Note this creates a curve, and length cannot be < 0.5.
ADDRLP4 236
CNSTF4 1073741824
ADDRFP4 8
INDIRF4
DIVF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3741
;3741:	}
ADDRGP4 $1769
JUMPV
LABELV $1768
line 3743
;3742:	else
;3743:	{
line 3744
;3744:		radiusmult = 1.0;
ADDRLP4 236
CNSTF4 1065353216
ASGNF4
line 3745
;3745:	}
LABELV $1769
line 3748
;3746:
;3747:
;3748:	saber.radius = (2.8 + crandom() * 0.2f)*radiusmult;
ADDRLP4 280
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+92
CNSTF4 1045220557
CNSTF4 1073741824
ADDRLP4 280
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1077097267
ADDF4
ADDRLP4 236
INDIRF4
MULF4
ASGNF4
line 3751
;3749:
;3750:
;3751:	VectorCopy( origin, saber.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 3752
;3752:	VectorCopy( dir, saber.axis[0] );
ADDRLP4 0+12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 3753
;3753:	saber.reType = RT_SABER_GLOW;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 3754
;3754:	saber.customShader = glow;
ADDRLP4 0+76
ADDRLP4 244
INDIRI4
ASGNI4
line 3755
;3755:	saber.shaderRGBA[0] = saber.shaderRGBA[1] = saber.shaderRGBA[2] = saber.shaderRGBA[3] = 0xff;
ADDRLP4 284
CNSTU1 255
ASGNU1
ADDRLP4 0+80+3
ADDRLP4 284
INDIRU1
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 284
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 284
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 284
INDIRU1
ASGNU1
line 3756
;3756:	saber.renderfx = rfx;
ADDRLP4 0+4
ADDRFP4 16
INDIRI4
ASGNI4
line 3758
;3757:
;3758:	trap_R_AddRefEntityToScene( &saber );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3761
;3759:
;3760:	// Do the hot core
;3761:	VectorMA( origin, length, dir, saber.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 288
CNSTI4 4
ASGNI4
ADDRLP4 0+52+4
ADDRFP4 0
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 292
CNSTI4 8
ASGNI4
ADDRLP4 0+52+8
ADDRFP4 0
INDIRP4
ADDRLP4 292
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 292
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3762
;3762:	VectorMA( origin, -1, dir, saber.oldorigin );
ADDRLP4 0+64
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 296
CNSTI4 4
ASGNI4
ADDRLP4 0+64+4
ADDRFP4 0
INDIRP4
ADDRLP4 296
INDIRI4
ADDP4
INDIRF4
CNSTF4 3212836864
ADDRFP4 4
INDIRP4
ADDRLP4 296
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 300
CNSTI4 8
ASGNI4
ADDRLP4 0+64+8
ADDRFP4 0
INDIRP4
ADDRLP4 300
INDIRI4
ADDP4
INDIRF4
CNSTF4 3212836864
ADDRFP4 4
INDIRP4
ADDRLP4 300
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3766
;3763:
;3764:
;3765://	CG_TestLine(saber.origin, saber.oldorigin, 50, 0x000000ff, 3);
;3766:	saber.customShader = blade;
ADDRLP4 0+76
ADDRLP4 240
INDIRI4
ASGNI4
line 3767
;3767:	saber.reType = RT_LINE;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 3768
;3768:	saber.radius = (1.0 + crandom() * 0.2f)*radiusmult;
ADDRLP4 304
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+92
CNSTF4 1045220557
CNSTF4 1073741824
ADDRLP4 304
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDF4
ADDRLP4 236
INDIRF4
MULF4
ASGNF4
line 3770
;3769:
;3770:	saber.shaderTexCoord[0] = saber.shaderTexCoord[1] = 1.0f;
ADDRLP4 308
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+84+4
ADDRLP4 308
INDIRF4
ASGNF4
ADDRLP4 0+84
ADDRLP4 308
INDIRF4
ASGNF4
line 3771
;3771:	saber.shaderRGBA[0] = saber.shaderRGBA[1] = saber.shaderRGBA[2] = saber.shaderRGBA[3] = 0xff;
ADDRLP4 312
CNSTU1 255
ASGNU1
ADDRLP4 0+80+3
ADDRLP4 312
INDIRU1
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 312
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 312
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 312
INDIRU1
ASGNU1
line 3773
;3772:
;3773:	trap_R_AddRefEntityToScene( &saber );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 3774
;3774:}
LABELV $1707
endproc CG_DoSaber 313 20
export CG_GetTagWorldPosition
proc CG_GetTagWorldPosition 100 24
line 3782
;3775:
;3776://--------------------------------------------------------------
;3777:// CG_GetTagWorldPosition
;3778://
;3779:// Can pass in NULL for the axis
;3780://--------------------------------------------------------------
;3781:void CG_GetTagWorldPosition( refEntity_t *model, char *tag, vec3_t pos, vec3_t axis[3] )
;3782:{
line 3784
;3783:	orientation_t	orientation;
;3784:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3787
;3785:
;3786:	// Get the requested tag
;3787:	trap_R_LerpTag( &orientation, model->hModel, model->oldframe, model->frame,
ADDRLP4 4
ARGP4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 3790
;3788:		1.0f - model->backlerp, tag );
;3789:
;3790:	VectorCopy( model->origin, pos );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRB
ASGNB 12
line 3791
;3791:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1805
line 3792
;3792:	{
line 3793
;3793:		VectorMA( pos, orientation.origin[i], model->axis[i], pos );
ADDRLP4 56
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 12
ASGNI4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 72
ADDRFP4 8
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ASGNP4
ADDRLP4 76
CNSTI4 12
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 76
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
CNSTI4 8
ASGNI4
ADDRLP4 88
ADDRFP4 8
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ASGNP4
ADDRLP4 92
CNSTI4 12
ASGNI4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 92
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3794
;3794:	}
LABELV $1806
line 3791
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1805
line 3796
;3795:
;3796:	if ( axis )
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1809
line 3797
;3797:	{
line 3798
;3798:		MatrixMultiply( orientation.axis, model->axis, axis );
ADDRLP4 4+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 3799
;3799:	}
LABELV $1809
line 3800
;3800:}
LABELV $1804
endproc CG_GetTagWorldPosition 100 24
export CG_CreateSaberMarks
proc CG_CreateSaberMarks 6252 28
line 3807
;3801:
;3802:#define	MAX_MARK_FRAGMENTS	128
;3803:#define	MAX_MARK_POINTS		384
;3804:extern markPoly_t *CG_AllocMark();
;3805:
;3806:void CG_CreateSaberMarks( vec3_t start, vec3_t end, vec3_t normal )
;3807:{
line 3817
;3808://	byte			colors[4];
;3809:	int				i, j;
;3810:	int				numFragments;
;3811:	vec3_t			axis[3], originalPoints[4], mid;
;3812:	vec3_t			markPoints[MAX_MARK_POINTS], projection;
;3813:	polyVert_t		*v, verts[MAX_VERTS_ON_POLY];
;3814:	markPoly_t		*mark;
;3815:	markFragment_t	markFragments[MAX_MARK_FRAGMENTS], *mf;
;3816:
;3817:	float	radius = 0.65f;
ADDRLP4 4916
CNSTF4 1059481190
ASGNF4
line 3819
;3818:
;3819:	if ( !cg_addMarks.integer ) 
ADDRGP4 cg_addMarks+12
INDIRI4
CNSTI4 0
NEI4 $1813
line 3820
;3820:	{
line 3821
;3821:		return;
ADDRGP4 $1812
JUMPV
LABELV $1813
line 3824
;3822:	}
;3823:
;3824:	VectorSubtract( end, start, axis[1] );
ADDRLP4 256+12
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6008
CNSTI4 4
ASGNI4
ADDRLP4 256+12+4
ADDRFP4 4
INDIRP4
ADDRLP4 6008
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 6008
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6012
CNSTI4 8
ASGNI4
ADDRLP4 256+12+8
ADDRFP4 4
INDIRP4
ADDRLP4 6012
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 6012
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3825
;3825:	VectorNormalize( axis[1] );
ADDRLP4 256+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3828
;3826:
;3827:	// create the texture axis
;3828:	VectorCopy( normal, axis[0] );
ADDRLP4 256
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 3829
;3829:	CrossProduct( axis[1], axis[0], axis[2] );
ADDRLP4 256+12
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 256+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 3832
;3830:
;3831:	// create the full polygon that we'll project
;3832:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 300
CNSTI4 0
ASGNI4
LABELV $1824
line 3833
;3833:	{	// stretch a bit more in the direction that we are traveling in...  debateable as to whether this makes things better or worse
line 3834
;3834:		originalPoints[0][i] = start[i] - radius * axis[1][i] - radius * axis[2][i];
ADDRLP4 6016
ADDRLP4 300
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6016
INDIRI4
ADDRLP4 4920
ADDP4
ADDRLP4 6016
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6016
INDIRI4
ADDRLP4 256+12
ADDP4
INDIRF4
MULF4
SUBF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6016
INDIRI4
ADDRLP4 256+24
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 3835
;3835:		originalPoints[1][i] = end[i] + radius * axis[1][i] - radius * axis[2][i];
ADDRLP4 6024
ADDRLP4 300
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6024
INDIRI4
ADDRLP4 4920+12
ADDP4
ADDRLP4 6024
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6024
INDIRI4
ADDRLP4 256+12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6024
INDIRI4
ADDRLP4 256+24
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 3836
;3836:		originalPoints[2][i] = end[i] + radius * axis[1][i] + radius * axis[2][i];
ADDRLP4 6032
ADDRLP4 300
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6032
INDIRI4
ADDRLP4 4920+24
ADDP4
ADDRLP4 6032
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6032
INDIRI4
ADDRLP4 256+12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6032
INDIRI4
ADDRLP4 256+24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3837
;3837:		originalPoints[3][i] = start[i] - radius * axis[1][i] + radius * axis[2][i];
ADDRLP4 6040
ADDRLP4 300
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6040
INDIRI4
ADDRLP4 4920+36
ADDP4
ADDRLP4 6040
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6040
INDIRI4
ADDRLP4 256+12
ADDP4
INDIRF4
MULF4
SUBF4
ADDRLP4 4916
INDIRF4
ADDRLP4 6040
INDIRI4
ADDRLP4 256+24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3838
;3838:	}
LABELV $1825
line 3832
ADDRLP4 300
ADDRLP4 300
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 3
LTI4 $1824
line 3840
;3839:
;3840:	VectorScale( normal, -1, projection );
ADDRLP4 6016
CNSTF4 3212836864
ASGNF4
ADDRLP4 6020
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4972
ADDRLP4 6016
INDIRF4
ADDRLP4 6020
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4972+4
ADDRLP4 6016
INDIRF4
ADDRLP4 6020
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4972+8
CNSTF4 3212836864
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 3843
;3841:
;3842:	// get the fragments
;3843:	numFragments = trap_CM_MarkFragments( 4, (const float (*)[3])originalPoints,
CNSTI4 4
ARGI4
ADDRLP4 4920
ARGP4
ADDRLP4 4972
ARGP4
CNSTI4 384
ARGI4
ADDRLP4 304
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 4984
ARGP4
ADDRLP4 6024
ADDRGP4 trap_CM_MarkFragments
CALLI4
ASGNI4
ADDRLP4 4968
ADDRLP4 6024
INDIRI4
ASGNI4
line 3846
;3844:					projection, MAX_MARK_POINTS, markPoints[0], MAX_MARK_FRAGMENTS, markFragments );
;3845:
;3846:	for ( i = 0, mf = markFragments ; i < numFragments ; i++, mf++ ) 
ADDRLP4 300
CNSTI4 0
ASGNI4
ADDRLP4 296
ADDRLP4 4984
ASGNP4
ADDRGP4 $1844
JUMPV
LABELV $1841
line 3847
;3847:	{
line 3849
;3848:		// we have an upper limit on the complexity of polygons that we store persistantly
;3849:		if ( mf->numPoints > MAX_VERTS_ON_POLY ) 
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1845
line 3850
;3850:		{
line 3851
;3851:			mf->numPoints = MAX_VERTS_ON_POLY;
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 3852
;3852:		}
LABELV $1845
line 3854
;3853:
;3854:		for ( j = 0, v = verts ; j < mf->numPoints ; j++, v++ ) 
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 252
ADDRLP4 12
ASGNP4
ADDRGP4 $1850
JUMPV
LABELV $1847
line 3855
;3855:		{
line 3859
;3856:			vec3_t delta;
;3857:
;3858:			// Set up our texture coords, this may need some work 
;3859:			VectorCopy( markPoints[mf->firstPoint + j], v->xyz );
ADDRLP4 252
INDIRP4
CNSTI4 12
ADDRLP4 296
INDIRP4
INDIRI4
ADDRLP4 292
INDIRI4
ADDI4
MULI4
ADDRLP4 304
ADDP4
INDIRB
ASGNB 12
line 3860
;3860:			VectorAdd( end, start, mid );
ADDRLP4 6040
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 6044
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 6040
INDIRP4
INDIRF4
ADDRLP4 6044
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 6048
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 6040
INDIRP4
ADDRLP4 6048
INDIRI4
ADDP4
INDIRF4
ADDRLP4 6044
INDIRP4
ADDRLP4 6048
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 6052
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 6052
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 6052
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3861
;3861:			VectorScale( mid, 0.5f, mid );
ADDRLP4 6056
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 6056
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 6056
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 3862
;3862:			VectorSubtract( v->xyz, mid, delta );
ADDRLP4 6028
ADDRLP4 252
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6028+4
ADDRLP4 252
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6028+8
ADDRLP4 252
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 3864
;3863:
;3864:			v->st[0] = 0.5 + DotProduct( delta, axis[1] ) * (0.05f + random() * 0.03f); 
ADDRLP4 6064
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 252
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 6028
INDIRF4
ADDRLP4 256+12
INDIRF4
MULF4
ADDRLP4 6028+4
INDIRF4
ADDRLP4 256+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 6028+8
INDIRF4
ADDRLP4 256+12+8
INDIRF4
MULF4
ADDF4
CNSTF4 1022739087
ADDRLP4 6064
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1028443341
ADDF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3865
;3865:			v->st[1] = 0.5 + DotProduct( delta, axis[2] ) * (0.15f + random() * 0.05f);	
ADDRLP4 6068
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 252
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 6028
INDIRF4
ADDRLP4 256+24
INDIRF4
MULF4
ADDRLP4 6028+4
INDIRF4
ADDRLP4 256+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 6028+8
INDIRF4
ADDRLP4 256+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 1028443341
ADDRLP4 6068
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1041865114
ADDF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3866
;3866:		}
LABELV $1848
line 3854
ADDRLP4 292
ADDRLP4 292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 252
ADDRLP4 252
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
LABELV $1850
ADDRLP4 292
INDIRI4
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $1847
line 3868
;3867:
;3868:		if (cg_saberDynamicMarks.integer)
ADDRGP4 cg_saberDynamicMarks+12
INDIRI4
CNSTI4 0
EQI4 $1875
line 3869
;3869:		{
line 3870
;3870:			int i = 0;
ADDRLP4 6032
CNSTI4 0
ASGNI4
line 3871
;3871:			int i_2 = 0;
ADDRLP4 6028
CNSTI4 0
ASGNI4
line 3875
;3872:			addpolyArgStruct_t apArgs;
;3873:			vec3_t x;
;3874:
;3875:			memset (&apArgs, 0, sizeof(apArgs));
ADDRLP4 6036
ARGP4
CNSTI4 0
ARGI4
CNSTI4 180
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $1879
JUMPV
line 3878
;3876:
;3877:			while (i < 4)
;3878:			{
LABELV $1881
line 3880
;3879:				while (i_2 < 3)
;3880:				{
line 3881
;3881:					apArgs.p[i][i_2] = verts[i].xyz[i_2];
ADDRLP4 6228
ADDRLP4 6028
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6228
INDIRI4
CNSTI4 12
ADDRLP4 6032
INDIRI4
MULI4
ADDRLP4 6036
ADDP4
ADDP4
ADDRLP4 6228
INDIRI4
CNSTI4 24
ADDRLP4 6032
INDIRI4
MULI4
ADDRLP4 12
ADDP4
ADDP4
INDIRF4
ASGNF4
line 3883
;3882:
;3883:					i_2++;
ADDRLP4 6028
ADDRLP4 6028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3884
;3884:				}
LABELV $1882
line 3879
ADDRLP4 6028
INDIRI4
CNSTI4 3
LTI4 $1881
line 3886
;3885:
;3886:				i_2 = 0;
ADDRLP4 6028
CNSTI4 0
ASGNI4
line 3887
;3887:				i++;
ADDRLP4 6032
ADDRLP4 6032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3888
;3888:			}
LABELV $1879
line 3877
ADDRLP4 6032
INDIRI4
CNSTI4 4
LTI4 $1882
line 3890
;3889:
;3890:			i = 0;
ADDRLP4 6032
CNSTI4 0
ASGNI4
line 3891
;3891:			i_2 = 0;
ADDRLP4 6028
CNSTI4 0
ASGNI4
ADDRGP4 $1885
JUMPV
line 3894
;3892:
;3893:			while (i < 4)
;3894:			{
LABELV $1887
line 3896
;3895:				while (i_2 < 2)
;3896:				{
line 3897
;3897:					apArgs.ev[i][i_2] = verts[i].st[i_2];
ADDRLP4 6228
ADDRLP4 6028
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 6228
INDIRI4
ADDRLP4 6032
INDIRI4
CNSTI4 3
LSHI4
ADDRLP4 6036+48
ADDP4
ADDP4
ADDRLP4 6228
INDIRI4
CNSTI4 24
ADDRLP4 6032
INDIRI4
MULI4
ADDRLP4 12+12
ADDP4
ADDP4
INDIRF4
ASGNF4
line 3899
;3898:
;3899:					i_2++;
ADDRLP4 6028
ADDRLP4 6028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3900
;3900:				}
LABELV $1888
line 3895
ADDRLP4 6028
INDIRI4
CNSTI4 2
LTI4 $1887
line 3902
;3901:
;3902:				i_2 = 0;
ADDRLP4 6028
CNSTI4 0
ASGNI4
line 3903
;3903:				i++;
ADDRLP4 6032
ADDRLP4 6032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3904
;3904:			}
LABELV $1885
line 3893
ADDRLP4 6032
INDIRI4
CNSTI4 4
LTI4 $1888
line 3909
;3905:
;3906:			//When using addpoly, having a situation like this tends to cause bad results.
;3907:			//(I assume it doesn't like trying to draw a polygon over two planes and extends
;3908:			//the vertex out to some odd value)
;3909:			VectorSubtract(apArgs.p[0], apArgs.p[3], x);
ADDRLP4 6216
ADDRLP4 6036
INDIRF4
ADDRLP4 6036+36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6216+4
ADDRLP4 6036+4
INDIRF4
ADDRLP4 6036+36+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 6216+8
ADDRLP4 6036+8
INDIRF4
ADDRLP4 6036+36+8
INDIRF4
SUBF4
ASGNF4
line 3910
;3910:			if (VectorLength(x) > 3.0f)
ADDRLP4 6216
ARGP4
ADDRLP4 6228
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 6228
INDIRF4
CNSTF4 1077936128
LEF4 $1901
line 3911
;3911:			{
line 3912
;3912:				return;
ADDRGP4 $1812
JUMPV
LABELV $1901
line 3915
;3913:			}
;3914:
;3915:			apArgs.numVerts = mf->numPoints;
ADDRLP4 6036+80
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3916
;3916:			VectorCopy(vec3_origin, apArgs.vel);
ADDRLP4 6036+84
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 3917
;3917:			VectorCopy(vec3_origin, apArgs.accel);
ADDRLP4 6036+96
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 3919
;3918:
;3919:			apArgs.alpha1 = 1.0f;
ADDRLP4 6036+108
CNSTF4 1065353216
ASGNF4
line 3920
;3920:			apArgs.alpha2 = 0.0f;
ADDRLP4 6036+112
CNSTF4 0
ASGNF4
line 3921
;3921:			apArgs.alphaParm = 255.0f;
ADDRLP4 6036+116
CNSTF4 1132396544
ASGNF4
line 3923
;3922:
;3923:			VectorSet(apArgs.rgb1, 0.0f, 0.0f, 0.0f);
ADDRLP4 6036+120
CNSTF4 0
ASGNF4
ADDRLP4 6036+120+4
CNSTF4 0
ASGNF4
ADDRLP4 6036+120+8
CNSTF4 0
ASGNF4
line 3924
;3924:			VectorSet(apArgs.rgb2, 0.0f, 0.0f, 0.0f);
ADDRLP4 6036+132
CNSTF4 0
ASGNF4
ADDRLP4 6036+132+4
CNSTF4 0
ASGNF4
ADDRLP4 6036+132+8
CNSTF4 0
ASGNF4
line 3926
;3925:
;3926:			apArgs.rgbParm = 0.0f;
ADDRLP4 6036+144
CNSTF4 0
ASGNF4
line 3928
;3927:
;3928:			apArgs.bounce = 0;
ADDRLP4 6036+160
CNSTF4 0
ASGNF4
line 3929
;3929:			apArgs.motionDelay = 0;
ADDRLP4 6036+164
CNSTI4 0
ASGNI4
line 3930
;3930:			apArgs.killTime = cg_saberDynamicMarkTime.integer;
ADDRLP4 6036+168
ADDRGP4 cg_saberDynamicMarkTime+12
INDIRI4
ASGNI4
line 3931
;3931:			apArgs.shader = cgs.media.rivetMarkShader;
ADDRLP4 6036+172
ADDRGP4 cgs+70296+172
INDIRI4
ASGNI4
line 3932
;3932:			apArgs.flags = 0x08000000|0x00000004;
ADDRLP4 6036+176
CNSTI4 134217732
ASGNI4
line 3934
;3933:
;3934:			trap_FX_AddPoly(&apArgs);
ADDRLP4 6036
ARGP4
ADDRGP4 trap_FX_AddPoly
CALLV
pop
line 3936
;3935:
;3936:			apArgs.shader = trap_R_RegisterShader("gfx/effects/saberDamageGlow");
ADDRGP4 $1929
ARGP4
ADDRLP4 6232
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 6036+172
ADDRLP4 6232
INDIRI4
ASGNI4
line 3937
;3937:			apArgs.rgb1[0] = 215 + random() * 40.0f;
ADDRLP4 6236
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 6036+120
CNSTF4 1109393408
ADDRLP4 6236
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1129775104
ADDF4
ASGNF4
line 3938
;3938:			apArgs.rgb1[1] = 96 + random() * 32.0f;
ADDRLP4 6240
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 6036+120+4
CNSTF4 1107296256
ADDRLP4 6240
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1119879168
ADDF4
ASGNF4
line 3939
;3939:			apArgs.rgb1[2] = apArgs.alphaParm = random()*15.0f;
ADDRLP4 6244
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 6248
CNSTF4 1097859072
ADDRLP4 6244
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
ADDRLP4 6036+116
ADDRLP4 6248
INDIRF4
ASGNF4
ADDRLP4 6036+120+8
ADDRLP4 6248
INDIRF4
ASGNF4
line 3941
;3940:
;3941:			apArgs.rgb1[0] /= 255;
ADDRLP4 6036+120
ADDRLP4 6036+120
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 3942
;3942:			apArgs.rgb1[1] /= 255;
ADDRLP4 6036+120+4
ADDRLP4 6036+120+4
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 3943
;3943:			apArgs.rgb1[2] /= 255;
ADDRLP4 6036+120+8
ADDRLP4 6036+120+8
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 3944
;3944:			VectorCopy(apArgs.rgb1, apArgs.rgb2);
ADDRLP4 6036+132
ADDRLP4 6036+120
INDIRB
ASGNB 12
line 3946
;3945:
;3946:			apArgs.killTime = 100;
ADDRLP4 6036+168
CNSTI4 100
ASGNI4
line 3948
;3947:
;3948:			trap_FX_AddPoly(&apArgs);
ADDRLP4 6036
ARGP4
ADDRGP4 trap_FX_AddPoly
CALLV
pop
line 3949
;3949:		}
ADDRGP4 $1876
JUMPV
LABELV $1875
line 3951
;3950:		else
;3951:		{
line 3953
;3952:			// save it persistantly, do burn first
;3953:			mark = CG_AllocMark();
ADDRLP4 6028
ADDRGP4 CG_AllocMark
CALLP4
ASGNP4
ADDRLP4 4912
ADDRLP4 6028
INDIRP4
ASGNP4
line 3954
;3954:			mark->time = cg.time;
ADDRLP4 4912
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3955
;3955:			mark->alphaFade = qtrue;
ADDRLP4 4912
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
line 3956
;3956:			mark->markShader = cgs.media.rivetMarkShader;
ADDRLP4 4912
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cgs+70296+172
INDIRI4
ASGNI4
line 3957
;3957:			mark->poly.numVerts = mf->numPoints;
ADDRLP4 4912
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3958
;3958:			mark->color[0] = mark->color[1] = mark->color[2] = mark->color[3] = 255;
ADDRLP4 6036
CNSTF4 1132396544
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 6036
INDIRF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 6036
INDIRF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 6036
INDIRF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 6036
INDIRF4
ASGNF4
line 3959
;3959:			memcpy( mark->verts, verts, mf->numPoints * sizeof( verts[0] ) );
ADDRLP4 4912
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 12
ARGP4
CNSTU4 24
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3963
;3960:
;3961:			// And now do a glow pass
;3962:			// by moving the start time back, we can hack it to fade out way before the burn does
;3963:			mark = CG_AllocMark();
ADDRLP4 6040
ADDRGP4 CG_AllocMark
CALLP4
ASGNP4
ADDRLP4 4912
ADDRLP4 6040
INDIRP4
ASGNP4
line 3964
;3964:			mark->time = cg.time - 8500;
ADDRLP4 4912
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 8500
SUBI4
ASGNI4
line 3965
;3965:			mark->alphaFade = qfalse;
ADDRLP4 4912
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 3966
;3966:			mark->markShader = trap_R_RegisterShader("gfx/effects/saberDamageGlow");
ADDRGP4 $1929
ARGP4
ADDRLP4 6044
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 4912
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 6044
INDIRI4
ASGNI4
line 3967
;3967:			mark->poly.numVerts = mf->numPoints;
ADDRLP4 4912
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3968
;3968:			mark->color[0] = 215 + random() * 40.0f;
ADDRLP4 6048
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4912
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1109393408
ADDRLP4 6048
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1129775104
ADDF4
ASGNF4
line 3969
;3969:			mark->color[1] = 96 + random() * 32.0f;
ADDRLP4 6052
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4912
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 1107296256
ADDRLP4 6052
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1119879168
ADDF4
ASGNF4
line 3970
;3970:			mark->color[2] = mark->color[3] = random()*15.0f;
ADDRLP4 6056
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 6064
CNSTF4 1097859072
ADDRLP4 6056
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 6064
INDIRF4
ASGNF4
ADDRLP4 4912
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 6064
INDIRF4
ASGNF4
line 3971
;3971:			memcpy( mark->verts, verts, mf->numPoints * sizeof( verts[0] ) );
ADDRLP4 4912
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 12
ARGP4
CNSTU4 24
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3972
;3972:		}
LABELV $1876
line 3973
;3973:	}
LABELV $1842
line 3846
ADDRLP4 300
ADDRLP4 300
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 296
ADDRLP4 296
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $1844
ADDRLP4 300
INDIRI4
ADDRLP4 4968
INDIRI4
LTI4 $1841
line 3974
;3974:}
LABELV $1812
endproc CG_CreateSaberMarks 6252 28
lit
align 4
LABELV $1951
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export CG_G2TraceCollide
code
proc CG_G2TraceCollide 1076 48
line 3978
;3975:
;3976:#ifdef G2_COLLISION_ENABLED
;3977:qboolean CG_G2TraceCollide(trace_t *tr, vec3_t lastValidStart, vec3_t lastValidEnd)
;3978:{
line 3979
;3979:	if (tr->entityNum < MAX_CLIENTS)
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 32
GEI4 $1949
line 3980
;3980:	{ //Hit a client with the normal trace, try the collision trace.
line 3983
;3981:		G2Trace_t		G2Trace;
;3982:		centity_t		*g2Hit;
;3983:		vec3_t			vIdentity = {1.0f, 1.0f, 1.0f};
ADDRLP4 1032
ADDRGP4 $1951
INDIRB
ASGNB 12
line 3985
;3984:		vec3_t			angles;
;3985:		int				tN = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3986
;3986:		float			fRadius = 0;
ADDRLP4 1044
CNSTF4 0
ASGNF4
line 3988
;3987:
;3988:		memset (&G2Trace, 0, sizeof(G2Trace));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $1953
JUMPV
LABELV $1952
line 3991
;3989:
;3990:		while (tN < MAX_G2_COLLISIONS)
;3991:		{
line 3992
;3992:			G2Trace[tN].mEntityNum = -1;
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 4+4
ADDP4
CNSTI4 -1
ASGNI4
line 3993
;3993:			tN++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3994
;3994:		}
LABELV $1953
line 3990
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1952
line 3995
;3995:		g2Hit = &cg_entities[tr->entityNum];
ADDRLP4 1028
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 3997
;3996:
;3997:		if (g2Hit && g2Hit->ghoul2)
ADDRLP4 1060
ADDRLP4 1028
INDIRP4
ASGNP4
ADDRLP4 1064
CNSTU4 0
ASGNU4
ADDRLP4 1060
INDIRP4
CVPU4 4
ADDRLP4 1064
INDIRU4
EQU4 $1956
ADDRLP4 1060
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1064
INDIRU4
EQU4 $1956
line 3998
;3998:		{
line 3999
;3999:			angles[ROLL] = angles[PITCH] = 0;
ADDRLP4 1068
CNSTF4 0
ASGNF4
ADDRLP4 1048
ADDRLP4 1068
INDIRF4
ASGNF4
ADDRLP4 1048+8
ADDRLP4 1068
INDIRF4
ASGNF4
line 4000
;4000:			angles[YAW] = g2Hit->lerpAngles[YAW];
ADDRLP4 1048+4
ADDRLP4 1028
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ASGNF4
line 4002
;4001:
;4002:			trap_G2API_CollisionDetect ( G2Trace, g2Hit->ghoul2, angles, g2Hit->lerpOrigin, cg.time, g2Hit->currentState.number, lastValidStart, lastValidEnd, vIdentity, 0, 2, fRadius );
ADDRLP4 4
ARGP4
ADDRLP4 1072
ADDRLP4 1028
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1072
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1072
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRGP4 trap_G2API_CollisionDetect
CALLV
pop
line 4004
;4003:
;4004:			if (G2Trace[0].mEntityNum != g2Hit->currentState.number)
ADDRLP4 4+4
INDIRI4
ADDRLP4 1028
INDIRP4
INDIRI4
EQI4 $1961
line 4005
;4005:			{
line 4006
;4006:				tr->fraction = 1.0f;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 4007
;4007:				tr->entityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 1023
ASGNI4
line 4008
;4008:				tr->startsolid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 4009
;4009:				tr->allsolid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 4010
;4010:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1948
JUMPV
LABELV $1961
line 4013
;4011:			}
;4012:			else
;4013:			{ //Yay!
line 4014
;4014:				VectorCopy(G2Trace[0].mCollisionPosition, tr->endpos);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4+20
INDIRB
ASGNB 12
line 4015
;4015:				VectorCopy(G2Trace[0].mCollisionNormal, tr->plane.normal);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4+32
INDIRB
ASGNB 12
line 4016
;4016:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1948
JUMPV
LABELV $1956
line 4019
;4017:			}
;4018:		}
;4019:	}
LABELV $1949
line 4021
;4020:
;4021:	return qfalse;
CNSTI4 0
RETI4
LABELV $1948
endproc CG_G2TraceCollide 1076 48
export CG_G2SaberEffects
proc CG_G2SaberEffects 1120 28
line 4025
;4022:}
;4023:
;4024:void CG_G2SaberEffects(vec3_t start, vec3_t end, centity_t *owner)
;4025:{
line 4029
;4026:	trace_t trace;
;4027:	vec3_t startTr;
;4028:	vec3_t endTr;
;4029:	qboolean backWards = qfalse;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 4030
;4030:	qboolean doneWithTraces = qfalse;
ADDRLP4 1108
CNSTI4 0
ASGNI4
ADDRGP4 $1968
JUMPV
LABELV $1967
line 4033
;4031:
;4032:	while (!doneWithTraces)
;4033:	{
line 4034
;4034:		if (!backWards)
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1970
line 4035
;4035:		{
line 4036
;4036:			VectorCopy(start, startTr);
ADDRLP4 1084
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 4037
;4037:			VectorCopy(end, endTr);
ADDRLP4 1096
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4038
;4038:		}
ADDRGP4 $1971
JUMPV
LABELV $1970
line 4040
;4039:		else
;4040:		{
line 4041
;4041:			VectorCopy(end, startTr);
ADDRLP4 1084
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4042
;4042:			VectorCopy(start, endTr);
ADDRLP4 1096
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 4043
;4043:		}
LABELV $1971
line 4045
;4044:
;4045:		CG_Trace( &trace, startTr, NULL, NULL, endTr, owner->currentState.number, MASK_PLAYERSOLID );
ADDRLP4 0
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
ADDRLP4 1096
ARGP4
ADDRFP4 8
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 4047
;4046:
;4047:		if (trace.entityNum < MAX_CLIENTS)
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $1972
line 4048
;4048:		{ //hit a client..
line 4049
;4049:			CG_G2TraceCollide(&trace, startTr, endTr);
ADDRLP4 0
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1096
ARGP4
ADDRGP4 CG_G2TraceCollide
CALLI4
pop
line 4051
;4050:
;4051:			if (trace.entityNum != ENTITYNUM_NONE)
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $1975
line 4052
;4052:			{ //it succeeded with the ghoul2 trace
line 4053
;4053:				trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), trace.endpos, trace.plane.normal );
ADDRGP4 $1978
ARGP4
ADDRLP4 1116
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 4054
;4054:			}
LABELV $1975
line 4055
;4055:		}
LABELV $1972
line 4057
;4056:
;4057:		if (!backWards)
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1981
line 4058
;4058:		{
line 4059
;4059:			backWards = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 4060
;4060:		}
ADDRGP4 $1982
JUMPV
LABELV $1981
line 4062
;4061:		else
;4062:		{
line 4063
;4063:			doneWithTraces = qtrue;
ADDRLP4 1108
CNSTI4 1
ASGNI4
line 4064
;4064:		}
LABELV $1982
line 4065
;4065:	}
LABELV $1968
line 4032
ADDRLP4 1108
INDIRI4
CNSTI4 0
EQI4 $1967
line 4066
;4066:}
LABELV $1966
endproc CG_G2SaberEffects 1120 28
lit
align 4
LABELV $1984
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV $2168
byte 4 1132396544
byte 4 1132396544
byte 4 1132396544
export CG_AddSaberBlade
code
proc CG_AddSaberBlade 1672 36
line 4073
;4067:#endif
;4068:
;4069:#define SABER_TRAIL_TIME	40.0f
;4070:#define FX_USE_ALPHA		0x08000000
;4071:
;4072:void CG_AddSaberBlade( centity_t *cent, centity_t *scent, refEntity_t *saber, int renderfx, int modelIndex, vec3_t origin, vec3_t angles, qboolean fromSaber)
;4073:{
line 4075
;4074:	vec3_t	org_, end, v,
;4075:			axis_[3] = {0,0,0, 0,0,0, 0,0,0};	// shut the compiler up
ADDRLP4 1136
ADDRGP4 $1984
INDIRB
ASGNB 36
line 4077
;4076:	trace_t	trace;
;4077:	int i = 0;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 4086
;4078:	float saberLen, dualSaberLen;
;4079:	float diff;
;4080:	clientInfo_t *client;
;4081:	centity_t *saberEnt;
;4082:	saberTrail_t *saberTrail;
;4083:	mdxaBone_t	boltMatrix;
;4084:	vec3_t futureAngles;
;4085:	effectTrailArgStruct_t fx;
;4086:	int scolor = 0;
ADDRLP4 1560
CNSTI4 0
ASGNI4
line 4088
;4087:	vec3_t otherPos, otherDir, otherEnd;
;4088:	float dualLen = 0.7;
ADDRLP4 1556
CNSTF4 1060320051
ASGNF4
line 4090
;4089:
;4090:	saberEnt = &cg_entities[cent->currentState.saberEntityNum];
ADDRLP4 1576
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 4093
;4091:
;4092:	if (/*cg.snap->ps.clientNum == cent->currentState.number && */
;4093:		cgs.clientinfo[ cent->currentState.clientNum ].team != TEAM_SPECTATOR &&
CNSTI4 788
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1985
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1985
line 4095
;4094:		!(cg.snap->ps.pm_flags & PMF_FOLLOW))
;4095:	{
line 4096
;4096:		if (cent->saberLength < 1)
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
CNSTF4 1065353216
GEF4 $1990
line 4097
;4097:		{
line 4098
;4098:			cent->saberLength = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1065353216
ASGNF4
line 4099
;4099:			cent->saberExtendTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4100
;4100:		}
LABELV $1990
line 4102
;4101:
;4102:		if (cent->saberLength < SABER_LENGTH_MAX)
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $1993
line 4103
;4103:		{
line 4104
;4104:			cent->saberLength += (cg.time - cent->saberExtendTime)*0.05;
ADDRLP4 1632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1636
ADDRLP4 1632
INDIRP4
CNSTI4 1000
ADDP4
ASGNP4
ADDRLP4 1636
INDIRP4
ADDRLP4 1636
INDIRP4
INDIRF4
CNSTF4 1028443341
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1632
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4105
;4105:		}
LABELV $1993
line 4107
;4106:
;4107:		if (cent->saberLength > SABER_LENGTH_MAX)
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
CNSTF4 1109393408
LEF4 $1996
line 4108
;4108:		{
line 4109
;4109:			cent->saberLength = SABER_LENGTH_MAX;
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1109393408
ASGNF4
line 4110
;4110:		}
LABELV $1996
line 4112
;4111:
;4112:		cent->saberExtendTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4113
;4113:		saberLen = cent->saberLength;
ADDRLP4 1520
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRF4
ASGNF4
line 4114
;4114:	}
ADDRGP4 $1986
JUMPV
LABELV $1985
line 4116
;4115:	else
;4116:	{
line 4117
;4117:		saberLen = SABER_LENGTH_MAX;
ADDRLP4 1520
CNSTF4 1109393408
ASGNF4
line 4118
;4118:	}
LABELV $1986
line 4124
;4119:
;4120:/*
;4121:Ghoul2 Insert Start
;4122:*/
;4123:
;4124:	dualSaberLen = saberLen;
ADDRLP4 1552
ADDRLP4 1520
INDIRF4
ASGNF4
line 4126
;4125:
;4126:	if ((cent->currentState.eFlags & EF_DEAD) && !fromSaber)
ADDRLP4 1632
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1632
INDIRI4
EQI4 $1999
ADDRFP4 28
INDIRI4
ADDRLP4 1632
INDIRI4
NEI4 $1999
line 4127
;4127:	{ //trying to draw a saber on a corpse? That's bad.
line 4128
;4128:		return;
ADDRGP4 $1983
JUMPV
LABELV $1999
line 4131
;4129:	}
;4130:
;4131:	futureAngles[YAW] = angles[YAW];
ADDRLP4 1564+4
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 4132
;4132:	futureAngles[PITCH] = angles[PITCH];
ADDRLP4 1564
ADDRFP4 24
INDIRP4
INDIRF4
ASGNF4
line 4133
;4133:	futureAngles[ROLL] = angles[ROLL];
ADDRLP4 1564+8
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 4136
;4134:
;4135:	// figure out where the actual model muzzle is
;4136:	if (fromSaber)
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $2003
line 4137
;4137:	{
line 4138
;4138:		trap_G2API_GetBoltMatrix(scent->ghoul2, 0, 0, &boltMatrix, futureAngles, origin, cg.time, cgs.gameModels, scent->modelScale);
ADDRLP4 1636
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1636
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1640
CNSTI4 0
ASGNI4
ADDRLP4 1640
INDIRI4
ARGI4
ADDRLP4 1640
INDIRI4
ARGI4
ADDRLP4 1580
ARGP4
ADDRLP4 1564
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1636
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 4139
;4139:	}
ADDRGP4 $2004
JUMPV
LABELV $2003
line 4141
;4140:	else
;4141:	{
line 4142
;4142:		trap_G2API_GetBoltMatrix(scent->ghoul2, 1, 0, &boltMatrix, futureAngles, origin, cg.time, cgs.gameModels, scent->modelScale);
ADDRLP4 1636
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1636
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1580
ARGP4
ADDRLP4 1564
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1636
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 4143
;4143:	}
LABELV $2004
line 4145
;4144:	// work the matrix axis stuff into the original axis and origins used.
;4145:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, org_);
ADDRLP4 1580
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1088
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 4146
;4146:	trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, NEGATIVE_Y, axis_[0]);
ADDRLP4 1580
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1136
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 4148
;4147:
;4148:	if (!fromSaber && saberEnt)
ADDRFP4 28
INDIRI4
CNSTI4 0
NEI4 $2009
ADDRLP4 1576
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2009
line 4149
;4149:	{
line 4150
;4150:		VectorCopy(org_, saberEnt->currentState.pos.trBase);
ADDRLP4 1576
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1088
INDIRB
ASGNB 12
line 4152
;4151:
;4152:		VectorCopy(axis_[0], saberEnt->currentState.apos.trBase);
ADDRLP4 1576
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1136
INDIRB
ASGNB 12
line 4153
;4153:	}
LABELV $2009
line 4155
;4154:
;4155:	client = &cgs.clientinfo[cent->currentState.number];
ADDRLP4 1084
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 4157
;4156:
;4157:	if (!client)
ADDRLP4 1084
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2012
line 4158
;4158:	{ //something horrible has apparently happened
line 4159
;4159:		return;
ADDRGP4 $1983
JUMPV
LABELV $2012
line 4162
;4160:	}
;4161:
;4162:	if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2014
line 4163
;4163:	{
line 4164
;4164:		VectorMA( org_, saberLen*dualLen, axis_[0], end );
ADDRLP4 1636
ADDRLP4 1520
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
ASGNF4
ADDRLP4 1112
ADDRLP4 1088
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+4
ADDRLP4 1088+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+8
ADDRLP4 1088+8
INDIRF4
ADDRLP4 1136+8
INDIRF4
ADDRLP4 1520
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 4165
;4165:	}
ADDRGP4 $2015
JUMPV
LABELV $2014
line 4167
;4166:	else
;4167:	{
line 4168
;4168:		VectorMA( org_, saberLen, axis_[0], end );
ADDRLP4 1112
ADDRLP4 1088
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1520
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+4
ADDRLP4 1088+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
ADDRLP4 1520
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+8
ADDRLP4 1088+8
INDIRF4
ADDRLP4 1136+8
INDIRF4
ADDRLP4 1520
INDIRF4
MULF4
ADDF4
ASGNF4
line 4169
;4169:	}
LABELV $2015
line 4171
;4170:	
;4171:	VectorAdd( end, axis_[0], end );
ADDRLP4 1112
ADDRLP4 1112
INDIRF4
ADDRLP4 1136
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1112+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1112+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 1136+8
INDIRF4
ADDF4
ASGNF4
line 4173
;4172:
;4173:	if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2034
line 4174
;4174:	{
line 4175
;4175:		otherPos[0] = org_[0] - axis_[0][0]*12;
ADDRLP4 1124
ADDRLP4 1088
INDIRF4
CNSTF4 1094713344
ADDRLP4 1136
INDIRF4
MULF4
SUBF4
ASGNF4
line 4176
;4176:		otherPos[1] = org_[1] - axis_[0][1]*12;
ADDRLP4 1124+4
ADDRLP4 1088+4
INDIRF4
CNSTF4 1094713344
ADDRLP4 1136+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 4177
;4177:		otherPos[2] = org_[2] - axis_[0][2]*12;
ADDRLP4 1124+8
ADDRLP4 1088+8
INDIRF4
CNSTF4 1094713344
ADDRLP4 1136+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 4179
;4178:
;4179:		otherDir[0] = -axis_[0][0];
ADDRLP4 1540
ADDRLP4 1136
INDIRF4
NEGF4
ASGNF4
line 4180
;4180:		otherDir[1] = -axis_[0][1];
ADDRLP4 1540+4
ADDRLP4 1136+4
INDIRF4
NEGF4
ASGNF4
line 4181
;4181:		otherDir[2] = -axis_[0][2];
ADDRLP4 1540+8
ADDRLP4 1136+8
INDIRF4
NEGF4
ASGNF4
line 4183
;4182:
;4183:		VectorMA( otherPos, dualSaberLen*dualLen, otherDir, otherEnd );
ADDRLP4 1636
ADDRLP4 1552
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
ASGNF4
ADDRLP4 1524
ADDRLP4 1124
INDIRF4
ADDRLP4 1540
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1524+4
ADDRLP4 1124+4
INDIRF4
ADDRLP4 1540+4
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1524+8
ADDRLP4 1124+8
INDIRF4
ADDRLP4 1540+8
INDIRF4
ADDRLP4 1552
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 4184
;4184:		VectorAdd( otherEnd, otherDir, otherEnd );
ADDRLP4 1524
ADDRLP4 1524
INDIRF4
ADDRLP4 1540
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1524+4
ADDRLP4 1524+4
INDIRF4
ADDRLP4 1540+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1524+8
ADDRLP4 1524+8
INDIRF4
ADDRLP4 1540+8
INDIRF4
ADDF4
ASGNF4
line 4185
;4185:	}
LABELV $2034
line 4187
;4186:
;4187:	scolor = cgs.clientinfo[cent->currentState.number].icolor1;
ADDRLP4 1560
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+104
ADDP4
INDIRI4
ASGNI4
line 4189
;4188:
;4189:	if (cgs.gametype >= GT_TEAM && !cgs.jediVmerc )
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $2060
ADDRGP4 cgs+32996
INDIRI4
CNSTI4 0
NEI4 $2060
line 4190
;4190:	{
line 4191
;4191:		if (cgs.clientinfo[cent->currentState.number].team == TEAM_RED)
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2064
line 4192
;4192:		{
line 4193
;4193:			scolor = SABER_RED;
ADDRLP4 1560
CNSTI4 0
ASGNI4
line 4194
;4194:		}
ADDRGP4 $2065
JUMPV
LABELV $2064
line 4195
;4195:		else if (cgs.clientinfo[cent->currentState.number].team == TEAM_BLUE)
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2068
line 4196
;4196:		{
line 4197
;4197:			scolor = SABER_BLUE;
ADDRLP4 1560
CNSTI4 4
ASGNI4
line 4198
;4198:		}
LABELV $2068
LABELV $2065
line 4199
;4199:	}
LABELV $2060
line 4201
;4200:
;4201:	if (!cg_saberContact.integer)
ADDRGP4 cg_saberContact+12
INDIRI4
CNSTI4 0
NEI4 $2072
line 4202
;4202:	{ //if we don't have saber contact enabled, just add the blade and don't care what it's touching
line 4203
;4203:		goto CheckTrail;
ADDRGP4 $2075
JUMPV
LABELV $2072
line 4207
;4204:	}
;4205:
;4206:#ifdef G2_COLLISION_ENABLED
;4207:	if (cg_saberModelTraceEffect.integer)
ADDRGP4 cg_saberModelTraceEffect+12
INDIRI4
CNSTI4 0
EQI4 $2076
line 4208
;4208:	{
line 4209
;4209:		CG_G2SaberEffects(org_, end, cent);
ADDRLP4 1088
ARGP4
ADDRLP4 1112
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_G2SaberEffects
CALLV
pop
line 4210
;4210:	}
LABELV $2076
line 4213
;4211:#endif
;4212:
;4213:	for ( i = 0; i < 1; i++ )//was 2 because it would go through architecture and leave saber trails on either side of the brush - but still looks bad if we hit a corner, blade is still 8 longer than hit
ADDRLP4 1080
CNSTI4 0
ASGNI4
LABELV $2079
line 4214
;4214:	{
line 4215
;4215:		if ( i )
ADDRLP4 1080
INDIRI4
CNSTI4 0
EQI4 $2083
line 4216
;4216:		{//tracing from end to base
line 4217
;4217:			CG_Trace( &trace, end, NULL, NULL, org_, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 1112
ARGP4
ADDRLP4 1636
CNSTP4 0
ASGNP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1088
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 4218
;4218:		}
ADDRGP4 $2084
JUMPV
LABELV $2083
line 4220
;4219:		else
;4220:		{//tracing from base to end
line 4221
;4221:			CG_Trace( &trace, org_, NULL, NULL, end, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 1088
ARGP4
ADDRLP4 1636
CNSTP4 0
ASGNP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1112
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 4222
;4222:		}
LABELV $2084
line 4224
;4223:		
;4224:		if ( trace.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $2085
line 4225
;4225:		{
line 4227
;4226:			vec3_t trDir;
;4227:			VectorCopy(trace.plane.normal, trDir);
ADDRLP4 1636
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4228
;4228:			if (!trDir[0] && !trDir[1] && !trDir[2])
ADDRLP4 1648
CNSTF4 0
ASGNF4
ADDRLP4 1636
INDIRF4
ADDRLP4 1648
INDIRF4
NEF4 $2089
ADDRLP4 1636+4
INDIRF4
ADDRLP4 1648
INDIRF4
NEF4 $2089
ADDRLP4 1636+8
INDIRF4
ADDRLP4 1648
INDIRF4
NEF4 $2089
line 4229
;4229:			{
line 4230
;4230:				trDir[1] = 1;
ADDRLP4 1636+4
CNSTF4 1065353216
ASGNF4
line 4231
;4231:			}
LABELV $2089
line 4232
;4232:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/spark.efx"), trace.endpos, trDir );
ADDRGP4 $2094
ARGP4
ADDRLP4 1652
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1652
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 1636
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 4235
;4233:
;4234:			//Stop saber? (it wouldn't look right if it was stuck through a thin wall and unable to hurt players on the other side)
;4235:			VectorSubtract(org_, trace.endpos, v);
ADDRLP4 1100
ADDRLP4 1088
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1088+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1088+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 4236
;4236:			saberLen = VectorLength(v);
ADDRLP4 1100
ARGP4
ADDRLP4 1656
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1520
ADDRLP4 1656
INDIRF4
ASGNF4
line 4238
;4237:
;4238:			VectorCopy(trace.endpos, end);
ADDRLP4 1112
ADDRLP4 0+12
INDIRB
ASGNB 12
line 4240
;4239:
;4240:			if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2106
line 4241
;4241:			{
line 4242
;4242:				break;
ADDRGP4 $2081
JUMPV
LABELV $2106
line 4246
;4243:			}
;4244:			// All I need is a bool to mark whether I have a previous point to work with.
;4245:			//....come up with something better..
;4246:			if ( client->saberTrail.haveOldPos[i] )
ADDRLP4 1080
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1084
INDIRP4
CNSTI4 592
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2108
line 4247
;4247:			{
line 4248
;4248:				if ( trace.entityNum == ENTITYNUM_WORLD )
ADDRLP4 0+52
INDIRI4
CNSTI4 1022
NEI4 $2109
line 4249
;4249:				{//only put marks on architecture
line 4251
;4250:					// Let's do some cool burn/glowing mark bits!!!
;4251:					CG_CreateSaberMarks( client->saberTrail.oldPos[i], trace.endpos, trace.plane.normal );
CNSTI4 12
ADDRLP4 1080
INDIRI4
MULI4
ADDRLP4 1084
INDIRP4
CNSTI4 600
ADDP4
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRGP4 CG_CreateSaberMarks
CALLV
pop
line 4254
;4252:				
;4253:					//make a sound
;4254:					if ( cg.time - client->saberHitWallSoundDebounceTime >= 100 )
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1084
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
SUBI4
CNSTI4 100
LTI4 $2109
line 4255
;4255:					{//ugh, need to have a real sound debouncer... or do this game-side
line 4256
;4256:						client->saberHitWallSoundDebounceTime = cg.time;
ADDRLP4 1084
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4257
;4257:						trap_S_StartSound ( trace.endpos, -1, CHAN_WEAPON, trap_S_RegisterSound( va("sound/weapons/saber/saberhitwall%i", Q_irand(1, 3)) ) );
CNSTI4 1
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1660
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $2120
ARGP4
ADDRLP4 1660
INDIRI4
ARGI4
ADDRLP4 1664
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1664
INDIRP4
ARGP4
ADDRLP4 1668
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0+12
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1668
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 4258
;4258:					}
line 4259
;4259:				}
line 4260
;4260:			}
ADDRGP4 $2109
JUMPV
LABELV $2108
line 4262
;4261:			else
;4262:			{
line 4264
;4263:				// if we impact next frame, we'll mark a slash mark
;4264:				client->saberTrail.haveOldPos[i] = qtrue;
ADDRLP4 1080
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1084
INDIRP4
CNSTI4 592
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4267
;4265://				CG_ImpactMark( cgs.media.rivetMarkShader, client->saberTrail.oldPos[i], client->saberTrail.oldNormal[i],
;4266://						0.0f, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, 1.1f, qfalse );
;4267:			}
LABELV $2109
line 4270
;4268:
;4269:			// stash point so we can connect-the-dots later
;4270:			VectorCopy( trace.endpos, client->saberTrail.oldPos[i] );
CNSTI4 12
ADDRLP4 1080
INDIRI4
MULI4
ADDRLP4 1084
INDIRP4
CNSTI4 600
ADDP4
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 4271
;4271:			VectorCopy( trace.plane.normal, client->saberTrail.oldNormal[i] );
CNSTI4 12
ADDRLP4 1080
INDIRI4
MULI4
ADDRLP4 1084
INDIRP4
CNSTI4 624
ADDP4
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4272
;4272:		}
ADDRGP4 $2086
JUMPV
LABELV $2085
line 4274
;4273:		else
;4274:		{
line 4275
;4275:			if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2123
line 4276
;4276:			{
line 4277
;4277:				break;
ADDRGP4 $2081
JUMPV
LABELV $2123
line 4280
;4278:			}
;4279:
;4280:			if ( client->saberTrail.haveOldPos[i] )
ADDRLP4 1080
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1084
INDIRP4
CNSTI4 592
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2125
line 4281
;4281:			{
line 4287
;4282:				// Hmmm, no impact this frame, but we have an old point
;4283:				// Let's put the mark there, we should use an endcap mark to close the line, but we 
;4284:				//	can probably just get away with a round mark
;4285://					CG_ImpactMark( cgs.media.rivetMarkShader, client->saberTrail.oldPos[i], client->saberTrail.oldNormal[i],
;4286://							0.0f, 1.0f, 1.0f, 1.0f, 1.0f, qfalse, 1.1f, qfalse );
;4287:			}
LABELV $2125
line 4290
;4288:
;4289:			// we aren't impacting, so turn off our mark tracking mechanism
;4290:			client->saberTrail.haveOldPos[i] = qfalse;
ADDRLP4 1080
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1084
INDIRP4
CNSTI4 592
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4291
;4291:		}
LABELV $2086
line 4292
;4292:	}
LABELV $2080
line 4213
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 1
LTI4 $2079
LABELV $2081
line 4294
;4293:
;4294:	if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2127
line 4295
;4295:	{
line 4296
;4296:		for ( i = 0; i < 1; i++ )//was 2 because it would go through architecture and leave saber trails on either side of the brush - but still looks bad if we hit a corner, blade is still 8 longer than hit
ADDRLP4 1080
CNSTI4 0
ASGNI4
LABELV $2129
line 4297
;4297:		{
line 4298
;4298:			CG_Trace( &trace, otherPos, NULL, NULL, otherEnd, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 1124
ARGP4
ADDRLP4 1636
CNSTP4 0
ASGNP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1524
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 4300
;4299:		
;4300:			if ( trace.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $2133
line 4301
;4301:			{
line 4303
;4302:				vec3_t trDir;
;4303:				VectorCopy(trace.plane.normal, trDir);
ADDRLP4 1640
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4304
;4304:				if (!trDir[0] && !trDir[1] && !trDir[2])
ADDRLP4 1652
CNSTF4 0
ASGNF4
ADDRLP4 1640
INDIRF4
ADDRLP4 1652
INDIRF4
NEF4 $2137
ADDRLP4 1640+4
INDIRF4
ADDRLP4 1652
INDIRF4
NEF4 $2137
ADDRLP4 1640+8
INDIRF4
ADDRLP4 1652
INDIRF4
NEF4 $2137
line 4305
;4305:				{
line 4306
;4306:					trDir[1] = 1;
ADDRLP4 1640+4
CNSTF4 1065353216
ASGNF4
line 4307
;4307:				}
LABELV $2137
line 4309
;4308:
;4309:				trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/spark.efx"), trace.endpos, trDir );
ADDRGP4 $2094
ARGP4
ADDRLP4 1656
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1656
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 1640
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 4312
;4310:
;4311:				//Stop saber? (it wouldn't look right if it was stuck through a thin wall and unable to hurt players on the other side)
;4312:				VectorSubtract(otherPos, trace.endpos, v);
ADDRLP4 1100
ADDRLP4 1124
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1124+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1124+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 4313
;4313:				dualSaberLen = VectorLength(v);
ADDRLP4 1100
ARGP4
ADDRLP4 1660
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1552
ADDRLP4 1660
INDIRF4
ASGNF4
line 4315
;4314:
;4315:				VectorCopy(trace.endpos, end);
ADDRLP4 1112
ADDRLP4 0+12
INDIRB
ASGNB 12
line 4316
;4316:			}
LABELV $2133
line 4317
;4317:		}
LABELV $2130
line 4296
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 1
LTI4 $2129
line 4318
;4318:	}
LABELV $2127
LABELV $2075
line 4321
;4319:CheckTrail:
;4320:
;4321:	if (!cg_saberTrail.integer)
ADDRGP4 cg_saberTrail+12
INDIRI4
CNSTI4 0
NEI4 $2153
line 4322
;4322:	{ //don't do the trail in this case
line 4323
;4323:		goto JustDoIt;
ADDRGP4 $2156
JUMPV
LABELV $2153
line 4326
;4324:	}
;4325:
;4326:	saberTrail = &client->saberTrail;
ADDRLP4 1536
ADDRLP4 1084
INDIRP4
CNSTI4 532
ADDP4
ASGNP4
line 4330
;4327:
;4328:	// if we happen to be timescaled or running in a high framerate situation, we don't want to flood
;4329:	//	the system with very small trail slices...but perhaps doing it by distance would yield better results?
;4330:	if ( cg.time > saberTrail->lastTime + 2 ) // 2ms
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1536
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
ADDI4
LEI4 $2157
line 4331
;4331:	{
line 4332
;4332:		if ( (saberMoveData[cent->currentState.saberMove].trailLength > 0 || ((cent->currentState.powerups & (1 << PW_SPEED) && cg_speedTrail.integer)) || cent->currentState.saberInFlight) && cg.time < saberTrail->lastTime + 2000 ) // if we have a stale segment, don't draw until we have a fresh one
ADDRLP4 1636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1640
CNSTI4 0
ASGNI4
CNSTI4 40
ADDRLP4 1636
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+36
ADDP4
INDIRI4
ADDRLP4 1640
INDIRI4
GTI4 $2166
ADDRLP4 1636
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 1640
INDIRI4
EQI4 $2167
ADDRGP4 cg_speedTrail+12
INDIRI4
ADDRLP4 1640
INDIRI4
NEI4 $2166
LABELV $2167
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2160
LABELV $2166
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1536
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2000
ADDI4
GEI4 $2160
line 4333
;4333:		{
line 4334
;4334:			vec3_t	rgb1={255.0f,255.0f,255.0f};
ADDRLP4 1644
ADDRGP4 $2168
INDIRB
ASGNB 12
line 4336
;4335:
;4336:			switch( scolor )
ADDRLP4 1560
INDIRI4
CNSTI4 0
LTI4 $2169
ADDRLP4 1560
INDIRI4
CNSTI4 5
GTI4 $2169
ADDRLP4 1560
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2191
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2191
address $2171
address $2174
address $2177
address $2180
address $2183
address $2186
code
line 4337
;4337:			{
LABELV $2171
line 4339
;4338:				case SABER_RED:
;4339:					VectorSet( rgb1, 255.0f, 0.0f, 0.0f );
ADDRLP4 1644
CNSTF4 1132396544
ASGNF4
ADDRLP4 1644+4
CNSTF4 0
ASGNF4
ADDRLP4 1644+8
CNSTF4 0
ASGNF4
line 4340
;4340:					break;
ADDRGP4 $2170
JUMPV
LABELV $2174
line 4342
;4341:				case SABER_ORANGE:
;4342:					VectorSet( rgb1, 255.0f, 64.0f, 0.0f );
ADDRLP4 1644
CNSTF4 1132396544
ASGNF4
ADDRLP4 1644+4
CNSTF4 1115684864
ASGNF4
ADDRLP4 1644+8
CNSTF4 0
ASGNF4
line 4343
;4343:					break;
ADDRGP4 $2170
JUMPV
LABELV $2177
line 4345
;4344:				case SABER_YELLOW:
;4345:					VectorSet( rgb1, 255.0f, 255.0f, 0.0f );
ADDRLP4 1660
CNSTF4 1132396544
ASGNF4
ADDRLP4 1644
ADDRLP4 1660
INDIRF4
ASGNF4
ADDRLP4 1644+4
ADDRLP4 1660
INDIRF4
ASGNF4
ADDRLP4 1644+8
CNSTF4 0
ASGNF4
line 4346
;4346:					break;
ADDRGP4 $2170
JUMPV
LABELV $2180
line 4348
;4347:				case SABER_GREEN:
;4348:					VectorSet( rgb1, 0.0f, 255.0f, 0.0f );
ADDRLP4 1644
CNSTF4 0
ASGNF4
ADDRLP4 1644+4
CNSTF4 1132396544
ASGNF4
ADDRLP4 1644+8
CNSTF4 0
ASGNF4
line 4349
;4349:					break;
ADDRGP4 $2170
JUMPV
LABELV $2183
line 4351
;4350:				case SABER_BLUE:
;4351:					VectorSet( rgb1, 0.0f, 64.0f, 255.0f );
ADDRLP4 1644
CNSTF4 0
ASGNF4
ADDRLP4 1644+4
CNSTF4 1115684864
ASGNF4
ADDRLP4 1644+8
CNSTF4 1132396544
ASGNF4
line 4352
;4352:					break;
ADDRGP4 $2170
JUMPV
LABELV $2186
line 4354
;4353:				case SABER_PURPLE:
;4354:					VectorSet( rgb1, 220.0f, 0.0f, 255.0f );
ADDRLP4 1644
CNSTF4 1130102784
ASGNF4
ADDRLP4 1644+4
CNSTF4 0
ASGNF4
ADDRLP4 1644+8
CNSTF4 1132396544
ASGNF4
line 4355
;4355:					break;
ADDRGP4 $2170
JUMPV
LABELV $2169
line 4357
;4356:				default:
;4357:					VectorSet( rgb1, 0.0f, 64.0f, 255.0f );
ADDRLP4 1644
CNSTF4 0
ASGNF4
ADDRLP4 1644+4
CNSTF4 1115684864
ASGNF4
ADDRLP4 1644+8
CNSTF4 1132396544
ASGNF4
line 4358
;4358:					break;
LABELV $2170
line 4367
;4359:			}
;4360:
;4361:			//Here we will use the happy process of filling a struct in with arguments and passing it to a trap function
;4362:			//so that we can take the struct and fill in an actual CTrail type using the data within it once we get it
;4363:			//into the effects area
;4364:
;4365:			// Go from new muzzle to new end...then to old end...back down to old muzzle...finally
;4366:			//	connect back to the new muzzle...this is our trail quad
;4367:			VectorCopy( org_, fx.mVerts[0].origin );
ADDRLP4 1172
ADDRLP4 1088
INDIRB
ASGNB 12
line 4368
;4368:			VectorMA( end, 3.0f, axis_[0], fx.mVerts[1].origin );
ADDRLP4 1172+84
ADDRLP4 1112
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1172+84+4
ADDRLP4 1112+4
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1172+84+8
ADDRLP4 1112+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4370
;4369:
;4370:			VectorCopy( saberTrail->tip, fx.mVerts[2].origin );
ADDRLP4 1172+168
ADDRLP4 1536
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 4371
;4371:			VectorCopy( saberTrail->base, fx.mVerts[3].origin );
ADDRLP4 1172+252
ADDRLP4 1536
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 4373
;4372:
;4373:			diff = cg.time - saberTrail->lastTime;
ADDRLP4 1628
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1536
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4378
;4374:
;4375:			// I'm not sure that clipping this is really the best idea
;4376:			//This prevents the trail from showing at all in low framerate situations.
;4377:			//if ( diff <= SABER_TRAIL_TIME * 2 )
;4378:			{
line 4379
;4379:				float oldAlpha = 1.0f - ( diff / SABER_TRAIL_TIME );
ADDRLP4 1660
CNSTF4 1065353216
ADDRLP4 1628
INDIRF4
CNSTF4 1109393408
DIVF4
SUBF4
ASGNF4
line 4382
;4380:
;4381:				// New muzzle
;4382:				VectorCopy( rgb1, fx.mVerts[0].rgb );
ADDRLP4 1172+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4383
;4383:				fx.mVerts[0].alpha = 255.0f;
ADDRLP4 1172+48
CNSTF4 1132396544
ASGNF4
line 4385
;4384:
;4385:				fx.mVerts[0].ST[0] = 0.0f;
ADDRLP4 1172+60
CNSTF4 0
ASGNF4
line 4386
;4386:				fx.mVerts[0].ST[1] = 1.0f;
ADDRLP4 1172+60+4
CNSTF4 1065353216
ASGNF4
line 4387
;4387:				fx.mVerts[0].destST[0] = 1.0f;
ADDRLP4 1172+68
CNSTF4 1065353216
ASGNF4
line 4388
;4388:				fx.mVerts[0].destST[1] = 1.0f;
ADDRLP4 1172+68+4
CNSTF4 1065353216
ASGNF4
line 4391
;4389:
;4390:				// new tip
;4391:				VectorCopy( rgb1, fx.mVerts[1].rgb );
ADDRLP4 1172+84+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4392
;4392:				fx.mVerts[1].alpha = 255.0f;
ADDRLP4 1172+84+48
CNSTF4 1132396544
ASGNF4
line 4394
;4393:				
;4394:				fx.mVerts[1].ST[0] = 0.0f;
ADDRLP4 1172+84+60
CNSTF4 0
ASGNF4
line 4395
;4395:				fx.mVerts[1].ST[1] = 0.0f;
ADDRLP4 1172+84+60+4
CNSTF4 0
ASGNF4
line 4396
;4396:				fx.mVerts[1].destST[0] = 1.0f;
ADDRLP4 1172+84+68
CNSTF4 1065353216
ASGNF4
line 4397
;4397:				fx.mVerts[1].destST[1] = 0.0f;
ADDRLP4 1172+84+68+4
CNSTF4 0
ASGNF4
line 4400
;4398:
;4399:				// old tip
;4400:				VectorCopy( rgb1, fx.mVerts[2].rgb );
ADDRLP4 1172+168+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4401
;4401:				fx.mVerts[2].alpha = 255.0f;
ADDRLP4 1172+168+48
CNSTF4 1132396544
ASGNF4
line 4403
;4402:
;4403:				fx.mVerts[2].ST[0] = 1.0f - oldAlpha; // NOTE: this just happens to contain the value I want
ADDRLP4 1172+168+60
CNSTF4 1065353216
ADDRLP4 1660
INDIRF4
SUBF4
ASGNF4
line 4404
;4404:				fx.mVerts[2].ST[1] = 0.0f;
ADDRLP4 1172+168+60+4
CNSTF4 0
ASGNF4
line 4405
;4405:				fx.mVerts[2].destST[0] = 1.0f + fx.mVerts[2].ST[0];
ADDRLP4 1172+168+68
ADDRLP4 1172+168+60
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4406
;4406:				fx.mVerts[2].destST[1] = 0.0f;
ADDRLP4 1172+168+68+4
CNSTF4 0
ASGNF4
line 4409
;4407:
;4408:				// old muzzle
;4409:				VectorCopy( rgb1, fx.mVerts[3].rgb );
ADDRLP4 1172+252+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4410
;4410:				fx.mVerts[3].alpha = 255.0f;
ADDRLP4 1172+252+48
CNSTF4 1132396544
ASGNF4
line 4412
;4411:
;4412:				fx.mVerts[3].ST[0] = 1.0f - oldAlpha; // NOTE: this just happens to contain the value I want
ADDRLP4 1172+252+60
CNSTF4 1065353216
ADDRLP4 1660
INDIRF4
SUBF4
ASGNF4
line 4413
;4413:				fx.mVerts[3].ST[1] = 1.0f;
ADDRLP4 1172+252+60+4
CNSTF4 1065353216
ASGNF4
line 4414
;4414:				fx.mVerts[3].destST[0] = 1.0f + fx.mVerts[2].ST[0];
ADDRLP4 1172+252+68
ADDRLP4 1172+168+60
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4415
;4415:				fx.mVerts[3].destST[1] = 1.0f;
ADDRLP4 1172+252+68+4
CNSTF4 1065353216
ASGNF4
line 4417
;4416:		
;4417:				fx.mShader = cgs.media.saberBlurShader;
ADDRLP4 1172+336
ADDRGP4 cgs+70296+164
INDIRI4
ASGNI4
line 4418
;4418:				fx.mSetFlags = FX_USE_ALPHA;
ADDRLP4 1172+340
CNSTI4 134217728
ASGNI4
line 4419
;4419:				fx.mKillTime = SABER_TRAIL_TIME;
ADDRLP4 1172+344
CNSTI4 40
ASGNI4
line 4421
;4420:
;4421:				trap_FX_AddPrimitive(&fx);
ADDRLP4 1172
ARGP4
ADDRGP4 trap_FX_AddPrimitive
CALLV
pop
line 4422
;4422:			}
line 4424
;4423:
;4424:			if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2263
line 4425
;4425:			{
line 4426
;4426:				float oldAlpha = 1.0f - ( diff / SABER_TRAIL_TIME );
ADDRLP4 1660
CNSTF4 1065353216
ADDRLP4 1628
INDIRF4
CNSTF4 1109393408
DIVF4
SUBF4
ASGNF4
line 4428
;4427:
;4428:				VectorCopy( otherPos, fx.mVerts[0].origin );
ADDRLP4 1172
ADDRLP4 1124
INDIRB
ASGNB 12
line 4429
;4429:				VectorMA( otherEnd, 3.0f, otherDir, fx.mVerts[1].origin );
ADDRLP4 1172+84
ADDRLP4 1524
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1172+84+4
ADDRLP4 1524+4
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1172+84+8
ADDRLP4 1524+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4431
;4430:
;4431:				VectorCopy( saberTrail->dualtip, fx.mVerts[2].origin );
ADDRLP4 1172+168
ADDRLP4 1536
INDIRP4
CNSTI4 48
ADDP4
INDIRB
ASGNB 12
line 4432
;4432:				VectorCopy( saberTrail->dualbase, fx.mVerts[3].origin );
ADDRLP4 1172+252
ADDRLP4 1536
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 4435
;4433:
;4434:				// New muzzle
;4435:				VectorCopy( rgb1, fx.mVerts[0].rgb );
ADDRLP4 1172+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4436
;4436:				fx.mVerts[0].alpha = 255.0f;
ADDRLP4 1172+48
CNSTF4 1132396544
ASGNF4
line 4438
;4437:
;4438:				fx.mVerts[0].ST[0] = 0.0f;
ADDRLP4 1172+60
CNSTF4 0
ASGNF4
line 4439
;4439:				fx.mVerts[0].ST[1] = 1.0f;
ADDRLP4 1172+60+4
CNSTF4 1065353216
ASGNF4
line 4440
;4440:				fx.mVerts[0].destST[0] = 1.0f;
ADDRLP4 1172+68
CNSTF4 1065353216
ASGNF4
line 4441
;4441:				fx.mVerts[0].destST[1] = 1.0f;
ADDRLP4 1172+68+4
CNSTF4 1065353216
ASGNF4
line 4444
;4442:
;4443:				// new tip
;4444:				VectorCopy( rgb1, fx.mVerts[1].rgb );
ADDRLP4 1172+84+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4445
;4445:				fx.mVerts[1].alpha = 255.0f;
ADDRLP4 1172+84+48
CNSTF4 1132396544
ASGNF4
line 4447
;4446:				
;4447:				fx.mVerts[1].ST[0] = 0.0f;
ADDRLP4 1172+84+60
CNSTF4 0
ASGNF4
line 4448
;4448:				fx.mVerts[1].ST[1] = 0.0f;
ADDRLP4 1172+84+60+4
CNSTF4 0
ASGNF4
line 4449
;4449:				fx.mVerts[1].destST[0] = 1.0f;
ADDRLP4 1172+84+68
CNSTF4 1065353216
ASGNF4
line 4450
;4450:				fx.mVerts[1].destST[1] = 0.0f;
ADDRLP4 1172+84+68+4
CNSTF4 0
ASGNF4
line 4453
;4451:
;4452:				// old tip
;4453:				VectorCopy( rgb1, fx.mVerts[2].rgb );
ADDRLP4 1172+168+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4454
;4454:				fx.mVerts[2].alpha = 255.0f;
ADDRLP4 1172+168+48
CNSTF4 1132396544
ASGNF4
line 4456
;4455:
;4456:				fx.mVerts[2].ST[0] = 1.0f - oldAlpha; // NOTE: this just happens to contain the value I want
ADDRLP4 1172+168+60
CNSTF4 1065353216
ADDRLP4 1660
INDIRF4
SUBF4
ASGNF4
line 4457
;4457:				fx.mVerts[2].ST[1] = 0.0f;
ADDRLP4 1172+168+60+4
CNSTF4 0
ASGNF4
line 4458
;4458:				fx.mVerts[2].destST[0] = 1.0f + fx.mVerts[2].ST[0];
ADDRLP4 1172+168+68
ADDRLP4 1172+168+60
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4459
;4459:				fx.mVerts[2].destST[1] = 0.0f;
ADDRLP4 1172+168+68+4
CNSTF4 0
ASGNF4
line 4462
;4460:
;4461:				// old muzzle
;4462:				VectorCopy( rgb1, fx.mVerts[3].rgb );
ADDRLP4 1172+252+12
ADDRLP4 1644
INDIRB
ASGNB 12
line 4463
;4463:				fx.mVerts[3].alpha = 255.0f;
ADDRLP4 1172+252+48
CNSTF4 1132396544
ASGNF4
line 4465
;4464:
;4465:				fx.mVerts[3].ST[0] = 1.0f - oldAlpha; // NOTE: this just happens to contain the value I want
ADDRLP4 1172+252+60
CNSTF4 1065353216
ADDRLP4 1660
INDIRF4
SUBF4
ASGNF4
line 4466
;4466:				fx.mVerts[3].ST[1] = 1.0f;
ADDRLP4 1172+252+60+4
CNSTF4 1065353216
ASGNF4
line 4467
;4467:				fx.mVerts[3].destST[0] = 1.0f + fx.mVerts[2].ST[0];
ADDRLP4 1172+252+68
ADDRLP4 1172+168+60
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 4468
;4468:				fx.mVerts[3].destST[1] = 1.0f;
ADDRLP4 1172+252+68+4
CNSTF4 1065353216
ASGNF4
line 4470
;4469:		
;4470:				fx.mShader = cgs.media.saberBlurShader;
ADDRLP4 1172+336
ADDRGP4 cgs+70296+164
INDIRI4
ASGNI4
line 4471
;4471:				fx.mSetFlags = FX_USE_ALPHA;
ADDRLP4 1172+340
CNSTI4 134217728
ASGNI4
line 4472
;4472:				fx.mKillTime = SABER_TRAIL_TIME;
ADDRLP4 1172+344
CNSTI4 40
ASGNI4
line 4474
;4473:
;4474:				trap_FX_AddPrimitive(&fx);
ADDRLP4 1172
ARGP4
ADDRGP4 trap_FX_AddPrimitive
CALLV
pop
line 4475
;4475:			}
LABELV $2263
line 4476
;4476:		}
LABELV $2160
line 4479
;4477:
;4478:		// we must always do this, even if we aren't active..otherwise we won't know where to pick up from
;4479:		VectorCopy( org_, saberTrail->base );
ADDRLP4 1536
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1088
INDIRB
ASGNB 12
line 4480
;4480:		VectorMA( end, 3.0f, axis_[0], saberTrail->tip );
ADDRLP4 1536
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1112
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1536
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 1112+4
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1536
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1112+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 1136+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4481
;4481:		saberTrail->lastTime = cg.time;
ADDRLP4 1536
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4483
;4482:
;4483:		if (cent->currentState.bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2340
line 4484
;4484:		{
line 4485
;4485:			VectorCopy( otherPos, saberTrail->dualbase );
ADDRLP4 1536
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1124
INDIRB
ASGNB 12
line 4486
;4486:			VectorMA( otherEnd, 3.0f, otherDir, saberTrail->dualtip );
ADDRLP4 1536
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 1524
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1536
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1524+4
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1536
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 1524+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 1540+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4487
;4487:		}
LABELV $2340
line 4488
;4488:	}
LABELV $2157
LABELV $2156
line 4492
;4489:
;4490:JustDoIt:
;4491:
;4492:	if (client && cent->currentState.bolt2)
ADDRLP4 1084
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2346
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2346
line 4493
;4493:	{
line 4494
;4494:		float sideOneLen = saberLen*dualLen;
ADDRLP4 1636
ADDRLP4 1520
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
ASGNF4
line 4495
;4495:		float sideTwoLen = dualSaberLen*dualLen;
ADDRLP4 1640
ADDRLP4 1552
INDIRF4
ADDRLP4 1556
INDIRF4
MULF4
ASGNF4
line 4497
;4496:
;4497:		if (sideOneLen < 1)
ADDRLP4 1636
INDIRF4
CNSTF4 1065353216
GEF4 $2348
line 4498
;4498:		{
line 4499
;4499:			sideOneLen = 1;
ADDRLP4 1636
CNSTF4 1065353216
ASGNF4
line 4500
;4500:		}
LABELV $2348
line 4502
;4501:		
;4502:		CG_DoSaber( org_, axis_[0], sideOneLen, scolor, renderfx );
ADDRLP4 1088
ARGP4
ADDRLP4 1136
ARGP4
ADDRLP4 1636
INDIRF4
ARGF4
ADDRLP4 1560
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DoSaber
CALLV
pop
line 4504
;4503:
;4504:		CG_DoSaber( otherPos, otherDir, sideTwoLen, scolor, renderfx );
ADDRLP4 1124
ARGP4
ADDRLP4 1540
ARGP4
ADDRLP4 1640
INDIRF4
ARGF4
ADDRLP4 1560
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DoSaber
CALLV
pop
line 4505
;4505:	}
ADDRGP4 $2347
JUMPV
LABELV $2346
line 4507
;4506:	else
;4507:	{
line 4510
;4508:		// Pass in the renderfx flags attached to the saber weapon model...this is done so that saber glows
;4509:		//	will get rendered properly in a mirror...not sure if this is necessary??
;4510:		CG_DoSaber( org_, axis_[0], saberLen, scolor, renderfx );
ADDRLP4 1088
ARGP4
ADDRLP4 1136
ARGP4
ADDRLP4 1520
INDIRF4
ARGF4
ADDRLP4 1560
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DoSaber
CALLV
pop
line 4511
;4511:	}
LABELV $2347
line 4512
;4512:}
LABELV $1983
endproc CG_AddSaberBlade 1672 36
export CG_IsMindTricked
proc CG_IsMindTricked 8 0
line 4515
;4513:
;4514:int CG_IsMindTricked(int trickIndex1, int trickIndex2, int trickIndex3, int trickIndex4, int client)
;4515:{
line 4517
;4516:	int checkIn;
;4517:	int sub = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4519
;4518:
;4519:	if (cg_entities[client].currentState.forcePowersActive & (1 << FP_SEE))
CNSTI4 1920
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cg_entities+240
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $2351
line 4520
;4520:	{
line 4521
;4521:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2350
JUMPV
LABELV $2351
line 4524
;4522:	}
;4523:
;4524:	if (client > 47)
ADDRFP4 16
INDIRI4
CNSTI4 47
LEI4 $2354
line 4525
;4525:	{
line 4526
;4526:		checkIn = trickIndex4;
ADDRLP4 4
ADDRFP4 12
INDIRI4
ASGNI4
line 4527
;4527:		sub = 48;
ADDRLP4 0
CNSTI4 48
ASGNI4
line 4528
;4528:	}
ADDRGP4 $2355
JUMPV
LABELV $2354
line 4529
;4529:	else if (client > 31)
ADDRFP4 16
INDIRI4
CNSTI4 31
LEI4 $2356
line 4530
;4530:	{
line 4531
;4531:		checkIn = trickIndex3;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
line 4532
;4532:		sub = 32;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 4533
;4533:	}
ADDRGP4 $2357
JUMPV
LABELV $2356
line 4534
;4534:	else if (client > 15)
ADDRFP4 16
INDIRI4
CNSTI4 15
LEI4 $2358
line 4535
;4535:	{
line 4536
;4536:		checkIn = trickIndex2;
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
line 4537
;4537:		sub = 16;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 4538
;4538:	}
ADDRGP4 $2359
JUMPV
LABELV $2358
line 4540
;4539:	else
;4540:	{
line 4541
;4541:		checkIn = trickIndex1;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 4542
;4542:	}
LABELV $2359
LABELV $2357
LABELV $2355
line 4544
;4543:
;4544:	if (checkIn & (1 << (client-sub)))
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRFP4 16
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2360
line 4545
;4545:	{
line 4546
;4546:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2350
JUMPV
LABELV $2360
line 4549
;4547:	}
;4548:	
;4549:	return 0;
CNSTI4 0
RETI4
LABELV $2350
endproc CG_IsMindTricked 8 0
export CG_DrawPlayerSphere
proc CG_DrawPlayerSphere 216 12
line 4555
;4550:}
;4551:
;4552:#define SPEED_TRAIL_DISTANCE 6
;4553:
;4554:void CG_DrawPlayerSphere(centity_t *cent, vec3_t origin, float scale, int shader)
;4555:{
line 4559
;4556:	refEntity_t ent;
;4557:	
;4558:	// Don't draw the shield when the player is dead.
;4559:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2363
line 4560
;4560:	{
line 4561
;4561:		return;
ADDRGP4 $2362
JUMPV
LABELV $2363
line 4564
;4562:	}
;4563:
;4564:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4566
;4565:
;4566:	VectorCopy( origin, ent.origin );
ADDRLP4 0+52
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4567
;4567:	ent.origin[2] += 9.0;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 4569
;4568:
;4569:	VectorSubtract(cg.refdef.vieworg, ent.origin, ent.axis[0]);
ADDRLP4 0+12
ADDRGP4 cg+3616+24
INDIRF4
ADDRLP4 0+52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+4
ADDRGP4 cg+3616+24+4
INDIRF4
ADDRLP4 0+52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+8
ADDRGP4 cg+3616+24+8
INDIRF4
ADDRLP4 0+52+8
INDIRF4
SUBF4
ASGNF4
line 4570
;4570:	if (VectorNormalize(ent.axis[0]) <= 0.1f)
ADDRLP4 0+12
ARGP4
ADDRLP4 212
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 212
INDIRF4
CNSTF4 1036831949
GTF4 $2386
line 4571
;4571:	{	// Entity is right on vieworg.  quit.
line 4572
;4572:		return;
ADDRGP4 $2362
JUMPV
LABELV $2386
line 4575
;4573:	}
;4574:
;4575:	VectorCopy(cg.refdef.viewaxis[2], ent.axis[2]);
ADDRLP4 0+12+24
ADDRGP4 cg+3616+36+24
INDIRB
ASGNB 12
line 4576
;4576:	CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
ADDRLP4 0+12
ARGP4
ADDRLP4 0+12+24
ARGP4
ADDRLP4 0+12+12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4578
;4577:
;4578:	VectorScale(ent.axis[0], scale, ent.axis[0]);
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 4579
;4579:	VectorScale(ent.axis[1], scale, ent.axis[1]);
ADDRLP4 0+12+12
ADDRLP4 0+12+12
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+4
ADDRLP4 0+12+12+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+8
ADDRLP4 0+12+12+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 4580
;4580:	VectorScale(ent.axis[2], -scale, ent.axis[2]);
ADDRLP4 0+12+24
ADDRLP4 0+12+24
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 0+12+24+4
ADDRLP4 0+12+24+4
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 0+12+24+8
ADDRLP4 0+12+24+8
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
line 4582
;4581:
;4582:	ent.hModel = cgs.media.halfShieldModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+900
INDIRI4
ASGNI4
line 4583
;4583:	ent.customShader = shader;	
ADDRLP4 0+76
ADDRFP4 12
INDIRI4
ASGNI4
line 4585
;4584:
;4585:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 4586
;4586:}
LABELV $2362
endproc CG_DrawPlayerSphere 216 12
export CG_AddLightningBeam
proc CG_AddLightningBeam 276 4
line 4589
;4587:
;4588:void CG_AddLightningBeam(vec3_t start, vec3_t end)
;4589:{
line 4598
;4590:	vec3_t	dir, chaos,
;4591:			c1, c2,
;4592:			v1, v2;
;4593:	float	len,
;4594:			s1, s2, s3;
;4595:
;4596:	addbezierArgStruct_t b;
;4597:
;4598:	VectorCopy(start, b.start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 4599
;4599:	VectorCopy(end, b.end);
ADDRLP4 0+12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4601
;4600:
;4601:	VectorSubtract( b.end, b.start, dir );
ADDRLP4 152
ADDRLP4 0+12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 152+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 152+8
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 4602
;4602:	len = VectorNormalize( dir );
ADDRLP4 152
ARGP4
ADDRLP4 224
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 148
ADDRLP4 224
INDIRF4
ASGNF4
line 4605
;4603:
;4604:	// Get the base control points, we'll work from there
;4605:	VectorMA( b.start, 0.3333f * len, dir, c1 );
ADDRLP4 228
CNSTF4 1051371084
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 164
ADDRLP4 0
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 228
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 164+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 152+4
INDIRF4
ADDRLP4 228
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 164+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 1051371084
ADDRLP4 148
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 4606
;4606:	VectorMA( b.start, 0.6666f * len, dir, c2 );
ADDRLP4 232
CNSTF4 1059759692
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 176
ADDRLP4 0
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 232
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 152+4
INDIRF4
ADDRLP4 232
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 176+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 1059759692
ADDRLP4 148
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 4609
;4607:
;4608:	// get some chaos values that really aren't very chaotic :)
;4609:	s1 = sin( cg.time * 0.005f ) * 2 + crandom() * 0.2f;
CNSTF4 1000593162
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 236
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 240
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 188
CNSTF4 1073741824
ADDRLP4 236
INDIRF4
MULF4
CNSTF4 1045220557
CNSTF4 1073741824
ADDRLP4 240
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 4610
;4610:	s2 = sin( cg.time * 0.001f );
CNSTF4 981668463
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 244
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 192
ADDRLP4 244
INDIRF4
ASGNF4
line 4611
;4611:	s3 = sin( cg.time * 0.011f );
CNSTF4 1010055512
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 248
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 196
ADDRLP4 248
INDIRF4
ASGNF4
line 4613
;4612:
;4613:	VectorSet( chaos, len * 0.01f * s1,
ADDRLP4 136
CNSTF4 1008981770
ADDRLP4 148
INDIRF4
MULF4
ADDRLP4 188
INDIRF4
MULF4
ASGNF4
ADDRLP4 136+4
CNSTF4 1017370378
ADDRLP4 148
INDIRF4
MULF4
ADDRLP4 192
INDIRF4
MULF4
ASGNF4
ADDRLP4 136+8
CNSTF4 1025758986
ADDRLP4 148
INDIRF4
MULF4
ADDRLP4 188
INDIRF4
ADDRLP4 192
INDIRF4
ADDF4
ADDRLP4 196
INDIRF4
ADDF4
MULF4
ASGNF4
line 4617
;4614:						len * 0.02f * s2,
;4615:						len * 0.04f * (s1 + s2 + s3));
;4616:
;4617:	VectorAdd( c1, chaos, c1 );
ADDRLP4 164
ADDRLP4 164
INDIRF4
ADDRLP4 136
INDIRF4
ADDF4
ASGNF4
ADDRLP4 164+4
ADDRLP4 164+4
INDIRF4
ADDRLP4 136+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
ADDRLP4 136+8
INDIRF4
ADDF4
ASGNF4
line 4618
;4618:	VectorScale( chaos, 4.0f, v1 );
ADDRLP4 256
CNSTF4 1082130432
ASGNF4
ADDRLP4 200
ADDRLP4 256
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ASGNF4
ADDRLP4 200+4
ADDRLP4 256
INDIRF4
ADDRLP4 136+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 200+8
CNSTF4 1082130432
ADDRLP4 136+8
INDIRF4
MULF4
ASGNF4
line 4620
;4619:
;4620:	VectorSet( chaos, -len * 0.02f * s3,
ADDRLP4 136
CNSTF4 1017370378
ADDRLP4 148
INDIRF4
NEGF4
MULF4
ADDRLP4 196
INDIRF4
MULF4
ASGNF4
ADDRLP4 136+4
CNSTF4 1008981770
ADDRLP4 148
INDIRF4
MULF4
ADDRLP4 188
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 136+8
CNSTF4 1017370378
ADDRLP4 148
INDIRF4
NEGF4
MULF4
ADDRLP4 188
INDIRF4
ADDRLP4 192
INDIRF4
ADDRLP4 196
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 4624
;4621:						len * 0.01f * (s1 * s2),
;4622:						-len * 0.02f * (s1 + s2 * s3));
;4623:
;4624:	VectorAdd( c2, chaos, c2 );
ADDRLP4 176
ADDRLP4 176
INDIRF4
ADDRLP4 136
INDIRF4
ADDF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 176+4
INDIRF4
ADDRLP4 136+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 176+8
ADDRLP4 176+8
INDIRF4
ADDRLP4 136+8
INDIRF4
ADDF4
ASGNF4
line 4625
;4625:	VectorScale( chaos, 2.0f, v2 );
ADDRLP4 264
CNSTF4 1073741824
ASGNF4
ADDRLP4 212
ADDRLP4 264
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ASGNF4
ADDRLP4 212+4
ADDRLP4 264
INDIRF4
ADDRLP4 136+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1073741824
ADDRLP4 136+8
INDIRF4
MULF4
ASGNF4
line 4627
;4626:
;4627:	VectorSet( chaos, 1.0f, 1.0f, 1.0f );
ADDRLP4 268
CNSTF4 1065353216
ASGNF4
ADDRLP4 136
ADDRLP4 268
INDIRF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 268
INDIRF4
ASGNF4
ADDRLP4 136+8
CNSTF4 1065353216
ASGNF4
line 4629
;4628:
;4629:	VectorCopy(c1, b.control1);
ADDRLP4 0+24
ADDRLP4 164
INDIRB
ASGNB 12
line 4630
;4630:	VectorCopy(vec3_origin, b.control1Vel);
ADDRLP4 0+36
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 4631
;4631:	VectorCopy(c2, b.control2);
ADDRLP4 0+48
ADDRLP4 176
INDIRB
ASGNB 12
line 4632
;4632:	VectorCopy(vec3_origin, b.control2Vel);
ADDRLP4 0+60
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 4634
;4633:
;4634:	b.size1 = 6.0f;
ADDRLP4 0+72
CNSTF4 1086324736
ASGNF4
line 4635
;4635:	b.size2 = 6.0f;
ADDRLP4 0+76
CNSTF4 1086324736
ASGNF4
line 4636
;4636:	b.sizeParm = 0.0f;
ADDRLP4 0+80
CNSTF4 0
ASGNF4
line 4637
;4637:	b.alpha1 = 0.0f;
ADDRLP4 0+84
CNSTF4 0
ASGNF4
line 4638
;4638:	b.alpha2 = 0.2f;
ADDRLP4 0+88
CNSTF4 1045220557
ASGNF4
line 4639
;4639:	b.alphaParm = 0.5f;
ADDRLP4 0+92
CNSTF4 1056964608
ASGNF4
line 4646
;4640:	
;4641:	/*
;4642:	VectorCopy(WHITE, b.sRGB);
;4643:	VectorCopy(WHITE, b.eRGB);
;4644:	*/
;4645:
;4646:	b.sRGB[0] = 255;
ADDRLP4 0+96
CNSTF4 1132396544
ASGNF4
line 4647
;4647:	b.sRGB[1] = 255;
ADDRLP4 0+96+4
CNSTF4 1132396544
ASGNF4
line 4648
;4648:	b.sRGB[2] = 255;
ADDRLP4 0+96+8
CNSTF4 1132396544
ASGNF4
line 4649
;4649:	VectorCopy(b.sRGB, b.eRGB);
ADDRLP4 0+108
ADDRLP4 0+96
INDIRB
ASGNB 12
line 4651
;4650:
;4651:	b.rgbParm = 0.0f;
ADDRLP4 0+120
CNSTF4 0
ASGNF4
line 4652
;4652:	b.killTime = 50;
ADDRLP4 0+124
CNSTI4 50
ASGNI4
line 4653
;4653:	b.shader = trap_R_RegisterShader( "gfx/misc/electric2" );
ADDRGP4 $2517
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+128
ADDRLP4 272
INDIRI4
ASGNI4
line 4654
;4654:	b.flags = 0x00000001; //FX_ALPHA_LINEAR
ADDRLP4 0+132
CNSTI4 1
ASGNI4
line 4656
;4655:
;4656:	trap_FX_AddBezier(&b);
ADDRLP4 0
ARGP4
ADDRGP4 trap_FX_AddBezier
CALLV
pop
line 4657
;4657:}
LABELV $2445
endproc CG_AddLightningBeam 276 4
export CG_AddRandomLightning
proc CG_AddRandomLightning 44 8
line 4660
;4658:
;4659:void CG_AddRandomLightning(vec3_t start, vec3_t end)
;4660:{
line 4663
;4661:	vec3_t inOrg, outOrg;
;4662:
;4663:	VectorCopy(start, inOrg);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 4664
;4664:	VectorCopy(end, outOrg);
ADDRLP4 12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 4666
;4665:
;4666:	if ( rand() & 1 )
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2520
line 4667
;4667:	{
line 4668
;4668:		outOrg[0] += Q_irand(0, 24);
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4669
;4669:		inOrg[0] += Q_irand(0, 8);
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4670
;4670:	}
ADDRGP4 $2521
JUMPV
LABELV $2520
line 4672
;4671:	else
;4672:	{
line 4673
;4673:		outOrg[0] -= Q_irand(0, 24);
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4674
;4674:		inOrg[0] -= Q_irand(0, 8);
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4675
;4675:	}
LABELV $2521
line 4677
;4676:
;4677:	if ( rand() & 1 )
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2522
line 4678
;4678:	{
line 4679
;4679:		outOrg[1] += Q_irand(0, 24);
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4680
;4680:		inOrg[1] += Q_irand(0, 8);
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4681
;4681:	}
ADDRGP4 $2523
JUMPV
LABELV $2522
line 4683
;4682:	else
;4683:	{
line 4684
;4684:		outOrg[1] -= Q_irand(0, 24);
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4685
;4685:		inOrg[1] -= Q_irand(0, 8);
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4686
;4686:	}
LABELV $2523
line 4688
;4687:
;4688:	if ( rand() & 1 )
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2528
line 4689
;4689:	{
line 4690
;4690:		outOrg[2] += Q_irand(0, 50);
CNSTI4 0
ARGI4
CNSTI4 50
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4691
;4691:		inOrg[2] += Q_irand(0, 40);
CNSTI4 0
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 40
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 40
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4692
;4692:	}
ADDRGP4 $2529
JUMPV
LABELV $2528
line 4694
;4693:	else
;4694:	{
line 4695
;4695:		outOrg[2] -= Q_irand(0, 64);
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4696
;4696:		inOrg[2] -= Q_irand(0, 40);
CNSTI4 0
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 40
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 40
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 4697
;4697:	}
LABELV $2529
line 4699
;4698:
;4699:	CG_AddLightningBeam(inOrg, outOrg);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CG_AddLightningBeam
CALLV
pop
line 4700
;4700:}
LABELV $2519
endproc CG_AddRandomLightning 44 8
export CG_ThereIsAMaster
proc CG_ThereIsAMaster 12 0
line 4705
;4701:
;4702:extern char *forceHolocronModels[];
;4703:
;4704:qboolean CG_ThereIsAMaster(void)
;4705:{
line 4706
;4706:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2536
JUMPV
LABELV $2535
line 4710
;4707:	centity_t *cent;
;4708:
;4709:	while (i < MAX_CLIENTS)
;4710:	{
line 4711
;4711:		cent = &cg_entities[i];
ADDRLP4 4
CNSTI4 1920
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 4713
;4712:
;4713:		if (cent && cent->currentState.isJediMaster)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2538
ADDRLP4 4
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2538
line 4714
;4714:		{
line 4715
;4715:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2534
JUMPV
LABELV $2538
line 4718
;4716:		}
;4717:
;4718:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4719
;4719:	}
LABELV $2536
line 4709
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2535
line 4721
;4720:
;4721:	return qfalse;
CNSTI4 0
RETI4
LABELV $2534
endproc CG_ThereIsAMaster 12 0
export CG_FootStepGeneric
proc CG_FootStepGeneric 20 16
line 4726
;4722:}
;4723:
;4724://rww - here begins the majority of my g2animent stuff.
;4725:void CG_FootStepGeneric(centity_t *cent, int anim)
;4726:{
line 4729
;4727:	int groundType;
;4728:
;4729:	if ((anim & ~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT ||
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 915
EQI4 $2543
ADDRLP4 4
INDIRI4
CNSTI4 918
NEI4 $2541
LABELV $2543
line 4731
;4730:		(anim & ~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT)
;4731:	{
line 4732
;4732:		groundType = FOOTSTEP_GENERIC;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4733
;4733:		goto skipCheck;
ADDRGP4 $2544
JUMPV
LABELV $2541
line 4736
;4734:	}
;4735:
;4736:	if (cent->currentState.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2545
line 4737
;4737:	{
line 4738
;4738:		return;
ADDRGP4 $2540
JUMPV
LABELV $2545
LABELV $2544
line 4742
;4739:	}
;4740:
;4741:skipCheck:
;4742:	groundType = FOOTSTEP_GENERIC;//CG_FootstepForSurface(cent, cent->currentState.number);
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4746
;4743:
;4744://skipCheck:
;4745:
;4746:	if (!groundType)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2547
line 4747
;4747:	{
line 4748
;4748:		return;
ADDRGP4 $2540
JUMPV
LABELV $2547
line 4751
;4749:	}
;4750:
;4751:	switch (groundType)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $2551
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $2554
ADDRGP4 $2550
JUMPV
line 4752
;4752:	{
LABELV $2551
line 4754
;4753:	case FOOTSTEP_GENERIC:
;4754:		trap_S_StartSound (NULL, cent->currentState.number, CHAN_BODY, 
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 4756
;4755:			cgs.media.footsteps[ FOOTSTEP_NORMAL ][rand()&3] );
;4756:		break;
ADDRGP4 $2550
JUMPV
LABELV $2554
line 4758
;4757:	case FOOTSTEP_METAL:
;4758:		trap_S_StartSound (NULL, cent->currentState.number, CHAN_BODY, 
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 16
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 4760
;4759:			cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;4760:		break;
line 4762
;4761:	default:
;4762:		break;
LABELV $2550
line 4764
;4763:	}
;4764:}
LABELV $2540
endproc CG_FootStepGeneric 20 16
proc CG_G2EntSetLerpFrameAnimation 64 40
line 4766
;4765:
;4766:static void CG_G2EntSetLerpFrameAnimation( centity_t *cent, lerpFrame_t *lf, int newAnimation, float animSpeedMult, qboolean torsoOnly) {
line 4769
;4767:	animation_t	*anim;
;4768:	float animSpeed;
;4769:	int	  flags=BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 4
CNSTI4 72
ASGNI4
line 4770
;4770:	int oldAnim = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4771
;4771:	int blendTime = 150;
ADDRLP4 16
CNSTI4 150
ASGNI4
line 4773
;4772:
;4773:	if (cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $2559
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $2559
ADDRLP4 20
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $2559
line 4776
;4774:		cent->currentState.teamowner &&
;4775:		!cent->isATST)
;4776:	{
line 4777
;4777:		return;
ADDRGP4 $2558
JUMPV
LABELV $2559
line 4780
;4778:	}
;4779:
;4780:	oldAnim = lf->animationNumber;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
line 4782
;4781:
;4782:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 4783
;4783:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 4785
;4784:
;4785:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $2563
ADDRLP4 28
INDIRI4
CNSTI4 1211
LTI4 $2561
LABELV $2563
line 4787
;4786://		CG_Error( "Bad animation number: %i", newAnimation );
;4787:		return;
ADDRGP4 $2558
JUMPV
LABELV $2561
line 4790
;4788:	}
;4789:
;4790:	anim = &bgGlobalAnimations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 4792
;4791:
;4792:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 4793
;4793:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4795
;4794:
;4795:	if ( cg_debugAnim.integer && (cg_debugAnim.integer < 0 || cg_debugAnim.integer == cent->currentState.clientNum) ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $2564
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $2569
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
NEI4 $2564
LABELV $2569
line 4796
;4796:		CG_Printf( "%d: %d Anim: %i, '%s'\n", cg.time, cent->currentState.clientNum, newAnimation, GetStringForID(animTable, newAnimation));
ADDRGP4 animTable
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 GetStringForID
CALLP4
ASGNP4
ADDRGP4 $745
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 4797
;4797:	}
LABELV $2564
line 4799
;4798:
;4799:	if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2571
line 4800
;4800:	{
line 4801
;4801:		animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 12
CNSTF4 1112014848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 4802
;4802:		if (lf->animation->loopFrames != -1)
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2573
line 4803
;4803:		{
line 4804
;4804:			flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 4805
;4805:		}
LABELV $2573
line 4807
;4806:
;4807:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2575
line 4808
;4808:		{
line 4809
;4809:			if (animSpeed < 0.3)
ADDRLP4 12
INDIRF4
CNSTF4 1050253722
GEF4 $2577
line 4810
;4810:			{
line 4811
;4811:				animSpeed = 0.3;
ADDRLP4 12
CNSTF4 1050253722
ASGNF4
line 4812
;4812:			}
LABELV $2577
line 4814
;4813:
;4814:			if (newAnimation == BOTH_WALKBACK1)
ADDRFP4 8
INDIRI4
CNSTI4 852
NEI4 $2579
line 4815
;4815:			{
line 4816
;4816:				animSpeed = 0.8;
ADDRLP4 12
CNSTF4 1061997773
ASGNF4
line 4817
;4817:			}
LABELV $2579
line 4819
;4818:
;4819:			if (newAnimation != BOTH_DEATH1)
ADDRFP4 8
INDIRI4
CNSTI4 1
EQI4 $2581
line 4820
;4820:			{
line 4821
;4821:				flags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 4822
;4822:			}
LABELV $2581
line 4823
;4823:		}
LABELV $2575
line 4825
;4824:
;4825:		if (cg_animBlend.integer)
ADDRGP4 cg_animBlend+12
INDIRI4
CNSTI4 0
EQI4 $2583
line 4826
;4826:		{
line 4827
;4827:			flags |= BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 4828
;4828:		}
LABELV $2583
line 4830
;4829:
;4830:		if (!cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2586
line 4831
;4831:		{
line 4832
;4832:			if (/*BG_FlippingAnim(newAnimation) ||*/ BG_InDeathAnim(newAnimation))
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2588
line 4833
;4833:			{
line 4834
;4834:				flags &= ~BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 4835
;4835:			}
ADDRGP4 $2589
JUMPV
LABELV $2588
line 4836
;4836:			else if ( oldAnim != -1 &&
ADDRLP4 44
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 -1
EQI4 $2590
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $2590
line 4838
;4837:				(/*BG_FlippingAnim(oldAnim) ||*/ BG_InDeathAnim(oldAnim)) )
;4838:			{
line 4839
;4839:				flags &= ~BONE_ANIM_BLEND;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 4840
;4840:			}
LABELV $2590
LABELV $2589
line 4842
;4841:
;4842:			if (flags & BONE_ANIM_BLEND)
ADDRLP4 4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2592
line 4843
;4843:			{
line 4844
;4844:				if (BG_FlippingAnim(newAnimation))
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $2594
line 4845
;4845:				{
line 4846
;4846:					blendTime = 200;
ADDRLP4 16
CNSTI4 200
ASGNI4
line 4847
;4847:				}
ADDRGP4 $2595
JUMPV
LABELV $2594
line 4848
;4848:				else if ( oldAnim != -1 &&
ADDRLP4 56
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 -1
EQI4 $2596
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $2596
line 4850
;4849:					(BG_FlippingAnim(oldAnim)) )
;4850:				{
line 4851
;4851:					blendTime = 200;
ADDRLP4 16
CNSTI4 200
ASGNI4
line 4852
;4852:				}
LABELV $2596
LABELV $2595
line 4853
;4853:			}
LABELV $2592
line 4854
;4854:		}
LABELV $2586
line 4856
;4855:
;4856:		animSpeed *= animSpeedMult;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 4858
;4857:
;4858:		if (torsoOnly)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $2598
line 4859
;4859:		{
line 4860
;4860:			lf->animationTorsoSpeed = animSpeedMult;
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDRFP4 12
INDIRF4
ASGNF4
line 4861
;4861:		}
ADDRGP4 $2599
JUMPV
LABELV $2598
line 4863
;4862:		else
;4863:		{
line 4864
;4864:			lf->animationSpeed = animSpeedMult;
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDRFP4 12
INDIRF4
ASGNF4
line 4865
;4865:		}
LABELV $2599
line 4867
;4866:
;4867:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2600
line 4868
;4868:		{
line 4869
;4869:			int atstBlend = 400;
ADDRLP4 40
CNSTI4 400
ASGNI4
line 4871
;4870:
;4871:			if (torsoOnly)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $2602
line 4872
;4872:			{
line 4873
;4873:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "pelvis", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, atstBlend);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4874
;4874:			}
ADDRGP4 $2601
JUMPV
LABELV $2602
line 4876
;4875:			else
;4876:			{
line 4877
;4877:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, atstBlend);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4878
;4878:			}
line 4879
;4879:		}
ADDRGP4 $2601
JUMPV
LABELV $2600
line 4881
;4880:		else
;4881:		{
line 4882
;4882:			if (torsoOnly)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $2606
line 4883
;4883:			{
line 4884
;4884:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "upper_lumbar", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed,cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4885
;4885:			}
ADDRGP4 $2607
JUMPV
LABELV $2606
line 4887
;4886:			else
;4887:			{
line 4888
;4888:				trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4889
;4889:			}
LABELV $2607
line 4905
;4890:
;4891:			/*
;4892:			if ((cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) == newAnimation &&
;4893:				!BG_FlippingAnim( cent->currentState.legsAnim ) &&
;4894:				!BG_SpinningSaberAnim( cent->currentState.legsAnim ) &&
;4895:				!BG_SpinningSaberAnim( cent->currentState.torsoAnim ) &&
;4896:				!BG_InSpecialJump( cent->currentState.legsAnim ) &&
;4897:				!BG_InSpecialJump( cent->currentState.torsoAnim ) &&
;4898:				!BG_InDeathAnim(cent->currentState.legsAnim) &&
;4899:				!BG_InDeathAnim(cent->currentState.torsoAnim) &&
;4900:				!CG_InRoll(cent) &&
;4901:				!BG_SaberInSpecial(cent->currentState.saberMove) &&
;4902:				!BG_SaberInSpecialAttack(cent->currentState.torsoAnim) &&
;4903:				!BG_SaberInSpecialAttack(cent->currentState.legsAnim) )
;4904:				*/
;4905:			if (cg.snap && cg.snap->ps.clientNum == cent->currentState.number)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2610
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $2610
line 4906
;4906:			{ //go ahead and use the predicted state if you can.
line 4907
;4907:				if ((cg.predictedPlayerState.torsoAnim&~ANIM_TOGGLEBIT) == newAnimation)
ADDRGP4 cg+96+100
INDIRI4
CNSTI4 -2049
BANDI4
ADDRFP4 8
INDIRI4
NEI4 $2611
line 4908
;4908:				{
line 4909
;4909:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4910
;4910:				}
line 4911
;4911:			}
ADDRGP4 $2611
JUMPV
LABELV $2610
line 4913
;4912:			else
;4913:			{
line 4914
;4914:				if ((cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) == newAnimation)
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRFP4 8
INDIRI4
NEI4 $2619
line 4915
;4915:				{
line 4916
;4916:					trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", anim->firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, blendTime);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4917
;4917:				}
LABELV $2619
line 4918
;4918:			}
LABELV $2611
line 4919
;4919:		}
LABELV $2601
line 4920
;4920:	}
LABELV $2571
line 4921
;4921:}
LABELV $2558
endproc CG_G2EntSetLerpFrameAnimation 64 40
proc CG_G2EntRunLerpFrame 76 40
line 4924
;4922:
;4923:static void CG_G2EntRunLerpFrame( centity_t *cent, lerpFrame_t *lf, int newAnimation, float speedScale, qboolean torsoOnly) 
;4924:{
line 4929
;4925:	int			f, numFrames;
;4926:	animation_t	*anim;
;4927:
;4928:	// debugging tool to get no animations
;4929:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $2623
line 4930
;4930:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 4931
;4931:		return;
ADDRGP4 $2622
JUMPV
LABELV $2623
line 4935
;4932:	}
;4933:
;4934:	// see if the animation sequence is switching
;4935:	if (cent->currentState.forceFrame)
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2626
line 4936
;4936:	{
line 4937
;4937:		int flags = BONE_ANIM_OVERRIDE_FREEZE; //|BONE_ANIM_BLEND;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 4938
;4938:		float animSpeed = 1.0f;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 4939
;4939:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "upper_lumbar", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4940
;4940:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4941
;4941:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", cent->currentState.forceFrame, cent->currentState.forceFrame+1, flags, animSpeed, cg.time, -1, 150);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 4943
;4942:
;4943:		lf->animationNumber = 0;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 4944
;4944:	}
ADDRGP4 $2627
JUMPV
LABELV $2626
line 4945
;4945:	else if ( (newAnimation != lf->animationNumber || !lf->animation) || (CG_FirstAnimFrame(lf, torsoOnly, speedScale)) ) 
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $2633
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2633
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 CG_FirstAnimFrame
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2631
LABELV $2633
line 4946
;4946:	{
line 4947
;4947:		CG_G2EntSetLerpFrameAnimation( cent, lf, newAnimation, speedScale, torsoOnly);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_G2EntSetLerpFrameAnimation
CALLV
pop
line 4948
;4948:	}
ADDRGP4 $2632
JUMPV
LABELV $2631
line 4949
;4949:	else if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2634
line 4950
;4950:	{
line 4951
;4951:		if (cent->pe.legs.yawing != !lf->torsoYawing)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2639
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $2640
JUMPV
LABELV $2639
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $2640
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2636
line 4952
;4952:		{
line 4953
;4953:			CG_G2EntSetLerpFrameAnimation( cent, lf, newAnimation, speedScale, torsoOnly);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_G2EntSetLerpFrameAnimation
CALLV
pop
line 4954
;4954:			lf->torsoYawing = cent->pe.legs.yawing;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ASGNI4
line 4955
;4955:		}
LABELV $2636
line 4956
;4956:	}
LABELV $2634
LABELV $2632
LABELV $2627
line 4960
;4957:
;4958:	// if we have passed the current frame, move it to
;4959:	// oldFrame and calculate a new frame
;4960:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $2641
line 4961
;4961:		if (lf->oldFrame != lf->frame &&
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $2644
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CVPU4 4
NEU4 $2644
line 4963
;4962:			lf == &(cent->pe.legs))
;4963:		{
line 4964
;4964:			int addFinalFrame = CG_InWalkingAnim(lf->animationNumber); //9;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_InWalkingAnim
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 4966
;4965:
;4966:			if (!cent->isATST &&
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2646
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 915
EQI4 $2648
ADDRLP4 32
INDIRI4
CNSTI4 918
NEI4 $2646
LABELV $2648
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2646
line 4969
;4967:				((lf->animationNumber&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT || (lf->animationNumber&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT) &&
;4968:				addFinalFrame)
;4969:			{
line 4970
;4970:				if ( lf->frame >= (lf->animation->firstFrame+2) &&
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $2649
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 40
INDIRI4
GEI4 $2649
line 4972
;4971:					lf->oldFrame < (lf->animation->firstFrame+2))
;4972:				{
line 4973
;4973:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4974
;4974:				}
ADDRGP4 $2647
JUMPV
LABELV $2649
line 4975
;4975:				else if ( lf->frame >= (lf->animation->firstFrame+addFinalFrame) &&
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $2651
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 48
INDIRI4
GEI4 $2651
line 4977
;4976:					lf->oldFrame < (lf->animation->firstFrame+addFinalFrame))
;4977:				{
line 4978
;4978:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4979
;4979:				}
ADDRGP4 $2647
JUMPV
LABELV $2651
line 4980
;4980:				else if ( lf->frame >= (lf->animation->firstFrame+12) &&
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $2653
ADDRLP4 52
INDIRP4
INDIRI4
ADDRLP4 56
INDIRI4
GEI4 $2653
line 4982
;4981:					lf->oldFrame < (lf->animation->firstFrame+12))
;4982:				{
line 4983
;4983:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4984
;4984:				}
ADDRGP4 $2647
JUMPV
LABELV $2653
line 4985
;4985:				else if ( lf->frame >= (lf->animation->firstFrame+16) &&
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LTI4 $2655
ADDRLP4 60
INDIRP4
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $2655
line 4987
;4986:					lf->oldFrame < (lf->animation->firstFrame+16))
;4987:				{
line 4988
;4988:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4989
;4989:				}
ADDRGP4 $2647
JUMPV
LABELV $2655
line 4990
;4990:				else if (lf->oldFrame > lf->frame && lf->frame > (lf->animation->firstFrame+1))
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRP4
INDIRI4
ADDRLP4 72
INDIRI4
LEI4 $2647
ADDRLP4 72
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $2647
line 4991
;4991:				{ //missed one
line 4992
;4992:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 4993
;4993:				}
line 4994
;4994:			}
ADDRGP4 $2647
JUMPV
LABELV $2646
line 4995
;4995:			else if (addFinalFrame && !cent->isATST)
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $2659
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $2659
line 4996
;4996:			{
line 4997
;4997:				if ( lf->frame >= (lf->animation->firstFrame+3) &&
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $2661
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $2661
line 4999
;4998:					lf->oldFrame < (lf->animation->firstFrame+3))
;4999:				{
line 5000
;5000:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 5001
;5001:				}
ADDRGP4 $2662
JUMPV
LABELV $2661
line 5002
;5002:				else if ( lf->frame >= (lf->animation->firstFrame+addFinalFrame) &&
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LTI4 $2663
ADDRLP4 48
INDIRP4
INDIRI4
ADDRLP4 52
INDIRI4
GEI4 $2663
line 5004
;5003:					lf->oldFrame < (lf->animation->firstFrame+addFinalFrame))
;5004:				{
line 5005
;5005:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 5006
;5006:				}
ADDRGP4 $2664
JUMPV
LABELV $2663
line 5007
;5007:				else if (lf->oldFrame > lf->frame && lf->frame > (lf->animation->firstFrame+1))
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $2665
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $2665
line 5008
;5008:				{ //missed one
line 5009
;5009:					CG_FootStepGeneric(cent, lf->animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_FootStepGeneric
CALLV
pop
line 5010
;5010:				}
LABELV $2665
LABELV $2664
LABELV $2662
line 5011
;5011:			}
LABELV $2659
LABELV $2647
line 5012
;5012:		}
LABELV $2644
line 5014
;5013:
;5014:		lf->oldFrame = lf->frame;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 5015
;5015:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 5018
;5016:
;5017:		// get the next frame based on the animation
;5018:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRP4
ASGNP4
line 5019
;5019:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2667
line 5020
;5020:			return;		// shouldn't happen
ADDRGP4 $2622
JUMPV
LABELV $2667
line 5023
;5021:		}
;5022:
;5023:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
GEI4 $2669
line 5024
;5024:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 5025
;5025:		} else {
ADDRGP4 $2670
JUMPV
LABELV $2669
line 5026
;5026:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 12
ASGNI4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 5027
;5027:		}
LABELV $2670
line 5028
;5028:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 5029
;5029:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 5031
;5030:
;5031:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 5032
;5032:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2672
line 5033
;5033:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 5034
;5034:		}
LABELV $2672
line 5035
;5035:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2674
line 5036
;5036:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 5037
;5037:			if ( anim->loopFrames != -1 ) //Before 0 meant no loop
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2676
line 5038
;5038:			{
line 5039
;5039:				if(anim->numFrames - anim->loopFrames == 0)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CNSTI4 0
NEI4 $2678
line 5040
;5040:				{
line 5041
;5041:					f %= anim->numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
MODI4
ASGNI4
line 5042
;5042:				}
ADDRGP4 $2679
JUMPV
LABELV $2678
line 5044
;5043:				else
;5044:				{
line 5045
;5045:					f %= (anim->numFrames - anim->loopFrames);
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
MODI4
ASGNI4
line 5046
;5046:				}
LABELV $2679
line 5047
;5047:				f += anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 5048
;5048:			} 
ADDRGP4 $2677
JUMPV
LABELV $2676
line 5050
;5049:			else 
;5050:			{
line 5051
;5051:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5054
;5052:				// the animation is stuck at the end, so it
;5053:				// can immediately transition to another sequence
;5054:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5055
;5055:			}
LABELV $2677
line 5056
;5056:		}
LABELV $2674
line 5057
;5057:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2681
line 5058
;5058:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 5059
;5059:		}
ADDRGP4 $2682
JUMPV
LABELV $2681
line 5060
;5060:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2683
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $2683
line 5061
;5061:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 48
INDIRI4
MODI4
SUBI4
ASGNI4
line 5062
;5062:		}
ADDRGP4 $2684
JUMPV
LABELV $2683
line 5063
;5063:		else {
line 5064
;5064:			lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 5065
;5065:		}
LABELV $2684
LABELV $2682
line 5066
;5066:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $2685
line 5067
;5067:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5068
;5068:			if ( cg_debugAnim.integer && (cg_debugAnim.integer < 0 || cg_debugAnim.integer == cent->currentState.clientNum) ) {
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $2689
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $2694
ADDRGP4 cg_debugAnim+12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
NEI4 $2689
LABELV $2694
line 5069
;5069:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $938
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 5070
;5070:			}
LABELV $2689
line 5071
;5071:		}
LABELV $2685
line 5072
;5072:	}
LABELV $2641
line 5074
;5073:
;5074:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
CNSTI4 200
ADDI4
LEI4 $2695
line 5075
;5075:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5076
;5076:	}
LABELV $2695
line 5078
;5077:
;5078:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $2699
line 5079
;5079:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5080
;5080:	}
LABELV $2699
line 5082
;5081:	// calculate current lerp value
;5082:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $2703
line 5083
;5083:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 5084
;5084:	} else {
ADDRGP4 $2704
JUMPV
LABELV $2703
line 5085
;5085:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+64
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 5086
;5086:	}
LABELV $2704
line 5087
;5087:}
LABELV $2622
endproc CG_G2EntRunLerpFrame 76 40
proc CG_G2EntAnimation 12 20
line 5090
;5088:
;5089:static void CG_G2EntAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;5090:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 5093
;5091:	float			speedScale;
;5092:
;5093:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $2707
line 5094
;5094:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
line 5095
;5095:		return;
ADDRGP4 $2706
JUMPV
LABELV $2707
line 5098
;5096:	}
;5097:
;5098:	if (cent->currentState.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2710
line 5099
;5099:	{
line 5100
;5100:		speedScale = 1.3;
ADDRLP4 0
CNSTF4 1067869798
ASGNF4
line 5101
;5101:	}
ADDRGP4 $2711
JUMPV
LABELV $2710
line 5102
;5102:	else if (cent->currentState.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2712
line 5103
;5103:	{
line 5104
;5104:		speedScale = 1.7;
ADDRLP4 0
CNSTF4 1071225242
ASGNF4
line 5105
;5105:	}
ADDRGP4 $2713
JUMPV
LABELV $2712
line 5107
;5106:	else
;5107:	{
line 5108
;5108:		speedScale = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 5109
;5109:	}
LABELV $2713
LABELV $2711
line 5111
;5110:
;5111:	CG_G2EntRunLerpFrame( cent, &cent->pe.legs, cent->currentState.legsAnim, speedScale, qfalse);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 644
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_G2EntRunLerpFrame
CALLV
pop
line 5113
;5112:
;5113:	if (!(cent->currentState.forcePowersActive & (1 << FP_RAGE)))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $2714
line 5114
;5114:	{ //don't affect torso anim speed unless raged
line 5115
;5115:		speedScale = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 5116
;5116:	}
ADDRGP4 $2715
JUMPV
LABELV $2714
line 5118
;5117:	else
;5118:	{
line 5119
;5119:		speedScale = 1.7;
ADDRLP4 0
CNSTF4 1071225242
ASGNF4
line 5120
;5120:	}
LABELV $2715
line 5122
;5121:
;5122:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ASGNI4
line 5123
;5123:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 5124
;5124:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRF4
ASGNF4
line 5126
;5125:
;5126:	CG_G2EntRunLerpFrame( cent, &cent->pe.torso, cent->currentState.torsoAnim, speedScale, qtrue );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_G2EntRunLerpFrame
CALLV
pop
line 5128
;5127:
;5128:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ASGNI4
line 5129
;5129:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 5130
;5130:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ASGNF4
line 5131
;5131:}
LABELV $2706
endproc CG_G2EntAnimation 12 20
export CG_G2AnimEntSpineAngles
proc CG_G2AnimEntSpineAngles 88 8
line 5134
;5132:
;5133:void CG_G2AnimEntSpineAngles( centity_t *cent, vec3_t viewAngles, const vec3_t angles, vec3_t thoracicAngles, vec3_t ulAngles, vec3_t llAngles )
;5134:{
line 5135
;5135:	int ang = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5137
;5136:
;5137:	if (cent->isATST || cent->currentState.teamowner)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $2719
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2717
LABELV $2719
line 5138
;5138:	{
line 5139
;5139:		return;
ADDRGP4 $2716
JUMPV
LABELV $2717
line 5142
;5140:	}
;5141:
;5142:	VectorClear(ulAngles);
ADDRLP4 12
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
line 5143
;5143:	VectorClear(llAngles);
ADDRLP4 20
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 5146
;5144:
;5145:	//cent->pe.torso.pitchAngle = viewAngles[PITCH];
;5146:	viewAngles[YAW] = AngleDelta( cent->lerpAngles[YAW], angles[YAW] );
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 5151
;5147:	//cent->pe.torso.yawAngle = viewAngles[YAW];
;5148:
;5149:	//distribute the angles differently up the spine
;5150:	//NOTE: each of these distributions must add up to 1.0f
;5151:	thoracicAngles[PITCH] = 0;//viewAngles[PITCH]*0.20f;
ADDRFP4 12
INDIRP4
CNSTF4 0
ASGNF4
line 5152
;5152:	llAngles[PITCH] = 0;//viewAngles[PITCH]*0.40f;
ADDRFP4 20
INDIRP4
CNSTF4 0
ASGNF4
line 5153
;5153:	ulAngles[PITCH] = 0;//viewAngles[PITCH]*0.40f;
ADDRFP4 16
INDIRP4
CNSTF4 0
ASGNF4
line 5155
;5154:
;5155:	thoracicAngles[YAW] = viewAngles[YAW]*0.20f - (viewAngles[PITCH]*(viewAngles[YAW]*.020f));
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1017370378
ADDRLP4 44
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 5156
;5156:	ulAngles[YAW] = viewAngles[YAW]*0.25f - (viewAngles[PITCH]*(viewAngles[YAW]*.0005f));
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
CNSTF4 1048576000
ADDRLP4 56
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 973279855
ADDRLP4 56
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 5157
;5157:	llAngles[YAW] = viewAngles[YAW]*0.25f - (viewAngles[PITCH]*(viewAngles[YAW]*.0005f));
ADDRLP4 60
CNSTI4 4
ASGNI4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 20
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
CNSTF4 1048576000
ADDRLP4 68
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 973279855
ADDRLP4 68
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 5159
;5158:
;5159:	if (thoracicAngles[YAW] > 20)
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $2720
line 5160
;5160:	{
line 5161
;5161:		thoracicAngles[YAW] = 20;
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 5162
;5162:	}
LABELV $2720
line 5163
;5163:	if (ulAngles[YAW] > 20)
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $2722
line 5164
;5164:	{
line 5165
;5165:		ulAngles[YAW] = 20;
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 5166
;5166:	}
LABELV $2722
line 5167
;5167:	if (llAngles[YAW] > 20)
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $2724
line 5168
;5168:	{
line 5169
;5169:		llAngles[YAW] = 20;
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 5170
;5170:	}
LABELV $2724
line 5172
;5171:
;5172:	thoracicAngles[ROLL] = viewAngles[ROLL]*0.20f;
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 5173
;5173:	ulAngles[ROLL] = viewAngles[ROLL]*0.35f;
ADDRLP4 76
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 5174
;5174:	llAngles[ROLL] = viewAngles[ROLL]*0.45f;
ADDRLP4 80
CNSTI4 8
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 5176
;5175:	
;5176:	for ( ang = 0; ang < 3; ang++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2726
line 5177
;5177:	{
line 5178
;5178:		if (ulAngles[ang] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2730
line 5179
;5179:		{
line 5180
;5180:			ulAngles[ang] += 360;
ADDRLP4 84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 5181
;5181:		}
LABELV $2730
line 5182
;5182:	}
LABELV $2727
line 5176
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2726
line 5183
;5183:}
LABELV $2716
endproc CG_G2AnimEntSpineAngles 88 8
data
align 4
LABELV $2733
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
LABELV $2734
byte 4 0
byte 4 0
byte 4 0
code
proc CG_G2AnimEntAngles 228 44
line 5186
;5184:
;5185:static void CG_G2AnimEntAngles( centity_t *cent, vec3_t legs[3], vec3_t legsAngles)
;5186:{
line 5194
;5187:	vec3_t		torsoAngles, headAngles;
;5188:	float		dest;
;5189:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;5190:	vec3_t		velocity;
;5191:	float		speed; //, speed_dif, speed_desired;
;5192:	int			dir;
;5193:	vec3_t		velPos, velAng;
;5194:	int			adddir = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 5196
;5195:	float		dif;
;5196:	float		degrees_negative = 0;
ADDRLP4 132
CNSTF4 0
ASGNF4
line 5197
;5197:	float		degrees_positive = 0;
ADDRLP4 136
CNSTF4 0
ASGNF4
line 5198
;5198:	vec3_t		ulAngles, llAngles, viewAngles, angles, thoracicAngles = {0,0,0};
ADDRLP4 60
ADDRGP4 $2734
INDIRB
ASGNB 12
line 5200
;5199:
;5200:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 5201
;5201:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 148
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 148
INDIRF4
ASGNF4
line 5202
;5202:	VectorClear( legsAngles );
ADDRLP4 152
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 156
CNSTF4 0
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 156
INDIRF4
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 156
INDIRF4
ASGNF4
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRF4
ASGNF4
line 5203
;5203:	VectorClear( torsoAngles );
ADDRLP4 160
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 160
INDIRF4
ASGNF4
line 5208
;5204:
;5205:	// --------- yaw -------------
;5206:
;5207:	// allow yaw to drift a bit
;5208:	if ((( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != BOTH_STAND1) || 
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
CNSTI4 -2049
ASGNI4
ADDRLP4 164
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
BANDI4
CNSTI4 571
NEI4 $2741
ADDRLP4 164
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
BANDI4
ADDRLP4 164
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
EQI4 $2739
LABELV $2741
line 5210
;5209:			( cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT ) != WeaponReadyAnim[cent->currentState.weapon]  ) 
;5210:	{
line 5212
;5211:		// if not standing still, always point all in the same direction
;5212:		cent->pe.torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 1
ASGNI4
line 5213
;5213:		cent->pe.torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 1
ASGNI4
line 5214
;5214:		cent->pe.legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTI4 1
ASGNI4
line 5215
;5215:	}
LABELV $2739
line 5217
;5216:
;5217:	dir = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
line 5218
;5218:	if (!cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2742
line 5219
;5219:	{
line 5220
;5220:		torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2733
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 5221
;5221:	}
ADDRGP4 $2743
JUMPV
LABELV $2742
line 5223
;5222:	else
;5223:	{
line 5224
;5224:		torsoAngles[YAW] = headAngles[YAW];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 5225
;5225:	}
LABELV $2743
line 5228
;5226:
;5227:	//for now, turn torso instantly and let the legs swing to follow
;5228:	cent->pe.torso.yawAngle = torsoAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 5232
;5229:
;5230:	// --------- pitch -------------
;5231:
;5232:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 5233
;5233:	speed = VectorNormalize( velocity );
ADDRLP4 24
ARGP4
ADDRLP4 172
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 172
INDIRF4
ASGNF4
line 5235
;5234:
;5235:	if (!speed)
ADDRLP4 108
INDIRF4
CNSTF4 0
NEF4 $2749
line 5236
;5236:	{
line 5237
;5237:		torsoAngles[YAW] = headAngles[YAW];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 5238
;5238:	}
LABELV $2749
line 5241
;5239:
;5240:	// only show a fraction of the pitch angle in the torso
;5241:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $2753
line 5242
;5242:		dest = (-360 + headAngles[PITCH]) * 0.75;
ADDRLP4 140
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 5243
;5243:	} else {
ADDRGP4 $2754
JUMPV
LABELV $2753
line 5244
;5244:		dest = headAngles[PITCH] * 0.75;
ADDRLP4 140
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 5245
;5245:	}
LABELV $2754
line 5246
;5246:	CG_SwingAngles( dest, 15, 30, 0.1, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
ADDRLP4 140
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 736
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLF4
pop
line 5247
;5247:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRF4
ASGNF4
line 5249
;5248:
;5249:	if ( speed ) {
ADDRLP4 108
INDIRF4
CNSTF4 0
EQF4 $2755
line 5253
;5250:		vec3_t	axis[3];
;5251:		float	side;
;5252:
;5253:		speed *= 0.05;
ADDRLP4 108
CNSTF4 1028443341
ADDRLP4 108
INDIRF4
MULF4
ASGNF4
line 5255
;5254:
;5255:		AnglesToAxis( legsAngles, axis );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 5256
;5256:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 216
ADDRLP4 108
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 180+12
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 180+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 180+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 5257
;5257:		legsAngles[ROLL] -= side;
ADDRLP4 220
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 220
INDIRP4
ADDRLP4 220
INDIRP4
INDIRF4
ADDRLP4 216
INDIRF4
SUBF4
ASGNF4
line 5259
;5258:
;5259:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 216
ADDRLP4 108
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 180+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 180+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 5260
;5260:		legsAngles[PITCH] += side;
ADDRLP4 224
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 216
INDIRF4
ADDF4
ASGNF4
line 5261
;5261:	}
LABELV $2755
line 5264
;5262:
;5263:	//rww - crazy velocity-based leg angle calculation
;5264:	legsAngles[YAW] = headAngles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 5265
;5265:	velPos[0] = cent->lerpOrigin[0] + velocity[0];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 5266
;5266:	velPos[1] = cent->lerpOrigin[1] + velocity[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
line 5267
;5267:	velPos[2] = cent->lerpOrigin[2];// + velocity[2];
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ASGNF4
line 5269
;5268:
;5269:	if (cent->currentState.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2772
line 5270
;5270:	{ //off the ground, no direction-based leg angles
line 5271
;5271:		VectorCopy(cent->lerpOrigin, velPos);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 5272
;5272:	}
LABELV $2772
line 5274
;5273:
;5274:	VectorSubtract(cent->lerpOrigin, velPos, velAng);
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 180
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 180
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 36+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 36+8
INDIRF4
SUBF4
ASGNF4
line 5276
;5275:
;5276:	if (!VectorCompare(velAng, vec3_origin))
ADDRLP4 48
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 184
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
NEI4 $2778
line 5277
;5277:	{
line 5278
;5278:		vectoangles(velAng, velAng);
ADDRLP4 48
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 5280
;5279:
;5280:		if (velAng[YAW] <= legsAngles[YAW])
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
GTF4 $2780
line 5281
;5281:		{
line 5282
;5282:			degrees_negative = (legsAngles[YAW] - velAng[YAW]);
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 48+4
INDIRF4
SUBF4
ASGNF4
line 5283
;5283:			degrees_positive = (360 - legsAngles[YAW]) + velAng[YAW];
ADDRLP4 136
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
line 5284
;5284:		}
ADDRGP4 $2781
JUMPV
LABELV $2780
line 5286
;5285:		else
;5286:		{
line 5287
;5287:			degrees_negative = legsAngles[YAW] + (360 - velAng[YAW]);
ADDRLP4 132
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
line 5288
;5288:			degrees_positive = (velAng[YAW] - legsAngles[YAW]);
ADDRLP4 136
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5289
;5289:		}
LABELV $2781
line 5291
;5290:
;5291:		if (degrees_negative < degrees_positive)
ADDRLP4 132
INDIRF4
ADDRLP4 136
INDIRF4
GEF4 $2787
line 5292
;5292:		{
line 5293
;5293:			dif = degrees_negative;
ADDRLP4 112
ADDRLP4 132
INDIRF4
ASGNF4
line 5294
;5294:			adddir = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 5295
;5295:		}
ADDRGP4 $2788
JUMPV
LABELV $2787
line 5297
;5296:		else
;5297:		{
line 5298
;5298:			dif = degrees_positive;
ADDRLP4 112
ADDRLP4 136
INDIRF4
ASGNF4
line 5299
;5299:			adddir = 1;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 5300
;5300:		}
LABELV $2788
line 5302
;5301:
;5302:		if (dif > 90)
ADDRLP4 112
INDIRF4
CNSTF4 1119092736
LEF4 $2789
line 5303
;5303:		{
line 5304
;5304:			dif = (180 - dif);
ADDRLP4 112
CNSTF4 1127481344
ADDRLP4 112
INDIRF4
SUBF4
ASGNF4
line 5305
;5305:		}
LABELV $2789
line 5307
;5306:
;5307:		if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2791
line 5308
;5308:		{
line 5309
;5309:			if (dif > 360)
ADDRLP4 112
INDIRF4
CNSTF4 1135869952
LEF4 $2792
line 5310
;5310:			{
line 5311
;5311:				dif = 360;
ADDRLP4 112
CNSTF4 1135869952
ASGNF4
line 5312
;5312:			}
line 5313
;5313:		}
ADDRGP4 $2792
JUMPV
LABELV $2791
line 5315
;5314:		else
;5315:		{
line 5316
;5316:			if (dif > 60)
ADDRLP4 112
INDIRF4
CNSTF4 1114636288
LEF4 $2795
line 5317
;5317:			{
line 5318
;5318:				dif = 60;
ADDRLP4 112
CNSTF4 1114636288
ASGNF4
line 5319
;5319:			}
LABELV $2795
line 5320
;5320:		}
LABELV $2792
line 5323
;5321:
;5322:		//Slight hack for when playing is running backward
;5323:		if (dir == 3 || dir == 5)
ADDRLP4 188
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 3
EQI4 $2799
ADDRLP4 188
INDIRI4
CNSTI4 5
NEI4 $2797
LABELV $2799
line 5324
;5324:		{
line 5325
;5325:			dif = -dif;
ADDRLP4 112
ADDRLP4 112
INDIRF4
NEGF4
ASGNF4
line 5326
;5326:		}
LABELV $2797
line 5328
;5327:
;5328:		if (adddir)
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $2800
line 5329
;5329:		{
line 5330
;5330:			legsAngles[YAW] -= dif;
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 112
INDIRF4
SUBF4
ASGNF4
line 5331
;5331:		}
ADDRGP4 $2801
JUMPV
LABELV $2800
line 5333
;5332:		else
;5333:		{
line 5334
;5334:			legsAngles[YAW] += dif;
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 112
INDIRF4
ADDF4
ASGNF4
line 5335
;5335:		}
LABELV $2801
line 5336
;5336:	}
LABELV $2778
line 5338
;5337:
;5338:	cent->pe.legs.yawAngle = legsAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 5339
;5339:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRF4
ASGNF4
line 5342
;5340:
;5341:	// pain twitch
;5342:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 5344
;5343:
;5344:	legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 5345
;5345:	torsoAngles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 5350
;5346:
;5347:	//VectorCopy(legsAngles, cent->turAngles);
;5348:	//turAngles is used as a smoothing storage vector for g2animents.
;5349:
;5350:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2803
line 5351
;5351:	{
line 5352
;5352:		legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 5353
;5353:		legsAngles[PITCH] = 0;
ADDRFP4 8
INDIRP4
CNSTF4 0
ASGNF4
line 5354
;5354:	}
LABELV $2803
line 5357
;5355:
;5356:	// pull the angles back out of the hierarchial chain
;5357:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 5358
;5358:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
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
line 5359
;5359:	AnglesToAxis( legsAngles, legs );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 5362
;5360:	// we assume that model 0 is the player model.
;5361:
;5362:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2805
line 5363
;5363:	{
line 5366
;5364:		vec3_t flatYaw;
;5365:
;5366:		flatYaw[YAW] = 0;//cent->lerpAngles[YAW];
ADDRLP4 188+4
CNSTF4 0
ASGNF4
line 5367
;5367:		flatYaw[ROLL] = 0;
ADDRLP4 188+8
CNSTF4 0
ASGNF4
line 5368
;5368:		flatYaw[PITCH] = 0;
ADDRLP4 188
CNSTF4 0
ASGNF4
line 5369
;5369:		CG_G2SetBoneAngles(cent->ghoul2, 0, "pelvis", flatYaw, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $295
ARGP4
ADDRLP4 188
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5371
;5370:
;5371:		CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", torsoAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $1163
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5373
;5372:
;5373:		return;
ADDRGP4 $2732
JUMPV
LABELV $2805
line 5376
;5374:	}
;5375:
;5376:	VectorCopy( cent->lerpAngles, viewAngles );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 5377
;5377:	viewAngles[YAW] = viewAngles[ROLL] = 0;
ADDRLP4 188
CNSTF4 0
ASGNF4
ADDRLP4 96+8
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 188
INDIRF4
ASGNF4
line 5378
;5378:	viewAngles[PITCH] *= 0.5;
ADDRLP4 96
CNSTF4 1056964608
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
line 5380
;5379:
;5380:	VectorCopy( cent->lerpAngles, angles );
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 5381
;5381:	angles[PITCH] = 0;
ADDRLP4 116
CNSTF4 0
ASGNF4
line 5383
;5382:
;5383:	CG_G2AnimEntSpineAngles(cent, viewAngles, angles, thoracicAngles, ulAngles, llAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CG_G2AnimEntSpineAngles
CALLV
pop
line 5385
;5384:
;5385:	ulAngles[YAW] += torsoAngles[YAW]*0.3;
ADDRLP4 72+4
ADDRLP4 72+4
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5386
;5386:	llAngles[YAW] += torsoAngles[YAW]*0.3;
ADDRLP4 84+4
ADDRLP4 84+4
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5387
;5387:	thoracicAngles[YAW] += torsoAngles[YAW]*0.4;
ADDRLP4 60+4
ADDRLP4 60+4
INDIRF4
CNSTF4 1053609165
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5389
;5388:
;5389:	ulAngles[PITCH] = torsoAngles[PITCH]*0.3;
ADDRLP4 72
CNSTF4 1050253722
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 5390
;5390:	llAngles[PITCH] = torsoAngles[PITCH]*0.3;
ADDRLP4 84
CNSTF4 1050253722
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 5391
;5391:	thoracicAngles[PITCH] = torsoAngles[PITCH]*0.4;
ADDRLP4 60
CNSTF4 1053609165
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 5393
;5392:
;5393:	ulAngles[ROLL] += torsoAngles[ROLL]*0.3;
ADDRLP4 72+8
ADDRLP4 72+8
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5394
;5394:	llAngles[ROLL] += torsoAngles[ROLL]*0.3;
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5395
;5395:	thoracicAngles[ROLL] += torsoAngles[ROLL]*0.4;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1053609165
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5397
;5396:
;5397:	CG_G2SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRLP4 192
INDIRI4
ARGI4
ADDRGP4 $303
ARGP4
ADDRLP4 72
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 192
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5398
;5398:	CG_G2SetBoneAngles(cent->ghoul2, 0, "lower_lumbar", llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 $312
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
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5399
;5399:	CG_G2SetBoneAngles(cent->ghoul2, 0, "thoracic", thoracicAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $1163
ARGP4
ADDRLP4 60
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5400
;5400:	CG_G2SetBoneAngles(cent->ghoul2, 0, "cervical", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $1195
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 CG_G2SetBoneAngles
CALLV
pop
line 5401
;5401:}
LABELV $2732
endproc CG_G2AnimEntAngles 228 44
export CG_DrawNoForceSphere
proc CG_DrawNoForceSphere 217 12
line 5406
;5402:
;5403:#define SMOOTH_G2ANIM_LERPORIGIN
;5404:
;5405:void CG_DrawNoForceSphere(centity_t *cent, vec3_t origin, float scale, int shader)
;5406:{
line 5410
;5407:	refEntity_t ent;
;5408:	
;5409:	// Don't draw the shield when the player is dead.
;5410:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2836
line 5411
;5411:	{
line 5412
;5412:		return;
ADDRGP4 $2835
JUMPV
LABELV $2836
line 5415
;5413:	}
;5414:
;5415:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5417
;5416:
;5417:	VectorCopy( origin, ent.origin );
ADDRLP4 0+52
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 5418
;5418:	ent.origin[2] += 9.0;
ADDRLP4 0+52+8
ADDRLP4 0+52+8
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 5420
;5419:
;5420:	VectorSubtract(cg.refdef.vieworg, ent.origin, ent.axis[0]);
ADDRLP4 0+12
ADDRGP4 cg+3616+24
INDIRF4
ADDRLP4 0+52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+4
ADDRGP4 cg+3616+24+4
INDIRF4
ADDRLP4 0+52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12+8
ADDRGP4 cg+3616+24+8
INDIRF4
ADDRLP4 0+52+8
INDIRF4
SUBF4
ASGNF4
line 5421
;5421:	if (VectorNormalize(ent.axis[0]) <= 0.1f)
ADDRLP4 0+12
ARGP4
ADDRLP4 212
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 212
INDIRF4
CNSTF4 1036831949
GTF4 $2859
line 5422
;5422:	{	// Entity is right on vieworg.  quit.
line 5423
;5423:		return;
ADDRGP4 $2835
JUMPV
LABELV $2859
line 5426
;5424:	}
;5425:
;5426:	VectorCopy(cg.refdef.viewaxis[2], ent.axis[2]);
ADDRLP4 0+12+24
ADDRGP4 cg+3616+36+24
INDIRB
ASGNB 12
line 5427
;5427:	CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
ADDRLP4 0+12
ARGP4
ADDRLP4 0+12+24
ARGP4
ADDRLP4 0+12+12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 5429
;5428:
;5429:	VectorScale(ent.axis[0], scale, ent.axis[0]);
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 5430
;5430:	VectorScale(ent.axis[1], scale, ent.axis[1]);
ADDRLP4 0+12+12
ADDRLP4 0+12+12
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+4
ADDRLP4 0+12+12+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+12+12+8
ADDRLP4 0+12+12+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 5431
;5431:	VectorScale(ent.axis[2], -scale, ent.axis[2]);
ADDRLP4 0+12+24
ADDRLP4 0+12+24
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 0+12+24+4
ADDRLP4 0+12+24+4
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 0+12+24+8
ADDRLP4 0+12+24+8
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
MULF4
ASGNF4
line 5433
;5432:
;5433:	ent.shaderRGBA[3] = (cent->currentState.genericenemyindex - cg.time)/8;
ADDRLP4 0+80+3
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CNSTI4 8
DIVI4
CVIU4 4
CVUU1 4
ASGNU1
line 5434
;5434:	ent.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 5435
;5435:	if (ent.shaderRGBA[3] > 200)
ADDRLP4 0+80+3
INDIRU1
CVUI4 1
CNSTI4 200
LEI4 $2918
line 5436
;5436:	{
line 5437
;5437:		ent.shaderRGBA[3] = 200;
ADDRLP4 0+80+3
CNSTU1 200
ASGNU1
line 5438
;5438:	}
LABELV $2918
line 5439
;5439:	if (ent.shaderRGBA[3] < 1)
ADDRLP4 0+80+3
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $2924
line 5440
;5440:	{
line 5441
;5441:		ent.shaderRGBA[3] = 1;
ADDRLP4 0+80+3
CNSTU1 1
ASGNU1
line 5442
;5442:	}
LABELV $2924
line 5444
;5443:
;5444:	ent.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 5445
;5445:	ent.shaderRGBA[0] = ent.shaderRGBA[1] = ent.shaderRGBA[3];
ADDRLP4 216
ADDRLP4 0+80+3
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 216
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 216
INDIRU1
ASGNU1
line 5447
;5446:
;5447:	ent.hModel = cgs.media.halfShieldModel;
ADDRLP4 0+8
ADDRGP4 cgs+70296+900
INDIRI4
ASGNI4
line 5448
;5448:	ent.customShader = shader;	
ADDRLP4 0+76
ADDRFP4 12
INDIRI4
ASGNI4
line 5450
;5449:
;5450:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 5451
;5451:}
LABELV $2835
endproc CG_DrawNoForceSphere 217 12
export CG_G2Animated
proc CG_G2Animated 612 36
line 5454
;5452:
;5453:void CG_G2Animated( centity_t *cent )
;5454:{
line 5457
;5455:	refEntity_t		legs;
;5456:	refEntity_t		torso;
;5457:	int				renderfx = 0;
ADDRLP4 444
CNSTI4 0
ASGNI4
line 5458
;5458:	qboolean		shadow = qfalse;
ADDRLP4 448
CNSTI4 0
ASGNI4
line 5459
;5459:	float			shadowPlane = 0;
ADDRLP4 452
CNSTF4 0
ASGNF4
line 5460
;5460:	qboolean		dead = qfalse;
ADDRLP4 456
CNSTI4 0
ASGNI4
line 5464
;5461:	vec3_t			rootAngles;
;5462:#ifdef SMOOTH_G2ANIM_LERPORIGIN
;5463:	vec3_t			posDif;
;5464:	float			smoothFactor = 0.4f;
ADDRLP4 228
CNSTF4 1053609165
ASGNF4
line 5465
;5465:	int				k = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5468
;5466:#endif
;5467:
;5468:	cent->ghoul2 = cg_entities[cent->currentState.number].ghoul2;
ADDRLP4 472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 472
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 1920
ADDRLP4 472
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ASGNP4
line 5470
;5469:
;5470:	if (!cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2943
line 5471
;5471:	{ //Initialize this g2 anim ent, then return (will start rendering next frame)
line 5472
;5472:		const char *modelName = CG_ConfigString( CS_MODELS+cent->currentState.modelindex );
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 480
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 476
ADDRLP4 480
INDIRP4
ASGNP4
line 5474
;5473:
;5474:		if (modelName && modelName[0])
ADDRLP4 484
ADDRLP4 476
INDIRP4
ASGNP4
ADDRLP4 484
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2941
ADDRLP4 484
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2941
line 5475
;5475:		{
line 5476
;5476:			trap_G2API_InitGhoul2Model(&cent->ghoul2, modelName, 0, 0, 0, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRLP4 476
INDIRP4
ARGP4
ADDRLP4 488
CNSTI4 0
ASGNI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 5477
;5477:			if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2941
line 5478
;5478:			{
line 5479
;5479:				trap_G2API_AddBolt(cent->ghoul2, 0, "*r_hand");
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $296
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 5480
;5480:				trap_G2API_AddBolt(cent->ghoul2, 0, "*l_hand");
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $309
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 5481
;5481:				trap_G2API_AddBolt(cent->ghoul2, 0, "*head_top");
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $310
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 5482
;5482:				trap_G2API_AddBolt(cent->ghoul2, 0, "Motion");
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 5483
;5483:			}
line 5484
;5484:		}
line 5485
;5485:		return;
ADDRGP4 $2941
JUMPV
LABELV $2943
line 5488
;5486:	}
;5487:
;5488:	if (cent->currentState.weapon &&
ADDRLP4 476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 476
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2949
ADDRLP4 476
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 480
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 484
CNSTI4 0
ASGNI4
ADDRLP4 480
INDIRI4
ADDRLP4 484
INDIRI4
NEI4 $2949
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 484
INDIRI4
NEI4 $2949
line 5491
;5489:		!trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1) &&
;5490:		!(cent->currentState.eFlags & EF_DEAD))
;5491:	{ //if the server says we have a weapon and we haven't copied one onto ourselves yet, then do so.
line 5492
;5492:		trap_G2API_CopySpecificGhoul2Model(g2WeaponInstances[cent->currentState.weapon], 0, cent->ghoul2, 1);
ADDRLP4 488
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 488
INDIRP4
CNSTI4 276
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
ADDRLP4 488
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
CALLV
pop
line 5493
;5493:	}
LABELV $2949
line 5495
;5494:
;5495:	if (cent->torsoBolt && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 488
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 492
CNSTI4 0
ASGNI4
ADDRLP4 488
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 492
INDIRI4
EQI4 $2951
ADDRLP4 488
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 492
INDIRI4
NEI4 $2951
line 5496
;5496:	{ //he's alive and has a limb missing still, reattach it and reset the weapon
line 5497
;5497:		CG_ReattachLimb(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ReattachLimb
CALLV
pop
line 5498
;5498:	}
LABELV $2951
line 5501
;5499:
;5500:#ifdef SMOOTH_G2ANIM_LERPORIGIN
;5501:	if (DistanceSquared(cent->turAngles,cent->lerpOrigin)>12000.0f)
ADDRLP4 496
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 496
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 496
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 500
ADDRGP4 DistanceSquared
CALLF4
ASGNF4
ADDRLP4 500
INDIRF4
CNSTF4 1178304512
LEF4 $2953
line 5502
;5502:	{
line 5503
;5503:		VectorCopy(cent->lerpOrigin, cent->turAngles);
ADDRLP4 504
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 504
INDIRP4
CNSTI4 1016
ADDP4
ADDRLP4 504
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 5504
;5504:	}
LABELV $2953
line 5506
;5505:
;5506:	VectorSubtract(cent->lerpOrigin, cent->turAngles, posDif);
ADDRLP4 504
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
ADDRLP4 504
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 504
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 216+4
ADDRLP4 504
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 504
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 508
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216+8
ADDRLP4 508
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 508
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5508
;5507:	
;5508:	for (k=0;k<3;k++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2957
line 5509
;5509:	{
line 5510
;5510:		cent->turAngles[k]=(cent->turAngles[k]+posDif[k]*smoothFactor);
ADDRLP4 512
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 516
ADDRLP4 512
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ASGNP4
ADDRLP4 516
INDIRP4
ADDRLP4 516
INDIRP4
INDIRF4
ADDRLP4 512
INDIRI4
ADDRLP4 216
ADDP4
INDIRF4
ADDRLP4 228
INDIRF4
MULF4
ADDF4
ASGNF4
line 5511
;5511:		cent->lerpOrigin[k]=cent->turAngles[k];
ADDRLP4 520
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 520
INDIRI4
ADDRLP4 524
INDIRP4
CNSTI4 928
ADDP4
ADDP4
ADDRLP4 520
INDIRI4
ADDRLP4 524
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
INDIRF4
ASGNF4
line 5512
;5512:	}
LABELV $2958
line 5508
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2957
line 5515
;5513:#endif
;5514:
;5515:	if (cent->currentState.weapon)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2961
line 5516
;5516:	{
line 5517
;5517:		weaponInfo_t *weapon = NULL;
ADDRLP4 512
CNSTP4 0
ASGNP4
line 5519
;5518:
;5519:		CG_RegisterWeapon(cent->currentState.weapon);
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 5521
;5520:
;5521:		weapon = &cg_weapons[cent->currentState.weapon];
ADDRLP4 512
CNSTI4 208
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 5522
;5522:		if (weapon)
ADDRLP4 512
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2963
line 5523
;5523:		{
line 5524
;5524:			if ( cg.time - cent->muzzleFlashTime <= MUZZLE_FLASH_TIME + 10 )
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
SUBI4
CNSTI4 30
GTI4 $2965
line 5525
;5525:			{	// Handle muzzle flashes
line 5529
;5526:				vec3_t flashorigin, flashdir;
;5527:				mdxaBone_t boltMatrix;
;5528:
;5529:				if (trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1))
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 588
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $2968
line 5530
;5530:				{
line 5532
;5531:					vec3_t boltAngle;
;5532:					VectorClear(boltAngle);
ADDRLP4 604
CNSTF4 0
ASGNF4
ADDRLP4 592+8
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 592+4
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 592
ADDRLP4 604
INDIRF4
ASGNF4
line 5533
;5533:					boltAngle[YAW] = cent->lerpAngles[YAW];
ADDRLP4 592+4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ASGNF4
line 5534
;5534: 					trap_G2API_GetBoltMatrix(cent->ghoul2, 1, 0, &boltMatrix, boltAngle, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 608
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 608
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 516
ARGP4
ADDRLP4 592
ARGP4
ADDRLP4 608
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 608
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 5536
;5535:					
;5536:					trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, flashorigin);
ADDRLP4 516
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 564
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 5537
;5537:					trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, POSITIVE_X, flashdir);
ADDRLP4 516
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 576
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 5539
;5538:
;5539:					if ( cent->currentState.eFlags & EF_ALT_FIRING )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2975
line 5540
;5540:					{	// Check the alt firing first.
line 5541
;5541:						if (weapon->altMuzzleEffect)
ADDRLP4 512
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2976
line 5542
;5542:						{
line 5543
;5543:							trap_FX_PlayEffectID(weapon->altMuzzleEffect, flashorigin, flashdir);
ADDRLP4 512
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 564
ARGP4
ADDRLP4 576
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 5544
;5544:						}
line 5545
;5545:					}
ADDRGP4 $2976
JUMPV
LABELV $2975
line 5547
;5546:					else
;5547:					{	// Regular firing
line 5548
;5548:						if (weapon->muzzleEffect)
ADDRLP4 512
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2979
line 5549
;5549:						{
line 5550
;5550:							trap_FX_PlayEffectID(weapon->muzzleEffect, flashorigin, flashdir);
ADDRLP4 512
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 564
ARGP4
ADDRLP4 576
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 5551
;5551:						}
LABELV $2979
line 5552
;5552:					}
LABELV $2976
line 5553
;5553:				}
LABELV $2968
line 5554
;5554:			}
LABELV $2965
line 5555
;5555:		}
LABELV $2963
line 5556
;5556:	}
LABELV $2961
line 5558
;5557:
;5558:	memset (&legs, 0, sizeof(legs));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5560
;5559:
;5560:	CG_SetGhoul2Info(&legs, cent);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetGhoul2Info
CALLV
pop
line 5562
;5561:
;5562:	VectorSet(legs.modelScale, 1,1,1);
ADDRLP4 4+196
CNSTF4 1065353216
ASGNF4
ADDRLP4 4+196+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4+196+8
CNSTF4 1065353216
ASGNF4
line 5563
;5563:	legs.radius = cent->currentState.g2radius;
ADDRLP4 4+92
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 5564
;5564:	VectorClear(legs.angles);
ADDRLP4 512
CNSTF4 0
ASGNF4
ADDRLP4 4+184+8
ADDRLP4 512
INDIRF4
ASGNF4
ADDRLP4 4+184+4
ADDRLP4 512
INDIRF4
ASGNF4
ADDRLP4 4+184
ADDRLP4 512
INDIRF4
ASGNF4
line 5567
;5565:
;5566:	// add the shadow
;5567:	shadow = CG_PlayerShadow( cent, &shadowPlane );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 452
ARGP4
ADDRLP4 516
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 516
INDIRI4
ASGNI4
line 5569
;5568:
;5569:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $2992
ADDRLP4 448
INDIRI4
CNSTI4 0
EQI4 $2992
line 5570
;5570:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 444
ADDRLP4 444
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 5571
;5571:	}
LABELV $2992
line 5572
;5572:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 444
ADDRLP4 444
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 5574
;5573:
;5574:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 4+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 5575
;5575:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 4+108
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 5576
;5576:	legs.shadowPlane = shadowPlane;
ADDRLP4 4+120
ADDRLP4 452
INDIRF4
ASGNF4
line 5577
;5577:	legs.renderfx = renderfx;
ADDRLP4 4+4
ADDRLP4 444
INDIRI4
ASGNI4
line 5578
;5578:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 4+64
ADDRLP4 4+52
INDIRB
ASGNB 12
line 5580
;5579:
;5580:	CG_G2AnimEntAngles( cent, legs.axis, rootAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 460
ARGP4
ADDRGP4 CG_G2AnimEntAngles
CALLV
pop
line 5582
;5581:
;5582:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3002
line 5583
;5583:	{
line 5584
;5584:		dead = qtrue;
ADDRLP4 456
CNSTI4 1
ASGNI4
line 5588
;5585:		//rww - since our angles are fixed when we're dead this shouldn't be an issue anyway
;5586:		//we need to render the dying/dead player because we are now spawning the body on respawn instead of death
;5587:		//return;
;5588:	}
LABELV $3002
line 5590
;5589:
;5590:	ScaleModelAxis(&legs);
ADDRLP4 4
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 5592
;5591:
;5592:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 232
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5594
;5593:
;5594:	VectorCopy(cent->turAngles, cg_entities[cent->currentState.number].turAngles);
ADDRLP4 520
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 520
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1016
ADDP4
ADDRLP4 520
INDIRP4
CNSTI4 1016
ADDP4
INDIRB
ASGNB 12
line 5595
;5595:	VectorCopy(legs.origin, cg_entities[cent->currentState.number].lerpOrigin);
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
ADDRLP4 4+52
INDIRB
ASGNB 12
line 5598
;5596:
;5597:	// get the animation state (after rotation, to allow feet shuffle)
;5598:	CG_G2EntAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+124
ARGP4
ADDRLP4 4+104
ARGP4
ADDRLP4 4+128
ARGP4
ADDRLP4 232+124
ARGP4
ADDRLP4 232+104
ARGP4
ADDRLP4 232+128
ARGP4
ADDRGP4 CG_G2EntAnimation
CALLV
pop
line 5601
;5599:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;5600:
;5601:	trap_R_AddRefEntityToScene(&legs);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 5606
;5602:
;5603:
;5604:	// Electricity
;5605:	//------------------------------------------------
;5606:	if ( cent->currentState.emplacedOwner > cg.time ) 
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $3013
line 5607
;5607:	{
line 5608
;5608:		int	dif = cent->currentState.emplacedOwner - cg.time;
ADDRLP4 524
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
ASGNI4
line 5610
;5609:
;5610:		if ( dif > 0 && random() > 0.4f )
ADDRLP4 524
INDIRI4
CNSTI4 0
LEI4 $3017
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
LEF4 $3017
line 5611
;5611:		{
line 5613
;5612:			// fade out over the last 500 ms
;5613:			int brightness = 255;
ADDRLP4 532
CNSTI4 255
ASGNI4
line 5615
;5614:			
;5615:			if ( dif < 500 )
ADDRLP4 524
INDIRI4
CNSTI4 500
GEI4 $3019
line 5616
;5616:			{
line 5617
;5617:				brightness = floor((dif - 500.0f) / 500.0f * 255.0f );
ADDRLP4 536
CNSTF4 1140457472
ASGNF4
CNSTF4 1132396544
ADDRLP4 524
INDIRI4
CVIF4 4
ADDRLP4 536
INDIRF4
SUBF4
ADDRLP4 536
INDIRF4
DIVF4
MULF4
ARGF4
ADDRLP4 540
ADDRGP4 floor
CALLF4
ASGNF4
ADDRLP4 532
ADDRLP4 540
INDIRF4
CVFI4 4
ASGNI4
line 5618
;5618:			}
LABELV $3019
line 5620
;5619:
;5620:			legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 5621
;5621:			legs.renderfx &= ~RF_MINLIGHT;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 5623
;5622:
;5623:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 5624
;5624:			legs.shaderRGBA[0] = legs.shaderRGBA[1] = legs.shaderRGBA[2] = brightness;
ADDRLP4 536
ADDRLP4 532
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRLP4 4+80+2
ADDRLP4 536
INDIRU1
ASGNU1
ADDRLP4 4+80+1
ADDRLP4 536
INDIRU1
ASGNU1
ADDRLP4 4+80
ADDRLP4 536
INDIRU1
ASGNU1
line 5625
;5625:			legs.shaderRGBA[3] = 255;
ADDRLP4 4+80+3
CNSTU1 255
ASGNU1
line 5627
;5626:
;5627:			if ( rand() & 1 )
ADDRLP4 540
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 540
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3031
line 5628
;5628:			{
line 5629
;5629:				legs.customShader = cgs.media.electricBodyShader;	
ADDRLP4 4+76
ADDRGP4 cgs+70296+396
INDIRI4
ASGNI4
line 5630
;5630:			}
ADDRGP4 $3032
JUMPV
LABELV $3031
line 5632
;5631:			else
;5632:			{
line 5633
;5633:				legs.customShader = cgs.media.electricBody2Shader;
ADDRLP4 4+76
ADDRGP4 cgs+70296+400
INDIRI4
ASGNI4
line 5634
;5634:			}
LABELV $3032
line 5636
;5635:
;5636:			trap_R_AddRefEntityToScene( &legs );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 5638
;5637:
;5638:			if ( random() > 0.9f )
ADDRLP4 544
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1063675494
LEF4 $3039
line 5639
;5639:				trap_S_StartSound ( NULL, cent->currentState.number, CHAN_AUTO, cgs.media.crackleSound );
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+676
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $3039
line 5640
;5640:		}
LABELV $3017
line 5641
;5641:	} 
LABELV $3013
line 5643
;5642:
;5643:	if (cent->currentState.genericenemyindex > cg.time)
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $3043
line 5644
;5644:	{
line 5645
;5645:		CG_DrawNoForceSphere(cent, cent->lerpOrigin, 1.4, cgs.media.ysalimariShader );
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+580
INDIRI4
ARGI4
ADDRGP4 CG_DrawNoForceSphere
CALLV
pop
line 5646
;5646:	}
LABELV $3043
line 5647
;5647:}
LABELV $2941
endproc CG_G2Animated 612 36
data
export cgFPLSState
align 4
LABELV cgFPLSState
byte 4 0
export CG_ForceFPLSPlayerModel
code
proc CG_ForceFPLSPlayerModel 84 44
line 5653
;5648://rww - here ends the majority of my g2animent stuff.
;5649:
;5650:int cgFPLSState = 0;
;5651:
;5652:void CG_ForceFPLSPlayerModel(centity_t *cent, clientInfo_t *ci)
;5653:{
line 5654
;5654:	int clientNum = cent->currentState.number;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 5657
;5655:	animation_t *anim;
;5656:
;5657:	if (cg_fpls.integer && !cg.renderingThirdPerson)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 cg_fpls+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $3049
ADDRGP4 cg+88
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $3049
line 5658
;5658:	{
line 5661
;5659:		int				skinHandle;
;5660:
;5661:		skinHandle = trap_R_RegisterSkin("models/players/kyle/model_fpls2.skin");
ADDRGP4 $3053
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 5663
;5662:
;5663:		trap_G2API_CleanGhoul2Models(&(ci->ghoul2Model));
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 5665
;5664:
;5665:		ci->torsoSkin = skinHandle;
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 5666
;5666:		trap_G2API_InitGhoul2Model(&ci->ghoul2Model, "models/players/kyle/model.glm", 0, ci->torsoSkin, 0, 0, 0);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 504
ADDP4
ARGP4
ADDRGP4 $3054
ARGP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 5668
;5667:
;5668:		ci->bolt_rhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*r_hand");
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $296
ARGP4
ADDRLP4 32
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 5670
;5669:		
;5670:		trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, cg.time, -1, -1);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 5671
;5671:		trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "upper_lumbar", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, cg.time);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 $303
ARGP4
ADDRGP4 vec3_origin
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
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 5672
;5672:		trap_G2API_SetBoneAngles(ci->ghoul2Model, 0, "cranium", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, cg.time);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 $307
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 48
CNSTI4 2
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 5674
;5673:
;5674:		ci->bolt_lhand = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*l_hand");
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $309
ARGP4
ADDRLP4 56
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 5675
;5675:		ci->bolt_head = trap_G2API_AddBolt(ci->ghoul2Model, 0, "*head_top");
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $310
ARGP4
ADDRLP4 64
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 5677
;5676:
;5677:		ci->bolt_motion = trap_G2API_AddBolt(ci->ghoul2Model, 0, "Motion");
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 72
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 5680
;5678:
;5679:		//We need a lower lumbar bolt for footsteps
;5680:		ci->bolt_llumbar = trap_G2API_AddBolt(ci->ghoul2Model, 0, "lower_lumbar");
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 80
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 5681
;5681:	}
ADDRGP4 $3050
JUMPV
LABELV $3049
line 5683
;5682:	else
;5683:	{
line 5684
;5684:		CG_RegisterClientModelname(ci, ci->modelName, ci->skinName, ci->teamName, cent->currentState.number);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 416
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterClientModelname
CALLI4
pop
line 5685
;5685:	}
LABELV $3050
line 5687
;5686:
;5687:	anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.legsAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 0
CNSTI4 28
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 5689
;5688:
;5689:	if (anim)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3059
line 5690
;5690:	{
line 5691
;5691:		int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 5692
;5692:		int firstFrame = anim->firstFrame;
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 5693
;5693:		int setFrame = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 5694
;5694:		float animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 24
CNSTF4 1112014848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 5696
;5695:
;5696:		if (anim->loopFrames != -1)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3061
line 5697
;5697:		{
line 5698
;5698:			flags |= BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 5699
;5699:		}
LABELV $3061
line 5701
;5700:
;5701:		if (cent->pe.legs.frame >= anim->firstFrame && cent->pe.legs.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $3063
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $3063
line 5702
;5702:		{
line 5703
;5703:			setFrame = cent->pe.legs.frame;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 5704
;5704:		}
LABELV $3063
line 5706
;5705:
;5706:		trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "model_root", firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, setFrame, 150);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 5708
;5707:
;5708:		cg_entities[clientNum].currentState.legsAnim = 0;
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+280
ADDP4
CNSTI4 0
ASGNI4
line 5709
;5709:	}
LABELV $3059
line 5711
;5710:
;5711:	anim = &bgGlobalAnimations[ (cg_entities[clientNum].currentState.torsoAnim & ~ANIM_TOGGLEBIT) ];
ADDRLP4 0
CNSTI4 28
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 5713
;5712:
;5713:	if (anim)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3068
line 5714
;5714:	{
line 5715
;5715:		int flags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 5716
;5716:		int firstFrame = anim->firstFrame;
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 5717
;5717:		int setFrame = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 5718
;5718:		float animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 24
CNSTF4 1112014848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 5720
;5719:
;5720:		if (anim->loopFrames != -1)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3070
line 5721
;5721:		{
line 5722
;5722:			flags |= BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 5723
;5723:		}
LABELV $3070
line 5725
;5724:
;5725:		if (cent->pe.torso.frame >= anim->firstFrame && cent->pe.torso.frame <= (anim->firstFrame + anim->numFrames))
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $3072
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GTI4 $3072
line 5726
;5726:		{
line 5727
;5727:			setFrame = cent->pe.torso.frame;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 5728
;5728:		}
LABELV $3072
line 5730
;5729:
;5730:		trap_G2API_SetBoneAnim(ci->ghoul2Model, 0, "lower_lumbar", firstFrame, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, setFrame, 150);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 5732
;5731:
;5732:		cg_entities[clientNum].currentState.torsoAnim = 0;
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+284
ADDP4
CNSTI4 0
ASGNI4
line 5733
;5733:	}
LABELV $3068
line 5735
;5734:
;5735:	trap_G2API_CleanGhoul2Models(&(cent->ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 5736
;5736:	trap_G2API_DuplicateGhoul2Instance(ci->ghoul2Model, &cent->ghoul2);
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 5737
;5737:	cg_entities[clientNum].ghoul2 = cent->ghoul2;
CNSTI4 1920
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ASGNP4
line 5738
;5738:}
LABELV $3048
endproc CG_ForceFPLSPlayerModel 84 44
export CG_Player
proc CG_Player 1388 44
line 5745
;5739:
;5740:/*
;5741:===============
;5742:CG_Player
;5743:===============
;5744:*/
;5745:void CG_Player( centity_t *cent ) {
line 5751
;5746:	clientInfo_t	*ci;
;5747:	refEntity_t		legs;
;5748:	refEntity_t		torso;
;5749:	int				clientNum;
;5750:	int				renderfx;
;5751:	qboolean		shadow = qfalse;
ADDRLP4 836
CNSTI4 0
ASGNI4
line 5752
;5752:	float			shadowPlane = 0;
ADDRLP4 540
CNSTF4 0
ASGNF4
line 5753
;5753:	qboolean		dead = qfalse;
ADDRLP4 864
CNSTI4 0
ASGNI4
line 5758
;5754:	vec3_t			rootAngles;
;5755:	refEntity_t		seeker;
;5756:	float			angle;
;5757:	vec3_t			angles, dir, elevated, enang, seekorg;
;5758:	int				iwantout = 0, successchange = 0;
ADDRLP4 772
CNSTI4 0
ASGNI4
ADDRLP4 860
CNSTI4 0
ASGNI4
line 5760
;5759:	int				team;
;5760:	float			prefig = 0;
ADDRLP4 856
CNSTF4 0
ASGNF4
line 5766
;5761:	centity_t		*enent;
;5762:	mdxaBone_t 		boltMatrix, lHandMatrix;
;5763:	vec3_t			efOrg;
;5764:	vec3_t			tDir;
;5765:	int				distVelBase;
;5766:	int				doAlpha = 0;
ADDRLP4 832
CNSTI4 0
ASGNI4
line 5767
;5767:	int				effectTimeLayer = 0;
ADDRLP4 756
CNSTI4 0
ASGNI4
line 5768
;5768:	qboolean		gotLHandMatrix = qfalse;
ADDRLP4 768
CNSTI4 0
ASGNI4
line 5769
;5769:	qboolean		g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 5771
;5770:	
;5771:	if(pug_demospec.integer!=-1 && !cg.renderingThirdPerson) {
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $3078
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $3078
line 5772
;5772:		if(cent - cg_entities == pug_demospec.integer) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1920
DIVI4
ADDRGP4 pug_demospec+12
INDIRI4
NEI4 $3082
line 5773
;5773:			cg.predictedPlayerState.pm_type = cg_entities[pug_demospec.integer].currentState.eFlags & EF_DEAD?PM_DEAD:PM_NORMAL;
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3090
ADDRLP4 896
CNSTI4 4
ASGNI4
ADDRGP4 $3091
JUMPV
LABELV $3090
ADDRLP4 896
CNSTI4 0
ASGNI4
LABELV $3091
ADDRGP4 cg+96+4
ADDRLP4 896
INDIRI4
ASGNI4
line 5774
;5774:			cg.predictedPlayerState.weapon = cg_entities[pug_demospec.integer].currentState.weapon;
ADDRGP4 cg+96+148
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+276
ADDP4
INDIRI4
ASGNI4
line 5775
;5775:			cg.predictedPlayerState.weaponstate = cg_entities[pug_demospec.integer].currentState.modelindex2;
ADDRGP4 cg+96+152
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+216
ADDP4
INDIRI4
ASGNI4
line 5778
;5776:			/*memcpy( cg.snap->ps.powerups, cg_entities[pug_demospec.integer].playerState->powerups, sizeof(int) * MAX_POWERUPS );
;5777:			memcpy( cg.predictedPlayerState.powerups, cg_entities[pug_demospec.integer].playerState->powerups, sizeof(int) * MAX_POWERUPS );*/
;5778:		}
LABELV $3082
line 5779
;5779:		cg.snap->ps.clientNum=pug_demospec.integer;
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
ADDRGP4 pug_demospec+12
INDIRI4
ASGNI4
line 5781
;5780:		//CG_Printf("%d.",cent->currentState.clientNum);
;5781:	}
LABELV $3078
line 5783
;5782:
;5783:	if (cgQueueLoad)
ADDRGP4 cgQueueLoad
INDIRI4
CNSTI4 0
EQI4 $3102
line 5784
;5784:	{
line 5785
;5785:		CG_ActualLoadDeferredPlayers();
ADDRGP4 CG_ActualLoadDeferredPlayers
CALLV
pop
line 5786
;5786:		cgQueueLoad = qfalse;
ADDRGP4 cgQueueLoad
CNSTI4 0
ASGNI4
line 5787
;5787:	}
LABELV $3102
line 5792
;5788:
;5789:	// the client number is stored in clientNum.  It can't be derived
;5790:	// from the entity number, because a single client may have
;5791:	// multiple corpses on the level using the same clientinfo
;5792:	clientNum = cent->currentState.clientNum;
ADDRLP4 760
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 5793
;5793:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 760
INDIRI4
CNSTI4 0
LTI4 $3106
ADDRLP4 760
INDIRI4
CNSTI4 32
LTI4 $3104
LABELV $3106
line 5794
;5794:		CG_Error( "Bad clientNum on player entity");
ADDRGP4 $3107
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 5795
;5795:	}
LABELV $3104
line 5796
;5796:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 828
CNSTI4 788
ADDRLP4 760
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 5800
;5797:
;5798:	// it is possible to see corpses from disconnected players that may
;5799:	// not have valid clientinfo
;5800:	if ( !ci->infoValid ) {
ADDRLP4 828
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $3109
line 5801
;5801:		return;
ADDRGP4 $3077
JUMPV
LABELV $3109
line 5804
;5802:	}
;5803:
;5804:	cent->ghoul2 = cg_entities[cent->currentState.number].ghoul2;
ADDRLP4 900
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 900
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 1920
ADDRLP4 900
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ASGNP4
line 5806
;5805:
;5806:	if (!cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3112
line 5807
;5807:	{ //not ready yet?
line 5811
;5808:#ifdef _DEBUG
;5809:		Com_Printf("WARNING: Client %i has a null ghoul2 instance\n", cent->currentState.number);
;5810:#endif
;5811:		if (cgs.clientinfo[cent->currentState.number].ghoul2Model &&
ADDRLP4 904
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 904
INDIRI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3077
ADDRLP4 904
INDIRI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRLP4 908
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 908
INDIRI4
CNSTI4 0
EQI4 $3077
line 5813
;5812:			trap_G2_HaveWeGhoul2Models(cgs.clientinfo[cent->currentState.number].ghoul2Model))
;5813:		{
line 5817
;5814:#ifdef _DEBUG
;5815:			Com_Printf("Clientinfo instance was valid, duplicating for cent\n");
;5816:#endif
;5817:			trap_G2API_DuplicateGhoul2Instance(cgs.clientinfo[cent->currentState.number].ghoul2Model, &cent->ghoul2);
ADDRLP4 912
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 788
ADDRLP4 912
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRLP4 912
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 5818
;5818:			cg_entities[cent->currentState.number].ghoul2 = cent->ghoul2;
ADDRLP4 916
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 916
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ADDRLP4 916
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ASGNP4
line 5819
;5819:		}
line 5820
;5820:		return;
ADDRGP4 $3077
JUMPV
LABELV $3112
line 5823
;5821:	}
;5822:
;5823:	g2HasWeapon = trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 904
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 536
ADDRLP4 904
INDIRI4
ASGNI4
line 5825
;5824:
;5825:	if (!g2HasWeapon)
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $3123
line 5826
;5826:	{ //force a redup of the weapon instance onto the client instance
line 5827
;5827:		cent->ghoul2weapon = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 5828
;5828:	}
LABELV $3123
line 5830
;5829:
;5830:	if (cent->torsoBolt && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 908
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 912
CNSTI4 0
ASGNI4
ADDRLP4 908
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 912
INDIRI4
EQI4 $3125
ADDRLP4 908
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 912
INDIRI4
NEI4 $3125
line 5831
;5831:	{ //he's alive and has a limb missing still, reattach it and reset the weapon
line 5832
;5832:		CG_ReattachLimb(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ReattachLimb
CALLV
pop
line 5833
;5833:	}
ADDRGP4 $3126
JUMPV
LABELV $3125
line 5834
;5834:	else if (cg_entities[cent->currentState.number].torsoBolt && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 916
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 920
CNSTI4 0
ASGNI4
CNSTI4 1920
ADDRLP4 916
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1012
ADDP4
INDIRI4
ADDRLP4 920
INDIRI4
EQI4 $3127
ADDRLP4 916
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 920
INDIRI4
NEI4 $3127
line 5835
;5835:	{ //It happens. (usually between odd level change events)
line 5836
;5836:		cent->torsoBolt = cg_entities[cent->currentState.number].torsoBolt;
ADDRLP4 924
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 924
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 1920
ADDRLP4 924
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1012
ADDP4
INDIRI4
ASGNI4
line 5837
;5837:		cg_entities[cent->currentState.number].torsoBolt = 0;
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1012
ADDP4
CNSTI4 0
ASGNI4
line 5838
;5838:		CG_ReattachLimb(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ReattachLimb
CALLV
pop
line 5839
;5839:	}
LABELV $3127
LABELV $3126
line 5841
;5840:
;5841:	if (cent->ghoul2 && cent->torsoBolt && (cent->torsoBolt == G2_MODELPART_RARM || cent->torsoBolt == G2_MODELPART_RHAND || cent->torsoBolt == G2_MODELPART_WAIST) && g2HasWeapon)
ADDRLP4 924
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 924
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3132
ADDRLP4 928
ADDRLP4 924
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ASGNI4
ADDRLP4 928
INDIRI4
CNSTI4 0
EQI4 $3132
ADDRLP4 928
INDIRI4
CNSTI4 13
EQI4 $3135
ADDRLP4 928
INDIRI4
CNSTI4 14
EQI4 $3135
ADDRLP4 928
INDIRI4
CNSTI4 11
NEI4 $3132
LABELV $3135
ADDRLP4 536
INDIRI4
CNSTI4 0
EQI4 $3132
line 5842
;5842:	{ //kill the weapon if the limb holding it is no longer on the model
line 5843
;5843:		trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 5844
;5844:		g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 5845
;5845:	}
LABELV $3132
line 5847
;5846:
;5847:	if (cent->currentState.teamowner && !cent->isATST)
ADDRLP4 932
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 936
CNSTI4 0
ASGNI4
ADDRLP4 932
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 936
INDIRI4
EQI4 $3136
ADDRLP4 932
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 936
INDIRI4
NEI4 $3136
line 5848
;5848:	{
line 5849
;5849:		cg_entities[cent->currentState.number].currentState.teamowner = cent->currentState.teamowner;
ADDRLP4 940
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 940
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+264
ADDP4
ADDRLP4 940
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 5850
;5850:		cg_entities[cent->currentState.number].isATST = cent->isATST;
ADDRLP4 944
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 944
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
ADDRLP4 944
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
line 5852
;5851:
;5852:		if (CG_RegisterClientModelname(&cgs.clientinfo[cent->currentState.number], cgs.clientinfo[cent->currentState.number].modelName, cgs.clientinfo[cent->currentState.number].skinName,
ADDRLP4 948
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 952
CNSTI4 788
ADDRLP4 948
INDIRI4
MULI4
ASGNI4
ADDRLP4 952
INDIRI4
ADDRGP4 cgs+43024
ADDP4
ARGP4
ADDRLP4 952
INDIRI4
ADDRGP4 cgs+43024+160
ADDP4
ARGP4
ADDRLP4 952
INDIRI4
ADDRGP4 cgs+43024+224
ADDP4
ARGP4
ADDRLP4 952
INDIRI4
ADDRGP4 cgs+43024+416
ADDP4
ARGP4
ADDRLP4 948
INDIRI4
ARGI4
ADDRLP4 956
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
EQI4 $3137
line 5854
;5853:			cgs.clientinfo[cent->currentState.number].teamName, cent->currentState.number))
;5854:		{
line 5855
;5855:			cent->isATST = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 5856
;5856:			cg_entities[cent->currentState.number].isATST = cent->isATST;
ADDRLP4 960
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 960
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
ADDRLP4 960
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
line 5857
;5857:			return;
ADDRGP4 $3077
JUMPV
line 5859
;5858:		}
;5859:	}
LABELV $3136
line 5860
;5860:	else if (!cent->currentState.teamowner && cent->isATST)
ADDRLP4 940
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 944
CNSTI4 0
ASGNI4
ADDRLP4 940
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 944
INDIRI4
NEI4 $3150
ADDRLP4 940
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 944
INDIRI4
EQI4 $3150
line 5861
;5861:	{
line 5862
;5862:		cg_entities[cent->currentState.number].currentState.teamowner = cent->currentState.teamowner;
ADDRLP4 948
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 948
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+264
ADDP4
ADDRLP4 948
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 5863
;5863:		cg_entities[cent->currentState.number].isATST = cent->isATST;
ADDRLP4 952
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 952
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
ADDRLP4 952
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
line 5865
;5864:
;5865:		if (CG_RegisterClientModelname(&cgs.clientinfo[cent->currentState.number], cgs.clientinfo[cent->currentState.number].modelName, cgs.clientinfo[cent->currentState.number].skinName,
ADDRLP4 956
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 960
CNSTI4 788
ADDRLP4 956
INDIRI4
MULI4
ASGNI4
ADDRLP4 960
INDIRI4
ADDRGP4 cgs+43024
ADDP4
ARGP4
ADDRLP4 960
INDIRI4
ADDRGP4 cgs+43024+160
ADDP4
ARGP4
ADDRLP4 960
INDIRI4
ADDRGP4 cgs+43024+224
ADDP4
ARGP4
ADDRLP4 960
INDIRI4
ADDRGP4 cgs+43024+416
ADDP4
ARGP4
ADDRLP4 956
INDIRI4
ARGI4
ADDRLP4 964
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 964
INDIRI4
CNSTI4 0
EQI4 $3154
line 5867
;5866:			cgs.clientinfo[cent->currentState.number].teamName, cent->currentState.number))
;5867:		{
line 5868
;5868:			cent->isATST = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 0
ASGNI4
line 5869
;5869:			cg_entities[cent->currentState.number].isATST = cent->isATST;
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 968
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1028
ADDP4
ADDRLP4 968
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
line 5870
;5870:			return;
ADDRGP4 $3077
JUMPV
LABELV $3154
line 5872
;5871:		}
;5872:	}
LABELV $3150
LABELV $3137
line 5874
;5873:
;5874:	if (cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 948
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 948
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $3164
ADDRLP4 952
CNSTI4 0
ASGNI4
ADDRLP4 948
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 952
INDIRI4
EQI4 $3164
ADDRLP4 948
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 952
INDIRI4
NEI4 $3164
line 5877
;5875:		cent->currentState.teamowner &&
;5876:		!cent->isATST)
;5877:	{
line 5878
;5878:		return;
ADDRGP4 $3077
JUMPV
LABELV $3164
line 5881
;5879:	}
;5880:
;5881:	if (!cent->trickAlphaTime || (cg.time - cent->trickAlphaTime) > 1000)
ADDRLP4 956
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
INDIRI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
EQI4 $3169
ADDRGP4 cg+64
INDIRI4
ADDRLP4 956
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $3166
LABELV $3169
line 5882
;5882:	{ //things got out of sync, perhaps a new client is trying to fill in this slot
line 5883
;5883:		cent->trickAlpha = 255;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 255
ASGNI4
line 5884
;5884:		cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5885
;5885:	}
LABELV $3166
line 5888
;5886:
;5887:	//If this client has tricked you.
;5888:	if (CG_IsMindTricked(cent->currentState.trickedentindex,
ADDRLP4 960
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 960
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 960
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 960
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 960
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
ADDRLP4 964
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 964
INDIRI4
CNSTI4 0
EQI4 $3171
line 5893
;5889:		cent->currentState.trickedentindex2,
;5890:		cent->currentState.trickedentindex3,
;5891:		cent->currentState.trickedentindex4,
;5892:		cg.snap->ps.clientNum))
;5893:	{
line 5894
;5894:		if (cent->trickAlpha > 1)
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CNSTI4 1
LEI4 $3174
line 5895
;5895:		{
line 5896
;5896:			cent->trickAlpha -= (cg.time - cent->trickAlphaTime)*0.5;
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 972
ADDRLP4 968
INDIRP4
CNSTI4 1904
ADDP4
ASGNP4
ADDRLP4 972
INDIRP4
ADDRLP4 972
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRGP4 cg+64
INDIRI4
ADDRLP4 968
INDIRP4
CNSTI4 1908
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 5897
;5897:			cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5899
;5898:
;5899:			if (cent->trickAlpha < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CNSTI4 0
GEI4 $3178
line 5900
;5900:			{
line 5901
;5901:				cent->trickAlpha = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 0
ASGNI4
line 5902
;5902:			}
LABELV $3178
line 5904
;5903:
;5904:			doAlpha = 1;
ADDRLP4 832
CNSTI4 1
ASGNI4
line 5905
;5905:		}
ADDRGP4 $3172
JUMPV
LABELV $3174
line 5907
;5906:		else
;5907:		{
line 5908
;5908:			doAlpha = 1;
ADDRLP4 832
CNSTI4 1
ASGNI4
line 5909
;5909:			cent->trickAlpha = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 1
ASGNI4
line 5910
;5910:			cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5911
;5911:			iwantout = 1;
ADDRLP4 772
CNSTI4 1
ASGNI4
line 5912
;5912:		}
line 5913
;5913:	}
ADDRGP4 $3172
JUMPV
LABELV $3171
line 5915
;5914:	else
;5915:	{
line 5916
;5916:		if (cent->trickAlpha < 255)
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CNSTI4 255
GEI4 $3181
line 5917
;5917:		{
line 5918
;5918:			cent->trickAlpha += (cg.time - cent->trickAlphaTime);
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 972
ADDRLP4 968
INDIRP4
CNSTI4 1904
ADDP4
ASGNP4
ADDRLP4 972
INDIRP4
ADDRLP4 972
INDIRP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
ADDRLP4 968
INDIRP4
CNSTI4 1908
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 5919
;5919:			cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5921
;5920:
;5921:			if (cent->trickAlpha > 255)
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CNSTI4 255
LEI4 $3185
line 5922
;5922:			{
line 5923
;5923:				cent->trickAlpha = 255;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 255
ASGNI4
line 5924
;5924:			}
LABELV $3185
line 5926
;5925:
;5926:			doAlpha = 1;
ADDRLP4 832
CNSTI4 1
ASGNI4
line 5927
;5927:		}
ADDRGP4 $3182
JUMPV
LABELV $3181
line 5929
;5928:		else
;5929:		{
line 5930
;5930:			cent->trickAlpha = 255;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 255
ASGNI4
line 5931
;5931:			cent->trickAlphaTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 5932
;5932:		}
LABELV $3182
line 5933
;5933:	}
LABELV $3172
line 5936
;5934:
;5935:	// get the player model information
;5936:	renderfx = 0;
ADDRLP4 776
CNSTI4 0
ASGNI4
line 5937
;5937:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $3188
line 5938
;5938:		if (!cg.renderingThirdPerson) {
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $3191
line 5939
;5939:			if (!cg_fpls.integer || cent->currentState.weapon != WP_SABER)
ADDRGP4 cg_fpls+12
INDIRI4
CNSTI4 0
EQI4 $3197
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
EQI4 $3192
LABELV $3197
line 5940
;5940:			{
line 5941
;5941:				renderfx = RF_THIRD_PERSON;			// only draw in mirrors
ADDRLP4 776
CNSTI4 2
ASGNI4
line 5942
;5942:			}
line 5943
;5943:		} else {
LABELV $3191
line 5953
;5944:			/*if (cg_cameraMode.integer) {
;5945:				iwantout = 1;
;5946:
;5947:				
;5948:				// goto minimal_add;
;5949:				
;5950:				// NOTENOTE Temporary
;5951:				return;
;5952:			}*/
;5953:		}
LABELV $3192
line 5954
;5954:	}
LABELV $3188
line 5963
;5955:
;5956:	// Update the player's client entity information regarding weapons.
;5957:	// Explanation:  The entitystate has a weapond defined on it.  The cliententity does as well.
;5958:	// The cliententity's weapon tells us what the ghoul2 instance on the cliententity has bolted to it.
;5959:	// If the entitystate and cliententity weapons differ, then the state's needs to be copied to the client.
;5960:	// Save the old weapon, to verify that it is or is not the same as the new weapon.
;5961:	// rww - Make sure weapons don't get set BEFORE cent->ghoul2 is initialized or else we'll have no
;5962:	// weapon bolted on
;5963:	if (cent->currentState.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3198
line 5964
;5964:	{
line 5965
;5965:		cent->ghoul2weapon = g2WeaponInstances[WP_SABER];
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
ADDRGP4 g2WeaponInstances+8
INDIRP4
ASGNP4
line 5966
;5966:	}
LABELV $3198
line 5968
;5967:
;5968:	if (cent->ghoul2 && 
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 968
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3201
ADDRLP4 968
INDIRP4
CNSTI4 960
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 968
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
CVPU4 4
EQU4 $3201
ADDRLP4 972
CNSTI4 0
ASGNI4
ADDRLP4 968
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 972
INDIRI4
NEI4 $3201
ADDRLP4 968
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 972
INDIRI4
NEI4 $3201
ADDRLP4 968
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 972
INDIRI4
NEI4 $3201
line 5971
;5969:		cent->ghoul2weapon != g2WeaponInstances[cent->currentState.weapon] &&
;5970:		!(cent->currentState.eFlags & EF_DEAD) && !cent->torsoBolt && !cent->isATST)
;5971:	{
line 5972
;5972:		CG_CopyG2WeaponInstance(cent->currentState.weapon, cent->ghoul2);
ADDRLP4 976
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 976
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 976
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_CopyG2WeaponInstance
CALLV
pop
line 5974
;5973:
;5974:		if (!(cg.snap->ps.pm_flags & PMF_FOLLOW))
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $3203
line 5975
;5975:		{
line 5976
;5976:			if (cent->weapon == WP_SABER && cent->weapon != cent->currentState.weapon && !cent->currentState.shouldtarget)
ADDRLP4 980
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 984
ADDRLP4 980
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 2
NEI4 $3206
ADDRLP4 984
INDIRI4
ADDRLP4 980
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
EQI4 $3206
ADDRLP4 980
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3206
line 5977
;5977:			{ //switching away from the saber
line 5978
;5978:				trap_S_StartSound(cent->lerpOrigin, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberoffquick.wav" ));
ADDRGP4 $3208
ARGP4
ADDRLP4 988
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 992
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 988
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 5979
;5979:			}
ADDRGP4 $3207
JUMPV
LABELV $3206
line 5980
;5980:			else if (cent->currentState.weapon == WP_SABER && cent->weapon != cent->currentState.weapon)
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
ADDRLP4 988
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 2
NEI4 $3209
ADDRLP4 988
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ADDRLP4 992
INDIRI4
EQI4 $3209
line 5981
;5981:			{ //switching to the saber
line 5982
;5982:				trap_S_StartSound(cent->lerpOrigin, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberon.wav" ));
ADDRGP4 $3211
ARGP4
ADDRLP4 996
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 1000
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 996
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 5983
;5983:			}
LABELV $3209
LABELV $3207
line 5984
;5984:		}
LABELV $3203
line 5986
;5985:
;5986:		cent->weapon = cent->currentState.weapon;
ADDRLP4 980
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 980
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 980
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 5987
;5987:		cent->ghoul2weapon = g2WeaponInstances[cent->currentState.weapon];
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 984
INDIRP4
CNSTI4 960
ADDP4
ADDRLP4 984
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
ASGNP4
line 5988
;5988:	}
ADDRGP4 $3202
JUMPV
LABELV $3201
line 5989
;5989:	else if ((cent->currentState.eFlags & EF_DEAD) || cent->torsoBolt)
ADDRLP4 976
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 980
CNSTI4 0
ASGNI4
ADDRLP4 976
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 980
INDIRI4
NEI4 $3214
ADDRLP4 976
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 980
INDIRI4
EQI4 $3212
LABELV $3214
line 5990
;5990:	{
line 5991
;5991:		cent->ghoul2weapon = NULL; //be sure to update after respawning/getting limb regrown
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 5992
;5992:	}
LABELV $3212
LABELV $3202
line 5995
;5993:
;5994:	
;5995:	memset (&legs, 0, sizeof(legs));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5997
;5996:
;5997:	CG_SetGhoul2Info(&legs, cent);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetGhoul2Info
CALLV
pop
line 5999
;5998:
;5999:	VectorSet(legs.modelScale, 1,1,1);
ADDRLP4 0+196
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+196+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+196+8
CNSTF4 1065353216
ASGNF4
line 6000
;6000:	legs.radius = 64;
ADDRLP4 0+92
CNSTF4 1115684864
ASGNF4
line 6001
;6001:	VectorClear(legs.angles);
ADDRLP4 984
CNSTF4 0
ASGNF4
ADDRLP4 0+184+8
ADDRLP4 984
INDIRF4
ASGNF4
ADDRLP4 0+184+4
ADDRLP4 984
INDIRF4
ASGNF4
ADDRLP4 0+184
ADDRLP4 984
INDIRF4
ASGNF4
line 6003
;6002:
;6003:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3226
line 6004
;6004:	{
line 6005
;6005:		legs.radius = 400;
ADDRLP4 0+92
CNSTF4 1137180672
ASGNF4
line 6006
;6006:	}
LABELV $3226
line 6010
;6007:
;6008:// minimal_add:
;6009:
;6010:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
ADDRLP4 852
CNSTI4 788
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
ASGNI4
line 6012
;6011:
;6012:	if (cgs.gametype >= GT_TEAM && cg_drawFriend.integer &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $3231
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $3231
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $3239
ADDRLP4 988
ADDRGP4 pug_demospec+12
INDIRI4
ASGNI4
ADDRGP4 $3240
JUMPV
LABELV $3239
ADDRLP4 988
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
LABELV $3240
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 988
INDIRI4
EQI4 $3231
line 6014
;6013:		cent->currentState.number != (pug_demospec.integer!=-1?pug_demospec.integer:cg.snap->ps.clientNum))			// Don't show a sprite above a player's own head in 3rd person.
;6014:	{	// If the view is either a spectator or on the same team as this character, show a symbol above their head.
line 6015
;6015:		if ((cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.snap->ps.persistant[PERS_TEAM] == team) &&
ADDRLP4 992
CNSTI4 336
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 992
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $3245
ADDRGP4 cg+36
INDIRP4
ADDRLP4 992
INDIRI4
ADDP4
INDIRI4
ADDRLP4 852
INDIRI4
NEI4 $3241
LABELV $3245
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $3241
line 6017
;6016:			!(cent->currentState.eFlags & EF_DEAD))
;6017:		{
line 6018
;6018:			if (team == TEAM_RED)
ADDRLP4 852
INDIRI4
CNSTI4 1
NEI4 $3246
line 6019
;6019:			{
line 6020
;6020:				CG_PlayerFloatSprite( cent, cgs.media.teamRedShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+176
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 6021
;6021:			}
ADDRGP4 $3247
JUMPV
LABELV $3246
line 6023
;6022:			else	// if (team == TEAM_BLUE)
;6023:			{
line 6024
;6024:				CG_PlayerFloatSprite( cent, cgs.media.teamBlueShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+180
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 6025
;6025:			}
LABELV $3247
line 6026
;6026:		}
LABELV $3241
line 6027
;6027:	}
LABELV $3231
line 6029
;6028:
;6029:	if (cgs.gametype == GT_JEDIMASTER && cg_drawFriend.integer &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $3252
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $3252
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $3260
ADDRLP4 992
ADDRGP4 pug_demospec+12
INDIRI4
ASGNI4
ADDRGP4 $3261
JUMPV
LABELV $3260
ADDRLP4 992
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
LABELV $3261
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 992
INDIRI4
EQI4 $3252
line 6031
;6030:		cent->currentState.number != (pug_demospec.integer!=-1?pug_demospec.integer:cg.snap->ps.clientNum))			// Don't show a sprite above a player's own head in 3rd person.
;6031:	{	// If the view is either a spectator or on the same team as this character, show a symbol above their head.
line 6032
;6032:		if ((cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.snap->ps.persistant[PERS_TEAM] == team) &&
ADDRLP4 996
CNSTI4 336
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 996
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $3266
ADDRGP4 cg+36
INDIRP4
ADDRLP4 996
INDIRI4
ADDP4
INDIRI4
ADDRLP4 852
INDIRI4
NEI4 $3262
LABELV $3266
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $3262
line 6034
;6033:			!(cent->currentState.eFlags & EF_DEAD))
;6034:		{
line 6035
;6035:			if (CG_ThereIsAMaster())
ADDRLP4 1000
ADDRGP4 CG_ThereIsAMaster
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 0
EQI4 $3267
line 6036
;6036:			{
line 6037
;6037:				if (!cg.snap->ps.isJediMaster)
ADDRGP4 cg+36
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3269
line 6038
;6038:				{
line 6039
;6039:					if (!cent->currentState.isJediMaster)
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3272
line 6040
;6040:					{
line 6041
;6041:						CG_PlayerFloatSprite( cent, cgs.media.teamRedShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+70296+176
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 6042
;6042:					}
LABELV $3272
line 6043
;6043:				}
LABELV $3269
line 6044
;6044:			}
LABELV $3267
line 6045
;6045:		}
LABELV $3262
line 6046
;6046:	}
LABELV $3252
line 6048
;6047:
;6048:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3276
line 6049
;6049:	{
line 6050
;6050:		goto doEssentialOne;
ADDRGP4 $3278
JUMPV
LABELV $3276
line 6054
;6051:	}
;6052:
;6053:	// add the shadow
;6054:	shadow = CG_PlayerShadow( cent, &shadowPlane );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 540
ARGP4
ADDRLP4 996
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 836
ADDRLP4 996
INDIRI4
ASGNI4
line 6056
;6055:
;6056:	if ( (cent->currentState.eFlags & EF_SEEKERDRONE) || cent->currentState.genericenemyindex != -1 )
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
NEI4 $3281
ADDRLP4 1000
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3279
LABELV $3281
line 6057
;6057:	{
line 6058
;6058:		memset( &seeker, 0, sizeof(seeker) );
ADDRLP4 276
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6060
;6059:
;6060:		VectorCopy(cent->lerpOrigin, elevated);
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6061
;6061:		elevated[2] += 40;
ADDRLP4 224+8
ADDRLP4 224+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 6063
;6062:
;6063:		VectorCopy( elevated, seeker.lightingOrigin );
ADDRLP4 276+108
ADDRLP4 224
INDIRB
ASGNB 12
line 6064
;6064:		seeker.shadowPlane = shadowPlane;
ADDRLP4 276+120
ADDRLP4 540
INDIRF4
ASGNF4
line 6065
;6065:		seeker.renderfx = 0; //renderfx;
ADDRLP4 276+4
CNSTI4 0
ASGNI4
line 6068
;6066:							 //don't show in first person?
;6067:
;6068:		angle = ((cg.time / 12) & 255) * (M_PI * 2) / 255;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
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
line 6069
;6069:		dir[0] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1004
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 1004
INDIRF4
MULF4
ASGNF4
line 6070
;6070:		dir[1] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1008
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1008
INDIRF4
MULF4
ASGNF4
line 6071
;6071:		dir[2] = cos(angle) * 5;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1012
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1084227584
ADDRLP4 1012
INDIRF4
MULF4
ASGNF4
line 6072
;6072:		VectorAdd(elevated, dir, seeker.origin);
ADDRLP4 276+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 276+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 276+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6074
;6073:
;6074:		VectorCopy(seeker.origin, seekorg);
ADDRLP4 868
ADDRLP4 276+52
INDIRB
ASGNB 12
line 6076
;6075:
;6076:		if (cent->currentState.genericenemyindex > 1024)
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 1024
LEI4 $3299
line 6077
;6077:		{
line 6078
;6078:			prefig = (cent->currentState.genericenemyindex-cg.time)/80;
ADDRLP4 856
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CNSTI4 80
DIVI4
CVIF4 4
ASGNF4
line 6080
;6079:
;6080:			if (prefig > 55)
ADDRLP4 856
INDIRF4
CNSTF4 1113325568
LEF4 $3302
line 6081
;6081:			{
line 6082
;6082:				prefig = 55;
ADDRLP4 856
CNSTF4 1113325568
ASGNF4
line 6083
;6083:			}
ADDRGP4 $3303
JUMPV
LABELV $3302
line 6084
;6084:			else if (prefig < 1)
ADDRLP4 856
INDIRF4
CNSTF4 1065353216
GEF4 $3304
line 6085
;6085:			{
line 6086
;6086:				prefig = 1;
ADDRLP4 856
CNSTF4 1065353216
ASGNF4
line 6087
;6087:			}
LABELV $3304
LABELV $3303
line 6089
;6088:
;6089:			elevated[2] -= 55-prefig;
ADDRLP4 224+8
ADDRLP4 224+8
INDIRF4
CNSTF4 1113325568
ADDRLP4 856
INDIRF4
SUBF4
SUBF4
ASGNF4
line 6091
;6090:
;6091:			angle = ((cg.time / 12) & 255) * (M_PI * 2) / 255;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
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
line 6092
;6092:			dir[0] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1016
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 1016
INDIRF4
MULF4
ASGNF4
line 6093
;6093:			dir[1] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1020
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1020
INDIRF4
MULF4
ASGNF4
line 6094
;6094:			dir[2] = cos(angle) * 5;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1024
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1084227584
ADDRLP4 1024
INDIRF4
MULF4
ASGNF4
line 6095
;6095:			VectorAdd(elevated, dir, seeker.origin);
ADDRLP4 276+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 276+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 276+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6096
;6096:		}
ADDRGP4 $3300
JUMPV
LABELV $3299
line 6097
;6097:		else if (cent->currentState.genericenemyindex != ENTITYNUM_NONE && cent->currentState.genericenemyindex != -1)
ADDRLP4 1016
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1016
INDIRI4
CNSTI4 1023
EQI4 $3319
ADDRLP4 1016
INDIRI4
CNSTI4 -1
EQI4 $3319
line 6098
;6098:		{
line 6099
;6099:			enent = &cg_entities[cent->currentState.genericenemyindex];
ADDRLP4 880
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 6101
;6100:
;6101:			if (enent)
ADDRLP4 880
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3321
line 6102
;6102:			{
line 6103
;6103:				VectorSubtract(enent->lerpOrigin, seekorg, enang);
ADDRLP4 1020
ADDRLP4 880
INDIRP4
ASGNP4
ADDRLP4 884
ADDRLP4 1020
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRLP4 868
INDIRF4
SUBF4
ASGNF4
ADDRLP4 884+4
ADDRLP4 1020
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 868+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 884+8
ADDRLP4 880
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 868+8
INDIRF4
SUBF4
ASGNF4
line 6104
;6104:				VectorNormalize(enang);
ADDRLP4 884
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6105
;6105:				vectoangles(enang, angles);
ADDRLP4 884
ARGP4
ADDRLP4 252
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6106
;6106:				successchange = 1;
ADDRLP4 860
CNSTI4 1
ASGNI4
line 6107
;6107:			}
LABELV $3321
line 6108
;6108:		}
LABELV $3319
LABELV $3300
line 6110
;6109:
;6110:		if (!successchange)
ADDRLP4 860
INDIRI4
CNSTI4 0
NEI4 $3327
line 6111
;6111:		{
line 6112
;6112:			angles[0] = sin(angle) * 30;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1020
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 252
CNSTF4 1106247680
ADDRLP4 1020
INDIRF4
MULF4
ASGNF4
line 6113
;6113:			angles[1] = (angle * 180 / M_PI) + 90;
ADDRLP4 252+4
CNSTF4 1127481344
ADDRLP4 236
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 6114
;6114:			if (angles[1] > 360)
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
LEF4 $3330
line 6115
;6115:				angles[1] -= 360;
ADDRLP4 252+4
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $3330
line 6116
;6116:			angles[2] = 0;
ADDRLP4 252+8
CNSTF4 0
ASGNF4
line 6117
;6117:		}
LABELV $3327
line 6119
;6118:
;6119:		AnglesToAxis( angles, seeker.axis );
ADDRLP4 252
ARGP4
ADDRLP4 276+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 6121
;6120:
;6121:		seeker.hModel = trap_R_RegisterModel("models/items/remote.md3");
ADDRGP4 $3337
ARGP4
ADDRLP4 1020
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 276+8
ADDRLP4 1020
INDIRI4
ASGNI4
line 6122
;6122:		trap_R_AddRefEntityToScene( &seeker );
ADDRLP4 276
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6123
;6123:	}
LABELV $3279
LABELV $3278
line 6127
;6124:
;6125:doEssentialOne:
;6126:	// add a water splash if partially in and out of water
;6127:	CG_PlayerSplash( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 6129
;6128:
;6129:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $3338
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $3338
line 6130
;6130:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 776
ADDRLP4 776
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 6131
;6131:	}
LABELV $3338
line 6132
;6132:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 776
ADDRLP4 776
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 6135
;6133:
;6134:	// if we've been hit, display proper fullscreen fx
;6135:	CG_PlayerHitFX(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerHitFX
CALLV
pop
line 6137
;6136:
;6137:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6139
;6138:
;6139:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 0+108
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6140
;6140:	legs.shadowPlane = shadowPlane;
ADDRLP4 0+120
ADDRLP4 540
INDIRF4
ASGNF4
line 6141
;6141:	legs.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 776
INDIRI4
ASGNI4
line 6142
;6142:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 0+64
ADDRLP4 0+52
INDIRB
ASGNB 12
line 6144
;6143:
;6144:	CG_G2PlayerAngles( cent, legs.axis, rootAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 840
ARGP4
ADDRGP4 CG_G2PlayerAngles
CALLV
pop
line 6152
;6145:
;6146:	//This call is mainly just to reconstruct the skeleton. But we'll get the left hand matrix while we're at it.
;6147:	//If we don't reconstruct the skeleton after setting the bone angles, we will get bad bolt points on the model
;6148:	//(e.g. the weapon model bolt will look "lagged") if there's no other GetBoltMatrix call for the rest of the
;6149:	//frame. Yes, this is stupid and needs to be fixed properly.
;6150:	//The current solution is to force it not to reconstruct the skeleton for the first GBM call in G2PlayerAngles.
;6151:	//It works and we end up only reconstructing it once, but it doesn't seem like the best solution.
;6152:	trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &lHandMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1004
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+516
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6153
;6153:	gotLHandMatrix = qtrue;
ADDRLP4 768
CNSTI4 1
ASGNI4
line 6155
;6154:
;6155:	if (cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $3352
line 6156
;6156:	{
line 6157
;6157:		if (cgFPLSState != 0)
ADDRGP4 cgFPLSState
INDIRI4
CNSTI4 0
EQI4 $3353
line 6158
;6158:		{
line 6159
;6159:			CG_ForceFPLSPlayerModel(cent, ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 CG_ForceFPLSPlayerModel
CALLV
pop
line 6160
;6160:			cgFPLSState = 0;
ADDRGP4 cgFPLSState
CNSTI4 0
ASGNI4
line 6161
;6161:			return;
ADDRGP4 $3077
JUMPV
line 6163
;6162:		}
;6163:	}
LABELV $3352
line 6164
;6164:	else if (ci->team == TEAM_SPECTATOR || (cg.snap && (cg.snap->ps.pm_flags & PMF_FOLLOW)))
ADDRLP4 828
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 3
EQI4 $3361
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3357
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $3357
LABELV $3361
line 6165
;6165:	{ //don't allow this when spectating
line 6166
;6166:		if (cgFPLSState != 0)
ADDRGP4 cgFPLSState
INDIRI4
CNSTI4 0
EQI4 $3362
line 6167
;6167:		{
line 6168
;6168:			trap_Cvar_Set("cg_fpls", "0");
ADDRGP4 $3364
ARGP4
ADDRGP4 $3365
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6169
;6169:			cg_fpls.integer = 0;
ADDRGP4 cg_fpls+12
CNSTI4 0
ASGNI4
line 6171
;6170:
;6171:			CG_ForceFPLSPlayerModel(cent, ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 CG_ForceFPLSPlayerModel
CALLV
pop
line 6172
;6172:			cgFPLSState = 0;
ADDRGP4 cgFPLSState
CNSTI4 0
ASGNI4
line 6173
;6173:			return;
ADDRGP4 $3077
JUMPV
LABELV $3362
line 6176
;6174:		}
;6175:
;6176:		if (cg_fpls.integer)
ADDRGP4 cg_fpls+12
INDIRI4
CNSTI4 0
EQI4 $3358
line 6177
;6177:		{
line 6178
;6178:			trap_Cvar_Set("cg_fpls", "0");
ADDRGP4 $3364
ARGP4
ADDRGP4 $3365
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6179
;6179:		}
line 6180
;6180:	}
ADDRGP4 $3358
JUMPV
LABELV $3357
line 6182
;6181:	else
;6182:	{
line 6183
;6183:		if (cg_fpls.integer && cent->currentState.weapon == WP_SABER && cg.snap && cent->currentState.number == cg.snap->ps.clientNum)
ADDRGP4 cg_fpls+12
INDIRI4
CNSTI4 0
EQI4 $3370
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $3370
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3370
ADDRLP4 1008
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $3370
line 6184
;6184:		{
line 6186
;6185:
;6186:			if (cgFPLSState != cg_fpls.integer)
ADDRGP4 cgFPLSState
INDIRI4
ADDRGP4 cg_fpls+12
INDIRI4
EQI4 $3371
line 6187
;6187:			{
line 6188
;6188:				CG_ForceFPLSPlayerModel(cent, ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 CG_ForceFPLSPlayerModel
CALLV
pop
line 6189
;6189:				cgFPLSState = cg_fpls.integer;
ADDRGP4 cgFPLSState
ADDRGP4 cg_fpls+12
INDIRI4
ASGNI4
line 6190
;6190:				return;
ADDRGP4 $3077
JUMPV
line 6198
;6191:			}
;6192:
;6193:			/*
;6194:			mdxaBone_t 		headMatrix;
;6195:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_head, &headMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
;6196:			trap_G2API_GiveMeVectorFromMatrix(&headMatrix, ORIGIN, cg.refdef.vieworg);
;6197:			*/
;6198:		}
LABELV $3370
line 6199
;6199:		else if (!cg_fpls.integer && cgFPLSState)
ADDRLP4 1012
CNSTI4 0
ASGNI4
ADDRGP4 cg_fpls+12
INDIRI4
ADDRLP4 1012
INDIRI4
NEI4 $3379
ADDRGP4 cgFPLSState
INDIRI4
ADDRLP4 1012
INDIRI4
EQI4 $3379
line 6200
;6200:		{
line 6201
;6201:			if (cgFPLSState != cg_fpls.integer)
ADDRGP4 cgFPLSState
INDIRI4
ADDRGP4 cg_fpls+12
INDIRI4
EQI4 $3382
line 6202
;6202:			{
line 6203
;6203:				CG_ForceFPLSPlayerModel(cent, ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 CG_ForceFPLSPlayerModel
CALLV
pop
line 6204
;6204:				cgFPLSState = cg_fpls.integer;
ADDRGP4 cgFPLSState
ADDRGP4 cg_fpls+12
INDIRI4
ASGNI4
line 6205
;6205:				return;
ADDRGP4 $3077
JUMPV
LABELV $3382
line 6207
;6206:			}
;6207:		}
LABELV $3379
LABELV $3371
line 6208
;6208:	}
LABELV $3358
LABELV $3353
line 6210
;6209:
;6210:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3386
line 6211
;6211:	{
line 6212
;6212:		dead = qtrue;
ADDRLP4 864
CNSTI4 1
ASGNI4
line 6216
;6213:		//rww - since our angles are fixed when we're dead this shouldn't be an issue anyway
;6214:		//we need to render the dying/dead player because we are now spawning the body on respawn instead of death
;6215:		//return;
;6216:	}
LABELV $3386
line 6218
;6217:
;6218:	ScaleModelAxis(&legs);
ADDRLP4 0
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 6220
;6219:
;6220:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 544
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6222
;6221:
;6222:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3388
line 6223
;6223:	{
line 6224
;6224:		goto doEssentialTwo;
ADDRGP4 $3390
JUMPV
LABELV $3388
line 6228
;6225:	}
;6226:
;6227:	//rww - force speed "trail" effect
;6228:	if (!(cent->currentState.powerups & (1 << PW_SPEED)) || doAlpha || !cg_speedTrail.integer)
ADDRLP4 1008
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 1008
INDIRI4
EQI4 $3395
ADDRLP4 832
INDIRI4
ADDRLP4 1008
INDIRI4
NEI4 $3395
ADDRGP4 cg_speedTrail+12
INDIRI4
ADDRLP4 1008
INDIRI4
NEI4 $3391
LABELV $3395
line 6229
;6229:	{
line 6230
;6230:		cent->frame_minus1_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 0
ASGNI4
line 6231
;6231:		cent->frame_minus2_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1468
ADDP4
CNSTI4 0
ASGNI4
line 6232
;6232:	}
LABELV $3391
line 6234
;6233:
;6234:	if (cent->frame_minus1.ghoul2 != cent->ghoul2)
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1012
INDIRP4
CNSTI4 1248
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1012
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
EQU4 $3396
line 6235
;6235:	{
line 6236
;6236:		cent->frame_minus1_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 0
ASGNI4
line 6237
;6237:	}
LABELV $3396
line 6238
;6238:	if (cent->frame_minus2.ghoul2 != cent->ghoul2)
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1016
INDIRP4
CNSTI4 1460
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1016
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
EQU4 $3398
line 6239
;6239:	{
line 6240
;6240:		cent->frame_minus2_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1468
ADDP4
CNSTI4 0
ASGNI4
line 6241
;6241:	}
LABELV $3398
line 6243
;6242:
;6243:	VectorCopy(cent->currentState.pos.trDelta, tDir);
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 6245
;6244:
;6245:	distVelBase = SPEED_TRAIL_DISTANCE*(VectorNormalize(tDir)*0.004);
ADDRLP4 264
ARGP4
ADDRLP4 1020
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 764
CNSTF4 1086324736
CNSTF4 998445679
ADDRLP4 1020
INDIRF4
MULF4
MULF4
CVFI4 4
ASGNI4
line 6247
;6246:
;6247:	if (cent->frame_minus1.ghoul2 && cent->frame_minus1_refreshed)
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 1248
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3400
ADDRLP4 1024
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3400
line 6248
;6248:	{
line 6249
;6249:		cent->frame_minus1.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
ASGNP4
ADDRLP4 1028
INDIRP4
ADDRLP4 1028
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 6250
;6250:		cent->frame_minus1.shaderRGBA[3] = 100;
ADDRFP4 0
INDIRP4
CNSTI4 1123
ADDP4
CNSTU1 100
ASGNU1
line 6256
;6251:
;6252:		//rww - if the client gets a bad framerate we will only receive frame positions
;6253:		//once per frame anyway, so we might end up with speed trails very spread out.
;6254:		//in order to avoid that, we'll get the direction of the last trail from the player
;6255:		//and place the trail refent a set distance from the player location this frame
;6256:		VectorSubtract(cent->frame_minus1.origin, legs.origin, tDir);
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
ADDRLP4 1032
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
ADDRLP4 0+52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 264+4
ADDRLP4 1032
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 0+52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 264+8
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
INDIRF4
ADDRLP4 0+52+8
INDIRF4
SUBF4
ASGNF4
line 6257
;6257:		VectorNormalize(tDir);
ADDRLP4 264
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6259
;6258:
;6259:		cent->frame_minus1.origin[0] = legs.origin[0]+tDir[0]*distVelBase;
ADDRFP4 0
INDIRP4
CNSTI4 1092
ADDP4
ADDRLP4 0+52
INDIRF4
ADDRLP4 264
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6260
;6260:		cent->frame_minus1.origin[1] = legs.origin[1]+tDir[1]*distVelBase;
ADDRFP4 0
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 0+52+4
INDIRF4
ADDRLP4 264+4
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6261
;6261:		cent->frame_minus1.origin[2] = legs.origin[2]+tDir[2]*distVelBase;
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
ADDRLP4 0+52+8
INDIRF4
ADDRLP4 264+8
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6263
;6262:
;6263:		trap_R_AddRefEntityToScene(&cent->frame_minus1);
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6264
;6264:	}
LABELV $3400
line 6266
;6265:
;6266:	if (cent->frame_minus2.ghoul2 && cent->frame_minus2_refreshed)
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CNSTI4 1460
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3416
ADDRLP4 1028
INDIRP4
CNSTI4 1468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3416
line 6267
;6267:	{
line 6268
;6268:		cent->frame_minus2.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
ASGNP4
ADDRLP4 1032
INDIRP4
ADDRLP4 1032
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 6269
;6269:		cent->frame_minus2.shaderRGBA[3] = 50;
ADDRFP4 0
INDIRP4
CNSTI4 1335
ADDP4
CNSTU1 50
ASGNU1
line 6272
;6270:
;6271:		//Same as above but do it between trail points instead of the player and first trail entry
;6272:		VectorSubtract(cent->frame_minus2.origin, cent->frame_minus1.origin, tDir);
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
ADDRLP4 1036
INDIRP4
CNSTI4 1304
ADDP4
INDIRF4
ADDRLP4 1036
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 264+4
ADDRLP4 1036
INDIRP4
CNSTI4 1308
ADDP4
INDIRF4
ADDRLP4 1036
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264+8
ADDRLP4 1040
INDIRP4
CNSTI4 1312
ADDP4
INDIRF4
ADDRLP4 1040
INDIRP4
CNSTI4 1100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6273
;6273:		VectorNormalize(tDir);
ADDRLP4 264
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6275
;6274:
;6275:		cent->frame_minus2.origin[0] = cent->frame_minus1.origin[0]+tDir[0]*distVelBase;
ADDRLP4 1044
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI4 1304
ADDP4
ADDRLP4 1044
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
ADDRLP4 264
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6276
;6276:		cent->frame_minus2.origin[1] = cent->frame_minus1.origin[1]+tDir[1]*distVelBase;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 1308
ADDP4
ADDRLP4 1048
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 264+4
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6277
;6277:		cent->frame_minus2.origin[2] = cent->frame_minus1.origin[2]+tDir[2]*distVelBase;
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 1312
ADDP4
ADDRLP4 1052
INDIRP4
CNSTI4 1100
ADDP4
INDIRF4
ADDRLP4 264+8
INDIRF4
ADDRLP4 764
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 6279
;6278:
;6279:		trap_R_AddRefEntityToScene(&cent->frame_minus2);
ADDRFP4 0
INDIRP4
CNSTI4 1252
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6280
;6280:	}
LABELV $3416
LABELV $3390
line 6283
;6281:
;6282:doEssentialTwo:
;6283:	VectorCopy(cent->turAngles, cg_entities[cent->currentState.number].turAngles);
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 1032
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1016
ADDP4
ADDRLP4 1032
INDIRP4
CNSTI4 1016
ADDP4
INDIRB
ASGNB 12
line 6284
;6284:	VectorCopy(legs.origin, cg_entities[cent->currentState.number].lerpOrigin);
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
ADDRLP4 0+52
INDIRB
ASGNB 12
line 6287
;6285:
;6286:	// get the animation state (after rotation, to allow feet shuffle)
;6287:	CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+124
ARGP4
ADDRLP4 0+104
ARGP4
ADDRLP4 0+128
ARGP4
ADDRLP4 544+124
ARGP4
ADDRLP4 544+104
ARGP4
ADDRLP4 544+128
ARGP4
ADDRGP4 CG_PlayerAnimation
CALLV
pop
line 6291
;6288:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;6289:
;6290:	//Need these set because we use them in other functions (cent pointer differs from cg_entities values)
;6291:	cg_entities[cent->currentState.number].pe.torso.frame = cent->pe.torso.frame;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 1036
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+644+64+8
ADDP4
ADDRLP4 1036
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 6292
;6292:	cg_entities[cent->currentState.number].pe.legs.frame = cent->pe.legs.frame;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 1040
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+644+8
ADDP4
ADDRLP4 1040
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
ASGNI4
line 6295
;6293:
;6294:	// add the talk baloon or disconnect icon
;6295:	CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 6297
;6296:
;6297:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3436
line 6298
;6298:	{ //keep track of death anim frame for when we copy off the bodyqueue
line 6299
;6299:		cgs.clientinfo[cent->currentState.number].frame = cent->pe.torso.frame;
ADDRLP4 1044
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 788
ADDRLP4 1044
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+76
ADDP4
ADDRLP4 1044
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 6300
;6300:	}
LABELV $3436
line 6302
;6301:
;6302:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3440
line 6303
;6303:	{
line 6304
;6304:		goto doEssentialThree;
ADDRGP4 $3442
JUMPV
LABELV $3440
line 6310
;6305:	}
;6306:
;6307:	//rww - render effects multiple times to compensate for low framerate? This won't do much because
;6308:	//the effect still gets rendered in this frame and expires, possibly before the next frame. So
;6309:	//it is disabled for now (setting effectTimeLayer to 0 after one play)
;6310:	if (cent->trailTime < cg.time)
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
GEI4 $3443
line 6311
;6311:	{
line 6312
;6312:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6313
;6313:	}
LABELV $3443
line 6316
;6314:
;6315:	//compensate for up to 300ms
;6316:	effectTimeLayer = (300 - (cent->trailTime - cg.time));
ADDRLP4 756
CNSTI4 300
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
SUBI4
ASGNI4
line 6318
;6317:
;6318:	if (effectTimeLayer < 50)
ADDRLP4 756
INDIRI4
CNSTI4 50
GEI4 $3448
line 6319
;6319:	{ //play at least once
line 6320
;6320:		effectTimeLayer = 50;
ADDRLP4 756
CNSTI4 50
ASGNI4
line 6321
;6321:	}
LABELV $3448
line 6323
;6322:
;6323:	cent->trailTime = cg.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 6325
;6324:
;6325:	if (cent->currentState.activeForcePass > FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 3
LEI4 $3451
line 6326
;6326:	{
line 6327
;6327:		int effectTimeLayerL = effectTimeLayer;
ADDRLP4 1044
ADDRLP4 756
INDIRI4
ASGNI4
line 6331
;6328:
;6329:		vec3_t axis[3];
;6330:		vec3_t tAng, fAng, fxDir;
;6331:		int realForceLev = (cent->currentState.activeForcePass - FORCE_LEVEL_3);
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 6333
;6332:
;6333:		VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1124
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1124
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1100+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 6335
;6334:
;6335:		VectorSet( fAng, cent->pe.torso.pitchAngle, cent->pe.torso.yawAngle, 0 );
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
ADDRLP4 1128
INDIRP4
CNSTI4 736
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 1128
INDIRP4
CNSTI4 728
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1088+8
CNSTF4 0
ASGNF4
line 6337
;6336:
;6337:		AngleVectors( fAng, fxDir, NULL, NULL );
ADDRLP4 1088
ARGP4
ADDRLP4 1112
ARGP4
ADDRLP4 1132
CNSTP4 0
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 6340
;6338:
;6339:		//trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
;6340:		if (!gotLHandMatrix)
ADDRLP4 768
INDIRI4
CNSTI4 0
NEI4 $3457
line 6341
;6341:		{
line 6342
;6342:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &lHandMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1136
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+516
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6343
;6343:			gotLHandMatrix = qtrue;
ADDRLP4 768
CNSTI4 1
ASGNI4
line 6344
;6344:		}
LABELV $3457
line 6346
;6345:
;6346:		efOrg[0] = lHandMatrix.matrix[0][3];
ADDRLP4 240
ADDRLP4 488+12
INDIRF4
ASGNF4
line 6347
;6347:		efOrg[1] = lHandMatrix.matrix[1][3];
ADDRLP4 240+4
ADDRLP4 488+16+12
INDIRF4
ASGNF4
line 6348
;6348:		efOrg[2] = lHandMatrix.matrix[2][3];
ADDRLP4 240+8
ADDRLP4 488+32+12
INDIRF4
ASGNF4
line 6350
;6349:
;6350:		AnglesToAxis( fAng, axis );
ADDRLP4 1088
ARGP4
ADDRLP4 1052
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
ADDRGP4 $3471
JUMPV
LABELV $3470
line 6353
;6351:	
;6352:		while (effectTimeLayerL > 0)
;6353:		{
line 6354
;6354:			if ( realForceLev > FORCE_LEVEL_2 )
ADDRLP4 1048
INDIRI4
CNSTI4 2
LEI4 $3473
line 6355
;6355:			{//arc
line 6357
;6356:				//trap_FX_PlayEffectID( cgs.effects.forceLightningWide, efOrg, fxDir );
;6357:				trap_FX_PlayEntityEffectID(cgs.effects.forceDrainWide, efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 cgs+71564+156
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1136
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6358
;6358:			}
ADDRGP4 $3474
JUMPV
LABELV $3473
line 6360
;6359:			else
;6360:			{//line
line 6362
;6361:				//trap_FX_PlayEffectID( cgs.effects.forceLightning, efOrg, fxDir );
;6362:				trap_FX_PlayEntityEffectID(cgs.effects.forceDrain, efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 cgs+71564+152
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1136
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6363
;6363:			}
LABELV $3474
line 6365
;6364:
;6365:			effectTimeLayerL = 0;//-= 50;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 6366
;6366:		}
LABELV $3471
line 6352
ADDRLP4 1044
INDIRI4
CNSTI4 0
GTI4 $3470
line 6375
;6367:
;6368:		/*
;6369:		if (cent->bolt4 < cg.time)
;6370:		{
;6371:			cent->bolt4 = cg.time + 100;
;6372:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/force/drain.wav") );
;6373:		}
;6374:		*/
;6375:	}
ADDRGP4 $3452
JUMPV
LABELV $3451
line 6376
;6376:	else if ( cent->currentState.activeForcePass )
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3479
line 6377
;6377:	{//doing the electrocuting
line 6378
;6378:		int effectTimeLayerL = effectTimeLayer;
ADDRLP4 1044
ADDRLP4 756
INDIRI4
ASGNI4
line 6382
;6379:
;6380:		vec3_t axis[3];
;6381:		vec3_t tAng, fAng, fxDir;
;6382:		VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
ADDRLP4 1120
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1096+4
ADDRLP4 1120
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1096+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 6384
;6383:
;6384:		VectorSet( fAng, cent->pe.torso.pitchAngle, cent->pe.torso.yawAngle, 0 );
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1124
INDIRP4
CNSTI4 736
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1084+4
ADDRLP4 1124
INDIRP4
CNSTI4 728
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1084+8
CNSTF4 0
ASGNF4
line 6386
;6385:
;6386:		AngleVectors( fAng, fxDir, NULL, NULL );
ADDRLP4 1084
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1128
CNSTP4 0
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 6389
;6387:
;6388:		//trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
;6389:		if (!gotLHandMatrix)
ADDRLP4 768
INDIRI4
CNSTI4 0
NEI4 $3485
line 6390
;6390:		{
line 6391
;6391:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &lHandMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1132
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+516
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRLP4 1132
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 1132
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1132
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6392
;6392:			gotLHandMatrix = qtrue;
ADDRLP4 768
CNSTI4 1
ASGNI4
line 6393
;6393:		}
LABELV $3485
line 6395
;6394:
;6395:		efOrg[0] = lHandMatrix.matrix[0][3];
ADDRLP4 240
ADDRLP4 488+12
INDIRF4
ASGNF4
line 6396
;6396:		efOrg[1] = lHandMatrix.matrix[1][3];
ADDRLP4 240+4
ADDRLP4 488+16+12
INDIRF4
ASGNF4
line 6397
;6397:		efOrg[2] = lHandMatrix.matrix[2][3];
ADDRLP4 240+8
ADDRLP4 488+32+12
INDIRF4
ASGNF4
line 6399
;6398:
;6399:		AnglesToAxis( fAng, axis );
ADDRLP4 1084
ARGP4
ADDRLP4 1048
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
ADDRGP4 $3499
JUMPV
LABELV $3498
line 6402
;6400:	
;6401:		while (effectTimeLayerL > 0)
;6402:		{
line 6403
;6403:			if ( cent->currentState.activeForcePass > FORCE_LEVEL_2 )
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 2
LEI4 $3501
line 6404
;6404:			{//arc
line 6406
;6405:				//trap_FX_PlayEffectID( cgs.effects.forceLightningWide, efOrg, fxDir );
;6406:				trap_FX_PlayEntityEffectID(cgs.effects.forceLightningWide, efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 cgs+71564+148
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6407
;6407:			}
ADDRGP4 $3502
JUMPV
LABELV $3501
line 6409
;6408:			else
;6409:			{//line
line 6411
;6410:				//trap_FX_PlayEffectID( cgs.effects.forceLightning, efOrg, fxDir );
;6411:				trap_FX_PlayEntityEffectID(cgs.effects.forceLightning, efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 cgs+71564+144
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6412
;6412:			}
LABELV $3502
line 6414
;6413:
;6414:			effectTimeLayerL = 0;//-= 50;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 6415
;6415:		}
LABELV $3499
line 6401
ADDRLP4 1044
INDIRI4
CNSTI4 0
GTI4 $3498
line 6424
;6416:
;6417:		/*
;6418:		if (cent->bolt4 < cg.time)
;6419:		{
;6420:			cent->bolt4 = cg.time + 100;
;6421:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/force/lightning.wav") );
;6422:		}
;6423:		*/
;6424:	}
LABELV $3479
LABELV $3452
line 6426
;6425:
;6426:	if ( cent->currentState.powerups & (1 << PW_DISINT_4) )
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $3507
line 6427
;6427:	{
line 6430
;6428:		vec3_t tAng;
;6429:		//VectorSet( tAng, 0, cent->pe.torso.yawAngle, 0 );
;6430:		VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1056
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1044+4
ADDRLP4 1056
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1044+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 6433
;6431:
;6432:		//trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
;6433:		if (!gotLHandMatrix)
ADDRLP4 768
INDIRI4
CNSTI4 0
NEI4 $3511
line 6434
;6434:		{
line 6435
;6435:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_lhand, &lHandMatrix, cent->turAngles, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1060
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+516
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1060
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6436
;6436:			gotLHandMatrix = qtrue;
ADDRLP4 768
CNSTI4 1
ASGNI4
line 6437
;6437:		}
LABELV $3511
line 6439
;6438:
;6439:		efOrg[0] = lHandMatrix.matrix[0][3];
ADDRLP4 240
ADDRLP4 488+12
INDIRF4
ASGNF4
line 6440
;6440:		efOrg[1] = lHandMatrix.matrix[1][3];
ADDRLP4 240+4
ADDRLP4 488+16+12
INDIRF4
ASGNF4
line 6441
;6441:		efOrg[2] = lHandMatrix.matrix[2][3];
ADDRLP4 240+8
ADDRLP4 488+32+12
INDIRF4
ASGNF4
line 6443
;6442:
;6443:		if ( (cent->currentState.forcePowersActive & (1 << FP_GRIP)) &&
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1060
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 1064
INDIRI4
EQI4 $3524
ADDRGP4 cg+88
INDIRI4
ADDRLP4 1064
INDIRI4
NEI4 $3528
ADDRLP4 1060
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $3524
LABELV $3528
line 6445
;6444:			(cg.renderingThirdPerson || cent->currentState.number != cg.snap->ps.clientNum) )
;6445:		{
line 6448
;6446:			vec3_t boltDir;
;6447:			vec3_t origBolt;
;6448:			VectorCopy(efOrg, origBolt);
ADDRLP4 1080
ADDRLP4 240
INDIRB
ASGNB 12
line 6449
;6449:			trap_G2API_GiveMeVectorFromMatrix( &lHandMatrix, NEGATIVE_Y, boltDir );
ADDRLP4 488
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1068
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6451
;6450:
;6451:			CG_ForceGripEffect( efOrg );
ADDRLP4 240
ARGP4
ADDRGP4 CG_ForceGripEffect
CALLV
pop
line 6452
;6452:			CG_ForceGripEffect( efOrg );
ADDRLP4 240
ARGP4
ADDRGP4 CG_ForceGripEffect
CALLV
pop
line 6455
;6453:
;6454:			//Render a scaled version of the model's hand with a n337 looking shader
;6455:			{
line 6460
;6456:				const char *rotateBone;
;6457:				char *limbName;
;6458:				char *limbCapName;
;6459:				vec3_t armAng;
;6460:				float wv = sin( cg.time * 0.003f ) * 0.08f + 0.1f;
CNSTF4 994352038
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 1120
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 1104
CNSTF4 1034147594
ADDRLP4 1120
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 6462
;6461:
;6462:				rotateBone = "lradius";
ADDRLP4 1108
ADDRGP4 $3530
ASGNP4
line 6463
;6463:				limbName = "l_arm";
ADDRLP4 1112
ADDRGP4 $3531
ASGNP4
line 6464
;6464:				limbCapName = "l_arm_cap_torso_off";
ADDRLP4 1116
ADDRGP4 $3532
ASGNP4
line 6466
;6465:
;6466:				if (cent->grip_arm.ghoul2 && trap_G2_HaveWeGhoul2Models(cent->grip_arm.ghoul2))
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3533
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $3533
line 6467
;6467:				{
line 6468
;6468:					trap_G2API_CleanGhoul2Models(&(cent->grip_arm.ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 6469
;6469:				}
LABELV $3533
line 6471
;6470:
;6471:				memset( &cent->grip_arm, 0, sizeof(cent->grip_arm) );
ADDRFP4 0
INDIRP4
CNSTI4 1692
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6473
;6472:
;6473:				VectorCopy(origBolt, efOrg);
ADDRLP4 240
ADDRLP4 1080
INDIRB
ASGNB 12
line 6474
;6474:				trap_G2API_GiveMeVectorFromMatrix( &lHandMatrix, NEGATIVE_Y, boltDir );
ADDRLP4 488
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1068
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6475
;6475:				efOrg[0] += boltDir[0]*8;
ADDRLP4 240
ADDRLP4 240
INDIRF4
CNSTF4 1090519040
ADDRLP4 1068
INDIRF4
MULF4
ADDF4
ASGNF4
line 6476
;6476:				efOrg[1] += boltDir[1]*8;
ADDRLP4 240+4
ADDRLP4 240+4
INDIRF4
CNSTF4 1090519040
ADDRLP4 1068+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 6477
;6477:				efOrg[2] += boltDir[2]*8;
ADDRLP4 240+8
ADDRLP4 240+8
INDIRF4
CNSTF4 1090519040
ADDRLP4 1068+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 6478
;6478:				trap_G2API_GiveMeVectorFromMatrix( &lHandMatrix, NEGATIVE_X, boltDir );
ADDRLP4 488
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1068
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6479
;6479:				efOrg[0] -= boltDir[0]*4;
ADDRLP4 240
ADDRLP4 240
INDIRF4
CNSTF4 1082130432
ADDRLP4 1068
INDIRF4
MULF4
SUBF4
ASGNF4
line 6480
;6480:				efOrg[1] -= boltDir[1]*4;
ADDRLP4 240+4
ADDRLP4 240+4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1068+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 6481
;6481:				efOrg[2] -= boltDir[2]*4;
ADDRLP4 240+8
ADDRLP4 240+8
INDIRF4
CNSTF4 1082130432
ADDRLP4 1068+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 6484
;6482:
;6483:				//efOrg[2] += 8;
;6484:				efOrg[2] -= 4;
ADDRLP4 240+8
ADDRLP4 240+8
INDIRF4
CNSTF4 1082130432
SUBF4
ASGNF4
line 6486
;6485:
;6486:				VectorCopy(efOrg, cent->grip_arm.origin);
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ADDRLP4 240
INDIRB
ASGNB 12
line 6487
;6487:				VectorCopy(cent->grip_arm.origin, cent->grip_arm.lightingOrigin);
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 1800
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 1744
ADDP4
INDIRB
ASGNB 12
line 6490
;6488:
;6489:				//VectorCopy(cent->lerpAngles, armAng);
;6490:				VectorAdd(vec3_origin, rootAngles, armAng);
ADDRLP4 1092
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 840
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 840+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1092+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 840+8
INDIRF4
ADDF4
ASGNF4
line 6492
;6491:				//armAng[ROLL] = -90;
;6492:				armAng[ROLL] = 0;
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 6493
;6493:				armAng[PITCH] = 0;
ADDRLP4 1092
CNSTF4 0
ASGNF4
line 6494
;6494:				AnglesToAxis(armAng, cent->grip_arm.axis);
ADDRLP4 1092
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1704
ADDP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 6496
;6495:				
;6496:				trap_G2API_DuplicateGhoul2Instance(cent->ghoul2, &cent->grip_arm.ghoul2);
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 1900
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 6498
;6497:
;6498:				trap_G2API_SetRootSurface(cent->grip_arm.ghoul2, 0, limbName);
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_G2API_SetRootSurface
CALLI4
pop
line 6499
;6499:				trap_G2API_SetNewOrigin(cent->grip_arm.ghoul2, trap_G2API_AddBolt(cent->grip_arm.ghoul2, 0, rotateBone));
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetNewOrigin
CALLI4
pop
line 6500
;6500:				trap_G2API_SetSurfaceOnOff(cent->grip_arm.ghoul2, limbCapName, 0);
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
INDIRP4
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 6502
;6501:
;6502:				cent->grip_arm.modelScale[0] = 1;//+(wv*6);
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTF4 1065353216
ASGNF4
line 6503
;6503:				cent->grip_arm.modelScale[1] = 1;//+(wv*6);
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
CNSTF4 1065353216
ASGNF4
line 6504
;6504:				cent->grip_arm.modelScale[2] = 1;//+(wv*6);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
CNSTF4 1065353216
ASGNF4
line 6505
;6505:				ScaleModelAxis(&cent->grip_arm);
ADDRFP4 0
INDIRP4
CNSTI4 1692
ADDP4
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 6507
;6506:
;6507:				cent->grip_arm.radius = 64;
ADDRFP4 0
INDIRP4
CNSTI4 1784
ADDP4
CNSTF4 1115684864
ASGNF4
line 6509
;6508:
;6509:				cent->grip_arm.customShader = trap_R_RegisterShader( "gfx/misc/red_portashield" );
ADDRGP4 $3551
ARGP4
ADDRLP4 1144
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
ADDRLP4 1144
INDIRI4
ASGNI4
line 6511
;6510:				
;6511:				cent->grip_arm.renderfx |= RF_RGB_TINT;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 1696
ADDP4
ASGNP4
ADDRLP4 1148
INDIRP4
ADDRLP4 1148
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 6512
;6512:				cent->grip_arm.shaderRGBA[0] = 255 - (wv*900);
ADDRLP4 1156
CNSTF4 1132396544
CNSTF4 1147207680
ADDRLP4 1104
INDIRF4
MULF4
SUBF4
ASGNF4
ADDRLP4 1160
CNSTF4 1325400064
ASGNF4
ADDRLP4 1156
INDIRF4
ADDRLP4 1160
INDIRF4
LTF4 $3553
ADDRLP4 1152
ADDRLP4 1156
INDIRF4
ADDRLP4 1160
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3554
JUMPV
LABELV $3553
ADDRLP4 1152
ADDRLP4 1156
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3554
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
ADDRLP4 1152
INDIRU4
CVUU1 4
ASGNU1
line 6513
;6513:				if (cent->grip_arm.shaderRGBA[0] < 30)
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRU1
CVUI4 1
CNSTI4 30
GEI4 $3555
line 6514
;6514:				{
line 6515
;6515:					cent->grip_arm.shaderRGBA[0] = 30;
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
CNSTU1 30
ASGNU1
line 6516
;6516:				}
LABELV $3555
line 6517
;6517:				if (cent->grip_arm.shaderRGBA[0] > 255)
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRU1
CVUI4 1
CNSTI4 255
LEI4 $3557
line 6518
;6518:				{
line 6519
;6519:					cent->grip_arm.shaderRGBA[0] = 255;
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
CNSTU1 255
ASGNU1
line 6520
;6520:				}
LABELV $3557
line 6521
;6521:				cent->grip_arm.shaderRGBA[1] = cent->grip_arm.shaderRGBA[2] = cent->grip_arm.shaderRGBA[0];
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
ADDRLP4 1164
INDIRP4
CNSTI4 1772
ADDP4
INDIRU1
ASGNU1
ADDRLP4 1164
INDIRP4
CNSTI4 1774
ADDP4
ADDRLP4 1168
INDIRU1
ASGNU1
ADDRLP4 1164
INDIRP4
CNSTI4 1773
ADDP4
ADDRLP4 1168
INDIRU1
ASGNU1
line 6523
;6522:				
;6523:				trap_R_AddRefEntityToScene( &cent->grip_arm );
ADDRFP4 0
INDIRP4
CNSTI4 1692
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6524
;6524:			}
line 6525
;6525:		}
ADDRGP4 $3525
JUMPV
LABELV $3524
line 6526
;6526:		else if (!(cent->currentState.forcePowersActive & (1 << FP_GRIP)))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $3559
line 6527
;6527:		{
line 6528
;6528:			CG_ForcePushBlur( efOrg );
ADDRLP4 240
ARGP4
ADDRGP4 CG_ForcePushBlur
CALLV
pop
line 6529
;6529:		}
LABELV $3559
LABELV $3525
line 6530
;6530:	}
LABELV $3507
line 6532
;6531:
;6532:	if (cent->currentState.weapon == WP_STUN_BATON && cent->currentState.number == cg.snap->ps.clientNum)
ADDRLP4 1044
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 1
NEI4 $3561
ADDRLP4 1044
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $3561
line 6533
;6533:	{
line 6534
;6534:		trap_S_AddLoopingSound( cent->currentState.number, cg.refdef.vieworg, vec3_origin, 
ADDRGP4 $3566
ARGP4
ADDRLP4 1048
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 cg+3616+24
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 6536
;6535:			trap_S_RegisterSound( "sound/weapons/baton/idle.wav" ) );
;6536:	}
LABELV $3561
line 6540
;6537:
;6538:	//NOTE: All effects that should be visible during mindtrick should go above here
;6539:
;6540:	if (iwantout)
ADDRLP4 772
INDIRI4
CNSTI4 0
EQI4 $3567
line 6541
;6541:	{
line 6542
;6542:		goto stillDoSaber;
ADDRGP4 $3569
JUMPV
LABELV $3567
line 6545
;6543:		//return;
;6544:	}
;6545:	else if (doAlpha)
ADDRLP4 832
INDIRI4
CNSTI4 0
EQI4 $3570
line 6546
;6546:	{
line 6547
;6547:		legs.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 6548
;6548:		legs.shaderRGBA[3] = cent->trickAlpha;
ADDRLP4 0+80+3
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 6550
;6549:
;6550:		if (legs.shaderRGBA[3] < 1)
ADDRLP4 0+80+3
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $3575
line 6551
;6551:		{ //don't cancel it out even if it's < 1
line 6552
;6552:			legs.shaderRGBA[3] = 1;
ADDRLP4 0+80+3
CNSTU1 1
ASGNU1
line 6553
;6553:		}
LABELV $3575
line 6554
;6554:	}
LABELV $3570
line 6556
;6555:
;6556:	if (cg_entities[cent->currentState.number].teamPowerEffectTime > cg.time)
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $3581
line 6557
;6557:	{
line 6558
;6558:		if (cg_entities[cent->currentState.number].teamPowerType == 3)
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
INDIRI4
CNSTI4 3
NEI4 $3585
line 6559
;6559:		{ //absorb is a somewhat different effect entirely
line 6561
;6560:			//Guess I'll take care of it where it's always been, just checking these values instead.
;6561:		}
ADDRGP4 $3586
JUMPV
LABELV $3585
line 6563
;6562:		else
;6563:		{
line 6567
;6564:			vec4_t preCol;
;6565:			int preRFX;
;6566:
;6567:			preRFX = legs.renderfx;
ADDRLP4 1064
ADDRLP4 0+4
INDIRI4
ASGNI4
line 6569
;6568:
;6569:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 6570
;6570:			legs.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 6572
;6571:
;6572:			preCol[0] = legs.shaderRGBA[0];
ADDRLP4 1048
ADDRLP4 0+80
INDIRU1
CVUI4 1
CVIF4 4
ASGNF4
line 6573
;6573:			preCol[1] = legs.shaderRGBA[1];
ADDRLP4 1048+4
ADDRLP4 0+80+1
INDIRU1
CVUI4 1
CVIF4 4
ASGNF4
line 6574
;6574:			preCol[2] = legs.shaderRGBA[2];
ADDRLP4 1048+8
ADDRLP4 0+80+2
INDIRU1
CVUI4 1
CVIF4 4
ASGNF4
line 6575
;6575:			preCol[3] = legs.shaderRGBA[3];
ADDRLP4 1048+12
ADDRLP4 0+80+3
INDIRU1
CVUI4 1
CVIF4 4
ASGNF4
line 6577
;6576:
;6577:			if (cg_entities[cent->currentState.number].teamPowerType == 1)
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
INDIRI4
CNSTI4 1
NEI4 $3601
line 6578
;6578:			{ //heal
line 6579
;6579:				legs.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 6580
;6580:				legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 6581
;6581:				legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 6582
;6582:			}
ADDRGP4 $3602
JUMPV
LABELV $3601
line 6583
;6583:			else if (cg_entities[cent->currentState.number].teamPowerType == 0)
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3609
line 6584
;6584:			{ //regen
line 6585
;6585:				legs.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 6586
;6586:				legs.shaderRGBA[1] = 0;
ADDRLP4 0+80+1
CNSTU1 0
ASGNU1
line 6587
;6587:				legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 6588
;6588:			}
ADDRGP4 $3610
JUMPV
LABELV $3609
line 6590
;6589:			else
;6590:			{ //drain
line 6591
;6591:				legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 6592
;6592:				legs.shaderRGBA[1] = 0;
ADDRLP4 0+80+1
CNSTU1 0
ASGNU1
line 6593
;6593:				legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 6594
;6594:			}
LABELV $3610
LABELV $3602
line 6596
;6595:
;6596:			legs.shaderRGBA[3] = ((cg_entities[cent->currentState.number].teamPowerEffectTime - cg.time)/8);
ADDRLP4 0+80+3
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CNSTI4 8
DIVI4
CVIU4 4
CVUU1 4
ASGNU1
line 6598
;6597:
;6598:			legs.customShader = trap_R_RegisterShader( "powerups/ysalimarishell" );
ADDRGP4 $3627
ARGP4
ADDRLP4 1068
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+76
ADDRLP4 1068
INDIRI4
ASGNI4
line 6599
;6599:			trap_R_AddRefEntityToScene(&legs);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6601
;6600:
;6601:			legs.customShader = 0;
ADDRLP4 0+76
CNSTI4 0
ASGNI4
line 6602
;6602:			legs.renderfx = preRFX;
ADDRLP4 0+4
ADDRLP4 1064
INDIRI4
ASGNI4
line 6603
;6603:			legs.shaderRGBA[0] = preCol[0];
ADDRLP4 1076
ADDRLP4 1048
INDIRF4
ASGNF4
ADDRLP4 1080
CNSTF4 1325400064
ASGNF4
ADDRLP4 1076
INDIRF4
ADDRLP4 1080
INDIRF4
LTF4 $3632
ADDRLP4 1072
ADDRLP4 1076
INDIRF4
ADDRLP4 1080
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3633
JUMPV
LABELV $3632
ADDRLP4 1072
ADDRLP4 1076
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3633
ADDRLP4 0+80
ADDRLP4 1072
INDIRU4
CVUU1 4
ASGNU1
line 6604
;6604:			legs.shaderRGBA[1] = preCol[1];
ADDRLP4 1088
ADDRLP4 1048+4
INDIRF4
ASGNF4
ADDRLP4 1092
CNSTF4 1325400064
ASGNF4
ADDRLP4 1088
INDIRF4
ADDRLP4 1092
INDIRF4
LTF4 $3638
ADDRLP4 1084
ADDRLP4 1088
INDIRF4
ADDRLP4 1092
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3639
JUMPV
LABELV $3638
ADDRLP4 1084
ADDRLP4 1088
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3639
ADDRLP4 0+80+1
ADDRLP4 1084
INDIRU4
CVUU1 4
ASGNU1
line 6605
;6605:			legs.shaderRGBA[2] = preCol[2];
ADDRLP4 1100
ADDRLP4 1048+8
INDIRF4
ASGNF4
ADDRLP4 1104
CNSTF4 1325400064
ASGNF4
ADDRLP4 1100
INDIRF4
ADDRLP4 1104
INDIRF4
LTF4 $3644
ADDRLP4 1096
ADDRLP4 1100
INDIRF4
ADDRLP4 1104
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3645
JUMPV
LABELV $3644
ADDRLP4 1096
ADDRLP4 1100
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3645
ADDRLP4 0+80+2
ADDRLP4 1096
INDIRU4
CVUU1 4
ASGNU1
line 6606
;6606:			legs.shaderRGBA[3] = preCol[3];
ADDRLP4 1112
ADDRLP4 1048+12
INDIRF4
ASGNF4
ADDRLP4 1116
CNSTF4 1325400064
ASGNF4
ADDRLP4 1112
INDIRF4
ADDRLP4 1116
INDIRF4
LTF4 $3650
ADDRLP4 1108
ADDRLP4 1112
INDIRF4
ADDRLP4 1116
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $3651
JUMPV
LABELV $3650
ADDRLP4 1108
ADDRLP4 1112
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $3651
ADDRLP4 0+80+3
ADDRLP4 1108
INDIRU4
CVUU1 4
ASGNU1
line 6607
;6607:		}
LABELV $3586
line 6608
;6608:	}
LABELV $3581
line 6611
;6609:
;6610:	//If you've tricked this client.
;6611:	if (CG_IsMindTricked(cg.snap->ps.fd.forceMindtrickTargetIndex,
ADDRGP4 cg+36
INDIRP4
CNSTI4 1200
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $3652
line 6616
;6612:		cg.snap->ps.fd.forceMindtrickTargetIndex2,
;6613:		cg.snap->ps.fd.forceMindtrickTargetIndex3,
;6614:		cg.snap->ps.fd.forceMindtrickTargetIndex4,
;6615:		cent->currentState.number))
;6616:	{
line 6617
;6617:		if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3658
line 6618
;6618:		{
line 6622
;6619:			vec3_t efOrg;
;6620:			vec3_t tAng, fxAng;
;6621:			vec3_t axis[3];
;6622:			int effectTimeLayerC = effectTimeLayer;
ADDRLP4 1052
ADDRLP4 756
INDIRI4
ASGNI4
line 6626
;6623:			sharedBoltInterface_t fxObj;
;6624:
;6625:			//VectorSet( tAng, 0, cent->pe.torso.yawAngle, 0 );
;6626:			VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1160
ADDRLP4 1184
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1160+4
ADDRLP4 1184
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1160+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 6628
;6627:
;6628:			trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_head, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1188
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+520
ADDP4
INDIRI4
ARGI4
ADDRLP4 780
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1188
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1188
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 6630
;6629:
;6630:			trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, ORIGIN, efOrg);
ADDRLP4 780
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1092
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6631
;6631:			trap_G2API_GiveMeVectorFromMatrix(&boltMatrix, NEGATIVE_Y, fxAng);
ADDRLP4 780
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1172
ARGP4
ADDRGP4 trap_G2API_GiveMeVectorFromMatrix
CALLV
pop
line 6633
;6632:
;6633: 			axis[0][0] = boltMatrix.matrix[0][0];
ADDRLP4 1056
ADDRLP4 780
INDIRF4
ASGNF4
line 6634
;6634: 			axis[0][1] = boltMatrix.matrix[1][0];
ADDRLP4 1056+4
ADDRLP4 780+16
INDIRF4
ASGNF4
line 6635
;6635:		 	axis[0][2] = boltMatrix.matrix[2][0];
ADDRLP4 1056+8
ADDRLP4 780+32
INDIRF4
ASGNF4
line 6637
;6636:
;6637: 			axis[1][0] = boltMatrix.matrix[0][1];
ADDRLP4 1056+12
ADDRLP4 780+4
INDIRF4
ASGNF4
line 6638
;6638: 			axis[1][1] = boltMatrix.matrix[1][1];
ADDRLP4 1056+12+4
ADDRLP4 780+16+4
INDIRF4
ASGNF4
line 6639
;6639:		 	axis[1][2] = boltMatrix.matrix[2][1];
ADDRLP4 1056+12+8
ADDRLP4 780+32+4
INDIRF4
ASGNF4
line 6641
;6640:
;6641: 			axis[2][0] = boltMatrix.matrix[0][2];
ADDRLP4 1056+24
ADDRLP4 780+8
INDIRF4
ASGNF4
line 6642
;6642: 			axis[2][1] = boltMatrix.matrix[1][2];
ADDRLP4 1056+24+4
ADDRLP4 780+16+8
INDIRF4
ASGNF4
line 6643
;6643:		 	axis[2][2] = boltMatrix.matrix[2][2];
ADDRLP4 1056+24+8
ADDRLP4 780+32+8
INDIRF4
ASGNF4
line 6645
;6644:
;6645:			VectorCopy(/*efOrg*/cent->lerpOrigin, fxObj.origin);
ADDRLP4 1104+28
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6646
;6646:			VectorCopy(/*fxAng*/tAng, fxObj.angles);
ADDRLP4 1104+16
ADDRLP4 1160
INDIRB
ASGNB 12
line 6647
;6647:			VectorCopy(cent->modelScale, fxObj.scale);
ADDRLP4 1104+40
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRB
ASGNB 12
line 6648
;6648:			fxObj.ghoul2 = cent->ghoul2;
ADDRLP4 1104+4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ASGNP4
line 6649
;6649:			fxObj.isValid = 1;
ADDRLP4 1104
CNSTI4 1
ASGNI4
line 6650
;6650:			fxObj.modelNum = 0;
ADDRLP4 1104+8
CNSTI4 0
ASGNI4
line 6651
;6651:			fxObj.boltNum = cgs.clientinfo[cent->currentState.number].bolt_head;
ADDRLP4 1104+12
CNSTI4 788
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+520
ADDP4
INDIRI4
ASGNI4
line 6652
;6652:			fxObj.entNum = cent->currentState.number;
ADDRLP4 1104+52
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $3700
JUMPV
LABELV $3699
line 6655
;6653:	
;6654:			while (effectTimeLayerC > 0)
;6655:			{
line 6656
;6656:				trap_FX_PlayEntityEffectID(trap_FX_RegisterEffect("force/confusion.efx"), efOrg, axis, cent->boltInfo, cent->currentState.number);
ADDRGP4 $3702
ARGP4
ADDRLP4 1192
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
ARGI4
ADDRLP4 1092
ARGP4
ADDRLP4 1056
ARGP4
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ARGI4
ADDRLP4 1196
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_FX_PlayEntityEffectID
CALLV
pop
line 6662
;6657:
;6658:				//FIXME: Due to the horrible inefficiency involved in the current effect bolt process an effect with as many particles as this won't
;6659:				//work too happily. It also doesn't look a lot better due to the lag between origin updates with the effect bolt. If those issues
;6660:				//are ever resolved it should be switched over to BoltedEffect.
;6661:				//trap_FX_PlayBoltedEffectID(trap_FX_RegisterEffect("force/confusion.efx"), &fxObj);
;6662:				effectTimeLayerC = 0;//-= 50;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 6663
;6663:			}
LABELV $3700
line 6654
ADDRLP4 1052
INDIRI4
CNSTI4 0
GTI4 $3699
line 6664
;6664:		}
LABELV $3658
line 6665
;6665:	}
LABELV $3652
line 6667
;6666:
;6667:	if (cgs.gametype == GT_HOLOCRON && cent->currentState.time2 && (cg.renderingThirdPerson || cg.snap->ps.clientNum != cent->currentState.number))
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 1
NEI4 $3703
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 1056
INDIRI4
EQI4 $3703
ADDRGP4 cg+88
INDIRI4
ADDRLP4 1056
INDIRI4
NEI4 $3708
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 1052
INDIRP4
INDIRI4
EQI4 $3703
LABELV $3708
line 6668
;6668:	{
line 6669
;6669:		int i = 0;
ADDRLP4 1272
CNSTI4 0
ASGNI4
line 6670
;6670:		int renderedHolos = 0;
ADDRLP4 1276
CNSTI4 0
ASGNI4
ADDRGP4 $3710
JUMPV
LABELV $3709
line 6674
;6671:		refEntity_t		holoRef;
;6672:
;6673:		while (i < NUM_FORCE_POWERS && renderedHolos < 3)
;6674:		{
line 6675
;6675:			if (cent->currentState.time2 & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 1272
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3712
line 6676
;6676:			{
line 6677
;6677:				memset( &holoRef, 0, sizeof(holoRef) );
ADDRLP4 1060
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 6679
;6678:
;6679:				VectorCopy(cent->lerpOrigin, elevated);
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 6680
;6680:				elevated[2] += 8;
ADDRLP4 224+8
ADDRLP4 224+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 6682
;6681:
;6682:				VectorCopy( elevated, holoRef.lightingOrigin );
ADDRLP4 1060+108
ADDRLP4 224
INDIRB
ASGNB 12
line 6683
;6683:				holoRef.shadowPlane = shadowPlane;
ADDRLP4 1060+120
ADDRLP4 540
INDIRF4
ASGNF4
line 6684
;6684:				holoRef.renderfx = 0;//RF_THIRD_PERSON;
ADDRLP4 1060+4
CNSTI4 0
ASGNI4
line 6686
;6685:
;6686:				if (renderedHolos == 0)
ADDRLP4 1276
INDIRI4
CNSTI4 0
NEI4 $3718
line 6687
;6687:				{
line 6688
;6688:					angle = ((cg.time / 8) & 255) * (M_PI * 2) / 255;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
INDIRI4
CNSTI4 8
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 6689
;6689:					dir[0] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1280
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 1280
INDIRF4
MULF4
ASGNF4
line 6690
;6690:					dir[1] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1284
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1284
INDIRF4
MULF4
ASGNF4
line 6691
;6691:					dir[2] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1288
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1101004800
ADDRLP4 1288
INDIRF4
MULF4
ASGNF4
line 6692
;6692:					VectorAdd(elevated, dir, holoRef.origin);
ADDRLP4 1060+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1060+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1060+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6694
;6693:
;6694:					angles[0] = sin(angle) * 30;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1292
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 252
CNSTF4 1106247680
ADDRLP4 1292
INDIRF4
MULF4
ASGNF4
line 6695
;6695:					angles[1] = (angle * 180 / M_PI) + 90;
ADDRLP4 252+4
CNSTF4 1127481344
ADDRLP4 236
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 6696
;6696:					if (angles[1] > 360)
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
LEF4 $3733
line 6697
;6697:						angles[1] -= 360;
ADDRLP4 252+4
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $3733
line 6698
;6698:					angles[2] = 0;
ADDRLP4 252+8
CNSTF4 0
ASGNF4
line 6699
;6699:					AnglesToAxis( angles, holoRef.axis );
ADDRLP4 252
ARGP4
ADDRLP4 1060+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 6700
;6700:				}
ADDRGP4 $3719
JUMPV
LABELV $3718
line 6701
;6701:				else if (renderedHolos == 1)
ADDRLP4 1276
INDIRI4
CNSTI4 1
NEI4 $3739
line 6702
;6702:				{
line 6703
;6703:					angle = ((cg.time / 8) & 255) * (M_PI * 2) / 255 + M_PI;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
INDIRI4
CNSTI4 8
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
CNSTF4 1078530011
ADDF4
ASGNF4
line 6704
;6704:					if (angle > M_PI * 2)
ADDRLP4 236
INDIRF4
CNSTF4 1086918619
LEF4 $3742
line 6705
;6705:						angle -= (float)M_PI * 2;
ADDRLP4 236
ADDRLP4 236
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $3742
line 6706
;6706:					dir[0] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1280
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 1280
INDIRF4
MULF4
ASGNF4
line 6707
;6707:					dir[1] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1284
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1284
INDIRF4
MULF4
ASGNF4
line 6708
;6708:					dir[2] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1288
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+8
CNSTF4 1101004800
ADDRLP4 1288
INDIRF4
MULF4
ASGNF4
line 6709
;6709:					VectorAdd(elevated, dir, holoRef.origin);
ADDRLP4 1060+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1060+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1060+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6711
;6710:
;6711:					angles[0] = cos(angle - 0.5 * M_PI) * 30;
ADDRLP4 236
INDIRF4
CNSTF4 1070141403
SUBF4
ARGF4
ADDRLP4 1292
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 252
CNSTF4 1106247680
ADDRLP4 1292
INDIRF4
MULF4
ASGNF4
line 6712
;6712:					angles[1] = 360 - (angle * 180 / M_PI);
ADDRLP4 252+4
CNSTF4 1135869952
CNSTF4 1127481344
ADDRLP4 236
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
SUBF4
ASGNF4
line 6713
;6713:					if (angles[1] > 360)
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
LEF4 $3756
line 6714
;6714:						angles[1] -= 360;
ADDRLP4 252+4
ADDRLP4 252+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $3756
line 6715
;6715:					angles[2] = 0;
ADDRLP4 252+8
CNSTF4 0
ASGNF4
line 6716
;6716:					AnglesToAxis( angles, holoRef.axis );
ADDRLP4 252
ARGP4
ADDRLP4 1060+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 6717
;6717:				}
ADDRGP4 $3740
JUMPV
LABELV $3739
line 6719
;6718:				else
;6719:				{
line 6720
;6720:					angle = ((cg.time / 6) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
ADDRLP4 236
CNSTF4 1086918619
ADDRGP4 cg+64
INDIRI4
CNSTI4 6
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
CNSTF4 1070141403
ADDF4
ASGNF4
line 6721
;6721:					if (angle > M_PI * 2)
ADDRLP4 236
INDIRF4
CNSTF4 1086918619
LEF4 $3763
line 6722
;6722:						angle -= (float)M_PI * 2;
ADDRLP4 236
ADDRLP4 236
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $3763
line 6723
;6723:					dir[0] = sin(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1280
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 212
CNSTF4 1101004800
ADDRLP4 1280
INDIRF4
MULF4
ASGNF4
line 6724
;6724:					dir[1] = cos(angle) * 20;
ADDRLP4 236
INDIRF4
ARGF4
ADDRLP4 1284
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 212+4
CNSTF4 1101004800
ADDRLP4 1284
INDIRF4
MULF4
ASGNF4
line 6725
;6725:					dir[2] = 0;
ADDRLP4 212+8
CNSTF4 0
ASGNF4
line 6726
;6726:					VectorAdd(elevated, dir, holoRef.origin);
ADDRLP4 1060+52
ADDRLP4 224
INDIRF4
ADDRLP4 212
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1060+52+4
ADDRLP4 224+4
INDIRF4
ADDRLP4 212+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1060+52+8
ADDRLP4 224+8
INDIRF4
ADDRLP4 212+8
INDIRF4
ADDF4
ASGNF4
line 6728
;6727:			
;6728:					VectorCopy(dir, holoRef.axis[1]);
ADDRLP4 1060+12+12
ADDRLP4 212
INDIRB
ASGNB 12
line 6729
;6729:					VectorNormalize(holoRef.axis[1]);
ADDRLP4 1060+12+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6730
;6730:					VectorSet(holoRef.axis[2], 0, 0, 1);
ADDRLP4 1060+12+24
CNSTF4 0
ASGNF4
ADDRLP4 1060+12+24+4
CNSTF4 0
ASGNF4
ADDRLP4 1060+12+24+8
CNSTF4 1065353216
ASGNF4
line 6731
;6731:					CrossProduct(holoRef.axis[1], holoRef.axis[2], holoRef.axis[0]);
ADDRLP4 1060+12+12
ARGP4
ADDRLP4 1060+12+24
ARGP4
ADDRLP4 1060+12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 6732
;6732:				}
LABELV $3740
LABELV $3719
line 6734
;6733:
;6734:				holoRef.modelScale[0] = 0.5;
ADDRLP4 1060+196
CNSTF4 1056964608
ASGNF4
line 6735
;6735:				holoRef.modelScale[1] = 0.5;
ADDRLP4 1060+196+4
CNSTF4 1056964608
ASGNF4
line 6736
;6736:				holoRef.modelScale[2] = 0.5;
ADDRLP4 1060+196+8
CNSTF4 1056964608
ASGNF4
line 6737
;6737:				ScaleModelAxis(&holoRef);
ADDRLP4 1060
ARGP4
ADDRGP4 ScaleModelAxis
CALLV
pop
line 6739
;6738:
;6739:				{
line 6744
;6740:					float wv;
;6741:					addspriteArgStruct_t fxSArgs;
;6742:					vec3_t holoCenter;
;6743:
;6744:					holoCenter[0] = holoRef.origin[0] + holoRef.axis[2][0]*18;
ADDRLP4 1356
ADDRLP4 1060+52
INDIRF4
CNSTF4 1099956224
ADDRLP4 1060+12+24
INDIRF4
MULF4
ADDF4
ASGNF4
line 6745
;6745:					holoCenter[1] = holoRef.origin[1] + holoRef.axis[2][1]*18;
ADDRLP4 1356+4
ADDRLP4 1060+52+4
INDIRF4
CNSTF4 1099956224
ADDRLP4 1060+12+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 6746
;6746:					holoCenter[2] = holoRef.origin[2] + holoRef.axis[2][2]*18;
ADDRLP4 1356+8
ADDRLP4 1060+52+8
INDIRF4
CNSTF4 1099956224
ADDRLP4 1060+12+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 6748
;6747:
;6748:					wv = sin( cg.time * 0.004f ) * 0.08f + 0.1f;
CNSTF4 998445679
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 1368
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 1352
CNSTF4 1034147594
ADDRLP4 1368
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 6750
;6749:
;6750:					VectorCopy(holoCenter, fxSArgs.origin);
ADDRLP4 1280
ADDRLP4 1356
INDIRB
ASGNB 12
line 6751
;6751:					VectorClear(fxSArgs.vel);
ADDRLP4 1372
CNSTF4 0
ASGNF4
ADDRLP4 1280+12+8
ADDRLP4 1372
INDIRF4
ASGNF4
ADDRLP4 1280+12+4
ADDRLP4 1372
INDIRF4
ASGNF4
ADDRLP4 1280+12
ADDRLP4 1372
INDIRF4
ASGNF4
line 6752
;6752:					VectorClear(fxSArgs.accel);
ADDRLP4 1376
CNSTF4 0
ASGNF4
ADDRLP4 1280+24+8
ADDRLP4 1376
INDIRF4
ASGNF4
ADDRLP4 1280+24+4
ADDRLP4 1376
INDIRF4
ASGNF4
ADDRLP4 1280+24
ADDRLP4 1376
INDIRF4
ASGNF4
line 6753
;6753:					fxSArgs.scale = wv*60;
ADDRLP4 1280+36
CNSTF4 1114636288
ADDRLP4 1352
INDIRF4
MULF4
ASGNF4
line 6754
;6754:					fxSArgs.dscale = wv*60;
ADDRLP4 1280+40
CNSTF4 1114636288
ADDRLP4 1352
INDIRF4
MULF4
ASGNF4
line 6755
;6755:					fxSArgs.sAlpha = wv*12;
ADDRLP4 1280+44
CNSTF4 1094713344
ADDRLP4 1352
INDIRF4
MULF4
ASGNF4
line 6756
;6756:					fxSArgs.eAlpha = wv*12;
ADDRLP4 1280+48
CNSTF4 1094713344
ADDRLP4 1352
INDIRF4
MULF4
ASGNF4
line 6757
;6757:					fxSArgs.rotation = 0.0f;
ADDRLP4 1280+52
CNSTF4 0
ASGNF4
line 6758
;6758:					fxSArgs.bounce = 0.0f;
ADDRLP4 1280+56
CNSTF4 0
ASGNF4
line 6759
;6759:					fxSArgs.life = 1.0f;
ADDRLP4 1280+60
CNSTI4 1
ASGNI4
line 6761
;6760:
;6761:					fxSArgs.flags = 0x08000000|0x00000001;
ADDRLP4 1280+68
CNSTI4 134217729
ASGNI4
line 6763
;6762:
;6763:					if (forcePowerDarkLight[i] == FORCE_DARKSIDE)
ADDRLP4 1380
CNSTI4 2
ASGNI4
ADDRLP4 1272
INDIRI4
ADDRLP4 1380
INDIRI4
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
ADDRLP4 1380
INDIRI4
NEI4 $3832
line 6764
;6764:					{ //dark
line 6765
;6765:						fxSArgs.sAlpha *= 3;
ADDRLP4 1280+44
CNSTF4 1077936128
ADDRLP4 1280+44
INDIRF4
MULF4
ASGNF4
line 6766
;6766:						fxSArgs.eAlpha *= 3;
ADDRLP4 1280+48
CNSTF4 1077936128
ADDRLP4 1280+48
INDIRF4
MULF4
ASGNF4
line 6767
;6767:						fxSArgs.shader = cgs.media.redSaberGlowShader;
ADDRLP4 1280+64
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 6768
;6768:						trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1280
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6769
;6769:					}
ADDRGP4 $3833
JUMPV
LABELV $3832
line 6770
;6770:					else if (forcePowerDarkLight[i] == FORCE_LIGHTSIDE)
ADDRLP4 1272
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
CNSTI4 1
NEI4 $3839
line 6771
;6771:					{ //light
line 6772
;6772:						fxSArgs.sAlpha *= 1.5;
ADDRLP4 1280+44
CNSTF4 1069547520
ADDRLP4 1280+44
INDIRF4
MULF4
ASGNF4
line 6773
;6773:						fxSArgs.eAlpha *= 1.5;
ADDRLP4 1280+48
CNSTF4 1069547520
ADDRLP4 1280+48
INDIRF4
MULF4
ASGNF4
line 6774
;6774:						fxSArgs.shader = cgs.media.redSaberGlowShader;
ADDRLP4 1280+64
ADDRGP4 cgs+70296+116
INDIRI4
ASGNI4
line 6775
;6775:						trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1280
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6776
;6776:						fxSArgs.shader = cgs.media.greenSaberGlowShader;
ADDRLP4 1280+64
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 6777
;6777:						trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1280
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6778
;6778:						fxSArgs.shader = cgs.media.blueSaberGlowShader;
ADDRLP4 1280+64
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 6779
;6779:						trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1280
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6780
;6780:					}
ADDRGP4 $3840
JUMPV
LABELV $3839
line 6782
;6781:					else
;6782:					{ //neutral
line 6783
;6783:						if (i == FP_SABERATTACK ||
ADDRLP4 1272
INDIRI4
CNSTI4 15
EQI4 $3855
ADDRLP4 1272
INDIRI4
CNSTI4 16
EQI4 $3855
ADDRLP4 1272
INDIRI4
CNSTI4 17
NEI4 $3852
LABELV $3855
line 6786
;6784:							i == FP_SABERDEFEND ||
;6785:							i == FP_SABERTHROW)
;6786:						{ //saber power
line 6787
;6787:							fxSArgs.sAlpha *= 1.5;
ADDRLP4 1280+44
CNSTF4 1069547520
ADDRLP4 1280+44
INDIRF4
MULF4
ASGNF4
line 6788
;6788:							fxSArgs.eAlpha *= 1.5;
ADDRLP4 1280+48
CNSTF4 1069547520
ADDRLP4 1280+48
INDIRF4
MULF4
ASGNF4
line 6789
;6789:							fxSArgs.shader = cgs.media.greenSaberGlowShader;
ADDRLP4 1280+64
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 6790
;6790:							trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1280
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6791
;6791:						}
ADDRGP4 $3853
JUMPV
LABELV $3852
line 6793
;6792:						else
;6793:						{
line 6794
;6794:							fxSArgs.sAlpha *= 0.5;
ADDRLP4 1280+44
CNSTF4 1056964608
ADDRLP4 1280+44
INDIRF4
MULF4
ASGNF4
line 6795
;6795:							fxSArgs.eAlpha *= 0.5;
ADDRLP4 1280+48
CNSTF4 1056964608
ADDRLP4 1280+48
INDIRF4
MULF4
ASGNF4
line 6796
;6796:							fxSArgs.shader = cgs.media.greenSaberGlowShader;
ADDRLP4 1280+64
ADDRGP4 cgs+70296+140
INDIRI4
ASGNI4
line 6797
;6797:							trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1280
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6798
;6798:							fxSArgs.shader = cgs.media.blueSaberGlowShader;
ADDRLP4 1280+64
ADDRGP4 cgs+70296+148
INDIRI4
ASGNI4
line 6799
;6799:							trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1280
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 6800
;6800:						}
LABELV $3853
line 6801
;6801:					}
LABELV $3840
LABELV $3833
line 6802
;6802:				}
line 6804
;6803:
;6804:				holoRef.hModel = trap_R_RegisterModel(forceHolocronModels[i]);
ADDRLP4 1272
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceHolocronModels
ADDP4
INDIRP4
ARGP4
ADDRLP4 1280
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 1060+8
ADDRLP4 1280
INDIRI4
ASGNI4
line 6805
;6805:				trap_R_AddRefEntityToScene( &holoRef );
ADDRLP4 1060
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 6807
;6806:
;6807:				renderedHolos++;
ADDRLP4 1276
ADDRLP4 1276
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6808
;6808:			}
LABELV $3712
line 6809
;6809:			i++;
ADDRLP4 1272
ADDRLP4 1272
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6810
;6810:		}
LABELV $3710
line 6673
ADDRLP4 1272
INDIRI4
CNSTI4 18
GEI4 $3870
ADDRLP4 1276
INDIRI4
CNSTI4 3
LTI4 $3709
LABELV $3870
line 6811
;6811:	}
LABELV $3703
line 6813
;6812:
;6813:	if ((cent->currentState.powerups & (1 << PW_YSALAMIRI)) ||
ADDRLP4 1060
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 32768
BANDI4
ADDRLP4 1064
INDIRI4
NEI4 $3875
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $3871
ADDRLP4 1060
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 1064
INDIRI4
NEI4 $3875
ADDRLP4 1060
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 1064
INDIRI4
EQI4 $3871
LABELV $3875
line 6815
;6814:		(cgs.gametype == GT_CTY && ((cent->currentState.powerups & (1 << PW_REDFLAG)) || (cent->currentState.powerups & (1 << PW_BLUEFLAG)))) )
;6815:	{
line 6816
;6816:		if (cgs.gametype == GT_CTY && (cent->currentState.powerups & (1 << PW_REDFLAG)))
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $3876
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $3876
line 6817
;6817:		{
line 6818
;6818:			CG_DrawPlayerSphere(cent, cent->lerpOrigin, 1.4, cgs.media.ysaliredShader );
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+572
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6819
;6819:		}
ADDRGP4 $3877
JUMPV
LABELV $3876
line 6820
;6820:		else if (cgs.gametype == GT_CTY && (cent->currentState.powerups & (1 << PW_BLUEFLAG)))
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $3881
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $3881
line 6821
;6821:		{
line 6822
;6822:			CG_DrawPlayerSphere(cent, cent->lerpOrigin, 1.4, cgs.media.ysaliblueShader );
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+576
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6823
;6823:		}
ADDRGP4 $3882
JUMPV
LABELV $3881
line 6825
;6824:		else
;6825:		{
line 6826
;6826:			CG_DrawPlayerSphere(cent, cent->lerpOrigin, 1.4, cgs.media.ysalimariShader );
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+580
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6827
;6827:		}
LABELV $3882
LABELV $3877
line 6828
;6828:	}
LABELV $3871
line 6830
;6829:	
;6830:	if (cent->currentState.powerups & (1 << PW_FORCE_BOON))
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $3888
line 6831
;6831:	{
line 6832
;6832:		CG_DrawPlayerSphere(cent, cent->lerpOrigin, 2.0, cgs.media.boonShader );
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 cgs+70296+584
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6833
;6833:	}
LABELV $3888
line 6835
;6834:
;6835:	if (cent->currentState.powerups & (1 << PW_FORCE_ENLIGHTENED_DARK))
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $3892
line 6836
;6836:	{
line 6837
;6837:		CG_DrawPlayerSphere(cent, cent->lerpOrigin, 2.0, cgs.media.endarkenmentShader );
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 cgs+70296+588
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6838
;6838:	}
ADDRGP4 $3893
JUMPV
LABELV $3892
line 6839
;6839:	else if (cent->currentState.powerups & (1 << PW_FORCE_ENLIGHTENED_LIGHT))
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $3896
line 6840
;6840:	{
line 6841
;6841:		CG_DrawPlayerSphere(cent, cent->lerpOrigin, 2.0, cgs.media.enlightenmentShader );
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 cgs+70296+592
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6842
;6842:	}
LABELV $3896
LABELV $3893
line 6844
;6843:
;6844:	if (cent->currentState.eFlags & EF_INVULNERABLE)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $3900
line 6845
;6845:	{
line 6846
;6846:		CG_DrawPlayerSphere(cent, cent->lerpOrigin, 1.4, cgs.media.invulnerabilityShader );
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
CNSTI4 928
ADDP4
ARGP4
CNSTF4 1068708659
ARGF4
ADDRGP4 cgs+70296+596
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerSphere
CALLV
pop
line 6847
;6847:	}
LABELV $3900
LABELV $3569
line 6849
;6848:stillDoSaber:
;6849:	if (cent->currentState.weapon == WP_SABER && !cent->currentState.shouldtarget)
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $3904
ADDRLP4 1068
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3904
line 6850
;6850:	{
line 6851
;6851:		if (!cent->currentState.saberInFlight && !(cent->currentState.eFlags & EF_DEAD))
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1076
CNSTI4 0
ASGNI4
ADDRLP4 1072
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1076
INDIRI4
NEI4 $3906
ADDRLP4 1072
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1076
INDIRI4
NEI4 $3906
line 6852
;6852:		{
line 6853
;6853:			if (cg.snap->ps.clientNum == cent->currentState.number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $3908
line 6854
;6854:			{
line 6855
;6855:				trap_S_AddLoopingSound( cent->currentState.number, cg.refdef.vieworg, vec3_origin, 
ADDRGP4 $3913
ARGP4
ADDRLP4 1080
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 cg+3616+24
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 6857
;6856:					trap_S_RegisterSound( "sound/weapons/saber/saberhum1.wav" ) );
;6857:			}
ADDRGP4 $3909
JUMPV
LABELV $3908
line 6859
;6858:			else
;6859:			{
line 6860
;6860:				trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRGP4 $3913
ARGP4
ADDRLP4 1080
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 1084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1084
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1084
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 6862
;6861:					trap_S_RegisterSound( "sound/weapons/saber/saberhum1.wav" ) );
;6862:			}
LABELV $3909
line 6863
;6863:		}
LABELV $3906
line 6865
;6864:
;6865:		if (iwantout && !cent->currentState.saberInFlight)
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 772
INDIRI4
ADDRLP4 1080
INDIRI4
EQI4 $3914
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $3914
line 6866
;6866:		{
line 6867
;6867:			if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $3920
line 6868
;6868:			{
line 6869
;6869:				if (cent->ghoul2 && cent->currentState.saberInFlight && g2HasWeapon)
ADDRLP4 1084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1084
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3920
ADDRLP4 1088
CNSTI4 0
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $3920
ADDRLP4 536
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $3920
line 6870
;6870:				{ //special case, kill the saber on a freshly dead player if another source says to.
line 6871
;6871:					trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 6872
;6872:					g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 6873
;6873:				}
line 6874
;6874:			}
line 6876
;6875:			//return;
;6876:			goto endOfCall;
ADDRGP4 $3920
JUMPV
LABELV $3914
line 6879
;6877:		}
;6878:
;6879:		if (cent->currentState.saberInFlight && cent->currentState.saberEntityNum)
ADDRLP4 1084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
CNSTI4 0
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $3921
ADDRLP4 1084
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $3921
line 6880
;6880:		{
line 6883
;6881:			centity_t *saberEnt;
;6882:
;6883:			saberEnt = &cg_entities[cent->currentState.saberEntityNum];
ADDRLP4 1092
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 6885
;6884:
;6885:			if (/*!cent->bolt4 &&*/ g2HasWeapon)
ADDRLP4 536
INDIRI4
CNSTI4 0
EQI4 $3923
line 6886
;6886:			{ //saber is in flight, do not have it as a standard weapon model
line 6887
;6887:				trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 6888
;6888:				g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 6892
;6889:
;6890:				//cent->bolt4 = 1;
;6891:
;6892:				saberEnt->currentState.pos.trTime = cg.time;
ADDRLP4 1092
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6893
;6893:				saberEnt->currentState.apos.trTime = cg.time;
ADDRLP4 1092
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6895
;6894:
;6895:				VectorCopy(saberEnt->currentState.pos.trBase, saberEnt->lerpOrigin);
ADDRLP4 1092
INDIRP4
CNSTI4 928
ADDP4
ADDRLP4 1092
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 6896
;6896:				VectorCopy(saberEnt->currentState.apos.trBase, saberEnt->lerpAngles);
ADDRLP4 1092
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 1092
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 6898
;6897:
;6898:				cent->bolt3 = saberEnt->currentState.apos.trBase[0];
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
ADDRLP4 1092
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 6899
;6899:				cent->bolt2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 6901
;6900:
;6901:				saberEnt->currentState.bolt2 = 123;
ADDRLP4 1092
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 123
ASGNI4
line 6903
;6902:
;6903:				if (saberEnt->ghoul2)
ADDRLP4 1092
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3927
line 6904
;6904:				{
line 6906
;6905:					// now set up the gun bolt on it
;6906:					trap_G2API_AddBolt(saberEnt->ghoul2, 0, "*flash");
ADDRLP4 1092
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $3929
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 6907
;6907:				}
ADDRGP4 $3928
JUMPV
LABELV $3927
line 6909
;6908:				else
;6909:				{
line 6910
;6910:					trap_G2API_InitGhoul2Model(&saberEnt->ghoul2, "models/weapons2/saber/saber_w.glm", 0, 0, 0, 0, 0);
ADDRLP4 1092
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 $3930
ARGP4
ADDRLP4 1104
CNSTI4 0
ASGNI4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 6912
;6911:
;6912:					if (saberEnt->ghoul2)
ADDRLP4 1092
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3931
line 6913
;6913:					{
line 6914
;6914:						trap_G2API_AddBolt(saberEnt->ghoul2, 0, "*flash");
ADDRLP4 1092
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $3929
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 6917
;6915:						//cent->bolt4 = 2;
;6916:						
;6917:						VectorCopy(saberEnt->currentState.pos.trBase, saberEnt->lerpOrigin);
ADDRLP4 1092
INDIRP4
CNSTI4 928
ADDP4
ADDRLP4 1092
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 6918
;6918:						VectorCopy(saberEnt->currentState.apos.trBase, saberEnt->lerpAngles);
ADDRLP4 1092
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 1092
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 6919
;6919:						saberEnt->currentState.pos.trTime = cg.time;
ADDRLP4 1092
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6920
;6920:						saberEnt->currentState.apos.trTime = cg.time;
ADDRLP4 1092
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6921
;6921:					}
LABELV $3931
line 6922
;6922:				}
LABELV $3928
line 6923
;6923:			}
LABELV $3923
line 6933
;6924:			/*else if (cent->bolt4 != 2)
;6925:			{
;6926:				if (saberEnt->ghoul2)
;6927:				{
;6928:					trap_G2API_AddBolt(saberEnt->ghoul2, 0, "*flash");
;6929:					cent->bolt4 = 2;
;6930:				}
;6931:			}*/
;6932:
;6933:			if (saberEnt && saberEnt->ghoul2 /*&& cent->bolt4 == 2*/)
ADDRLP4 1100
CNSTU4 0
ASGNU4
ADDRLP4 1092
INDIRP4
CVPU4 4
ADDRLP4 1100
INDIRU4
EQU4 $3905
ADDRLP4 1092
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1100
INDIRU4
EQU4 $3905
line 6934
;6934:			{
line 6937
;6935:				vec3_t bladeAngles;
;6936:
;6937:				if (!cent->bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3937
line 6938
;6938:				{
line 6939
;6939:					cent->bolt2 = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6940
;6940:				}
LABELV $3937
line 6942
;6941:
;6942:				if (cent->bolt3 != 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
EQI4 $3940
line 6943
;6943:				{
line 6944
;6944:					if (cent->bolt3 < 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
GEI4 $3942
line 6945
;6945:					{
line 6946
;6946:						cent->bolt3 += (cg.time - cent->bolt2)*0.5;
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1116
INDIRP4
CNSTI4 992
ADDP4
ASGNP4
ADDRLP4 1120
INDIRP4
ADDRLP4 1120
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1116
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 6948
;6947:
;6948:						if (cent->bolt3 > 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
LEI4 $3943
line 6949
;6949:						{
line 6950
;6950:							cent->bolt3 = 90;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 90
ASGNI4
line 6951
;6951:						}
line 6952
;6952:					}
ADDRGP4 $3943
JUMPV
LABELV $3942
line 6953
;6953:					else if (cent->bolt3 > 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
LEI4 $3947
line 6954
;6954:					{
line 6955
;6955:						cent->bolt3 -= (cg.time - cent->bolt2)*0.5;
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1116
INDIRP4
CNSTI4 992
ADDP4
ASGNP4
ADDRLP4 1120
INDIRP4
ADDRLP4 1120
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRGP4 cg+64
INDIRI4
ADDRLP4 1116
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 6957
;6956:
;6957:						if (cent->bolt3 < 90)
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 90
GEI4 $3950
line 6958
;6958:						{
line 6959
;6959:							cent->bolt3 = 90;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 90
ASGNI4
line 6960
;6960:						}
LABELV $3950
line 6961
;6961:					}
LABELV $3947
LABELV $3943
line 6962
;6962:				}
LABELV $3940
line 6964
;6963:
;6964:				cent->bolt2 = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 6966
;6965:
;6966:				saberEnt->currentState.apos.trBase[0] = cent->bolt3;
ADDRLP4 1092
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 6967
;6967:				saberEnt->lerpAngles[0] = cent->bolt3;
ADDRLP4 1092
INDIRP4
CNSTI4 940
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 6969
;6968:
;6969:				if (!saberEnt->currentState.saberInFlight && saberEnt->currentState.bolt2 != 123)
ADDRLP4 1092
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3953
ADDRLP4 1092
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 123
EQI4 $3953
line 6970
;6970:				{ //owner is pulling is back
line 6973
;6971:					vec3_t owndir;
;6972:
;6973:					VectorSubtract(saberEnt->lerpOrigin, cent->lerpOrigin, owndir);
ADDRLP4 1136
CNSTI4 928
ASGNI4
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1092
INDIRP4
ADDRLP4 1136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
ADDRLP4 1136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1144
CNSTI4 932
ASGNI4
ADDRLP4 1120+4
ADDRLP4 1092
INDIRP4
ADDRLP4 1144
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
ADDRLP4 1144
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1148
CNSTI4 936
ASGNI4
ADDRLP4 1120+8
ADDRLP4 1092
INDIRP4
ADDRLP4 1148
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 1148
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6974
;6974:					VectorNormalize(owndir);
ADDRLP4 1120
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6976
;6975:
;6976:					vectoangles(owndir, owndir);
ADDRLP4 1120
ARGP4
ADDRLP4 1120
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6978
;6977:
;6978:					owndir[0] += 90;
ADDRLP4 1120
ADDRLP4 1120
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 6980
;6979:
;6980:					VectorCopy(owndir, saberEnt->currentState.apos.trBase);
ADDRLP4 1092
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1120
INDIRB
ASGNB 12
line 6981
;6981:					VectorCopy(owndir, saberEnt->lerpAngles);
ADDRLP4 1092
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 1120
INDIRB
ASGNB 12
line 6982
;6982:					VectorClear(saberEnt->currentState.apos.trDelta);
ADDRLP4 1156
CNSTF4 0
ASGNF4
ADDRLP4 1092
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 1156
INDIRF4
ASGNF4
ADDRLP4 1092
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 1156
INDIRF4
ASGNF4
ADDRLP4 1092
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 1156
INDIRF4
ASGNF4
line 6983
;6983:				}
LABELV $3953
line 6988
;6984:
;6985:				//We don't actually want to rely entirely on server updates to render the position of the saber, because we actually know generally where
;6986:				//it's going to be before the first position update even gets here, and it needs to start getting rendered the instant the saber model is
;6987:				//removed from the player hand. So we'll just render it manually and let normal rendering for the entity be ignored.
;6988:				if (!saberEnt->currentState.saberInFlight && saberEnt->currentState.bolt2 != 123)
ADDRLP4 1092
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3957
ADDRLP4 1092
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 123
EQI4 $3957
line 6989
;6989:				{ //tell it that we're a saber and to render the glow around our handle because we're being pulled back
line 6990
;6990:					saberEnt->bolt3 = 999;
ADDRLP4 1092
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 999
ASGNI4
line 6991
;6991:				}
LABELV $3957
line 6993
;6992:
;6993:				saberEnt->currentState.modelGhoul2 = 1;
ADDRLP4 1092
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 6994
;6994:				CG_ManualEntityRender(saberEnt);
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 CG_ManualEntityRender
CALLV
pop
line 6995
;6995:				saberEnt->bolt3 = 0;
ADDRLP4 1092
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 6996
;6996:				saberEnt->currentState.modelGhoul2 = 127;
ADDRLP4 1092
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 127
ASGNI4
line 6998
;6997:
;6998:				VectorCopy(saberEnt->lerpAngles, bladeAngles);
ADDRLP4 1104
ADDRLP4 1092
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 6999
;6999:				bladeAngles[ROLL] = 0;
ADDRLP4 1104+8
CNSTF4 0
ASGNF4
line 7000
;7000:				CG_AddSaberBlade(cent, saberEnt, NULL, 0, 0, saberEnt->lerpOrigin, bladeAngles, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 1128
INDIRI4
ARGI4
ADDRLP4 1128
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 1104
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_AddSaberBlade
CALLV
pop
line 7003
;7001:
;7002:				//Make the player's hand glow while guiding the saber
;7003:				{
line 7008
;7004:					vec3_t tAng;
;7005:					float wv;
;7006:					addspriteArgStruct_t fxSArgs;
;7007:
;7008:					VectorSet( tAng, cent->turAngles[PITCH], cent->turAngles[YAW], cent->turAngles[ROLL] );
ADDRLP4 1220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
ADDRLP4 1220
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1204+4
ADDRLP4 1220
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1204+8
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 7010
;7009:
;7010:					trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cgs.clientinfo[cent->currentState.number].bolt_rhand, &boltMatrix, tAng, cent->lerpOrigin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788
ADDRLP4 1224
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+512
ADDP4
INDIRI4
ARGI4
ADDRLP4 780
ARGP4
ADDRLP4 1204
ARGP4
ADDRLP4 1224
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 1224
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 7012
;7011:
;7012:					efOrg[0] = boltMatrix.matrix[0][3];
ADDRLP4 240
ADDRLP4 780+12
INDIRF4
ASGNF4
line 7013
;7013:					efOrg[1] = boltMatrix.matrix[1][3];
ADDRLP4 240+4
ADDRLP4 780+16+12
INDIRF4
ASGNF4
line 7014
;7014:					efOrg[2] = boltMatrix.matrix[2][3];
ADDRLP4 240+8
ADDRLP4 780+32+12
INDIRF4
ASGNF4
line 7016
;7015:
;7016:					wv = sin( cg.time * 0.003f ) * 0.08f + 0.1f;
CNSTF4 994352038
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 1228
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 1216
CNSTF4 1034147594
ADDRLP4 1228
INDIRF4
MULF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 7019
;7017:
;7018:					//trap_FX_AddSprite( NULL, efOrg, NULL, NULL, 8.0f, 8.0f, wv, wv, 0.0f, 0.0f, 1.0f, cgs.media.yellowSaberGlowShader, 0x08000000 );
;7019:					VectorCopy(efOrg, fxSArgs.origin);
ADDRLP4 1132
ADDRLP4 240
INDIRB
ASGNB 12
line 7020
;7020:					VectorClear(fxSArgs.vel);
ADDRLP4 1232
CNSTF4 0
ASGNF4
ADDRLP4 1132+12+8
ADDRLP4 1232
INDIRF4
ASGNF4
ADDRLP4 1132+12+4
ADDRLP4 1232
INDIRF4
ASGNF4
ADDRLP4 1132+12
ADDRLP4 1232
INDIRF4
ASGNF4
line 7021
;7021:					VectorClear(fxSArgs.accel);
ADDRLP4 1236
CNSTF4 0
ASGNF4
ADDRLP4 1132+24+8
ADDRLP4 1236
INDIRF4
ASGNF4
ADDRLP4 1132+24+4
ADDRLP4 1236
INDIRF4
ASGNF4
ADDRLP4 1132+24
ADDRLP4 1236
INDIRF4
ASGNF4
line 7022
;7022:					fxSArgs.scale = 8.0f;
ADDRLP4 1132+36
CNSTF4 1090519040
ASGNF4
line 7023
;7023:					fxSArgs.dscale = 8.0f;
ADDRLP4 1132+40
CNSTF4 1090519040
ASGNF4
line 7024
;7024:					fxSArgs.sAlpha = wv;
ADDRLP4 1132+44
ADDRLP4 1216
INDIRF4
ASGNF4
line 7025
;7025:					fxSArgs.eAlpha = wv;
ADDRLP4 1132+48
ADDRLP4 1216
INDIRF4
ASGNF4
line 7026
;7026:					fxSArgs.rotation = 0.0f;
ADDRLP4 1132+52
CNSTF4 0
ASGNF4
line 7027
;7027:					fxSArgs.bounce = 0.0f;
ADDRLP4 1132+56
CNSTF4 0
ASGNF4
line 7028
;7028:					fxSArgs.life = 1.0f;
ADDRLP4 1132+60
CNSTI4 1
ASGNI4
line 7029
;7029:					fxSArgs.shader = cgs.media.yellowDroppedSaberShader;
ADDRLP4 1132+64
ADDRGP4 cgs+70296+168
INDIRI4
ASGNI4
line 7030
;7030:					fxSArgs.flags = 0x08000000;
ADDRLP4 1132+68
CNSTI4 134217728
ASGNI4
line 7031
;7031:					trap_FX_AddSprite(&fxSArgs);
ADDRLP4 1132
ARGP4
ADDRGP4 trap_FX_AddSprite
CALLV
pop
line 7032
;7032:				}
line 7033
;7033:			}
line 7034
;7034:		}
ADDRGP4 $3905
JUMPV
LABELV $3921
line 7036
;7035:		else
;7036:		{
line 7039
;7037:			centity_t *saberEnt;
;7038:
;7039:			saberEnt = &cg_entities[cent->currentState.saberEntityNum];
ADDRLP4 1092
CNSTI4 1920
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 7041
;7040:
;7041:			if (/*cent->bolt4 && */!g2HasWeapon)
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $3995
line 7042
;7042:			{
line 7043
;7043:				trap_G2API_CopySpecificGhoul2Model(g2WeaponInstances[WP_SABER], 0, cent->ghoul2, 1);
ADDRGP4 g2WeaponInstances+8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
CALLV
pop
line 7045
;7044:
;7045:				if (saberEnt && saberEnt->ghoul2)
ADDRLP4 1096
ADDRLP4 1092
INDIRP4
ASGNP4
ADDRLP4 1100
CNSTU4 0
ASGNU4
ADDRLP4 1096
INDIRP4
CVPU4 4
ADDRLP4 1100
INDIRU4
EQU4 $3998
ADDRLP4 1096
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1100
INDIRU4
EQU4 $3998
line 7046
;7046:				{
line 7047
;7047:					trap_G2API_CleanGhoul2Models(&(saberEnt->ghoul2));
ADDRLP4 1092
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 7048
;7048:				}
LABELV $3998
line 7050
;7049:
;7050:				saberEnt->currentState.modelindex = 0;
ADDRLP4 1092
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 7051
;7051:				saberEnt->ghoul2 = NULL;
ADDRLP4 1092
INDIRP4
CNSTI4 952
ADDP4
CNSTP4 0
ASGNP4
line 7052
;7052:				VectorClear(saberEnt->currentState.pos.trBase);
ADDRLP4 1104
ADDRLP4 1092
INDIRP4
ASGNP4
ADDRLP4 1108
CNSTF4 0
ASGNF4
ADDRLP4 1104
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1108
INDIRF4
ASGNF4
ADDRLP4 1104
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 1108
INDIRF4
ASGNF4
ADDRLP4 1104
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1108
INDIRF4
ASGNF4
line 7053
;7053:			}
LABELV $3995
line 7054
;7054:			CG_AddSaberBlade( cent, cent, NULL, 0, 0, legs.origin, rootAngles, qfalse);
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 0+52
ARGP4
ADDRLP4 840
ARGP4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRGP4 CG_AddSaberBlade
CALLV
pop
line 7055
;7055:			cent->bolt3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 7056
;7056:			cent->bolt2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 7059
;7057:
;7058:			//cent->bolt4 = 0;
;7059:		}
line 7060
;7060:	}
ADDRGP4 $3905
JUMPV
LABELV $3904
line 7062
;7061:	else
;7062:	{
line 7063
;7063:		cent->saberLength = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 0
ASGNF4
line 7064
;7064:	}
LABELV $3905
line 7066
;7065:
;7066:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $4001
line 7067
;7067:	{
line 7068
;7068:		if (cent->ghoul2 && cent->currentState.saberInFlight && g2HasWeapon)
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4003
ADDRLP4 1076
CNSTI4 0
ASGNI4
ADDRLP4 1072
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 1076
INDIRI4
EQI4 $4003
ADDRLP4 536
INDIRI4
ADDRLP4 1076
INDIRI4
EQI4 $4003
line 7069
;7069:		{ //special case, kill the saber on a freshly dead player if another source says to.
line 7070
;7070:			trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 7071
;7071:			g2HasWeapon = qfalse;
ADDRLP4 536
CNSTI4 0
ASGNI4
line 7072
;7072:		}
LABELV $4003
line 7073
;7073:	}
LABELV $4001
line 7075
;7074:
;7075:	if (iwantout)
ADDRLP4 772
INDIRI4
CNSTI4 0
EQI4 $4005
line 7076
;7076:	{
line 7078
;7077:		//return;
;7078:		goto endOfCall;
ADDRGP4 $3920
JUMPV
LABELV $4005
line 7081
;7079:	}
;7080:
;7081:	if ((cg.snap->ps.fd.forcePowersActive & (1 << FP_SEE)) && cg.snap->ps.clientNum != cent->currentState.number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $4007
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $4007
line 7082
;7082:	{
line 7083
;7083:		legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7084
;7084:		legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 7085
;7085:		legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 7086
;7086:		legs.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 7087
;7087:	}
LABELV $4007
line 7089
;7088:
;7089:	if (cg.snap->ps.duelInProgress /*&& cent->currentState.number != cg.snap->ps.clientNum*/)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4017
line 7090
;7090:	{ //I guess go ahead and glow your own client too in a duel
line 7091
;7091:		if (cent->currentState.number != cg.snap->ps.duelIndex &&
ADDRLP4 1072
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 1072
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
EQI4 $4020
ADDRLP4 1072
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $4020
line 7093
;7092:			cent->currentState.number != cg.snap->ps.clientNum)
;7093:		{ //everyone not involved in the duel is drawn very dark
line 7094
;7094:			legs.shaderRGBA[0] = 50;
ADDRLP4 0+80
CNSTU1 50
ASGNU1
line 7095
;7095:			legs.shaderRGBA[1] = 50;
ADDRLP4 0+80+1
CNSTU1 50
ASGNU1
line 7096
;7096:			legs.shaderRGBA[2] = 50;
ADDRLP4 0+80+2
CNSTU1 50
ASGNU1
line 7097
;7097:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7098
;7098:		}
ADDRGP4 $4018
JUMPV
LABELV $4020
line 7100
;7099:		else
;7100:		{ //adjust the glow by how far away you are from your dueling partner
line 7103
;7101:			centity_t *duelEnt;
;7102:
;7103:			duelEnt = &cg_entities[cg.snap->ps.duelIndex];
ADDRLP4 1076
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 7105
;7104:			
;7105:			if (duelEnt)
ADDRLP4 1076
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4018
line 7106
;7106:			{
line 7108
;7107:				vec3_t vecSub;
;7108:				float subLen = 0;
ADDRLP4 1080
CNSTF4 0
ASGNF4
line 7110
;7109:
;7110:				VectorSubtract(duelEnt->lerpOrigin, cg.snap->ps.origin, vecSub);
ADDRLP4 1096
ADDRLP4 1076
INDIRP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1096
INDIRP4
CNSTI4 928
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1084+4
ADDRLP4 1096
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1084+8
ADDRLP4 1076
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
SUBF4
ASGNF4
line 7111
;7111:				subLen = VectorLength(vecSub);
ADDRLP4 1084
ARGP4
ADDRLP4 1100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1100
INDIRF4
ASGNF4
line 7113
;7112:
;7113:				if (subLen < 1)
ADDRLP4 1080
INDIRF4
CNSTF4 1065353216
GEF4 $4038
line 7114
;7114:				{
line 7115
;7115:					subLen = 1;
ADDRLP4 1080
CNSTF4 1065353216
ASGNF4
line 7116
;7116:				}
LABELV $4038
line 7118
;7117:
;7118:				if (subLen > 1020)
ADDRLP4 1080
INDIRF4
CNSTF4 1149173760
LEF4 $4040
line 7119
;7119:				{
line 7120
;7120:					subLen = 1020;
ADDRLP4 1080
CNSTF4 1149173760
ASGNF4
line 7121
;7121:				}
LABELV $4040
line 7123
;7122:
;7123:				legs.shaderRGBA[0] = 255 - subLen/4;
ADDRLP4 1108
CNSTF4 1132396544
ADDRLP4 1080
INDIRF4
CNSTF4 1082130432
DIVF4
SUBF4
ASGNF4
ADDRLP4 1112
CNSTF4 1325400064
ASGNF4
ADDRLP4 1108
INDIRF4
ADDRLP4 1112
INDIRF4
LTF4 $4044
ADDRLP4 1104
ADDRLP4 1108
INDIRF4
ADDRLP4 1112
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4045
JUMPV
LABELV $4044
ADDRLP4 1104
ADDRLP4 1108
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4045
ADDRLP4 0+80
ADDRLP4 1104
INDIRU4
CVUU1 4
ASGNU1
line 7124
;7124:				legs.shaderRGBA[1] = 255 - subLen/4;
ADDRLP4 1120
CNSTF4 1132396544
ADDRLP4 1080
INDIRF4
CNSTF4 1082130432
DIVF4
SUBF4
ASGNF4
ADDRLP4 1124
CNSTF4 1325400064
ASGNF4
ADDRLP4 1120
INDIRF4
ADDRLP4 1124
INDIRF4
LTF4 $4049
ADDRLP4 1116
ADDRLP4 1120
INDIRF4
ADDRLP4 1124
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4050
JUMPV
LABELV $4049
ADDRLP4 1116
ADDRLP4 1120
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4050
ADDRLP4 0+80+1
ADDRLP4 1116
INDIRU4
CVUU1 4
ASGNU1
line 7125
;7125:				legs.shaderRGBA[2] = 255 - subLen/4;
ADDRLP4 1132
CNSTF4 1132396544
ADDRLP4 1080
INDIRF4
CNSTF4 1082130432
DIVF4
SUBF4
ASGNF4
ADDRLP4 1136
CNSTF4 1325400064
ASGNF4
ADDRLP4 1132
INDIRF4
ADDRLP4 1136
INDIRF4
LTF4 $4054
ADDRLP4 1128
ADDRLP4 1132
INDIRF4
ADDRLP4 1136
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4055
JUMPV
LABELV $4054
ADDRLP4 1128
ADDRLP4 1132
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4055
ADDRLP4 0+80+2
ADDRLP4 1128
INDIRU4
CVUU1 4
ASGNU1
line 7127
;7126:
;7127:				if (legs.shaderRGBA[2] < 1) legs.shaderRGBA[2] = 1;
ADDRLP4 0+80+2
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $4056
ADDRLP4 0+80+2
CNSTU1 1
ASGNU1
LABELV $4056
line 7129
;7128:
;7129:				legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7130
;7130:				legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7131
;7131:				legs.customShader = cgs.media.forceShell;
ADDRLP4 0+76
ADDRGP4 cgs+70296+496
INDIRI4
ASGNI4
line 7133
;7132:		
;7133:				trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7135
;7134:
;7135:				legs.customShader = 0;
ADDRLP4 0+76
CNSTI4 0
ASGNI4
line 7137
;7136:
;7137:				legs.shaderRGBA[0] = 255 - subLen/8;
ADDRLP4 1144
CNSTF4 1132396544
ADDRLP4 1080
INDIRF4
CNSTF4 1090519040
DIVF4
SUBF4
ASGNF4
ADDRLP4 1148
CNSTF4 1325400064
ASGNF4
ADDRLP4 1144
INDIRF4
ADDRLP4 1148
INDIRF4
LTF4 $4070
ADDRLP4 1140
ADDRLP4 1144
INDIRF4
ADDRLP4 1148
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4071
JUMPV
LABELV $4070
ADDRLP4 1140
ADDRLP4 1144
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4071
ADDRLP4 0+80
ADDRLP4 1140
INDIRU4
CVUU1 4
ASGNU1
line 7138
;7138:				legs.shaderRGBA[1] = 255 - subLen/8;
ADDRLP4 1156
CNSTF4 1132396544
ADDRLP4 1080
INDIRF4
CNSTF4 1090519040
DIVF4
SUBF4
ASGNF4
ADDRLP4 1160
CNSTF4 1325400064
ASGNF4
ADDRLP4 1156
INDIRF4
ADDRLP4 1160
INDIRF4
LTF4 $4075
ADDRLP4 1152
ADDRLP4 1156
INDIRF4
ADDRLP4 1160
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4076
JUMPV
LABELV $4075
ADDRLP4 1152
ADDRLP4 1156
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4076
ADDRLP4 0+80+1
ADDRLP4 1152
INDIRU4
CVUU1 4
ASGNU1
line 7139
;7139:				legs.shaderRGBA[2] = 255 - subLen/8;
ADDRLP4 1168
CNSTF4 1132396544
ADDRLP4 1080
INDIRF4
CNSTF4 1090519040
DIVF4
SUBF4
ASGNF4
ADDRLP4 1172
CNSTF4 1325400064
ASGNF4
ADDRLP4 1168
INDIRF4
ADDRLP4 1172
INDIRF4
LTF4 $4080
ADDRLP4 1164
ADDRLP4 1168
INDIRF4
ADDRLP4 1172
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $4081
JUMPV
LABELV $4080
ADDRLP4 1164
ADDRLP4 1168
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $4081
ADDRLP4 0+80+2
ADDRLP4 1164
INDIRU4
CVUU1 4
ASGNU1
line 7141
;7140:
;7141:				if (legs.shaderRGBA[2] < 1)
ADDRLP4 0+80+2
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $4082
line 7142
;7142:				{
line 7143
;7143:					legs.shaderRGBA[2] = 1;
ADDRLP4 0+80+2
CNSTU1 1
ASGNU1
line 7144
;7144:				}
LABELV $4082
line 7145
;7145:				if (legs.shaderRGBA[2] > 255)
ADDRLP4 0+80+2
INDIRU1
CVUI4 1
CNSTI4 255
LEI4 $4088
line 7146
;7146:				{
line 7147
;7147:					legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7148
;7148:				}
LABELV $4088
line 7150
;7149:
;7150:				if (subLen <= 1024)
ADDRLP4 1080
INDIRF4
CNSTF4 1149239296
GTF4 $4018
line 7151
;7151:				{
line 7152
;7152:					legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7153
;7153:				}
line 7154
;7154:			}
line 7155
;7155:		}
line 7156
;7156:	}
ADDRGP4 $4018
JUMPV
LABELV $4017
line 7158
;7157:	else
;7158:	{
line 7159
;7159:		if (cent->currentState.bolt1 && !(cent->currentState.eFlags & EF_DEAD) && cent->currentState.number != cg.snap->ps.clientNum && (!cg.snap->ps.duelInProgress || cg.snap->ps.duelIndex != cent->currentState.number))
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1076
CNSTI4 0
ASGNI4
ADDRLP4 1072
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 1076
INDIRI4
EQI4 $4097
ADDRLP4 1072
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1076
INDIRI4
NEI4 $4097
ADDRLP4 1080
ADDRLP4 1072
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 1080
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $4097
ADDRGP4 cg+36
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 1076
INDIRI4
EQI4 $4102
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 1080
INDIRI4
EQI4 $4097
LABELV $4102
line 7160
;7160:		{
line 7161
;7161:			legs.shaderRGBA[0] = 50;
ADDRLP4 0+80
CNSTU1 50
ASGNU1
line 7162
;7162:			legs.shaderRGBA[1] = 50;
ADDRLP4 0+80+1
CNSTU1 50
ASGNU1
line 7163
;7163:			legs.shaderRGBA[2] = 50;
ADDRLP4 0+80+2
CNSTU1 50
ASGNU1
line 7164
;7164:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7165
;7165:		}
LABELV $4097
line 7166
;7166:	}
LABELV $4018
LABELV $3442
line 7168
;7167:doEssentialThree:
;7168:	if (cent->currentState.eFlags & EF_DISINTEGRATION)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $4109
line 7169
;7169:	{
line 7173
;7170:		vec3_t tempAng, hitLoc;
;7171:		float tempLength;
;7172:
;7173:		if (!cent->dustTrailTime)
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
NEI4 $4111
line 7174
;7174:		{
line 7175
;7175:			cent->dustTrailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 7176
;7176:			cent->miscTime = legs.frame;
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 0+104
INDIRI4
ASGNI4
line 7177
;7177:		}
LABELV $4111
line 7179
;7178:
;7179:		if ((cg.time - cent->dustTrailTime) > 1500)
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
SUBI4
CNSTI4 1500
LEI4 $4115
line 7180
;7180:		{ //avoid rendering the entity after disintegration has finished anyway
line 7181
;7181:			goto endOfCall;
ADDRGP4 $3920
JUMPV
LABELV $4115
line 7184
;7182:		}
;7183:
;7184:		trap_G2API_SetBoneAnim(legs.ghoul2, 0, "model_root", cent->miscTime, cent->miscTime, BONE_ANIM_OVERRIDE_FREEZE, 1.0f, cg.time, cent->miscTime, -1);
ADDRLP4 0+208
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
ARGI4
CNSTI4 72
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
CVIF4 4
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 7185
;7185:		trap_G2API_SetBoneAnim(legs.ghoul2, 0, "lower_lumbar", cent->miscTime, cent->miscTime, BONE_ANIM_OVERRIDE_FREEZE, 1.0f, cg.time, cent->miscTime, -1);
ADDRLP4 0+208
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
CNSTI4 72
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1104
INDIRI4
CVIF4 4
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 7186
;7186:		trap_G2API_SetBoneAnim(legs.ghoul2, 0, "Motion", cent->miscTime, cent->miscTime, BONE_ANIM_OVERRIDE_FREEZE, 1.0f, cg.time, cent->miscTime, -1);
ADDRLP4 0+208
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $311
ARGP4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1108
INDIRI4
ARGI4
ADDRLP4 1108
INDIRI4
ARGI4
CNSTI4 72
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1108
INDIRI4
CVIF4 4
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 7188
;7187:
;7188:		VectorCopy(cent->currentState.origin2, hitLoc);
ADDRLP4 1072
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 7190
;7189:
;7190:		VectorSubtract( hitLoc, legs.origin, legs.oldorigin );
ADDRLP4 0+64
ADDRLP4 1072
INDIRF4
ADDRLP4 0+52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+64+4
ADDRLP4 1072+4
INDIRF4
ADDRLP4 0+52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+64+8
ADDRLP4 1072+8
INDIRF4
ADDRLP4 0+52+8
INDIRF4
SUBF4
ASGNF4
line 7192
;7191:		
;7192:		tempLength = VectorNormalize( legs.oldorigin );
ADDRLP4 0+64
ARGP4
ADDRLP4 1112
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 1084
ADDRLP4 1112
INDIRF4
ASGNF4
line 7193
;7193:		vectoangles( legs.oldorigin, tempAng );
ADDRLP4 0+64
ARGP4
ADDRLP4 1088
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 7194
;7194:		tempAng[YAW] -= cent->lerpAngles[YAW];
ADDRLP4 1088+4
ADDRLP4 1088+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 7195
;7195:		AngleVectors( tempAng, legs.oldorigin, NULL, NULL );
ADDRLP4 1088
ARGP4
ADDRLP4 0+64
ARGP4
ADDRLP4 1116
CNSTP4 0
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 7196
;7196:		VectorScale( legs.oldorigin, tempLength, legs.oldorigin );
ADDRLP4 0+64
ADDRLP4 0+64
INDIRF4
ADDRLP4 1084
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+64+4
ADDRLP4 0+64+4
INDIRF4
ADDRLP4 1084
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+64+8
ADDRLP4 0+64+8
INDIRF4
ADDRLP4 1084
INDIRF4
MULF4
ASGNF4
line 7197
;7197:		legs.endTime = cent->dustTrailTime;
ADDRLP4 0+176
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 7206
;7198:
;7199:		//FIXME: Sorting is all wrong here, it can't decide if it should render this part or the outer body first
;7200:		/*
;7201:		legs.renderfx |= RF_DISINTEGRATE2;
;7202:		legs.customShader = cgs.media.disruptorShader;
;7203:		trap_R_AddRefEntityToScene( &legs );
;7204:		*/
;7205:
;7206:		legs.renderfx &= ~(RF_DISINTEGRATE2);
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -262145
BANDI4
ASGNI4
line 7207
;7207:		legs.renderfx |= (RF_DISINTEGRATE1);
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 7209
;7208:
;7209:		legs.customShader = 0;
ADDRLP4 0+76
CNSTI4 0
ASGNI4
line 7210
;7210:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7212
;7211:
;7212:		goto endOfCall;
ADDRGP4 $3920
JUMPV
LABELV $4109
line 7215
;7213:	}
;7214:	else
;7215:	{
line 7216
;7216:		cent->dustTrailTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 7217
;7217:		cent->miscTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 0
ASGNI4
line 7218
;7218:	}
line 7220
;7219:
;7220:	trap_R_AddRefEntityToScene(&legs);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7222
;7221:
;7222:	if (cent->isATST)
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4154
line 7223
;7223:	{
line 7225
;7224:		//return;
;7225:		goto endOfCall;
ADDRGP4 $3920
JUMPV
LABELV $4154
line 7228
;7226:	}
;7227:
;7228:	cent->frame_minus2 = cent->frame_minus1;
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 1072
INDIRP4
CNSTI4 1040
ADDP4
INDIRB
ASGNB 212
line 7229
;7229:	if (cent->frame_minus1_refreshed)
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4156
line 7230
;7230:	{
line 7231
;7231:		cent->frame_minus2_refreshed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1468
ADDP4
CNSTI4 1
ASGNI4
line 7232
;7232:	}
LABELV $4156
line 7233
;7233:	cent->frame_minus1 = legs;
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
ADDRLP4 0
INDIRB
ASGNB 212
line 7234
;7234:	cent->frame_minus1_refreshed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 1
ASGNI4
line 7236
;7235:
;7236:	if (!cent->frame_hold_refreshed && (cent->currentState.powerups & (1 << PW_SPEEDBURST)))
ADDRLP4 1076
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 1076
INDIRP4
CNSTI4 1688
ADDP4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $4158
ADDRLP4 1076
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 1080
INDIRI4
EQI4 $4158
line 7237
;7237:	{
line 7238
;7238:		cent->frame_hold_time = cg.time + 254;
ADDRFP4 0
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 254
ADDI4
ASGNI4
line 7239
;7239:	}
LABELV $4158
line 7241
;7240:
;7241:	if (cent->frame_hold_time >= cg.time)
ADDRFP4 0
INDIRP4
CNSTI4 1684
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LTI4 $4161
line 7242
;7242:	{
line 7243
;7243:		if (!cent->frame_hold_refreshed)
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $4164
line 7244
;7244:		{ //We're taking the ghoul2 instance from the original refent and duplicating it onto our refent alias so that we can then freeze the frame and fade it for the effect
line 7245
;7245:			if (cent->frame_hold.ghoul2 && trap_G2_HaveWeGhoul2Models(cent->frame_hold.ghoul2) &&
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1084
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4166
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $4166
ADDRLP4 1092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 1680
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1092
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
EQU4 $4166
line 7247
;7246:				cent->frame_hold.ghoul2 != cent->ghoul2)
;7247:			{
line 7248
;7248:				trap_G2API_CleanGhoul2Models(&(cent->frame_hold.ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 7249
;7249:			}
LABELV $4166
line 7250
;7250:			cent->frame_hold = legs;
ADDRFP4 0
INDIRP4
CNSTI4 1472
ADDP4
ADDRLP4 0
INDIRB
ASGNB 212
line 7251
;7251:			cent->frame_hold_refreshed = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
CNSTI4 1
ASGNI4
line 7252
;7252:			cent->frame_hold.ghoul2 = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
CNSTP4 0
ASGNP4
line 7254
;7253:	
;7254:			trap_G2API_DuplicateGhoul2Instance(cent->ghoul2, &cent->frame_hold.ghoul2);
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 1680
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 7258
;7255:
;7256:			//Set the animation to the current frame and freeze on end
;7257:			//trap_G2API_SetBoneAnim(cent->frame_hold.ghoul2, 0, "model_root", cent->frame_hold.frame, cent->frame_hold.frame, BONE_ANIM_OVERRIDE_FREEZE, 1.0f, cg.time, cent->frame_hold.frame, -1);
;7258:			trap_G2API_SetBoneAnim(cent->frame_hold.ghoul2, 0, "model_root", cent->frame_hold.frame, cent->frame_hold.frame, 0, 1.0f, cg.time, cent->frame_hold.frame, -1);
ADDRLP4 1100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 1680
ADDP4
INDIRP4
ARGP4
ADDRLP4 1104
CNSTI4 0
ASGNI4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRGP4 $299
ARGP4
ADDRLP4 1108
ADDRLP4 1100
INDIRP4
CNSTI4 1576
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1108
INDIRI4
ARGI4
ADDRLP4 1108
INDIRI4
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 1108
INDIRI4
CVIF4 4
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 7259
;7259:		}
LABELV $4164
line 7261
;7260:
;7261:		cent->frame_hold.renderfx |= RF_FORCE_ENT_ALPHA;
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 1476
ADDP4
ASGNP4
ADDRLP4 1084
INDIRP4
ADDRLP4 1084
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 7262
;7262:		cent->frame_hold.shaderRGBA[3] = (cent->frame_hold_time - cg.time);
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 1555
ADDP4
ADDRLP4 1088
INDIRP4
CNSTI4 1684
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 7263
;7263:		if (cent->frame_hold.shaderRGBA[3] > 254)
ADDRFP4 0
INDIRP4
CNSTI4 1555
ADDP4
INDIRU1
CVUI4 1
CNSTI4 254
LEI4 $4170
line 7264
;7264:		{
line 7265
;7265:			cent->frame_hold.shaderRGBA[3] = 254;
ADDRFP4 0
INDIRP4
CNSTI4 1555
ADDP4
CNSTU1 254
ASGNU1
line 7266
;7266:		}
LABELV $4170
line 7267
;7267:		if (cent->frame_hold.shaderRGBA[3] < 1)
ADDRFP4 0
INDIRP4
CNSTI4 1555
ADDP4
INDIRU1
CVUI4 1
CNSTI4 1
GEI4 $4172
line 7268
;7268:		{
line 7269
;7269:			cent->frame_hold.shaderRGBA[3] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1555
ADDP4
CNSTU1 1
ASGNU1
line 7270
;7270:		}
LABELV $4172
line 7272
;7271:
;7272:		trap_R_AddRefEntityToScene(&cent->frame_hold);
ADDRFP4 0
INDIRP4
CNSTI4 1472
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7273
;7273:	}
ADDRGP4 $4162
JUMPV
LABELV $4161
line 7275
;7274:	else
;7275:	{
line 7276
;7276:		cent->frame_hold_refreshed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
CNSTI4 0
ASGNI4
line 7277
;7277:	}
LABELV $4162
line 7282
;7278:
;7279:	//
;7280:	// add the gun / barrel / flash
;7281:	//
;7282:	if (cent->currentState.weapon != WP_EMPLACED_GUN)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 14
EQI4 $4174
line 7283
;7283:	{
line 7284
;7284:		CG_AddPlayerWeapon( &legs, NULL, cent, ci->team, rootAngles, qtrue );
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 828
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 840
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 7285
;7285:	}
LABELV $4174
line 7287
;7286:	// add powerups floating behind the player
;7287:	CG_PlayerPowerups( cent, &legs );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 7289
;7288:
;7289:	if ((cent->currentState.forcePowersActive & (1 << FP_RAGE)) &&
ADDRLP4 1084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
CNSTI4 0
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 1088
INDIRI4
EQI4 $4176
ADDRGP4 cg+88
INDIRI4
ADDRLP4 1088
INDIRI4
NEI4 $4180
ADDRLP4 1084
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $4176
LABELV $4180
line 7291
;7290:		(cg.renderingThirdPerson || cent->currentState.number != cg.snap->ps.clientNum))
;7291:	{
line 7293
;7292:		//legs.customShader = cgs.media.rageShader;
;7293:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7294
;7294:		legs.renderfx &= ~RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 7296
;7295:
;7296:		legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7297
;7297:		legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7298
;7298:		legs.shaderRGBA[1] = legs.shaderRGBA[2] = 0;
ADDRLP4 1092
CNSTU1 0
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 1092
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 1092
INDIRU1
ASGNU1
line 7299
;7299:		legs.shaderRGBA[3] = 255;
ADDRLP4 0+80+3
CNSTU1 255
ASGNU1
line 7301
;7300:
;7301:		if ( rand() & 1 )
ADDRLP4 1096
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $4191
line 7302
;7302:		{
line 7303
;7303:			legs.customShader = cgs.media.electricBodyShader;	
ADDRLP4 0+76
ADDRGP4 cgs+70296+396
INDIRI4
ASGNI4
line 7304
;7304:		}
ADDRGP4 $4192
JUMPV
LABELV $4191
line 7306
;7305:		else
;7306:		{
line 7307
;7307:			legs.customShader = cgs.media.electricBody2Shader;
ADDRLP4 0+76
ADDRGP4 cgs+70296+400
INDIRI4
ASGNI4
line 7308
;7308:		}
LABELV $4192
line 7310
;7309:
;7310:		trap_R_AddRefEntityToScene(&legs);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7311
;7311:	}
LABELV $4176
line 7313
;7312:
;7313:	if (!cg.snap->ps.duelInProgress && cent->currentState.bolt1 && !(cent->currentState.eFlags & EF_DEAD) && cent->currentState.number != cg.snap->ps.clientNum && (!cg.snap->ps.duelInProgress || cg.snap->ps.duelIndex != cent->currentState.number))
ADDRLP4 1092
CNSTI4 1348
ASGNI4
ADDRLP4 1096
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 1092
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1096
INDIRI4
NEI4 $4199
ADDRLP4 1100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 1096
INDIRI4
EQI4 $4199
ADDRLP4 1100
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1096
INDIRI4
NEI4 $4199
ADDRLP4 1104
ADDRLP4 1100
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 1104
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $4199
ADDRGP4 cg+36
INDIRP4
ADDRLP4 1092
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1096
INDIRI4
EQI4 $4205
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 1104
INDIRI4
EQI4 $4199
LABELV $4205
line 7314
;7314:	{
line 7315
;7315:		legs.shaderRGBA[0] = 50;
ADDRLP4 0+80
CNSTU1 50
ASGNU1
line 7316
;7316:		legs.shaderRGBA[1] = 50;
ADDRLP4 0+80+1
CNSTU1 50
ASGNU1
line 7317
;7317:		legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7319
;7318:
;7319:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7320
;7320:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7321
;7321:		legs.customShader = cgs.media.forceSightBubble;
ADDRLP4 0+76
ADDRGP4 cgs+70296+492
INDIRI4
ASGNI4
line 7323
;7322:		
;7323:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7324
;7324:	}
LABELV $4199
line 7328
;7325:
;7326:	//For now, these two are using the old shield shader. This is just so that you
;7327:	//can tell it apart from the JM/duel shaders, but it's still very obvious.
;7328:	if (cent->currentState.forcePowersActive & (1 << FP_PROTECT))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $4216
line 7329
;7329:	{ //aborb is represented by green..
line 7330
;7330:		legs.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 7331
;7331:		legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 7332
;7332:		legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 7333
;7333:		legs.shaderRGBA[3] = 254;
ADDRLP4 0+80+3
CNSTU1 254
ASGNU1
line 7335
;7334:
;7335:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7336
;7336:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7337
;7337:		legs.customShader = cgs.media.playerShieldDamage;
ADDRLP4 0+76
ADDRGP4 cgs+70296+488
INDIRI4
ASGNI4
line 7339
;7338:		
;7339:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7340
;7340:	}
LABELV $4216
line 7343
;7341:	//if (cent->currentState.forcePowersActive & (1 << FP_ABSORB))
;7342:	//Showing only when the power has been active (absorbed something) recently now, instead of always.
;7343:	if (cg_entities[cent->currentState.number].teamPowerEffectTime > cg.time && cg_entities[cent->currentState.number].teamPowerType == 3)
ADDRLP4 1108
CNSTI4 1920
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 1108
INDIRI4
ADDRGP4 cg_entities+1912
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $4230
ADDRLP4 1108
INDIRI4
ADDRGP4 cg_entities+1916
ADDP4
INDIRI4
CNSTI4 3
NEI4 $4230
line 7344
;7344:	{ //aborb is represented by blue..
line 7345
;7345:		legs.shaderRGBA[0] = 0;
ADDRLP4 0+80
CNSTU1 0
ASGNU1
line 7346
;7346:		legs.shaderRGBA[1] = 0;
ADDRLP4 0+80+1
CNSTU1 0
ASGNU1
line 7347
;7347:		legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7348
;7348:		legs.shaderRGBA[3] = 254;
ADDRLP4 0+80+3
CNSTU1 254
ASGNU1
line 7350
;7349:
;7350:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7351
;7351:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7352
;7352:		legs.customShader = cgs.media.playerShieldDamage;
ADDRLP4 0+76
ADDRGP4 cgs+70296+488
INDIRI4
ASGNI4
line 7354
;7353:		
;7354:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7355
;7355:	}
LABELV $4230
line 7357
;7356:
;7357:	if (cent->currentState.isJediMaster && cg.snap->ps.clientNum != cent->currentState.number)
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $4247
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 1112
INDIRP4
INDIRI4
EQI4 $4247
line 7358
;7358:	{
line 7359
;7359:		legs.shaderRGBA[0] = 100;
ADDRLP4 0+80
CNSTU1 100
ASGNU1
line 7360
;7360:		legs.shaderRGBA[1] = 100;
ADDRLP4 0+80+1
CNSTU1 100
ASGNU1
line 7361
;7361:		legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7363
;7362:
;7363:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7364
;7364:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7365
;7365:		legs.renderfx |= RF_NODEPTH;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 7366
;7366:		legs.customShader = cgs.media.forceShell;
ADDRLP4 0+76
ADDRGP4 cgs+70296+496
INDIRI4
ASGNI4
line 7368
;7367:		
;7368:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7370
;7369:
;7370:		legs.renderfx &= ~RF_NODEPTH;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 7371
;7371:	}
LABELV $4247
line 7373
;7372:
;7373:	if ((cg.snap->ps.fd.forcePowersActive & (1 << FP_SEE)) && cg.snap->ps.clientNum != cent->currentState.number && cg_auraShell.integer)
ADDRLP4 1116
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 1116
INDIRI4
EQI4 $4262
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $4262
ADDRGP4 cg_auraShell+12
INDIRI4
ADDRLP4 1116
INDIRI4
EQI4 $4262
line 7374
;7374:	{
line 7375
;7375:		if (cgs.gametype >= GT_TEAM)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $4267
line 7376
;7376:		{	// A team game
line 7377
;7377:			switch(cgs.clientinfo[ cent->currentState.clientNum ].team)
ADDRLP4 1120
CNSTI4 788
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 1
EQI4 $4275
ADDRLP4 1120
INDIRI4
CNSTI4 2
EQI4 $4281
ADDRGP4 $4270
JUMPV
line 7378
;7378:			{
LABELV $4275
line 7380
;7379:			case TEAM_RED:
;7380:				legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7381
;7381:				legs.shaderRGBA[1] = 50;
ADDRLP4 0+80+1
CNSTU1 50
ASGNU1
line 7382
;7382:				legs.shaderRGBA[2] = 50;
ADDRLP4 0+80+2
CNSTU1 50
ASGNU1
line 7383
;7383:				break;
ADDRGP4 $4268
JUMPV
LABELV $4281
line 7385
;7384:			case TEAM_BLUE:
;7385:				legs.shaderRGBA[0] = 75;
ADDRLP4 0+80
CNSTU1 75
ASGNU1
line 7386
;7386:				legs.shaderRGBA[1] = 75;
ADDRLP4 0+80+1
CNSTU1 75
ASGNU1
line 7387
;7387:				legs.shaderRGBA[2] = 255;
ADDRLP4 0+80+2
CNSTU1 255
ASGNU1
line 7388
;7388:				break;
ADDRGP4 $4268
JUMPV
LABELV $4270
line 7391
;7389:
;7390:			default:
;7391:				legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7392
;7392:				legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 7393
;7393:				legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 7394
;7394:				break;
line 7396
;7395:			}
;7396:		}
ADDRGP4 $4268
JUMPV
LABELV $4267
line 7398
;7397:		else
;7398:		{	// Not a team game
line 7399
;7399:			legs.shaderRGBA[0] = 255;
ADDRLP4 0+80
CNSTU1 255
ASGNU1
line 7400
;7400:			legs.shaderRGBA[1] = 255;
ADDRLP4 0+80+1
CNSTU1 255
ASGNU1
line 7401
;7401:			legs.shaderRGBA[2] = 0;
ADDRLP4 0+80+2
CNSTU1 0
ASGNU1
line 7402
;7402:		}
LABELV $4268
line 7404
;7403:
;7404:/*		if (cg.snap->ps.fd.forcePowerLevel[FP_SEE] <= FORCE_LEVEL_1)
line 7410
;7405:		{
;7406:			legs.renderfx |= RF_MINLIGHT;
;7407:		}
;7408:		else
;7409:*/		{	// See through walls.
;7410:			legs.renderfx |= RF_MINLIGHT | RF_NODEPTH;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 17
BORI4
ASGNI4
line 7412
;7411:
;7412:			if (cg.snap->ps.fd.forcePowerLevel[FP_SEE] < FORCE_LEVEL_2)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
CNSTI4 2
GEI4 $4298
line 7413
;7413:			{ //only level 2+ can see players through walls
line 7414
;7414:				legs.renderfx &= ~RF_NODEPTH;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 7415
;7415:			}
LABELV $4298
line 7416
;7416:		}
line 7418
;7417:
;7418:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7419
;7419:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7420
;7420:		legs.customShader = cgs.media.sightShell;
ADDRLP4 0+76
ADDRGP4 cgs+70296+500
INDIRI4
ASGNI4
line 7422
;7421:		
;7422:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7423
;7423:	}
LABELV $4262
line 7427
;7424:
;7425:	// Electricity
;7426:	//------------------------------------------------
;7427:	if ( cent->currentState.emplacedOwner > cg.time ) 
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $4307
line 7428
;7428:	{
line 7429
;7429:		int	dif = cent->currentState.emplacedOwner - cg.time;
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
ASGNI4
line 7431
;7430:
;7431:		if ( dif > 0 && random() > 0.4f )
ADDRLP4 1120
INDIRI4
CNSTI4 0
LEI4 $4311
ADDRLP4 1124
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
LEF4 $4311
line 7432
;7432:		{
line 7434
;7433:			// fade out over the last 500 ms
;7434:			int brightness = 255;
ADDRLP4 1128
CNSTI4 255
ASGNI4
line 7436
;7435:			
;7436:			if ( dif < 500 )
ADDRLP4 1120
INDIRI4
CNSTI4 500
GEI4 $4313
line 7437
;7437:			{
line 7438
;7438:				brightness = floor((dif - 500.0f) / 500.0f * 255.0f );
ADDRLP4 1132
CNSTF4 1140457472
ASGNF4
CNSTF4 1132396544
ADDRLP4 1120
INDIRI4
CVIF4 4
ADDRLP4 1132
INDIRF4
SUBF4
ADDRLP4 1132
INDIRF4
DIVF4
MULF4
ARGF4
ADDRLP4 1136
ADDRGP4 floor
CALLF4
ASGNF4
ADDRLP4 1128
ADDRLP4 1136
INDIRF4
CVFI4 4
ASGNI4
line 7439
;7439:			}
LABELV $4313
line 7441
;7440:
;7441:			legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7442
;7442:			legs.renderfx &= ~RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 7444
;7443:
;7444:			legs.renderfx |= RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 7445
;7445:			legs.shaderRGBA[0] = legs.shaderRGBA[1] = legs.shaderRGBA[2] = brightness;
ADDRLP4 1132
ADDRLP4 1128
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 1132
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 1132
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 1132
INDIRU1
ASGNU1
line 7446
;7446:			legs.shaderRGBA[3] = 255;
ADDRLP4 0+80+3
CNSTU1 255
ASGNU1
line 7448
;7447:
;7448:			if ( rand() & 1 )
ADDRLP4 1136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $4325
line 7449
;7449:			{
line 7450
;7450:				legs.customShader = cgs.media.electricBodyShader;	
ADDRLP4 0+76
ADDRGP4 cgs+70296+396
INDIRI4
ASGNI4
line 7451
;7451:			}
ADDRGP4 $4326
JUMPV
LABELV $4325
line 7453
;7452:			else
;7453:			{
line 7454
;7454:				legs.customShader = cgs.media.electricBody2Shader;
ADDRLP4 0+76
ADDRGP4 cgs+70296+400
INDIRI4
ASGNI4
line 7455
;7455:			}
LABELV $4326
line 7457
;7456:
;7457:			trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7459
;7458:
;7459:			if ( random() > 0.9f )
ADDRLP4 1140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1063675494
LEF4 $4333
line 7460
;7460:				trap_S_StartSound ( NULL, cent->currentState.number, CHAN_AUTO, cgs.media.crackleSound );
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+676
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $4333
line 7461
;7461:		}
LABELV $4311
line 7462
;7462:	} 
LABELV $4307
line 7464
;7463:
;7464:	if (cent->currentState.powerups & (1 << PW_SHIELDHIT))
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $4337
line 7465
;7465:	{
line 7473
;7466:		/*
;7467:		legs.shaderRGBA[0] = legs.shaderRGBA[1] = legs.shaderRGBA[2] = 255.0f * 0.5f;//t;
;7468:		legs.shaderRGBA[3] = 255;
;7469:		legs.renderfx &= ~RF_ALPHA_FADE;
;7470:		legs.renderfx |= RF_RGB_TINT;
;7471:		*/
;7472:
;7473:		legs.shaderRGBA[0] = legs.shaderRGBA[1] = legs.shaderRGBA[2] = Q_irand(1, 255);
CNSTI4 1
ARGI4
CNSTI4 255
ARGI4
ADDRLP4 1120
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1124
ADDRLP4 1120
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRLP4 0+80+2
ADDRLP4 1124
INDIRU1
ASGNU1
ADDRLP4 0+80+1
ADDRLP4 1124
INDIRU1
ASGNU1
ADDRLP4 0+80
ADDRLP4 1124
INDIRU1
ASGNU1
line 7475
;7474:
;7475:		legs.renderfx &= ~RF_FORCE_ENT_ALPHA;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 7476
;7476:		legs.renderfx &= ~RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 7477
;7477:		legs.renderfx &= ~RF_RGB_TINT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 7478
;7478:		legs.customShader = cgs.media.playerShieldDamage;
ADDRLP4 0+76
ADDRGP4 cgs+70296+488
INDIRI4
ASGNI4
line 7480
;7479:		
;7480:		trap_R_AddRefEntityToScene( &legs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 7481
;7481:	}
LABELV $4337
LABELV $3920
line 7484
;7482:endOfCall:
;7483:	
;7484:	if (cgBoneAnglePostSet.refreshSet)
ADDRGP4 cgBoneAnglePostSet+52
INDIRI4
CNSTI4 0
EQI4 $4350
line 7485
;7485:	{
line 7486
;7486:		trap_G2API_SetBoneAngles(cgBoneAnglePostSet.ghoul2, cgBoneAnglePostSet.modelIndex, cgBoneAnglePostSet.boneName,
ADDRGP4 cgBoneAnglePostSet
INDIRP4
ARGP4
ADDRGP4 cgBoneAnglePostSet+4
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+8
INDIRP4
ARGP4
ADDRGP4 cgBoneAnglePostSet+12
ARGP4
ADDRGP4 cgBoneAnglePostSet+24
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+28
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+32
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+36
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+40
INDIRP4
ARGP4
ADDRGP4 cgBoneAnglePostSet+44
INDIRI4
ARGI4
ADDRGP4 cgBoneAnglePostSet+48
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 7490
;7487:			cgBoneAnglePostSet.angles, cgBoneAnglePostSet.flags, cgBoneAnglePostSet.up, cgBoneAnglePostSet.right,
;7488:			cgBoneAnglePostSet.forward, cgBoneAnglePostSet.modelList, cgBoneAnglePostSet.blendTime, cgBoneAnglePostSet.currentTime);
;7489:
;7490:		cgBoneAnglePostSet.refreshSet = qfalse;
ADDRGP4 cgBoneAnglePostSet+52
CNSTI4 0
ASGNI4
line 7491
;7491:	}
LABELV $4350
line 7492
;7492:}
LABELV $3077
endproc CG_Player 1388 44
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 56 20
line 7505
;7493:
;7494:
;7495://=====================================================================
;7496:
;7497:/*
;7498:===============
;7499:CG_ResetPlayerEntity
;7500:
;7501:A player just came into view or teleported, so reset all animation info
;7502:===============
;7503:*/
;7504:void CG_ResetPlayerEntity( centity_t *cent ) 
;7505:{
line 7506
;7506:	cent->errorTime = -99999;		// guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 860
ADDP4
CNSTI4 -99999
ASGNI4
line 7507
;7507:	cent->extrapolated = qfalse;	
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
CNSTI4 0
ASGNI4
line 7509
;7508:
;7509:	CG_ClearLerpFrame( cent, &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.legs, cent->currentState.legsAnim, qfalse);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 788
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 7510
;7510:	CG_ClearLerpFrame( cent, &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.torso, cent->currentState.torsoAnim, qtrue);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 788
ADDRLP4 4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 7512
;7511:
;7512:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 7513
;7513:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 940
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 7515
;7514:
;7515:	VectorCopy( cent->lerpOrigin, cent->rawOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 892
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 7516
;7516:	VectorCopy( cent->lerpAngles, cent->rawAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 904
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 940
ADDP4
INDIRB
ASGNB 12
line 7518
;7517:
;7518:	memset( &cent->pe.legs, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 7519
;7519:	cent->pe.legs.yawAngle = cent->rawAngles[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 664
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 908
ADDP4
INDIRF4
ASGNF4
line 7520
;7520:	cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTI4 0
ASGNI4
line 7521
;7521:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 0
ASGNF4
line 7522
;7522:	cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 7524
;7523:
;7524:	memset( &cent->pe.torso, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 7525
;7525:	cent->pe.torso.yawAngle = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 908
ADDP4
INDIRF4
ASGNF4
line 7526
;7526:	cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 0
ASGNI4
line 7527
;7527:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 736
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 904
ADDP4
INDIRF4
ASGNF4
line 7528
;7528:	cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 0
ASGNI4
line 7530
;7529:
;7530:	if ((cent->ghoul2 == NULL) && trap_G2_HaveWeGhoul2Models(cgs.clientinfo[cent->currentState.clientNum].ghoul2Model))
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $4369
CNSTI4 788
ADDRLP4 36
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $4369
line 7531
;7531:	{
line 7532
;7532:		trap_G2API_DuplicateGhoul2Instance(cgs.clientinfo[cent->currentState.clientNum].ghoul2Model, &cent->ghoul2);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 788
ADDRLP4 44
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 7533
;7533:		CG_CopyG2WeaponInstance(cent->currentState.weapon, cgs.clientinfo[cent->currentState.clientNum].ghoul2Model);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
CNSTI4 788
ADDRLP4 48
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+504
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_CopyG2WeaponInstance
CALLV
pop
line 7534
;7534:		cent->weapon = cent->currentState.weapon;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 7535
;7535:	}
LABELV $4369
line 7537
;7536:
;7537:	if ( cg_debugPosition.integer ) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $4377
line 7538
;7538:		CG_Printf("%i ResetPlayerEntity yaw=%i\n", cent->currentState.number, cent->pe.torso.yawAngle );
ADDRGP4 $4380
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 728
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 7539
;7539:	}
LABELV $4377
line 7540
;7540:}
LABELV $4364
endproc CG_ResetPlayerEntity 56 20
import forceHolocronModels
import CG_AllocMark
bss
export cgBoneAnglePostSet
align 4
LABELV cgBoneAnglePostSet
skip 56
import animTable
import g2WeaponInstances
import CG_CheckPlayerG2Weapons
import CG_CopyG2WeaponInstance
import CG_ShutDownG2Weapons
import CG_InitG2Weapons
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
import CG_OutOfAmmoChange
import CG_DrawIconBackground
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_GetClientWeaponMuzzleBoltPoint
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
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
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
LABELV $4380
char 1 37
char 1 105
char 1 32
char 1 82
char 1 101
char 1 115
char 1 101
char 1 116
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 69
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 32
char 1 121
char 1 97
char 1 119
char 1 61
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $3930
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
LABELV $3929
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 0
align 1
LABELV $3913
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
LABELV $3702
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 99
char 1 111
char 1 110
char 1 102
char 1 117
char 1 115
char 1 105
char 1 111
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $3627
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 117
char 1 112
char 1 115
char 1 47
char 1 121
char 1 115
char 1 97
char 1 108
char 1 105
char 1 109
char 1 97
char 1 114
char 1 105
char 1 115
char 1 104
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $3566
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
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 105
char 1 100
char 1 108
char 1 101
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $3551
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 114
char 1 101
char 1 100
char 1 95
char 1 112
char 1 111
char 1 114
char 1 116
char 1 97
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $3532
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $3531
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $3530
char 1 108
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $3365
char 1 48
char 1 0
align 1
LABELV $3364
char 1 99
char 1 103
char 1 95
char 1 102
char 1 112
char 1 108
char 1 115
char 1 0
align 1
LABELV $3337
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 114
char 1 101
char 1 109
char 1 111
char 1 116
char 1 101
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $3211
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
LABELV $3208
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
LABELV $3107
char 1 66
char 1 97
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 78
char 1 117
char 1 109
char 1 32
char 1 111
char 1 110
char 1 32
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 32
char 1 101
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $3054
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
LABELV $3053
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
char 1 95
char 1 102
char 1 112
char 1 108
char 1 115
char 1 50
char 1 46
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $2517
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 114
char 1 105
char 1 99
char 1 50
char 1 0
align 1
LABELV $2120
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
char 1 105
char 1 116
char 1 119
char 1 97
char 1 108
char 1 108
char 1 37
char 1 105
char 1 0
align 1
LABELV $2094
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 112
char 1 97
char 1 114
char 1 107
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1978
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 98
char 1 108
char 1 111
char 1 111
char 1 100
char 1 95
char 1 115
char 1 112
char 1 97
char 1 114
char 1 107
char 1 115
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1929
char 1 103
char 1 102
char 1 120
char 1 47
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 68
char 1 97
char 1 109
char 1 97
char 1 103
char 1 101
char 1 71
char 1 108
char 1 111
char 1 119
char 1 0
align 1
LABELV $1530
char 1 103
char 1 102
char 1 120
char 1 47
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 80
char 1 117
char 1 115
char 1 104
char 1 0
align 1
LABELV $1195
char 1 99
char 1 101
char 1 114
char 1 118
char 1 105
char 1 99
char 1 97
char 1 108
char 1 0
align 1
LABELV $1163
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
LABELV $1088
char 1 66
char 1 97
char 1 100
char 1 32
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 32
char 1 109
char 1 111
char 1 118
char 1 101
char 1 109
char 1 101
char 1 110
char 1 116
char 1 32
char 1 97
char 1 110
char 1 103
char 1 108
char 1 101
char 1 0
align 1
LABELV $938
char 1 67
char 1 108
char 1 97
char 1 109
char 1 112
char 1 32
char 1 108
char 1 102
char 1 45
char 1 62
char 1 102
char 1 114
char 1 97
char 1 109
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 10
char 1 0
align 1
LABELV $745
char 1 37
char 1 100
char 1 58
char 1 32
char 1 37
char 1 100
char 1 32
char 1 65
char 1 110
char 1 105
char 1 109
char 1 58
char 1 32
char 1 37
char 1 105
char 1 44
char 1 32
char 1 39
char 1 37
char 1 115
char 1 39
char 1 10
char 1 0
align 1
LABELV $738
char 1 66
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
char 1 110
char 1 117
char 1 109
char 1 98
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $718
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
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
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $697
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
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
char 1 99
char 1 114
char 1 97
char 1 115
char 1 104
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $691
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
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
char 1 115
char 1 116
char 1 101
char 1 112
char 1 50
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $690
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
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
char 1 115
char 1 116
char 1 101
char 1 112
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $610
char 1 77
char 1 101
char 1 109
char 1 111
char 1 114
char 1 121
char 1 32
char 1 105
char 1 115
char 1 32
char 1 108
char 1 111
char 1 119
char 1 46
char 1 32
char 1 32
char 1 85
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 100
char 1 101
char 1 102
char 1 101
char 1 114
char 1 114
char 1 101
char 1 100
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 46
char 1 10
char 1 0
align 1
LABELV $577
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
LABELV $544
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $542
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
LABELV $540
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
LABELV $538
char 1 116
char 1 108
char 1 0
align 1
LABELV $536
char 1 116
char 1 116
char 1 0
align 1
LABELV $534
char 1 116
char 1 0
align 1
LABELV $532
char 1 108
char 1 0
align 1
LABELV $530
char 1 119
char 1 0
align 1
LABELV $528
char 1 104
char 1 99
char 1 0
align 1
LABELV $526
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $524
char 1 99
char 1 50
char 1 0
align 1
LABELV $521
char 1 99
char 1 49
char 1 0
align 1
LABELV $518
char 1 110
char 1 0
align 1
LABELV $511
char 1 67
char 1 71
char 1 95
char 1 83
char 1 101
char 1 116
char 1 68
char 1 101
char 1 102
char 1 101
char 1 114
char 1 114
char 1 101
char 1 100
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 73
char 1 110
char 1 102
char 1 111
char 1 58
char 1 32
char 1 110
char 1 111
char 1 32
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 33
char 1 10
char 1 0
align 1
LABELV $434
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 37
char 1 115
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $431
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 109
char 1 112
char 1 95
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 95
char 1 102
char 1 101
char 1 109
char 1 97
char 1 108
char 1 101
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 0
align 1
LABELV $426
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 37
char 1 115
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $423
char 1 37
char 1 115
char 1 0
align 1
LABELV $403
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
char 1 37
char 1 115
char 1 47
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 115
char 1 95
char 1 37
char 1 115
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $402
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
char 1 37
char 1 115
char 1 47
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 115
char 1 95
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $399
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
char 1 37
char 1 115
char 1 47
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 115
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $395
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 109
char 1 112
char 1 95
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 95
char 1 109
char 1 97
char 1 108
char 1 101
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 0
align 1
LABELV $394
char 1 116
char 1 97
char 1 103
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $381
char 1 68
char 1 69
char 1 70
char 1 65
char 1 85
char 1 76
char 1 84
char 1 95
char 1 77
char 1 79
char 1 68
char 1 69
char 1 76
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 32
char 1 102
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 114
char 1 101
char 1 103
char 1 105
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $378
char 1 68
char 1 69
char 1 70
char 1 65
char 1 85
char 1 76
char 1 84
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 77
char 1 79
char 1 68
char 1 69
char 1 76
char 1 32
char 1 47
char 1 32
char 1 115
char 1 107
char 1 105
char 1 110
char 1 32
char 1 40
char 1 37
char 1 115
char 1 47
char 1 37
char 1 115
char 1 41
char 1 32
char 1 102
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 114
char 1 101
char 1 103
char 1 105
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $375
char 1 69
char 1 109
char 1 112
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $374
char 1 82
char 1 101
char 1 98
char 1 101
char 1 108
char 1 108
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $366
char 1 47
char 1 0
align 1
LABELV $341
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
char 1 37
char 1 115
char 1 47
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 37
char 1 115
char 1 0
align 1
LABELV $312
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
LABELV $311
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $310
char 1 42
char 1 104
char 1 101
char 1 97
char 1 100
char 1 95
char 1 116
char 1 111
char 1 112
char 1 0
align 1
LABELV $309
char 1 42
char 1 108
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $307
char 1 99
char 1 114
char 1 97
char 1 110
char 1 105
char 1 117
char 1 109
char 1 0
align 1
LABELV $303
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
LABELV $299
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
LABELV $296
char 1 42
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $295
char 1 112
char 1 101
char 1 108
char 1 118
char 1 105
char 1 115
char 1 0
align 1
LABELV $294
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 50
char 1 0
align 1
LABELV $292
char 1 114
char 1 95
char 1 99
char 1 108
char 1 97
char 1 118
char 1 105
char 1 99
char 1 97
char 1 108
char 1 0
align 1
LABELV $290
char 1 108
char 1 95
char 1 99
char 1 108
char 1 97
char 1 118
char 1 105
char 1 99
char 1 97
char 1 108
char 1 0
align 1
LABELV $288
char 1 77
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
LABELV $287
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 49
char 1 0
align 1
LABELV $257
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
char 1 10
char 1 0
align 1
LABELV $254
char 1 77
char 1 111
char 1 100
char 1 101
char 1 108
char 1 32
char 1 100
char 1 111
char 1 101
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 115
char 1 117
char 1 112
char 1 112
char 1 111
char 1 114
char 1 116
char 1 101
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
char 1 99
char 1 111
char 1 110
char 1 102
char 1 105
char 1 103
char 1 46
char 1 10
char 1 0
align 1
LABELV $251
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
LABELV $248
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
LABELV $247
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
LABELV $240
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
char 1 0
align 1
LABELV $233
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
char 1 37
char 1 115
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
LABELV $232
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
char 1 37
char 1 115
char 1 47
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 37
char 1 115
char 1 46
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $231
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
char 1 97
char 1 116
char 1 115
char 1 116
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
LABELV $214
char 1 87
char 1 65
char 1 82
char 1 78
char 1 73
char 1 78
char 1 71
char 1 58
char 1 32
char 1 65
char 1 116
char 1 116
char 1 101
char 1 109
char 1 112
char 1 116
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
char 1 32
char 1 117
char 1 110
char 1 115
char 1 117
char 1 112
char 1 112
char 1 111
char 1 114
char 1 116
char 1 101
char 1 100
char 1 32
char 1 109
char 1 117
char 1 108
char 1 116
char 1 105
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 33
char 1 32
char 1 40
char 1 98
char 1 97
char 1 100
char 1 32
char 1 111
char 1 114
char 1 32
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 98
char 1 111
char 1 110
char 1 101
char 1 44
char 1 32
char 1 111
char 1 114
char 1 32
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 110
char 1 103
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
char 1 115
char 1 101
char 1 113
char 1 117
char 1 101
char 1 110
char 1 99
char 1 101
char 1 41
char 1 10
char 1 0
align 1
LABELV $213
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $201
char 1 115
char 1 117
char 1 114
char 1 102
char 1 79
char 1 110
char 1 0
align 1
LABELV $198
char 1 44
char 1 0
align 1
LABELV $193
char 1 115
char 1 117
char 1 114
char 1 102
char 1 79
char 1 102
char 1 102
char 1 0
align 1
LABELV $184
char 1 70
char 1 105
char 1 108
char 1 101
char 1 32
char 1 37
char 1 115
char 1 32
char 1 116
char 1 111
char 1 111
char 1 32
char 1 108
char 1 111
char 1 110
char 1 103
char 1 10
char 1 0
align 1
LABELV $179
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
char 1 37
char 1 115
char 1 47
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 37
char 1 115
char 1 46
char 1 115
char 1 117
char 1 114
char 1 102
char 1 0
align 1
LABELV $177
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $176
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $175
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 95
char 1 109
char 1 112
char 1 0
align 1
LABELV $172
char 1 109
char 1 111
char 1 114
char 1 103
char 1 97
char 1 110
char 1 0
align 1
LABELV $169
char 1 102
char 1 112
char 1 108
char 1 115
char 1 51
char 1 0
align 1
LABELV $166
char 1 102
char 1 112
char 1 108
char 1 115
char 1 50
char 1 0
align 1
LABELV $163
char 1 102
char 1 112
char 1 108
char 1 115
char 1 0
align 1
LABELV $160
char 1 107
char 1 121
char 1 108
char 1 101
char 1 0
align 1
LABELV $149
char 1 85
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 99
char 1 117
char 1 115
char 1 116
char 1 111
char 1 109
char 1 32
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $134
char 1 42
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $133
char 1 42
char 1 108
char 1 97
char 1 110
char 1 100
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $132
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
LABELV $131
char 1 42
char 1 99
char 1 104
char 1 111
char 1 107
char 1 101
char 1 51
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $130
char 1 42
char 1 99
char 1 104
char 1 111
char 1 107
char 1 101
char 1 50
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $129
char 1 42
char 1 99
char 1 104
char 1 111
char 1 107
char 1 101
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $128
char 1 42
char 1 102
char 1 97
char 1 108
char 1 108
char 1 105
char 1 110
char 1 103
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $127
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 49
char 1 48
char 1 48
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $126
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 55
char 1 53
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $125
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 53
char 1 48
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $124
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 50
char 1 53
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $123
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
LABELV $122
char 1 42
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 51
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $121
char 1 42
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 50
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $120
char 1 42
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
