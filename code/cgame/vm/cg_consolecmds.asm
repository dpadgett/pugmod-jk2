export CG_TargetCommand_f
code
proc CG_TargetCommand_f 20 12
file "../cg_consolecmds.c"
line 12
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_consolecmds.c -- text commands typed in at the local console, or
;4:// executed by a key binding
;5:
;6:#include "cg_local.h"
;7:#include "../ui/ui_shared.h"
;8:extern menuDef_t *menuScoreboard;
;9:
;10:
;11:
;12:void CG_TargetCommand_f( void ) {
line 16
;13:	int		targetNum;
;14:	char	test[4];
;15:
;16:	targetNum = CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 17
;17:	if (!targetNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $130
line 18
;18:		return;
ADDRGP4 $129
JUMPV
LABELV $130
line 21
;19:	}
;20:
;21:	trap_Argv( 1, test, 4 );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 22
;22:	trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( test ) ) );
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $132
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 23
;23:}
LABELV $129
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
line 34
;24:
;25:
;26:
;27:/*
;28:=================
;29:CG_SizeUp_f
;30:
;31:Keybinding command
;32:=================
;33:*/
;34:static void CG_SizeUp_f (void) {
line 35
;35:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer+10)));
ADDRGP4 $135
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $134
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 36
;36:}
LABELV $133
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 46
;37:
;38:
;39:/*
;40:=================
;41:CG_SizeDown_f
;42:
;43:Keybinding command
;44:=================
;45:*/
;46:static void CG_SizeDown_f (void) {
line 47
;47:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer-10)));
ADDRGP4 $135
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $134
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 48
;48:}
LABELV $137
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 24
line 58
;49:
;50:
;51:/*
;52:=============
;53:CG_Viewpos_f
;54:
;55:Debugging command to print the current position
;56:=============
;57:*/
;58:static void CG_Viewpos_f (void) {
line 59
;59:	CG_Printf ("%s (%i %i %i) : %i\n", cgs.mapname, (int)cg.refdef.vieworg[0],
ADDRGP4 $140
ARGP4
ADDRGP4 cgs+33008
ARGP4
ADDRGP4 cg+3616+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+3616+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+3616+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+3984+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 62
;60:		(int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
;61:		(int)cg.refdefViewAngles[YAW]);
;62:}
LABELV $139
endproc CG_Viewpos_f 0 24
proc CG_ScoresDown_f 0 4
line 65
;63:
;64:
;65:static void CG_ScoresDown_f( void ) {
line 67
;66:
;67:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 68
;68:	if ( cg.scoresRequestTime + 2000 < cg.time ) {
ADDRGP4 cg+5044
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+64
INDIRI4
GEI4 $153
line 71
;69:		// the scores are more than two seconds out of data,
;70:		// so request new ones
;71:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+5044
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 72
;72:		trap_SendClientCommand( "score" );
ADDRGP4 $159
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 76
;73:
;74:		// leave the current scores up if they were already
;75:		// displayed, but if this is the first hit, clear them out
;76:		if ( !cg.showScores ) {
ADDRGP4 cg+6984
INDIRI4
CNSTI4 0
NEI4 $154
line 77
;77:			cg.showScores = qtrue;
ADDRGP4 cg+6984
CNSTI4 1
ASGNI4
line 78
;78:			cg.numScores = 0;
ADDRGP4 cg+5048
CNSTI4 0
ASGNI4
line 79
;79:		}
line 80
;80:	} else {
ADDRGP4 $154
JUMPV
LABELV $153
line 83
;81:		// show the cached contents even if they just pressed if it
;82:		// is within two seconds
;83:		cg.showScores = qtrue;
ADDRGP4 cg+6984
CNSTI4 1
ASGNI4
line 84
;84:	}
LABELV $154
line 85
;85:}
LABELV $152
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 0
line 87
;86:
;87:static void CG_ScoresUp_f( void ) {
line 88
;88:	if ( cg.showScores ) {
ADDRGP4 cg+6984
INDIRI4
CNSTI4 0
EQI4 $167
line 89
;89:		cg.showScores = qfalse;
ADDRGP4 cg+6984
CNSTI4 0
ASGNI4
line 90
;90:		cg.scoreFadeTime = cg.time;
ADDRGP4 cg+6992
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 91
;91:	}
LABELV $167
line 92
;92:}
LABELV $166
endproc CG_ScoresUp_f 0 0
proc CG_scrollScoresDown_f 0 12
line 97
;93:
;94:extern menuDef_t *menuScoreboard;
;95:void Menu_Reset();			// FIXME: add to right include file
;96:
;97:static void CG_scrollScoresDown_f( void) {
line 98
;98:	if (menuScoreboard && cg.scoreBoardShowing) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
ADDRGP4 cg+6988
INDIRI4
CNSTI4 0
EQI4 $174
line 99
;99:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 100
;100:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 101
;101:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 102
;102:	}
LABELV $174
line 103
;103:}
LABELV $173
endproc CG_scrollScoresDown_f 0 12
proc CG_scrollScoresUp_f 0 12
line 106
;104:
;105:
;106:static void CG_scrollScoresUp_f( void) {
line 107
;107:	if (menuScoreboard && cg.scoreBoardShowing) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
ADDRGP4 cg+6988
INDIRI4
CNSTI4 0
EQI4 $178
line 108
;108:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qfalse);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 109
;109:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qfalse);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 110
;110:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qfalse);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 111
;111:	}
LABELV $178
line 112
;112:}
LABELV $177
endproc CG_scrollScoresUp_f 0 12
proc CG_spWin_f 0 12
line 115
;113:
;114:
;115:static void CG_spWin_f( void) {
line 116
;116:	trap_Cvar_Set("cg_cameraOrbit", "2");
ADDRGP4 $182
ARGP4
ADDRGP4 $183
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 117
;117:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
ADDRGP4 $184
ARGP4
ADDRGP4 $185
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 118
;118:	trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $186
ARGP4
ADDRGP4 $187
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 119
;119:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $188
ARGP4
ADDRGP4 $189
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 120
;120:	trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $190
ARGP4
ADDRGP4 $191
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 121
;121:	CG_AddBufferedSound(cgs.media.winnerSound);
ADDRGP4 cgs+70296+668
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 123
;122:	//trap_S_StartLocalSound(cgs.media.winnerSound, CHAN_ANNOUNCER);
;123:	CG_CenterPrint("YOU WIN!", SCREEN_HEIGHT * .30, 0);
ADDRGP4 $194
ARGP4
CNSTI4 144
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 124
;124:}
LABELV $181
endproc CG_spWin_f 0 12
proc CG_spLose_f 0 12
line 126
;125:
;126:static void CG_spLose_f( void) {
line 127
;127:	trap_Cvar_Set("cg_cameraOrbit", "2");
ADDRGP4 $182
ARGP4
ADDRGP4 $183
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 128
;128:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
ADDRGP4 $184
ARGP4
ADDRGP4 $185
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 129
;129:	trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $186
ARGP4
ADDRGP4 $187
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 130
;130:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $188
ARGP4
ADDRGP4 $189
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 131
;131:	trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $190
ARGP4
ADDRGP4 $191
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 132
;132:	CG_AddBufferedSound(cgs.media.loserSound);
ADDRGP4 cgs+70296+672
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 134
;133:	//trap_S_StartLocalSound(cgs.media.loserSound, CHAN_ANNOUNCER);
;134:	CG_CenterPrint("YOU LOSE...", SCREEN_HEIGHT * .30, 0);
ADDRGP4 $198
ARGP4
CNSTI4 144
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 135
;135:}
LABELV $195
endproc CG_spLose_f 0 12
proc CG_TellTarget_f 264 20
line 138
;136:
;137:
;138:static void CG_TellTarget_f( void ) {
line 143
;139:	int		clientNum;
;140:	char	command[128];
;141:	char	message[128];
;142:
;143:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 144
;144:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $200
line 145
;145:		return;
ADDRGP4 $199
JUMPV
LABELV $200
line 148
;146:	}
;147:
;148:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 149
;149:	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $202
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 150
;150:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 151
;151:}
LABELV $199
endproc CG_TellTarget_f 264 20
proc CG_TellAttacker_f 264 20
line 153
;152:
;153:static void CG_TellAttacker_f( void ) {
line 158
;154:	int		clientNum;
;155:	char	command[128];
;156:	char	message[128];
;157:
;158:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 159
;159:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $204
line 160
;160:		return;
ADDRGP4 $203
JUMPV
LABELV $204
line 163
;161:	}
;162:
;163:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 164
;164:	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $202
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 165
;165:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 166
;166:}
LABELV $203
endproc CG_TellAttacker_f 264 20
proc CG_VoiceTellTarget_f 264 20
line 168
;167:
;168:static void CG_VoiceTellTarget_f( void ) {
line 173
;169:	int		clientNum;
;170:	char	command[128];
;171:	char	message[128];
;172:
;173:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 174
;174:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $207
line 175
;175:		return;
ADDRGP4 $206
JUMPV
LABELV $207
line 178
;176:	}
;177:
;178:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 179
;179:	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $209
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 180
;180:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 181
;181:}
LABELV $206
endproc CG_VoiceTellTarget_f 264 20
proc CG_VoiceTellAttacker_f 264 20
line 183
;182:
;183:static void CG_VoiceTellAttacker_f( void ) {
line 188
;184:	int		clientNum;
;185:	char	command[128];
;186:	char	message[128];
;187:
;188:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 189
;189:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $211
line 190
;190:		return;
ADDRGP4 $210
JUMPV
LABELV $211
line 193
;191:	}
;192:
;193:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 194
;194:	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $209
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 195
;195:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 196
;196:}
LABELV $210
endproc CG_VoiceTellAttacker_f 264 20
proc CG_NextTeamMember_f 0 0
line 198
;197:
;198:static void CG_NextTeamMember_f( void ) {
line 199
;199:  CG_SelectNextPlayer();
ADDRGP4 CG_SelectNextPlayer
CALLV
pop
line 200
;200:}
LABELV $213
endproc CG_NextTeamMember_f 0 0
proc CG_PrevTeamMember_f 0 0
line 202
;201:
;202:static void CG_PrevTeamMember_f( void ) {
line 203
;203:  CG_SelectPrevPlayer();
ADDRGP4 CG_SelectPrevPlayer
CALLV
pop
line 204
;204:}
LABELV $214
endproc CG_PrevTeamMember_f 0 0
proc CG_NextOrder_f 16 0
line 208
;205:
;206:// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
;207://
;208:static void CG_NextOrder_f( void ) {
line 209
;209:	clientInfo_t *ci = cgs.clientinfo + cg.snap->ps.clientNum;
ADDRLP4 0
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 210
;210:	if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
line 211
;211:		if (!ci->teamLeader && sortedTeamPlayers[cg_currentSelectedPlayer.integer] != cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 0
NEI4 $220
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $220
line 212
;212:			return;
ADDRGP4 $215
JUMPV
LABELV $220
line 214
;213:		}
;214:	}
LABELV $218
line 215
;215:	if (cgs.currentOrder < TEAMTASK_CAMP) {
ADDRGP4 cgs+70236
INDIRI4
CNSTI4 7
GEI4 $224
line 216
;216:		cgs.currentOrder++;
ADDRLP4 4
ADDRGP4 cgs+70236
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 218
;217:
;218:		if (cgs.currentOrder == TEAMTASK_RETRIEVE) {
ADDRGP4 cgs+70236
INDIRI4
CNSTI4 5
NEI4 $228
line 219
;219:			if (!CG_OtherTeamHasFlag()) {
ADDRLP4 8
ADDRGP4 CG_OtherTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $231
line 220
;220:				cgs.currentOrder++;
ADDRLP4 12
ADDRGP4 cgs+70236
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 221
;221:			}
LABELV $231
line 222
;222:		}
LABELV $228
line 224
;223:
;224:		if (cgs.currentOrder == TEAMTASK_ESCORT) {
ADDRGP4 cgs+70236
INDIRI4
CNSTI4 6
NEI4 $225
line 225
;225:			if (!CG_YourTeamHasFlag()) {
ADDRLP4 8
ADDRGP4 CG_YourTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $225
line 226
;226:				cgs.currentOrder++;
ADDRLP4 12
ADDRGP4 cgs+70236
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 227
;227:			}
line 228
;228:		}
line 230
;229:
;230:	} else {
ADDRGP4 $225
JUMPV
LABELV $224
line 231
;231:		cgs.currentOrder = TEAMTASK_OFFENSE;
ADDRGP4 cgs+70236
CNSTI4 1
ASGNI4
line 232
;232:	}
LABELV $225
line 233
;233:	cgs.orderPending = qtrue;
ADDRGP4 cgs+70240
CNSTI4 1
ASGNI4
line 234
;234:	cgs.orderTime = cg.time + 3000;
ADDRGP4 cgs+70244
ADDRGP4 cg+64
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 235
;235:}
LABELV $215
endproc CG_NextOrder_f 16 0
proc CG_ConfirmOrder_f 8 12
line 238
;236:
;237:
;238:static void CG_ConfirmOrder_f (void ) {
line 239
;239:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_YES));
ADDRGP4 $245
ARGP4
ADDRGP4 cgs+70260
INDIRI4
ARGI4
ADDRGP4 $247
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 240
;240:	trap_SendConsoleCommand("+button5; wait; -button5");
ADDRGP4 $248
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 241
;241:	if (cg.time < cgs.acceptOrderTime) {
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgs+70252
INDIRI4
GEI4 $249
line 242
;242:		trap_SendClientCommand(va("teamtask %d\n", cgs.acceptTask));
ADDRGP4 $253
ARGP4
ADDRGP4 cgs+70256
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 243
;243:		cgs.acceptOrderTime = 0;
ADDRGP4 cgs+70252
CNSTI4 0
ASGNI4
line 244
;244:	}
LABELV $249
line 245
;245:}
LABELV $244
endproc CG_ConfirmOrder_f 8 12
proc CG_DenyOrder_f 4 12
line 247
;246:
;247:static void CG_DenyOrder_f (void ) {
line 248
;248:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_NO));
ADDRGP4 $245
ARGP4
ADDRGP4 cgs+70260
INDIRI4
ARGI4
ADDRGP4 $258
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 249
;249:	trap_SendConsoleCommand("+button6; wait; -button6");
ADDRGP4 $259
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 250
;250:	if (cg.time < cgs.acceptOrderTime) {
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgs+70252
INDIRI4
GEI4 $260
line 251
;251:		cgs.acceptOrderTime = 0;
ADDRGP4 cgs+70252
CNSTI4 0
ASGNI4
line 252
;252:	}
LABELV $260
line 253
;253:}
LABELV $256
endproc CG_DenyOrder_f 4 12
proc CG_TaskOffense_f 4 8
line 255
;254:
;255:static void CG_TaskOffense_f (void ) {
line 256
;256:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_CTY) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
EQI4 $270
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $266
LABELV $270
line 257
;257:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONGETFLAG));
ADDRGP4 $271
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 258
;258:	} else {
ADDRGP4 $267
JUMPV
LABELV $266
line 259
;259:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONOFFENSE));
ADDRGP4 $271
ARGP4
ADDRGP4 $273
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 260
;260:	}
LABELV $267
line 261
;261:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_OFFENSE));
ADDRGP4 $253
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 262
;262:}
LABELV $265
endproc CG_TaskOffense_f 4 8
proc CG_TaskDefense_f 8 8
line 264
;263:
;264:static void CG_TaskDefense_f (void ) {
line 265
;265:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONDEFENSE));
ADDRGP4 $271
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 266
;266:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_DEFENSE));
ADDRGP4 $253
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 267
;267:}
LABELV $274
endproc CG_TaskDefense_f 8 8
proc CG_TaskPatrol_f 8 8
line 269
;268:
;269:static void CG_TaskPatrol_f (void ) {
line 270
;270:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONPATROL));
ADDRGP4 $271
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 271
;271:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_PATROL));
ADDRGP4 $253
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 272
;272:}
LABELV $276
endproc CG_TaskPatrol_f 8 8
proc CG_TaskCamp_f 8 8
line 274
;273:
;274:static void CG_TaskCamp_f (void ) {
line 275
;275:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONCAMPING));
ADDRGP4 $271
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 276
;276:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_CAMP));
ADDRGP4 $253
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 277
;277:}
LABELV $278
endproc CG_TaskCamp_f 8 8
proc CG_TaskFollow_f 8 8
line 279
;278:
;279:static void CG_TaskFollow_f (void ) {
line 280
;280:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOW));
ADDRGP4 $271
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 281
;281:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_FOLLOW));
ADDRGP4 $253
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 282
;282:}
LABELV $280
endproc CG_TaskFollow_f 8 8
proc CG_TaskRetrieve_f 8 8
line 284
;283:
;284:static void CG_TaskRetrieve_f (void ) {
line 285
;285:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONRETURNFLAG));
ADDRGP4 $271
ARGP4
ADDRGP4 $283
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 286
;286:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_RETRIEVE));
ADDRGP4 $253
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 287
;287:}
LABELV $282
endproc CG_TaskRetrieve_f 8 8
proc CG_TaskEscort_f 8 8
line 289
;288:
;289:static void CG_TaskEscort_f (void ) {
line 290
;290:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOWCARRIER));
ADDRGP4 $271
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 291
;291:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_ESCORT));
ADDRGP4 $253
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 292
;292:}
LABELV $284
endproc CG_TaskEscort_f 8 8
proc CG_TaskOwnFlag_f 4 8
line 294
;293:
;294:static void CG_TaskOwnFlag_f (void ) {
line 295
;295:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_IHAVEFLAG));
ADDRGP4 $271
ARGP4
ADDRGP4 $287
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 296
;296:}
LABELV $286
endproc CG_TaskOwnFlag_f 4 8
proc CG_TauntKillInsult_f 0 4
line 298
;297:
;298:static void CG_TauntKillInsult_f (void ) {
line 299
;299:	trap_SendConsoleCommand("cmd vsay kill_insult\n");
ADDRGP4 $289
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 300
;300:}
LABELV $288
endproc CG_TauntKillInsult_f 0 4
proc CG_TauntPraise_f 0 4
line 302
;301:
;302:static void CG_TauntPraise_f (void ) {
line 303
;303:	trap_SendConsoleCommand("cmd vsay praise\n");
ADDRGP4 $291
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 304
;304:}
LABELV $290
endproc CG_TauntPraise_f 0 4
proc CG_TauntTaunt_f 0 4
line 306
;305:
;306:static void CG_TauntTaunt_f (void ) {
line 307
;307:	trap_SendConsoleCommand("cmd vtaunt\n");
ADDRGP4 $293
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 308
;308:}
LABELV $292
endproc CG_TauntTaunt_f 0 4
proc CG_TauntDeathInsult_f 0 4
line 310
;309:
;310:static void CG_TauntDeathInsult_f (void ) {
line 311
;311:	trap_SendConsoleCommand("cmd vsay death_insult\n");
ADDRGP4 $295
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 312
;312:}
LABELV $294
endproc CG_TauntDeathInsult_f 0 4
proc CG_TauntGauntlet_f 0 4
line 314
;313:
;314:static void CG_TauntGauntlet_f (void ) {
line 315
;315:	trap_SendConsoleCommand("cmd vsay kill_guantlet\n");
ADDRGP4 $297
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 316
;316:}
LABELV $296
endproc CG_TauntGauntlet_f 0 4
proc CG_TaskSuicide_f 136 16
line 318
;317:
;318:static void CG_TaskSuicide_f (void ) {
line 322
;319:	int		clientNum;
;320:	char	command[128];
;321:
;322:	clientNum = CG_CrosshairPlayer();
ADDRLP4 132
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 132
INDIRI4
ASGNI4
line 323
;323:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $299
line 324
;324:		return;
ADDRGP4 $298
JUMPV
LABELV $299
line 327
;325:	}
;326:
;327:	Com_sprintf( command, 128, "tell %i suicide", clientNum );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 328
;328:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 329
;329:}
LABELV $298
endproc CG_TaskSuicide_f 136 16
proc CG_StartOrbit_f 1028 12
line 369
;330:
;331:
;332:
;333:/*
;334:==================
;335:CG_TeamMenu_f
;336:==================
;337:*/
;338:/*
;339:static void CG_TeamMenu_f( void ) {
;340:  if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
;341:    CG_EventHandling(CGAME_EVENT_NONE);
;342:    trap_Key_SetCatcher(0);
;343:  } else {
;344:    CG_EventHandling(CGAME_EVENT_TEAMMENU);
;345:    //trap_Key_SetCatcher(KEYCATCH_CGAME);
;346:  }
;347:}
;348:*/
;349:
;350:/*
;351:==================
;352:CG_EditHud_f
;353:==================
;354:*/
;355:/*
;356:static void CG_EditHud_f( void ) {
;357:  //cls.keyCatchers ^= KEYCATCH_CGAME;
;358:  //VM_Call (cgvm, CG_EVENT_HANDLING, (cls.keyCatchers & KEYCATCH_CGAME) ? CGAME_EVENT_EDITHUD : CGAME_EVENT_NONE);
;359:}
;360:*/
;361:
;362:
;363:/*
;364:==================
;365:CG_StartOrbit_f
;366:==================
;367:*/
;368:
;369:static void CG_StartOrbit_f( void ) {
line 372
;370:	char var[MAX_TOKEN_CHARS];
;371:
;372:	trap_Cvar_VariableStringBuffer( "developer", var, sizeof( var ) );
ADDRGP4 $303
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 373
;373:	if ( !atoi(var) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $304
line 374
;374:		return;
ADDRGP4 $302
JUMPV
LABELV $304
line 376
;375:	}
;376:	if (cg_cameraOrbit.value != 0) {
ADDRGP4 cg_cameraOrbit+8
INDIRF4
CNSTF4 0
EQF4 $306
line 377
;377:		trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $182
ARGP4
ADDRGP4 $189
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 378
;378:		trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $186
ARGP4
ADDRGP4 $189
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 379
;379:	} else {
ADDRGP4 $307
JUMPV
LABELV $306
line 380
;380:		trap_Cvar_Set("cg_cameraOrbit", "5");
ADDRGP4 $182
ARGP4
ADDRGP4 $309
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 381
;381:		trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $186
ARGP4
ADDRGP4 $187
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 382
;382:		trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $188
ARGP4
ADDRGP4 $189
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 383
;383:		trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $190
ARGP4
ADDRGP4 $191
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 384
;384:	}
LABELV $307
line 385
;385:}
LABELV $302
endproc CG_StartOrbit_f 1028 12
proc CG_clientserverstatus_f 16 12
line 401
;386:
;387:/*
;388:static void CG_Camera_f( void ) {
;389:	char name[1024];
;390:	trap_Argv( 1, name, sizeof(name));
;391:	if (trap_loadCamera(name)) {
;392:		cg.cameraMode = qtrue;
;393:		trap_startCamera(cg.time);
;394:	} else {
;395:		CG_Printf ("Unable to load camera %s\n",name);
;396:	}
;397:}
;398:*/
;399:
;400:static void CG_clientserverstatus_f(void)
;401:{
line 404
;402:	int clientNum;
;403:	const char *configstring;
;404:	for(clientNum=0;clientNum<cgs.maxclients;clientNum++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $314
JUMPV
LABELV $311
line 405
;405:	{
line 406
;406:    	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 407
;407:	    CG_Printf("%d: %s\n",clientNum,Info_ValueForKey(configstring, "n"));
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $316
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 408
;408:    }
LABELV $312
line 404
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $314
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $311
line 409
;409:}
LABELV $310
endproc CG_clientserverstatus_f 16 12
data
export gotime
align 4
LABELV gotime
byte 4 0
code
proc CG_demopos_f 44 12
line 414
;410:
;411:int gotime=0;
;412:
;413:static void CG_demopos_f(void)
;414:{
line 417
;415:	char min[20],*sec;
;416:	int i;
;417:	if(!cg.demoPlayback)return;
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $319
ADDRGP4 $318
JUMPV
LABELV $319
line 418
;418:	trap_Argv( 1, min, 20 );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 419
;419:	for( i=0; min[i]!=':'&& min[i]!=0; i++ );
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $322
LABELV $323
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $325
ADDRLP4 28
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 58
EQI4 $326
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $322
LABELV $326
line 420
;420:	if(min[i]==0)
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $327
line 421
;421:		sec = 0;
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRGP4 $328
JUMPV
LABELV $327
line 423
;422:	else
;423:	{
line 424
;424:		min[i] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 425
;425:		sec = min+i+1;
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 4+1
ADDP4
ASGNP4
line 426
;426:	}
LABELV $328
line 427
;427:	gotime = ( atoi( min ) * 60 + atoi( sec ) ) * 1000;
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 gotime
CNSTI4 1000
CNSTI4 60
ADDRLP4 32
INDIRI4
MULI4
ADDRLP4 36
INDIRI4
ADDI4
MULI4
ASGNI4
line 428
;428:	trap_Cvar_Set("timescale",va("%d",gotime - (cg.time - cgs.levelStartTime)));
ADDRGP4 $331
ARGP4
ADDRGP4 gotime
INDIRI4
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgs+36320
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $330
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 429
;429:}
LABELV $318
endproc CG_demopos_f 44 12
data
export curCam
align 4
LABELV curCam
byte 4 0
export numRows
align 4
LABELV numRows
byte 4 0
export numCols
align 4
LABELV numCols
byte 4 0
code
proc pivot 40 0
line 447
;430:
;431:typedef struct {
;432:	vec3_t		origin;
;433:	vec3_t		angle;
;434:	int			time;
;435:	qboolean	thirdPerson;
;436:	vec4_t		csi_coeff[6];   //cubic spline interpolation coefficients
;437:} demoCam_t;
;438:
;439:demoCam_t cam[50];
;440:int curCam = 0;
;441:
;442:// start cubic spline interpolation code (parts are converted from javascript at http://people.hofstra.edu/faculty/Stefan_Waner/realworld/tutorialsf1/scriptpivot2.html)
;443:
;444:double theMatrix[50*4][50*4+1];
;445:int numRows = 0, numCols = 0;
;446:
;447:static void pivot( int rows, int cols, int theRow, int theCol ) {
line 448
;448:	double thePivot = theMatrix[theRow][theCol];
ADDRLP4 8
ADDRFP4 12
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRFP4 8
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
INDIRF4
ASGNF4
line 450
;449:	int i, j;
;450:	for( i=0; i<cols; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $339
JUMPV
LABELV $336
line 451
;451:		theMatrix[theRow][i] = theMatrix[theRow][i]/thePivot;
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRFP4 8
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
LABELV $337
line 450
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $339
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $336
line 452
;452:	for( i=0; i<rows; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $343
JUMPV
LABELV $340
line 453
;453:		if( ( i!=theRow ) && ( theMatrix[i][theCol]!=0 ) )
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
EQI4 $344
ADDRFP4 12
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $344
line 454
;454:		{
line 455
;455:			double factr = theMatrix[i][theCol];
ADDRLP4 20
ADDRFP4 12
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
INDIRF4
ASGNF4
line 456
;456:			for( j=0; j<cols; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $349
JUMPV
LABELV $346
line 457
;457:				theMatrix[i][j] = theMatrix[i][j] - factr*theMatrix[theRow][j];	
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
CNSTI4 804
ASGNI4
ADDRLP4 32
ADDRGP4 theMatrix
ASGNP4
ADDRLP4 36
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
ADDP4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
ADDRFP4 8
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
ADDP4
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
LABELV $347
line 456
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $349
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $346
line 458
;458:		}
LABELV $344
LABELV $341
line 452
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $343
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $340
line 459
;459:}
LABELV $335
endproc pivot 40 0
proc swapRows 20 0
line 461
;460:
;461:static void swapRows( int p, int q ) {
line 462
;462:	double rowHold = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 464
;463:	int j;
;464:	for( j=0; j<numCols; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $354
JUMPV
LABELV $351
line 465
;465:	{
line 466
;466:		rowHold = theMatrix[p][j];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
INDIRF4
ASGNF4
line 467
;467:		theMatrix[p][j] = theMatrix[q][j];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
CNSTI4 804
ASGNI4
ADDRLP4 16
ADDRGP4 theMatrix
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
ADDP4
ADDP4
INDIRF4
ASGNF4
line 468
;468:		theMatrix[q][j] = rowHold;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 469
;469:	}
LABELV $352
line 464
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $354
ADDRLP4 0
INDIRI4
ADDRGP4 numCols
INDIRI4
LTI4 $351
line 470
;470:}
LABELV $350
endproc swapRows 20 0
proc rowReduce 32 16
line 472
;471:
;472:static void rowReduce() {
line 474
;473:	int i, j, theCol;
;474:	int theRow = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 475
;475:	double theSmallestNumber = 0.00000000001;
ADDRLP4 12
CNSTF4 758115327
ASGNF4
line 476
;476:	for(  i=0; i<numRows; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $359
JUMPV
LABELV $356
line 477
;477:	{ 
line 478
;478:		theCol = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 479
;479:		for( j=0; j<numCols; j++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $363
JUMPV
LABELV $360
line 480
;480:		{
line 481
;481:			double theNum = theMatrix[i][j];
ADDRLP4 20
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
INDIRF4
ASGNF4
line 482
;482:			if( theNum * ( theNum>0?1:-1 ) <= theSmallestNumber )theMatrix[i][j] = 0;
ADDRLP4 20
INDIRF4
CNSTF4 0
LEF4 $367
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $368
JUMPV
LABELV $367
ADDRLP4 24
CNSTI4 -1
ASGNI4
LABELV $368
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRI4
CVIF4 4
MULF4
ADDRLP4 12
INDIRF4
GTF4 $364
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $365
JUMPV
LABELV $364
line 483
;483:			else { theCol = j; break; }
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $362
JUMPV
LABELV $365
line 484
;484:		}
LABELV $361
line 479
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $363
ADDRLP4 4
INDIRI4
ADDRGP4 numCols
INDIRI4
LTI4 $360
LABELV $362
line 485
;485:		if( theCol!=-1 )pivot(numRows,numCols,i,theCol);
ADDRLP4 16
INDIRI4
CNSTI4 -1
EQI4 $369
ADDRGP4 numRows
INDIRI4
ARGI4
ADDRGP4 numCols
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 pivot
CALLV
pop
LABELV $369
line 486
;486:	}
LABELV $357
line 476
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $359
ADDRLP4 0
INDIRI4
ADDRGP4 numRows
INDIRI4
LTI4 $356
line 487
;487:	for( j=0; j<numCols; j++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $374
JUMPV
LABELV $371
line 488
;488:		for( i=theRow; i<numRows; i++ )
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $378
JUMPV
LABELV $375
line 489
;489:			if( theMatrix[i][j] != 0 )
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $379
line 490
;490:			{
line 491
;491:				if( i==theRow ) { theRow++; break; }
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $381
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $377
JUMPV
LABELV $381
line 492
;492:				else { swapRows( theRow, i ); theRow++; break; }
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 swapRows
CALLV
pop
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $377
JUMPV
LABELV $379
LABELV $376
line 488
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $378
ADDRLP4 0
INDIRI4
ADDRGP4 numRows
INDIRI4
LTI4 $375
LABELV $377
LABELV $372
line 487
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $374
ADDRLP4 4
INDIRI4
ADDRGP4 numCols
INDIRI4
LTI4 $371
line 494
;493:			}
;494:}
LABELV $355
endproc rowReduce 32 16
proc reCalc 292 12
line 498
;495:
;496:#define TIMEDIV 1000
;497:// recalculate cubic spline interpolation coefficients for cam paths
;498:static void reCalc() {
line 501
;499:	int i, j, k, curRow;
;500:	double deltaT;
;501:	for( k=0; k<3; k++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $384
line 502
;502:	{
line 503
;503:		curRow = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 504
;504:		memset( theMatrix[0], 0, sizeof( theMatrix ) );
ADDRGP4 theMatrix
ARGP4
CNSTI4 0
ARGI4
CNSTI4 160800
ARGI4
ADDRGP4 memset
CALLP4
pop
line 505
;505:		for( i=0; i<curCam-1; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $391
JUMPV
LABELV $388
line 506
;506:		{
line 507
;507:			double deltaT = (double)(cam[i+1].time - cam[i].time);
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ADDRGP4 cam+128+24
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 508
;508:			double deltaD = (double)(cam[i+1].origin[k] - cam[i].origin[k]);
ADDRLP4 32
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 24
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
ADDRGP4 cam+128
ADDP4
ADDP4
INDIRF4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
ADDRGP4 cam
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 509
;509:			j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 512
;510:			//runs through first point
;511:			//guess what? ive decided it's (0,0) kthx.
;512:			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV);
ADDRLP4 40
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
LSHI4
ADDRLP4 40
INDIRI4
ADDI4
ADDRLP4 44
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 513
;513:			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV);
ADDRLP4 48
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 52
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDRLP4 48
INDIRI4
ADDI4
ADDRLP4 52
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 514
;514:			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV);
ADDRLP4 56
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRI4
LSHI4
ADDRLP4 56
INDIRI4
ADDI4
ADDRLP4 60
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 515
;515:			theMatrix[curRow][i*4+j++] = 1;
ADDRLP4 64
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 64
INDIRI4
ADDI4
ADDRLP4 68
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 516
;516:			theMatrix[curRow++][(curCam-1)*4+4] = 0;//cam[i].origin[k];
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
CNSTI4 2
ASGNI4
ADDRLP4 80
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 76
INDIRI4
LSHI4
ADDRLP4 76
INDIRI4
LSHI4
ADDRLP4 80
INDIRI4
SUBI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 72
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 518
;517:			
;518:			j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 521
;519:			//runs through second point
;520:			//doodz we're makin dese thangs unit doodz so it b leeter :>
;521:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
ADDRLP4 84
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 84
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 88
CNSTI4 2
ASGNI4
ADDRLP4 92
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRLP4 0
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRLP4 84
INDIRI4
ADDI4
ADDRLP4 88
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 92
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 522
;522:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
ADDRLP4 96
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
CNSTI4 2
ASGNI4
ADDRLP4 104
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRLP4 0
INDIRI4
ADDRLP4 100
INDIRI4
LSHI4
ADDRLP4 96
INDIRI4
ADDI4
ADDRLP4 100
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 104
INDIRF4
ADDRLP4 104
INDIRF4
MULF4
ASGNF4
line 523
;523:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV);
ADDRLP4 108
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 112
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 112
INDIRI4
LSHI4
ADDRLP4 108
INDIRI4
ADDI4
ADDRLP4 112
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
line 524
;524:			theMatrix[curRow][i*4+j++] = 1;
ADDRLP4 116
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 120
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 120
INDIRI4
LSHI4
ADDRLP4 116
INDIRI4
ADDI4
ADDRLP4 120
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 525
;525:			theMatrix[curRow++][(curCam-1)*4+4] = deltaD;
ADDRLP4 124
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 124
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
CNSTI4 2
ASGNI4
ADDRLP4 132
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 128
INDIRI4
LSHI4
ADDRLP4 128
INDIRI4
LSHI4
ADDRLP4 132
INDIRI4
SUBI4
ADDRLP4 132
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 124
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 527
;526:			
;527:			j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 529
;528:			//first derivitives are equal
;529:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*3;
ADDRLP4 136
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
CNSTI4 2
ASGNI4
ADDRLP4 144
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRLP4 0
INDIRI4
ADDRLP4 140
INDIRI4
LSHI4
ADDRLP4 136
INDIRI4
ADDI4
ADDRLP4 140
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1077936128
ADDRLP4 144
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
MULF4
ASGNF4
line 530
;530:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*2;
ADDRLP4 148
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
ADDRLP4 148
INDIRI4
ADDI4
ADDRLP4 152
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1073741824
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
MULF4
ASGNF4
line 531
;531:			theMatrix[curRow][i*4+j++] = 1;
ADDRLP4 156
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 156
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 160
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 160
INDIRI4
LSHI4
ADDRLP4 156
INDIRI4
ADDI4
ADDRLP4 160
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 532
;532:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 164
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 164
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 168
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 168
INDIRI4
LSHI4
ADDRLP4 164
INDIRI4
ADDI4
ADDRLP4 168
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 533
;533:			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*3;
ADDRLP4 172
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 176
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 176
INDIRI4
LSHI4
ADDRLP4 172
INDIRI4
ADDI4
ADDRLP4 176
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 534
;534:			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*2;
ADDRLP4 180
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 184
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 184
INDIRI4
LSHI4
ADDRLP4 180
INDIRI4
ADDI4
ADDRLP4 184
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 535
;535:			theMatrix[curRow][i*4+j++] = -1;
ADDRLP4 188
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 188
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 192
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 192
INDIRI4
LSHI4
ADDRLP4 188
INDIRI4
ADDI4
ADDRLP4 192
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 3212836864
ASGNF4
line 536
;536:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 196
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 196
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 200
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 200
INDIRI4
LSHI4
ADDRLP4 196
INDIRI4
ADDI4
ADDRLP4 200
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 537
;537:			theMatrix[curRow++][(curCam-1)*4+4] = 0;
ADDRLP4 204
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 204
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 208
CNSTI4 2
ASGNI4
ADDRLP4 212
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 208
INDIRI4
LSHI4
ADDRLP4 208
INDIRI4
LSHI4
ADDRLP4 212
INDIRI4
SUBI4
ADDRLP4 212
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 204
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 539
;538:			
;539:			j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 541
;540:			//second derivitives are equal
;541:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*6;
ADDRLP4 216
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 216
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 220
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 220
INDIRI4
LSHI4
ADDRLP4 216
INDIRI4
ADDI4
ADDRLP4 220
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1086324736
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
MULF4
ASGNF4
line 542
;542:			theMatrix[curRow][i*4+j++] = 2;
ADDRLP4 224
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 224
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 228
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 228
INDIRI4
LSHI4
ADDRLP4 224
INDIRI4
ADDI4
ADDRLP4 228
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1073741824
ASGNF4
line 543
;543:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 232
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 232
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 236
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 236
INDIRI4
LSHI4
ADDRLP4 232
INDIRI4
ADDI4
ADDRLP4 236
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 544
;544:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 240
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 240
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 244
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 244
INDIRI4
LSHI4
ADDRLP4 240
INDIRI4
ADDI4
ADDRLP4 244
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 545
;545:			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*6;
ADDRLP4 248
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 248
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 252
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 252
INDIRI4
LSHI4
ADDRLP4 248
INDIRI4
ADDI4
ADDRLP4 252
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 546
;546:			theMatrix[curRow][i*4+j++] = -2;
ADDRLP4 256
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 260
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 260
INDIRI4
LSHI4
ADDRLP4 256
INDIRI4
ADDI4
ADDRLP4 260
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 3221225472
ASGNF4
line 547
;547:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 264
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 268
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 268
INDIRI4
LSHI4
ADDRLP4 264
INDIRI4
ADDI4
ADDRLP4 268
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 548
;548:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 272
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 272
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 276
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 276
INDIRI4
LSHI4
ADDRLP4 272
INDIRI4
ADDI4
ADDRLP4 276
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 549
;549:			theMatrix[curRow++][(curCam-1)*4+4] = 0;
ADDRLP4 280
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 280
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 284
CNSTI4 2
ASGNI4
ADDRLP4 288
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 284
INDIRI4
LSHI4
ADDRLP4 284
INDIRI4
LSHI4
ADDRLP4 288
INDIRI4
SUBI4
ADDRLP4 288
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 280
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 550
;550:		}
LABELV $389
line 505
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $391
ADDRLP4 0
INDIRI4
ADDRGP4 curCam
INDIRI4
CNSTI4 1
SUBI4
LTI4 $388
line 553
;551:		//4 more equations are needed to have a solvable matrix (there should be n-1 splines)
;552:		
;553:		j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 555
;554:		//second derivitive at the end is zero
;555:		theMatrix[curRow][(curCam-1)*4+j++] = (((double)cam[curCam].time-cam[curCam-1].time)/TIMEDIV)*6;
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
ADDRGP4 curCam
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 32
ADDRLP4 24
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 28
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1086324736
ADDRLP4 32
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRI4
ADDRGP4 cam-128+24
ADDP4
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1148846080
DIVF4
MULF4
ASGNF4
line 556
;556:		theMatrix[curRow][(curCam-1)*4+j++] = 2;
ADDRLP4 36
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 36
INDIRI4
ADDI4
ADDRLP4 40
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1073741824
ASGNF4
line 557
;557:		theMatrix[curRow][(curCam-1)*4+j++] = 0;
ADDRLP4 44
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 48
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
ADDRLP4 48
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 558
;558:		theMatrix[curRow][(curCam-1)*4+j++] = 0;
ADDRLP4 52
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 56
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 52
INDIRI4
ADDI4
ADDRLP4 56
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 559
;559:		theMatrix[curRow++][(curCam-1)*4+4] = 0;
ADDRLP4 60
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 64
CNSTI4 2
ASGNI4
ADDRLP4 68
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 68
INDIRI4
SUBI4
ADDRLP4 68
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 561
;560:		
;561:		j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 563
;562:		//second derivitive at the beginning is zero
;563:		theMatrix[curRow][j++] = 0;//(((double)cam[0].time)/TIMEDIV)*6;
ADDRLP4 72
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 564
;564:		theMatrix[curRow][j++] = 2;
ADDRLP4 76
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1073741824
ASGNF4
line 565
;565:		theMatrix[curRow][j++] = 0;
ADDRLP4 80
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 566
;566:		theMatrix[curRow][j++] = 0;
ADDRLP4 84
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 84
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 567
;567:		theMatrix[curRow++][(curCam-1)*4+4] = 0;
ADDRLP4 88
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 92
CNSTI4 2
ASGNI4
ADDRLP4 96
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 92
INDIRI4
LSHI4
ADDRLP4 92
INDIRI4
LSHI4
ADDRLP4 96
INDIRI4
SUBI4
ADDRLP4 96
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 88
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 569
;568:		
;569:		j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 571
;570:		//runs through first point
;571:		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV);
ADDRLP4 100
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 104
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 104
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 100
INDIRI4
ADDI4
ADDRLP4 104
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 572
;572:		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV);
ADDRLP4 108
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 112
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 112
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 108
INDIRI4
ADDI4
ADDRLP4 112
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 573
;573:		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV);
ADDRLP4 116
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 120
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 120
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 116
INDIRI4
ADDI4
ADDRLP4 120
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 574
;574:		theMatrix[curRow][(curCam-1)*4+j++] = 1;
ADDRLP4 124
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 124
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 128
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 124
INDIRI4
ADDI4
ADDRLP4 128
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 575
;575:		theMatrix[curRow++][(curCam-1)*4+4] = 0;//cam[(curCam-1)].origin[k];
ADDRLP4 132
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 136
CNSTI4 2
ASGNI4
ADDRLP4 140
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 136
INDIRI4
LSHI4
ADDRLP4 136
INDIRI4
LSHI4
ADDRLP4 140
INDIRI4
SUBI4
ADDRLP4 140
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 132
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 577
;576:		
;577:		deltaT = (double)(cam[curCam].time - cam[curCam-1].time);
ADDRLP4 144
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 16
ADDRLP4 144
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
ADDRGP4 cam-128+24
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 578
;578:		j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 580
;579:		//runs through second point
;580:		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
ADDRLP4 148
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
CNSTI4 2
ASGNI4
ADDRLP4 156
ADDRLP4 16
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRGP4 curCam
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 148
INDIRI4
ADDI4
ADDRLP4 152
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 156
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 581
;581:		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
ADDRLP4 160
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 160
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 164
CNSTI4 2
ASGNI4
ADDRLP4 168
ADDRLP4 16
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRGP4 curCam
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 160
INDIRI4
ADDI4
ADDRLP4 164
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 168
INDIRF4
ADDRLP4 168
INDIRF4
MULF4
ASGNF4
line 582
;582:		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV);
ADDRLP4 172
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 176
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 176
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 172
INDIRI4
ADDI4
ADDRLP4 176
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 16
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
line 583
;583:		theMatrix[curRow][(curCam-1)*4+j++] = 1;
ADDRLP4 180
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 184
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 184
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 180
INDIRI4
ADDI4
ADDRLP4 184
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 584
;584:		theMatrix[curRow++][(curCam-1)*4+4] = cam[curCam].origin[k] - cam[curCam-1].origin[k];
ADDRLP4 188
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 188
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 192
ADDRGP4 curCam
INDIRI4
ASGNI4
ADDRLP4 196
CNSTI4 2
ASGNI4
ADDRLP4 200
CNSTI4 16
ASGNI4
ADDRLP4 204
ADDRLP4 12
INDIRI4
ADDRLP4 196
INDIRI4
LSHI4
ASGNI4
ADDRLP4 208
ADDRLP4 192
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 192
INDIRI4
ADDRLP4 196
INDIRI4
LSHI4
ADDRLP4 196
INDIRI4
LSHI4
ADDRLP4 200
INDIRI4
SUBI4
ADDRLP4 200
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 188
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
ADDRGP4 cam
ADDP4
ADDP4
INDIRF4
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
ADDRGP4 cam-128
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 586
;585:		
;586:		numRows = curRow;
ADDRGP4 numRows
ADDRLP4 4
INDIRI4
ASGNI4
line 587
;587:		numCols = curCam*4+1;
ADDRGP4 numCols
ADDRGP4 curCam
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 1
ADDI4
ASGNI4
line 588
;588:		rowReduce();
ADDRGP4 rowReduce
CALLV
pop
line 590
;589:		
;590:		for( i=0; i<curCam; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $406
JUMPV
LABELV $403
line 591
;591:		{
line 592
;592:			cam[i].csi_coeff[k][0] = theMatrix[i*4][curCam*4];
ADDRLP4 216
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+32
ADDP4
ADDP4
ADDRGP4 curCam
INDIRI4
ADDRLP4 216
INDIRI4
LSHI4
ADDRLP4 216
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
ADDRLP4 216
INDIRI4
LSHI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
INDIRF4
ASGNF4
line 593
;593:			cam[i].csi_coeff[k][1] = theMatrix[i*4+1][curCam*4];
ADDRLP4 220
CNSTI4 4
ASGNI4
ADDRLP4 228
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 220
INDIRI4
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+32
ADDP4
ADDP4
ADDRLP4 220
INDIRI4
ADDP4
ADDRGP4 curCam
INDIRI4
ADDRLP4 228
INDIRI4
LSHI4
ADDRLP4 228
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
ADDRLP4 228
INDIRI4
LSHI4
MULI4
ADDRGP4 theMatrix+804
ADDP4
ADDP4
INDIRF4
ASGNF4
line 594
;594:			cam[i].csi_coeff[k][2] = theMatrix[i*4+2][curCam*4];
ADDRLP4 236
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+32
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 curCam
INDIRI4
ADDRLP4 236
INDIRI4
LSHI4
ADDRLP4 236
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
ADDRLP4 236
INDIRI4
LSHI4
MULI4
ADDRGP4 theMatrix+1608
ADDP4
ADDP4
INDIRF4
ASGNF4
line 595
;595:			cam[i].csi_coeff[k][3] = theMatrix[i*4+3][curCam*4];
ADDRLP4 244
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+32
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 curCam
INDIRI4
ADDRLP4 244
INDIRI4
LSHI4
ADDRLP4 244
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
ADDRLP4 244
INDIRI4
LSHI4
MULI4
ADDRGP4 theMatrix+2412
ADDP4
ADDP4
INDIRF4
ASGNF4
line 596
;596:		}
LABELV $404
line 590
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $406
ADDRLP4 0
INDIRI4
ADDRGP4 curCam
INDIRI4
LTI4 $403
line 597
;597:	}
LABELV $385
line 501
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 3
LTI4 $384
line 603
;598:	
;599:	//yeah, i know, bad coding to copy/paste the whole loop, but we need to do it over again for angles and i
;600:	//really dont want to go to using pointers and shit, would take a lot of recoding whereas this
;601:	//already works..... (aka, i lazy :oops)
;602:	
;603:	for( k=0; k<3; k++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $414
line 604
;604:	{
line 605
;605:		curRow = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 606
;606:		memset( theMatrix[0], 0, sizeof( theMatrix ) );
ADDRGP4 theMatrix
ARGP4
CNSTI4 0
ARGI4
CNSTI4 160800
ARGI4
ADDRGP4 memset
CALLP4
pop
line 607
;607:		for( i=0; i<curCam-1; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $421
JUMPV
LABELV $418
line 608
;608:		{
line 609
;609:			double deltaT = (double)(cam[i+1].time - cam[i].time);
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ADDRGP4 cam+128+24
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 610
;610:			double deltaD = (double)(cam[i+1].angle[k] - cam[i].angle[k]);
ADDRLP4 32
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 24
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
ADDRGP4 cam+128+12
ADDP4
ADDP4
INDIRF4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
ADDRGP4 cam+12
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 611
;611:			j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 614
;612:			//runs through first point
;613:			//guess what? ive decided it's (0,0) kthx.
;614:			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV);
ADDRLP4 40
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
LSHI4
ADDRLP4 40
INDIRI4
ADDI4
ADDRLP4 44
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 615
;615:			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV);
ADDRLP4 48
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 52
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDRLP4 48
INDIRI4
ADDI4
ADDRLP4 52
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 616
;616:			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV);
ADDRLP4 56
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRI4
LSHI4
ADDRLP4 56
INDIRI4
ADDI4
ADDRLP4 60
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 617
;617:			theMatrix[curRow][i*4+j++] = 1;
ADDRLP4 64
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 64
INDIRI4
ADDI4
ADDRLP4 68
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 618
;618:			theMatrix[curRow++][(curCam-1)*4+4] = 0;//cam[i].origin[k];
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
CNSTI4 2
ASGNI4
ADDRLP4 80
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 76
INDIRI4
LSHI4
ADDRLP4 76
INDIRI4
LSHI4
ADDRLP4 80
INDIRI4
SUBI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 72
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 620
;619:			
;620:			j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 623
;621:			//runs through second point
;622:			//doodz we're makin dese thangs unit doodz so it b leeter :>
;623:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
ADDRLP4 84
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 84
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 88
CNSTI4 2
ASGNI4
ADDRLP4 92
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRLP4 0
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRLP4 84
INDIRI4
ADDI4
ADDRLP4 88
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 92
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 624
;624:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
ADDRLP4 96
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
CNSTI4 2
ASGNI4
ADDRLP4 104
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRLP4 0
INDIRI4
ADDRLP4 100
INDIRI4
LSHI4
ADDRLP4 96
INDIRI4
ADDI4
ADDRLP4 100
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 104
INDIRF4
ADDRLP4 104
INDIRF4
MULF4
ASGNF4
line 625
;625:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV);
ADDRLP4 108
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 112
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 112
INDIRI4
LSHI4
ADDRLP4 108
INDIRI4
ADDI4
ADDRLP4 112
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
line 626
;626:			theMatrix[curRow][i*4+j++] = 1;
ADDRLP4 116
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 120
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 120
INDIRI4
LSHI4
ADDRLP4 116
INDIRI4
ADDI4
ADDRLP4 120
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 627
;627:			theMatrix[curRow++][(curCam-1)*4+4] = deltaD;
ADDRLP4 124
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 124
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
CNSTI4 2
ASGNI4
ADDRLP4 132
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 128
INDIRI4
LSHI4
ADDRLP4 128
INDIRI4
LSHI4
ADDRLP4 132
INDIRI4
SUBI4
ADDRLP4 132
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 124
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 629
;628:			
;629:			j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 631
;630:			//first derivitives are equal
;631:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*3;
ADDRLP4 136
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
CNSTI4 2
ASGNI4
ADDRLP4 144
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRLP4 0
INDIRI4
ADDRLP4 140
INDIRI4
LSHI4
ADDRLP4 136
INDIRI4
ADDI4
ADDRLP4 140
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1077936128
ADDRLP4 144
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
MULF4
ASGNF4
line 632
;632:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*2;
ADDRLP4 148
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
ADDRLP4 148
INDIRI4
ADDI4
ADDRLP4 152
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1073741824
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
MULF4
ASGNF4
line 633
;633:			theMatrix[curRow][i*4+j++] = 1;
ADDRLP4 156
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 156
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 160
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 160
INDIRI4
LSHI4
ADDRLP4 156
INDIRI4
ADDI4
ADDRLP4 160
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 634
;634:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 164
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 164
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 168
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 168
INDIRI4
LSHI4
ADDRLP4 164
INDIRI4
ADDI4
ADDRLP4 168
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 635
;635:			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*3;
ADDRLP4 172
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 176
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 176
INDIRI4
LSHI4
ADDRLP4 172
INDIRI4
ADDI4
ADDRLP4 176
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 636
;636:			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*2;
ADDRLP4 180
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 184
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 184
INDIRI4
LSHI4
ADDRLP4 180
INDIRI4
ADDI4
ADDRLP4 184
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 637
;637:			theMatrix[curRow][i*4+j++] = -1;
ADDRLP4 188
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 188
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 192
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 192
INDIRI4
LSHI4
ADDRLP4 188
INDIRI4
ADDI4
ADDRLP4 192
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 3212836864
ASGNF4
line 638
;638:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 196
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 196
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 200
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 200
INDIRI4
LSHI4
ADDRLP4 196
INDIRI4
ADDI4
ADDRLP4 200
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 639
;639:			theMatrix[curRow++][(curCam-1)*4+4] = 0;
ADDRLP4 204
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 204
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 208
CNSTI4 2
ASGNI4
ADDRLP4 212
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 208
INDIRI4
LSHI4
ADDRLP4 208
INDIRI4
LSHI4
ADDRLP4 212
INDIRI4
SUBI4
ADDRLP4 212
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 204
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 641
;640:			
;641:			j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 643
;642:			//second derivitives are equal
;643:			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*6;
ADDRLP4 216
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 216
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 220
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 220
INDIRI4
LSHI4
ADDRLP4 216
INDIRI4
ADDI4
ADDRLP4 220
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1086324736
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
MULF4
ASGNF4
line 644
;644:			theMatrix[curRow][i*4+j++] = 2;
ADDRLP4 224
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 224
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 228
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 228
INDIRI4
LSHI4
ADDRLP4 224
INDIRI4
ADDI4
ADDRLP4 228
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1073741824
ASGNF4
line 645
;645:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 232
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 232
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 236
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 236
INDIRI4
LSHI4
ADDRLP4 232
INDIRI4
ADDI4
ADDRLP4 236
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 646
;646:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 240
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 240
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 244
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 244
INDIRI4
LSHI4
ADDRLP4 240
INDIRI4
ADDI4
ADDRLP4 244
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 647
;647:			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*6;
ADDRLP4 248
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 248
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 252
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 252
INDIRI4
LSHI4
ADDRLP4 248
INDIRI4
ADDI4
ADDRLP4 252
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 648
;648:			theMatrix[curRow][i*4+j++] = -2;
ADDRLP4 256
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 260
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 260
INDIRI4
LSHI4
ADDRLP4 256
INDIRI4
ADDI4
ADDRLP4 260
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 3221225472
ASGNF4
line 649
;649:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 264
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 268
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 268
INDIRI4
LSHI4
ADDRLP4 264
INDIRI4
ADDI4
ADDRLP4 268
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 650
;650:			theMatrix[curRow][i*4+j++] = 0;
ADDRLP4 272
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 272
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 276
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 276
INDIRI4
LSHI4
ADDRLP4 272
INDIRI4
ADDI4
ADDRLP4 276
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 651
;651:			theMatrix[curRow++][(curCam-1)*4+4] = 0;
ADDRLP4 280
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 280
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 284
CNSTI4 2
ASGNI4
ADDRLP4 288
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 284
INDIRI4
LSHI4
ADDRLP4 284
INDIRI4
LSHI4
ADDRLP4 288
INDIRI4
SUBI4
ADDRLP4 288
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 280
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 652
;652:		}
LABELV $419
line 607
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $421
ADDRLP4 0
INDIRI4
ADDRGP4 curCam
INDIRI4
CNSTI4 1
SUBI4
LTI4 $418
line 655
;653:		//4 more equations are needed to have a solvable matrix (there should be n-1 splines)
;654:		
;655:		j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 657
;656:		//second derivitive at the end is zero
;657:		theMatrix[curRow][(curCam-1)*4+j++] = (((double)cam[curCam].time-cam[curCam-1].time)/TIMEDIV)*6;
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
ADDRGP4 curCam
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 32
ADDRLP4 24
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 28
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1086324736
ADDRLP4 32
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRI4
ADDRGP4 cam-128+24
ADDP4
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1148846080
DIVF4
MULF4
ASGNF4
line 658
;658:		theMatrix[curRow][(curCam-1)*4+j++] = 2;
ADDRLP4 36
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 36
INDIRI4
ADDI4
ADDRLP4 40
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1073741824
ASGNF4
line 659
;659:		theMatrix[curRow][(curCam-1)*4+j++] = 0;
ADDRLP4 44
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 48
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
ADDRLP4 48
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 660
;660:		theMatrix[curRow][(curCam-1)*4+j++] = 0;
ADDRLP4 52
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 56
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 52
INDIRI4
ADDI4
ADDRLP4 56
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 661
;661:		theMatrix[curRow++][(curCam-1)*4+4] = 0;
ADDRLP4 60
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 64
CNSTI4 2
ASGNI4
ADDRLP4 68
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 68
INDIRI4
SUBI4
ADDRLP4 68
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 663
;662:		
;663:		j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 665
;664:		//second derivitive at the beginning is zero
;665:		theMatrix[curRow][j++] = 0;//(((double)cam[0].time)/TIMEDIV)*6;
ADDRLP4 72
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 666
;666:		theMatrix[curRow][j++] = 2;
ADDRLP4 76
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1073741824
ASGNF4
line 667
;667:		theMatrix[curRow][j++] = 0;
ADDRLP4 80
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 668
;668:		theMatrix[curRow][j++] = 0;
ADDRLP4 84
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 84
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 669
;669:		theMatrix[curRow++][(curCam-1)*4+4] = 0;
ADDRLP4 88
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 92
CNSTI4 2
ASGNI4
ADDRLP4 96
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 92
INDIRI4
LSHI4
ADDRLP4 92
INDIRI4
LSHI4
ADDRLP4 96
INDIRI4
SUBI4
ADDRLP4 96
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 88
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 671
;670:		
;671:		j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 673
;672:		//runs through first point
;673:		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV);
ADDRLP4 100
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 104
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 104
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 100
INDIRI4
ADDI4
ADDRLP4 104
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 674
;674:		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV);
ADDRLP4 108
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 112
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 112
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 108
INDIRI4
ADDI4
ADDRLP4 112
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 675
;675:		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV);
ADDRLP4 116
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 120
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 120
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 116
INDIRI4
ADDI4
ADDRLP4 120
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 676
;676:		theMatrix[curRow][(curCam-1)*4+j++] = 1;
ADDRLP4 124
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 124
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 128
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 124
INDIRI4
ADDI4
ADDRLP4 128
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 677
;677:		theMatrix[curRow++][(curCam-1)*4+4] = 0;//cam[(curCam-1)].origin[k];
ADDRLP4 132
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 136
CNSTI4 2
ASGNI4
ADDRLP4 140
CNSTI4 16
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 136
INDIRI4
LSHI4
ADDRLP4 136
INDIRI4
LSHI4
ADDRLP4 140
INDIRI4
SUBI4
ADDRLP4 140
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 132
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 679
;678:		
;679:		deltaT = (double)(cam[curCam].time - cam[curCam-1].time);
ADDRLP4 144
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 16
ADDRLP4 144
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
ADDRGP4 cam-128+24
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 680
;680:		j=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 682
;681:		//runs through second point
;682:		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
ADDRLP4 148
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
CNSTI4 2
ASGNI4
ADDRLP4 156
ADDRLP4 16
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRGP4 curCam
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 148
INDIRI4
ADDI4
ADDRLP4 152
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 156
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 683
;683:		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
ADDRLP4 160
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 160
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 164
CNSTI4 2
ASGNI4
ADDRLP4 168
ADDRLP4 16
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
ADDRGP4 curCam
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 160
INDIRI4
ADDI4
ADDRLP4 164
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 168
INDIRF4
ADDRLP4 168
INDIRF4
MULF4
ASGNF4
line 684
;684:		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV);
ADDRLP4 172
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 176
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 176
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 172
INDIRI4
ADDI4
ADDRLP4 176
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 16
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
line 685
;685:		theMatrix[curRow][(curCam-1)*4+j++] = 1;
ADDRLP4 180
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 184
CNSTI4 2
ASGNI4
ADDRGP4 curCam
INDIRI4
ADDRLP4 184
INDIRI4
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 180
INDIRI4
ADDI4
ADDRLP4 184
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
CNSTF4 1065353216
ASGNF4
line 686
;686:		theMatrix[curRow++][(curCam-1)*4+4] = cam[curCam].angle[k] - cam[curCam-1].angle[k];
ADDRLP4 188
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 188
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 192
ADDRGP4 curCam
INDIRI4
ASGNI4
ADDRLP4 196
CNSTI4 2
ASGNI4
ADDRLP4 200
CNSTI4 16
ASGNI4
ADDRLP4 204
ADDRLP4 12
INDIRI4
ADDRLP4 196
INDIRI4
LSHI4
ASGNI4
ADDRLP4 208
ADDRLP4 192
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 192
INDIRI4
ADDRLP4 196
INDIRI4
LSHI4
ADDRLP4 196
INDIRI4
LSHI4
ADDRLP4 200
INDIRI4
SUBI4
ADDRLP4 200
INDIRI4
ADDI4
CNSTI4 804
ADDRLP4 188
INDIRI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
ADDRGP4 cam+12
ADDP4
ADDP4
INDIRF4
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
ADDRGP4 cam-128+12
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 688
;687:		
;688:		numRows = curRow;
ADDRGP4 numRows
ADDRLP4 4
INDIRI4
ASGNI4
line 689
;689:		numCols = curCam*4+1;
ADDRGP4 numCols
ADDRGP4 curCam
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 1
ADDI4
ASGNI4
line 690
;690:		rowReduce();
ADDRGP4 rowReduce
CALLV
pop
line 692
;691:		
;692:		for( i=0; i<curCam; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $440
JUMPV
LABELV $437
line 693
;693:		{
line 694
;694:			cam[i].csi_coeff[k+3][0] = theMatrix[i*4][curCam*4];
ADDRLP4 216
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 48
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+32
ADDP4
ADDP4
ADDRGP4 curCam
INDIRI4
ADDRLP4 216
INDIRI4
LSHI4
ADDRLP4 216
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
ADDRLP4 216
INDIRI4
LSHI4
MULI4
ADDRGP4 theMatrix
ADDP4
ADDP4
INDIRF4
ASGNF4
line 695
;695:			cam[i].csi_coeff[k+3][1] = theMatrix[i*4+1][curCam*4];
ADDRLP4 220
CNSTI4 4
ASGNI4
ADDRLP4 228
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 220
INDIRI4
LSHI4
CNSTI4 48
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+32
ADDP4
ADDP4
ADDRLP4 220
INDIRI4
ADDP4
ADDRGP4 curCam
INDIRI4
ADDRLP4 228
INDIRI4
LSHI4
ADDRLP4 228
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
ADDRLP4 228
INDIRI4
LSHI4
MULI4
ADDRGP4 theMatrix+804
ADDP4
ADDP4
INDIRF4
ASGNF4
line 696
;696:			cam[i].csi_coeff[k+3][2] = theMatrix[i*4+2][curCam*4];
ADDRLP4 236
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 48
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+32
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 curCam
INDIRI4
ADDRLP4 236
INDIRI4
LSHI4
ADDRLP4 236
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
ADDRLP4 236
INDIRI4
LSHI4
MULI4
ADDRGP4 theMatrix+1608
ADDP4
ADDP4
INDIRF4
ASGNF4
line 697
;697:			cam[i].csi_coeff[k+3][3] = theMatrix[i*4+3][curCam*4];
ADDRLP4 244
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 48
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+32
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 curCam
INDIRI4
ADDRLP4 244
INDIRI4
LSHI4
ADDRLP4 244
INDIRI4
LSHI4
CNSTI4 804
ADDRLP4 0
INDIRI4
ADDRLP4 244
INDIRI4
LSHI4
MULI4
ADDRGP4 theMatrix+2412
ADDP4
ADDP4
INDIRF4
ASGNF4
line 698
;698:		}
LABELV $438
line 692
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $440
ADDRLP4 0
INDIRI4
ADDRGP4 curCam
INDIRI4
LTI4 $437
line 699
;699:	}
LABELV $415
line 603
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 3
LTI4 $414
line 700
;700:}
LABELV $383
endproc reCalc 292 12
proc CG_smoothcam_f 160 12
line 705
;701:
;702:// end cubic spline interpolation code
;703:
;704:static void CG_smoothcam_f(void)
;705:{
line 707
;706:	char x[20],y[20],z[20],time[20],*sec;
;707:	int i=0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 711
;708:	//if(!cg.demoPlayback)return;
;709:	
;710:	//origins
;711:	trap_Argv( ++i, x, 20 );
ADDRLP4 88
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 88
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 712
;712:	if(Q_stricmp(x,"TP")==0) {
ADDRLP4 24
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $449
line 713
;713:		cam[curCam].thirdPerson = qtrue;
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+28
ADDP4
CNSTI4 1
ASGNI4
line 714
;714:		++i;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 715
;715:	}
LABELV $449
line 716
;716:	trap_Argv( ++i, y, 20 );
ADDRLP4 96
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 717
;717:	trap_Argv( ++i, z, 20 );
ADDRLP4 100
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 100
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 64
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 718
;718:	VectorSet( cam[curCam].origin, atof(x), atof(y), atof(z) );
ADDRLP4 24
ARGP4
ADDRLP4 104
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam
ADDP4
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 44
ARGP4
ADDRLP4 108
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+4
ADDP4
ADDRLP4 108
INDIRF4
ASGNF4
ADDRLP4 64
ARGP4
ADDRLP4 112
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+8
ADDP4
ADDRLP4 112
INDIRF4
ASGNF4
line 721
;719:	
;720:	//angles
;721:	trap_Argv( ++i, x, 20 );
ADDRLP4 116
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 116
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 722
;722:	trap_Argv( ++i, y, 20 );
ADDRLP4 120
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 723
;723:	trap_Argv( ++i, z, 20 );
ADDRLP4 124
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 124
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRLP4 64
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 724
;724:	VectorSet( cam[curCam].angle, atof(x), atof(y), atof(z) );
ADDRLP4 24
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+12
ADDP4
ADDRLP4 128
INDIRF4
ASGNF4
ADDRLP4 44
ARGP4
ADDRLP4 132
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+12+4
ADDP4
ADDRLP4 132
INDIRF4
ASGNF4
ADDRLP4 64
ARGP4
ADDRLP4 136
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+12+8
ADDP4
ADDRLP4 136
INDIRF4
ASGNF4
line 726
;725:	
;726:	trap_Argv( ++i, time, 20 );
ADDRLP4 140
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 140
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 727
;727:	for( i=0; time[i]!=':' && time[i]; i++ );
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $463
JUMPV
LABELV $460
LABELV $461
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $463
ADDRLP4 144
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 58
EQI4 $464
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $460
LABELV $464
line 728
;728:	if(time[i]==0)
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $465
line 729
;729:		sec = 0;
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRGP4 $466
JUMPV
LABELV $465
line 731
;730:	else
;731:	{
line 732
;732:		time[i] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 733
;733:		sec = time+i+1;
ADDRLP4 84
ADDRLP4 0
INDIRI4
ADDRLP4 4+1
ADDP4
ASGNP4
line 734
;734:	}
LABELV $466
line 735
;735:	cam[curCam].time = ( atoi( time ) * 60000 + atof( sec ) * 1000 );
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 curCam
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+24
ADDP4
CNSTI4 60000
ADDRLP4 148
INDIRI4
MULI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 152
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 737
;736:	
;737:	reCalc();
ADDRGP4 reCalc
CALLV
pop
line 739
;738:	
;739:	CG_Printf("Added Cam Location %d.\n",curCam);
ADDRGP4 $469
ARGP4
ADDRGP4 curCam
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 740
;740:	curCam++;
ADDRLP4 156
ADDRGP4 curCam
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 741
;741:}
LABELV $448
endproc CG_smoothcam_f 160 12
proc CG_insertcam_f 176 12
line 744
;742:
;743:static void CG_insertcam_f(void)
;744:{
line 746
;745:	char x[20],y[20],z[20],time[20],*sec;
;746:	int i=0, insertCam, j;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 749
;747:	//if(!cg.demoPlayback)return;
;748:	
;749:	trap_Argv( ++i, x, 20 );
ADDRLP4 96
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRLP4 32
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 750
;750:	insertCam = atoi( x );
ADDRLP4 32
ARGP4
ADDRLP4 100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 100
INDIRI4
ASGNI4
line 752
;751:	//push cams >= down one
;752:	for ( j=curCam-1; j>=insertCam; j-- )
ADDRLP4 4
ADDRGP4 curCam
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $474
JUMPV
LABELV $471
line 753
;753:	{
line 754
;754:		cam[ j+1 ] = cam[ j ];
ADDRLP4 104
ADDRLP4 4
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 104
INDIRI4
ADDRGP4 cam+128
ADDP4
ADDRLP4 104
INDIRI4
ADDRGP4 cam
ADDP4
INDIRB
ASGNB 128
line 755
;755:	}
LABELV $472
line 752
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $474
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $471
line 757
;756:	//origins
;757:	trap_Argv( ++i, x, 20 );
ADDRLP4 104
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 104
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 32
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 758
;758:	if(Q_stricmp(x,"TP")==0) {
ADDRLP4 32
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $476
line 759
;759:		cam[insertCam].thirdPerson = qtrue;
ADDRLP4 28
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+28
ADDP4
CNSTI4 1
ASGNI4
line 760
;760:		++i;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 761
;761:	}
LABELV $476
line 762
;762:	trap_Argv( ++i, y, 20 );
ADDRLP4 112
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 112
INDIRI4
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 763
;763:	trap_Argv( ++i, z, 20 );
ADDRLP4 116
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 116
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 764
;764:	VectorSet( cam[insertCam].origin, atof(x), atof(y), atof(z) );
ADDRLP4 32
ARGP4
ADDRLP4 120
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam
ADDP4
ADDRLP4 120
INDIRF4
ASGNF4
ADDRLP4 52
ARGP4
ADDRLP4 124
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+4
ADDP4
ADDRLP4 124
INDIRF4
ASGNF4
ADDRLP4 72
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+8
ADDP4
ADDRLP4 128
INDIRF4
ASGNF4
line 767
;765:	
;766:	//angles
;767:	trap_Argv( ++i, x, 20 );
ADDRLP4 132
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 132
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 32
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 768
;768:	trap_Argv( ++i, y, 20 );
ADDRLP4 136
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
ASGNI4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 769
;769:	trap_Argv( ++i, z, 20 );
ADDRLP4 140
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 140
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 770
;770:	VectorSet( cam[insertCam].angle, atof(x), atof(y), atof(z) );
ADDRLP4 32
ARGP4
ADDRLP4 144
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+12
ADDP4
ADDRLP4 144
INDIRF4
ASGNF4
ADDRLP4 52
ARGP4
ADDRLP4 148
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+12+4
ADDP4
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 72
ARGP4
ADDRLP4 152
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+12+8
ADDP4
ADDRLP4 152
INDIRF4
ASGNF4
line 772
;771:	
;772:	trap_Argv( ++i, time, 20 );
ADDRLP4 156
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 773
;773:	for( i=0; time[i]!=':' && time[i]; i++ );
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $489
JUMPV
LABELV $486
LABELV $487
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $489
ADDRLP4 160
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 58
EQI4 $490
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $486
LABELV $490
line 774
;774:	if(time[i]==0)
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $491
line 775
;775:		sec = 0;
ADDRLP4 92
CNSTP4 0
ASGNP4
ADDRGP4 $492
JUMPV
LABELV $491
line 777
;776:	else
;777:	{
line 778
;778:		time[i] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 779
;779:		sec = time+i+1;
ADDRLP4 92
ADDRLP4 0
INDIRI4
ADDRLP4 8+1
ADDP4
ASGNP4
line 780
;780:	}
LABELV $492
line 781
;781:	cam[insertCam].time = ( atoi( time ) * 60000 + atof( sec ) * 1000 );
ADDRLP4 8
ARGP4
ADDRLP4 164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+24
ADDP4
CNSTI4 60000
ADDRLP4 164
INDIRI4
MULI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 168
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 783
;782:	
;783:	reCalc();
ADDRGP4 reCalc
CALLV
pop
line 785
;784:	
;785:	CG_Printf("Inserted Cam Location %d.\n",insertCam);
ADDRGP4 $495
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 786
;786:	curCam++;
ADDRLP4 172
ADDRGP4 curCam
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 787
;787:}
LABELV $470
endproc CG_insertcam_f 176 12
proc CG_removecam_f 48 12
line 790
;788:
;789:static void CG_removecam_f(void)
;790:{
line 792
;791:	char x[20];
;792:	int i=0, removeCam, j;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 795
;793:	//if(!cg.demoPlayback)return;
;794:	
;795:	if( trap_Argc() != 2 )
ADDRLP4 32
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $497
line 796
;796:	{
line 797
;797:		CG_Printf( "Usage: removecam <cam num>\n" );
ADDRGP4 $499
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 798
;798:		return;
ADDRGP4 $496
JUMPV
LABELV $497
line 801
;799:	}
;800:	
;801:	trap_Argv( ++i, x, 20 );
ADDRLP4 36
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 802
;802:	removeCam = atoi( x );
ADDRLP4 8
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 804
;803:	//push cams >= up one
;804:	for ( j=removeCam; j<curCam; j++ )
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $503
JUMPV
LABELV $500
line 805
;805:	{
line 806
;806:		cam[ j ] = cam[ j+1 ];
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 cam
ADDP4
ADDRLP4 44
INDIRI4
ADDRGP4 cam+128
ADDP4
INDIRB
ASGNB 128
line 807
;807:	}
LABELV $501
line 804
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $503
ADDRLP4 0
INDIRI4
ADDRGP4 curCam
INDIRI4
LTI4 $500
line 809
;808:	
;809:	reCalc();
ADDRGP4 reCalc
CALLV
pop
line 811
;810:	
;811:	CG_Printf("Removed Cam Location %d.\n",removeCam);
ADDRGP4 $505
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 812
;812:	curCam--;
ADDRLP4 44
ADDRGP4 curCam
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 813
;813:}
LABELV $496
endproc CG_removecam_f 48 12
proc CG_removeallcams_f 4 12
line 816
;814:
;815:static void CG_removeallcams_f(void)
;816:{
line 820
;817:	int i;
;818:	//if(!cg.demoPlayback)return;
;819:	
;820:	for ( i=0; i<curCam; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $510
JUMPV
LABELV $507
line 821
;821:	{
line 822
;822:		memset( &cam[ i ], 0, sizeof( cam[ i ] ) );
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 memset
CALLP4
pop
line 823
;823:	}
LABELV $508
line 820
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $510
ADDRLP4 0
INDIRI4
ADDRGP4 curCam
INDIRI4
LTI4 $507
line 825
;824:	
;825:	CG_Printf("Removed %d Cams.\n",curCam);
ADDRGP4 $511
ARGP4
ADDRGP4 curCam
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 826
;826:	curCam = 0;
ADDRGP4 curCam
CNSTI4 0
ASGNI4
line 827
;827:}
LABELV $506
endproc CG_removeallcams_f 4 12
proc CG_savecamcfg_f 2148 44
line 830
;828:
;829:static void CG_savecamcfg_f(void)
;830:{
line 836
;831:	char filename[MAX_QPATH];
;832:	char cmdstring[MAX_STRING_CHARS];
;833:	int i;
;834:	fileHandle_t f;
;835:	
;836:	if (trap_Argc()!=2)
ADDRLP4 1096
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 2
EQI4 $513
line 837
;837:	{
line 838
;838:		CG_Printf("Syntax: savecamcfg <filename>\n");
ADDRGP4 $515
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 839
;839:		return;
ADDRGP4 $512
JUMPV
LABELV $513
line 842
;840:	}
;841:	
;842:	trap_Argv( 1, filename, sizeof( filename ) );
CNSTI4 1
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 844
;843:	
;844:	trap_FS_FOpenFile( filename, &f, FS_APPEND_SYNC );
ADDRLP4 1032
ARGP4
ADDRLP4 1028
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 845
;845:	if( !f )
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $516
line 846
;846:	{
line 847
;847:		CG_Printf( "Failed to open '%s' for writing.\n", filename );
ADDRGP4 $518
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 848
;848:		return;
ADDRGP4 $512
JUMPV
LABELV $516
line 851
;849:	}
;850:	
;851:	CG_Printf( "Dumping Cam " );
ADDRGP4 $519
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 853
;852:	
;853:	for( i=0; i<curCam; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $523
JUMPV
LABELV $520
line 854
;854:	{
line 856
;855:		char mytmpstr[MAX_STRING_CHARS];
;856:		Q_strncpyz( mytmpstr, va( "%.3f", (float)cam[i].time / 1000 - cam[i].time / 60000 * 60 ), sizeof( mytmpstr ) );
ADDRGP4 $524
ARGP4
ADDRLP4 2124
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 2124
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
CNSTI4 60
ADDRLP4 2124
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CNSTI4 60000
DIVI4
MULI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
ADDRLP4 2128
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 857
;857:		if( strlen( mytmpstr ) < 6 ) Com_sprintf( mytmpstr, sizeof( mytmpstr ), "0%s", mytmpstr );
ADDRLP4 1100
ARGP4
ADDRLP4 2132
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2132
INDIRI4
CNSTI4 6
GEI4 $527
ADDRLP4 1100
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $529
ARGP4
ADDRLP4 1100
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $527
line 858
;858:		CG_Printf("%d ",i);
ADDRGP4 $530
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 859
;859:		if( !cam[i].thirdPerson )
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+28
ADDP4
INDIRI4
CNSTI4 0
NEI4 $531
line 860
;860:			Com_sprintf( cmdstring, sizeof( cmdstring ), "smoothcam %f %f %f %f %f %f %d:%s\n",
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $534
ARGP4
ADDRLP4 2136
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 2136
INDIRI4
ADDRGP4 cam
ADDP4
INDIRF4
ARGF4
ADDRLP4 2136
INDIRI4
ADDRGP4 cam+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 2136
INDIRI4
ADDRGP4 cam+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 2136
INDIRI4
ADDRGP4 cam+12
ADDP4
INDIRF4
ARGF4
ADDRLP4 2136
INDIRI4
ADDRGP4 cam+12+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 2136
INDIRI4
ADDRGP4 cam+12+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 2136
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 1100
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $532
JUMPV
LABELV $531
line 865
;861:						 cam[i].origin[0], cam[i].origin[1], cam[i].origin[2],
;862:						 cam[i].angle[0], cam[i].angle[1], cam[i].angle[2],
;863:						 cam[i].time / 60000, mytmpstr );
;864:		else
;865:			Com_sprintf( cmdstring, sizeof( cmdstring ), "smoothcam TP 0 %f %f %f %f %f %d:%s\n",
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $543
ARGP4
ADDRLP4 2140
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 2140
INDIRI4
ADDRGP4 cam+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 2140
INDIRI4
ADDRGP4 cam+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 2140
INDIRI4
ADDRGP4 cam+12
ADDP4
INDIRF4
ARGF4
ADDRLP4 2140
INDIRI4
ADDRGP4 cam+12+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 2140
INDIRI4
ADDRGP4 cam+12+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 2140
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 1100
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $532
line 869
;866:						 cam[i].origin[1], cam[i].origin[2], cam[i].angle[0],
;867:						 cam[i].angle[1], cam[i].angle[2], cam[i].time / 60000,
;868:						 mytmpstr );
;869:		trap_FS_Write( cmdstring, strlen( cmdstring ), f );
ADDRLP4 4
ARGP4
ADDRLP4 2144
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2144
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 870
;870:	}
LABELV $521
line 853
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $523
ADDRLP4 0
INDIRI4
ADDRGP4 curCam
INDIRI4
LTI4 $520
line 871
;871:	trap_FS_FCloseFile( f );
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 872
;872:	CG_Printf( "\nCam Data Dumped to %s.\n", filename );
ADDRGP4 $552
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 873
;873:}
LABELV $512
endproc CG_savecamcfg_f 2148 44
data
export showCam
align 4
LABELV showCam
byte 4 -1
code
proc CG_showcam_f 1084 40
line 878
;874:
;875:int showCam = -1;
;876:
;877:static void CG_showcam_f(void)
;878:{
line 881
;879:	int i;
;880:	
;881:	if ( trap_Argc() > 1 )
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LEI4 $554
line 882
;882:	{
line 885
;883:		char tmps[20];
;884:		char mytmpstr[MAX_STRING_CHARS];
;885:		trap_Argv( 1, tmps, sizeof( tmps ) );
CNSTI4 1
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 886
;886:		showCam = i = atoi( tmps );
ADDRLP4 1032
ARGP4
ADDRLP4 1052
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1052
INDIRI4
ASGNI4
ADDRGP4 showCam
ADDRLP4 1052
INDIRI4
ASGNI4
line 887
;887:		Q_strncpyz( mytmpstr, va( "%.3f", (float)cam[i].time / 1000 - cam[i].time / 60000 * 60 ), sizeof( mytmpstr ) );
ADDRGP4 $524
ARGP4
ADDRLP4 1056
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 1056
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
CNSTI4 60
ADDRLP4 1056
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CNSTI4 60000
DIVI4
MULI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 888
;888:		if( strlen( mytmpstr ) < 6 ) Com_sprintf( mytmpstr, sizeof( mytmpstr ), "0%s", mytmpstr );
ADDRLP4 8
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 6
GEI4 $558
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $529
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $558
line 889
;889:		if( !cam[i].thirdPerson )
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+28
ADDP4
INDIRI4
CNSTI4 0
NEI4 $560
line 890
;890:			CG_Printf( "%d: %f %f %f %f %f %f %d:%s\n", i,
ADDRGP4 $563
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 1072
INDIRI4
ADDRGP4 cam
ADDP4
INDIRF4
ARGF4
ADDRLP4 1072
INDIRI4
ADDRGP4 cam+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1072
INDIRI4
ADDRGP4 cam+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 1072
INDIRI4
ADDRGP4 cam+12
ADDP4
INDIRF4
ARGF4
ADDRLP4 1072
INDIRI4
ADDRGP4 cam+12+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1072
INDIRI4
ADDRGP4 cam+12+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 1072
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
ADDRGP4 $553
JUMPV
LABELV $560
line 895
;891:						 cam[i].origin[0], cam[i].origin[1], cam[i].origin[2],
;892:						 cam[i].angle[0], cam[i].angle[1], cam[i].angle[2],
;893:						 cam[i].time / 60000, mytmpstr );
;894:		else
;895:			CG_Printf( "%d: TP 0 %f %f %f %f %f %d:%s\n", i,
ADDRGP4 $572
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1080
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 1080
INDIRI4
ADDRGP4 cam+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1080
INDIRI4
ADDRGP4 cam+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 1080
INDIRI4
ADDRGP4 cam+12
ADDP4
INDIRF4
ARGF4
ADDRLP4 1080
INDIRI4
ADDRGP4 cam+12+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1080
INDIRI4
ADDRGP4 cam+12+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 1080
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 899
;896:						 cam[i].origin[1], cam[i].origin[2], cam[i].angle[0],
;897:						 cam[i].angle[1], cam[i].angle[2], cam[i].time / 60000,
;898:						 mytmpstr );
;899:		return;
ADDRGP4 $553
JUMPV
LABELV $554
line 903
;900:	}
;901:	
;902:	
;903:	for( i=0; i<curCam; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $584
JUMPV
LABELV $581
line 904
;904:	{
line 906
;905:		char mytmpstr[MAX_STRING_CHARS];
;906:		Q_strncpyz( mytmpstr, va( "%.3f", (float)cam[i].time / 1000 - cam[i].time / 60000 * 60 ), sizeof( mytmpstr ) );
ADDRGP4 $524
ARGP4
ADDRLP4 1032
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 1032
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
CNSTI4 60
ADDRLP4 1032
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CNSTI4 60000
DIVI4
MULI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 907
;907:		if( strlen( mytmpstr ) < 6 ) Com_sprintf( mytmpstr, sizeof( mytmpstr ), "0%s", mytmpstr );
ADDRLP4 8
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 6
GEI4 $587
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $529
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $587
line 908
;908:		if( !cam[i].thirdPerson )
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 cam+28
ADDP4
INDIRI4
CNSTI4 0
NEI4 $589
line 909
;909:			CG_Printf( "%d: %f %f %f %f %f %f %d:%s\n", i,
ADDRGP4 $563
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1048
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 1048
INDIRI4
ADDRGP4 cam
ADDP4
INDIRF4
ARGF4
ADDRLP4 1048
INDIRI4
ADDRGP4 cam+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1048
INDIRI4
ADDRGP4 cam+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 1048
INDIRI4
ADDRGP4 cam+12
ADDP4
INDIRF4
ARGF4
ADDRLP4 1048
INDIRI4
ADDRGP4 cam+12+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1048
INDIRI4
ADDRGP4 cam+12+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 1048
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
ADDRGP4 $590
JUMPV
LABELV $589
line 914
;910:						 cam[i].origin[0], cam[i].origin[1], cam[i].origin[2],
;911:						 cam[i].angle[0], cam[i].angle[1], cam[i].angle[2],
;912:						 cam[i].time / 60000, mytmpstr );
;913:		else
;914:			CG_Printf( "%d: TP 0 %f %f %f %f %f %d:%s\n", i,
ADDRGP4 $572
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ASGNI4
ADDRLP4 1056
INDIRI4
ADDRGP4 cam+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1056
INDIRI4
ADDRGP4 cam+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 1056
INDIRI4
ADDRGP4 cam+12
ADDP4
INDIRF4
ARGF4
ADDRLP4 1056
INDIRI4
ADDRGP4 cam+12+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1056
INDIRI4
ADDRGP4 cam+12+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 1056
INDIRI4
ADDRGP4 cam+24
ADDP4
INDIRI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $590
line 918
;915:						 cam[i].origin[1], cam[i].origin[2], cam[i].angle[0],
;916:						 cam[i].angle[1], cam[i].angle[2], cam[i].time / 60000,
;917:						 mytmpstr );
;918:	}
LABELV $582
line 903
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $584
ADDRLP4 0
INDIRI4
ADDRGP4 curCam
INDIRI4
LTI4 $581
line 919
;919:}
LABELV $553
endproc CG_showcam_f 1084 40
export CG_DumpLoc_f
proc CG_DumpLoc_f 2156 40
line 922
;920:
;921:void CG_DumpLoc_f( void )
;922:{
line 931
;923:	char locfilename[MAX_QPATH];
;924:	char locationfile[MAX_STRING_CHARS];
;925:	char location[MAX_STRING_CHARS];
;926:	char time[20];
;927:	char *extptr;//, *buffptr;
;928:	fileHandle_t f;
;929:
;930:	// Check for argument
;931:	if (trap_Argc() < 3)
ADDRLP4 2140
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2140
INDIRI4
CNSTI4 3
GEI4 $609
line 932
;932:	{
line 933
;933:		CG_Printf("Syntax: dumploc <start:time[.msec]> <filename> (<TP>)\n");
ADDRGP4 $611
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 934
;934:		return;
ADDRGP4 $608
JUMPV
LABELV $609
line 938
;935:	}
;936:
;937:	// parse the message
;938:	trap_Argv( 2, location, sizeof(location) );
CNSTI4 2
ARGI4
ADDRLP4 1088
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 939
;939:	trap_Argv( 1, time, 20 );
CNSTI4 1
ARGI4
ADDRLP4 2116
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 942
;940:
;941:	// Open locationfile
;942:	Q_strncpyz( locfilename, location, sizeof(locfilename) );
ADDRLP4 0
ARGP4
ADDRLP4 1088
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 943
;943:	Q_strncpyz( locationfile, location, sizeof(locationfile) );
ADDRLP4 64
ARGP4
ADDRLP4 1088
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 944
;944:	extptr = locfilename + strlen( locfilename ) - 4;
ADDRLP4 0
ARGP4
ADDRLP4 2144
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2136
ADDRLP4 2144
INDIRI4
ADDRLP4 0-4
ADDP4
ASGNP4
line 945
;945:	trap_FS_FOpenFile( locfilename, &f, FS_APPEND_SYNC );
ADDRLP4 0
ARGP4
ADDRLP4 2112
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 946
;946:	if( !f )
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $613
line 947
;947:	{
line 948
;948:		CG_Printf( "Failed to open '%s' for writing.\n", locfilename );
ADDRGP4 $518
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 949
;949:		return;
ADDRGP4 $608
JUMPV
LABELV $613
line 953
;950:	}
;951:
;952:	// Build the entity definition
;953:	if( trap_Argc() == 3)
ADDRLP4 2148
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2148
INDIRI4
CNSTI4 3
NEI4 $615
line 954
;954:		Com_sprintf( locationfile, sizeof(locationfile), "smoothcam %f %f %f %f %f %f %s\n",
ADDRLP4 64
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $617
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ARGF4
ADDRLP4 2116
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $616
JUMPV
LABELV $615
line 959
;955:					 cg.snap->ps.origin[0], cg.snap->ps.origin[1], cg.snap->ps.origin[2],
;956:					 cg.snap->ps.viewangles[0], cg.snap->ps.viewangles[1], cg.snap->ps.viewangles[2],
;957:					 time );
;958:	else
;959:		Com_sprintf( locationfile, sizeof(locationfile), "smoothcam TP 0 %f %f %f %f %f %s\n",
ADDRLP4 64
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $624
ARGP4
ADDRGP4 cg_thirdPersonHorzOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonVertOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonPitchOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
ARGF4
ADDRLP4 2116
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $616
line 964
;960:					 cg_thirdPersonHorzOffset.value, cg_thirdPersonVertOffset.value, cg_thirdPersonPitchOffset.value,
;961:					 cg_thirdPersonAngle.value, cg_thirdPersonRange.value, time );
;962:
;963:	// And write out/acknowledge
;964:	trap_FS_Write( locationfile, strlen( locationfile ), f );
ADDRLP4 64
ARGP4
ADDRLP4 2152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 64
ARGP4
ADDRLP4 2152
INDIRI4
ARGI4
ADDRLP4 2112
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 965
;965:	trap_FS_FCloseFile( f );
ADDRLP4 2112
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 966
;966:	CG_Printf( "Cam Data Dumped to %s.\n", locfilename );
ADDRGP4 $630
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 967
;967:}
LABELV $608
endproc CG_DumpLoc_f 2156 40
proc CG_AddLoc_f 1052 40
line 970
;968:
;969:static void CG_AddLoc_f( void )
;970:{
line 975
;971:	char cmd[MAX_STRING_CHARS];
;972:	char time[20];
;973:
;974:	// Check for argument
;975:	if (trap_Argc() < 2)
ADDRLP4 1044
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 2
GEI4 $632
line 976
;976:	{
line 977
;977:		CG_Printf("Syntax: addloc <start:time[.msec]> (<TP>)\n");
ADDRGP4 $634
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 978
;978:		return;
ADDRGP4 $631
JUMPV
LABELV $632
line 982
;979:	}
;980:
;981:	// parse the message
;982:	trap_Argv( 1, time, 20 );
CNSTI4 1
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 985
;983:
;984:	// Build the entity definition
;985:	if( trap_Argc() == 2)
ADDRLP4 1048
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 2
NEI4 $635
line 986
;986:		Com_sprintf( cmd, sizeof(cmd), "smoothcam %f %f %f %f %f %f %s\n",
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $617
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ARGF4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $636
JUMPV
LABELV $635
line 991
;987:					 cg.snap->ps.origin[0], cg.snap->ps.origin[1], cg.snap->ps.origin[2],
;988:					 cg.snap->ps.viewangles[0], cg.snap->ps.viewangles[1], cg.snap->ps.viewangles[2],
;989:					 time );
;990:	else
;991:		Com_sprintf( cmd, sizeof(cmd), "smoothcam TP 0 %f %f %f %f %f %s\n",
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $624
ARGP4
ADDRGP4 cg_thirdPersonHorzOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonVertOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonPitchOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
ARGF4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $636
line 994
;992:					 cg_thirdPersonHorzOffset.value, cg_thirdPersonVertOffset.value, cg_thirdPersonPitchOffset.value,
;993:					 cg_thirdPersonAngle.value, cg_thirdPersonRange.value, time );
;994:	trap_SendConsoleCommand( cmd );
ADDRLP4 0
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 995
;995:}
LABELV $631
endproc CG_AddLoc_f 1052 40
proc CG_InsLoc_f 1080 44
line 998
;996:
;997:static void CG_InsLoc_f( void )
;998:{
line 1004
;999:	char cmd[MAX_STRING_CHARS];
;1000:	char time[20];
;1001:	char camNum[20];
;1002:
;1003:	// Check for argument
;1004:	if (trap_Argc() < 3)
ADDRLP4 1064
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 3
GEI4 $649
line 1005
;1005:	{
line 1006
;1006:		CG_Printf("Syntax: insloc <cam num> <start:time[.msec]> (<TP>)\n");
ADDRGP4 $651
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1007
;1007:		return;
ADDRGP4 $648
JUMPV
LABELV $649
line 1011
;1008:	}
;1009:
;1010:	// parse the message
;1011:	trap_Argv( 1, camNum, 20 );
CNSTI4 1
ARGI4
ADDRLP4 1044
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1012
;1012:	trap_Argv( 2, time, 20 );
CNSTI4 2
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1015
;1013:
;1014:	// Build the entity definition
;1015:	if( trap_Argc() == 3)
ADDRLP4 1068
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 3
NEI4 $652
line 1016
;1016:		Com_sprintf( cmd, sizeof(cmd), "insertcam %d %f %f %f %f %f %f %s\n", atoi( camNum ),
ADDRLP4 1044
ARGP4
ADDRLP4 1072
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $654
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ARGF4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $653
JUMPV
LABELV $652
line 1021
;1017:					 cg.snap->ps.origin[0], cg.snap->ps.origin[1], cg.snap->ps.origin[2],
;1018:					 cg.snap->ps.viewangles[0], cg.snap->ps.viewangles[1], cg.snap->ps.viewangles[2],
;1019:					 time );
;1020:	else
;1021:		Com_sprintf( cmd, sizeof(cmd), "insertcam %d TP 0 %f %f %f %f %f %s\n", atoi( camNum ),
ADDRLP4 1044
ARGP4
ADDRLP4 1076
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $661
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 cg_thirdPersonHorzOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonVertOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonPitchOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
ARGF4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $653
line 1024
;1022:					 cg_thirdPersonHorzOffset.value, cg_thirdPersonVertOffset.value, cg_thirdPersonPitchOffset.value,
;1023:					 cg_thirdPersonAngle.value, cg_thirdPersonRange.value, time );
;1024:	trap_SendConsoleCommand( cmd );
ADDRLP4 0
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1025
;1025:}
LABELV $648
endproc CG_InsLoc_f 1080 44
proc CG_ReplLoc_f 1088 48
line 1028
;1026:
;1027:static void CG_ReplLoc_f( void )
;1028:{
line 1034
;1029:	char cmd[MAX_STRING_CHARS];
;1030:	char time[20];
;1031:	char camNum[20];
;1032:
;1033:	// Check for argument
;1034:	if (trap_Argc() < 3)
ADDRLP4 1064
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 3
GEI4 $668
line 1035
;1035:	{
line 1036
;1036:		CG_Printf("Syntax: replloc <cam num> <start:time[.msec]> (<TP>)\n");
ADDRGP4 $670
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1037
;1037:		return;
ADDRGP4 $667
JUMPV
LABELV $668
line 1041
;1038:	}
;1039:
;1040:	// parse the message
;1041:	trap_Argv( 1, camNum, 20 );
CNSTI4 1
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1042
;1042:	trap_Argv( 2, time, 20 );
CNSTI4 2
ARGI4
ADDRLP4 1044
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1045
;1043:
;1044:	// Build the entity definition
;1045:	if( trap_Argc() == 3)
ADDRLP4 1068
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 3
NEI4 $671
line 1046
;1046:		Com_sprintf( cmd, sizeof(cmd), "removecam %d;insertcam %d %f %f %f %f %f %f %s\n", atoi( camNum ), atoi( camNum ),
ADDRLP4 1024
ARGP4
ADDRLP4 1072
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ARGP4
ADDRLP4 1076
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $673
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 200
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 204
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 208
ADDP4
INDIRF4
ARGF4
ADDRLP4 1044
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $672
JUMPV
LABELV $671
line 1051
;1047:					 cg.snap->ps.origin[0], cg.snap->ps.origin[1], cg.snap->ps.origin[2],
;1048:					 cg.snap->ps.viewangles[0], cg.snap->ps.viewangles[1], cg.snap->ps.viewangles[2],
;1049:					 time );
;1050:	else
;1051:		Com_sprintf( cmd, sizeof(cmd), "removecam %d;insertcam %d TP 0 %f %f %f %f %f %s\n", atoi( camNum ), atoi( camNum ),
ADDRLP4 1024
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $680
ARGP4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRLP4 1084
INDIRI4
ARGI4
ADDRGP4 cg_thirdPersonHorzOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonVertOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonPitchOffset+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
ARGF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
ARGF4
ADDRLP4 1044
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $672
line 1054
;1052:					 cg_thirdPersonHorzOffset.value, cg_thirdPersonVertOffset.value, cg_thirdPersonPitchOffset.value,
;1053:					 cg_thirdPersonAngle.value, cg_thirdPersonRange.value, time );
;1054:	trap_SendConsoleCommand( cmd );
ADDRLP4 0
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1055
;1055:}
LABELV $667
endproc CG_ReplLoc_f 1088 48
proc CG_demospec_f 1032 12
line 1058
;1056:
;1057:static void CG_demospec_f()
;1058:{
line 1059
;1059:	if(trap_Argc() == 1)
ADDRLP4 0
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $687
line 1060
;1060:		CG_Printf("\"pug_demospec\" is:\"%d\" default:\"-1\"\n",pug_demospec.integer);
ADDRGP4 $689
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
ADDRGP4 $688
JUMPV
LABELV $687
line 1062
;1061:	else
;1062:	{
line 1064
;1063:		char newv[MAX_STRING_CHARS];
;1064:		trap_Argv( 1, newv, sizeof( newv ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1065
;1065:		pug_demospec.integer = atoi( newv );
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 pug_demospec+12
ADDRLP4 1028
INDIRI4
ASGNI4
line 1066
;1066:	}
LABELV $688
line 1067
;1067:}
LABELV $686
endproc CG_demospec_f 1032 12
proc CG_Rename_f 1040 12
line 1070
;1068:
;1069:static void CG_Rename_f()
;1070:{
line 1073
;1071:	char newName[MAX_STRING_CHARS];
;1072:	int clNum;
;1073:	if( trap_Argc() < 3 ) return;
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 3
GEI4 $693
ADDRGP4 $692
JUMPV
LABELV $693
line 1074
;1074:	trap_Argv( 1, newName, sizeof( newName ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1075
;1075:	clNum = atoi( newName );
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1032
INDIRI4
ASGNI4
line 1076
;1076:	trap_Argv( 2, newName, sizeof( newName ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1077
;1077:	Q_strncpyz( cgs.clientinfo[clNum].name, newName, sizeof( cgs.clientinfo[clNum].name ) );
CNSTI4 788
ADDRLP4 1024
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1078
;1078:	cgs.clientinfo[clNum].name[ strlen( cgs.clientinfo[clNum].name ) + 1 ] = -1;
CNSTI4 788
ADDRLP4 1024
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 788
ADDRLP4 1024
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ADDP4
CNSTI1 -1
ASGNI1
line 1079
;1079:}
LABELV $692
endproc CG_Rename_f 1040 12
data
export ghostFile
align 4
LABELV ghostFile
byte 4 -1
export ghostMode
align 4
LABELV ghostMode
byte 4 0
code
proc CG_GhostSave_f 2056 12
line 1117
;1080:
;1081:/*void _mkdir(char *);
;1082:#ifndef PATH_SEP
;1083:#define PATH_SEP '\\'
;1084:#endif*/
;1085:/*
;1086:============
;1087:FS_CreatePath
;1088:
;1089:Creates any directories needed to store the given filename
;1090:============
;1091:*/
;1092:/*static qboolean FS_CreatePath (char *OSPath) {
;1093:	char	*ofs;
;1094:	
;1095:	// make absolutely sure that it can't back up the path
;1096:	// FIXME: is c: allowed???
;1097:	if ( strstr( OSPath, ".." ) || strstr( OSPath, "::" ) ) {
;1098:		Com_Printf( "WARNING: refusing to create relative path \"%s\"\n", OSPath );
;1099:		return qtrue;
;1100:	}
;1101:
;1102:	for (ofs = OSPath+1 ; *ofs ; ofs++) {
;1103:		if (*ofs == PATH_SEP) {
;1104:			// create the directory
;1105:			*ofs = 0;
;1106:			_mkdir (OSPath);
;1107:			*ofs = PATH_SEP;
;1108:		}
;1109:	}
;1110:	return qfalse;
;1111:}*/
;1112:
;1113:fileHandle_t ghostFile = -1;
;1114:qboolean ghostMode = qfalse;
;1115:
;1116:static void CG_GhostSave_f()
;1117:{
line 1120
;1118:	char file[MAX_STRING_CHARS];
;1119:	char prot[MAX_STRING_CHARS];
;1120:	if(trap_Argc() < 2) {
ADDRLP4 2048
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 2
GEI4 $704
line 1121
;1121:		CG_Printf("Filename required\n");
ADDRGP4 $706
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1122
;1122:		return;
ADDRGP4 $703
JUMPV
LABELV $704
line 1124
;1123:	}
;1124:	if(ghostFile!=-1) {
ADDRGP4 ghostFile
INDIRI4
CNSTI4 -1
EQI4 $707
line 1125
;1125:		CG_Printf("Error: Ghost already in use\n");
ADDRGP4 $709
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1126
;1126:		return;
ADDRGP4 $703
JUMPV
LABELV $707
line 1128
;1127:	}
;1128:	trap_Argv( 1, file, sizeof(file) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1129
;1129:	trap_Cvar_VariableStringBuffer( "protocol", prot, sizeof( prot ) );
ADDRGP4 $710
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1131
;1130:	//FS_CreatePath( "ghosts" );
;1131:	trap_FS_FOpenFile( va( "ghosts/%s.BOO_%s", file, prot ), &ghostFile, FS_WRITE );
ADDRGP4 $711
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 2052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRGP4 ghostFile
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 1132
;1132:	ghostMode = qfalse;
ADDRGP4 ghostMode
CNSTI4 0
ASGNI4
line 1133
;1133:}
LABELV $703
endproc CG_GhostSave_f 2056 12
proc CG_GhostLoad_f 2056 12
line 1136
;1134:
;1135:static void CG_GhostLoad_f()
;1136:{
line 1139
;1137:	char file[MAX_STRING_CHARS];
;1138:	char prot[MAX_STRING_CHARS];
;1139:	if(trap_Argc() < 2) {
ADDRLP4 2048
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 2
GEI4 $713
line 1140
;1140:		CG_Printf("Filename required\n");
ADDRGP4 $706
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1141
;1141:		return;
ADDRGP4 $712
JUMPV
LABELV $713
line 1143
;1142:	}
;1143:	if(ghostFile!=-1) {
ADDRGP4 ghostFile
INDIRI4
CNSTI4 -1
EQI4 $715
line 1144
;1144:		CG_Printf("Error: Ghost already in use\n");
ADDRGP4 $709
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1145
;1145:		return;
ADDRGP4 $712
JUMPV
LABELV $715
line 1147
;1146:	}
;1147:	trap_Argv( 1, file, sizeof(file) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1148
;1148:	trap_Cvar_VariableStringBuffer( "protocol", prot, sizeof( prot ) );
ADDRGP4 $710
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1149
;1149:	trap_FS_FOpenFile( va( "ghosts/%s.BOO_%s", file, prot ), &ghostFile, FS_READ );
ADDRGP4 $711
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 2052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRGP4 ghostFile
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 1150
;1150:	if( ghostFile == 0 ) {
ADDRGP4 ghostFile
INDIRI4
CNSTI4 0
NEI4 $717
line 1151
;1151:		ghostFile = -1;
ADDRGP4 ghostFile
CNSTI4 -1
ASGNI4
line 1152
;1152:		CG_Printf("Error: File not found\n" );
ADDRGP4 $719
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1153
;1153:		return;
ADDRGP4 $712
JUMPV
LABELV $717
line 1155
;1154:	}
;1155:	ghostMode = qtrue;
ADDRGP4 ghostMode
CNSTI4 1
ASGNI4
line 1156
;1156:}
LABELV $712
endproc CG_GhostLoad_f 2056 12
proc CG_GhostClose_f 0 4
line 1159
;1157:
;1158:static void  CG_GhostClose_f()
;1159:{
line 1160
;1160:	if(ghostFile==-1) {
ADDRGP4 ghostFile
INDIRI4
CNSTI4 -1
NEI4 $721
line 1161
;1161:		CG_Printf("Error: Ghost already closed\n");
ADDRGP4 $723
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1162
;1162:		return;
ADDRGP4 $720
JUMPV
LABELV $721
line 1164
;1163:	}
;1164:	trap_FS_FCloseFile( ghostFile );
ADDRGP4 ghostFile
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1165
;1165:	ghostFile = -1;
ADDRGP4 ghostFile
CNSTI4 -1
ASGNI4
line 1166
;1166:}
LABELV $720
endproc CG_GhostClose_f 0 4
proc Q_isdigit 8 0
line 1169
;1167:
;1168:static int Q_isdigit( char *c )
;1169:{
line 1171
;1170:	int i;
;1171:	for( i=0; c[i]!=0; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $728
JUMPV
LABELV $725
line 1172
;1172:		if (!((c[i] >= '0' && c[i] <= '9') || c[i] == '.'))
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 48
LTI4 $731
ADDRLP4 4
INDIRI4
CNSTI4 57
LEI4 $729
LABELV $731
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
EQI4 $729
line 1173
;1173:			return ( 0 );
CNSTI4 0
RETI4
ADDRGP4 $724
JUMPV
LABELV $729
LABELV $726
line 1171
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $728
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $725
line 1174
;1174:	return ( 1 );
CNSTI4 1
RETI4
LABELV $724
endproc Q_isdigit 8 0
proc CG_VarMath_f 3376 16
line 1212
;1175:}
;1176:
;1177:extern int trap_RealTime(qtime_t *qtime);
;1178:
;1179:/***********************************
;1180:
;1181:$viewposX - player view's X world position (same value as posX)
;1182:$viewposY - player view's Y world position (same value as posY)
;1183:$viewposZ - player view's Z world position (posZ + viewheight)
;1184:$viewposXYZ - player view's X Y Z world position
;1185:
;1186:$posX - player's X world position
;1187:$posY - player's Y world position
;1188:$posZ - player's Z world position
;1189:$posXYZ - player's X Y Z world position
;1190:
;1191:$angX - player's X viewangle
;1192:$angY - player's Y viewangle
;1193:$angZ - player's Z viewangle
;1194:$angXYZ - player's X Y Z viewangle
;1195:
;1196:$velX - player's X velocity
;1197:$velY - player's Y velocity
;1198:$velZ - player's Z velocity
;1199:$velXYZ - player's X Y Z velocity
;1200:
;1201:$speedXY - player's horizontal speed
;1202:$speedZ  - player's vertical speed
;1203:
;1204:$mapname    - current map name
;1205:$date       - current date in YYYYMMDD format
;1206:$time       - current time in HHMMSSS format
;1207:$playername - player's name (colors removed)
;1208:$cgtime     - clientside timer
;1209:
;1210:************************************/
;1211:static void CG_VarMath_f()
;1212:{
line 1216
;1213:	int i;
;1214:	char varName[MAX_STRING_CHARS];
;1215:	char tmpBuf[MAX_STRING_CHARS],op;
;1216:	double curVal = 0;
ADDRLP4 1032
CNSTF4 0
ASGNF4
line 1218
;1217:	char curValS[MAX_STRING_CHARS];
;1218:	qboolean isString = qfalse;
ADDRLP4 3084
CNSTI4 0
ASGNI4
line 1221
;1219:	vec3_t velocity;
;1220:	
;1221:	if(trap_Argc() < 2) {
ADDRLP4 3100
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 3100
INDIRI4
CNSTI4 2
GEI4 $733
line 1222
;1222:		CG_Printf("\n^1varMath: ^2Performs math functions on cvars and vstrs.\n");
ADDRGP4 $735
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1223
;1223:		CG_Printf("^7Usage:   varMath targetVariableName operator: +-*/%= value (+-*/%= value)\n");
ADDRGP4 $736
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1224
;1224:		CG_Printf("^2Example: ^7varMath timescale * .2\n");
ADDRGP4 $737
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1225
;1225:		CG_Printf("^2Example: ^7varMath user_num = 1 + 3 * 5\n");
ADDRGP4 $738
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1226
;1226:		CG_Printf("^2Example: ^7varMath user_demoname = $mapname + _ + $date + _ + 001\n\n");
ADDRGP4 $739
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1227
;1227:		CG_Printf("^3Note:    for immediate variable update, prefix the targetVariableName with \"user_\"\n");
ADDRGP4 $740
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1228
;1228:		return;
ADDRGP4 $732
JUMPV
LABELV $733
line 1231
;1229:	}
;1230:
;1231:	if(trap_Argc() < 3) {
ADDRLP4 3104
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 3104
INDIRI4
CNSTI4 3
GEI4 $741
line 1232
;1232:		CG_Printf( "^7*** Error - missing operator\n" );
ADDRGP4 $743
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1233
;1233:		return;
ADDRGP4 $732
JUMPV
LABELV $741
line 1236
;1234:	}
;1235:
;1236:	if(trap_Argc() < 4) {
ADDRLP4 3108
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 3108
INDIRI4
CNSTI4 4
GEI4 $744
line 1237
;1237:		CG_Printf( "^7*** Error - missing value\n" );
ADDRGP4 $746
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1238
;1238:		return;
ADDRGP4 $732
JUMPV
LABELV $744
line 1240
;1239:	}
;1240:	VectorCopy( (pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].currentState.pos.trDelta:cg_entities[cg.snap->ps.clientNum].currentState.pos.trDelta), velocity );
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $755
ADDRLP4 3112
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+12+24
ADDP4
ASGNP4
ADDRGP4 $756
JUMPV
LABELV $755
ADDRLP4 3112
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+12+24
ADDP4
ASGNP4
LABELV $756
ADDRLP4 3088
ADDRLP4 3112
INDIRP4
INDIRB
ASGNB 12
line 1241
;1241:	trap_Argv( 1, varName, sizeof( varName ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1242
;1242:	trap_Cvar_VariableStringBuffer( varName, curValS, sizeof( curValS ) );
ADDRLP4 1036
ARGP4
ADDRLP4 2060
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1243
;1243:	curVal = atof( curValS );
ADDRLP4 2060
ARGP4
ADDRLP4 3116
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1032
ADDRLP4 3116
INDIRF4
ASGNF4
line 1244
;1244:	for( i=2; i<trap_Argc(); i+=2 )
ADDRLP4 1024
CNSTI4 2
ASGNI4
ADDRGP4 $760
JUMPV
LABELV $757
line 1245
;1245:	{
line 1246
;1246:		trap_Argv( i, tmpBuf, sizeof( tmpBuf ) );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1247
;1247:		op = tmpBuf[0];
ADDRLP4 1028
ADDRLP4 0
INDIRI1
ASGNI1
line 1248
;1248:		trap_Argv( i+1, tmpBuf, sizeof( tmpBuf ) );
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1249
;1249:		if( tmpBuf[0] == '$' )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 36
NEI4 $761
line 1250
;1250:		{
line 1251
;1251:			if( !strcmp( tmpBuf+1, "viewposX" ) || !strcmp( tmpBuf+1, "posX" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $766
ARGP4
ADDRLP4 3120
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3120
INDIRI4
CNSTI4 0
EQI4 $769
ADDRLP4 0+1
ARGP4
ADDRGP4 $768
ARGP4
ADDRLP4 3124
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3124
INDIRI4
CNSTI4 0
NEI4 $763
LABELV $769
line 1252
;1252:				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[0]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[0] ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $777
ADDRLP4 3128
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $778
JUMPV
LABELV $777
ADDRLP4 3128
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
INDIRF4
ASGNF4
LABELV $778
ADDRLP4 3128
INDIRF4
ARGF4
ADDRLP4 3132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3132
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $764
JUMPV
LABELV $763
line 1253
;1253:			else if( !strcmp( tmpBuf+1, "viewposY" ) || !strcmp( tmpBuf+1, "posY" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $782
ARGP4
ADDRLP4 3136
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3136
INDIRI4
CNSTI4 0
EQI4 $785
ADDRLP4 0+1
ARGP4
ADDRGP4 $784
ARGP4
ADDRLP4 3140
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3140
INDIRI4
CNSTI4 0
NEI4 $779
LABELV $785
line 1254
;1254:				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[1]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[1] ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $794
ADDRLP4 3144
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928+4
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $795
JUMPV
LABELV $794
ADDRLP4 3144
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928+4
ADDP4
INDIRF4
ASGNF4
LABELV $795
ADDRLP4 3144
INDIRF4
ARGF4
ADDRLP4 3148
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3148
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $780
JUMPV
LABELV $779
line 1255
;1255:			else if( !strcmp( tmpBuf+1, "viewposZ" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $799
ARGP4
ADDRLP4 3152
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3152
INDIRI4
CNSTI4 0
NEI4 $796
line 1256
;1256:				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[2]+DEFAULT_VIEWHEIGHT:cg_entities[cg.snap->ps.clientNum].lerpOrigin[2]+cg.snap->ps.viewheight ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $809
ADDRLP4 3156
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928+8
ADDP4
INDIRF4
CNSTF4 1108344832
ADDF4
ASGNF4
ADDRGP4 $810
JUMPV
LABELV $809
ADDRLP4 3156
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928+8
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
LABELV $810
ADDRLP4 3156
INDIRF4
ARGF4
ADDRLP4 3160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3160
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $797
JUMPV
LABELV $796
line 1257
;1257:			else if( !strcmp( tmpBuf+1, "viewposXYZ" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $814
ARGP4
ADDRLP4 3164
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3164
INDIRI4
CNSTI4 0
NEI4 $811
line 1258
;1258:				Q_strncpyz( tmpBuf, va( "%f %f %f",
ADDRGP4 $815
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $839
ADDRLP4 3168
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $840
JUMPV
LABELV $839
ADDRLP4 3168
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
INDIRF4
ASGNF4
LABELV $840
ADDRLP4 3168
INDIRF4
ARGF4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $841
ADDRLP4 3172
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928+4
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $842
JUMPV
LABELV $841
ADDRLP4 3172
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928+4
ADDP4
INDIRF4
ASGNF4
LABELV $842
ADDRLP4 3172
INDIRF4
ARGF4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $843
ADDRLP4 3176
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928+8
ADDP4
INDIRF4
CNSTF4 1108344832
ADDF4
ASGNF4
ADDRGP4 $844
JUMPV
LABELV $843
ADDRLP4 3176
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928+8
ADDP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
LABELV $844
ADDRLP4 3176
INDIRF4
ARGF4
ADDRLP4 3180
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3180
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $812
JUMPV
LABELV $811
line 1262
;1259:					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[0]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[0],
;1260:					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[1]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[1],
;1261:					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[2]+DEFAULT_VIEWHEIGHT:cg_entities[cg.snap->ps.clientNum].lerpOrigin[2]+cg.snap->ps.viewheight ), sizeof( tmpBuf ) );
;1262:			else if( !strcmp( tmpBuf+1, "posZ" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $848
ARGP4
ADDRLP4 3184
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3184
INDIRI4
CNSTI4 0
NEI4 $845
line 1263
;1263:				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[2]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[2] ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $857
ADDRLP4 3188
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928+8
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $858
JUMPV
LABELV $857
ADDRLP4 3188
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928+8
ADDP4
INDIRF4
ASGNF4
LABELV $858
ADDRLP4 3188
INDIRF4
ARGF4
ADDRLP4 3192
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3192
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $846
JUMPV
LABELV $845
line 1264
;1264:			else if( !strcmp( tmpBuf+1, "posXYZ" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $862
ARGP4
ADDRLP4 3196
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3196
INDIRI4
CNSTI4 0
NEI4 $859
line 1265
;1265:				Q_strncpyz( tmpBuf, va( "%f %f %f",
ADDRGP4 $815
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $885
ADDRLP4 3200
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $886
JUMPV
LABELV $885
ADDRLP4 3200
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928
ADDP4
INDIRF4
ASGNF4
LABELV $886
ADDRLP4 3200
INDIRF4
ARGF4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $887
ADDRLP4 3204
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928+4
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $888
JUMPV
LABELV $887
ADDRLP4 3204
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928+4
ADDP4
INDIRF4
ASGNF4
LABELV $888
ADDRLP4 3204
INDIRF4
ARGF4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $889
ADDRLP4 3208
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+928+8
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $890
JUMPV
LABELV $889
ADDRLP4 3208
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+928+8
ADDP4
INDIRF4
ASGNF4
LABELV $890
ADDRLP4 3208
INDIRF4
ARGF4
ADDRLP4 3212
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3212
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $860
JUMPV
LABELV $859
line 1269
;1266:					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[0]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[0],
;1267:					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[1]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[1],
;1268:					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[2]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[2] ), sizeof( tmpBuf ) );
;1269:			else if( !strcmp( tmpBuf+1, "angX" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $894
ARGP4
ADDRLP4 3216
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3216
INDIRI4
CNSTI4 0
NEI4 $891
line 1270
;1270:				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[0]:cg_entities[cg.snap->ps.clientNum].lerpAngles[0] ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $901
ADDRLP4 3220
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+940
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $902
JUMPV
LABELV $901
ADDRLP4 3220
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+940
ADDP4
INDIRF4
ASGNF4
LABELV $902
ADDRLP4 3220
INDIRF4
ARGF4
ADDRLP4 3224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3224
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $892
JUMPV
LABELV $891
line 1271
;1271:			else if( !strcmp( tmpBuf+1, "angY" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $906
ARGP4
ADDRLP4 3228
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3228
INDIRI4
CNSTI4 0
NEI4 $903
line 1272
;1272:				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[1]:cg_entities[cg.snap->ps.clientNum].lerpAngles[1] ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $915
ADDRLP4 3232
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+940+4
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $916
JUMPV
LABELV $915
ADDRLP4 3232
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+940+4
ADDP4
INDIRF4
ASGNF4
LABELV $916
ADDRLP4 3232
INDIRF4
ARGF4
ADDRLP4 3236
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3236
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $904
JUMPV
LABELV $903
line 1273
;1273:			else if( !strcmp( tmpBuf+1, "angZ" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $920
ARGP4
ADDRLP4 3240
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3240
INDIRI4
CNSTI4 0
NEI4 $917
line 1274
;1274:				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[2]:cg_entities[cg.snap->ps.clientNum].lerpAngles[2] ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $929
ADDRLP4 3244
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+940+8
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $930
JUMPV
LABELV $929
ADDRLP4 3244
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+940+8
ADDP4
INDIRF4
ASGNF4
LABELV $930
ADDRLP4 3244
INDIRF4
ARGF4
ADDRLP4 3248
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3248
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $918
JUMPV
LABELV $917
line 1275
;1275:			else if( !strcmp( tmpBuf+1, "angXYZ" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $934
ARGP4
ADDRLP4 3252
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3252
INDIRI4
CNSTI4 0
NEI4 $931
line 1276
;1276:				Q_strncpyz( tmpBuf, va( "%f %f %f",
ADDRGP4 $815
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $957
ADDRLP4 3256
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+940
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $958
JUMPV
LABELV $957
ADDRLP4 3256
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+940
ADDP4
INDIRF4
ASGNF4
LABELV $958
ADDRLP4 3256
INDIRF4
ARGF4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $959
ADDRLP4 3260
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+940+4
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $960
JUMPV
LABELV $959
ADDRLP4 3260
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+940+4
ADDP4
INDIRF4
ASGNF4
LABELV $960
ADDRLP4 3260
INDIRF4
ARGF4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $961
ADDRLP4 3264
CNSTI4 1920
ADDRGP4 pug_demospec+12
INDIRI4
MULI4
ADDRGP4 cg_entities+940+8
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $962
JUMPV
LABELV $961
ADDRLP4 3264
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+940+8
ADDP4
INDIRF4
ASGNF4
LABELV $962
ADDRLP4 3264
INDIRF4
ARGF4
ADDRLP4 3268
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3268
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $932
JUMPV
LABELV $931
line 1280
;1277:					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[0]:cg_entities[cg.snap->ps.clientNum].lerpAngles[0],
;1278:					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[1]:cg_entities[cg.snap->ps.clientNum].lerpAngles[1],
;1279:					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[2]:cg_entities[cg.snap->ps.clientNum].lerpAngles[2] ), sizeof( tmpBuf ) );
;1280:			else if( !strcmp( tmpBuf+1, "velX" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $966
ARGP4
ADDRLP4 3272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $963
line 1281
;1281:				Q_strncpyz( tmpBuf, va( "%f", velocity[0] ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRLP4 3276
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3276
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $964
JUMPV
LABELV $963
line 1282
;1282:			else if( !strcmp( tmpBuf+1, "velY" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $970
ARGP4
ADDRLP4 3280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $967
line 1283
;1283:				Q_strncpyz( tmpBuf, va( "%f", velocity[1] ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRLP4 3088+4
INDIRF4
ARGF4
ADDRLP4 3284
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3284
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $968
JUMPV
LABELV $967
line 1284
;1284:			else if( !strcmp( tmpBuf+1, "velZ" ) || !strcmp( tmpBuf+1, "speedZ" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $975
ARGP4
ADDRLP4 3288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
EQI4 $978
ADDRLP4 0+1
ARGP4
ADDRGP4 $977
ARGP4
ADDRLP4 3292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $972
LABELV $978
line 1285
;1285:				Q_strncpyz( tmpBuf, va( "%f", velocity[2] ), sizeof( tmpBuf ) );
ADDRGP4 $770
ARGP4
ADDRLP4 3088+8
INDIRF4
ARGF4
ADDRLP4 3296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3296
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $973
JUMPV
LABELV $972
line 1286
;1286:			else if( !strcmp( tmpBuf+1, "velXYZ" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $983
ARGP4
ADDRLP4 3300
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3300
INDIRI4
CNSTI4 0
NEI4 $980
line 1287
;1287:				Q_strncpyz( tmpBuf, va( "%f %f %f",
ADDRGP4 $815
ARGP4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRLP4 3088+4
INDIRF4
ARGF4
ADDRLP4 3088+8
INDIRF4
ARGF4
ADDRLP4 3304
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3304
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $981
JUMPV
LABELV $980
line 1291
;1288:					velocity[0],
;1289:					velocity[1],
;1290:					velocity[2] ), sizeof( tmpBuf ) );
;1291:			else if( !strcmp( tmpBuf+1, "speedXY" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $989
ARGP4
ADDRLP4 3308
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3308
INDIRI4
CNSTI4 0
NEI4 $986
line 1292
;1292:				Q_strncpyz( tmpBuf, va( "%f", 
ADDRLP4 3312
ADDRLP4 3088
INDIRF4
ASGNF4
ADDRLP4 3312
INDIRF4
ADDRLP4 3312
INDIRF4
MULF4
ADDRLP4 3088+4
INDIRF4
ADDRLP4 3088+4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 3316
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 $770
ARGP4
ADDRLP4 3316
INDIRF4
ARGF4
ADDRLP4 3320
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3320
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $987
JUMPV
LABELV $986
line 1294
;1293:					sqrt(velocity[0] * velocity[0]+velocity[1] * velocity[1]) ), sizeof( tmpBuf ) );
;1294:			else if( !strcmp( tmpBuf+1, "mapname" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $995
ARGP4
ADDRLP4 3324
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3324
INDIRI4
CNSTI4 0
NEI4 $992
line 1295
;1295:			{
line 1296
;1296:				const char *pszServerInfo = CG_ConfigString(CS_SERVERINFO);
CNSTI4 0
ARGI4
ADDRLP4 3332
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 3328
ADDRLP4 3332
INDIRP4
ASGNP4
line 1297
;1297:				Q_strncpyz( tmpBuf, COM_SkipPath(Info_ValueForKey(pszServerInfo, "mapname")), sizeof( tmpBuf ) );
ADDRLP4 3328
INDIRP4
ARGP4
ADDRGP4 $995
ARGP4
ADDRLP4 3336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3336
INDIRP4
ARGP4
ADDRLP4 3340
ADDRGP4 COM_SkipPath
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3340
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1298
;1298:				isString = qtrue;
ADDRLP4 3084
CNSTI4 1
ASGNI4
line 1299
;1299:			}
ADDRGP4 $993
JUMPV
LABELV $992
line 1300
;1300:			else if( !strcmp( tmpBuf+1, "date" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $999
ARGP4
ADDRLP4 3328
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3328
INDIRI4
CNSTI4 0
NEI4 $996
line 1301
;1301:			{
line 1303
;1302:				qtime_t ct;
;1303:				trap_RealTime(&ct);
ADDRLP4 3332
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 1304
;1304:				Q_strncpyz( tmpBuf, va( "%04d%02d%02d", ct.tm_year + 1900, ct.tm_mon+1,ct.tm_mday ), sizeof( tmpBuf ) );
ADDRGP4 $1000
ARGP4
ADDRLP4 3332+20
INDIRI4
CNSTI4 1900
ADDI4
ARGI4
ADDRLP4 3332+16
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 3332+12
INDIRI4
ARGI4
ADDRLP4 3368
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3368
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1305
;1305:				isString = qtrue;
ADDRLP4 3084
CNSTI4 1
ASGNI4
line 1306
;1306:			}
ADDRGP4 $997
JUMPV
LABELV $996
line 1307
;1307:			else if( !strcmp( tmpBuf+1, "time" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $1007
ARGP4
ADDRLP4 3332
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3332
INDIRI4
CNSTI4 0
NEI4 $1004
line 1308
;1308:			{
line 1310
;1309:				qtime_t ct;
;1310:				trap_RealTime(&ct);
ADDRLP4 3336
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 1311
;1311:				Q_strncpyz( tmpBuf, va( "%02d%02d%02d", ct.tm_hour, ct.tm_min, ct.tm_sec ), sizeof( tmpBuf ) );
ADDRGP4 $1008
ARGP4
ADDRLP4 3336+8
INDIRI4
ARGI4
ADDRLP4 3336+4
INDIRI4
ARGI4
ADDRLP4 3336
INDIRI4
ARGI4
ADDRLP4 3372
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3372
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1312
;1312:				isString = qtrue;
ADDRLP4 3084
CNSTI4 1
ASGNI4
line 1313
;1313:			}
ADDRGP4 $1005
JUMPV
LABELV $1004
line 1314
;1314:			else if( !strcmp( tmpBuf+1, "playername" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $1014
ARGP4
ADDRLP4 3336
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3336
INDIRI4
CNSTI4 0
NEI4 $1011
line 1315
;1315:			{
line 1316
;1316:				Q_strncpyz( tmpBuf, cgs.clientinfo[ pug_demospec.integer!=-1?pug_demospec.integer:cg.snap->ps.clientNum ].name, sizeof( tmpBuf ) );
ADDRLP4 0
ARGP4
ADDRGP4 pug_demospec+12
INDIRI4
CNSTI4 -1
EQI4 $1021
ADDRLP4 3340
ADDRGP4 pug_demospec+12
INDIRI4
ASGNI4
ADDRGP4 $1022
JUMPV
LABELV $1021
ADDRLP4 3340
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
LABELV $1022
CNSTI4 788
ADDRLP4 3340
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1317
;1317:				isString = qtrue;
ADDRLP4 3084
CNSTI4 1
ASGNI4
line 1318
;1318:			}
ADDRGP4 $1012
JUMPV
LABELV $1011
line 1319
;1319:			else if( !strcmp( tmpBuf+1, "cgtime" ) )
ADDRLP4 0+1
ARGP4
ADDRGP4 $1026
ARGP4
ADDRLP4 3340
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3340
INDIRI4
CNSTI4 0
NEI4 $1023
line 1320
;1320:			{
line 1321
;1321:				Q_strncpyz( tmpBuf, va( "%d" , cg.time ), sizeof( tmpBuf ) );
ADDRGP4 $331
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRLP4 3344
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 3344
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1322
;1322:				isString = qtrue;
ADDRLP4 3084
CNSTI4 1
ASGNI4
line 1323
;1323:			}
ADDRGP4 $1024
JUMPV
LABELV $1023
line 1325
;1324:			else
;1325:				trap_Cvar_VariableStringBuffer( tmpBuf+1, tmpBuf, sizeof( tmpBuf ) );
ADDRLP4 0+1
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
LABELV $1024
LABELV $1012
LABELV $1005
LABELV $997
LABELV $993
LABELV $987
LABELV $981
LABELV $973
LABELV $968
LABELV $964
LABELV $932
LABELV $918
LABELV $904
LABELV $892
LABELV $860
LABELV $846
LABELV $812
LABELV $797
LABELV $780
LABELV $764
line 1326
;1326:			if( tmpBuf[0] == 0 )tmpBuf[0]='$';
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1029
ADDRLP4 0
CNSTI1 36
ASGNI1
LABELV $1029
line 1327
;1327:		}
LABELV $761
line 1328
;1328:		switch( op ) {
ADDRLP4 3120
ADDRLP4 1028
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 3120
INDIRI4
CNSTI4 42
LTI4 $1045
ADDRLP4 3120
INDIRI4
CNSTI4 47
GTI4 $1046
ADDRLP4 3120
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1047-168
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1047
address $1038
address $1034
address $1031
address $1037
address $1031
address $1039
code
LABELV $1045
ADDRLP4 3120
INDIRI4
CNSTI4 37
EQI4 $1043
ADDRGP4 $1031
JUMPV
LABELV $1046
ADDRLP4 3120
INDIRI4
CNSTI4 61
EQI4 $1040
ADDRGP4 $1031
JUMPV
LABELV $1034
line 1330
;1329:		case '+':
;1330:		{
line 1331
;1331:			if( Q_isdigit( tmpBuf ) && !isString )
ADDRLP4 0
ARGP4
ADDRLP4 3128
ADDRGP4 Q_isdigit
CALLI4
ASGNI4
ADDRLP4 3132
CNSTI4 0
ASGNI4
ADDRLP4 3128
INDIRI4
ADDRLP4 3132
INDIRI4
EQI4 $1035
ADDRLP4 3084
INDIRI4
ADDRLP4 3132
INDIRI4
NEI4 $1035
line 1332
;1332:				curVal += atof( tmpBuf );
ADDRLP4 0
ARGP4
ADDRLP4 3136
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1032
ADDRLP4 1032
INDIRF4
ADDRLP4 3136
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $1032
JUMPV
LABELV $1035
line 1333
;1333:			else {
line 1334
;1334:				Q_strcat( curValS, sizeof( curValS ), tmpBuf );
ADDRLP4 2060
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1335
;1335:				isString = qtrue;
ADDRLP4 3084
CNSTI4 1
ASGNI4
line 1336
;1336:			}
line 1337
;1337:			break;
ADDRGP4 $1032
JUMPV
LABELV $1037
line 1340
;1338:		}
;1339:		case '-':
;1340:		{
line 1341
;1341:			curVal -= atof( tmpBuf );
ADDRLP4 0
ARGP4
ADDRLP4 3128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1032
ADDRLP4 1032
INDIRF4
ADDRLP4 3128
INDIRF4
SUBF4
ASGNF4
line 1342
;1342:			break;
ADDRGP4 $1032
JUMPV
LABELV $1038
line 1345
;1343:		}
;1344:		case '*':
;1345:		{
line 1346
;1346:			curVal *= atof( tmpBuf );
ADDRLP4 0
ARGP4
ADDRLP4 3128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1032
ADDRLP4 1032
INDIRF4
ADDRLP4 3128
INDIRF4
MULF4
ASGNF4
line 1347
;1347:			break;
ADDRGP4 $1032
JUMPV
LABELV $1039
line 1350
;1348:		}
;1349:		case '/':
;1350:		{
line 1351
;1351:			curVal /= atof( tmpBuf );
ADDRLP4 0
ARGP4
ADDRLP4 3128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1032
ADDRLP4 1032
INDIRF4
ADDRLP4 3128
INDIRF4
DIVF4
ASGNF4
line 1352
;1352:			break;
ADDRGP4 $1032
JUMPV
LABELV $1040
line 1355
;1353:		}
;1354:		case '=':
;1355:		{
line 1356
;1356:			if( Q_isdigit( tmpBuf ) && !isString )
ADDRLP4 0
ARGP4
ADDRLP4 3128
ADDRGP4 Q_isdigit
CALLI4
ASGNI4
ADDRLP4 3132
CNSTI4 0
ASGNI4
ADDRLP4 3128
INDIRI4
ADDRLP4 3132
INDIRI4
EQI4 $1041
ADDRLP4 3084
INDIRI4
ADDRLP4 3132
INDIRI4
NEI4 $1041
line 1357
;1357:				curVal = atof( tmpBuf );
ADDRLP4 0
ARGP4
ADDRLP4 3136
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1032
ADDRLP4 3136
INDIRF4
ASGNF4
ADDRGP4 $1032
JUMPV
LABELV $1041
line 1358
;1358:			else {
line 1359
;1359:				Q_strncpyz( curValS, tmpBuf, sizeof( curValS ) );
ADDRLP4 2060
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1360
;1360:				isString = qtrue;
ADDRLP4 3084
CNSTI4 1
ASGNI4
line 1361
;1361:			}
line 1362
;1362:			break;
ADDRGP4 $1032
JUMPV
LABELV $1043
line 1365
;1363:		}
;1364:		case '%':
;1365:		{
line 1367
;1366:			int tmpcurVal;
;1367:			tmpcurVal = (int)curVal;
ADDRLP4 3128
ADDRLP4 1032
INDIRF4
CVFI4 4
ASGNI4
line 1368
;1368:			tmpcurVal %= atoi( tmpBuf );
ADDRLP4 0
ARGP4
ADDRLP4 3132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3128
ADDRLP4 3128
INDIRI4
ADDRLP4 3132
INDIRI4
MODI4
ASGNI4
line 1369
;1369:			curVal = (double)tmpcurVal;
ADDRLP4 1032
ADDRLP4 3128
INDIRI4
CVIF4 4
ASGNF4
line 1370
;1370:			break;
ADDRGP4 $1032
JUMPV
LABELV $1031
line 1373
;1371:		}
;1372:		default:
;1373:		{
line 1374
;1374:			CG_Printf("*** Parse error: invalid operator (%c)\n",op);
ADDRGP4 $1044
ARGP4
ADDRLP4 1028
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1375
;1375:			return;
ADDRGP4 $732
JUMPV
LABELV $1032
line 1378
;1376:		}
;1377:		}
;1378:	}
LABELV $758
line 1244
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
LABELV $760
ADDRLP4 3120
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
ADDRLP4 3120
INDIRI4
LTI4 $757
line 1379
;1379:	if( !Q_strncmp( varName, "user_", strlen( "user_" ) ) )
ADDRGP4 $1051
ARGP4
ADDRLP4 3124
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
ARGP4
ADDRGP4 $1051
ARGP4
ADDRLP4 3124
INDIRI4
ARGI4
ADDRLP4 3128
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 3128
INDIRI4
CNSTI4 0
NEI4 $1049
line 1380
;1380:		if( isString ) {
ADDRLP4 3084
INDIRI4
CNSTI4 0
EQI4 $1052
line 1381
;1381:			trap_Cvar_Set( varName, curValS );
ADDRLP4 1036
ARGP4
ADDRLP4 2060
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1382
;1382:			CG_Printf( "^7%s ^4-->^7 %s\n", varName, curValS );
ADDRGP4 $1054
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 2060
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1383
;1383:		} else if( curVal - (int)curVal ) {
ADDRGP4 $1050
JUMPV
LABELV $1052
ADDRLP4 1032
INDIRF4
ADDRLP4 1032
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
CNSTF4 0
EQF4 $1055
line 1384
;1384:			trap_Cvar_Set( varName, va( "%f", curVal ) );
ADDRGP4 $770
ARGP4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRLP4 3136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 3136
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1385
;1385:			CG_Printf( "^7%s ^4-->^7 %f\n", varName, curVal );
ADDRGP4 $1057
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 1386
;1386:		} else {
ADDRGP4 $1050
JUMPV
LABELV $1055
line 1387
;1387:			trap_Cvar_Set( varName, va( "%d", (int)curVal ) );
ADDRGP4 $331
ARGP4
ADDRLP4 1032
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 3136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 3136
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1388
;1388:			CG_Printf( "^7%s ^4-->^7 %d\n", varName, (int)curVal );
ADDRGP4 $1058
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1032
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1389
;1389:		}
ADDRGP4 $1050
JUMPV
LABELV $1049
line 1391
;1390:	else
;1391:		if( isString ) {
ADDRLP4 3084
INDIRI4
CNSTI4 0
EQI4 $1059
line 1392
;1392:			trap_SendConsoleCommand( va( "set %s %s", varName, curValS ) );
ADDRGP4 $1061
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 2060
ARGP4
ADDRLP4 3136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3136
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1393
;1393:			CG_Printf( "^7%s ^4-->^7 %s\n", varName, curValS );
ADDRGP4 $1054
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 2060
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1394
;1394:		} else if( curVal - (int)curVal ) {
ADDRGP4 $1060
JUMPV
LABELV $1059
ADDRLP4 1032
INDIRF4
ADDRLP4 1032
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
CNSTF4 0
EQF4 $1062
line 1395
;1395:			trap_SendConsoleCommand( va( "set %s %f", varName, curVal ) );
ADDRGP4 $1064
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRLP4 3140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3140
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1396
;1396:			CG_Printf( "^7%s ^4-->^7 %f\n", varName, curVal );
ADDRGP4 $1057
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 1397
;1397:		} else {
ADDRGP4 $1063
JUMPV
LABELV $1062
line 1398
;1398:			trap_SendConsoleCommand( va( "set %s %d", varName, (int)curVal ) );
ADDRGP4 $1065
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1032
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 3140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3140
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1399
;1399:			CG_Printf( "^7%s ^4-->^7 %d\n", varName, (int)curVal );
ADDRGP4 $1058
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1032
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1400
;1400:		}
LABELV $1063
LABELV $1060
LABELV $1050
line 1401
;1401:}
LABELV $732
endproc CG_VarMath_f 3376 16
data
align 4
LABELV commands
address $1067
address CG_TestGun_f
address $1068
address CG_TestModel_f
address $1069
address CG_TestModelNextFrame_f
address $1070
address CG_TestModelPrevFrame_f
address $1071
address CG_TestModelNextSkin_f
address $1072
address CG_TestModelPrevSkin_f
address $1073
address CG_Viewpos_f
address $1074
address CG_ScoresDown_f
address $1075
address CG_ScoresUp_f
address $1076
address CG_SizeUp_f
address $1077
address CG_SizeDown_f
address $1078
address CG_NextWeapon_f
address $1079
address CG_PrevWeapon_f
address $1080
address CG_Weapon_f
address $1081
address CG_TellTarget_f
address $1082
address CG_TellAttacker_f
address $1083
address CG_VoiceTellTarget_f
address $1084
address CG_VoiceTellAttacker_f
address $1085
address CG_TargetCommand_f
address $1086
address CG_NextTeamMember_f
address $1087
address CG_PrevTeamMember_f
address $1088
address CG_NextOrder_f
address $1089
address CG_ConfirmOrder_f
address $1090
address CG_DenyOrder_f
address $1091
address CG_TaskOffense_f
address $1092
address CG_TaskDefense_f
address $1093
address CG_TaskPatrol_f
address $1094
address CG_TaskCamp_f
address $1095
address CG_TaskFollow_f
address $1096
address CG_TaskRetrieve_f
address $1097
address CG_TaskEscort_f
address $1098
address CG_TaskSuicide_f
address $1099
address CG_TaskOwnFlag_f
address $1100
address CG_TauntKillInsult_f
address $1101
address CG_TauntPraise_f
address $1102
address CG_TauntTaunt_f
address $1103
address CG_TauntDeathInsult_f
address $1104
address CG_TauntGauntlet_f
address $1105
address CG_spWin_f
address $1106
address CG_spLose_f
address $1107
address CG_scrollScoresDown_f
address $1108
address CG_scrollScoresUp_f
address $1109
address CG_StartOrbit_f
address $1110
address CG_LoadDeferredPlayers
address $1111
address CG_NextInventory_f
address $1112
address CG_PrevInventory_f
address $1113
address CG_NextForcePower_f
address $1114
address CG_PrevForcePower_f
address $1115
address CG_clientserverstatus_f
address $1116
address CG_demopos_f
address $1117
address CG_smoothcam_f
address $1118
address CG_insertcam_f
address $1119
address CG_removecam_f
address $1120
address CG_removeallcams_f
address $1121
address CG_savecamcfg_f
address $1122
address CG_showcam_f
address $1123
address CG_DumpLoc_f
address $1124
address CG_AddLoc_f
address $1125
address CG_InsLoc_f
address $1126
address CG_ReplLoc_f
address $1127
address CG_demospec_f
address $1128
address CG_Rename_f
address $1129
address CG_VarMath_f
address $1130
address CG_GhostSave_f
address $1131
address CG_GhostLoad_f
address $1132
address CG_GhostClose_f
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
line 1488
;1402:
;1403:
;1404:typedef struct {
;1405:	char	*cmd;
;1406:	void	(*function)(void);
;1407:} consoleCommand_t;
;1408:
;1409:static consoleCommand_t	commands[] = {
;1410:	{ "testgun", CG_TestGun_f },
;1411:	{ "testmodel", CG_TestModel_f },
;1412:	{ "nextframe", CG_TestModelNextFrame_f },
;1413:	{ "prevframe", CG_TestModelPrevFrame_f },
;1414:	{ "nextskin", CG_TestModelNextSkin_f },
;1415:	{ "prevskin", CG_TestModelPrevSkin_f },
;1416:	{ "viewpos", CG_Viewpos_f },
;1417:	{ "+scores", CG_ScoresDown_f },
;1418:	{ "-scores", CG_ScoresUp_f },
;1419:	{ "sizeup", CG_SizeUp_f },
;1420:	{ "sizedown", CG_SizeDown_f },
;1421:	{ "weapnext", CG_NextWeapon_f },
;1422:	{ "weapprev", CG_PrevWeapon_f },
;1423:	{ "weapon", CG_Weapon_f },
;1424:	{ "tell_target", CG_TellTarget_f },
;1425:	{ "tell_attacker", CG_TellAttacker_f },
;1426:	{ "vtell_target", CG_VoiceTellTarget_f },
;1427:	{ "vtell_attacker", CG_VoiceTellAttacker_f },
;1428:	{ "tcmd", CG_TargetCommand_f },
;1429:	{ "nextTeamMember", CG_NextTeamMember_f },
;1430:	{ "prevTeamMember", CG_PrevTeamMember_f },
;1431:	{ "nextOrder", CG_NextOrder_f },
;1432:	{ "confirmOrder", CG_ConfirmOrder_f },
;1433:	{ "denyOrder", CG_DenyOrder_f },
;1434:	{ "taskOffense", CG_TaskOffense_f },
;1435:	{ "taskDefense", CG_TaskDefense_f },
;1436:	{ "taskPatrol", CG_TaskPatrol_f },
;1437:	{ "taskCamp", CG_TaskCamp_f },
;1438:	{ "taskFollow", CG_TaskFollow_f },
;1439:	{ "taskRetrieve", CG_TaskRetrieve_f },
;1440:	{ "taskEscort", CG_TaskEscort_f },
;1441:	{ "taskSuicide", CG_TaskSuicide_f },
;1442:	{ "taskOwnFlag", CG_TaskOwnFlag_f },
;1443:	{ "tauntKillInsult", CG_TauntKillInsult_f },
;1444:	{ "tauntPraise", CG_TauntPraise_f },
;1445:	{ "tauntTaunt", CG_TauntTaunt_f },
;1446:	{ "tauntDeathInsult", CG_TauntDeathInsult_f },
;1447:	{ "tauntGauntlet", CG_TauntGauntlet_f },
;1448:	{ "spWin", CG_spWin_f },
;1449:	{ "spLose", CG_spLose_f },
;1450:	{ "scoresDown", CG_scrollScoresDown_f },
;1451:	{ "scoresUp", CG_scrollScoresUp_f },
;1452:	{ "startOrbit", CG_StartOrbit_f },
;1453:	//{ "camera", CG_Camera_f },
;1454:	{ "loaddeferred", CG_LoadDeferredPlayers },
;1455:	{ "invnext", CG_NextInventory_f },
;1456:	{ "invprev", CG_PrevInventory_f },
;1457:	{ "forcenext", CG_NextForcePower_f },
;1458:	{ "forceprev", CG_PrevForcePower_f },
;1459:    { "clientserverstatus", CG_clientserverstatus_f },
;1460:    { "demopos", CG_demopos_f },
;1461:    { "smoothcam", CG_smoothcam_f },
;1462:    { "insertcam", CG_insertcam_f },
;1463:    { "removecam", CG_removecam_f },
;1464:    { "removeallcams", CG_removeallcams_f },
;1465:    { "savecamcfg", CG_savecamcfg_f },
;1466:    { "showcam", CG_showcam_f },
;1467:	{ "dumploc", CG_DumpLoc_f },
;1468:	{ "addloc", CG_AddLoc_f },
;1469:	{ "insloc", CG_InsLoc_f },
;1470:	{ "replloc", CG_ReplLoc_f },
;1471:	{ "truepug_demospec", CG_demospec_f },
;1472:	{ "rename", CG_Rename_f },
;1473:	{ "varMath", CG_VarMath_f },
;1474:	{ "ghostsave", CG_GhostSave_f },
;1475:	{ "ghostload", CG_GhostLoad_f },
;1476:	{ "ghostclose", CG_GhostClose_f },
;1477:};
;1478:
;1479:
;1480:/*
;1481:=================
;1482:CG_ConsoleCommand
;1483:
;1484:The string has been tokenized and can be retrieved with
;1485:Cmd_Argc() / Cmd_Argv()
;1486:=================
;1487:*/
;1488:qboolean CG_ConsoleCommand( void ) {
line 1492
;1489:	const char	*cmd;
;1490:	int		i;
;1491:
;1492:	cmd = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1494
;1493:
;1494:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1137
JUMPV
LABELV $1134
line 1495
;1495:		if ( !Q_stricmp( cmd, commands[i].cmd ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1138
line 1496
;1496:			commands[i].function();
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 1497
;1497:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1133
JUMPV
LABELV $1138
line 1499
;1498:		}
;1499:	}
LABELV $1135
line 1494
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1137
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 66
LTU4 $1134
line 1501
;1500:
;1501:	return qfalse;
CNSTI4 0
RETI4
LABELV $1133
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
line 1513
;1502:}
;1503:
;1504:
;1505:/*
;1506:=================
;1507:CG_InitConsoleCommands
;1508:
;1509:Let the client system know about all of our commands
;1510:so it can perform tab completion
;1511:=================
;1512:*/
;1513:void CG_InitConsoleCommands( void ) {
line 1516
;1514:	int		i;
;1515:
;1516:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1145
JUMPV
LABELV $1142
line 1517
;1517:		trap_AddCommand( commands[i].cmd );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1518
;1518:	}
LABELV $1143
line 1516
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1145
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 66
LTU4 $1142
line 1524
;1519:
;1520:	//
;1521:	// the game server will interpret these commands, which will be automatically
;1522:	// forwarded to the server after they are not recognized locally
;1523:	//
;1524:	trap_AddCommand ("forcechanged");
ADDRGP4 $1146
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1525
;1525:	trap_AddCommand ("sv_invnext");
ADDRGP4 $1147
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1526
;1526:	trap_AddCommand ("sv_invprev");
ADDRGP4 $1148
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1527
;1527:	trap_AddCommand ("sv_forcenext");
ADDRGP4 $1149
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1528
;1528:	trap_AddCommand ("sv_forceprev");
ADDRGP4 $1150
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1529
;1529:	trap_AddCommand ("sv_saberswitch");
ADDRGP4 $1151
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1530
;1530:	trap_AddCommand ("engage_duel");
ADDRGP4 $1152
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1531
;1531:	trap_AddCommand ("force_heal");
ADDRGP4 $1153
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1532
;1532:	trap_AddCommand ("force_speed");
ADDRGP4 $1154
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1533
;1533:	trap_AddCommand ("force_throw");
ADDRGP4 $1155
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1534
;1534:	trap_AddCommand ("force_pull");
ADDRGP4 $1156
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1535
;1535:	trap_AddCommand ("force_distract");
ADDRGP4 $1157
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1536
;1536:	trap_AddCommand ("force_rage");
ADDRGP4 $1158
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1537
;1537:	trap_AddCommand ("force_protect");
ADDRGP4 $1159
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1538
;1538:	trap_AddCommand ("force_absorb");
ADDRGP4 $1160
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1539
;1539:	trap_AddCommand ("force_healother");
ADDRGP4 $1161
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1540
;1540:	trap_AddCommand ("force_forcepowerother");
ADDRGP4 $1162
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1541
;1541:	trap_AddCommand ("force_seeing");
ADDRGP4 $1163
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1542
;1542:	trap_AddCommand ("use_seeker");
ADDRGP4 $1164
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1543
;1543:	trap_AddCommand ("use_field");
ADDRGP4 $1165
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1544
;1544:	trap_AddCommand ("use_bacta");
ADDRGP4 $1166
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1545
;1545:	trap_AddCommand ("use_electrobinoculars");
ADDRGP4 $1167
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1546
;1546:	trap_AddCommand ("zoom");
ADDRGP4 $1168
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1547
;1547:	trap_AddCommand ("use_sentry");
ADDRGP4 $1169
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1548
;1548:	trap_AddCommand ("bot_order");
ADDRGP4 $1170
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1549
;1549:	trap_AddCommand ("saberAttackCycle");
ADDRGP4 $1171
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1550
;1550:	trap_AddCommand ("kill");
ADDRGP4 $1172
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1551
;1551:	trap_AddCommand ("say");
ADDRGP4 $1173
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1552
;1552:	trap_AddCommand ("say_team");
ADDRGP4 $1174
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1553
;1553:	trap_AddCommand ("tell");
ADDRGP4 $1175
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1554
;1554:	trap_AddCommand ("vsay");
ADDRGP4 $1176
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1555
;1555:	trap_AddCommand ("vsay_team");
ADDRGP4 $1177
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1556
;1556:	trap_AddCommand ("vtell");
ADDRGP4 $1178
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1557
;1557:	trap_AddCommand ("vtaunt");
ADDRGP4 $1179
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1558
;1558:	trap_AddCommand ("vosay");
ADDRGP4 $1180
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1559
;1559:	trap_AddCommand ("vosay_team");
ADDRGP4 $1181
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1560
;1560:	trap_AddCommand ("votell");
ADDRGP4 $1182
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1561
;1561:	trap_AddCommand ("give");
ADDRGP4 $1183
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1562
;1562:	trap_AddCommand ("god");
ADDRGP4 $1184
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1563
;1563:	trap_AddCommand ("notarget");
ADDRGP4 $1185
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1564
;1564:	trap_AddCommand ("noclip");
ADDRGP4 $1186
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1565
;1565:	trap_AddCommand ("team");
ADDRGP4 $1187
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1566
;1566:	trap_AddCommand ("follow");
ADDRGP4 $1188
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1567
;1567:	trap_AddCommand ("levelshot");
ADDRGP4 $1189
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1568
;1568:	trap_AddCommand ("addbot");
ADDRGP4 $1190
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1569
;1569:	trap_AddCommand ("setviewpos");
ADDRGP4 $1191
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1570
;1570:	trap_AddCommand ("callvote");
ADDRGP4 $1192
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1571
;1571:	trap_AddCommand ("vote");
ADDRGP4 $1193
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1572
;1572:	trap_AddCommand ("callteamvote");
ADDRGP4 $1194
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1573
;1573:	trap_AddCommand ("teamvote");
ADDRGP4 $1195
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1574
;1574:	trap_AddCommand ("stats");
ADDRGP4 $1196
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1575
;1575:	trap_AddCommand ("teamtask");
ADDRGP4 $1197
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1576
;1576:	trap_AddCommand ("loaddefered");	// spelled wrong, but not changing for demo
ADDRGP4 $1198
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 1577
;1577:}
LABELV $1141
endproc CG_InitConsoleCommands 4 4
import trap_RealTime
bss
export theMatrix
align 4
LABELV theMatrix
skip 160800
export cam
align 4
LABELV cam
skip 6400
import menuScoreboard
import trap_SP_Register
import trap_SP_RegisterServer
import trap_PC_RemoveAllGlobalDefines
import trap_PC_LoadGlobalDefines
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
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
import CG_IsMindTricked
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
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
LABELV $1198
char 1 108
char 1 111
char 1 97
char 1 100
char 1 100
char 1 101
char 1 102
char 1 101
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $1197
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
LABELV $1196
char 1 115
char 1 116
char 1 97
char 1 116
char 1 115
char 1 0
align 1
LABELV $1195
char 1 116
char 1 101
char 1 97
char 1 109
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1194
char 1 99
char 1 97
char 1 108
char 1 108
char 1 116
char 1 101
char 1 97
char 1 109
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1193
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1192
char 1 99
char 1 97
char 1 108
char 1 108
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1191
char 1 115
char 1 101
char 1 116
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 0
align 1
LABELV $1190
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 0
align 1
LABELV $1189
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 115
char 1 104
char 1 111
char 1 116
char 1 0
align 1
LABELV $1188
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 0
align 1
LABELV $1187
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1186
char 1 110
char 1 111
char 1 99
char 1 108
char 1 105
char 1 112
char 1 0
align 1
LABELV $1185
char 1 110
char 1 111
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 0
align 1
LABELV $1184
char 1 103
char 1 111
char 1 100
char 1 0
align 1
LABELV $1183
char 1 103
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $1182
char 1 118
char 1 111
char 1 116
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $1181
char 1 118
char 1 111
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1180
char 1 118
char 1 111
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1179
char 1 118
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $1178
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $1177
char 1 118
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1176
char 1 118
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1175
char 1 116
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $1174
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1173
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1172
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $1171
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 65
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 67
char 1 121
char 1 99
char 1 108
char 1 101
char 1 0
align 1
LABELV $1170
char 1 98
char 1 111
char 1 116
char 1 95
char 1 111
char 1 114
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $1169
char 1 117
char 1 115
char 1 101
char 1 95
char 1 115
char 1 101
char 1 110
char 1 116
char 1 114
char 1 121
char 1 0
align 1
LABELV $1168
char 1 122
char 1 111
char 1 111
char 1 109
char 1 0
align 1
LABELV $1167
char 1 117
char 1 115
char 1 101
char 1 95
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 114
char 1 111
char 1 98
char 1 105
char 1 110
char 1 111
char 1 99
char 1 117
char 1 108
char 1 97
char 1 114
char 1 115
char 1 0
align 1
LABELV $1166
char 1 117
char 1 115
char 1 101
char 1 95
char 1 98
char 1 97
char 1 99
char 1 116
char 1 97
char 1 0
align 1
LABELV $1165
char 1 117
char 1 115
char 1 101
char 1 95
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $1164
char 1 117
char 1 115
char 1 101
char 1 95
char 1 115
char 1 101
char 1 101
char 1 107
char 1 101
char 1 114
char 1 0
align 1
LABELV $1163
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 115
char 1 101
char 1 101
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $1162
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
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
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 0
align 1
LABELV $1161
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 104
char 1 101
char 1 97
char 1 108
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 0
align 1
LABELV $1160
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 97
char 1 98
char 1 115
char 1 111
char 1 114
char 1 98
char 1 0
align 1
LABELV $1159
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $1158
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 114
char 1 97
char 1 103
char 1 101
char 1 0
align 1
LABELV $1157
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 100
char 1 105
char 1 115
char 1 116
char 1 114
char 1 97
char 1 99
char 1 116
char 1 0
align 1
LABELV $1156
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 112
char 1 117
char 1 108
char 1 108
char 1 0
align 1
LABELV $1155
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 116
char 1 104
char 1 114
char 1 111
char 1 119
char 1 0
align 1
LABELV $1154
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 0
align 1
LABELV $1153
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 104
char 1 101
char 1 97
char 1 108
char 1 0
align 1
LABELV $1152
char 1 101
char 1 110
char 1 103
char 1 97
char 1 103
char 1 101
char 1 95
char 1 100
char 1 117
char 1 101
char 1 108
char 1 0
align 1
LABELV $1151
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
LABELV $1150
char 1 115
char 1 118
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 112
char 1 114
char 1 101
char 1 118
char 1 0
align 1
LABELV $1149
char 1 115
char 1 118
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 110
char 1 101
char 1 120
char 1 116
char 1 0
align 1
LABELV $1148
char 1 115
char 1 118
char 1 95
char 1 105
char 1 110
char 1 118
char 1 112
char 1 114
char 1 101
char 1 118
char 1 0
align 1
LABELV $1147
char 1 115
char 1 118
char 1 95
char 1 105
char 1 110
char 1 118
char 1 110
char 1 101
char 1 120
char 1 116
char 1 0
align 1
LABELV $1146
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 0
align 1
LABELV $1132
char 1 103
char 1 104
char 1 111
char 1 115
char 1 116
char 1 99
char 1 108
char 1 111
char 1 115
char 1 101
char 1 0
align 1
LABELV $1131
char 1 103
char 1 104
char 1 111
char 1 115
char 1 116
char 1 108
char 1 111
char 1 97
char 1 100
char 1 0
align 1
LABELV $1130
char 1 103
char 1 104
char 1 111
char 1 115
char 1 116
char 1 115
char 1 97
char 1 118
char 1 101
char 1 0
align 1
LABELV $1129
char 1 118
char 1 97
char 1 114
char 1 77
char 1 97
char 1 116
char 1 104
char 1 0
align 1
LABELV $1128
char 1 114
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $1127
char 1 116
char 1 114
char 1 117
char 1 101
char 1 112
char 1 117
char 1 103
char 1 95
char 1 100
char 1 101
char 1 109
char 1 111
char 1 115
char 1 112
char 1 101
char 1 99
char 1 0
align 1
LABELV $1126
char 1 114
char 1 101
char 1 112
char 1 108
char 1 108
char 1 111
char 1 99
char 1 0
align 1
LABELV $1125
char 1 105
char 1 110
char 1 115
char 1 108
char 1 111
char 1 99
char 1 0
align 1
LABELV $1124
char 1 97
char 1 100
char 1 100
char 1 108
char 1 111
char 1 99
char 1 0
align 1
LABELV $1123
char 1 100
char 1 117
char 1 109
char 1 112
char 1 108
char 1 111
char 1 99
char 1 0
align 1
LABELV $1122
char 1 115
char 1 104
char 1 111
char 1 119
char 1 99
char 1 97
char 1 109
char 1 0
align 1
LABELV $1121
char 1 115
char 1 97
char 1 118
char 1 101
char 1 99
char 1 97
char 1 109
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $1120
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 97
char 1 108
char 1 108
char 1 99
char 1 97
char 1 109
char 1 115
char 1 0
align 1
LABELV $1119
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 99
char 1 97
char 1 109
char 1 0
align 1
LABELV $1118
char 1 105
char 1 110
char 1 115
char 1 101
char 1 114
char 1 116
char 1 99
char 1 97
char 1 109
char 1 0
align 1
LABELV $1117
char 1 115
char 1 109
char 1 111
char 1 111
char 1 116
char 1 104
char 1 99
char 1 97
char 1 109
char 1 0
align 1
LABELV $1116
char 1 100
char 1 101
char 1 109
char 1 111
char 1 112
char 1 111
char 1 115
char 1 0
align 1
LABELV $1115
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 0
align 1
LABELV $1114
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 112
char 1 114
char 1 101
char 1 118
char 1 0
align 1
LABELV $1113
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 110
char 1 101
char 1 120
char 1 116
char 1 0
align 1
LABELV $1112
char 1 105
char 1 110
char 1 118
char 1 112
char 1 114
char 1 101
char 1 118
char 1 0
align 1
LABELV $1111
char 1 105
char 1 110
char 1 118
char 1 110
char 1 101
char 1 120
char 1 116
char 1 0
align 1
LABELV $1110
char 1 108
char 1 111
char 1 97
char 1 100
char 1 100
char 1 101
char 1 102
char 1 101
char 1 114
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $1109
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 79
char 1 114
char 1 98
char 1 105
char 1 116
char 1 0
align 1
LABELV $1108
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 85
char 1 112
char 1 0
align 1
LABELV $1107
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 68
char 1 111
char 1 119
char 1 110
char 1 0
align 1
LABELV $1106
char 1 115
char 1 112
char 1 76
char 1 111
char 1 115
char 1 101
char 1 0
align 1
LABELV $1105
char 1 115
char 1 112
char 1 87
char 1 105
char 1 110
char 1 0
align 1
LABELV $1104
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 71
char 1 97
char 1 117
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 0
align 1
LABELV $1103
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 68
char 1 101
char 1 97
char 1 116
char 1 104
char 1 73
char 1 110
char 1 115
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $1102
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 84
char 1 97
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $1101
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 80
char 1 114
char 1 97
char 1 105
char 1 115
char 1 101
char 1 0
align 1
LABELV $1100
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 75
char 1 105
char 1 108
char 1 108
char 1 73
char 1 110
char 1 115
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $1099
char 1 116
char 1 97
char 1 115
char 1 107
char 1 79
char 1 119
char 1 110
char 1 70
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $1098
char 1 116
char 1 97
char 1 115
char 1 107
char 1 83
char 1 117
char 1 105
char 1 99
char 1 105
char 1 100
char 1 101
char 1 0
align 1
LABELV $1097
char 1 116
char 1 97
char 1 115
char 1 107
char 1 69
char 1 115
char 1 99
char 1 111
char 1 114
char 1 116
char 1 0
align 1
LABELV $1096
char 1 116
char 1 97
char 1 115
char 1 107
char 1 82
char 1 101
char 1 116
char 1 114
char 1 105
char 1 101
char 1 118
char 1 101
char 1 0
align 1
LABELV $1095
char 1 116
char 1 97
char 1 115
char 1 107
char 1 70
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 0
align 1
LABELV $1094
char 1 116
char 1 97
char 1 115
char 1 107
char 1 67
char 1 97
char 1 109
char 1 112
char 1 0
align 1
LABELV $1093
char 1 116
char 1 97
char 1 115
char 1 107
char 1 80
char 1 97
char 1 116
char 1 114
char 1 111
char 1 108
char 1 0
align 1
LABELV $1092
char 1 116
char 1 97
char 1 115
char 1 107
char 1 68
char 1 101
char 1 102
char 1 101
char 1 110
char 1 115
char 1 101
char 1 0
align 1
LABELV $1091
char 1 116
char 1 97
char 1 115
char 1 107
char 1 79
char 1 102
char 1 102
char 1 101
char 1 110
char 1 115
char 1 101
char 1 0
align 1
LABELV $1090
char 1 100
char 1 101
char 1 110
char 1 121
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $1089
char 1 99
char 1 111
char 1 110
char 1 102
char 1 105
char 1 114
char 1 109
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $1088
char 1 110
char 1 101
char 1 120
char 1 116
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $1087
char 1 112
char 1 114
char 1 101
char 1 118
char 1 84
char 1 101
char 1 97
char 1 109
char 1 77
char 1 101
char 1 109
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $1086
char 1 110
char 1 101
char 1 120
char 1 116
char 1 84
char 1 101
char 1 97
char 1 109
char 1 77
char 1 101
char 1 109
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $1085
char 1 116
char 1 99
char 1 109
char 1 100
char 1 0
align 1
LABELV $1084
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 95
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 101
char 1 114
char 1 0
align 1
LABELV $1083
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 95
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 0
align 1
LABELV $1082
char 1 116
char 1 101
char 1 108
char 1 108
char 1 95
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 101
char 1 114
char 1 0
align 1
LABELV $1081
char 1 116
char 1 101
char 1 108
char 1 108
char 1 95
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 0
align 1
LABELV $1080
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 0
align 1
LABELV $1079
char 1 119
char 1 101
char 1 97
char 1 112
char 1 112
char 1 114
char 1 101
char 1 118
char 1 0
align 1
LABELV $1078
char 1 119
char 1 101
char 1 97
char 1 112
char 1 110
char 1 101
char 1 120
char 1 116
char 1 0
align 1
LABELV $1077
char 1 115
char 1 105
char 1 122
char 1 101
char 1 100
char 1 111
char 1 119
char 1 110
char 1 0
align 1
LABELV $1076
char 1 115
char 1 105
char 1 122
char 1 101
char 1 117
char 1 112
char 1 0
align 1
LABELV $1075
char 1 45
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $1074
char 1 43
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $1073
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 0
align 1
LABELV $1072
char 1 112
char 1 114
char 1 101
char 1 118
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $1071
char 1 110
char 1 101
char 1 120
char 1 116
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $1070
char 1 112
char 1 114
char 1 101
char 1 118
char 1 102
char 1 114
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $1069
char 1 110
char 1 101
char 1 120
char 1 116
char 1 102
char 1 114
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $1068
char 1 116
char 1 101
char 1 115
char 1 116
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $1067
char 1 116
char 1 101
char 1 115
char 1 116
char 1 103
char 1 117
char 1 110
char 1 0
align 1
LABELV $1065
char 1 115
char 1 101
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 100
char 1 0
align 1
LABELV $1064
char 1 115
char 1 101
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 102
char 1 0
align 1
LABELV $1061
char 1 115
char 1 101
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1058
char 1 94
char 1 55
char 1 37
char 1 115
char 1 32
char 1 94
char 1 52
char 1 45
char 1 45
char 1 62
char 1 94
char 1 55
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $1057
char 1 94
char 1 55
char 1 37
char 1 115
char 1 32
char 1 94
char 1 52
char 1 45
char 1 45
char 1 62
char 1 94
char 1 55
char 1 32
char 1 37
char 1 102
char 1 10
char 1 0
align 1
LABELV $1054
char 1 94
char 1 55
char 1 37
char 1 115
char 1 32
char 1 94
char 1 52
char 1 45
char 1 45
char 1 62
char 1 94
char 1 55
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $1051
char 1 117
char 1 115
char 1 101
char 1 114
char 1 95
char 1 0
align 1
LABELV $1044
char 1 42
char 1 42
char 1 42
char 1 32
char 1 80
char 1 97
char 1 114
char 1 115
char 1 101
char 1 32
char 1 101
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 105
char 1 110
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 111
char 1 112
char 1 101
char 1 114
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 40
char 1 37
char 1 99
char 1 41
char 1 10
char 1 0
align 1
LABELV $1026
char 1 99
char 1 103
char 1 116
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $1014
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $1008
char 1 37
char 1 48
char 1 50
char 1 100
char 1 37
char 1 48
char 1 50
char 1 100
char 1 37
char 1 48
char 1 50
char 1 100
char 1 0
align 1
LABELV $1007
char 1 116
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $1000
char 1 37
char 1 48
char 1 52
char 1 100
char 1 37
char 1 48
char 1 50
char 1 100
char 1 37
char 1 48
char 1 50
char 1 100
char 1 0
align 1
LABELV $999
char 1 100
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $995
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $989
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 88
char 1 89
char 1 0
align 1
LABELV $983
char 1 118
char 1 101
char 1 108
char 1 88
char 1 89
char 1 90
char 1 0
align 1
LABELV $977
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 90
char 1 0
align 1
LABELV $975
char 1 118
char 1 101
char 1 108
char 1 90
char 1 0
align 1
LABELV $970
char 1 118
char 1 101
char 1 108
char 1 89
char 1 0
align 1
LABELV $966
char 1 118
char 1 101
char 1 108
char 1 88
char 1 0
align 1
LABELV $934
char 1 97
char 1 110
char 1 103
char 1 88
char 1 89
char 1 90
char 1 0
align 1
LABELV $920
char 1 97
char 1 110
char 1 103
char 1 90
char 1 0
align 1
LABELV $906
char 1 97
char 1 110
char 1 103
char 1 89
char 1 0
align 1
LABELV $894
char 1 97
char 1 110
char 1 103
char 1 88
char 1 0
align 1
LABELV $862
char 1 112
char 1 111
char 1 115
char 1 88
char 1 89
char 1 90
char 1 0
align 1
LABELV $848
char 1 112
char 1 111
char 1 115
char 1 90
char 1 0
align 1
LABELV $815
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 0
align 1
LABELV $814
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 88
char 1 89
char 1 90
char 1 0
align 1
LABELV $799
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 90
char 1 0
align 1
LABELV $784
char 1 112
char 1 111
char 1 115
char 1 89
char 1 0
align 1
LABELV $782
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 89
char 1 0
align 1
LABELV $770
char 1 37
char 1 102
char 1 0
align 1
LABELV $768
char 1 112
char 1 111
char 1 115
char 1 88
char 1 0
align 1
LABELV $766
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 88
char 1 0
align 1
LABELV $746
char 1 94
char 1 55
char 1 42
char 1 42
char 1 42
char 1 32
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 32
char 1 45
char 1 32
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 118
char 1 97
char 1 108
char 1 117
char 1 101
char 1 10
char 1 0
align 1
LABELV $743
char 1 94
char 1 55
char 1 42
char 1 42
char 1 42
char 1 32
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 32
char 1 45
char 1 32
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 111
char 1 112
char 1 101
char 1 114
char 1 97
char 1 116
char 1 111
char 1 114
char 1 10
char 1 0
align 1
LABELV $740
char 1 94
char 1 51
char 1 78
char 1 111
char 1 116
char 1 101
char 1 58
char 1 32
char 1 32
char 1 32
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 105
char 1 109
char 1 109
char 1 101
char 1 100
char 1 105
char 1 97
char 1 116
char 1 101
char 1 32
char 1 118
char 1 97
char 1 114
char 1 105
char 1 97
char 1 98
char 1 108
char 1 101
char 1 32
char 1 117
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 44
char 1 32
char 1 112
char 1 114
char 1 101
char 1 102
char 1 105
char 1 120
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 86
char 1 97
char 1 114
char 1 105
char 1 97
char 1 98
char 1 108
char 1 101
char 1 78
char 1 97
char 1 109
char 1 101
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 34
char 1 117
char 1 115
char 1 101
char 1 114
char 1 95
char 1 34
char 1 10
char 1 0
align 1
LABELV $739
char 1 94
char 1 50
char 1 69
char 1 120
char 1 97
char 1 109
char 1 112
char 1 108
char 1 101
char 1 58
char 1 32
char 1 94
char 1 55
char 1 118
char 1 97
char 1 114
char 1 77
char 1 97
char 1 116
char 1 104
char 1 32
char 1 117
char 1 115
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 109
char 1 111
char 1 110
char 1 97
char 1 109
char 1 101
char 1 32
char 1 61
char 1 32
char 1 36
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 32
char 1 43
char 1 32
char 1 95
char 1 32
char 1 43
char 1 32
char 1 36
char 1 100
char 1 97
char 1 116
char 1 101
char 1 32
char 1 43
char 1 32
char 1 95
char 1 32
char 1 43
char 1 32
char 1 48
char 1 48
char 1 49
char 1 10
char 1 10
char 1 0
align 1
LABELV $738
char 1 94
char 1 50
char 1 69
char 1 120
char 1 97
char 1 109
char 1 112
char 1 108
char 1 101
char 1 58
char 1 32
char 1 94
char 1 55
char 1 118
char 1 97
char 1 114
char 1 77
char 1 97
char 1 116
char 1 104
char 1 32
char 1 117
char 1 115
char 1 101
char 1 114
char 1 95
char 1 110
char 1 117
char 1 109
char 1 32
char 1 61
char 1 32
char 1 49
char 1 32
char 1 43
char 1 32
char 1 51
char 1 32
char 1 42
char 1 32
char 1 53
char 1 10
char 1 0
align 1
LABELV $737
char 1 94
char 1 50
char 1 69
char 1 120
char 1 97
char 1 109
char 1 112
char 1 108
char 1 101
char 1 58
char 1 32
char 1 94
char 1 55
char 1 118
char 1 97
char 1 114
char 1 77
char 1 97
char 1 116
char 1 104
char 1 32
char 1 116
char 1 105
char 1 109
char 1 101
char 1 115
char 1 99
char 1 97
char 1 108
char 1 101
char 1 32
char 1 42
char 1 32
char 1 46
char 1 50
char 1 10
char 1 0
align 1
LABELV $736
char 1 94
char 1 55
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 32
char 1 32
char 1 118
char 1 97
char 1 114
char 1 77
char 1 97
char 1 116
char 1 104
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 86
char 1 97
char 1 114
char 1 105
char 1 97
char 1 98
char 1 108
char 1 101
char 1 78
char 1 97
char 1 109
char 1 101
char 1 32
char 1 111
char 1 112
char 1 101
char 1 114
char 1 97
char 1 116
char 1 111
char 1 114
char 1 58
char 1 32
char 1 43
char 1 45
char 1 42
char 1 47
char 1 37
char 1 61
char 1 32
char 1 118
char 1 97
char 1 108
char 1 117
char 1 101
char 1 32
char 1 40
char 1 43
char 1 45
char 1 42
char 1 47
char 1 37
char 1 61
char 1 32
char 1 118
char 1 97
char 1 108
char 1 117
char 1 101
char 1 41
char 1 10
char 1 0
align 1
LABELV $735
char 1 10
char 1 94
char 1 49
char 1 118
char 1 97
char 1 114
char 1 77
char 1 97
char 1 116
char 1 104
char 1 58
char 1 32
char 1 94
char 1 50
char 1 80
char 1 101
char 1 114
char 1 102
char 1 111
char 1 114
char 1 109
char 1 115
char 1 32
char 1 109
char 1 97
char 1 116
char 1 104
char 1 32
char 1 102
char 1 117
char 1 110
char 1 99
char 1 116
char 1 105
char 1 111
char 1 110
char 1 115
char 1 32
char 1 111
char 1 110
char 1 32
char 1 99
char 1 118
char 1 97
char 1 114
char 1 115
char 1 32
char 1 97
char 1 110
char 1 100
char 1 32
char 1 118
char 1 115
char 1 116
char 1 114
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $723
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 71
char 1 104
char 1 111
char 1 115
char 1 116
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 99
char 1 108
char 1 111
char 1 115
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $719
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 70
char 1 105
char 1 108
char 1 101
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 10
char 1 0
align 1
LABELV $711
char 1 103
char 1 104
char 1 111
char 1 115
char 1 116
char 1 115
char 1 47
char 1 37
char 1 115
char 1 46
char 1 66
char 1 79
char 1 79
char 1 95
char 1 37
char 1 115
char 1 0
align 1
LABELV $710
char 1 112
char 1 114
char 1 111
char 1 116
char 1 111
char 1 99
char 1 111
char 1 108
char 1 0
align 1
LABELV $709
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 71
char 1 104
char 1 111
char 1 115
char 1 116
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 105
char 1 110
char 1 32
char 1 117
char 1 115
char 1 101
char 1 10
char 1 0
align 1
LABELV $706
char 1 70
char 1 105
char 1 108
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 32
char 1 114
char 1 101
char 1 113
char 1 117
char 1 105
char 1 114
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $689
char 1 34
char 1 112
char 1 117
char 1 103
char 1 95
char 1 100
char 1 101
char 1 109
char 1 111
char 1 115
char 1 112
char 1 101
char 1 99
char 1 34
char 1 32
char 1 105
char 1 115
char 1 58
char 1 34
char 1 37
char 1 100
char 1 34
char 1 32
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 58
char 1 34
char 1 45
char 1 49
char 1 34
char 1 10
char 1 0
align 1
LABELV $680
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 99
char 1 97
char 1 109
char 1 32
char 1 37
char 1 100
char 1 59
char 1 105
char 1 110
char 1 115
char 1 101
char 1 114
char 1 116
char 1 99
char 1 97
char 1 109
char 1 32
char 1 37
char 1 100
char 1 32
char 1 84
char 1 80
char 1 32
char 1 48
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $673
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 99
char 1 97
char 1 109
char 1 32
char 1 37
char 1 100
char 1 59
char 1 105
char 1 110
char 1 115
char 1 101
char 1 114
char 1 116
char 1 99
char 1 97
char 1 109
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $670
char 1 83
char 1 121
char 1 110
char 1 116
char 1 97
char 1 120
char 1 58
char 1 32
char 1 114
char 1 101
char 1 112
char 1 108
char 1 108
char 1 111
char 1 99
char 1 32
char 1 60
char 1 99
char 1 97
char 1 109
char 1 32
char 1 110
char 1 117
char 1 109
char 1 62
char 1 32
char 1 60
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 58
char 1 116
char 1 105
char 1 109
char 1 101
char 1 91
char 1 46
char 1 109
char 1 115
char 1 101
char 1 99
char 1 93
char 1 62
char 1 32
char 1 40
char 1 60
char 1 84
char 1 80
char 1 62
char 1 41
char 1 10
char 1 0
align 1
LABELV $661
char 1 105
char 1 110
char 1 115
char 1 101
char 1 114
char 1 116
char 1 99
char 1 97
char 1 109
char 1 32
char 1 37
char 1 100
char 1 32
char 1 84
char 1 80
char 1 32
char 1 48
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $654
char 1 105
char 1 110
char 1 115
char 1 101
char 1 114
char 1 116
char 1 99
char 1 97
char 1 109
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $651
char 1 83
char 1 121
char 1 110
char 1 116
char 1 97
char 1 120
char 1 58
char 1 32
char 1 105
char 1 110
char 1 115
char 1 108
char 1 111
char 1 99
char 1 32
char 1 60
char 1 99
char 1 97
char 1 109
char 1 32
char 1 110
char 1 117
char 1 109
char 1 62
char 1 32
char 1 60
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 58
char 1 116
char 1 105
char 1 109
char 1 101
char 1 91
char 1 46
char 1 109
char 1 115
char 1 101
char 1 99
char 1 93
char 1 62
char 1 32
char 1 40
char 1 60
char 1 84
char 1 80
char 1 62
char 1 41
char 1 10
char 1 0
align 1
LABELV $634
char 1 83
char 1 121
char 1 110
char 1 116
char 1 97
char 1 120
char 1 58
char 1 32
char 1 97
char 1 100
char 1 100
char 1 108
char 1 111
char 1 99
char 1 32
char 1 60
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 58
char 1 116
char 1 105
char 1 109
char 1 101
char 1 91
char 1 46
char 1 109
char 1 115
char 1 101
char 1 99
char 1 93
char 1 62
char 1 32
char 1 40
char 1 60
char 1 84
char 1 80
char 1 62
char 1 41
char 1 10
char 1 0
align 1
LABELV $630
char 1 67
char 1 97
char 1 109
char 1 32
char 1 68
char 1 97
char 1 116
char 1 97
char 1 32
char 1 68
char 1 117
char 1 109
char 1 112
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $624
char 1 115
char 1 109
char 1 111
char 1 111
char 1 116
char 1 104
char 1 99
char 1 97
char 1 109
char 1 32
char 1 84
char 1 80
char 1 32
char 1 48
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $617
char 1 115
char 1 109
char 1 111
char 1 111
char 1 116
char 1 104
char 1 99
char 1 97
char 1 109
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $611
char 1 83
char 1 121
char 1 110
char 1 116
char 1 97
char 1 120
char 1 58
char 1 32
char 1 100
char 1 117
char 1 109
char 1 112
char 1 108
char 1 111
char 1 99
char 1 32
char 1 60
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 58
char 1 116
char 1 105
char 1 109
char 1 101
char 1 91
char 1 46
char 1 109
char 1 115
char 1 101
char 1 99
char 1 93
char 1 62
char 1 32
char 1 60
char 1 102
char 1 105
char 1 108
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 62
char 1 32
char 1 40
char 1 60
char 1 84
char 1 80
char 1 62
char 1 41
char 1 10
char 1 0
align 1
LABELV $572
char 1 37
char 1 100
char 1 58
char 1 32
char 1 84
char 1 80
char 1 32
char 1 48
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 100
char 1 58
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $563
char 1 37
char 1 100
char 1 58
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 100
char 1 58
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $552
char 1 10
char 1 67
char 1 97
char 1 109
char 1 32
char 1 68
char 1 97
char 1 116
char 1 97
char 1 32
char 1 68
char 1 117
char 1 109
char 1 112
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $543
char 1 115
char 1 109
char 1 111
char 1 111
char 1 116
char 1 104
char 1 99
char 1 97
char 1 109
char 1 32
char 1 84
char 1 80
char 1 32
char 1 48
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 100
char 1 58
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $534
char 1 115
char 1 109
char 1 111
char 1 111
char 1 116
char 1 104
char 1 99
char 1 97
char 1 109
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 100
char 1 58
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $530
char 1 37
char 1 100
char 1 32
char 1 0
align 1
LABELV $529
char 1 48
char 1 37
char 1 115
char 1 0
align 1
LABELV $524
char 1 37
char 1 46
char 1 51
char 1 102
char 1 0
align 1
LABELV $519
char 1 68
char 1 117
char 1 109
char 1 112
char 1 105
char 1 110
char 1 103
char 1 32
char 1 67
char 1 97
char 1 109
char 1 32
char 1 0
align 1
LABELV $518
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
char 1 111
char 1 112
char 1 101
char 1 110
char 1 32
char 1 39
char 1 37
char 1 115
char 1 39
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 119
char 1 114
char 1 105
char 1 116
char 1 105
char 1 110
char 1 103
char 1 46
char 1 10
char 1 0
align 1
LABELV $515
char 1 83
char 1 121
char 1 110
char 1 116
char 1 97
char 1 120
char 1 58
char 1 32
char 1 115
char 1 97
char 1 118
char 1 101
char 1 99
char 1 97
char 1 109
char 1 99
char 1 102
char 1 103
char 1 32
char 1 60
char 1 102
char 1 105
char 1 108
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 62
char 1 10
char 1 0
align 1
LABELV $511
char 1 82
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 100
char 1 32
char 1 37
char 1 100
char 1 32
char 1 67
char 1 97
char 1 109
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $505
char 1 82
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 100
char 1 32
char 1 67
char 1 97
char 1 109
char 1 32
char 1 76
char 1 111
char 1 99
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 37
char 1 100
char 1 46
char 1 10
char 1 0
align 1
LABELV $499
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 99
char 1 97
char 1 109
char 1 32
char 1 60
char 1 99
char 1 97
char 1 109
char 1 32
char 1 110
char 1 117
char 1 109
char 1 62
char 1 10
char 1 0
align 1
LABELV $495
char 1 73
char 1 110
char 1 115
char 1 101
char 1 114
char 1 116
char 1 101
char 1 100
char 1 32
char 1 67
char 1 97
char 1 109
char 1 32
char 1 76
char 1 111
char 1 99
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 37
char 1 100
char 1 46
char 1 10
char 1 0
align 1
LABELV $469
char 1 65
char 1 100
char 1 100
char 1 101
char 1 100
char 1 32
char 1 67
char 1 97
char 1 109
char 1 32
char 1 76
char 1 111
char 1 99
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 37
char 1 100
char 1 46
char 1 10
char 1 0
align 1
LABELV $451
char 1 84
char 1 80
char 1 0
align 1
LABELV $331
char 1 37
char 1 100
char 1 0
align 1
LABELV $330
char 1 116
char 1 105
char 1 109
char 1 101
char 1 115
char 1 99
char 1 97
char 1 108
char 1 101
char 1 0
align 1
LABELV $317
char 1 110
char 1 0
align 1
LABELV $316
char 1 37
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $309
char 1 53
char 1 0
align 1
LABELV $303
char 1 100
char 1 101
char 1 118
char 1 101
char 1 108
char 1 111
char 1 112
char 1 101
char 1 114
char 1 0
align 1
LABELV $301
char 1 116
char 1 101
char 1 108
char 1 108
char 1 32
char 1 37
char 1 105
char 1 32
char 1 115
char 1 117
char 1 105
char 1 99
char 1 105
char 1 100
char 1 101
char 1 0
align 1
LABELV $297
char 1 99
char 1 109
char 1 100
char 1 32
char 1 118
char 1 115
char 1 97
char 1 121
char 1 32
char 1 107
char 1 105
char 1 108
char 1 108
char 1 95
char 1 103
char 1 117
char 1 97
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 10
char 1 0
align 1
LABELV $295
char 1 99
char 1 109
char 1 100
char 1 32
char 1 118
char 1 115
char 1 97
char 1 121
char 1 32
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 95
char 1 105
char 1 110
char 1 115
char 1 117
char 1 108
char 1 116
char 1 10
char 1 0
align 1
LABELV $293
char 1 99
char 1 109
char 1 100
char 1 32
char 1 118
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 10
char 1 0
align 1
LABELV $291
char 1 99
char 1 109
char 1 100
char 1 32
char 1 118
char 1 115
char 1 97
char 1 121
char 1 32
char 1 112
char 1 114
char 1 97
char 1 105
char 1 115
char 1 101
char 1 10
char 1 0
align 1
LABELV $289
char 1 99
char 1 109
char 1 100
char 1 32
char 1 118
char 1 115
char 1 97
char 1 121
char 1 32
char 1 107
char 1 105
char 1 108
char 1 108
char 1 95
char 1 105
char 1 110
char 1 115
char 1 117
char 1 108
char 1 116
char 1 10
char 1 0
align 1
LABELV $287
char 1 105
char 1 104
char 1 97
char 1 118
char 1 101
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $285
char 1 111
char 1 110
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 99
char 1 97
char 1 114
char 1 114
char 1 105
char 1 101
char 1 114
char 1 0
align 1
LABELV $283
char 1 111
char 1 110
char 1 114
char 1 101
char 1 116
char 1 117
char 1 114
char 1 110
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $281
char 1 111
char 1 110
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 0
align 1
LABELV $279
char 1 111
char 1 110
char 1 99
char 1 97
char 1 109
char 1 112
char 1 0
align 1
LABELV $277
char 1 111
char 1 110
char 1 112
char 1 97
char 1 116
char 1 114
char 1 111
char 1 108
char 1 0
align 1
LABELV $275
char 1 111
char 1 110
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 115
char 1 101
char 1 0
align 1
LABELV $273
char 1 111
char 1 110
char 1 111
char 1 102
char 1 102
char 1 101
char 1 110
char 1 115
char 1 101
char 1 0
align 1
LABELV $272
char 1 111
char 1 110
char 1 103
char 1 101
char 1 116
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $271
char 1 99
char 1 109
char 1 100
char 1 32
char 1 118
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $259
char 1 43
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 54
char 1 59
char 1 32
char 1 119
char 1 97
char 1 105
char 1 116
char 1 59
char 1 32
char 1 45
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 54
char 1 0
align 1
LABELV $258
char 1 110
char 1 111
char 1 0
align 1
LABELV $253
char 1 116
char 1 101
char 1 97
char 1 109
char 1 116
char 1 97
char 1 115
char 1 107
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $248
char 1 43
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 53
char 1 59
char 1 32
char 1 119
char 1 97
char 1 105
char 1 116
char 1 59
char 1 32
char 1 45
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 53
char 1 0
align 1
LABELV $247
char 1 121
char 1 101
char 1 115
char 1 0
align 1
LABELV $245
char 1 99
char 1 109
char 1 100
char 1 32
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $209
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $202
char 1 116
char 1 101
char 1 108
char 1 108
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $198
char 1 89
char 1 79
char 1 85
char 1 32
char 1 76
char 1 79
char 1 83
char 1 69
char 1 46
char 1 46
char 1 46
char 1 0
align 1
LABELV $194
char 1 89
char 1 79
char 1 85
char 1 32
char 1 87
char 1 73
char 1 78
char 1 33
char 1 0
align 1
LABELV $191
char 1 49
char 1 48
char 1 48
char 1 0
align 1
LABELV $190
char 1 99
char 1 103
char 1 95
char 1 116
char 1 104
char 1 105
char 1 114
char 1 100
char 1 80
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 82
char 1 97
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $189
char 1 48
char 1 0
align 1
LABELV $188
char 1 99
char 1 103
char 1 95
char 1 116
char 1 104
char 1 105
char 1 114
char 1 100
char 1 80
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 65
char 1 110
char 1 103
char 1 108
char 1 101
char 1 0
align 1
LABELV $187
char 1 49
char 1 0
align 1
LABELV $186
char 1 99
char 1 103
char 1 95
char 1 116
char 1 104
char 1 105
char 1 114
char 1 100
char 1 80
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 0
align 1
LABELV $185
char 1 51
char 1 53
char 1 0
align 1
LABELV $184
char 1 99
char 1 103
char 1 95
char 1 99
char 1 97
char 1 109
char 1 101
char 1 114
char 1 97
char 1 79
char 1 114
char 1 98
char 1 105
char 1 116
char 1 68
char 1 101
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $183
char 1 50
char 1 0
align 1
LABELV $182
char 1 99
char 1 103
char 1 95
char 1 99
char 1 97
char 1 109
char 1 101
char 1 114
char 1 97
char 1 79
char 1 114
char 1 98
char 1 105
char 1 116
char 1 0
align 1
LABELV $159
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $140
char 1 37
char 1 115
char 1 32
char 1 40
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 41
char 1 32
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $135
char 1 37
char 1 105
char 1 0
align 1
LABELV $134
char 1 99
char 1 103
char 1 95
char 1 118
char 1 105
char 1 101
char 1 119
char 1 115
char 1 105
char 1 122
char 1 101
char 1 0
align 1
LABELV $132
char 1 103
char 1 99
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 0
