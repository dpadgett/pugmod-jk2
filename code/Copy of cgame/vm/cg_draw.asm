data
export menuScoreboard
align 4
LABELV menuScoreboard
byte 4 0
export bluehudtint
align 4
LABELV bluehudtint
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
byte 4 1065353216
export redhudtint
align 4
LABELV redhudtint
byte 4 1065353216
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
export showPowersName
align 4
LABELV showPowersName
address $129
address $130
address $131
address $132
address $133
address $134
address $135
address $136
address $137
address $138
address $139
address $140
address $141
address $142
address $143
address $144
address $145
address $146
byte 4 0
export MenuFontToHandle
code
proc MenuFontToHandle 4 0
file "../cg_draw.c"
line 56
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_draw.c -- draw all of the graphical elements during
;4:// active (after loading) gameplay
;5:
;6:#include "cg_local.h"
;7:
;8:#include "../ui/ui_shared.h"
;9:
;10:qboolean CG_WorldCoordToScreenCoordFloat(vec3_t worldCoord, float *x, float *y);
;11:qboolean CG_CalcMuzzlePoint( int entityNum, vec3_t muzzle );
;12:
;13:// used for scoreboard
;14:extern displayContextDef_t cgDC;
;15:menuDef_t *menuScoreboard = NULL;
;16:vec4_t	bluehudtint = {0.5, 0.5, 1.0, 1.0};
;17:vec4_t	redhudtint = {1.0, 0.5, 0.5, 1.0};
;18:float	*hudTintColor;
;19:
;20:int sortedTeamPlayers[TEAM_MAXOVERLAY];
;21:int	numSortedTeamPlayers;
;22:
;23:int lastvalidlockdif;
;24:
;25:extern float zoomFov; //this has to be global client-side
;26:
;27:char systemChat[256];
;28:char teamChat1[256];
;29:char teamChat2[256];
;30:
;31:char *showPowersName[] = 
;32:{
;33:	"HEAL2",//FP_HEAL
;34:	"JUMP2",//FP_LEVITATION
;35:	"SPEED2",//FP_SPEED
;36:	"PUSH2",//FP_PUSH
;37:	"PULL2",//FP_PULL
;38:	"MINDTRICK2",//FP_TELEPTAHY
;39:	"GRIP2",//FP_GRIP
;40:	"LIGHTNING2",//FP_LIGHTNING
;41:	"DARK_RAGE2",//FP_RAGE
;42:	"PROTECT2",//FP_PROTECT
;43:	"ABSORB2",//FP_ABSORB
;44:	"TEAM_HEAL2",//FP_TEAM_HEAL
;45:	"TEAM_REPLENISH2",//FP_TEAM_FORCE
;46:	"DRAIN2",//FP_DRAIN
;47:	"SEEING2",//FP_SEE
;48:	"SABER_OFFENSE2",//FP_SABERATTACK
;49:	"SABER_DEFENSE2",//FP_SABERDEFEND
;50:	"SABER_THROW2",//FP_SABERTHROW
;51:	NULL
;52:};
;53:
;54:
;55:int MenuFontToHandle(int iMenuFont)
;56:{
line 57
;57:	switch (iMenuFont)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $150
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $153
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $156
ADDRGP4 $148
JUMPV
line 58
;58:	{
LABELV $150
line 59
;59:		case FONT_SMALL:	return cgDC.Assets.qhSmallFont;
ADDRGP4 cgDC+260+12
INDIRI4
RETI4
ADDRGP4 $147
JUMPV
LABELV $153
line 60
;60:		case FONT_MEDIUM:	return cgDC.Assets.qhMediumFont;
ADDRGP4 cgDC+260+16
INDIRI4
RETI4
ADDRGP4 $147
JUMPV
LABELV $156
line 61
;61:		case FONT_LARGE:	return cgDC.Assets.qhBigFont;
ADDRGP4 cgDC+260+20
INDIRI4
RETI4
ADDRGP4 $147
JUMPV
LABELV $148
line 64
;62:	}
;63:
;64:	return cgDC.Assets.qhMediumFont;
ADDRGP4 cgDC+260+16
INDIRI4
RETI4
LABELV $147
endproc MenuFontToHandle 4 0
export CG_Text_Width
proc CG_Text_Width 12 12
line 68
;65:}
;66:
;67:int CG_Text_Width(const char *text, float scale, int iMenuFont) 
;68:{
line 69
;69:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 71
;70:
;71:	return trap_R_Font_StrLenPixels(text, iFontIndex, scale);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $161
endproc CG_Text_Width 12 12
export CG_Text_Height
proc CG_Text_Height 12 8
line 75
;72:}
;73:
;74:int CG_Text_Height(const char *text, float scale, int iMenuFont) 
;75:{
line 76
;76:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 78
;77:
;78:	return trap_R_Font_HeightPixels(iFontIndex, scale);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 trap_R_Font_HeightPixels
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $162
endproc CG_Text_Height 12 8
export CG_Text_Paint
proc CG_Text_Paint 20 28
line 83
;79:}
;80:
;81:#include "../qcommon/qfiles.h"	// for STYLE_BLINK etc
;82:void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style, int iMenuFont) 
;83:{
line 84
;84:	int iStyleOR = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 85
;85:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 32
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 87
;86:	
;87:	switch (style)
ADDRLP4 12
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $196
ADDRLP4 12
INDIRI4
CNSTI4 6
GTI4 $196
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $205
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $205
address $198
address $199
address $200
address $201
address $202
address $203
address $204
code
line 88
;88:	{
LABELV $198
line 89
;89:	case  ITEM_TEXTSTYLE_NORMAL:			iStyleOR = 0;break;					// JK2 normal text
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $199
line 90
;90:	case  ITEM_TEXTSTYLE_BLINK:				iStyleOR = STYLE_BLINK;break;		// JK2 fast blinking
ADDRLP4 0
CNSTI4 1073741824
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $200
line 91
;91:	case  ITEM_TEXTSTYLE_PULSE:				iStyleOR = STYLE_BLINK;break;		// JK2 slow pulsing
ADDRLP4 0
CNSTI4 1073741824
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $201
line 92
;92:	case  ITEM_TEXTSTYLE_SHADOWED:			iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow ( need a color for this )
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $202
line 93
;93:	case  ITEM_TEXTSTYLE_OUTLINED:			iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow ( need a color for this )
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $203
line 94
;94:	case  ITEM_TEXTSTYLE_OUTLINESHADOWED:	iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow ( need a color for this )
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $204
line 95
;95:	case  ITEM_TEXTSTYLE_SHADOWEDMORE:		iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow ( need a color for this )
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
LABELV $196
LABELV $197
line 98
;96:	}
;97:
;98:	trap_R_Font_DrawString(	x,		// int ox
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
BORI4
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 0
NEI4 $207
ADDRLP4 16
CNSTI4 -1
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $207
ADDRLP4 16
ADDRFP4 24
INDIRI4
ASGNI4
LABELV $208
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 trap_R_Font_DrawString
CALLV
pop
line 106
;99:							y,		// int oy
;100:							text,	// const char *text
;101:							color,	// paletteRGBA_c c
;102:							iStyleOR | iFontIndex,	// const int iFontHandle
;103:							!limit?-1:limit,		// iCharLimit (-1 = none)
;104:							scale	// const float scale = 1.0f
;105:							);
;106:}
LABELV $195
endproc CG_Text_Paint 20 28
data
align 4
LABELV $210
byte 4 1
code
proc CG_DrawZoomMask 96 36
line 165
;107:
;108:/*
;109:qboolean CG_WorldCoordToScreenCoord(vec3_t worldCoord, int *x, int *y)
;110:
;111:  Take any world coord and convert it to a 2D virtual 640x480 screen coord
;112:*/
;113:/*
;114:qboolean CG_WorldCoordToScreenCoordFloat(vec3_t worldCoord, float *x, float *y)
;115:{
;116:	int	xcenter, ycenter;
;117:	vec3_t	local, transformed;
;118:
;119://	xcenter = cg.refdef.width / 2;//gives screen coords adjusted for resolution
;120://	ycenter = cg.refdef.height / 2;//gives screen coords adjusted for resolution
;121:	
;122:	//NOTE: did it this way because most draw functions expect virtual 640x480 coords
;123:	//	and adjust them for current resolution
;124:	xcenter = 640 / 2;//gives screen coords in virtual 640x480, to be adjusted when drawn
;125:	ycenter = 480 / 2;//gives screen coords in virtual 640x480, to be adjusted when drawn
;126:
;127:	VectorSubtract (worldCoord, cg.refdef.vieworg, local);
;128:
;129:	transformed[0] = DotProduct(local,vright);
;130:	transformed[1] = DotProduct(local,vup);
;131:	transformed[2] = DotProduct(local,vfwd);		
;132:
;133:	// Make sure Z is not negative.
;134:	if(transformed[2] < 0.01)
;135:	{
;136:		return qfalse;
;137:	}
;138:	// Simple convert to screen coords.
;139:	float xzi = xcenter / transformed[2] * (90.0/cg.refdef.fov_x);
;140:	float yzi = ycenter / transformed[2] * (90.0/cg.refdef.fov_y);
;141:
;142:	*x = xcenter + xzi * transformed[0];
;143:	*y = ycenter - yzi * transformed[1];
;144:
;145:	return qtrue;
;146:}
;147:
;148:qboolean CG_WorldCoordToScreenCoord( vec3_t worldCoord, int *x, int *y )
;149:{
;150:	float	xF, yF;
;151:	qboolean retVal = CG_WorldCoordToScreenCoordFloat( worldCoord, &xF, &yF );
;152:	*x = (int)xF;
;153:	*y = (int)yF;
;154:	return retVal;
;155:}
;156:*/
;157:
;158:/*
;159:================
;160:CG_DrawZoomMask
;161:
;162:================
;163:*/
;164:static void CG_DrawZoomMask( void )
;165:{
line 176
;166:	vec4_t		color1;
;167:	float		level;
;168:	static qboolean	flip = qtrue;
;169:
;170://	int ammo = cg_entities[0].gent->client->ps.ammo[weaponData[cent->currentState.weapon].ammoIndex];
;171:	float cx, cy;
;172://	int val[5];
;173:	float max, fi;
;174:
;175:	// Check for Binocular specific zooming since we'll want to render different bits in each case
;176:	if ( cg.predictedPlayerState.zoomMode == 2 )
ADDRGP4 cg+96+1332
INDIRI4
CNSTI4 2
NEI4 $211
line 177
;177:	{
line 182
;178:		int val, i;
;179:		float off;
;180:
;181:		// zoom level
;182:		level = (float)(80.0f - cg.predictedPlayerState.zoomFov) / 80.0f;
ADDRLP4 48
CNSTF4 1117782016
ASGNF4
ADDRLP4 32
ADDRLP4 48
INDIRF4
ADDRGP4 cg+96+1344
INDIRF4
SUBF4
ADDRLP4 48
INDIRF4
DIVF4
ASGNF4
line 185
;183:
;184:		// ...so we'll clamp it
;185:		if ( level < 0.0f )
ADDRLP4 32
INDIRF4
CNSTF4 0
GEF4 $217
line 186
;186:		{
line 187
;187:			level = 0.0f;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 188
;188:		}
ADDRGP4 $218
JUMPV
LABELV $217
line 189
;189:		else if ( level > 1.0f )
ADDRLP4 32
INDIRF4
CNSTF4 1065353216
LEF4 $219
line 190
;190:		{
line 191
;191:			level = 1.0f;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 192
;192:		}
LABELV $219
LABELV $218
line 195
;193:
;194:		// Using a magic number to convert the zoom level to scale amount
;195:		level *= 162.0f;
ADDRLP4 32
CNSTF4 1126301696
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
line 198
;196:
;197:		// draw blue tinted distortion mask, trying to make it as small as is necessary to fill in the viewable area
;198:		trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 199
;199:		CG_DrawPic( 34, 48, 570, 362, cgs.media.binocularStatic );
CNSTF4 1107820544
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1141800960
ARGF4
CNSTF4 1135935488
ARGF4
ADDRGP4 cgs+70296+540
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 202
;200:	
;201:		// Black out the area behind the numbers
;202:		trap_R_SetColor( colorTable[CT_BLACK]);
ADDRGP4 colorTable+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 203
;203:		CG_DrawPic( 212, 367, 200, 40, cgs.media.whiteShader );
CNSTF4 1129578496
ARGF4
CNSTF4 1136099328
ARGF4
CNSTF4 1128792064
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 206
;204:
;205:		// Numbers should be kind of greenish
;206:		color1[0] = 0.2f;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 207
;207:		color1[1] = 0.4f;
ADDRLP4 0+4
CNSTF4 1053609165
ASGNF4
line 208
;208:		color1[2] = 0.2f;
ADDRLP4 0+8
CNSTF4 1045220557
ASGNF4
line 209
;209:		color1[3] = 0.3f;
ADDRLP4 0+12
CNSTF4 1050253722
ASGNF4
line 210
;210:		trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 214
;211:
;212:		// Draw scrolling numbers, use intervals 10 units apart--sorry, this section of code is just kind of hacked
;213:		//	up with a bunch of magic numbers.....
;214:		val = ((int)((cg.refdefViewAngles[YAW] + 180) / 10)) * 10;
ADDRLP4 40
CNSTI4 10
ADDRGP4 cg+3984+4
INDIRF4
CNSTF4 1127481344
ADDF4
CNSTF4 1092616192
DIVF4
CVFI4 4
MULI4
ASGNI4
line 215
;215:		off = (cg.refdefViewAngles[YAW] + 180) - val;
ADDRLP4 44
ADDRGP4 cg+3984+4
INDIRF4
CNSTF4 1127481344
ADDF4
ADDRLP4 40
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 217
;216:
;217:		for ( i = -10; i < 30; i += 10 )
ADDRLP4 36
CNSTI4 -10
ASGNI4
LABELV $234
line 218
;218:		{
line 219
;219:			val -= 10;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 10
SUBI4
ASGNI4
line 221
;220:
;221:			if ( val < 0 )
ADDRLP4 40
INDIRI4
CNSTI4 0
GEI4 $238
line 222
;222:			{
line 223
;223:				val += 360;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 360
ADDI4
ASGNI4
line 224
;224:			}
LABELV $238
line 228
;225:
;226:			// we only want to draw the very far left one some of the time, if it's too far to the left it will
;227:			//	poke outside the mask.
;228:			if (( off > 3.0f && i == -10 ) || i > -10 )
ADDRLP4 44
INDIRF4
CNSTF4 1077936128
LEF4 $243
ADDRLP4 36
INDIRI4
CNSTI4 -10
EQI4 $242
LABELV $243
ADDRLP4 36
INDIRI4
CNSTI4 -10
LEI4 $240
LABELV $242
line 229
;229:			{
line 231
;230:				// draw the value, but add 200 just to bump the range up...arbitrary, so change it if you like
;231:				CG_DrawNumField( 155 + i * 10 + off * 10, 374, 3, val + 200, 24, 14, NUM_FONT_CHUNKY, qtrue );
CNSTI4 10
ADDRLP4 36
INDIRI4
MULI4
CNSTI4 155
ADDI4
CVIF4 4
CNSTF4 1092616192
ADDRLP4 44
INDIRF4
MULF4
ADDF4
CVFI4 4
ARGI4
CNSTI4 374
ARGI4
ADDRLP4 52
CNSTI4 3
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 200
ADDI4
ARGI4
CNSTI4 24
ARGI4
CNSTI4 14
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawNumField
CALLV
pop
line 232
;232:				CG_DrawPic( 245 + (i-1) * 10 + off * 10, 376, 6, 6, cgs.media.whiteShader );
ADDRLP4 56
CNSTI4 10
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
ADDRLP4 56
INDIRI4
SUBI4
CNSTI4 245
ADDI4
CVIF4 4
CNSTF4 1092616192
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ARGF4
CNSTF4 1136394240
ARGF4
ADDRLP4 60
CNSTF4 1086324736
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 233
;233:			}
LABELV $240
line 234
;234:		}
LABELV $235
line 217
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 30
LTI4 $234
line 236
;235:
;236:		CG_DrawPic( 212, 367, 200, 28, cgs.media.binocularOverlay );
CNSTF4 1129578496
ARGF4
CNSTF4 1136099328
ARGF4
CNSTF4 1128792064
ARGF4
CNSTF4 1105199104
ARGF4
ADDRGP4 cgs+70296+544
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 238
;237:
;238:		color1[0] = sin( cg.time * 0.01f ) * 0.5f + 0.5f;
CNSTF4 1008981770
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 52
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 52
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 239
;239:		color1[0] = color1[0] * color1[0];
ADDRLP4 56
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 56
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 240
;240:		color1[1] = color1[0];
ADDRLP4 0+4
ADDRLP4 0
INDIRF4
ASGNF4
line 241
;241:		color1[2] = color1[0];
ADDRLP4 0+8
ADDRLP4 0
INDIRF4
ASGNF4
line 242
;242:		color1[3] = 1.0f;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 244
;243:
;244:		trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 246
;245:
;246:		CG_DrawPic( 82, 94, 16, 16, cgs.media.binocularCircle );
CNSTF4 1118044160
ARGF4
CNSTF4 1119617024
ARGF4
ADDRLP4 60
CNSTF4 1098907648
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+70296+524
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 249
;247:
;248:		// Flickery color
;249:		color1[0] = 0.7f + crandom() * 0.1f;
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
CNSTF4 1036831949
CNSTF4 1073741824
ADDRLP4 64
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
CNSTF4 1060320051
ADDF4
ASGNF4
line 250
;250:		color1[1] = 0.8f + crandom() * 0.1f;
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
CNSTF4 1036831949
CNSTF4 1073741824
ADDRLP4 68
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
CNSTF4 1061997773
ADDF4
ASGNF4
line 251
;251:		color1[2] = 0.7f + crandom() * 0.1f;
ADDRLP4 72
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+8
CNSTF4 1036831949
CNSTF4 1073741824
ADDRLP4 72
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
CNSTF4 1060320051
ADDF4
ASGNF4
line 252
;252:		color1[3] = 1.0f;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 253
;253:		trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 255
;254:	
;255:		CG_DrawPic( 0, 0, 640, 480, cgs.media.binocularMask );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 76
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+70296+528
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 257
;256:
;257:		CG_DrawPic( 4, 282 - level, 16, 16, cgs.media.binocularArrow );
CNSTF4 1082130432
ARGF4
CNSTF4 1133314048
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 80
CNSTF4 1098907648
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRGP4 cgs+70296+532
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 260
;258:
;259:		// The top triangle bit randomly flips 
;260:		if ( flip )
ADDRGP4 $210
INDIRI4
CNSTI4 0
EQI4 $261
line 261
;261:		{
line 262
;262:			CG_DrawPic( 330, 60, -26, -30, cgs.media.binocularTri );
CNSTF4 1134886912
ARGF4
CNSTF4 1114636288
ARGF4
CNSTF4 3251634176
ARGF4
CNSTF4 3253731328
ARGF4
ADDRGP4 cgs+70296+536
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 263
;263:		}
ADDRGP4 $262
JUMPV
LABELV $261
line 265
;264:		else
;265:		{
line 266
;266:			CG_DrawPic( 307, 40, 26, 30, cgs.media.binocularTri );
CNSTF4 1134133248
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1104150528
ARGF4
CNSTF4 1106247680
ARGF4
ADDRGP4 cgs+70296+536
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 267
;267:		}
LABELV $262
line 269
;268:
;269:		if ( random() > 0.98f && ( cg.time & 1024 ))
ADDRLP4 84
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1065017672
LEF4 $212
ADDRGP4 cg+64
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $212
line 270
;270:		{
line 271
;271:			flip = !flip;
ADDRLP4 92
ADDRGP4 $210
ASGNP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $271
ADDRLP4 88
CNSTI4 1
ASGNI4
ADDRGP4 $272
JUMPV
LABELV $271
ADDRLP4 88
CNSTI4 0
ASGNI4
LABELV $272
ADDRLP4 92
INDIRP4
ADDRLP4 88
INDIRI4
ASGNI4
line 272
;272:		}
line 273
;273:	}
ADDRGP4 $212
JUMPV
LABELV $211
line 274
;274:	else if ( cg.predictedPlayerState.zoomMode)
ADDRGP4 cg+96+1332
INDIRI4
CNSTI4 0
EQI4 $273
line 275
;275:	{
line 277
;276:		// disruptor zoom mode
;277:		level = (float)(50.0f - zoomFov) / 50.0f;//(float)(80.0f - zoomFov) / 80.0f;
ADDRLP4 36
CNSTF4 1112014848
ASGNF4
ADDRLP4 32
ADDRLP4 36
INDIRF4
ADDRGP4 zoomFov
INDIRF4
SUBF4
ADDRLP4 36
INDIRF4
DIVF4
ASGNF4
line 280
;278:
;279:		// ...so we'll clamp it
;280:		if ( level < 0.0f )
ADDRLP4 32
INDIRF4
CNSTF4 0
GEF4 $277
line 281
;281:		{
line 282
;282:			level = 0.0f;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 283
;283:		}
ADDRGP4 $278
JUMPV
LABELV $277
line 284
;284:		else if ( level > 1.0f )
ADDRLP4 32
INDIRF4
CNSTF4 1065353216
LEF4 $279
line 285
;285:		{
line 286
;286:			level = 1.0f;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 287
;287:		}
LABELV $279
LABELV $278
line 290
;288:
;289:		// Using a magic number to convert the zoom level to a rotation amount that correlates more or less with the zoom artwork. 
;290:		level *= 103.0f;
ADDRLP4 32
CNSTF4 1120796672
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
line 293
;291:
;292:		// Draw target mask
;293:		trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 294
;294:		CG_DrawPic( 0, 0, 640, 480, cgs.media.disruptorMask );
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+70296+504
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 297
;295:
;296:		// apparently 99.0f is the full zoom level
;297:		if ( level >= 99 )
ADDRLP4 32
INDIRF4
CNSTF4 1120272384
LTF4 $284
line 298
;298:		{
line 300
;299:			// Fully zoomed, so make the rotating insert pulse
;300:			color1[0] = 1.0f; 
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 301
;301:			color1[1] = 1.0f;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 302
;302:			color1[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 303
;303:			color1[3] = 0.7f + sin( cg.time * 0.01f ) * 0.3f;
CNSTF4 1008981770
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 44
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
CNSTF4 1050253722
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1060320051
ADDF4
ASGNF4
line 305
;304:
;305:			trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 306
;306:		}
LABELV $284
line 309
;307:
;308:		// Draw rotating insert
;309:		CG_DrawRotatePic2( 320, 240, 640, 480, -level, cgs.media.disruptorInsert );
CNSTF4 1134559232
ARGF4
CNSTF4 1131413504
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 32
INDIRF4
NEGF4
ARGF4
ADDRGP4 cgs+70296+508
INDIRI4
ARGI4
ADDRGP4 CG_DrawRotatePic2
CALLV
pop
line 337
;310:
;311:		// Increase the light levels under the center of the target
;312://		CG_DrawPic( 198, 118, 246, 246, cgs.media.disruptorLight );
;313:
;314:		// weirdness.....converting ammo to a base five number scale just to be geeky.
;315:/*		val[0] = ammo % 5;
;316:		val[1] = (ammo / 5) % 5;
;317:		val[2] = (ammo / 25) % 5;
;318:		val[3] = (ammo / 125) % 5;
;319:		val[4] = (ammo / 625) % 5;
;320:		
;321:		color1[0] = 0.2f;
;322:		color1[1] = 0.55f + crandom() * 0.1f;
;323:		color1[2] = 0.5f + crandom() * 0.1f;
;324:		color1[3] = 1.0f;
;325:		trap_R_SetColor( color1 );
;326:
;327:		for ( int t = 0; t < 5; t++ )
;328:		{
;329:			cx = 320 + sin( (t*10+45)/57.296f ) * 192;
;330:			cy = 240 + cos( (t*10+45)/57.296f ) * 192;
;331:
;332:			CG_DrawRotatePic2( cx, cy, 24, 38, 45 - t * 10, trap_R_RegisterShader( va("gfx/2d/char%d",val[4-t] )));
;333:		}
;334:*/
;335:		//max = ( cg_entities[0].gent->health / 100.0f );
;336:
;337:		max = cg.snap->ps.ammo[weaponData[WP_DISRUPTOR].ammoIndex] / (float)ammoData[weaponData[WP_DISRUPTOR].ammoIndex].max;
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 28
ADDRGP4 weaponData+280
INDIRI4
ADDRLP4 44
INDIRI4
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 452
ADDP4
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 weaponData+280
INDIRI4
ADDRLP4 44
INDIRI4
LSHI4
ADDRGP4 ammoData
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 338
;338:		if ( max > 1.0f )
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $295
line 339
;339:		{
line 340
;340:			max = 1.0f;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 341
;341:		}
LABELV $295
line 343
;342:
;343:		color1[0] = (1.0f - max) * 2.0f; 
ADDRLP4 0
CNSTF4 1073741824
CNSTF4 1065353216
ADDRLP4 28
INDIRF4
SUBF4
MULF4
ASGNF4
line 344
;344:		color1[1] = max * 1.5f;
ADDRLP4 0+4
CNSTF4 1069547520
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 345
;345:		color1[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 346
;346:		color1[3] = 1.0f;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 349
;347:
;348:		// If we are low on health, make us flash
;349:		if ( max < 0.15f && ( cg.time & 512 ))
ADDRLP4 28
INDIRF4
CNSTF4 1041865114
GEF4 $300
ADDRGP4 cg+64
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $300
line 350
;350:		{
line 351
;351:			VectorClear( color1 );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
ASGNF4
line 352
;352:		}
LABELV $300
line 354
;353:
;354:		if ( color1[0] > 1.0f )
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
LEF4 $305
line 355
;355:		{
line 356
;356:			color1[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 357
;357:		}
LABELV $305
line 359
;358:
;359:		if ( color1[1] > 1.0f )
ADDRLP4 0+4
INDIRF4
CNSTF4 1065353216
LEF4 $307
line 360
;360:		{
line 361
;361:			color1[1] = 1.0f;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 362
;362:		}
LABELV $307
line 364
;363:
;364:		trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 366
;365:
;366:		max *= 58.0f;
ADDRLP4 28
CNSTF4 1114112000
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 368
;367:
;368:		for (fi = 18.5f; fi <= 18.5f + max; fi+= 3 ) // going from 15 to 45 degrees, with 5 degree increments
ADDRLP4 16
CNSTF4 1100218368
ASGNF4
ADDRGP4 $314
JUMPV
LABELV $311
line 369
;369:		{
line 370
;370:			cx = 320 + sin( (fi+90.0f)/57.296f ) * 190;
ADDRLP4 16
INDIRF4
CNSTF4 1119092736
ADDF4
CNSTF4 1113927451
DIVF4
ARGF4
ADDRLP4 48
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 20
CNSTF4 1128136704
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1134559232
ADDF4
ASGNF4
line 371
;371:			cy = 240 + cos( (fi+90.0f)/57.296f ) * 190;
ADDRLP4 16
INDIRF4
CNSTF4 1119092736
ADDF4
CNSTF4 1113927451
DIVF4
ARGF4
ADDRLP4 52
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 24
CNSTF4 1128136704
ADDRLP4 52
INDIRF4
MULF4
CNSTF4 1131413504
ADDF4
ASGNF4
line 373
;372:
;373:			CG_DrawRotatePic2( cx, cy, 12, 24, 90 - fi, cgs.media.disruptorInsertTick );
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1094713344
ARGF4
CNSTF4 1103101952
ARGF4
CNSTF4 1119092736
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
ADDRGP4 cgs+70296+516
INDIRI4
ARGI4
ADDRGP4 CG_DrawRotatePic2
CALLV
pop
line 374
;374:		}
LABELV $312
line 368
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1077936128
ADDF4
ASGNF4
LABELV $314
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
CNSTF4 1100218368
ADDF4
LEF4 $311
line 376
;375:
;376:		if ( cg.predictedPlayerState.weaponstate == WEAPON_CHARGING_ALT )
ADDRGP4 cg+96+152
INDIRI4
CNSTI4 5
NEI4 $317
line 377
;377:		{
line 378
;378:			trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 381
;379:
;380:			// draw the charge level
;381:			max = ( cg.time - cg.predictedPlayerState.weaponChargeTime ) / ( 50.0f * 30.0f ); // bad hardcodedness 50 is disruptor charge unit and 30 is max charge units allowed.
ADDRLP4 28
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+96+48
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1153138688
DIVF4
ASGNF4
line 383
;382:
;383:			if ( max > 1.0f )
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $325
line 384
;384:			{
line 385
;385:				max = 1.0f;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 386
;386:			}
LABELV $325
line 388
;387:
;388:			trap_R_DrawStretchPic(257, 435, 134*max, 34, 0, 0, max, 1, cgs.media.disruptorChargeShader);
CNSTF4 1132494848
ARGF4
CNSTF4 1138327552
ARGF4
CNSTF4 1124466688
ADDRLP4 28
INDIRF4
MULF4
ARGF4
CNSTF4 1107820544
ARGF4
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 cgs+70296+520
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 389
;389:		}
LABELV $317
line 393
;390://		trap_R_SetColor( colorTable[CT_WHITE] );
;391://		CG_DrawPic( 0, 0, 640, 480, cgs.media.disruptorMask );
;392:
;393:	}
LABELV $273
LABELV $212
line 394
;394:}
LABELV $209
endproc CG_DrawZoomMask 96 36
export CG_Draw3DModel
proc CG_Draw3DModel 584 12
line 403
;395:
;396:
;397:/*
;398:================
;399:CG_Draw3DModel
;400:
;401:================
;402:*/
;403:void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
line 407
;404:	refdef_t		refdef;
;405:	refEntity_t		ent;
;406:
;407:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRLP4 580
CNSTI4 0
ASGNI4
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 580
INDIRI4
EQI4 $334
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 580
INDIRI4
NEI4 $330
LABELV $334
line 408
;408:		return;
ADDRGP4 $329
JUMPV
LABELV $330
line 411
;409:	}
;410:
;411:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 413
;412:
;413:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 414
;414:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 415
;415:	VectorCopy( origin, ent.origin );
ADDRLP4 368+52
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 416
;416:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 417
;417:	ent.customSkin = skin;
ADDRLP4 368+136
ADDRFP4 20
INDIRI4
ASGNI4
line 418
;418:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 420
;419:
;420:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 422
;421:
;422:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 424
;423:
;424:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 425
;425:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 427
;426:
;427:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 428
;428:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 429
;429:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 430
;430:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 432
;431:
;432:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 434
;433:
;434:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 435
;435:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 436
;436:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 437
;437:}
LABELV $329
endproc CG_Draw3DModel 584 12
export CG_DrawHead
proc CG_DrawHead 4 20
line 447
;438:
;439:/*
;440:================
;441:CG_DrawHead
;442:
;443:Used for both the status bar and the scoreboard
;444:================
;445:*/
;446:void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles ) 
;447:{
line 450
;448:	clientInfo_t	*ci;
;449:
;450:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 788
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 452
;451:
;452:	CG_DrawPic( x, y, w, h, ci->modelIcon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 455
;453:
;454:	// if they are deferred, draw a cross out
;455:	if ( ci->deferred ) 
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $351
line 456
;456:	{
line 457
;457:		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 cgs+70296+108
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 458
;458:	}
LABELV $351
line 459
;459:}
LABELV $349
endproc CG_DrawHead 4 20
export CG_DrawFlagModel
proc CG_DrawFlagModel 72 32
line 468
;460:
;461:/*
;462:================
;463:CG_DrawFlagModel
;464:
;465:Used for both the status bar and the scoreboard
;466:================
;467:*/
;468:void CG_DrawFlagModel( float x, float y, float w, float h, int team, qboolean force2D ) {
line 475
;469:	qhandle_t		cm;
;470:	float			len;
;471:	vec3_t			origin, angles;
;472:	vec3_t			mins, maxs;
;473:	qhandle_t		handle;
;474:
;475:	if ( !force2D && cg_draw3dIcons.integer ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $356
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $356
line 477
;476:
;477:		VectorClear( angles );
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 64
INDIRF4
ASGNF4
line 479
;478:
;479:		cm = cgs.media.redFlagModel;
ADDRLP4 48
ADDRGP4 cgs+70296+36
INDIRI4
ASGNI4
line 482
;480:
;481:		// offset the origin y and z to center the flag
;482:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 484
;483:
;484:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 12+8
CNSTF4 3204448256
ADDRLP4 24+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 485
;485:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 12+4
CNSTF4 1056964608
ADDRLP4 24+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 489
;486:
;487:		// calculate distance so the flag nearly fills the box
;488:		// assume heads are taller than wide
;489:		len = 0.5 * ( maxs[2] - mins[2] );		
ADDRLP4 52
CNSTF4 1056964608
ADDRLP4 36+8
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 490
;490:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 12
ADDRLP4 52
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 492
;491:
;492:		angles[YAW] = 60 * sin( cg.time / 2000.0 );;
ADDRGP4 cg+64
INDIRI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1114636288
ADDRLP4 68
INDIRF4
MULF4
ASGNF4
line 494
;493:
;494:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $373
line 495
;495:			handle = cgs.media.redFlagModel;
ADDRLP4 56
ADDRGP4 cgs+70296+36
INDIRI4
ASGNI4
line 496
;496:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $374
JUMPV
LABELV $373
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $377
line 497
;497:			handle = cgs.media.blueFlagModel;
ADDRLP4 56
ADDRGP4 cgs+70296+40
INDIRI4
ASGNI4
line 498
;498:		} else if( team == TEAM_FREE ) {
ADDRGP4 $378
JUMPV
LABELV $377
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $355
line 499
;499:			handle = cgs.media.neutralFlagModel;
ADDRLP4 56
ADDRGP4 cgs+70296+44
INDIRI4
ASGNI4
line 500
;500:		} else {
line 501
;501:			return;
LABELV $382
LABELV $378
LABELV $374
line 503
;502:		}
;503:		CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 504
;504:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $357
JUMPV
LABELV $356
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $385
line 507
;505:		gitem_t *item;
;506:
;507:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $388
line 508
;508:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 509
;509:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $389
JUMPV
LABELV $388
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $390
line 510
;510:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 5
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 511
;511:		} else if( team == TEAM_FREE ) {
ADDRGP4 $391
JUMPV
LABELV $390
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $355
line 512
;512:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 6
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 513
;513:		} else {
line 514
;514:			return;
LABELV $393
LABELV $391
LABELV $389
line 516
;515:		}
;516:		if (item) {
ADDRLP4 64
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $394
line 517
;517:		  CG_DrawPic( x, y, w, h, cg_items[ ITEM_INDEX(item) ].icon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 518
;518:		}
LABELV $394
line 519
;519:	}
LABELV $385
LABELV $357
line 520
;520:}
LABELV $355
endproc CG_DrawFlagModel 72 32
export DrawAmmo
proc DrawAmmo 8 0
line 528
;521:
;522:/*
;523:================
;524:DrawAmmo
;525:================
;526:*/
;527:void DrawAmmo()
;528:{
line 531
;529:	int x, y;
;530:
;531:	x = SCREEN_WIDTH-80;
ADDRLP4 0
CNSTI4 560
ASGNI4
line 532
;532:	y = SCREEN_HEIGHT-80;
ADDRLP4 4
CNSTI4 400
ASGNI4
line 534
;533:
;534:}
LABELV $397
endproc DrawAmmo 8 0
export CG_DrawHUDLeftFrame1
proc CG_DrawHUDLeftFrame1 4 20
line 542
;535:
;536:/*
;537:================
;538:CG_DrawHUDLeftFrame1
;539:================
;540:*/
;541:void CG_DrawHUDLeftFrame1(int x,int y)
;542:{
line 544
;543:	// Inner gray wire frame
;544:	trap_R_SetColor( hudTintColor );
ADDRGP4 hudTintColor
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 545
;545:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDInnerLeft );			
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
CNSTF4 1117782016
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1244
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 546
;546:}
LABELV $398
endproc CG_DrawHUDLeftFrame1 4 20
export CG_DrawHUDLeftFrame2
proc CG_DrawHUDLeftFrame2 4 20
line 554
;547:
;548:/*
;549:================
;550:CG_DrawHUDLeftFrame2
;551:================
;552:*/
;553:void CG_DrawHUDLeftFrame2(int x,int y)
;554:{
line 556
;555:	// Inner gray wire frame
;556:	trap_R_SetColor( hudTintColor );
ADDRGP4 hudTintColor
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 557
;557:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDLeftFrame );		// Metal frame
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
CNSTF4 1117782016
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1160
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 558
;558:}
LABELV $401
endproc CG_DrawHUDLeftFrame2 4 20
export DrawHealthArmor
proc DrawHealthArmor 72 32
line 566
;559:
;560:/*
;561:================
;562:DrawHealthArmor
;563:================
;564:*/
;565:void DrawHealthArmor(int x,int y)
;566:{
line 574
;567:	vec4_t calcColor;
;568:	float	armorPercent,hold,healthPercent;
;569:	playerState_t	*ps;
;570:
;571:	int healthAmt;
;572:	int armorAmt;
;573:
;574:	ps = &cg.snap->ps;
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 576
;575:
;576:	healthAmt = ps->stats[STAT_HEALTH];
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 577
;577:	armorAmt = ps->stats[STAT_ARMOR];
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 579
;578:
;579:	if (healthAmt > ps->stats[STAT_MAX_HEALTH])
ADDRLP4 32
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $406
line 580
;580:	{
line 581
;581:		healthAmt = ps->stats[STAT_MAX_HEALTH];
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 582
;582:	}
LABELV $406
line 584
;583:
;584:	if (armorAmt > 100)
ADDRLP4 28
INDIRI4
CNSTI4 100
LEI4 $408
line 585
;585:	{
line 586
;586:		armorAmt = 100;
ADDRLP4 28
CNSTI4 100
ASGNI4
line 587
;587:	}
LABELV $408
line 589
;588:
;589:	trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 590
;590:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDLeftFrame );		// Circular black background
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
CNSTF4 1117782016
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1160
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 593
;591:
;592:	//	Outer Armor circular
;593:	memcpy(calcColor, colorTable[CT_GREEN], sizeof(vec4_t));
ADDRLP4 0
ARGP4
ADDRGP4 colorTable+48
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 595
;594:
;595:	hold = armorAmt-(ps->stats[STAT_MAX_HEALTH]/2);
ADDRLP4 36
ADDRLP4 28
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ASGNF4
line 596
;596:	armorPercent = (float) hold/(ps->stats[STAT_MAX_HEALTH]/2);
ADDRLP4 16
ADDRLP4 36
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
DIVF4
ASGNF4
line 597
;597:	if (armorPercent <0)
ADDRLP4 16
INDIRF4
CNSTF4 0
GEF4 $414
line 598
;598:	{
line 599
;599:		armorPercent = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 600
;600:	}
LABELV $414
line 601
;601:	calcColor[0] *= armorPercent;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 602
;602:	calcColor[1] *= armorPercent;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 603
;603:	calcColor[2] *= armorPercent;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 604
;604:	trap_R_SetColor( calcColor);					
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 605
;605:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDArmor1 );			
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTF4 1117782016
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1164
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 608
;606:
;607:	// Inner Armor circular
;608:	if (armorPercent>0)
ADDRLP4 16
INDIRF4
CNSTF4 0
LEF4 $420
line 609
;609:	{
line 610
;610:		armorPercent = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 611
;611:	}
ADDRGP4 $421
JUMPV
LABELV $420
line 613
;612:	else
;613:	{
line 614
;614:		armorPercent = (float) armorAmt/(ps->stats[STAT_MAX_HEALTH]/2);
ADDRLP4 16
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
DIVF4
ASGNF4
line 615
;615:	}
LABELV $421
line 616
;616:	memcpy(calcColor, colorTable[CT_GREEN], sizeof(vec4_t));
ADDRLP4 0
ARGP4
ADDRGP4 colorTable+48
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 617
;617:	calcColor[0] *= armorPercent;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 618
;618:	calcColor[1] *= armorPercent;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 619
;619:	calcColor[2] *= armorPercent;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 620
;620:	trap_R_SetColor( calcColor);					
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 621
;621:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDArmor2 );			//	Inner Armor circular
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 48
CNSTF4 1117782016
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1168
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 623
;622:
;623:	if (ps->stats[STAT_ARMOR])	// Is there armor? Draw the HUD Armor TIC
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $427
line 624
;624:	{
line 626
;625:		// Make tic flash if inner armor is at 50% (25% of full armor)
;626:		if (armorPercent<.5)		// Do whatever the flash timer says
ADDRLP4 16
INDIRF4
CNSTF4 1056964608
GEF4 $429
line 627
;627:		{
line 628
;628:			if (cg.HUDTickFlashTime < cg.time)			// Flip at the same time
ADDRGP4 cg+13764
INDIRF4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
GEF4 $428
line 629
;629:			{
line 630
;630:				cg.HUDTickFlashTime = cg.time + 100;
ADDRGP4 cg+13764
ADDRGP4 cg+64
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 631
;631:				if (cg.HUDArmorFlag)
ADDRGP4 cg+13768
INDIRI4
CNSTI4 0
EQI4 $437
line 632
;632:				{
line 633
;633:					cg.HUDArmorFlag = qfalse;
ADDRGP4 cg+13768
CNSTI4 0
ASGNI4
line 634
;634:				}
ADDRGP4 $428
JUMPV
LABELV $437
line 636
;635:				else
;636:				{
line 637
;637:					cg.HUDArmorFlag = qtrue;
ADDRGP4 cg+13768
CNSTI4 1
ASGNI4
line 638
;638:				}
line 639
;639:			}
line 640
;640:		}
ADDRGP4 $428
JUMPV
LABELV $429
line 642
;641:		else
;642:		{
line 643
;643:			cg.HUDArmorFlag=qtrue;
ADDRGP4 cg+13768
CNSTI4 1
ASGNI4
line 644
;644:		}
line 645
;645:	}
ADDRGP4 $428
JUMPV
LABELV $427
line 647
;646:	else						// No armor? Don't show it.
;647:	{
line 648
;648:		cg.HUDArmorFlag=qfalse;
ADDRGP4 cg+13768
CNSTI4 0
ASGNI4
line 649
;649:	}
LABELV $428
line 651
;650:
;651:	memcpy(calcColor, colorTable[CT_RED], sizeof(vec4_t));
ADDRLP4 0
ARGP4
ADDRGP4 colorTable+32
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 652
;652:	healthPercent = (float) healthAmt/ps->stats[STAT_MAX_HEALTH];
ADDRLP4 24
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 653
;653:	calcColor[0] *= healthPercent;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 654
;654:	calcColor[1] *= healthPercent;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 655
;655:	calcColor[2] *= healthPercent;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 656
;656:	trap_R_SetColor( calcColor);					
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 657
;657:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDHealth );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
CNSTF4 1117782016
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1172
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 660
;658:
;659:	// Make tic flash if health is at 20% of full
;660:	if (healthPercent>.20)
ADDRLP4 24
INDIRF4
CNSTF4 1045220557
LEF4 $449
line 661
;661:	{
line 662
;662:		cg.HUDHealthFlag=qtrue;
ADDRGP4 cg+13772
CNSTI4 1
ASGNI4
line 663
;663:	}
ADDRGP4 $450
JUMPV
LABELV $449
line 665
;664:	else
;665:	{
line 666
;666:		if (cg.HUDTickFlashTime < cg.time)			// Flip at the same time
ADDRGP4 cg+13764
INDIRF4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
GEF4 $452
line 667
;667:		{
line 668
;668:			cg.HUDTickFlashTime = cg.time + 100;
ADDRGP4 cg+13764
ADDRGP4 cg+64
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 670
;669:
;670:			if ((armorPercent>0) && (armorPercent<.5))		// Keep the tics in sync if flashing
ADDRLP4 16
INDIRF4
CNSTF4 0
LEF4 $458
ADDRLP4 16
INDIRF4
CNSTF4 1056964608
GEF4 $458
line 671
;671:			{
line 672
;672:				cg.HUDHealthFlag=cg.HUDArmorFlag;
ADDRGP4 cg+13772
ADDRGP4 cg+13768
INDIRI4
ASGNI4
line 673
;673:			}
ADDRGP4 $459
JUMPV
LABELV $458
line 675
;674:			else
;675:			{
line 676
;676:				if (cg.HUDHealthFlag)
ADDRGP4 cg+13772
INDIRI4
CNSTI4 0
EQI4 $462
line 677
;677:				{
line 678
;678:					cg.HUDHealthFlag = qfalse;
ADDRGP4 cg+13772
CNSTI4 0
ASGNI4
line 679
;679:				}
ADDRGP4 $463
JUMPV
LABELV $462
line 681
;680:				else
;681:				{
line 682
;682:					cg.HUDHealthFlag = qtrue;
ADDRGP4 cg+13772
CNSTI4 1
ASGNI4
line 683
;683:				}
LABELV $463
line 684
;684:			}
LABELV $459
line 685
;685:		}
LABELV $452
line 686
;686:	}
LABELV $450
line 689
;687:
;688:	// Draw the ticks
;689:	if (cg.HUDHealthFlag)
ADDRGP4 cg+13772
INDIRI4
CNSTI4 0
EQI4 $467
line 690
;690:	{
line 691
;691:		trap_R_SetColor( colorTable[CT_RED] );					
ADDRGP4 colorTable+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 692
;692:		CG_DrawPic(   x, y, 80, 80, cgs.media.HUDHealthTic );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 56
CNSTF4 1117782016
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1176
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 693
;693:	}
LABELV $467
line 695
;694:
;695:	if (cg.HUDArmorFlag)
ADDRGP4 cg+13768
INDIRI4
CNSTI4 0
EQI4 $473
line 696
;696:	{
line 697
;697:		trap_R_SetColor( colorTable[CT_GREEN] );					
ADDRGP4 colorTable+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 698
;698:		CG_DrawPic(   x, y, 80, 80, cgs.media.HUDArmorTic );		//	
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 56
CNSTF4 1117782016
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1180
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 699
;699:	}
LABELV $473
line 701
;700:
;701:	trap_R_SetColor(hudTintColor);
ADDRGP4 hudTintColor
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 702
;702:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDLeftStatic );		//	
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 56
CNSTF4 1117782016
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1184
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 704
;703:
;704:	trap_R_SetColor( colorTable[CT_RED] );	
ADDRGP4 colorTable+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 705
;705:	CG_DrawNumField (x + 16, y + 40, 3, ps->stats[STAT_HEALTH], 14, 18, 
ADDRFP4 0
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 40
ADDI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ARGI4
CNSTI4 14
ARGI4
CNSTI4 18
ARGI4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawNumField
CALLV
pop
line 708
;706:		NUM_FONT_SMALL,qfalse);
;707:
;708:	trap_R_SetColor( colorTable[CT_GREEN] );	
ADDRGP4 colorTable+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 709
;709:	CG_DrawNumField (x + 18 + 14, y + 40 + 14, 3, ps->stats[STAT_ARMOR], 14, 18, 
ADDRLP4 60
CNSTI4 18
ASGNI4
ADDRLP4 64
CNSTI4 14
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDI4
ADDRLP4 64
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 40
ADDI4
ADDRLP4 64
INDIRI4
ADDI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawNumField
CALLV
pop
line 712
;710:		NUM_FONT_SMALL,qfalse);
;711:
;712:	trap_R_SetColor(hudTintColor );
ADDRGP4 hudTintColor
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 713
;713:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDLeft );			// Metal frame
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
CNSTF4 1117782016
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1188
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 714
;714:}
LABELV $404
endproc DrawHealthArmor 72 32
export CG_DrawHealth
proc CG_DrawHealth 36 32
line 722
;715:
;716:/*
;717:================
;718:CG_DrawHealth
;719:================
;720:*/
;721:void CG_DrawHealth(int x,int y)
;722:{
line 728
;723:	vec4_t calcColor;
;724:	float	healthPercent;
;725:	playerState_t	*ps;
;726:	int healthAmt;
;727:
;728:	ps = &cg.snap->ps;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 730
;729:
;730:	healthAmt = ps->stats[STAT_HEALTH];
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 732
;731:
;732:	if (healthAmt > ps->stats[STAT_MAX_HEALTH])
ADDRLP4 24
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $487
line 733
;733:	{
line 734
;734:		healthAmt = ps->stats[STAT_MAX_HEALTH];
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 735
;735:	}
LABELV $487
line 737
;736:
;737:	memcpy(calcColor, colorTable[CT_HUD_RED], sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRGP4 colorTable+1008
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 738
;738:	healthPercent = (float) healthAmt/ps->stats[STAT_MAX_HEALTH];
ADDRLP4 20
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 739
;739:	calcColor[0] *= healthPercent;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 740
;740:	calcColor[1] *= healthPercent;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 741
;741:	calcColor[2] *= healthPercent;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 742
;742:	trap_R_SetColor( calcColor);					
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 743
;743:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDHealth );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
CNSTF4 1117782016
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1172
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 746
;744:
;745:	// Draw the ticks
;746:	if (cg.HUDHealthFlag)
ADDRGP4 cg+13772
INDIRI4
CNSTI4 0
EQI4 $494
line 747
;747:	{
line 748
;748:		trap_R_SetColor( colorTable[CT_HUD_RED] );					
ADDRGP4 colorTable+1008
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 749
;749:		CG_DrawPic(   x, y, 80, 80, cgs.media.HUDHealthTic );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
CNSTF4 1117782016
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1176
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 750
;750:	}
LABELV $494
line 752
;751:
;752:	trap_R_SetColor( colorTable[CT_HUD_RED] );	
ADDRGP4 colorTable+1008
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 753
;753:	CG_DrawNumField (x + 16, y + 40, 3, ps->stats[STAT_HEALTH], 6, 12, 
ADDRFP4 0
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 40
ADDI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 12
ARGI4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawNumField
CALLV
pop
line 756
;754:		NUM_FONT_SMALL,qfalse);
;755:
;756:}
LABELV $485
endproc CG_DrawHealth 36 32
export CG_DrawArmor
proc CG_DrawArmor 44 32
line 764
;757:
;758:/*
;759:================
;760:CG_DrawArmor
;761:================
;762:*/
;763:void CG_DrawArmor(int x,int y)
;764:{
line 770
;765:	vec4_t			calcColor;
;766:	float			armorPercent,hold;
;767:	playerState_t	*ps;
;768:	int				armor;
;769:
;770:	ps = &cg.snap->ps;
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 773
;771:
;772:	//	Outer Armor circular
;773:	memcpy(calcColor, colorTable[CT_HUD_GREEN], sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRGP4 colorTable+992
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 775
;774:
;775:	armor =ps->stats[STAT_ARMOR];
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 777
;776:	
;777:	if (armor> ps->stats[STAT_MAX_HEALTH])
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $504
line 778
;778:	{
line 779
;779:		armor = ps->stats[STAT_MAX_HEALTH];
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 780
;780:	}
LABELV $504
line 782
;781:
;782:	hold = armor-(ps->stats[STAT_MAX_HEALTH]/2);
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ASGNF4
line 783
;783:	armorPercent = (float) hold/(ps->stats[STAT_MAX_HEALTH]/2);
ADDRLP4 0
ADDRLP4 28
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
DIVF4
ASGNF4
line 784
;784:	if (armorPercent <0)
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $506
line 785
;785:	{
line 786
;786:		armorPercent = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 787
;787:	}
LABELV $506
line 788
;788:	calcColor[0] *= armorPercent;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 789
;789:	calcColor[1] *= armorPercent;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 790
;790:	calcColor[2] *= armorPercent;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 791
;791:	trap_R_SetColor( calcColor);					
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 792
;792:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDArmor1 );			
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
CNSTF4 1117782016
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1164
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 795
;793:
;794:	// Inner Armor circular
;795:	if (armorPercent>0)
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $512
line 796
;796:	{
line 797
;797:		armorPercent = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 798
;798:	}
ADDRGP4 $513
JUMPV
LABELV $512
line 800
;799:	else
;800:	{
line 801
;801:		armorPercent = (float) ps->stats[STAT_ARMOR]/(ps->stats[STAT_MAX_HEALTH]/2);
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
DIVF4
ASGNF4
line 802
;802:	}
LABELV $513
line 803
;803:	memcpy(calcColor, colorTable[CT_HUD_GREEN], sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRGP4 colorTable+992
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 804
;804:	calcColor[0] *= armorPercent;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 805
;805:	calcColor[1] *= armorPercent;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 806
;806:	calcColor[2] *= armorPercent;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 807
;807:	trap_R_SetColor( calcColor);					
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 808
;808:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDArmor2 );			//	Inner Armor circular
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
CNSTF4 1117782016
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1168
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 810
;809:
;810:	if (ps->stats[STAT_ARMOR])	// Is there armor? Draw the HUD Armor TIC
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $519
line 811
;811:	{
line 813
;812:		// Make tic flash if inner armor is at 50% (25% of full armor)
;813:		if (armorPercent<.5)		// Do whatever the flash timer says
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GEF4 $521
line 814
;814:		{
line 815
;815:			if (cg.HUDTickFlashTime < cg.time)			// Flip at the same time
ADDRGP4 cg+13764
INDIRF4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
GEF4 $520
line 816
;816:			{
line 817
;817:				cg.HUDTickFlashTime = cg.time + 100;
ADDRGP4 cg+13764
ADDRGP4 cg+64
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 818
;818:				if (cg.HUDArmorFlag)
ADDRGP4 cg+13768
INDIRI4
CNSTI4 0
EQI4 $529
line 819
;819:				{
line 820
;820:					cg.HUDArmorFlag = qfalse;
ADDRGP4 cg+13768
CNSTI4 0
ASGNI4
line 821
;821:				}
ADDRGP4 $520
JUMPV
LABELV $529
line 823
;822:				else
;823:				{
line 824
;824:					cg.HUDArmorFlag = qtrue;
ADDRGP4 cg+13768
CNSTI4 1
ASGNI4
line 825
;825:				}
line 826
;826:			}
line 827
;827:		}
ADDRGP4 $520
JUMPV
LABELV $521
line 829
;828:		else
;829:		{
line 830
;830:			cg.HUDArmorFlag=qtrue;
ADDRGP4 cg+13768
CNSTI4 1
ASGNI4
line 831
;831:		}
line 832
;832:	}
ADDRGP4 $520
JUMPV
LABELV $519
line 834
;833:	else						// No armor? Don't show it.
;834:	{
line 835
;835:		cg.HUDArmorFlag=qfalse;
ADDRGP4 cg+13768
CNSTI4 0
ASGNI4
line 836
;836:	}
LABELV $520
line 838
;837:
;838:	if (cg.HUDArmorFlag)
ADDRGP4 cg+13768
INDIRI4
CNSTI4 0
EQI4 $536
line 839
;839:	{
line 840
;840:		trap_R_SetColor( colorTable[CT_HUD_GREEN] );					
ADDRGP4 colorTable+992
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 841
;841:		CG_DrawPic(   x, y, 80, 80, cgs.media.HUDArmorTic );		
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
CNSTF4 1117782016
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1180
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 842
;842:	}
LABELV $536
line 844
;843:
;844:	trap_R_SetColor( colorTable[CT_HUD_GREEN] );	
ADDRGP4 colorTable+992
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 845
;845:	CG_DrawNumField (x + 18 + 14, y + 40 + 14, 3, ps->stats[STAT_ARMOR], 6, 12, 
ADDRLP4 40
CNSTI4 14
ASGNI4
ADDRFP4 0
INDIRI4
CNSTI4 18
ADDI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 40
ADDI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 12
ARGI4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawNumField
CALLV
pop
line 848
;846:		NUM_FONT_SMALL,qfalse);
;847:
;848:}
LABELV $501
endproc CG_DrawArmor 44 32
export CG_DrawHUDRightFrame1
proc CG_DrawHUDRightFrame1 4 20
line 856
;849:
;850:/*
;851:================
;852:CG_DrawHUDRightFrame1
;853:================
;854:*/
;855:void CG_DrawHUDRightFrame1(int x,int y)
;856:{
line 857
;857:	trap_R_SetColor( hudTintColor );
ADDRGP4 hudTintColor
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 859
;858:	// Inner gray wire frame
;859:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDInnerRight );		// 
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
CNSTF4 1117782016
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1208
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 860
;860:}
LABELV $543
endproc CG_DrawHUDRightFrame1 4 20
export CG_DrawHUDRightFrame2
proc CG_DrawHUDRightFrame2 4 20
line 868
;861:
;862:/*
;863:================
;864:CG_DrawHUDRightFrame2
;865:================
;866:*/
;867:void CG_DrawHUDRightFrame2(int x,int y)
;868:{
line 869
;869:	trap_R_SetColor( hudTintColor );
ADDRGP4 hudTintColor
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 870
;870:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDRightFrame );		// Metal frame
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
CNSTF4 1117782016
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1204
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 871
;871:}
LABELV $546
endproc CG_DrawHUDRightFrame2 4 20
proc CG_DrawAmmo 44 32
line 879
;872:
;873:/*
;874:================
;875:CG_DrawAmmo
;876:================
;877:*/
;878:static void CG_DrawAmmo(centity_t	*cent,int x,int y)
;879:{
line 886
;880:	playerState_t	*ps;
;881:	int			numColor_i;
;882:	int			i;
;883:	vec4_t		calcColor;
;884:	float		value,inc,percent;
;885:
;886:	ps = &cg.snap->ps;
ADDRLP4 32
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 888
;887:
;888:	if (!cent->currentState.weapon ) // We don't have a weapon right now
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $551
line 889
;889:	{
line 890
;890:		return;
ADDRGP4 $549
JUMPV
LABELV $551
line 893
;891:	}
;892:
;893:	if ( cent->currentState.weapon == WP_SABER )
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $553
line 894
;894:	{
line 895
;895:		trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 897
;896:		// don't need to draw ammo, but we will draw the current saber style in this window
;897:		switch ( cg.predictedPlayerState.fd.saberDrawAnimLevel )
ADDRLP4 40
ADDRGP4 cg+96+772+460
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
EQI4 $561
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $564
ADDRLP4 40
INDIRI4
CNSTI4 3
EQI4 $567
ADDRGP4 $549
JUMPV
line 898
;898:		{
LABELV $561
line 900
;899:		case 1://FORCE_LEVEL_1:
;900:			CG_DrawPic( x, y, 80, 40, cgs.media.HUDSaberStyle1 );
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1117782016
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 cgs+70296+1192
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 901
;901:			break;
ADDRGP4 $549
JUMPV
LABELV $564
line 903
;902:		case 2://FORCE_LEVEL_2:
;903:			CG_DrawPic( x, y, 80, 40, cgs.media.HUDSaberStyle2 );
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1117782016
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 cgs+70296+1196
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 904
;904:			break;
ADDRGP4 $549
JUMPV
LABELV $567
line 906
;905:		case 3://FORCE_LEVEL_3:
;906:			CG_DrawPic( x, y, 80, 40, cgs.media.HUDSaberStyle3 );
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1117782016
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 cgs+70296+1200
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 907
;907:			break;
line 909
;908:		}
;909:		return;
ADDRGP4 $549
JUMPV
LABELV $553
line 912
;910:	}
;911:	else
;912:	{
line 913
;913:		value = ps->ammo[weaponData[cent->currentState.weapon].ammoIndex];
ADDRLP4 4
CNSTI4 56
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 914
;914:	}
line 916
;915:
;916:	if (value < 0)	// No ammo
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $570
line 917
;917:	{
line 918
;918:		return;
ADDRGP4 $549
JUMPV
LABELV $570
line 962
;919:	}
;920:
;921:
;922:	//
;923:	// ammo
;924:	//
;925:/*	if (cg.oldammo < value)
;926:	{
;927:		cg.oldAmmoTime = cg.time + 200;
;928:	}
;929:
;930:	cg.oldammo = value;
;931:*/
;932:	// Firing or reloading?
;933:/*	if (( pm->ps->weaponstate == WEAPON_FIRING
;934:		&& cg.predictedPlayerState.weaponTime > 100 ))
;935:	{
;936:		numColor_i = CT_LTGREY;
;937:	} */
;938:	// Overcharged?
;939://	else if ( cent->gent->s.powerups & ( 1 << PW_WEAPON_OVERCHARGE ) )
;940://	{
;941://		numColor_i = CT_WHITE;
;942://	}
;943://	else 
;944://	{
;945://		if ( value > 0 ) 
;946://		{
;947://			if (cg.oldAmmoTime > cg.time)
;948://			{
;949://				numColor_i = CT_YELLOW;
;950://			}
;951://			else
;952://			{
;953://				numColor_i = CT_HUD_ORANGE;
;954://			}
;955://		} 
;956://		else 
;957://		{
;958://			numColor_i = CT_RED;
;959://		}
;960://	}
;961:
;962:	numColor_i = CT_HUD_ORANGE;
ADDRLP4 36
CNSTI4 66
ASGNI4
line 964
;963:
;964:	trap_R_SetColor( colorTable[numColor_i] );	
ADDRLP4 36
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 colorTable
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 965
;965:	CG_DrawNumField (x + 30, y + 26, 3, value, 6, 12, NUM_FONT_SMALL,qfalse);
ADDRFP4 4
INDIRI4
CNSTI4 30
ADDI4
ARGI4
ADDRFP4 8
INDIRI4
CNSTI4 26
ADDI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 12
ARGI4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawNumField
CALLV
pop
line 970
;966:
;967:
;968://cg.snap->ps.ammo[weaponData[cg.snap->ps.weapon].ammoIndex]
;969:
;970:	inc = (float) ammoData[weaponData[cent->currentState.weapon].ammoIndex].max / MAX_TICS;
ADDRLP4 24
CNSTI4 56
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ammoData
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1096810496
DIVF4
ASGNF4
line 971
;971:	value =ps->ammo[weaponData[cent->currentState.weapon].ammoIndex];
ADDRLP4 4
CNSTI4 56
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 973
;972:
;973:	for (i=MAX_TICS-1;i>=0;i--)
ADDRLP4 0
CNSTI4 13
ASGNI4
LABELV $572
line 974
;974:	{
line 976
;975:
;976:		if (value <= 0)	// partial tic
ADDRLP4 4
INDIRF4
CNSTF4 0
GTF4 $576
line 977
;977:		{
line 978
;978:			memcpy(calcColor, colorTable[CT_BLACK], sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRGP4 colorTable+16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 979
;979:		}
ADDRGP4 $577
JUMPV
LABELV $576
line 980
;980:		else if (value < inc)	// partial tic
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
GEF4 $579
line 981
;981:		{
line 982
;982:			memcpy(calcColor, colorTable[CT_WHITE], sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRGP4 colorTable+128
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 983
;983:			percent = value / inc;
ADDRLP4 28
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 984
;984:			calcColor[0] *= percent;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 985
;985:			calcColor[1] *= percent;
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 986
;986:			calcColor[2] *= percent;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 987
;987:		}
ADDRGP4 $580
JUMPV
LABELV $579
line 989
;988:		else
;989:		{
line 990
;990:			memcpy(calcColor, colorTable[CT_WHITE], sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRGP4 colorTable+128
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 991
;991:		}
LABELV $580
LABELV $577
line 993
;992:
;993:		trap_R_SetColor( calcColor);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 994
;994:		CG_DrawPic( x + ammoTicPos[i].x, 
ADDRLP4 40
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDRGP4 ammoTicPos
ADDP4
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
ADDRLP4 40
INDIRI4
ADDRGP4 ammoTicPos+4
ADDP4
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRI4
ADDRGP4 ammoTicPos+8
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRI4
ADDRGP4 ammoTicPos+12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRI4
ADDRGP4 ammoTicPos+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1000
;995:			y + ammoTicPos[i].y, 
;996:			ammoTicPos[i].width, 
;997:			ammoTicPos[i].height, 
;998:			ammoTicPos[i].tic );
;999:
;1000:		value -= inc;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
ASGNF4
line 1001
;1001:	}
LABELV $573
line 973
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $572
line 1003
;1002:
;1003:}
LABELV $549
endproc CG_DrawAmmo 44 32
export CG_DrawForcePower
proc CG_DrawForcePower 36 20
line 1011
;1004:
;1005:/*
;1006:================
;1007:CG_DrawForcePower
;1008:================
;1009:*/
;1010:void CG_DrawForcePower(int x,int y)
;1011:{
line 1016
;1012:	int			i;
;1013:	vec4_t		calcColor;
;1014:	float		value,inc,percent;
;1015:
;1016:	inc = (float)  100 / MAX_TICS;
ADDRLP4 24
CNSTF4 1088721481
ASGNF4
line 1017
;1017:	value = cg.snap->ps.fd.forcePower;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1019
;1018:
;1019:	for (i=MAX_TICS-1;i>=0;i--)
ADDRLP4 0
CNSTI4 13
ASGNI4
LABELV $591
line 1020
;1020:	{
line 1022
;1021:
;1022:		if (value <= 0)	// partial tic
ADDRLP4 4
INDIRF4
CNSTF4 0
GTF4 $595
line 1023
;1023:		{
line 1024
;1024:			memcpy(calcColor, colorTable[CT_BLACK], sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRGP4 colorTable+16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1025
;1025:		}
ADDRGP4 $596
JUMPV
LABELV $595
line 1026
;1026:		else if (value < inc)	// partial tic
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
GEF4 $598
line 1027
;1027:		{
line 1028
;1028:			memcpy(calcColor, colorTable[CT_WHITE], sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRGP4 colorTable+128
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1029
;1029:			percent = value / inc;
ADDRLP4 28
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 1030
;1030:			calcColor[0] *= percent;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1031
;1031:			calcColor[1] *= percent;
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1032
;1032:			calcColor[2] *= percent;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1033
;1033:		}
ADDRGP4 $599
JUMPV
LABELV $598
line 1035
;1034:		else
;1035:		{
line 1036
;1036:			memcpy(calcColor, colorTable[CT_WHITE], sizeof(vec4_t));
ADDRLP4 8
ARGP4
ADDRGP4 colorTable+128
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1037
;1037:		}
LABELV $599
LABELV $596
line 1039
;1038:
;1039:		trap_R_SetColor( calcColor);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1040
;1040:		CG_DrawPic( x + forceTicPos[i].x, 
ADDRLP4 32
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 32
INDIRI4
ADDRGP4 forceTicPos
ADDP4
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 32
INDIRI4
ADDRGP4 forceTicPos+4
ADDP4
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRI4
ADDRGP4 forceTicPos+8
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRI4
ADDRGP4 forceTicPos+12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRI4
ADDRGP4 forceTicPos+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1046
;1041:			y + forceTicPos[i].y, 
;1042:			forceTicPos[i].width, 
;1043:			forceTicPos[i].height, 
;1044:			forceTicPos[i].tic );
;1045:
;1046:		value -= inc;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
ASGNF4
line 1047
;1047:	}
LABELV $592
line 1019
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $591
line 1048
;1048:}
LABELV $589
endproc CG_DrawForcePower 36 20
export CG_DrawHUD
proc CG_DrawHUD 128 24
line 1056
;1049:
;1050:/*
;1051:================
;1052:CG_DrawHUD
;1053:================
;1054:*/
;1055:void CG_DrawHUD(centity_t	*cent)
;1056:{
line 1057
;1057:	menuDef_t	*menuHUD = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1058
;1058:	const char *scoreStr = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1062
;1059:	int	scoreBias;
;1060:	char scoreBiasStr[16];
;1061:
;1062:	if (cg_hudFiles.integer)
ADDRGP4 cg_hudFiles+12
INDIRI4
CNSTI4 0
EQI4 $609
line 1063
;1063:	{
line 1064
;1064:		int x = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1065
;1065:		int y = SCREEN_HEIGHT-80;
ADDRLP4 32
CNSTI4 400
ASGNI4
line 1067
;1066:		char ammoString[64];
;1067:		int weapX = x;
ADDRLP4 36
ADDRLP4 28
INDIRI4
ASGNI4
line 1069
;1068:
;1069:		UI_DrawProportionalString( x+16, y+40, va( "%i", cg.snap->ps.stats[STAT_HEALTH] ),
ADDRGP4 $612
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 40
ADDI4
ARGI4
ADDRLP4 104
INDIRP4
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorTable+1008
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1072
;1070:			UI_SMALLFONT|UI_DROPSHADOW, colorTable[CT_HUD_RED] );
;1071:
;1072:		UI_DrawProportionalString( x+18+14, y+40+14, va( "%i", cg.snap->ps.stats[STAT_ARMOR] ),
ADDRGP4 $612
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 112
CNSTI4 14
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 18
ADDI4
ADDRLP4 112
INDIRI4
ADDI4
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 40
ADDI4
ADDRLP4 112
INDIRI4
ADDI4
ARGI4
ADDRLP4 108
INDIRP4
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorTable+992
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1075
;1073:			UI_SMALLFONT|UI_DROPSHADOW, colorTable[CT_HUD_GREEN] );
;1074:
;1075:		if (cg.snap->ps.weapon == WP_SABER)
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
NEI4 $617
line 1076
;1076:		{
line 1077
;1077:			if (cg.snap->ps.fd.saberDrawAnimLevel == FORCE_LEVEL_3)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1276
ADDP4
INDIRI4
CNSTI4 3
NEI4 $620
line 1078
;1078:			{
line 1079
;1079:				Com_sprintf(ammoString, sizeof(ammoString), "STRONG");
ADDRLP4 40
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $623
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1080
;1080:				weapX += 16;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1081
;1081:			}
ADDRGP4 $618
JUMPV
LABELV $620
line 1082
;1082:			else if (cg.snap->ps.fd.saberDrawAnimLevel == FORCE_LEVEL_2)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $624
line 1083
;1083:			{
line 1084
;1084:				Com_sprintf(ammoString, sizeof(ammoString), "MEDIUM");
ADDRLP4 40
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $627
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1085
;1085:				weapX += 16;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1086
;1086:			}
ADDRGP4 $618
JUMPV
LABELV $624
line 1088
;1087:			else
;1088:			{
line 1089
;1089:				Com_sprintf(ammoString, sizeof(ammoString), "FAST");
ADDRLP4 40
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $628
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1090
;1090:			}
line 1091
;1091:		}
ADDRGP4 $618
JUMPV
LABELV $617
line 1093
;1092:		else
;1093:		{
line 1094
;1094:			Com_sprintf(ammoString, sizeof(ammoString), "%i", cg.snap->ps.ammo[weaponData[cent->currentState.weapon].ammoIndex]);
ADDRLP4 40
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $612
ARGP4
CNSTI4 56
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 452
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1095
;1095:		}
LABELV $618
line 1097
;1096:		
;1097:		UI_DrawProportionalString( SCREEN_WIDTH-(weapX+16+32), y+40, va( "%s", ammoString ),
ADDRGP4 $630
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 640
ADDRLP4 36
INDIRI4
CNSTI4 16
ADDI4
CNSTI4 32
ADDI4
SUBI4
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 40
ADDI4
ARGI4
ADDRLP4 116
INDIRP4
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorTable+1056
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1100
;1098:			UI_SMALLFONT|UI_DROPSHADOW, colorTable[CT_HUD_ORANGE] );
;1099:
;1100:		UI_DrawProportionalString( SCREEN_WIDTH-(x+18+14+32), y+40+14, va( "%i", cg.snap->ps.fd.forcePower),
ADDRGP4 $612
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 124
CNSTI4 14
ASGNI4
CNSTI4 640
ADDRLP4 28
INDIRI4
CNSTI4 18
ADDI4
ADDRLP4 124
INDIRI4
ADDI4
CNSTI4 32
ADDI4
SUBI4
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 40
ADDI4
ADDRLP4 124
INDIRI4
ADDI4
ARGI4
ADDRLP4 120
INDIRP4
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorTable+1024
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1103
;1101:			UI_SMALLFONT|UI_DROPSHADOW, colorTable[CT_ICON_BLUE] );
;1102:
;1103:		return;
ADDRGP4 $608
JUMPV
LABELV $609
line 1106
;1104:	}
;1105:
;1106:	if (cgs.gametype >= GT_TEAM)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $634
line 1107
;1107:	{	// tint the hud items based on team
line 1108
;1108:		if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 1
NEI4 $637
line 1109
;1109:			hudTintColor = redhudtint;
ADDRGP4 hudTintColor
ADDRGP4 redhudtint
ASGNP4
ADDRGP4 $635
JUMPV
LABELV $637
line 1110
;1110:		else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 2
NEI4 $640
line 1111
;1111:			hudTintColor = bluehudtint;
ADDRGP4 hudTintColor
ADDRGP4 bluehudtint
ASGNP4
ADDRGP4 $635
JUMPV
LABELV $640
line 1113
;1112:		else // If we're not on a team for whatever reason, leave things as they are.
;1113:			hudTintColor = colorTable[CT_WHITE];
ADDRGP4 hudTintColor
ADDRGP4 colorTable+128
ASGNP4
line 1114
;1114:	}
ADDRGP4 $635
JUMPV
LABELV $634
line 1116
;1115:	else
;1116:	{	// tint the hud items white (dont' tint)
line 1117
;1117:		hudTintColor = colorTable[CT_WHITE];
ADDRGP4 hudTintColor
ADDRGP4 colorTable+128
ASGNP4
line 1118
;1118:	}
LABELV $635
line 1120
;1119:
;1120:	menuHUD = Menus_FindByName("lefthud");
ADDRGP4 $645
ARGP4
ADDRLP4 28
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1121
;1121:	if (menuHUD)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $646
line 1122
;1122:	{
line 1123
;1123:		CG_DrawHUDLeftFrame1(menuHUD->window.rect.x,menuHUD->window.rect.y);
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawHUDLeftFrame1
CALLV
pop
line 1124
;1124:		CG_DrawArmor(menuHUD->window.rect.x,menuHUD->window.rect.y);
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawArmor
CALLV
pop
line 1125
;1125:		CG_DrawHealth(menuHUD->window.rect.x,menuHUD->window.rect.y);
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawHealth
CALLV
pop
line 1126
;1126:		CG_DrawHUDLeftFrame2(menuHUD->window.rect.x,menuHUD->window.rect.y);
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawHUDLeftFrame2
CALLV
pop
line 1127
;1127:	}
ADDRGP4 $647
JUMPV
LABELV $646
line 1129
;1128:	else
;1129:	{ //Apparently we failed to get proper coordinates from the menu, so resort to manually inputting them.
line 1130
;1130:		CG_DrawHUDLeftFrame1(0,SCREEN_HEIGHT-80);
CNSTI4 0
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 CG_DrawHUDLeftFrame1
CALLV
pop
line 1131
;1131:		CG_DrawArmor(0,SCREEN_HEIGHT-80);
CNSTI4 0
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 CG_DrawArmor
CALLV
pop
line 1132
;1132:		CG_DrawHealth(0,SCREEN_HEIGHT-80);
CNSTI4 0
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 CG_DrawHealth
CALLV
pop
line 1133
;1133:		CG_DrawHUDLeftFrame2(0,SCREEN_HEIGHT-80);
CNSTI4 0
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 CG_DrawHUDLeftFrame2
CALLV
pop
line 1134
;1134:	}
LABELV $647
line 1137
;1135:
;1136:	//scoreStr = va("Score: %i", cgs.clientinfo[cg.snap->ps.clientNum].score);
;1137:	if ( cgs.gametype == GT_TOURNAMENT )
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $648
line 1138
;1138:	{//A duel that requires more than one kill to knock the current enemy back to the queue
line 1140
;1139:		//show current kills out of how many needed
;1140:		scoreStr = va("Score: %i/%i", cg.snap->ps.persistant[PERS_SCORE], cgs.fraglimit);
ADDRGP4 $651
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRGP4 cgs+32972
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 1141
;1141:	}
ADDRGP4 $649
JUMPV
LABELV $648
line 1142
;1142:	else if (0 && cgs.gametype < GT_TEAM )
ADDRGP4 $654
JUMPV
line 1143
;1143:	{	// This is a teamless mode, draw the score bias.
line 1144
;1144:		scoreBias = cg.snap->ps.persistant[PERS_SCORE] - cgs.scores1;
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ADDRGP4 cgs+36324
INDIRI4
SUBI4
ASGNI4
line 1145
;1145:		if (scoreBias == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $659
line 1146
;1146:		{	// We are the leader!
line 1147
;1147:			if (cgs.scores2 <= 0)
ADDRGP4 cgs+36328
INDIRI4
CNSTI4 0
GTI4 $661
line 1148
;1148:			{	// Nobody to be ahead of yet.
line 1149
;1149:				Com_sprintf(scoreBiasStr, sizeof(scoreBiasStr), "");
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $664
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1150
;1150:			}
ADDRGP4 $660
JUMPV
LABELV $661
line 1152
;1151:			else
;1152:			{
line 1153
;1153:				scoreBias = cg.snap->ps.persistant[PERS_SCORE] - cgs.scores2;
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ADDRGP4 cgs+36328
INDIRI4
SUBI4
ASGNI4
line 1154
;1154:				if (scoreBias == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $667
line 1155
;1155:				{
line 1156
;1156:					Com_sprintf(scoreBiasStr, sizeof(scoreBiasStr), " (Tie)");
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $669
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1157
;1157:				}
ADDRGP4 $660
JUMPV
LABELV $667
line 1159
;1158:				else
;1159:				{
line 1160
;1160:					Com_sprintf(scoreBiasStr, sizeof(scoreBiasStr), " (+%d)", scoreBias);
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $670
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1161
;1161:				}
line 1162
;1162:			}
line 1163
;1163:		}
ADDRGP4 $660
JUMPV
LABELV $659
line 1165
;1164:		else // if (scoreBias < 0)
;1165:		{	// We are behind!
line 1166
;1166:			Com_sprintf(scoreBiasStr, sizeof(scoreBiasStr), " (%d)", scoreBias);
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $671
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1167
;1167:		}
LABELV $660
line 1168
;1168:		scoreStr = va("Score: %i%s", cg.snap->ps.persistant[PERS_SCORE], scoreBiasStr);
ADDRGP4 $672
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 1169
;1169:	}
ADDRGP4 $655
JUMPV
LABELV $654
line 1171
;1170:	else
;1171:	{	// Don't draw a bias.
line 1172
;1172:		scoreStr = va("Score: %i", cg.snap->ps.persistant[PERS_SCORE]);
ADDRGP4 $674
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 1173
;1173:	}
LABELV $655
LABELV $649
line 1174
;1174:	UI_DrawScaledProportionalString(SCREEN_WIDTH-124/*(strlen(scoreStr)*20.5)*/, SCREEN_HEIGHT-23, scoreStr, UI_RIGHT|UI_DROPSHADOW, colorTable[CT_WHITE], 0.7);
CNSTI4 516
ARGI4
CNSTI4 457
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 2050
ARGI4
ADDRGP4 colorTable+128
ARGP4
CNSTF4 1060320051
ARGF4
ADDRGP4 UI_DrawScaledProportionalString
CALLV
pop
line 1176
;1175:
;1176:	menuHUD = Menus_FindByName("righthud");
ADDRGP4 $677
ARGP4
ADDRLP4 32
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 1177
;1177:	if (menuHUD)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $678
line 1178
;1178:	{
line 1179
;1179:		CG_DrawHUDRightFrame1(menuHUD->window.rect.x,menuHUD->window.rect.y);
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawHUDRightFrame1
CALLV
pop
line 1180
;1180:		CG_DrawForcePower(menuHUD->window.rect.x,menuHUD->window.rect.y);
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawForcePower
CALLV
pop
line 1181
;1181:		CG_DrawAmmo(cent,menuHUD->window.rect.x,menuHUD->window.rect.y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawAmmo
CALLV
pop
line 1182
;1182:		CG_DrawHUDRightFrame2(menuHUD->window.rect.x,menuHUD->window.rect.y);
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawHUDRightFrame2
CALLV
pop
line 1184
;1183:
;1184:	}
ADDRGP4 $679
JUMPV
LABELV $678
line 1186
;1185:	else
;1186:	{ //Apparently we failed to get proper coordinates from the menu, so resort to manually inputting them.
line 1187
;1187:		CG_DrawHUDRightFrame1(SCREEN_WIDTH-80,SCREEN_HEIGHT-80);
CNSTI4 560
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 CG_DrawHUDRightFrame1
CALLV
pop
line 1188
;1188:		CG_DrawForcePower(SCREEN_WIDTH-80,SCREEN_HEIGHT-80);
CNSTI4 560
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 CG_DrawForcePower
CALLV
pop
line 1189
;1189:		CG_DrawAmmo(cent,SCREEN_WIDTH-80,SCREEN_HEIGHT-80);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 560
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 CG_DrawAmmo
CALLV
pop
line 1190
;1190:		CG_DrawHUDRightFrame2(SCREEN_WIDTH-80,SCREEN_HEIGHT-80);
CNSTI4 560
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 CG_DrawHUDRightFrame2
CALLV
pop
line 1191
;1191:	}
LABELV $679
line 1192
;1192:}
LABELV $608
endproc CG_DrawHUD 128 24
export ForcePower_Valid
proc ForcePower_Valid 4 0
line 1197
;1193:
;1194:#define MAX_SHOWPOWERS NUM_FORCE_POWERS
;1195:
;1196:qboolean ForcePower_Valid(int i)
;1197:{
line 1198
;1198:	if (i == FP_LEVITATION ||
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $685
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $685
ADDRLP4 0
INDIRI4
CNSTI4 16
EQI4 $685
ADDRLP4 0
INDIRI4
CNSTI4 17
NEI4 $681
LABELV $685
line 1202
;1199:		i == FP_SABERATTACK ||
;1200:		i == FP_SABERDEFEND ||
;1201:		i == FP_SABERTHROW)
;1202:	{
line 1203
;1203:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $680
JUMPV
LABELV $681
line 1206
;1204:	}
;1205:
;1206:	if (cg.snap->ps.fd.forcePowersKnown & (1 << i))
ADDRGP4 cg+36
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $686
line 1207
;1207:	{
line 1208
;1208:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $680
JUMPV
LABELV $686
line 1211
;1209:	}
;1210:	
;1211:	return qfalse;
CNSTI4 0
RETI4
LABELV $680
endproc ForcePower_Valid 4 0
export CG_DrawForceSelect
proc CG_DrawForceSelect 108 20
line 1220
;1212:}
;1213:
;1214:/*
;1215:===================
;1216:CG_DrawForceSelect
;1217:===================
;1218:*/
;1219:void CG_DrawForceSelect( void ) 
;1220:{
line 1229
;1221:	int		i;
;1222:	int		count;
;1223:	int		smallIconSize,bigIconSize;
;1224:	int		holdX,x,y,x2,y2,pad,length;
;1225:	int		sideLeftIconCnt,sideRightIconCnt;
;1226:	int		sideMax,holdCount,iconCnt;
;1227:
;1228:
;1229:	x2 = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1230
;1230:	y2 = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 1233
;1231:
;1232:	// don't display if dead
;1233:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
GTI4 $690
line 1234
;1234:	{
line 1235
;1235:		return;
ADDRGP4 $689
JUMPV
LABELV $690
line 1238
;1236:	}
;1237:
;1238:	if ((cg.forceSelectTime+WEAPON_SELECT_TIME)<cg.time)	// Time is up for the HUD to display
ADDRGP4 cg+13792
INDIRF4
CNSTF4 1152319488
ADDF4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
GEF4 $693
line 1239
;1239:	{
line 1240
;1240:		cg.forceSelect = cg.snap->ps.fd.forcePowerSelected;
ADDRGP4 cg+3512
ADDRGP4 cg+36
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
ASGNI4
line 1241
;1241:		return;
ADDRGP4 $689
JUMPV
LABELV $693
line 1244
;1242:	}
;1243:
;1244:	if (!cg.snap->ps.fd.forcePowersKnown)
ADDRGP4 cg+36
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
CNSTI4 0
NEI4 $699
line 1245
;1245:	{
line 1246
;1246:		return;
ADDRGP4 $689
JUMPV
LABELV $699
line 1250
;1247:	}
;1248:
;1249:	// count the number of powers owned
;1250:	count = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1252
;1251:
;1252:	for (i=0;i < NUM_FORCE_POWERS;++i)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $702
line 1253
;1253:	{
line 1254
;1254:		if (ForcePower_Valid(i))
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 ForcePower_Valid
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $706
line 1255
;1255:		{
line 1256
;1256:			count++;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1257
;1257:		}
LABELV $706
line 1258
;1258:	}
LABELV $703
line 1252
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $702
line 1260
;1259:
;1260:	if (count == 0)	// If no force powers, don't display
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $708
line 1261
;1261:	{
line 1262
;1262:		return;
ADDRGP4 $689
JUMPV
LABELV $708
line 1265
;1263:	}
;1264:
;1265:	sideMax = 3;	// Max number of icons on the side
ADDRLP4 48
CNSTI4 3
ASGNI4
line 1268
;1266:
;1267:	// Calculate how many icons will appear to either side of the center one
;1268:	holdCount = count - 1;	// -1 for the center icon
ADDRLP4 44
ADDRLP4 32
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1269
;1269:	if (holdCount == 0)			// No icons to either side
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $710
line 1270
;1270:	{
line 1271
;1271:		sideLeftIconCnt = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1272
;1272:		sideRightIconCnt = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 1273
;1273:	}
ADDRGP4 $711
JUMPV
LABELV $710
line 1274
;1274:	else if (count > (2*sideMax))	// Go to the max on each side
ADDRLP4 32
INDIRI4
ADDRLP4 48
INDIRI4
CNSTI4 1
LSHI4
LEI4 $712
line 1275
;1275:	{
line 1276
;1276:		sideLeftIconCnt = sideMax;
ADDRLP4 20
ADDRLP4 48
INDIRI4
ASGNI4
line 1277
;1277:		sideRightIconCnt = sideMax;
ADDRLP4 24
ADDRLP4 48
INDIRI4
ASGNI4
line 1278
;1278:	}
ADDRGP4 $713
JUMPV
LABELV $712
line 1280
;1279:	else							// Less than max, so do the calc
;1280:	{
line 1281
;1281:		sideLeftIconCnt = holdCount/2;
ADDRLP4 20
ADDRLP4 44
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1282
;1282:		sideRightIconCnt = holdCount - sideLeftIconCnt;
ADDRLP4 24
ADDRLP4 44
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1283
;1283:	}
LABELV $713
LABELV $711
line 1285
;1284:
;1285:	smallIconSize = 30;
ADDRLP4 8
CNSTI4 30
ASGNI4
line 1286
;1286:	bigIconSize = 60;
ADDRLP4 36
CNSTI4 60
ASGNI4
line 1287
;1287:	pad = 12;
ADDRLP4 16
CNSTI4 12
ASGNI4
line 1289
;1288:
;1289:	x = 320;
ADDRLP4 40
CNSTI4 320
ASGNI4
line 1290
;1290:	y = 425;
ADDRLP4 28
CNSTI4 425
ASGNI4
line 1293
;1291:
;1292:	// Background
;1293:	length = (sideLeftIconCnt * smallIconSize) + (sideLeftIconCnt*pad) +
ADDRLP4 60
ADDRLP4 20
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRI4
MULI4
ADDI4
ADDRLP4 36
INDIRI4
ADDI4
ADDRLP4 24
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDI4
ADDRLP4 24
INDIRI4
ADDRLP4 16
INDIRI4
MULI4
ADDI4
CNSTI4 12
ADDI4
ASGNI4
line 1296
;1294:			bigIconSize + (sideRightIconCnt * smallIconSize) + (sideRightIconCnt*pad) + 12;
;1295:	
;1296:	i = BG_ProperForceIndex(cg.forceSelect) - 1;
ADDRGP4 cg+3512
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_ProperForceIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 80
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1297
;1297:	if (i < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $715
line 1298
;1298:	{
line 1299
;1299:		i = MAX_SHOWPOWERS;
ADDRLP4 0
CNSTI4 18
ASGNI4
line 1300
;1300:	}
LABELV $715
line 1302
;1301:
;1302:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1304
;1303:	// Work backwards from current icon
;1304:	holdX = x - ((bigIconSize/2) + pad + smallIconSize);
ADDRLP4 12
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 2
DIVI4
ADDRLP4 16
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
SUBI4
ASGNI4
line 1305
;1305:	for (iconCnt=1;iconCnt<(sideLeftIconCnt+1);i--)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $720
JUMPV
LABELV $717
line 1306
;1306:	{
line 1307
;1307:		if (i < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $721
line 1308
;1308:		{
line 1309
;1309:			i = MAX_SHOWPOWERS;
ADDRLP4 0
CNSTI4 18
ASGNI4
line 1310
;1310:		}
LABELV $721
line 1312
;1311:
;1312:		if (!ForcePower_Valid(forcePowerSorted[i]))	// Does he have this power?
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 ForcePower_Valid
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $723
line 1313
;1313:		{
line 1314
;1314:			continue;
ADDRGP4 $718
JUMPV
LABELV $723
line 1317
;1315:		}
;1316:
;1317:		++iconCnt;					// Good icon
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1319
;1318:
;1319:		if (cgs.media.forcePowerIcons[forcePowerSorted[i]])
ADDRLP4 88
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRGP4 cgs+70296+1084
ADDP4
INDIRI4
CNSTI4 0
EQI4 $725
line 1320
;1320:		{
line 1321
;1321:			CG_DrawPic( holdX, y, smallIconSize, smallIconSize, cgs.media.forcePowerIcons[forcePowerSorted[i]] ); 
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 92
INDIRF4
ARGF4
ADDRLP4 92
INDIRF4
ARGF4
ADDRLP4 96
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
LSHI4
ADDRGP4 cgs+70296+1084
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1322
;1322:			holdX -= (smallIconSize+pad);
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
SUBI4
ASGNI4
line 1323
;1323:		}
LABELV $725
line 1324
;1324:	}
LABELV $718
line 1305
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $720
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
LTI4 $717
line 1326
;1325:
;1326:	if (ForcePower_Valid(cg.forceSelect))
ADDRGP4 cg+3512
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 ForcePower_Valid
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $731
line 1327
;1327:	{
line 1329
;1328:		// Current Center Icon
;1329:		if (cgs.media.forcePowerIcons[cg.forceSelect])
ADDRGP4 cg+3512
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+1084
ADDP4
INDIRI4
CNSTI4 0
EQI4 $734
line 1330
;1330:		{
line 1331
;1331:			CG_DrawPic( x-(bigIconSize/2), (y-((bigIconSize-smallIconSize)/2)), bigIconSize, bigIconSize, cgs.media.forcePowerIcons[cg.forceSelect] ); //only cache the icon for display
ADDRLP4 92
CNSTI4 2
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 92
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ADDRLP4 92
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 96
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRGP4 cg+3512
INDIRI4
ADDRLP4 92
INDIRI4
LSHI4
ADDRGP4 cgs+70296+1084
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1332
;1332:		}
LABELV $734
line 1333
;1333:	}
LABELV $731
line 1335
;1334:
;1335:	i = BG_ProperForceIndex(cg.forceSelect) + 1;
ADDRGP4 cg+3512
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_ProperForceIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1336
;1336:	if (i>MAX_SHOWPOWERS)
ADDRLP4 0
INDIRI4
CNSTI4 18
LEI4 $743
line 1337
;1337:	{
line 1338
;1338:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1339
;1339:	}
LABELV $743
line 1342
;1340:
;1341:	// Work forwards from current icon
;1342:	holdX = x + (bigIconSize/2) + pad;
ADDRLP4 12
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 1343
;1343:	for (iconCnt=1;iconCnt<(sideRightIconCnt+1);i++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $748
JUMPV
LABELV $745
line 1344
;1344:	{
line 1345
;1345:		if (i>MAX_SHOWPOWERS)
ADDRLP4 0
INDIRI4
CNSTI4 18
LEI4 $749
line 1346
;1346:		{
line 1347
;1347:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1348
;1348:		}
LABELV $749
line 1350
;1349:
;1350:		if (!ForcePower_Valid(forcePowerSorted[i]))	// Does he have this power?
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 ForcePower_Valid
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $751
line 1351
;1351:		{
line 1352
;1352:			continue;
ADDRGP4 $746
JUMPV
LABELV $751
line 1355
;1353:		}
;1354:
;1355:		++iconCnt;					// Good icon
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1357
;1356:
;1357:		if (cgs.media.forcePowerIcons[forcePowerSorted[i]])
ADDRLP4 96
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
LSHI4
ADDRGP4 cgs+70296+1084
ADDP4
INDIRI4
CNSTI4 0
EQI4 $753
line 1358
;1358:		{
line 1359
;1359:			CG_DrawPic( holdX, y, smallIconSize, smallIconSize, cgs.media.forcePowerIcons[forcePowerSorted[i]] ); //only cache the icon for display
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 100
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 100
INDIRF4
ARGF4
ADDRLP4 100
INDIRF4
ARGF4
ADDRLP4 104
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 104
INDIRI4
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
LSHI4
ADDRGP4 cgs+70296+1084
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1360
;1360:			holdX += (smallIconSize+pad);
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ADDI4
ASGNI4
line 1361
;1361:		}
LABELV $753
line 1362
;1362:	}
LABELV $746
line 1343
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $748
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
LTI4 $745
line 1364
;1363:
;1364:	if ( showPowersName[cg.forceSelect] ) 
ADDRGP4 cg+3512
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 showPowersName
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $759
line 1365
;1365:	{
line 1366
;1366:		UI_DrawProportionalString(320, y + 30, CG_GetStripEdString("INGAME", showPowersName[cg.forceSelect]), UI_CENTER | UI_SMALLFONT, colorTable[CT_ICON_BLUE]);
ADDRGP4 $762
ARGP4
ADDRGP4 cg+3512
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 showPowersName
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 30
ADDI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorTable+1024
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1367
;1367:	}
LABELV $759
line 1368
;1368:}
LABELV $689
endproc CG_DrawForceSelect 108 20
lit
align 4
LABELV $834
byte 4 1050656375
byte 4 1061158912
byte 4 1058994651
byte 4 1065353216
export CG_DrawInvenSelect
code
proc CG_DrawInvenSelect 1136 20
line 1376
;1369:
;1370:/*
;1371:===================
;1372:CG_DrawInventorySelect
;1373:===================
;1374:*/
;1375:void CG_DrawInvenSelect( void ) 
;1376:{
line 1387
;1377:	int				i;
;1378:	int				sideMax,holdCount,iconCnt;
;1379:	int				smallIconSize,bigIconSize;
;1380:	int				sideLeftIconCnt,sideRightIconCnt;
;1381:	int				count;
;1382:	int				holdX,x,y,y2,pad;
;1383:	int				height;
;1384:	float			addX;
;1385:
;1386:	// don't display if dead
;1387:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
GTI4 $766
line 1388
;1388:	{
line 1389
;1389:		return;
ADDRGP4 $765
JUMPV
LABELV $766
line 1392
;1390:	}
;1391:
;1392:	if ((cg.invenSelectTime+WEAPON_SELECT_TIME)<cg.time)	// Time is up for the HUD to display
ADDRGP4 cg+13788
INDIRF4
CNSTF4 1152319488
ADDF4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
GEF4 $769
line 1393
;1393:	{
line 1394
;1394:		return;
ADDRGP4 $765
JUMPV
LABELV $769
line 1397
;1395:	}
;1396:
;1397:	if (!cg.snap->ps.stats[STAT_HOLDABLE_ITEM] || !cg.snap->ps.stats[STAT_HOLDABLE_ITEMS])
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $777
ADDRGP4 cg+36
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $773
LABELV $777
line 1398
;1398:	{
line 1399
;1399:		return;
ADDRGP4 $765
JUMPV
LABELV $773
line 1402
;1400:	}
;1401:
;1402:	if (cg.itemSelect == -1)
ADDRGP4 cg+3516
INDIRI4
CNSTI4 -1
NEI4 $778
line 1403
;1403:	{
line 1404
;1404:		cg.itemSelect = bg_itemlist[cg.snap->ps.stats[STAT_HOLDABLE_ITEM]].giTag;
ADDRGP4 cg+3516
CNSTI4 52
ADDRGP4 cg+36
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 1405
;1405:	}
LABELV $778
line 1410
;1406:
;1407://const int bits = cg.snap->ps.stats[ STAT_ITEMS ];
;1408:
;1409:	// count the number of items owned
;1410:	count = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1411
;1411:	for ( i = 0 ; i < HI_NUM_HOLDABLE ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $784
line 1412
;1412:	{
line 1414
;1413:		if (/*CG_InventorySelectable(i) && inv_icons[i]*/
;1414:			(cg.snap->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << i)) ) 
ADDRGP4 cg+36
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $788
line 1415
;1415:		{
line 1416
;1416:			count++;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1417
;1417:		}
LABELV $788
line 1418
;1418:	}
LABELV $785
line 1411
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $784
line 1420
;1419:
;1420:	if (!count)
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $791
line 1421
;1421:	{
line 1422
;1422:		y2 = 0; //err?
ADDRLP4 60
CNSTI4 0
ASGNI4
line 1423
;1423:		UI_DrawProportionalString(320, y2 + 22, "EMPTY INVENTORY", UI_CENTER | UI_SMALLFONT, colorTable[CT_ICON_BLUE]);
CNSTI4 320
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 22
ADDI4
ARGI4
ADDRGP4 $793
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorTable+1024
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1424
;1424:		return;
ADDRGP4 $765
JUMPV
LABELV $791
line 1427
;1425:	}
;1426:
;1427:	sideMax = 3;	// Max number of icons on the side
ADDRLP4 56
CNSTI4 3
ASGNI4
line 1430
;1428:
;1429:	// Calculate how many icons will appear to either side of the center one
;1430:	holdCount = count - 1;	// -1 for the center icon
ADDRLP4 48
ADDRLP4 32
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1431
;1431:	if (holdCount == 0)			// No icons to either side
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $795
line 1432
;1432:	{
line 1433
;1433:		sideLeftIconCnt = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 1434
;1434:		sideRightIconCnt = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1435
;1435:	}
ADDRGP4 $796
JUMPV
LABELV $795
line 1436
;1436:	else if (count > (2*sideMax))	// Go to the max on each side
ADDRLP4 32
INDIRI4
ADDRLP4 56
INDIRI4
CNSTI4 1
LSHI4
LEI4 $797
line 1437
;1437:	{
line 1438
;1438:		sideLeftIconCnt = sideMax;
ADDRLP4 24
ADDRLP4 56
INDIRI4
ASGNI4
line 1439
;1439:		sideRightIconCnt = sideMax;
ADDRLP4 28
ADDRLP4 56
INDIRI4
ASGNI4
line 1440
;1440:	}
ADDRGP4 $798
JUMPV
LABELV $797
line 1442
;1441:	else							// Less than max, so do the calc
;1442:	{
line 1443
;1443:		sideLeftIconCnt = holdCount/2;
ADDRLP4 24
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1444
;1444:		sideRightIconCnt = holdCount - sideLeftIconCnt;
ADDRLP4 28
ADDRLP4 48
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1445
;1445:	}
LABELV $798
LABELV $796
line 1447
;1446:
;1447:	i = cg.itemSelect - 1;
ADDRLP4 0
ADDRGP4 cg+3516
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1448
;1448:	if (i<0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $800
line 1449
;1449:	{
line 1450
;1450:		i = HI_NUM_HOLDABLE-1;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 1451
;1451:	}
LABELV $800
line 1453
;1452:
;1453:	smallIconSize = 40;
ADDRLP4 8
CNSTI4 40
ASGNI4
line 1454
;1454:	bigIconSize = 80;
ADDRLP4 36
CNSTI4 80
ASGNI4
line 1455
;1455:	pad = 16;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 1457
;1456:
;1457:	x = 320;
ADDRLP4 40
CNSTI4 320
ASGNI4
line 1458
;1458:	y = 410;
ADDRLP4 20
CNSTI4 410
ASGNI4
line 1462
;1459:
;1460:	// Left side ICONS
;1461:	// Work backwards from current icon
;1462:	holdX = x - ((bigIconSize/2) + pad + smallIconSize);
ADDRLP4 12
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 2
DIVI4
ADDRLP4 16
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDI4
SUBI4
ASGNI4
line 1463
;1463:	height = smallIconSize * cg.iconHUDPercent;
ADDRLP4 44
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cg+13780
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1464
;1464:	addX = (float) smallIconSize * .75;
ADDRLP4 52
CNSTF4 1061158912
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1466
;1465:
;1466:	for (iconCnt=0;iconCnt<sideLeftIconCnt;i--)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $806
JUMPV
LABELV $803
line 1467
;1467:	{
line 1468
;1468:		if (i<0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $807
line 1469
;1469:		{
line 1470
;1470:			i = HI_NUM_HOLDABLE-1;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 1471
;1471:		}
LABELV $807
line 1473
;1472:
;1473:		if ( !(cg.snap->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << i)) || i == cg.itemSelect )
ADDRGP4 cg+36
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $813
ADDRLP4 0
INDIRI4
ADDRGP4 cg+3516
INDIRI4
NEI4 $809
LABELV $813
line 1474
;1474:		{
line 1475
;1475:			continue;
ADDRGP4 $804
JUMPV
LABELV $809
line 1478
;1476:		}
;1477:
;1478:		++iconCnt;					// Good icon
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1480
;1479:
;1480:		if (cgs.media.invenIcons[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+1056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $814
line 1481
;1481:		{
line 1482
;1482:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1483
;1483:			CG_DrawPic( holdX, y+10, smallIconSize, smallIconSize, cgs.media.invenIcons[i] );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 72
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+1056
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1485
;1484:
;1485:			trap_R_SetColor(colorTable[CT_ICON_BLUE]);
ADDRGP4 colorTable+1024
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1490
;1486:			/*CG_DrawNumField (holdX + addX, y + smallIconSize, 2, cg.snap->ps.inventory[i], 6, 12, 
;1487:				NUM_FONT_SMALL,qfalse);
;1488:				*/
;1489:
;1490:			holdX -= (smallIconSize+pad);
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
SUBI4
ASGNI4
line 1491
;1491:		}
LABELV $814
line 1492
;1492:	}
LABELV $804
line 1466
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $806
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $803
line 1495
;1493:
;1494:	// Current Center Icon
;1495:	height = bigIconSize * cg.iconHUDPercent;
ADDRLP4 44
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRGP4 cg+13780
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1496
;1496:	if (cgs.media.invenIcons[cg.itemSelect])
ADDRGP4 cg+3516
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+1056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $822
line 1497
;1497:	{
line 1499
;1498:		int itemNdex;
;1499:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1500
;1500:		CG_DrawPic( x-(bigIconSize/2), (y-((bigIconSize-smallIconSize)/2))+10, bigIconSize, bigIconSize, cgs.media.invenIcons[cg.itemSelect] );
ADDRLP4 76
CNSTI4 2
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 76
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
ADDRLP4 36
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
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRGP4 cg+3516
INDIRI4
ADDRLP4 76
INDIRI4
LSHI4
ADDRGP4 cgs+70296+1056
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1501
;1501:		addX = (float) bigIconSize * .75;
ADDRLP4 52
CNSTF4 1061158912
ADDRLP4 36
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1502
;1502:		trap_R_SetColor(colorTable[CT_ICON_BLUE]);
ADDRGP4 colorTable+1024
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1506
;1503:		/*CG_DrawNumField ((x-(bigIconSize/2)) + addX, y, 2, cg.snap->ps.inventory[cg.inventorySelect], 6, 12, 
;1504:			NUM_FONT_SMALL,qfalse);*/
;1505:
;1506:		itemNdex = BG_GetItemIndexByTag(cg.itemSelect, IT_HOLDABLE);
ADDRGP4 cg+3516
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 84
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 84
INDIRI4
ASGNI4
line 1507
;1507:		if (bg_itemlist[itemNdex].classname)
CNSTI4 52
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $832
line 1508
;1508:		{
line 1509
;1509:			vec4_t	textColor = { .312f, .75f, .621f, 1.0f };
ADDRLP4 88
ADDRGP4 $834
INDIRB
ASGNB 16
line 1512
;1510:			char	text[1024];
;1511:			
;1512:			if ( trap_SP_GetStringTextString( va("INGAME_%s",bg_itemlist[itemNdex].classname), text, sizeof( text )))
ADDRGP4 $837
ARGP4
CNSTI4 52
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1132
ADDRGP4 trap_SP_GetStringTextString
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $835
line 1513
;1513:			{
line 1514
;1514:				UI_DrawProportionalString(320, y+45, text, UI_CENTER | UI_SMALLFONT, textColor);
CNSTI4 320
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 45
ADDI4
ARGI4
ADDRLP4 104
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 88
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1515
;1515:			}
ADDRGP4 $836
JUMPV
LABELV $835
line 1517
;1516:			else
;1517:			{
line 1518
;1518:				UI_DrawProportionalString(320, y+45, bg_itemlist[itemNdex].classname, UI_CENTER | UI_SMALLFONT, textColor);
CNSTI4 320
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 45
ADDI4
ARGI4
CNSTI4 52
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 88
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 1519
;1519:			}
LABELV $836
line 1520
;1520:		}
LABELV $832
line 1521
;1521:	}
LABELV $822
line 1523
;1522:
;1523:	i = cg.itemSelect + 1;
ADDRLP4 0
ADDRGP4 cg+3516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1524
;1524:	if (i> HI_NUM_HOLDABLE-1)
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $839
line 1525
;1525:	{
line 1526
;1526:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1527
;1527:	}
LABELV $839
line 1531
;1528:
;1529:	// Right side ICONS
;1530:	// Work forwards from current icon
;1531:	holdX = x + (bigIconSize/2) + pad;
ADDRLP4 12
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 1532
;1532:	height = smallIconSize * cg.iconHUDPercent;
ADDRLP4 44
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cg+13780
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1533
;1533:	addX = (float) smallIconSize * .75;
ADDRLP4 52
CNSTF4 1061158912
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1534
;1534:	for (iconCnt=0;iconCnt<sideRightIconCnt;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $845
JUMPV
LABELV $842
line 1535
;1535:	{
line 1536
;1536:		if (i> HI_NUM_HOLDABLE-1)
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $846
line 1537
;1537:		{
line 1538
;1538:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1539
;1539:		}
LABELV $846
line 1541
;1540:
;1541:		if ( !(cg.snap->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << i)) || i == cg.itemSelect )
ADDRGP4 cg+36
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $852
ADDRLP4 0
INDIRI4
ADDRGP4 cg+3516
INDIRI4
NEI4 $848
LABELV $852
line 1542
;1542:		{
line 1543
;1543:			continue;
ADDRGP4 $843
JUMPV
LABELV $848
line 1546
;1544:		}
;1545:
;1546:		++iconCnt;					// Good icon
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1548
;1547:
;1548:		if (cgs.media.invenIcons[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+1056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $853
line 1549
;1549:		{
line 1550
;1550:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1551
;1551:			CG_DrawPic( holdX, y+10, smallIconSize, smallIconSize, cgs.media.invenIcons[i] );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 72
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+1056
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1553
;1552:
;1553:			trap_R_SetColor(colorTable[CT_ICON_BLUE]);
ADDRGP4 colorTable+1024
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1557
;1554:			/*CG_DrawNumField (holdX + addX, y + smallIconSize, 2, cg.snap->ps.inventory[i], 6, 12, 
;1555:				NUM_FONT_SMALL,qfalse);*/
;1556:
;1557:			holdX += (smallIconSize+pad);
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ADDI4
ASGNI4
line 1558
;1558:		}
LABELV $853
line 1559
;1559:	}
LABELV $843
line 1534
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $845
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $842
line 1560
;1560:}
LABELV $765
endproc CG_DrawInvenSelect 1136 20
proc CG_DrawStats 4 4
line 1569
;1561:
;1562:/*
;1563:================
;1564:CG_DrawStats
;1565:
;1566:================
;1567:*/
;1568:static void CG_DrawStats( void ) 
;1569:{
line 1579
;1570:	centity_t		*cent;
;1571:/*	playerState_t	*ps;
;1572:	vec3_t			angles;
;1573://	vec3_t		origin;
;1574:
;1575:	if ( cg_drawStatus.integer == 0 ) {
;1576:		return;
;1577:	}
;1578:*/
;1579:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 0
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1592
;1580:/*	ps = &cg.snap->ps;
;1581:
;1582:	VectorClear( angles );
;1583:
;1584:	// Do start
;1585:	if (!cg.interfaceStartupDone)
;1586:	{
;1587:		CG_InterfaceStartup();
;1588:	}
;1589:
;1590:	cgi_UI_MenuPaintAll();*/
;1591:
;1592:	CG_DrawHUD(cent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_DrawHUD
CALLV
pop
line 1598
;1593:	/*CG_DrawArmor(cent);
;1594:	CG_DrawHealth(cent);
;1595:	CG_DrawAmmo(cent);
;1596:
;1597:	CG_DrawTalk(cent);*/
;1598:}
LABELV $860
endproc CG_DrawStats 4 4
export CG_DrawTeamBackground
proc CG_DrawTeamBackground 16 20
line 1608
;1599:
;1600:
;1601:/*
;1602:================
;1603:CG_DrawTeamBackground
;1604:
;1605:================
;1606:*/
;1607:void CG_DrawTeamBackground( int x, int y, int w, int h, float alpha, int team )
;1608:{
line 1611
;1609:	vec4_t		hcolor;
;1610:
;1611:	hcolor[3] = alpha;
ADDRLP4 0+12
ADDRFP4 16
INDIRF4
ASGNF4
line 1612
;1612:	if ( team == TEAM_RED ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
NEI4 $864
line 1613
;1613:		hcolor[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1614
;1614:		hcolor[1] = .2f;
ADDRLP4 0+4
CNSTF4 1045220557
ASGNF4
line 1615
;1615:		hcolor[2] = .2f;
ADDRLP4 0+8
CNSTF4 1045220557
ASGNF4
line 1616
;1616:	} else if ( team == TEAM_BLUE ) {
ADDRGP4 $865
JUMPV
LABELV $864
ADDRFP4 20
INDIRI4
CNSTI4 2
NEI4 $862
line 1617
;1617:		hcolor[0] = .2f;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 1618
;1618:		hcolor[1] = .2f;
ADDRLP4 0+4
CNSTF4 1045220557
ASGNF4
line 1619
;1619:		hcolor[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1620
;1620:	} else {
line 1621
;1621:		return;
LABELV $869
LABELV $865
line 1625
;1622:	}
;1623://	trap_R_SetColor( hcolor );
;1624:
;1625:	CG_FillRect ( x, y, w, h, hcolor );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1627
;1626://	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
;1627:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1628
;1628:}
LABELV $862
endproc CG_DrawTeamBackground 16 20
proc CG_DrawMiniScoreboard 84 36
line 1645
;1629:
;1630:
;1631:/*
;1632:===========================================================================================
;1633:
;1634:  UPPER RIGHT CORNER
;1635:
;1636:===========================================================================================
;1637:*/
;1638:
;1639:/*
;1640:================
;1641:CG_DrawMiniScoreboard
;1642:================
;1643:*/
;1644:static float CG_DrawMiniScoreboard ( float y ) 
;1645:{
line 1648
;1646:	char temp[MAX_QPATH];
;1647:
;1648:	if ( !cg_drawScores.integer )
ADDRGP4 cg_drawScores+12
INDIRI4
CNSTI4 0
NEI4 $873
line 1649
;1649:	{
line 1650
;1650:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $872
JUMPV
LABELV $873
line 1653
;1651:	}
;1652:
;1653:	if ( cgs.gametype >= GT_TEAM )
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $876
line 1654
;1654:	{
line 1655
;1655:		strcpy ( temp, "Red: " );
ADDRLP4 0
ARGP4
ADDRGP4 $879
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1656
;1656:		Q_strcat ( temp, MAX_QPATH, cgs.scores1==SCORE_NOT_PRESENT?"-":(va("%i",cgs.scores1)) );
ADDRGP4 cgs+36324
INDIRI4
CNSTI4 -9999
NEI4 $884
ADDRLP4 64
ADDRGP4 $881
ASGNP4
ADDRGP4 $885
JUMPV
LABELV $884
ADDRGP4 $612
ARGP4
ADDRGP4 cgs+36324
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
LABELV $885
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1657
;1657:		Q_strcat ( temp, MAX_QPATH, " Blue: " );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $886
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1658
;1658:		Q_strcat ( temp, MAX_QPATH, cgs.scores2==SCORE_NOT_PRESENT?"-":(va("%i",cgs.scores2)) );
ADDRGP4 cgs+36328
INDIRI4
CNSTI4 -9999
NEI4 $890
ADDRLP4 72
ADDRGP4 $881
ASGNP4
ADDRGP4 $891
JUMPV
LABELV $890
ADDRGP4 $612
ARGP4
ADDRGP4 cgs+36328
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 76
INDIRP4
ASGNP4
LABELV $891
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1660
;1659:
;1660:		CG_Text_Paint( 630 - CG_Text_Width ( temp, 0.7f, FONT_MEDIUM ), y, 0.7f, colorWhite, temp, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE, FONT_MEDIUM );
ADDRLP4 0
ARGP4
CNSTF4 1060320051
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 80
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
CNSTI4 630
ADDRLP4 80
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1060320051
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1661
;1661:		y += 15;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1662
;1662:	}
LABELV $876
line 1664
;1663:	else
;1664:	{
line 1676
;1665:		/*
;1666:		strcpy ( temp, "1st: " );
;1667:		Q_strcat ( temp, MAX_QPATH, cgs.scores1==SCORE_NOT_PRESENT?"-":(va("%i",cgs.scores1)) );
;1668:		
;1669:		Q_strcat ( temp, MAX_QPATH, " 2nd: " );
;1670:		Q_strcat ( temp, MAX_QPATH, cgs.scores2==SCORE_NOT_PRESENT?"-":(va("%i",cgs.scores2)) );
;1671:		
;1672:		CG_Text_Paint( 630 - CG_Text_Width ( temp, 0.7f, FONT_SMALL ), y, 0.7f, colorWhite, temp, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE, FONT_MEDIUM );
;1673:		y += 15;
;1674:		*/
;1675:		//rww - no longer doing this. Since the attacker now shows who is first, we print the score there.
;1676:	}		
LABELV $877
line 1679
;1677:	
;1678:
;1679:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $872
endproc CG_DrawMiniScoreboard 84 36
proc CG_DrawEnemyInfo 1072 36
line 1688
;1680:}
;1681:
;1682:/*
;1683:================
;1684:CG_DrawEnemyInfo
;1685:================
;1686:*/
;1687:static float CG_DrawEnemyInfo ( float y ) 
;1688:{
line 1694
;1689:	float		size;
;1690:	int			clientNum;
;1691:	const char	*title;
;1692:	clientInfo_t	*ci;
;1693:
;1694:	if ( !cg_drawEnemyInfo.integer ) 
ADDRGP4 cg_drawEnemyInfo+12
INDIRI4
CNSTI4 0
NEI4 $893
line 1695
;1695:	{
line 1696
;1696:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $892
JUMPV
LABELV $893
line 1699
;1697:	}
;1698:
;1699:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) 
ADDRGP4 cg+96+216
INDIRI4
CNSTI4 0
GTI4 $896
line 1700
;1700:	{
line 1701
;1701:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $892
JUMPV
LABELV $896
line 1704
;1702:	}
;1703:	
;1704:	if ( cgs.gametype == GT_JEDIMASTER )
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $900
line 1705
;1705:	{
line 1707
;1706:		//title = "Jedi Master";
;1707:		title = CG_GetStripEdString("INGAMETEXT", "MASTERY7");
ADDRGP4 $903
ARGP4
ADDRGP4 $904
ARGP4
ADDRLP4 16
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1708
;1708:		clientNum = cgs.jediMaster;
ADDRLP4 12
ADDRGP4 cgs+36332
INDIRI4
ASGNI4
line 1710
;1709:
;1710:		if ( clientNum < 0 )
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $901
line 1711
;1711:		{
line 1714
;1712:			//return y;
;1713://			title = "Get Saber!";
;1714:			title = CG_GetStripEdString("INGAMETEXT", "GET_SABER");
ADDRGP4 $903
ARGP4
ADDRGP4 $908
ARGP4
ADDRLP4 20
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1717
;1715:
;1716:
;1717:			size = ICON_SIZE * 1.25;
ADDRLP4 4
CNSTF4 1114636288
ASGNF4
line 1718
;1718:			y += 5;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 1720
;1719:
;1720:			CG_DrawPic( 640 - size - 12, y, size, size, cgs.media.weaponIcons[WP_SABER] );
CNSTF4 1142947840
ADDRLP4 4
INDIRF4
SUBF4
CNSTF4 1094713344
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 cgs+70296+928+8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1722
;1721:
;1722:			y += size;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 1729
;1723:
;1724:			/*
;1725:			CG_Text_Paint( 630 - CG_Text_Width ( ci->name, 0.7f, FONT_MEDIUM ), y, 0.7f, colorWhite, ci->name, 0, 0, 0, FONT_MEDIUM );
;1726:			y += 15;
;1727:			*/
;1728:
;1729:			CG_Text_Paint( 630 - CG_Text_Width ( title, 0.7f, FONT_MEDIUM ), y, 0.7f, colorWhite, title, 0, 0, 0, FONT_MEDIUM );
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1060320051
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
CNSTI4 630
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1060320051
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1731
;1730:
;1731:			return y + BIGCHAR_HEIGHT + 2;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1073741824
ADDF4
RETF4
ADDRGP4 $892
JUMPV
line 1733
;1732:		}
;1733:	}
LABELV $900
line 1734
;1734:	else if ( cg.snap->ps.duelInProgress )
ADDRGP4 cg+36
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $912
line 1735
;1735:	{
line 1737
;1736://		title = "Dueling";
;1737:		title = CG_GetStripEdString("INGAMETEXT", "DUELING");
ADDRGP4 $903
ARGP4
ADDRGP4 $915
ARGP4
ADDRLP4 16
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1738
;1738:		clientNum = cg.snap->ps.duelIndex;
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ASGNI4
line 1739
;1739:	}
ADDRGP4 $913
JUMPV
LABELV $912
line 1740
;1740:	else if ( cgs.gametype == GT_TOURNAMENT && cgs.clientinfo[cg.snap->ps.clientNum].team != TEAM_SPECTATOR)
ADDRLP4 16
CNSTI4 3
ASGNI4
ADDRGP4 cgs+32960
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $917
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $917
line 1741
;1741:	{
line 1743
;1742://		title = "Dueling";
;1743:		title = CG_GetStripEdString("INGAMETEXT", "DUELING");
ADDRGP4 $903
ARGP4
ADDRGP4 $915
ARGP4
ADDRLP4 20
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1744
;1744:		if (cg.snap->ps.clientNum == cgs.duelist1)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRGP4 cgs+36340
INDIRI4
NEI4 $923
line 1745
;1745:		{
line 1746
;1746:			clientNum = cgs.duelist2;
ADDRLP4 12
ADDRGP4 cgs+36344
INDIRI4
ASGNI4
line 1747
;1747:		}
ADDRGP4 $918
JUMPV
LABELV $923
line 1748
;1748:		else if (cg.snap->ps.clientNum == cgs.duelist2)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRGP4 cgs+36344
INDIRI4
NEI4 $928
line 1749
;1749:		{
line 1750
;1750:			clientNum = cgs.duelist1;
ADDRLP4 12
ADDRGP4 cgs+36340
INDIRI4
ASGNI4
line 1751
;1751:		}
ADDRGP4 $918
JUMPV
LABELV $928
line 1753
;1752:		else
;1753:		{
line 1754
;1754:			return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $892
JUMPV
line 1756
;1755:		}
;1756:	}
LABELV $917
line 1758
;1757:	else
;1758:	{
line 1775
;1759:		/*
;1760:		title = "Attacker";
;1761:		clientNum = cg.predictedPlayerState.persistant[PERS_ATTACKER];
;1762:
;1763:		if ( clientNum < 0 || clientNum >= MAX_CLIENTS || clientNum == cg.snap->ps.clientNum ) 
;1764:		{
;1765:			return y;
;1766:		}
;1767:
;1768:		if ( cg.time - cg.attackerTime > ATTACKER_HEAD_TIME ) 
;1769:		{
;1770:			cg.attackerTime = 0;
;1771:			return y;
;1772:		}
;1773:		*/
;1774:		//As of current, we don't want to draw the attacker. Instead, draw whoever is in first place.
;1775:		if (cgs.duelWinner < 0 || cgs.duelWinner >= MAX_CLIENTS)
ADDRGP4 cgs+36336
INDIRI4
CNSTI4 0
LTI4 $937
ADDRGP4 cgs+36336
INDIRI4
CNSTI4 32
LTI4 $933
LABELV $937
line 1776
;1776:		{
line 1777
;1777:			return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $892
JUMPV
LABELV $933
line 1781
;1778:		}
;1779:
;1780:
;1781:		title = va("%s: %i",CG_GetStripEdString("INGAMETEXT", "LEADER"), cgs.scores1);
ADDRGP4 $903
ARGP4
ADDRGP4 $939
ARGP4
ADDRLP4 20
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $938
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 cgs+36324
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 1793
;1782:
;1783:		/*
;1784:		if (cgs.scores1 == 1)
;1785:		{
;1786:			title = va("%i kill", cgs.scores1);
;1787:		}
;1788:		else
;1789:		{
;1790:			title = va("%i kills", cgs.scores1);
;1791:		}
;1792:		*/
;1793:		clientNum = cgs.duelWinner;
ADDRLP4 12
ADDRGP4 cgs+36336
INDIRI4
ASGNI4
line 1794
;1794:	}
LABELV $918
LABELV $913
LABELV $901
line 1796
;1795:
;1796:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 788
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 1798
;1797:
;1798:	if ( !ci )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $943
line 1799
;1799:	{
line 1800
;1800:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $892
JUMPV
LABELV $943
line 1803
;1801:	}
;1802:
;1803:	size = ICON_SIZE * 1.25;
ADDRLP4 4
CNSTF4 1114636288
ASGNF4
line 1804
;1804:	y += 5;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 1806
;1805:
;1806:	if ( ci->modelIcon )
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 0
EQI4 $945
line 1807
;1807:	{
line 1808
;1808:		CG_DrawPic( 640 - size - 5, y, size, size, ci->modelIcon );
CNSTF4 1142947840
ADDRLP4 4
INDIRF4
SUBF4
CNSTF4 1084227584
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1809
;1809:	}
LABELV $945
line 1811
;1810:
;1811:	y += size;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 1813
;1812:
;1813:	CG_Text_Paint( 630 - CG_Text_Width ( ci->name, 0.7f, FONT_MEDIUM ), y, 0.7f, colorWhite, ci->name, 0, 0, 0, FONT_MEDIUM );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTF4 1060320051
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
CNSTI4 630
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1060320051
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1815
;1814:
;1815:	y += 15;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1816
;1816:	CG_Text_Paint( 630 - CG_Text_Width ( title, 0.7f, FONT_MEDIUM ), y, 0.7f, colorWhite, title, 0, 0, 0, FONT_MEDIUM );
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1060320051
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
CNSTI4 630
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1060320051
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1818
;1817:
;1818:	if ( cgs.gametype == GT_TOURNAMENT && cgs.clientinfo[cg.snap->ps.clientNum].team != TEAM_SPECTATOR)
ADDRLP4 36
CNSTI4 3
ASGNI4
ADDRGP4 cgs+32960
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $947
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $947
line 1819
;1819:	{//also print their score
line 1821
;1820:		char text[1024];
;1821:		y += 15;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1822
;1822:		Com_sprintf(text, sizeof(text), "%i/%i", cgs.clientinfo[clientNum].score, cgs.fraglimit );
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $953
ARGP4
CNSTI4 788
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+43024+108
ADDP4
INDIRI4
ARGI4
ADDRGP4 cgs+32972
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1823
;1823:		CG_Text_Paint( 630 - CG_Text_Width ( text, 0.7f, FONT_MEDIUM ), y, 0.7f, colorWhite, text, 0, 0, 0, FONT_MEDIUM );
ADDRLP4 40
ARGP4
CNSTF4 1060320051
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 1064
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
CNSTI4 630
ADDRLP4 1064
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1060320051
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 40
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRLP4 1068
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1824
;1824:	}
LABELV $947
line 1826
;1825:
;1826:	return y + BIGCHAR_HEIGHT + 2;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1073741824
ADDF4
RETF4
LABELV $892
endproc CG_DrawEnemyInfo 1072 36
proc CG_DrawSnapshot 16 16
line 1834
;1827:}
;1828:
;1829:/*
;1830:==================
;1831:CG_DrawSnapshot
;1832:==================
;1833:*/
;1834:static float CG_DrawSnapshot( float y ) {
line 1838
;1835:	char		*s;
;1836:	int			w;
;1837:
;1838:	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime, 
ADDRGP4 $958
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+32948
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1840
;1839:		cg.latestSnapshotNum, cgs.serverCommandSequence );
;1840:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1842
;1841:
;1842:	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
CNSTI4 635
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1844
;1843:
;1844:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $957
endproc CG_DrawSnapshot 16 16
bss
align 4
LABELV $963
skip 16
align 4
LABELV $964
skip 4
align 4
LABELV $965
skip 4
code
proc CG_DrawFPS 44 16
line 1853
;1845:}
;1846:
;1847:/*
;1848:==================
;1849:CG_DrawFPS
;1850:==================
;1851:*/
;1852:#define	FPS_FRAMES	4
;1853:static float CG_DrawFPS( float y ) {
line 1865
;1854:	char		*s;
;1855:	int			w;
;1856:	static int	previousTimes[FPS_FRAMES];
;1857:	static int	index;
;1858:	int		i, total;
;1859:	int		fps;
;1860:	static	int	previous;
;1861:	int		t, frameTime;
;1862:
;1863:	// don't use serverTime, because that will be drifting to
;1864:	// correct for internet lag changes, timescales, timedemos, etc
;1865:	t = trap_Milliseconds();
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 1866
;1866:	frameTime = t - previous;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 $965
INDIRI4
SUBI4
ASGNI4
line 1867
;1867:	previous = t;
ADDRGP4 $965
ADDRLP4 8
INDIRI4
ASGNI4
line 1869
;1868:
;1869:	previousTimes[index % FPS_FRAMES] = frameTime;
ADDRGP4 $964
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $963
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1870
;1870:	index++;
ADDRLP4 32
ADDRGP4 $964
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1871
;1871:	if ( index > FPS_FRAMES ) {
ADDRGP4 $964
INDIRI4
CNSTI4 4
LEI4 $966
line 1873
;1872:		// average multiple frames together to smooth changes out a bit
;1873:		total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1874
;1874:		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $968
line 1875
;1875:			total += previousTimes[i];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $963
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1876
;1876:		}
LABELV $969
line 1874
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $968
line 1877
;1877:		if ( !total ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $972
line 1878
;1878:			total = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1879
;1879:		}
LABELV $972
line 1880
;1880:		fps = 1000 * FPS_FRAMES / total;
ADDRLP4 24
CNSTI4 4000
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 1882
;1881:
;1882:		s = va( "%ifps", fps );
ADDRGP4 $974
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 1883
;1883:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1885
;1884:
;1885:		CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
CNSTI4 635
ADDRLP4 20
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1886
;1886:	}
LABELV $966
line 1888
;1887:
;1888:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $962
endproc CG_DrawFPS 44 16
proc CG_DrawTimer 28 16
line 1896
;1889:}
;1890:
;1891:/*
;1892:=================
;1893:CG_DrawTimer
;1894:=================
;1895:*/
;1896:static float CG_DrawTimer( float y ) {
line 1902
;1897:	char		*s;
;1898:	int			w;
;1899:	int			mins, seconds;
;1900:	int			msec;
;1901:
;1902:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 4
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgs+36320
INDIRI4
SUBI4
ASGNI4
line 1904
;1903:
;1904:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 1905
;1905:	mins = seconds / 60;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1906
;1906:	seconds %= 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
MODI4
ASGNI4
line 1907
;1907:	msec %= 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1000
MODI4
ASGNI4
line 1909
;1908:
;1909:	s = va( "%i:%02i.%03i", mins, seconds, msec );
ADDRGP4 $978
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1910
;1910:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1912
;1911:
;1912:	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
CNSTI4 635
ADDRLP4 12
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1914
;1913:
;1914:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $975
endproc CG_DrawTimer 28 16
proc CG_DrawTeamOverlay 148 36
line 1924
;1915:}
;1916:
;1917:
;1918:/*
;1919:=================
;1920:CG_DrawTeamOverlay
;1921:=================
;1922:*/
;1923:
;1924:static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
line 1936
;1925:	int x, w, h, xx;
;1926:	int i, j, len;
;1927:	const char *p;
;1928:	vec4_t		hcolor;
;1929:	int pwidth, lwidth;
;1930:	int plyrs;
;1931:	char st[16];
;1932:	clientInfo_t *ci;
;1933:	gitem_t	*item;
;1934:	int ret_y, count;
;1935:
;1936:	if ( !cg_drawTeamOverlay.integer ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
NEI4 $980
line 1937
;1937:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $979
JUMPV
LABELV $980
line 1940
;1938:	}
;1939:
;1940:	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
ADDRLP4 92
CNSTI4 336
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $983
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $983
line 1941
;1941:		return y; // Not on any team
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $979
JUMPV
LABELV $983
line 1944
;1942:	}
;1943:
;1944:	plyrs = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 1947
;1945:
;1946:	// max player name width
;1947:	pwidth = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 1948
;1948:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 8
LEI4 $988
ADDRLP4 96
CNSTI4 8
ASGNI4
ADDRGP4 $989
JUMPV
LABELV $988
ADDRLP4 96
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $989
ADDRLP4 48
ADDRLP4 96
INDIRI4
ASGNI4
line 1949
;1949:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $993
JUMPV
LABELV $990
line 1950
;1950:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 788
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 1951
;1951:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $995
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
NEI4 $995
line 1952
;1952:			plyrs++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1953
;1953:			len = CG_DrawStrlen(ci->name);
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 104
INDIRI4
ASGNI4
line 1954
;1954:			if (len > pwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $998
line 1955
;1955:				pwidth = len;
ADDRLP4 56
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $998
line 1956
;1956:		}
LABELV $995
line 1957
;1957:	}
LABELV $991
line 1949
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $993
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $990
line 1959
;1958:
;1959:	if (!plyrs)
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $1000
line 1960
;1960:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $979
JUMPV
LABELV $1000
line 1962
;1961:
;1962:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
ADDRLP4 56
INDIRI4
CNSTI4 12
LEI4 $1002
line 1963
;1963:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
ADDRLP4 56
CNSTI4 12
ASGNI4
LABELV $1002
line 1966
;1964:
;1965:	// max location name width
;1966:	lwidth = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 1967
;1967:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $1004
line 1968
;1968:		p = CG_ConfigString(CS_LOCATIONS + i);
ADDRLP4 8
INDIRI4
CNSTI4 640
ADDI4
ARGI4
ADDRLP4 100
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 100
INDIRP4
ASGNP4
line 1969
;1969:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1008
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1008
line 1970
;1970:			len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 108
INDIRI4
ASGNI4
line 1971
;1971:			if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $1010
line 1972
;1972:				lwidth = len;
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $1010
line 1973
;1973:		}
LABELV $1008
line 1974
;1974:	}
LABELV $1005
line 1967
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $1004
line 1976
;1975:
;1976:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
ADDRLP4 44
INDIRI4
CNSTI4 16
LEI4 $1012
line 1977
;1977:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
ADDRLP4 44
CNSTI4 16
ASGNI4
LABELV $1012
line 1979
;1978:
;1979:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
ADDRLP4 80
ADDRLP4 56
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CNSTI4 3
LSHI4
CNSTI4 32
ADDI4
CNSTI4 56
ADDI4
ASGNI4
line 1981
;1980:
;1981:	if ( right )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1014
line 1982
;1982:		x = 640 - w;
ADDRLP4 52
CNSTI4 640
ADDRLP4 80
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $1015
JUMPV
LABELV $1014
line 1984
;1983:	else
;1984:		x = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
LABELV $1015
line 1986
;1985:
;1986:	h = plyrs * TINYCHAR_HEIGHT;
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1988
;1987:
;1988:	if ( upper ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1016
line 1989
;1989:		ret_y = y + h;
ADDRLP4 88
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 1990
;1990:	} else {
ADDRGP4 $1017
JUMPV
LABELV $1016
line 1991
;1991:		y -= h;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1992
;1992:		ret_y = y;
ADDRLP4 88
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 1993
;1993:	}
LABELV $1017
line 1995
;1994:
;1995:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1018
line 1996
;1996:		hcolor[0] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 1997
;1997:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 1998
;1998:		hcolor[2] = 0.0f;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 1999
;1999:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 2000
;2000:	} else { // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 $1019
JUMPV
LABELV $1018
line 2001
;2001:		hcolor[0] = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2002
;2002:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 2003
;2003:		hcolor[2] = 1.0f;
ADDRLP4 24+8
CNSTF4 1065353216
ASGNF4
line 2004
;2004:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 2005
;2005:	}
LABELV $1019
line 2006
;2006:	trap_R_SetColor( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2007
;2007:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
ADDRLP4 52
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+70296+104
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2008
;2008:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2010
;2009:
;2010:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1032
JUMPV
LABELV $1029
line 2011
;2011:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 788
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 2012
;2012:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1034
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
NEI4 $1034
line 2014
;2013:
;2014:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
ADDRLP4 104
CNSTF4 1065353216
ASGNF4
ADDRLP4 24+12
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 104
INDIRF4
ASGNF4
line 2016
;2015:
;2016:			xx = x + TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 2018
;2017:
;2018:			CG_DrawStringExt( xx, y,
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 112
CNSTI4 8
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2022
;2019:				ci->name, hcolor, qfalse, qfalse,
;2020:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH);
;2021:
;2022:			if (lwidth) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1040
line 2023
;2023:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 640
ADDI4
ARGI4
ADDRLP4 116
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 116
INDIRP4
ASGNP4
line 2024
;2024:				if (!p || !*p)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1044
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1042
LABELV $1044
line 2025
;2025:					p = "unknown";
ADDRLP4 20
ADDRGP4 $1045
ASGNP4
LABELV $1042
line 2026
;2026:				len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 124
INDIRI4
ASGNI4
line 2027
;2027:				if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $1046
line 2028
;2028:					len = lwidth;
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $1046
line 2032
;2029:
;2030://				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth + 
;2031://					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
;2032:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 16
ADDI4
ADDRLP4 56
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 2033
;2033:				CG_DrawStringExt( xx, y,
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 132
CNSTI4 8
ASGNI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 132
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2036
;2034:					p, hcolor, qfalse, qfalse, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
;2035:					TEAM_OVERLAY_MAXLOCATION_WIDTH);
;2036:			}
LABELV $1040
line 2038
;2037:
;2038:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 2040
;2039:
;2040:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
ADDRLP4 60
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $1048
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2042
;2041:
;2042:			xx = x + TINYCHAR_WIDTH * 3 + 
ADDRLP4 124
CNSTI4 3
ASGNI4
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 24
ADDI4
ADDRLP4 56
INDIRI4
ADDRLP4 124
INDIRI4
LSHI4
ADDI4
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
LSHI4
ADDI4
ASGNI4
line 2045
;2043:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;2044:
;2045:			CG_DrawStringExt( xx, y,
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 132
CNSTI4 8
ASGNI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2050
;2046:				st, hcolor, qfalse, qfalse,
;2047:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;2048:
;2049:			// draw weapon icon
;2050:			xx += TINYCHAR_WIDTH * 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 2052
;2051:
;2052:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
CNSTI4 208
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+56
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1049
line 2053
;2053:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 136
CNSTF4 1090519040
ASGNF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 136
INDIRF4
ARGF4
CNSTI4 208
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+56
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2055
;2054:					cg_weapons[ci->curWeapon].weaponIcon );
;2055:			} else {
ADDRGP4 $1050
JUMPV
LABELV $1049
line 2056
;2056:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 136
CNSTF4 1090519040
ASGNF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRGP4 cgs+70296+108
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2058
;2057:					cgs.media.deferShader );
;2058:			}
LABELV $1050
line 2061
;2059:
;2060:			// Draw powerup icons
;2061:			if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1055
line 2062
;2062:				xx = x;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 2063
;2063:			} else {
ADDRGP4 $1056
JUMPV
LABELV $1055
line 2064
;2064:				xx = x + w - TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 8
SUBI4
ASGNI4
line 2065
;2065:			}
LABELV $1056
line 2066
;2066:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1057
line 2067
;2067:				if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1061
line 2069
;2068:
;2069:					item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 136
INDIRP4
ASGNP4
line 2071
;2070:
;2071:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1063
line 2072
;2072:						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 144
CNSTF4 1090519040
ASGNF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2074
;2073:						trap_R_RegisterShader( item->icon ) );
;2074:						if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1065
line 2075
;2075:							xx -= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 2076
;2076:						} else {
ADDRGP4 $1066
JUMPV
LABELV $1065
line 2077
;2077:							xx += TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 2078
;2078:						}
LABELV $1066
line 2079
;2079:					}
LABELV $1063
line 2080
;2080:				}
LABELV $1061
line 2081
;2081:			}
LABELV $1058
line 2066
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LEI4 $1057
line 2083
;2082:
;2083:			y += TINYCHAR_HEIGHT;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2084
;2084:		}
LABELV $1034
line 2085
;2085:	}
LABELV $1030
line 2010
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1032
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $1029
line 2087
;2086:
;2087:	return ret_y;
ADDRLP4 88
INDIRI4
CVIF4 4
RETF4
LABELV $979
endproc CG_DrawTeamOverlay 148 36
proc CG_DrawPowerupIcons 44 20
line 2093
;2088://#endif
;2089:}
;2090:
;2091:
;2092:static void CG_DrawPowerupIcons(int y)
;2093:{
line 2095
;2094:	int j;
;2095:	int ico_size = 64;
ADDRLP4 4
CNSTI4 64
ASGNI4
line 2099
;2096:	//int y = ico_size/2;
;2097:	gitem_t	*item;
;2098:
;2099:	if (!cg.snap)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1068
line 2100
;2100:	{
line 2101
;2101:		return;
ADDRGP4 $1067
JUMPV
LABELV $1068
line 2104
;2102:	}
;2103:
;2104:	y += 16;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 2106
;2105:
;2106:	for (j = 0; j <= PW_NUM_POWERUPS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1071
line 2107
;2107:	{
line 2108
;2108:		if (cg.snap->ps.powerups[j] > cg.time)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $1075
line 2109
;2109:		{
line 2110
;2110:			int secondsleft = (cg.snap->ps.powerups[j] - cg.time)/1000;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2112
;2111:
;2112:			item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2114
;2113:
;2114:			if (item)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1081
line 2115
;2115:			{
line 2116
;2116:				int icoShader = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2117
;2117:				if (cgs.gametype == GT_CTY && (j == PW_REDFLAG || j == PW_BLUEFLAG))
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1083
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $1086
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $1083
LABELV $1086
line 2118
;2118:				{
line 2119
;2119:					if (j == PW_REDFLAG)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1087
line 2120
;2120:					{
line 2121
;2121:						icoShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_rflag_ys" );
ADDRGP4 $1089
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 2122
;2122:					}
ADDRGP4 $1084
JUMPV
LABELV $1087
line 2124
;2123:					else
;2124:					{
line 2125
;2125:						icoShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_bflag_ys" );
ADDRGP4 $1090
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 2126
;2126:					}
line 2127
;2127:				}
ADDRGP4 $1084
JUMPV
LABELV $1083
line 2129
;2128:				else
;2129:				{
line 2130
;2130:					icoShader = trap_R_RegisterShader( item->icon );
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 2131
;2131:				}
LABELV $1084
line 2133
;2132:
;2133:				CG_DrawPic( (640-(ico_size*1.1)), y, ico_size, ico_size, icoShader );
ADDRLP4 28
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
CNSTF4 1142947840
CNSTF4 1066192077
ADDRLP4 28
INDIRF4
MULF4
SUBF4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2135
;2134:	
;2135:				y += ico_size;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2137
;2136:
;2137:				if (j != PW_REDFLAG && j != PW_BLUEFLAG && secondsleft < 999)
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $1091
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $1091
ADDRLP4 12
INDIRI4
CNSTI4 999
GEI4 $1091
line 2138
;2138:				{
line 2139
;2139:					UI_DrawProportionalString((640-(ico_size*1.1))+(ico_size/2), y-8, va("%i", secondsleft), UI_CENTER | UI_BIGFONT | UI_DROPSHADOW, colorTable[CT_WHITE]);
ADDRGP4 $612
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1142947840
CNSTF4 1066192077
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
SUBF4
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
ADDF4
CVFI4 4
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 2140
;2140:				}
LABELV $1091
line 2142
;2141:
;2142:				y += (ico_size/3);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 3
DIVI4
ADDI4
ASGNI4
line 2143
;2143:			}
LABELV $1081
line 2144
;2144:		}
LABELV $1075
line 2145
;2145:	}
LABELV $1072
line 2106
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LEI4 $1071
line 2146
;2146:}
LABELV $1067
endproc CG_DrawPowerupIcons 44 20
proc CG_DrawUpperRight 12 12
line 2155
;2147:
;2148:
;2149:/*
;2150:=====================
;2151:CG_DrawUpperRight
;2152:
;2153:=====================
;2154:*/
;2155:static void CG_DrawUpperRight( void ) {
line 2158
;2156:	float	y;
;2157:
;2158:	y = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2160
;2159:
;2160:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 1 ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $1095
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 1
NEI4 $1095
line 2161
;2161:		y = CG_DrawTeamOverlay( y, qtrue, qtrue );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2162
;2162:	} 
LABELV $1095
line 2163
;2163:	if ( cg_drawSnapshot.integer ) {
ADDRGP4 cg_drawSnapshot+12
INDIRI4
CNSTI4 0
EQI4 $1099
line 2164
;2164:		y = CG_DrawSnapshot( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawSnapshot
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2165
;2165:	}
LABELV $1099
line 2166
;2166:	if ( cg_drawFPS.integer ) {
ADDRGP4 cg_drawFPS+12
INDIRI4
CNSTI4 0
EQI4 $1102
line 2167
;2167:		y = CG_DrawFPS( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawFPS
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2168
;2168:	}
LABELV $1102
line 2169
;2169:	if ( cg_drawTimer.integer ) {
ADDRGP4 cg_drawTimer+12
INDIRI4
CNSTI4 0
EQI4 $1105
line 2170
;2170:		y = CG_DrawTimer( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawTimer
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2171
;2171:	}
LABELV $1105
line 2173
;2172:	
;2173:	y = CG_DrawEnemyInfo ( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawEnemyInfo
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2175
;2174:
;2175:	y = CG_DrawMiniScoreboard ( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawMiniScoreboard
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2177
;2176:
;2177:	CG_DrawPowerupIcons(y);
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawPowerupIcons
CALLV
pop
line 2178
;2178:}
LABELV $1094
endproc CG_DrawUpperRight 12 12
export CG_AddLagometerFrameInfo
proc CG_AddLagometerFrameInfo 8 0
line 2283
;2179:
;2180:/*
;2181:===================
;2182:CG_DrawReward
;2183:===================
;2184:*/
;2185:#ifdef JK2AWARDS
;2186:static void CG_DrawReward( void ) { 
;2187:	float	*color;
;2188:	int		i, count;
;2189:	float	x, y;
;2190:	char	buf[32];
;2191:
;2192:	if ( !cg_drawRewards.integer ) {
;2193:		return;
;2194:	}
;2195:
;2196:	color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
;2197:	if ( !color ) {
;2198:		if (cg.rewardStack > 0) {
;2199:			for(i = 0; i < cg.rewardStack; i++) {
;2200:				cg.rewardSound[i] = cg.rewardSound[i+1];
;2201:				cg.rewardShader[i] = cg.rewardShader[i+1];
;2202:				cg.rewardCount[i] = cg.rewardCount[i+1];
;2203:			}
;2204:			cg.rewardTime = cg.time;
;2205:			cg.rewardStack--;
;2206:			color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
;2207:			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
;2208:		} else {
;2209:			return;
;2210:		}
;2211:	}
;2212:
;2213:	trap_R_SetColor( color );
;2214:
;2215:	/*
;2216:	count = cg.rewardCount[0]/10;				// number of big rewards to draw
;2217:
;2218:	if (count) {
;2219:		y = 4;
;2220:		x = 320 - count * ICON_SIZE;
;2221:		for ( i = 0 ; i < count ; i++ ) {
;2222:			CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
;2223:			x += (ICON_SIZE*2);
;2224:		}
;2225:	}
;2226:
;2227:	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
;2228:	*/
;2229:
;2230:	if ( cg.rewardCount[0] >= 10 ) {
;2231:		y = 56;
;2232:		x = 320 - ICON_SIZE/2;
;2233:		CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
;2234:		Com_sprintf(buf, sizeof(buf), "%d", cg.rewardCount[0]);
;2235:		x = ( SCREEN_WIDTH - SMALLCHAR_WIDTH * CG_DrawStrlen( buf ) ) / 2;
;2236:		CG_DrawStringExt( x, y+ICON_SIZE, buf, color, qfalse, qtrue,
;2237:								SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
;2238:	}
;2239:	else {
;2240:
;2241:		count = cg.rewardCount[0];
;2242:
;2243:		y = 56;
;2244:		x = 320 - count * ICON_SIZE/2;
;2245:		for ( i = 0 ; i < count ; i++ ) {
;2246:			CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
;2247:			x += ICON_SIZE;
;2248:		}
;2249:	}
;2250:	trap_R_SetColor( NULL );
;2251:}
;2252:#endif
;2253:
;2254:
;2255:/*
;2256:===============================================================================
;2257:
;2258:LAGOMETER
;2259:
;2260:===============================================================================
;2261:*/
;2262:
;2263:#define	LAG_SAMPLES		128
;2264:
;2265:
;2266:typedef struct {
;2267:	int		frameSamples[LAG_SAMPLES];
;2268:	int		frameCount;
;2269:	int		snapshotFlags[LAG_SAMPLES];
;2270:	int		snapshotSamples[LAG_SAMPLES];
;2271:	int		snapshotCount;
;2272:} lagometer_t;
;2273:
;2274:lagometer_t		lagometer;
;2275:
;2276:/*
;2277:==============
;2278:CG_AddLagometerFrameInfo
;2279:
;2280:Adds the current interpolate / extrapolate bar for this frame
;2281:==============
;2282:*/
;2283:void CG_AddLagometerFrameInfo( void ) {
line 2286
;2284:	int			offset;
;2285:
;2286:	offset = cg.time - cg.latestSnapshotTime;
ADDRLP4 0
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+32
INDIRI4
SUBI4
ASGNI4
line 2287
;2287:	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2288
;2288:	lagometer.frameCount++;
ADDRLP4 4
ADDRGP4 lagometer+512
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2289
;2289:}
LABELV $1109
endproc CG_AddLagometerFrameInfo 8 0
export CG_AddLagometerSnapshotInfo
proc CG_AddLagometerSnapshotInfo 4 0
line 2301
;2290:
;2291:/*
;2292:==============
;2293:CG_AddLagometerSnapshotInfo
;2294:
;2295:Each time a snapshot is received, log its ping time and
;2296:the number of snapshots that were dropped before it.
;2297:
;2298:Pass NULL for a dropped packet.
;2299:==============
;2300:*/
;2301:void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
line 2303
;2302:	// dropped packet
;2303:	if ( !snap ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1115
line 2304
;2304:		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
CNSTI4 -1
ASGNI4
line 2305
;2305:		lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2306
;2306:		return;
ADDRGP4 $1114
JUMPV
LABELV $1115
line 2310
;2307:	}
;2308:
;2309:	// add this snapshot's info
;2310:	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2311
;2311:	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2312
;2312:	lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2313
;2313:}
LABELV $1114
endproc CG_AddLagometerSnapshotInfo 4 0
proc CG_DrawDisconnect 72 20
line 2322
;2314:
;2315:/*
;2316:==============
;2317:CG_DrawDisconnect
;2318:
;2319:Should we draw something differnet for long lag vs no packets?
;2320:==============
;2321:*/
;2322:static void CG_DrawDisconnect( void ) {
line 2329
;2323:	float		x, y;
;2324:	int			cmdNum;
;2325:	usercmd_t	cmd;
;2326:	const char		*s;
;2327:	int			w;  // bk010215 - FIXME char message[1024];
;2328:
;2329:	if (cg.mMapChange)
ADDRGP4 cg+48
INDIRI4
CNSTI4 0
EQI4 $1126
line 2330
;2330:	{			
line 2331
;2331:		s = CG_GetStripEdString("INGAMETEXT", "SERVER_CHANGING_MAPS");	// s = "Server Changing Maps";			
ADDRGP4 $903
ARGP4
ADDRGP4 $1129
ARGP4
ADDRLP4 48
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
line 2332
;2332:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 2333
;2333:		CG_DrawBigString( 320 - w/2, 100, s, 1.0F);
CNSTI4 320
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2335
;2334:
;2335:		s = CG_GetStripEdString("INGAMETEXT", "PLEASE_WAIT");	// s = "Please wait...";
ADDRGP4 $903
ARGP4
ADDRGP4 $1130
ARGP4
ADDRLP4 56
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 2336
;2336:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 2337
;2337:		CG_DrawBigString( 320 - w/2, 200, s, 1.0F);
CNSTI4 320
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2338
;2338:		return;
ADDRGP4 $1125
JUMPV
LABELV $1126
line 2342
;2339:	}
;2340:
;2341:	// draw the phone jack if we are completely past our buffers
;2342:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
ADDRLP4 48
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2343
;2343:	trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 2344
;2344:	if ( cmd.serverTime <= cg.snap->ps.commandTime
ADDRLP4 52
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $1135
ADDRLP4 52
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $1131
LABELV $1135
line 2345
;2345:		|| cmd.serverTime > cg.time ) {	// special check for map_restart // bk 0102165 - FIXME
line 2346
;2346:		return;
ADDRGP4 $1125
JUMPV
LABELV $1131
line 2350
;2347:	}
;2348:
;2349:	// also add text in center of screen
;2350:	s = CG_GetStripEdString("INGAMETEXT", "CONNECTION_INTERRUPTED"); // s = "Connection Interrupted"; // bk 010215 - FIXME
ADDRGP4 $903
ARGP4
ADDRGP4 $1136
ARGP4
ADDRLP4 56
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 2351
;2351:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 2352
;2352:	CG_DrawBigString( 320 - w/2, 100, s, 1.0F);
CNSTI4 320
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2355
;2353:
;2354:	// blink the icon
;2355:	if ( ( cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+64
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1137
line 2356
;2356:		return;
ADDRGP4 $1125
JUMPV
LABELV $1137
line 2359
;2357:	}
;2358:
;2359:	x = 640 - 48;
ADDRLP4 36
CNSTF4 1142161408
ASGNF4
line 2360
;2360:	y = 480 - 48;
ADDRLP4 40
CNSTF4 1138229248
ASGNF4
line 2362
;2361:
;2362:	CG_DrawPic( x, y, 48, 48, trap_R_RegisterShader("gfx/2d/net.tga" ) );
ADDRGP4 $1140
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 68
CNSTF4 1111490560
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2363
;2363:}
LABELV $1125
endproc CG_DrawDisconnect 72 20
proc CG_DrawLagometer 68 36
line 2374
;2364:
;2365:
;2366:#define	MAX_LAGOMETER_PING	900
;2367:#define	MAX_LAGOMETER_RANGE	300
;2368:
;2369:/*
;2370:==============
;2371:CG_DrawLagometer
;2372:==============
;2373:*/
;2374:static void CG_DrawLagometer( void ) {
line 2381
;2375:	int		a, x, y, i;
;2376:	float	v;
;2377:	float	ax, ay, aw, ah, mid, range;
;2378:	int		color;
;2379:	float	vscale;
;2380:
;2381:	if ( !cg_lagometer.integer || cgs.localServer ) {
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRGP4 cg_lagometer+12
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1146
ADDRGP4 cgs+32956
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1142
LABELV $1146
line 2382
;2382:		CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 2383
;2383:		return;
ADDRGP4 $1141
JUMPV
LABELV $1142
line 2389
;2384:	}
;2385:
;2386:	//
;2387:	// draw the graph
;2388:	//
;2389:	x = 640 - 48;
ADDRLP4 44
CNSTI4 592
ASGNI4
line 2390
;2390:	y = 480 - 144;
ADDRLP4 48
CNSTI4 336
ASGNI4
line 2392
;2391:
;2392:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2393
;2393:	CG_DrawPic( x, y, 48, 48, cgs.media.lagometerShader );
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 48
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 56
CNSTF4 1111490560
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 cgs+70296+240
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2395
;2394:
;2395:	ax = x;
ADDRLP4 28
ADDRLP4 44
INDIRI4
CVIF4 4
ASGNF4
line 2396
;2396:	ay = y;
ADDRLP4 36
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 2397
;2397:	aw = 48;
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
line 2398
;2398:	ah = 48;
ADDRLP4 32
CNSTF4 1111490560
ASGNF4
line 2400
;2399:
;2400:	color = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 2401
;2401:	range = ah / 3;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 2402
;2402:	mid = ay + range;
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 2404
;2403:
;2404:	vscale = range / MAX_LAGOMETER_RANGE;
ADDRLP4 24
ADDRLP4 16
INDIRF4
CNSTF4 1133903872
DIVF4
ASGNF4
line 2407
;2405:
;2406:	// draw the frame interpoalte / extrapolate graph
;2407:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1152
JUMPV
LABELV $1149
line 2408
;2408:		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 2409
;2409:		v = lagometer.frameSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2410
;2410:		v *= vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 2411
;2411:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1154
line 2412
;2412:			if ( color != 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $1156
line 2413
;2413:				color = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 2414
;2414:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2415
;2415:			}
LABELV $1156
line 2416
;2416:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $1159
line 2417
;2417:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2418
;2418:			}
LABELV $1159
line 2419
;2419:			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2420
;2420:		} else if ( v < 0 ) {
ADDRGP4 $1155
JUMPV
LABELV $1154
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $1163
line 2421
;2421:			if ( color != 2 ) {
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $1165
line 2422
;2422:				color = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 2423
;2423:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
ADDRGP4 g_color_table+64
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2424
;2424:			}
LABELV $1165
line 2425
;2425:			v = -v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
line 2426
;2426:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $1168
line 2427
;2427:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2428
;2428:			}
LABELV $1168
line 2429
;2429:			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2430
;2430:		}
LABELV $1163
LABELV $1155
line 2431
;2431:	}
LABELV $1150
line 2407
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1152
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $1149
line 2434
;2432:
;2433:	// draw the snapshot latency / drop graph
;2434:	range = ah / 2;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2435
;2435:	vscale = range / MAX_LAGOMETER_PING;
ADDRLP4 24
ADDRLP4 16
INDIRF4
CNSTF4 1147207680
DIVF4
ASGNF4
line 2437
;2436:
;2437:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1175
JUMPV
LABELV $1172
line 2438
;2438:		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 2439
;2439:		v = lagometer.snapshotSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2440
;2440:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1178
line 2441
;2441:			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1180
line 2442
;2442:				if ( color != 5 ) {
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $1181
line 2443
;2443:					color = 5;	// YELLOW for rate delay
ADDRLP4 20
CNSTI4 5
ASGNI4
line 2444
;2444:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2445
;2445:				}
line 2446
;2446:			} else {
ADDRGP4 $1181
JUMPV
LABELV $1180
line 2447
;2447:				if ( color != 3 ) {
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $1186
line 2448
;2448:					color = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 2449
;2449:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
ADDRGP4 g_color_table+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2450
;2450:				}
LABELV $1186
line 2451
;2451:			}
LABELV $1181
line 2452
;2452:			v = v * vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 2453
;2453:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $1189
line 2454
;2454:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2455
;2455:			}
LABELV $1189
line 2456
;2456:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2457
;2457:		} else if ( v < 0 ) {
ADDRGP4 $1179
JUMPV
LABELV $1178
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $1193
line 2458
;2458:			if ( color != 4 ) {
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $1195
line 2459
;2459:				color = 4;		// RED for dropped snapshots
ADDRLP4 20
CNSTI4 4
ASGNI4
line 2460
;2460:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2461
;2461:			}
LABELV $1195
line 2462
;2462:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2463
;2463:		}
LABELV $1193
LABELV $1179
line 2464
;2464:	}
LABELV $1173
line 2437
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1175
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $1172
line 2466
;2465:
;2466:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2468
;2467:
;2468:	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $1204
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1200
LABELV $1204
line 2469
;2469:		CG_DrawBigString( ax, ay, "snc", 1.0 );
ADDRLP4 28
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 $1205
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2470
;2470:	}
LABELV $1200
line 2472
;2471:
;2472:	CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 2473
;2473:}
LABELV $1141
endproc CG_DrawLagometer 68 36
export CG_CenterPrint
proc CG_CenterPrint 8 12
line 2494
;2474:
;2475:
;2476:
;2477:/*
;2478:===============================================================================
;2479:
;2480:CENTER PRINTING
;2481:
;2482:===============================================================================
;2483:*/
;2484:
;2485:
;2486:/*
;2487:==============
;2488:CG_CenterPrint
;2489:
;2490:Called for important messages that should stay in the center of the screen
;2491:for a few moments
;2492:==============
;2493:*/
;2494:void CG_CenterPrint( const char *str, int y, int charWidth ) {
line 2497
;2495:	char	*s;
;2496:
;2497:	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
ADDRGP4 cg+12060
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2499
;2498:
;2499:	cg.centerPrintTime = cg.time;
ADDRGP4 cg+12048
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2500
;2500:	cg.centerPrintY = y;
ADDRGP4 cg+12056
ADDRFP4 4
INDIRI4
ASGNI4
line 2501
;2501:	cg.centerPrintCharWidth = charWidth;
ADDRGP4 cg+12052
ADDRFP4 8
INDIRI4
ASGNI4
line 2504
;2502:
;2503:	// count the number of lines for centering
;2504:	cg.centerPrintLines = 1;
ADDRGP4 cg+13084
CNSTI4 1
ASGNI4
line 2505
;2505:	s = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+12060
ASGNP4
ADDRGP4 $1216
JUMPV
LABELV $1215
line 2506
;2506:	while( *s ) {
line 2507
;2507:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $1218
line 2508
;2508:			cg.centerPrintLines++;
ADDRLP4 4
ADDRGP4 cg+13084
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1218
line 2509
;2509:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2510
;2510:	}
LABELV $1216
line 2506
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1215
line 2511
;2511:}
LABELV $1206
endproc CG_CenterPrint 8 12
proc CG_DrawCenterString 1072 36
line 2519
;2512:
;2513:
;2514:/*
;2515:===================
;2516:CG_DrawCenterString
;2517:===================
;2518:*/
;2519:static void CG_DrawCenterString( void ) {
line 2525
;2520:	char	*start;
;2521:	int		l;
;2522:	int		x, y, w;
;2523:	int h;
;2524:	float	*color;
;2525:	const float scale = 1.0; //0.5
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 2527
;2526:
;2527:	if ( !cg.centerPrintTime ) {
ADDRGP4 cg+12048
INDIRI4
CNSTI4 0
NEI4 $1222
line 2528
;2528:		return;
ADDRGP4 $1221
JUMPV
LABELV $1222
line 2531
;2529:	}
;2530:
;2531:	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );
ADDRGP4 cg+12048
INDIRI4
ARGI4
CNSTF4 1148846080
ADDRGP4 cg_centertime+8
INDIRF4
MULF4
CVFI4 4
ARGI4
ADDRLP4 32
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
ASGNP4
line 2532
;2532:	if ( !color ) {
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1227
line 2533
;2533:		return;
ADDRGP4 $1221
JUMPV
LABELV $1227
line 2536
;2534:	}
;2535:
;2536:	trap_R_SetColor( color );
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2538
;2537:
;2538:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+12060
ASGNP4
line 2540
;2539:	
;2540:	if( ui_fragsOnly.integer != 0 ) {
ADDRGP4 ui_fragsOnly+12
INDIRI4
CNSTI4 0
EQI4 $1230
line 2542
;2541:		char sKilledStr[256],mKilledStr[256];
;2542:		trap_SP_GetStringTextString("INGAMETEXT_KILLED_MESSAGE", sKilledStr, sizeof(sKilledStr));
ADDRGP4 $1233
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 2543
;2543:		strcpy( mKilledStr, cg.centerPrint );
ADDRLP4 292
ARGP4
ADDRGP4 cg+12060
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2544
;2544:		mKilledStr[strlen(sKilledStr)]=0;
ADDRLP4 36
ARGP4
ADDRLP4 548
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
ADDRLP4 292
ADDP4
CNSTI1 0
ASGNI1
line 2545
;2545:		if(strcmp(mKilledStr,sKilledStr)!=0)return;
ADDRLP4 292
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 552
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $1235
ADDRGP4 $1221
JUMPV
LABELV $1235
line 2546
;2546:	}
LABELV $1230
line 2548
;2547:
;2548:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
ADDRLP4 16
ADDRGP4 cg+12056
INDIRI4
ADDRGP4 cg+13084
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
ADDRGP4 $1240
JUMPV
LABELV $1239
line 2550
;2549:
;2550:	while ( 1 ) {
line 2553
;2551:		char linebuffer[1024];
;2552:
;2553:		for ( l = 0; l < 50; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1242
line 2554
;2554:			if ( !start[l] || start[l] == '\n' ) {
ADDRLP4 1060
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $1248
ADDRLP4 1060
INDIRI4
CNSTI4 10
NEI4 $1246
LABELV $1248
line 2555
;2555:				break;
ADDRGP4 $1244
JUMPV
LABELV $1246
line 2557
;2556:			}
;2557:			linebuffer[l] = start[l];
ADDRLP4 4
INDIRI4
ADDRLP4 36
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 2558
;2558:		}
LABELV $1243
line 2553
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $1242
LABELV $1244
line 2559
;2559:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 36
ADDP4
CNSTI1 0
ASGNI1
line 2561
;2560:
;2561:		w = CG_Text_Width(linebuffer, scale, FONT_MEDIUM);
ADDRLP4 36
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 1060
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 1060
INDIRI4
ASGNI4
line 2562
;2562:		h = CG_Text_Height(linebuffer, scale, FONT_MEDIUM);
ADDRLP4 36
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 1064
ADDRGP4 CG_Text_Height
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 1064
INDIRI4
ASGNI4
line 2563
;2563:		x = (SCREEN_WIDTH - w) / 2;
ADDRLP4 20
CNSTI4 640
ADDRLP4 24
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 2564
;2564:		CG_Text_Paint(x, y + h, scale, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE, FONT_MEDIUM);
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2565
;2565:		y += h + 6;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 6
ADDI4
ADDI4
ASGNI4
ADDRGP4 $1250
JUMPV
LABELV $1249
line 2567
;2566:
;2567:		while ( *start && ( *start != '\n' ) ) {
line 2568
;2568:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2569
;2569:		}
LABELV $1250
line 2567
ADDRLP4 1068
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $1252
ADDRLP4 1068
INDIRI4
CNSTI4 10
NEI4 $1249
LABELV $1252
line 2570
;2570:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1253
line 2571
;2571:			break;
ADDRGP4 $1241
JUMPV
LABELV $1253
line 2573
;2572:		}
;2573:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2574
;2574:	}
LABELV $1240
line 2550
ADDRGP4 $1239
JUMPV
LABELV $1241
line 2576
;2575:
;2576:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2577
;2577:}
LABELV $1221
endproc CG_DrawCenterString 1072 36
lit
align 4
LABELV $1278
byte 4 0
byte 4 0
byte 4 0
byte 4 0
code
proc CG_DrawCrosshair 68 36
line 2595
;2578:
;2579:
;2580:
;2581:/*
;2582:================================================================================
;2583:
;2584:CROSSHAIR
;2585:
;2586:================================================================================
;2587:*/
;2588:
;2589:
;2590:/*
;2591:=================
;2592:CG_DrawCrosshair
;2593:=================
;2594:*/
;2595:static void CG_DrawCrosshair( vec3_t worldPoint, int chEntValid ) {
line 2601
;2596:	float		w, h;
;2597:	qhandle_t	hShader;
;2598:	float		f;
;2599:	float		x, y;
;2600:
;2601:	if ( !cg_drawCrosshair.integer ) 
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1256
line 2602
;2602:	{
line 2603
;2603:		return;
ADDRGP4 $1255
JUMPV
LABELV $1256
line 2606
;2604:	}
;2605:
;2606:	if (cg.snap->ps.fallingToDeath)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1259
line 2607
;2607:	{
line 2608
;2608:		return;
ADDRGP4 $1255
JUMPV
LABELV $1259
line 2611
;2609:	}
;2610:
;2611:	if ( cg.predictedPlayerState.zoomMode != 0 )
ADDRGP4 cg+96+1332
INDIRI4
CNSTI4 0
EQI4 $1262
line 2612
;2612:	{//not while scoped
line 2613
;2613:		return;
ADDRGP4 $1255
JUMPV
LABELV $1262
line 2616
;2614:	}
;2615:
;2616:	if ( cg_crosshairHealth.integer )
ADDRGP4 cg_crosshairHealth+12
INDIRI4
CNSTI4 0
EQI4 $1266
line 2617
;2617:	{
line 2620
;2618:		vec4_t		hcolor;
;2619:
;2620:		CG_ColorForHealth( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 2621
;2621:		trap_R_SetColor( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2622
;2622:	}
ADDRGP4 $1267
JUMPV
LABELV $1266
line 2624
;2623:	else
;2624:	{
line 2626
;2625:		//set color based on what kind of ent is under crosshair
;2626:		if ( cg.crosshairClientNum >= ENTITYNUM_WORLD )
ADDRGP4 cg+13096
INDIRI4
CNSTI4 1022
LTI4 $1269
line 2627
;2627:		{
line 2628
;2628:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2629
;2629:		}
ADDRGP4 $1270
JUMPV
LABELV $1269
line 2630
;2630:		else if (chEntValid && (cg_entities[cg.crosshairClientNum].currentState.number < MAX_CLIENTS || cg_entities[cg.crosshairClientNum].currentState.shouldtarget))
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1272
ADDRLP4 28
CNSTI4 1920
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 cg+13096
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1277
ADDRLP4 28
INDIRI4
ADDRGP4 cg+13096
INDIRI4
MULI4
ADDRGP4 cg_entities+268
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1272
LABELV $1277
line 2631
;2631:		{
line 2632
;2632:			vec4_t	ecolor = {0,0,0,0};
ADDRLP4 32
ADDRGP4 $1278
INDIRB
ASGNB 16
line 2633
;2633:			centity_t *crossEnt = &cg_entities[cg.crosshairClientNum];
ADDRLP4 48
CNSTI4 1920
ADDRGP4 cg+13096
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2635
;2634:
;2635:			if ( crossEnt->currentState.number < MAX_CLIENTS )
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $1280
line 2636
;2636:			{
line 2637
;2637:				if (cgs.gametype >= GT_TEAM &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $1282
ADDRLP4 52
CNSTI4 788
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 48
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
NEI4 $1282
line 2639
;2638:					cgs.clientinfo[crossEnt->currentState.number].team == cgs.clientinfo[cg.snap->ps.clientNum].team )
;2639:				{
line 2641
;2640:					//Allies are green
;2641:					ecolor[0] = 0.0;//R
ADDRLP4 32
CNSTF4 0
ASGNF4
line 2642
;2642:					ecolor[1] = 1.0;//G
ADDRLP4 32+4
CNSTF4 1065353216
ASGNF4
line 2643
;2643:					ecolor[2] = 0.0;//B
ADDRLP4 32+8
CNSTF4 0
ASGNF4
line 2644
;2644:				}
ADDRGP4 $1283
JUMPV
LABELV $1282
line 2646
;2645:				else
;2646:				{
line 2648
;2647:					//Enemies are red
;2648:					ecolor[0] = 1.0;//R
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 2649
;2649:					ecolor[1] = 0.0;//G
ADDRLP4 32+4
CNSTF4 0
ASGNF4
line 2650
;2650:					ecolor[2] = 0.0;//B
ADDRLP4 32+8
CNSTF4 0
ASGNF4
line 2651
;2651:				}
LABELV $1283
line 2653
;2652:
;2653:				if (cg.snap->ps.duelInProgress)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1294
line 2654
;2654:				{
line 2655
;2655:					if (crossEnt->currentState.number != cg.snap->ps.duelIndex)
ADDRLP4 48
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
EQI4 $1281
line 2656
;2656:					{ //grey out crosshair for everyone but your foe if you're in a duel
line 2657
;2657:						ecolor[0] = 0.4;
ADDRLP4 32
CNSTF4 1053609165
ASGNF4
line 2658
;2658:						ecolor[1] = 0.4;
ADDRLP4 32+4
CNSTF4 1053609165
ASGNF4
line 2659
;2659:						ecolor[2] = 0.4;
ADDRLP4 32+8
CNSTF4 1053609165
ASGNF4
line 2660
;2660:					}
line 2661
;2661:				}
ADDRGP4 $1281
JUMPV
LABELV $1294
line 2662
;2662:				else if (crossEnt->currentState.bolt1)
ADDRLP4 48
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1281
line 2663
;2663:				{ //this fellow is in a duel. We just checked if we were in a duel above, so
line 2665
;2664:				  //this means we aren't and he is. Which of course means our crosshair greys out over him.
;2665:					ecolor[0] = 0.4;
ADDRLP4 32
CNSTF4 1053609165
ASGNF4
line 2666
;2666:					ecolor[1] = 0.4;
ADDRLP4 32+4
CNSTF4 1053609165
ASGNF4
line 2667
;2667:					ecolor[2] = 0.4;
ADDRLP4 32+8
CNSTF4 1053609165
ASGNF4
line 2668
;2668:				}
line 2669
;2669:			}
ADDRGP4 $1281
JUMPV
LABELV $1280
line 2670
;2670:			else if (crossEnt->currentState.shouldtarget)
ADDRLP4 48
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1306
line 2671
;2671:			{
line 2673
;2672:				//VectorCopy( crossEnt->startRGBA, ecolor );
;2673:				if ( !ecolor[0] && !ecolor[1] && !ecolor[2] )
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 52
INDIRF4
NEF4 $1308
ADDRLP4 32+4
INDIRF4
ADDRLP4 52
INDIRF4
NEF4 $1308
ADDRLP4 32+8
INDIRF4
ADDRLP4 52
INDIRF4
NEF4 $1308
line 2674
;2674:				{
line 2676
;2675:					// We really don't want black, so set it to yellow
;2676:					ecolor[0] = 1.0F;//R
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 2677
;2677:					ecolor[1] = 0.8F;//G
ADDRLP4 32+4
CNSTF4 1061997773
ASGNF4
line 2678
;2678:					ecolor[2] = 0.3F;//B
ADDRLP4 32+8
CNSTF4 1050253722
ASGNF4
line 2679
;2679:				}
LABELV $1308
line 2681
;2680:
;2681:				if (crossEnt->currentState.owner == cg.snap->ps.clientNum ||
ADDRLP4 56
ADDRLP4 48
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 188
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
EQI4 $1321
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $1314
ADDRLP4 56
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
NEI4 $1314
LABELV $1321
line 2683
;2682:					(cgs.gametype >= GT_TEAM && crossEnt->currentState.teamowner == cgs.clientinfo[cg.snap->ps.clientNum].team))
;2683:				{
line 2684
;2684:					ecolor[0] = 0.0;//R
ADDRLP4 32
CNSTF4 0
ASGNF4
line 2685
;2685:					ecolor[1] = 1.0;//G
ADDRLP4 32+4
CNSTF4 1065353216
ASGNF4
line 2686
;2686:					ecolor[2] = 0.0;//B
ADDRLP4 32+8
CNSTF4 0
ASGNF4
line 2687
;2687:				}
ADDRGP4 $1315
JUMPV
LABELV $1314
line 2688
;2688:				else if (crossEnt->currentState.teamowner == 16 ||
ADDRLP4 64
ADDRLP4 48
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 16
EQI4 $1330
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $1324
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $1324
ADDRLP4 64
INDIRI4
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
EQI4 $1324
LABELV $1330
line 2690
;2689:					(cgs.gametype >= GT_TEAM && crossEnt->currentState.teamowner && crossEnt->currentState.teamowner != cgs.clientinfo[cg.snap->ps.clientNum].team))
;2690:				{
line 2691
;2691:					ecolor[0] = 1.0;//R
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 2692
;2692:					ecolor[1] = 0.0;//G
ADDRLP4 32+4
CNSTF4 0
ASGNF4
line 2693
;2693:					ecolor[2] = 0.0;//B
ADDRLP4 32+8
CNSTF4 0
ASGNF4
line 2694
;2694:				}
ADDRGP4 $1325
JUMPV
LABELV $1324
line 2695
;2695:				else if (crossEnt->currentState.eType == ET_GRAPPLE)
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1333
line 2696
;2696:				{
line 2697
;2697:					ecolor[0] = 1.0;//R
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 2698
;2698:					ecolor[1] = 0.0;//G
ADDRLP4 32+4
CNSTF4 0
ASGNF4
line 2699
;2699:					ecolor[2] = 0.0;//B
ADDRLP4 32+8
CNSTF4 0
ASGNF4
line 2700
;2700:				}
LABELV $1333
LABELV $1325
LABELV $1315
line 2701
;2701:			}
LABELV $1306
LABELV $1281
line 2703
;2702:
;2703:			ecolor[3] = 1.0;
ADDRLP4 32+12
CNSTF4 1065353216
ASGNF4
line 2705
;2704:
;2705:			trap_R_SetColor( ecolor );
ADDRLP4 32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2706
;2706:		}
LABELV $1272
LABELV $1270
line 2707
;2707:	}
LABELV $1267
line 2709
;2708:
;2709:	w = h = cg_crosshairSize.value;
ADDRLP4 24
ADDRGP4 cg_crosshairSize+8
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 2712
;2710:
;2711:	// pulse the size of the crosshair when picking up items
;2712:	f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 0
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+13368
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 2713
;2713:	if ( f > 0 && f < ITEM_BLOB_TIME ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1341
ADDRLP4 0
INDIRF4
CNSTF4 1128792064
GEF4 $1341
line 2714
;2714:		f /= ITEM_BLOB_TIME;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 2715
;2715:		w *= ( 1 + f );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 2716
;2716:		h *= ( 1 + f );
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 2717
;2717:	}
LABELV $1341
line 2719
;2718:
;2719:	if ( worldPoint && VectorLength( worldPoint ) )
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1343
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 0
EQF4 $1343
line 2720
;2720:	{
line 2721
;2721:		if ( !CG_WorldCoordToScreenCoordFloat( worldPoint, &x, &y ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 40
ADDRGP4 CG_WorldCoordToScreenCoordFloat
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1345
line 2722
;2722:		{//off screen, don't draw it
line 2723
;2723:			return;
ADDRGP4 $1255
JUMPV
LABELV $1345
line 2725
;2724:		}
;2725:		x -= 320;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1134559232
SUBF4
ASGNF4
line 2726
;2726:		y -= 240;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1131413504
SUBF4
ASGNF4
line 2727
;2727:	}
ADDRGP4 $1344
JUMPV
LABELV $1343
line 2729
;2728:	else
;2729:	{
line 2730
;2730:		x = cg_crosshairX.integer;
ADDRLP4 12
ADDRGP4 cg_crosshairX+12
INDIRI4
CVIF4 4
ASGNF4
line 2731
;2731:		y = cg_crosshairY.integer;
ADDRLP4 16
ADDRGP4 cg_crosshairY+12
INDIRI4
CVIF4 4
ASGNF4
line 2732
;2732:	}
LABELV $1344
line 2734
;2733:
;2734:	hShader = cgs.media.crosshairShader[ cg_drawCrosshair.integer % NUM_CROSSHAIRS ];
ADDRLP4 20
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+200
ADDP4
INDIRI4
ASGNI4
line 2736
;2735:
;2736:	trap_R_DrawStretchPic( x + cg.refdef.x + 0.5 * (640 - w), 
ADDRLP4 40
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
INDIRF4
ADDRGP4 cg+3616
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 40
INDIRF4
CNSTF4 1142947840
ADDRLP4 4
INDIRF4
SUBF4
MULF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRGP4 cg+3616+4
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 40
INDIRF4
CNSTF4 1139802112
ADDRLP4 8
INDIRF4
SUBF4
MULF4
ADDF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2739
;2737:		y + cg.refdef.y + 0.5 * (480 - h), 
;2738:		w, h, 0, 0, 1, 1, hShader );
;2739:}
LABELV $1255
endproc CG_DrawCrosshair 68 36
export CG_WorldCoordToScreenCoordFloat
proc CG_WorldCoordToScreenCoordFloat 80 16
line 2742
;2740:
;2741:qboolean CG_WorldCoordToScreenCoordFloat(vec3_t worldCoord, float *x, float *y)
;2742:{
line 2756
;2743:	int	xcenter, ycenter;
;2744:	vec3_t	local, transformed;
;2745:	vec3_t	vfwd;
;2746:	vec3_t	vright;
;2747:	vec3_t	vup;
;2748:	float xzi;
;2749:	float yzi;
;2750:
;2751://	xcenter = cg.refdef.width / 2;//gives screen coords adjusted for resolution
;2752://	ycenter = cg.refdef.height / 2;//gives screen coords adjusted for resolution
;2753:	
;2754:	//NOTE: did it this way because most draw functions expect virtual 640x480 coords
;2755:	//	and adjust them for current resolution
;2756:	xcenter = 640 / 2;//gives screen coords in virtual 640x480, to be adjusted when drawn
ADDRLP4 60
CNSTI4 320
ASGNI4
line 2757
;2757:	ycenter = 480 / 2;//gives screen coords in virtual 640x480, to be adjusted when drawn
ADDRLP4 64
CNSTI4 240
ASGNI4
line 2759
;2758:
;2759:	AngleVectors (cg.refdefViewAngles, vfwd, vright, vup);
ADDRGP4 cg+3984
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2761
;2760:
;2761:	VectorSubtract (worldCoord, cg.refdef.vieworg, local);
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
INDIRF4
ADDRGP4 cg+3616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 cg+3616+24+8
INDIRF4
SUBF4
ASGNF4
line 2763
;2762:
;2763:	transformed[0] = DotProduct(local,vright);
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2764
;2764:	transformed[1] = DotProduct(local,vup);
ADDRLP4 12+4
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2765
;2765:	transformed[2] = DotProduct(local,vfwd);		
ADDRLP4 12+8
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2768
;2766:
;2767:	// Make sure Z is not negative.
;2768:	if(transformed[2] < 0.01)
ADDRLP4 12+8
INDIRF4
CNSTF4 1008981770
GEF4 $1381
line 2769
;2769:	{
line 2770
;2770:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1355
JUMPV
LABELV $1381
line 2773
;2771:	}
;2772:
;2773:	xzi = xcenter / transformed[2] * (90.0/cg.refdef.fov_x);
ADDRLP4 68
ADDRLP4 60
INDIRI4
CVIF4 4
ADDRLP4 12+8
INDIRF4
DIVF4
CNSTF4 1119092736
ADDRGP4 cg+3616+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 2774
;2774:	yzi = ycenter / transformed[2] * (90.0/cg.refdef.fov_y);
ADDRLP4 72
ADDRLP4 64
INDIRI4
CVIF4 4
ADDRLP4 12+8
INDIRF4
DIVF4
CNSTF4 1119092736
ADDRGP4 cg+3616+20
INDIRF4
DIVF4
MULF4
ASGNF4
line 2776
;2775:
;2776:	*x = xcenter + xzi * transformed[0];
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
CVIF4 4
ADDRLP4 68
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2777
;2777:	*y = ycenter - yzi * transformed[1];
ADDRFP4 8
INDIRP4
ADDRLP4 64
INDIRI4
CVIF4 4
ADDRLP4 72
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2779
;2778:
;2779:	return qtrue;
CNSTI4 1
RETI4
LABELV $1355
endproc CG_WorldCoordToScreenCoordFloat 80 16
export CG_WorldCoordToScreenCoord
proc CG_WorldCoordToScreenCoord 16 12
line 2783
;2780:}
;2781:
;2782:qboolean CG_WorldCoordToScreenCoord( vec3_t worldCoord, int *x, int *y )
;2783:{
line 2785
;2784:	float	xF, yF;
;2785:	qboolean retVal = CG_WorldCoordToScreenCoordFloat( worldCoord, &xF, &yF );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 CG_WorldCoordToScreenCoordFloat
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 2786
;2786:	*x = (int)xF;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 2787
;2787:	*y = (int)yF;
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 2788
;2788:	return retVal;
ADDRLP4 8
INDIRI4
RETI4
LABELV $1391
endproc CG_WorldCoordToScreenCoord 16 12
data
export g_saberFlashTime
align 4
LABELV g_saberFlashTime
byte 4 0
export g_saberFlashPos
align 4
LABELV g_saberFlashPos
byte 4 0
byte 4 0
byte 4 0
export CG_SaberClashFlare
code
proc CG_SaberClashFlare 1164 28
line 2799
;2789:}
;2790:
;2791:/*
;2792:====================
;2793:CG_SaberClashFlare
;2794:====================
;2795:*/
;2796:int g_saberFlashTime = 0;
;2797:vec3_t g_saberFlashPos = {0, 0, 0};
;2798:void CG_SaberClashFlare( void ) 
;2799:{
line 2800
;2800:	int				t, maxTime = 150;
ADDRLP4 36
CNSTI4 150
ASGNI4
line 2807
;2801:	vec3_t dif;
;2802:	vec3_t color;
;2803:	int x,y;
;2804:	float v, len;
;2805:	trace_t tr;
;2806:
;2807:	t = cg.time - g_saberFlashTime;
ADDRLP4 16
ADDRGP4 cg+64
INDIRI4
ADDRGP4 g_saberFlashTime
INDIRI4
SUBI4
ASGNI4
line 2809
;2808:
;2809:	if ( t <= 0 || t >= maxTime ) 
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $1396
ADDRLP4 16
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $1394
LABELV $1396
line 2810
;2810:	{
line 2811
;2811:		return;
ADDRGP4 $1392
JUMPV
LABELV $1394
line 2815
;2812:	}
;2813:
;2814:	// Don't do clashes for things that are behind us
;2815:	VectorSubtract( g_saberFlashPos, cg.refdef.vieworg, dif );
ADDRLP4 0
ADDRGP4 g_saberFlashPos
INDIRF4
ADDRGP4 cg+3616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 g_saberFlashPos+4
INDIRF4
ADDRGP4 cg+3616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 g_saberFlashPos+8
INDIRF4
ADDRGP4 cg+3616+24+8
INDIRF4
SUBF4
ASGNF4
line 2817
;2816:
;2817:	if ( DotProduct( dif, cg.refdef.viewaxis[0] ) < 0.2 )
ADDRLP4 0
INDIRF4
ADDRGP4 cg+3616+36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+3616+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+3616+36+8
INDIRF4
MULF4
ADDF4
CNSTF4 1045220557
GEF4 $1409
line 2818
;2818:	{
line 2819
;2819:		return;
ADDRGP4 $1392
JUMPV
LABELV $1409
line 2822
;2820:	}
;2821:
;2822:	CG_Trace( &tr, cg.refdef.vieworg, NULL, NULL, g_saberFlashPos, -1, CONTENTS_SOLID );
ADDRLP4 48
ARGP4
ADDRGP4 cg+3616+24
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
ADDRGP4 g_saberFlashPos
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2824
;2823:
;2824:	if ( tr.fraction < 1.0f )
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
GEF4 $1423
line 2825
;2825:	{
line 2826
;2826:		return;
ADDRGP4 $1392
JUMPV
LABELV $1423
line 2829
;2827:	}
;2828:
;2829:	len = VectorNormalize( dif );
ADDRLP4 0
ARGP4
ADDRLP4 1136
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 1136
INDIRF4
ASGNF4
line 2832
;2830:
;2831:	// clamp to a known range
;2832:	if ( len > 800 )
ADDRLP4 32
INDIRF4
CNSTF4 1145569280
LEF4 $1426
line 2833
;2833:	{
line 2834
;2834:		len = 800;
ADDRLP4 32
CNSTF4 1145569280
ASGNF4
line 2835
;2835:	}
LABELV $1426
line 2837
;2836:
;2837:	v = ( 1.0f - ((float)t / maxTime )) * ((1.0f - ( len / 800.0f )) * 2.0f + 0.35f);
ADDRLP4 1140
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
ADDRLP4 1140
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRI4
CVIF4 4
DIVF4
SUBF4
CNSTF4 1073741824
ADDRLP4 1140
INDIRF4
ADDRLP4 32
INDIRF4
CNSTF4 1145569280
DIVF4
SUBF4
MULF4
CNSTF4 1051931443
ADDF4
MULF4
ASGNF4
line 2839
;2838:
;2839:	CG_WorldCoordToScreenCoord( g_saberFlashPos, &x, &y );
ADDRGP4 g_saberFlashPos
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CG_WorldCoordToScreenCoord
CALLI4
pop
line 2841
;2840:
;2841:	VectorSet( color, 0.8f, 0.8f, 0.8f );
ADDRLP4 1144
CNSTF4 1061997773
ASGNF4
ADDRLP4 20
ADDRLP4 1144
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 1144
INDIRF4
ASGNF4
ADDRLP4 20+8
CNSTF4 1061997773
ASGNF4
line 2842
;2842:	trap_R_SetColor( color );
ADDRLP4 20
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2844
;2843:
;2844:	CG_DrawPic( x - ( v * 300 ), y - ( v * 300 ),
ADDRGP4 $1430
ARGP4
ADDRLP4 1148
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 1156
CNSTF4 1133903872
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRLP4 1156
INDIRF4
SUBF4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ADDRLP4 1156
INDIRF4
SUBF4
ARGF4
ADDRLP4 1160
CNSTF4 1142292480
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 1160
INDIRF4
ARGF4
ADDRLP4 1160
INDIRF4
ARGF4
ADDRLP4 1148
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2847
;2845:				v * 600, v * 600,
;2846:				trap_R_RegisterShader( "gfx/effects/saberFlare" ));
;2847:}
LABELV $1392
endproc CG_SaberClashFlare 1164 28
proc CG_DrawHolocronIcons 28 20
line 2852
;2848:
;2849://--------------------------------------------------------------
;2850:static void CG_DrawHolocronIcons(void)
;2851://--------------------------------------------------------------
;2852:{
line 2853
;2853:	int icon_size = 40;
ADDRLP4 8
CNSTI4 40
ASGNI4
line 2854
;2854:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2855
;2855:	int startx = 10;
ADDRLP4 12
CNSTI4 10
ASGNI4
line 2856
;2856:	int starty = 10;//SCREEN_HEIGHT - icon_size*3;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 2858
;2857:
;2858:	int endx = icon_size;
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
line 2859
;2859:	int endy = icon_size;
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
line 2861
;2860:
;2861:	if (cg.snap->ps.zoomMode)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1432
line 2862
;2862:	{ //don't display over zoom mask
line 2863
;2863:		return;
ADDRGP4 $1431
JUMPV
LABELV $1432
line 2866
;2864:	}
;2865:
;2866:	if (cgs.clientinfo[cg.snap->ps.clientNum].team == TEAM_SPECTATOR)
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1441
line 2867
;2867:	{
line 2868
;2868:		return;
ADDRGP4 $1431
JUMPV
LABELV $1440
line 2872
;2869:	}
;2870:
;2871:	while (i < NUM_FORCE_POWERS)
;2872:	{
line 2873
;2873:		if (cg.snap->ps.holocronBits & (1 << forcePowerSorted[i]))
ADDRGP4 cg+36
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1443
line 2874
;2874:		{
line 2875
;2875:			CG_DrawPic( startx, starty, endx, endy, cgs.media.forcePowerIcons[forcePowerSorted[i]]);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LSHI4
ADDRGP4 cgs+70296+1084
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2876
;2876:			starty += (icon_size+2); //+2 for spacing
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 2877
;2877:			if ((starty+icon_size) >= SCREEN_HEIGHT-80)
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 400
LTI4 $1448
line 2878
;2878:			{
line 2879
;2879:				starty = 10;//SCREEN_HEIGHT - icon_size*3;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 2880
;2880:				startx += (icon_size+2);
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 2881
;2881:			}
LABELV $1448
line 2882
;2882:		}
LABELV $1443
line 2884
;2883:
;2884:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2885
;2885:	}
LABELV $1441
line 2871
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1440
line 2886
;2886:}
LABELV $1431
endproc CG_DrawHolocronIcons 28 20
proc CG_IsDurationPower 4 0
line 2889
;2887:
;2888:static qboolean CG_IsDurationPower(int power)
;2889:{
line 2890
;2890:	if (power == FP_HEAL ||
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1458
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $1458
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $1458
ADDRLP4 0
INDIRI4
CNSTI4 8
EQI4 $1458
ADDRLP4 0
INDIRI4
CNSTI4 9
EQI4 $1458
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1458
ADDRLP4 0
INDIRI4
CNSTI4 14
NEI4 $1451
LABELV $1458
line 2897
;2891:		power == FP_SPEED ||
;2892:		power == FP_TELEPATHY ||
;2893:		power == FP_RAGE ||
;2894:		power == FP_PROTECT ||
;2895:		power == FP_ABSORB ||
;2896:		power == FP_SEE)
;2897:	{
line 2898
;2898:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1450
JUMPV
LABELV $1451
line 2901
;2899:	}
;2900:
;2901:	return qfalse;
CNSTI4 0
RETI4
LABELV $1450
endproc CG_IsDurationPower 4 0
proc CG_DrawActivePowers 36 20
line 2907
;2902:}
;2903:
;2904://--------------------------------------------------------------
;2905:static void CG_DrawActivePowers(void)
;2906://--------------------------------------------------------------
;2907:{
line 2908
;2908:	int icon_size = 40;
ADDRLP4 4
CNSTI4 40
ASGNI4
line 2909
;2909:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2910
;2910:	int startx = icon_size*2+16;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 16
ADDI4
ASGNI4
line 2911
;2911:	int starty = SCREEN_HEIGHT - icon_size*2;
ADDRLP4 12
CNSTI4 480
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ASGNI4
line 2913
;2912:
;2913:	int endx = icon_size;
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
line 2914
;2914:	int endy = icon_size;
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
line 2916
;2915:
;2916:	if (cg.snap->ps.zoomMode)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1460
line 2917
;2917:	{ //don't display over zoom mask
line 2918
;2918:		return;
ADDRGP4 $1459
JUMPV
LABELV $1460
line 2921
;2919:	}
;2920:
;2921:	if (cgs.clientinfo[cg.snap->ps.clientNum].team == TEAM_SPECTATOR)
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1469
line 2922
;2922:	{
line 2923
;2923:		return;
ADDRGP4 $1459
JUMPV
LABELV $1468
line 2927
;2924:	}
;2925:
;2926:	while (i < NUM_FORCE_POWERS)
;2927:	{
line 2928
;2928:		if ((cg.snap->ps.fd.forcePowersActive & (1 << forcePowerSorted[i])) &&
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 24
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1471
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_IsDurationPower
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1471
line 2930
;2929:			CG_IsDurationPower(forcePowerSorted[i]))
;2930:		{
line 2931
;2931:			CG_DrawPic( startx, starty, endx, endy, cgs.media.forcePowerIcons[forcePowerSorted[i]]);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 cgs+70296+1084
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2932
;2932:			startx += (icon_size+2); //+2 for spacing
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 2933
;2933:			if ((startx+icon_size) >= SCREEN_WIDTH-80)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
CNSTI4 560
LTI4 $1476
line 2934
;2934:			{
line 2935
;2935:				startx = icon_size*2+16;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 16
ADDI4
ASGNI4
line 2936
;2936:				starty += (icon_size+2);
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 2937
;2937:			}
LABELV $1476
line 2938
;2938:		}
LABELV $1471
line 2940
;2939:
;2940:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2941
;2941:	}
LABELV $1469
line 2926
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1468
line 2944
;2942:
;2943:	//additionally, draw an icon force force rage recovery
;2944:	if (cg.snap->ps.fd.forceRageRecoveryTime > cg.time)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $1478
line 2945
;2945:	{
line 2946
;2946:		CG_DrawPic( startx, starty, endx, endy, cgs.media.rageRecShader);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+70296+1156
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2947
;2947:	}
LABELV $1478
line 2948
;2948:}
LABELV $1459
endproc CG_DrawActivePowers 36 20
data
align 4
LABELV $1485
byte 4 0
lit
align 4
LABELV $1486
byte 4 0
byte 4 0
byte 4 0
byte 4 0
code
proc CG_DrawRocketLocking 88 24
line 2953
;2949:
;2950://--------------------------------------------------------------
;2951:static void CG_DrawRocketLocking( int lockEntNum, int lockTime )
;2952://--------------------------------------------------------------
;2953:{
line 2957
;2954:	int		cx, cy;
;2955:	vec3_t	org;
;2956:	static	int oldDif = 0;
;2957:	centity_t *cent = &cg_entities[lockEntNum];
ADDRLP4 32
CNSTI4 1920
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2958
;2958:	vec4_t color={0.0f,0.0f,0.0f,0.0f};
ADDRLP4 0
ADDRGP4 $1486
INDIRB
ASGNB 16
line 2959
;2959:	int dif = ( cg.time - cg.snap->ps.rocketLockTime ) / ( 1200.0f / /*8.0f*/16.0f );
ADDRLP4 20
ADDRGP4 cg+64
INDIRI4
CVIF4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
SUBF4
CNSTF4 1117126656
DIVF4
CVFI4 4
ASGNI4
line 2962
;2960:	int i;
;2961:
;2962:	if (!cg.snap->ps.rocketLockTime)
ADDRGP4 cg+36
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1489
line 2963
;2963:	{
line 2964
;2964:		return;
ADDRGP4 $1484
JUMPV
LABELV $1489
line 2967
;2965:	}
;2966:
;2967:	if (cgs.clientinfo[cg.snap->ps.clientNum].team == TEAM_SPECTATOR)
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1492
line 2968
;2968:	{
line 2969
;2969:		return;
ADDRGP4 $1484
JUMPV
LABELV $1492
line 2974
;2970:	}
;2971:
;2972:	//We can't check to see in pmove if players are on the same team, so we resort
;2973:	//to just not drawing the lock if a teammate is the locked on ent
;2974:	if (cg.snap->ps.rocketLockIndex >= 0 &&
ADDRLP4 48
CNSTI4 624
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1497
ADDRGP4 cg+36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
CNSTI4 32
GEI4 $1497
line 2976
;2975:		cg.snap->ps.rocketLockIndex < MAX_CLIENTS)
;2976:	{
line 2977
;2977:		if (cgs.clientinfo[cg.snap->ps.rocketLockIndex].team == cgs.clientinfo[cg.snap->ps.clientNum].team)
ADDRLP4 52
CNSTI4 788
ASGNI4
ADDRLP4 52
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
NEI4 $1501
line 2978
;2978:		{
line 2979
;2979:			if (cgs.gametype >= GT_TEAM)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $1509
line 2980
;2980:			{
line 2981
;2981:				return;
ADDRGP4 $1484
JUMPV
LABELV $1509
line 2983
;2982:			}
;2983:		}
LABELV $1501
line 2984
;2984:	}
LABELV $1497
line 2986
;2985:
;2986:	if (cg.snap->ps.rocketLockTime != -1)
ADDRGP4 cg+36
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
CNSTF4 3212836864
EQF4 $1512
line 2987
;2987:	{
line 2988
;2988:		lastvalidlockdif = dif;
ADDRGP4 lastvalidlockdif
ADDRLP4 20
INDIRI4
ASGNI4
line 2989
;2989:	}
ADDRGP4 $1513
JUMPV
LABELV $1512
line 2991
;2990:	else
;2991:	{
line 2992
;2992:		dif = lastvalidlockdif;
ADDRLP4 20
ADDRGP4 lastvalidlockdif
INDIRI4
ASGNI4
line 2993
;2993:	}
LABELV $1513
line 2995
;2994:
;2995:	if ( !cent )
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1515
line 2996
;2996:	{
line 2997
;2997:		return;
ADDRGP4 $1484
JUMPV
LABELV $1515
line 3000
;2998:	}
;2999:
;3000:	VectorCopy( cent->lerpOrigin, org );
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 928
ADDP4
INDIRB
ASGNB 12
line 3002
;3001:
;3002:	if ( CG_WorldCoordToScreenCoord( org, &cx, &cy ))
ADDRLP4 36
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 52
ADDRGP4 CG_WorldCoordToScreenCoord
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $1517
line 3003
;3003:	{
line 3005
;3004:		// we care about distance from enemy to eye, so this is good enough
;3005:		float sz = Distance( cent->lerpOrigin, cg.refdef.vieworg ) / 1024.0f; 
ADDRLP4 32
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 cg+3616+24
ARGP4
ADDRLP4 60
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 60
INDIRF4
CNSTF4 1149239296
DIVF4
ASGNF4
line 3007
;3006:		
;3007:		if ( sz > 1.0f )
ADDRLP4 56
INDIRF4
CNSTF4 1065353216
LEF4 $1521
line 3008
;3008:		{
line 3009
;3009:			sz = 1.0f;
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
line 3010
;3010:		}
ADDRGP4 $1522
JUMPV
LABELV $1521
line 3011
;3011:		else if ( sz < 0.0f )
ADDRLP4 56
INDIRF4
CNSTF4 0
GEF4 $1523
line 3012
;3012:		{
line 3013
;3013:			sz = 0.0f;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 3014
;3014:		}
LABELV $1523
LABELV $1522
line 3016
;3015:
;3016:		sz = (1.0f - sz) * (1.0f - sz) * 32 + 6;
ADDRLP4 64
CNSTF4 1065353216
ADDRLP4 56
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTF4 1107296256
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
CNSTF4 1086324736
ADDF4
ASGNF4
line 3018
;3017:
;3018:		cy += sz * 0.5f;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 56
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3020
;3019:		
;3020:		if ( dif < 0 )
ADDRLP4 20
INDIRI4
CNSTI4 0
GEI4 $1525
line 3021
;3021:		{
line 3022
;3022:			oldDif = 0;
ADDRGP4 $1485
CNSTI4 0
ASGNI4
line 3023
;3023:			return;
ADDRGP4 $1484
JUMPV
LABELV $1525
line 3025
;3024:		}
;3025:		else if ( dif > 8 )
ADDRLP4 20
INDIRI4
CNSTI4 8
LEI4 $1527
line 3026
;3026:		{
line 3027
;3027:			dif = 8;
ADDRLP4 20
CNSTI4 8
ASGNI4
line 3028
;3028:		}
LABELV $1527
line 3031
;3029:
;3030:		// do sounds
;3031:		if ( oldDif != dif )
ADDRGP4 $1485
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $1529
line 3032
;3032:		{
line 3033
;3033:			if ( dif == 8 )
ADDRLP4 20
INDIRI4
CNSTI4 8
NEI4 $1531
line 3034
;3034:			{
line 3035
;3035:				trap_S_StartSound( org, 0, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/rocket/lock.wav" ));
ADDRGP4 $1533
ARGP4
ADDRLP4 68
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 36
ARGP4
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 3036
;3036:			}
ADDRGP4 $1532
JUMPV
LABELV $1531
line 3038
;3037:			else
;3038:			{
line 3039
;3039:				trap_S_StartSound( org, 0, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/rocket/tick.wav" ));
ADDRGP4 $1534
ARGP4
ADDRLP4 68
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 36
ARGP4
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 3040
;3040:			}
LABELV $1532
line 3041
;3041:		}
LABELV $1529
line 3043
;3042:
;3043:		oldDif = dif;
ADDRGP4 $1485
ADDRLP4 20
INDIRI4
ASGNI4
line 3045
;3044:
;3045:		for ( i = 0; i < dif; i++ )
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $1538
JUMPV
LABELV $1535
line 3046
;3046:		{
line 3047
;3047:			color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 3048
;3048:			color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 3049
;3049:			color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 3050
;3050:			color[3] = 0.1f * i + 0.2f;
ADDRLP4 0+12
CNSTF4 1036831949
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 3052
;3051:
;3052:			trap_R_SetColor( color );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 3055
;3053:
;3054:			// our slices are offset by about 45 degrees.
;3055:			CG_DrawRotatePic( cx - sz, cy - sz, sz, sz, i * 45.0f, trap_R_RegisterShaderNoMip( "gfx/2d/wedge" ));
ADDRGP4 $1542
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 56
INDIRF4
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 56
INDIRF4
SUBF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1110704128
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_DrawRotatePic
CALLV
pop
line 3056
;3056:		}
LABELV $1536
line 3045
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1538
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $1535
line 3059
;3057:
;3058:		// we are locked and loaded baby
;3059:		if ( dif == 8 )
ADDRLP4 20
INDIRI4
CNSTI4 8
NEI4 $1543
line 3060
;3060:		{
line 3061
;3061:			color[0] = color[1] = color[2] = sin( cg.time * 0.05f ) * 0.5f + 0.5f;
CNSTF4 1028443341
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 72
CNSTF4 1056964608
ADDRLP4 68
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 72
INDIRF4
ASGNF4
line 3062
;3062:			color[3] = 1.0f; // this art is additive, so the alpha value does nothing
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 3064
;3063:
;3064:			trap_R_SetColor( color );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 3066
;3065:
;3066:			CG_DrawPic( cx - sz, cy - sz * 2, sz * 2, sz * 2, trap_R_RegisterShaderNoMip( "gfx/2d/lock" ));
ADDRGP4 $1549
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 56
INDIRF4
SUBF4
ARGF4
ADDRLP4 84
CNSTF4 1073741824
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 84
INDIRF4
SUBF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 3067
;3067:		}
LABELV $1543
line 3068
;3068:	}
LABELV $1517
line 3069
;3069:}
LABELV $1484
endproc CG_DrawRocketLocking 88 24
proc CG_ScanForCrosshairEntity 1156 28
line 3076
;3070:
;3071:/*
;3072:=================
;3073:CG_ScanForCrosshairEntity
;3074:=================
;3075:*/
;3076:static void CG_ScanForCrosshairEntity( void ) {
line 3081
;3077:	trace_t		trace;
;3078:	vec3_t		start, end;
;3079:	int			content;
;3080:
;3081:	if ( cg_dynamicCrosshair.integer )
ADDRGP4 cg_dynamicCrosshair+12
INDIRI4
CNSTI4 0
EQI4 $1551
line 3082
;3082:	{
line 3096
;3083:		vec3_t d_f, d_rt, d_up;
;3084:		/*
;3085:		if ( cg.snap->ps.weapon == WP_NONE || 
;3086:			cg.snap->ps.weapon == WP_SABER || 
;3087:			cg.snap->ps.weapon == WP_STUN_BATON)
;3088:		{
;3089:			VectorCopy( cg.refdef.vieworg, start );
;3090:			AngleVectors( cg.refdefViewAngles, d_f, d_rt, d_up );
;3091:		}
;3092:		else
;3093:		*/
;3094:		//For now we still want to draw the crosshair in relation to the player's world coordinates
;3095:		//even if we have a melee weapon/no weapon.
;3096:		{
line 3097
;3097:			if (cg.snap && cg.snap->ps.weapon == WP_EMPLACED_GUN && cg.snap->ps.emplacedIndex)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1554
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1554
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1554
line 3098
;3098:			{
line 3101
;3099:				vec3_t pitchConstraint;
;3100:
;3101:				VectorCopy(cg.refdefViewAngles, pitchConstraint);
ADDRLP4 1144
ADDRGP4 cg+3984
INDIRB
ASGNB 12
line 3103
;3102:
;3103:				if (cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1560
line 3104
;3104:				{
line 3105
;3105:					VectorCopy(cg.predictedPlayerState.viewangles, pitchConstraint);
ADDRLP4 1144
ADDRGP4 cg+96+156
INDIRB
ASGNB 12
line 3106
;3106:				}
ADDRGP4 $1561
JUMPV
LABELV $1560
line 3108
;3107:				else
;3108:				{
line 3109
;3109:					VectorCopy(cg.refdefViewAngles, pitchConstraint);
ADDRLP4 1144
ADDRGP4 cg+3984
INDIRB
ASGNB 12
line 3110
;3110:				}
LABELV $1561
line 3112
;3111:
;3112:				if (pitchConstraint[PITCH] > 40)
ADDRLP4 1144
INDIRF4
CNSTF4 1109393408
LEF4 $1566
line 3113
;3113:				{
line 3114
;3114:					pitchConstraint[PITCH] = 40;
ADDRLP4 1144
CNSTF4 1109393408
ASGNF4
line 3115
;3115:				}
LABELV $1566
line 3117
;3116:
;3117:				AngleVectors( pitchConstraint, d_f, d_rt, d_up );
ADDRLP4 1144
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1120
ARGP4
ADDRLP4 1132
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3118
;3118:			}
ADDRGP4 $1555
JUMPV
LABELV $1554
line 3120
;3119:			else
;3120:			{
line 3123
;3121:				vec3_t pitchConstraint;
;3122:
;3123:				if (cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1568
line 3124
;3124:				{
line 3125
;3125:					VectorCopy(cg.predictedPlayerState.viewangles, pitchConstraint);
ADDRLP4 1144
ADDRGP4 cg+96+156
INDIRB
ASGNB 12
line 3126
;3126:				}
ADDRGP4 $1569
JUMPV
LABELV $1568
line 3128
;3127:				else
;3128:				{
line 3129
;3129:					VectorCopy(cg.refdefViewAngles, pitchConstraint);
ADDRLP4 1144
ADDRGP4 cg+3984
INDIRB
ASGNB 12
line 3130
;3130:				}
LABELV $1569
line 3132
;3131:
;3132:				AngleVectors( pitchConstraint, d_f, d_rt, d_up );
ADDRLP4 1144
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1120
ARGP4
ADDRLP4 1132
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3133
;3133:			}
LABELV $1555
line 3134
;3134:			CG_CalcMuzzlePoint(cg.snap->ps.clientNum, start);
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
ADDRGP4 CG_CalcMuzzlePoint
CALLI4
pop
line 3135
;3135:		}
line 3138
;3136:
;3137:		//FIXME: increase this?  Increase when zoom in?
;3138:		VectorMA( start, 4096, d_f, end );//was 8192
ADDRLP4 1144
CNSTF4 1166016512
ASGNF4
ADDRLP4 1092
ADDRLP4 1080
INDIRF4
ADDRLP4 1144
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1080+4
INDIRF4
ADDRLP4 1144
INDIRF4
ADDRLP4 1108+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1092+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
ADDRLP4 1108+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3139
;3139:	}
ADDRGP4 $1552
JUMPV
LABELV $1551
line 3141
;3140:	else
;3141:	{
line 3142
;3142:		VectorCopy( cg.refdef.vieworg, start );
ADDRLP4 1080
ADDRGP4 cg+3616+24
INDIRB
ASGNB 12
line 3143
;3143:		VectorMA( start, 131072, cg.refdef.viewaxis[0], end );
ADDRLP4 1108
CNSTF4 1207959552
ASGNF4
ADDRLP4 1092
ADDRLP4 1080
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRGP4 cg+3616+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1080+4
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRGP4 cg+3616+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1092+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1207959552
ADDRGP4 cg+3616+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3144
;3144:	}
LABELV $1552
line 3146
;3145:
;3146:	CG_Trace( &trace, start, vec3_origin, vec3_origin, end, 
ADDRLP4 0
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1108
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 257
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 3149
;3147:		cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY );
;3148:
;3149:	if (trace.entityNum < MAX_CLIENTS)
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $1596
line 3150
;3150:	{
line 3151
;3151:		if (CG_IsMindTricked(cg_entities[trace.entityNum].currentState.trickedentindex,
ADDRLP4 1112
CNSTI4 1920
ASGNI4
ADDRLP4 1112
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 cg_entities+148
ADDP4
INDIRI4
ARGI4
ADDRLP4 1112
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 cg_entities+152
ADDP4
INDIRI4
ARGI4
ADDRLP4 1112
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 cg_entities+156
ADDP4
INDIRI4
ARGI4
ADDRLP4 1112
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 cg_entities+160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 1116
ADDRGP4 CG_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
EQI4 $1599
line 3156
;3152:			cg_entities[trace.entityNum].currentState.trickedentindex2,
;3153:			cg_entities[trace.entityNum].currentState.trickedentindex3,
;3154:			cg_entities[trace.entityNum].currentState.trickedentindex4,
;3155:			cg.snap->ps.clientNum))
;3156:		{
line 3157
;3157:			if (cg.crosshairClientNum == trace.entityNum)
ADDRGP4 cg+13096
INDIRI4
ADDRLP4 0+52
INDIRI4
NEI4 $1610
line 3158
;3158:			{
line 3159
;3159:				cg.crosshairClientNum = ENTITYNUM_NONE;
ADDRGP4 cg+13096
CNSTI4 1023
ASGNI4
line 3160
;3160:				cg.crosshairClientTime = 0;
ADDRGP4 cg+13100
CNSTI4 0
ASGNI4
line 3161
;3161:			}
LABELV $1610
line 3163
;3162:
;3163:			CG_DrawCrosshair(trace.endpos, 0);
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 3165
;3164:
;3165:			return; //this entity is mind-tricking the current client, so don't render it
ADDRGP4 $1550
JUMPV
LABELV $1599
line 3167
;3166:		}
;3167:	}
LABELV $1596
line 3169
;3168:
;3169:	if (cg.snap->ps.persistant[PERS_TEAM] != TEAM_SPECTATOR)
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1617
line 3170
;3170:	{
line 3171
;3171:		if (trace.entityNum < /*MAX_CLIENTS*/ENTITYNUM_WORLD)
ADDRLP4 0+52
INDIRI4
CNSTI4 1022
GEI4 $1620
line 3172
;3172:		{
line 3173
;3173:			CG_DrawCrosshair(trace.endpos, 1);
ADDRLP4 0+12
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 3174
;3174:		}
ADDRGP4 $1621
JUMPV
LABELV $1620
line 3176
;3175:		else
;3176:		{
line 3177
;3177:			CG_DrawCrosshair(trace.endpos, 0);
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 3178
;3178:		}
LABELV $1621
line 3179
;3179:	}
LABELV $1617
line 3186
;3180:
;3181://	if ( trace.entityNum >= MAX_CLIENTS ) {
;3182://		return;
;3183://	}
;3184:
;3185:	// if the player is in fog, don't show it
;3186:	content = trap_CM_PointContents( trace.endpos, 0 );
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1112
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 1104
ADDRLP4 1112
INDIRI4
ASGNI4
line 3187
;3187:	if ( content & CONTENTS_FOG ) {
ADDRLP4 1104
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1626
line 3188
;3188:		return;
ADDRGP4 $1550
JUMPV
LABELV $1626
line 3191
;3189:	}
;3190:
;3191:	if ( trace.entityNum >= MAX_CLIENTS ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 32
LTI4 $1628
line 3192
;3192:		cg.crosshairClientNum = trace.entityNum;
ADDRGP4 cg+13096
ADDRLP4 0+52
INDIRI4
ASGNI4
line 3193
;3193:		cg.crosshairClientTime = cg.time;
ADDRGP4 cg+13100
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3194
;3194:		return;
ADDRGP4 $1550
JUMPV
LABELV $1628
line 3198
;3195:	}
;3196:
;3197:	// update the fade timer
;3198:	cg.crosshairClientNum = trace.entityNum;
ADDRGP4 cg+13096
ADDRLP4 0+52
INDIRI4
ASGNI4
line 3199
;3199:	cg.crosshairClientTime = cg.time;
ADDRGP4 cg+13100
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3200
;3200:}
LABELV $1550
endproc CG_ScanForCrosshairEntity 1156 28
proc CG_DrawCrosshairNames 32 20
line 3208
;3201:
;3202:
;3203:/*
;3204:=====================
;3205:CG_DrawCrosshairNames
;3206:=====================
;3207:*/
;3208:static void CG_DrawCrosshairNames( void ) {
line 3214
;3209:	float		*color;
;3210:	vec4_t		tcolor;
;3211:	char		*name;
;3212:	int			baseColor;
;3213:
;3214:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1640
line 3215
;3215:		return;
ADDRGP4 $1639
JUMPV
LABELV $1640
line 3219
;3216:	}
;3217:
;3218:	// scan the known entities to see if the crosshair is sighted on one
;3219:	CG_ScanForCrosshairEntity();
ADDRGP4 CG_ScanForCrosshairEntity
CALLV
pop
line 3221
;3220:
;3221:	if ( !cg_drawCrosshairNames.integer ) {
ADDRGP4 cg_drawCrosshairNames+12
INDIRI4
CNSTI4 0
NEI4 $1643
line 3222
;3222:		return;
ADDRGP4 $1639
JUMPV
LABELV $1643
line 3226
;3223:	}
;3224:	//rww - still do the trace, our dynamic crosshair depends on it
;3225:
;3226:	if (cg.crosshairClientNum >= MAX_CLIENTS)
ADDRGP4 cg+13096
INDIRI4
CNSTI4 32
LTI4 $1646
line 3227
;3227:	{
line 3228
;3228:		return;
ADDRGP4 $1639
JUMPV
LABELV $1646
line 3232
;3229:	}
;3230:
;3231:	// draw the name of the player being looked at
;3232:	color = CG_FadeColor( cg.crosshairClientTime, 1000 );
ADDRGP4 cg+13100
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 28
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 3233
;3233:	if ( !color ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1650
line 3234
;3234:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 3235
;3235:		return;
ADDRGP4 $1639
JUMPV
LABELV $1650
line 3238
;3236:	}
;3237:
;3238:	name = cgs.clientinfo[ cg.crosshairClientNum ].name;
ADDRLP4 24
CNSTI4 788
ADDRGP4 cg+13096
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ASGNP4
line 3240
;3239:
;3240:	if (cgs.gametype >= GT_TEAM)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $1655
line 3241
;3241:	{
line 3242
;3242:		if (cgs.clientinfo[cg.crosshairClientNum].team == TEAM_RED)
CNSTI4 788
ADDRGP4 cg+13096
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1658
line 3243
;3243:		{
line 3244
;3244:			baseColor = CT_RED;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 3245
;3245:		}
ADDRGP4 $1656
JUMPV
LABELV $1658
line 3247
;3246:		else
;3247:		{
line 3248
;3248:			baseColor = CT_BLUE;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 3249
;3249:		}
line 3262
;3250:
;3251:		/*
;3252:		//For now instead of team-based we'll make it oriented based on which team we're on
;3253:		if (cgs.clientinfo[cg.crosshairClientNum].team == cgs.clientinfo[cg.snap->ps.clientNum].team)
;3254:		{
;3255:			baseColor = CT_GREEN;
;3256:		}
;3257:		else
;3258:		{
;3259:			baseColor = CT_RED;
;3260:		}
;3261:		*/
;3262:	}
ADDRGP4 $1656
JUMPV
LABELV $1655
line 3264
;3263:	else
;3264:	{
line 3266
;3265:		//baseColor = CT_WHITE;
;3266:		baseColor = CT_RED; //just make it red in nonteam modes since everyone is hostile and crosshair will be red on them too
ADDRLP4 16
CNSTI4 2
ASGNI4
line 3267
;3267:	}
LABELV $1656
line 3269
;3268:
;3269:	if (cg.snap->ps.duelInProgress)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1663
line 3270
;3270:	{
line 3271
;3271:		if (cg.crosshairClientNum != cg.snap->ps.duelIndex)
ADDRGP4 cg+13096
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
EQI4 $1664
line 3272
;3272:		{ //grey out crosshair for everyone but your foe if you're in a duel
line 3273
;3273:			baseColor = CT_BLACK;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 3274
;3274:		}
line 3275
;3275:	}
ADDRGP4 $1664
JUMPV
LABELV $1663
line 3276
;3276:	else if (cg_entities[cg.crosshairClientNum].currentState.bolt1)
CNSTI4 1920
ADDRGP4 cg+13096
INDIRI4
MULI4
ADDRGP4 cg_entities+140
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1670
line 3277
;3277:	{ //this fellow is in a duel. We just checked if we were in a duel above, so
line 3279
;3278:	  //this means we aren't and he is. Which of course means our crosshair greys out over him.
;3279:		baseColor = CT_BLACK;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 3280
;3280:	}
LABELV $1670
LABELV $1664
line 3282
;3281:
;3282:	tcolor[0] = colorTable[baseColor][0];
ADDRLP4 0
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 colorTable
ADDP4
INDIRF4
ASGNF4
line 3283
;3283:	tcolor[1] = colorTable[baseColor][1];
ADDRLP4 0+4
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 colorTable+4
ADDP4
INDIRF4
ASGNF4
line 3284
;3284:	tcolor[2] = colorTable[baseColor][2];
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 colorTable+8
ADDP4
INDIRF4
ASGNF4
line 3285
;3285:	tcolor[3] = color[3]*0.5f;
ADDRLP4 0+12
CNSTF4 1056964608
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 3287
;3286:
;3287:	UI_DrawProportionalString(320, 170, name, UI_CENTER, tcolor);
CNSTI4 320
ARGI4
CNSTI4 170
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 3289
;3288:
;3289:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 3290
;3290:}
LABELV $1639
endproc CG_DrawCrosshairNames 32 20
proc CG_DrawSpectator 1080 36
line 3301
;3291:
;3292:
;3293://==============================================================================
;3294:
;3295:/*
;3296:=================
;3297:CG_DrawSpectator
;3298:=================
;3299:*/
;3300:static void CG_DrawSpectator(void) 
;3301:{	
line 3303
;3302:	const char* s;
;3303:	s = CG_GetStripEdString("INGAMETEXT", "SPECTATOR");
ADDRGP4 $903
ARGP4
ADDRGP4 $1680
ARGP4
ADDRLP4 4
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 3304
;3304:	if (cgs.gametype == GT_TOURNAMENT &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $1681
ADDRLP4 8
CNSTI4 -1
ASGNI4
ADDRGP4 cgs+36340
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1681
ADDRGP4 cgs+36344
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1681
line 3307
;3305:		cgs.duelist1 != -1 &&
;3306:		cgs.duelist2 != -1)
;3307:	{
line 3309
;3308:		char text[1024];
;3309:		int size = 64;
ADDRLP4 1036
CNSTI4 64
ASGNI4
line 3311
;3310:
;3311:		Com_sprintf(text, sizeof(text), "%s %s %s", cgs.clientinfo[cgs.duelist1].name, CG_GetStripEdString("INGAMETEXT", "SPECHUD_VERSUS"), cgs.clientinfo[cgs.duelist2].name);
ADDRGP4 $903
ARGP4
ADDRGP4 $1690
ARGP4
ADDRLP4 1040
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1686
ARGP4
ADDRLP4 1044
CNSTI4 788
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRGP4 cgs+36340
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
INDIRI4
ADDRGP4 cgs+36344
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3312
;3312:		CG_Text_Paint ( 320 - CG_Text_Width ( text, 1.0f, 3 ) / 2, 420, 1.0f, colorWhite, text, 0, 0, 0, 3 );
ADDRLP4 12
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 3
ARGI4
ADDRLP4 1048
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
CNSTI4 320
ADDRLP4 1048
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1137836032
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3315
;3313:
;3314:
;3315:		trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 3316
;3316:		if ( cgs.clientinfo[cgs.duelist1].modelIcon )
CNSTI4 788
ADDRGP4 cgs+36340
INDIRI4
MULI4
ADDRGP4 cgs+43024+508
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1695
line 3317
;3317:		{
line 3318
;3318:			CG_DrawPic( 10, SCREEN_HEIGHT-(size*1.5), size, size, cgs.clientinfo[cgs.duelist1].modelIcon );
CNSTF4 1092616192
ARGF4
ADDRLP4 1056
ADDRLP4 1036
INDIRI4
CVIF4 4
ASGNF4
CNSTF4 1139802112
CNSTF4 1069547520
ADDRLP4 1056
INDIRF4
MULF4
SUBF4
ARGF4
ADDRLP4 1056
INDIRF4
ARGF4
ADDRLP4 1056
INDIRF4
ARGF4
CNSTI4 788
ADDRGP4 cgs+36340
INDIRI4
MULI4
ADDRGP4 cgs+43024+508
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 3319
;3319:		}
LABELV $1695
line 3320
;3320:		if ( cgs.clientinfo[cgs.duelist2].modelIcon )
CNSTI4 788
ADDRGP4 cgs+36344
INDIRI4
MULI4
ADDRGP4 cgs+43024+508
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1703
line 3321
;3321:		{
line 3322
;3322:			CG_DrawPic( SCREEN_WIDTH-size-10, SCREEN_HEIGHT-(size*1.5), size, size, cgs.clientinfo[cgs.duelist2].modelIcon );
CNSTI4 640
ADDRLP4 1036
INDIRI4
SUBI4
CNSTI4 10
SUBI4
CVIF4 4
ARGF4
ADDRLP4 1060
ADDRLP4 1036
INDIRI4
CVIF4 4
ASGNF4
CNSTF4 1139802112
CNSTF4 1069547520
ADDRLP4 1060
INDIRF4
MULF4
SUBF4
ARGF4
ADDRLP4 1060
INDIRF4
ARGF4
ADDRLP4 1060
INDIRF4
ARGF4
CNSTI4 788
ADDRGP4 cgs+36344
INDIRI4
MULI4
ADDRGP4 cgs+43024+508
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 3323
;3323:		}
LABELV $1703
line 3324
;3324:		Com_sprintf(text, sizeof(text), "%i/%i", cgs.clientinfo[cgs.duelist1].score, cgs.fraglimit );
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $953
ARGP4
CNSTI4 788
ADDRGP4 cgs+36340
INDIRI4
MULI4
ADDRGP4 cgs+43024+108
ADDP4
INDIRI4
ARGI4
ADDRGP4 cgs+32972
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3325
;3325:		CG_Text_Paint( 42 - CG_Text_Width( text, 1.0f, 2 ) / 2, SCREEN_HEIGHT-(size*1.5) + 64, 1.0f, colorWhite, text, 0, 0, 0, 2 );
ADDRLP4 12
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 1060
CNSTI4 2
ASGNI4
CNSTI4 42
ADDRLP4 1056
INDIRI4
ADDRLP4 1060
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1139802112
CNSTF4 1069547520
ADDRLP4 1036
INDIRI4
CVIF4 4
MULF4
SUBF4
CNSTF4 1115684864
ADDF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3327
;3326:
;3327:		Com_sprintf(text, sizeof(text), "%i/%i", cgs.clientinfo[cgs.duelist2].score, cgs.fraglimit );
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $953
ARGP4
CNSTI4 788
ADDRGP4 cgs+36344
INDIRI4
MULI4
ADDRGP4 cgs+43024+108
ADDP4
INDIRI4
ARGI4
ADDRGP4 cgs+32972
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3328
;3328:		CG_Text_Paint( SCREEN_WIDTH-size+22 - CG_Text_Width( text, 1.0f, 2 ) / 2, SCREEN_HEIGHT-(size*1.5) + 64, 1.0f, colorWhite, text, 0, 0, 0, 2 );
ADDRLP4 12
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 1068
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 1072
CNSTI4 2
ASGNI4
CNSTI4 640
ADDRLP4 1036
INDIRI4
SUBI4
CNSTI4 22
ADDI4
ADDRLP4 1068
INDIRI4
ADDRLP4 1072
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1139802112
CNSTF4 1069547520
ADDRLP4 1036
INDIRI4
CVIF4 4
MULF4
SUBF4
CNSTF4 1115684864
ADDF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 1076
CNSTI4 0
ASGNI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3329
;3329:	}
ADDRGP4 $1682
JUMPV
LABELV $1681
line 3331
;3330:	else
;3331:	{
line 3332
;3332:		CG_Text_Paint ( 320 - CG_Text_Width ( s, 1.0f, 3 ) / 2, 420, 1.0f, colorWhite, s, 0, 0, 0, 3 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 3
ARGI4
ADDRLP4 12
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
CNSTI4 320
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1137836032
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3333
;3333:	}
LABELV $1682
line 3335
;3334:
;3335:	if ( cgs.gametype == GT_TOURNAMENT ) 
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $1719
line 3336
;3336:	{
line 3337
;3337:		s = CG_GetStripEdString("INGAMETEXT", "WAITING_TO_PLAY");	// "waiting to play";
ADDRGP4 $903
ARGP4
ADDRGP4 $1722
ARGP4
ADDRLP4 12
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 3338
;3338:		CG_Text_Paint ( 320 - CG_Text_Width ( s, 1.0f, 3 ) / 2, 440, 1.0f, colorWhite, s, 0, 0, 0, 3 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 3
ARGI4
ADDRLP4 16
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
CNSTI4 320
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3339
;3339:	}
ADDRGP4 $1720
JUMPV
LABELV $1719
line 3341
;3340:	else //if ( cgs.gametype >= GT_TEAM ) 
;3341:	{
line 3343
;3342:		//s = "press ESC and use the JOIN menu to play";
;3343:		s = CG_GetStripEdString("INGAMETEXT", "SPEC_CHOOSEJOIN");
ADDRGP4 $903
ARGP4
ADDRGP4 $1723
ARGP4
ADDRLP4 12
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 3344
;3344:		CG_Text_Paint ( 320 - CG_Text_Width ( s, 1.0f, 3 ) / 2, 440, 1.0f, colorWhite, s, 0, 0, 0, 3 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 3
ARGI4
ADDRLP4 16
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
CNSTI4 320
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3345
;3345:	}
LABELV $1720
line 3346
;3346:}
LABELV $1679
endproc CG_DrawSpectator 1080 36
proc CG_DrawVote 56 28
line 3353
;3347:
;3348:/*
;3349:=================
;3350:CG_DrawVote
;3351:=================
;3352:*/
;3353:static void CG_DrawVote(void) {
line 3359
;3354:	const char	*s;
;3355:	int		sec;
;3356:	char sYes[20];
;3357:	char sNo[20];
;3358:
;3359:	if ( !cgs.voteTime ) {
ADDRGP4 cgs+33200
INDIRI4
CNSTI4 0
NEI4 $1725
line 3360
;3360:		return;
ADDRGP4 $1724
JUMPV
LABELV $1725
line 3364
;3361:	}
;3362:
;3363:	// play a talk beep whenever it is modified
;3364:	if ( cgs.voteModified ) {
ADDRGP4 cgs+33212
INDIRI4
CNSTI4 0
EQI4 $1728
line 3365
;3365:		cgs.voteModified = qfalse;
ADDRGP4 cgs+33212
CNSTI4 0
ASGNI4
line 3367
;3366://		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
;3367:	}
LABELV $1728
line 3369
;3368:
;3369:	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgs+33200
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 3370
;3370:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1734
line 3371
;3371:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3372
;3372:	}
LABELV $1734
line 3374
;3373:
;3374:	trap_SP_GetStringTextString("MENUS0_YES", sYes, sizeof(sYes) );
ADDRGP4 $1736
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 3375
;3375:	trap_SP_GetStringTextString("MENUS0_NO",  sNo,  sizeof(sNo) );
ADDRGP4 $1737
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 3377
;3376:
;3377:	s = va("VOTE(%i):%s %s:%i %s:%i", sec, cgs.voteString, sYes, cgs.voteYes, sNo, cgs.voteNo);
ADDRGP4 $1738
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+33216
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 cgs+33204
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 cgs+33208
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
line 3378
;3378:	CG_DrawSmallString( 4, 58, s, 1.0F );
CNSTI4 4
ARGI4
CNSTI4 58
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 3379
;3379:	s = CG_GetStripEdString("INGAMETEXT", "OR_PRESS_ESC_THEN_CLICK_VOTE");	//	s = "or press ESC then click Vote";
ADDRGP4 $903
ARGP4
ADDRGP4 $1742
ARGP4
ADDRLP4 52
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 3380
;3380:	CG_DrawSmallString( 4, 58 + SMALLCHAR_HEIGHT + 2, s, 1.0F );
CNSTI4 4
ARGI4
CNSTI4 76
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 3381
;3381:}
LABELV $1724
endproc CG_DrawVote 56 28
proc CG_DrawTeamVote 300 20
line 3388
;3382:
;3383:/*
;3384:=================
;3385:CG_DrawTeamVote
;3386:=================
;3387:*/
;3388:static void CG_DrawTeamVote(void) {
line 3392
;3389:	char	*s;
;3390:	int		sec, cs_offset;
;3391:
;3392:	if ( cgs.clientinfo->team == TEAM_RED )
ADDRGP4 cgs+43024+68
INDIRI4
CNSTI4 1
NEI4 $1744
line 3393
;3393:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1745
JUMPV
LABELV $1744
line 3394
;3394:	else if ( cgs.clientinfo->team == TEAM_BLUE )
ADDRGP4 cgs+43024+68
INDIRI4
CNSTI4 2
NEI4 $1743
line 3395
;3395:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3397
;3396:	else
;3397:		return;
LABELV $1749
LABELV $1745
line 3399
;3398:
;3399:	if ( !cgs.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34240
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1752
line 3400
;3400:		return;
ADDRGP4 $1743
JUMPV
LABELV $1752
line 3404
;3401:	}
;3402:
;3403:	// play a talk beep whenever it is modified
;3404:	if ( cgs.teamVoteModified[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1755
line 3405
;3405:		cgs.teamVoteModified[cs_offset] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34264
ADDP4
CNSTI4 0
ASGNI4
line 3407
;3406://		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
;3407:	}
LABELV $1755
line 3409
;3408:
;3409:	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+64
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34240
ADDP4
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 3410
;3410:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1761
line 3411
;3411:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3412
;3412:	}
LABELV $1761
line 3413
;3413:	if (strstr(cgs.teamVoteString[cs_offset], "leader"))
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+34272
ADDP4
ARGP4
ADDRGP4 $1766
ARGP4
ADDRLP4 12
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1763
line 3414
;3414:	{
line 3415
;3415:		int i = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $1768
JUMPV
LABELV $1767
line 3418
;3416:
;3417:		while (cgs.teamVoteString[cs_offset][i] && cgs.teamVoteString[cs_offset][i] != ' ')
;3418:		{
line 3419
;3419:			i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3420
;3420:		}
LABELV $1768
line 3417
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
ADDRGP4 cgs+34272
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1772
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
ADDRGP4 cgs+34272
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $1767
LABELV $1772
line 3422
;3421:
;3422:		if (cgs.teamVoteString[cs_offset][i] == ' ')
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+34272
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $1773
line 3423
;3423:		{
line 3424
;3424:			int voteIndex = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 3427
;3425:			char voteIndexStr[256];
;3426:
;3427:			i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $1777
JUMPV
LABELV $1776
line 3430
;3428:
;3429:			while (cgs.teamVoteString[cs_offset][i])
;3430:			{
line 3431
;3431:				voteIndexStr[voteIndex] = cgs.teamVoteString[cs_offset][i];
ADDRLP4 28
INDIRI4
ADDRLP4 32
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+34272
ADDP4
ADDP4
INDIRI1
ASGNI1
line 3432
;3432:				voteIndex++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3433
;3433:				i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3434
;3434:			}
LABELV $1777
line 3429
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+34272
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1776
line 3435
;3435:			voteIndexStr[voteIndex] = 0;
ADDRLP4 28
INDIRI4
ADDRLP4 32
ADDP4
CNSTI1 0
ASGNI1
line 3437
;3436:
;3437:			voteIndex = atoi(voteIndexStr);
ADDRLP4 32
ARGP4
ADDRLP4 288
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 288
INDIRI4
ASGNI4
line 3439
;3438:
;3439:			s = va("TEAMVOTE(%i):(Make %s the new team leader) yes:%i no:%i", sec, cgs.clientinfo[voteIndex].name,
ADDRGP4 $1781
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 788
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ARGP4
ADDRLP4 292
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 292
INDIRI4
ADDRGP4 cgs+34248
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
INDIRI4
ADDRGP4 cgs+34256
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 296
INDIRP4
ASGNP4
line 3441
;3440:									cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;3441:		}
ADDRGP4 $1764
JUMPV
LABELV $1773
line 3443
;3442:		else
;3443:		{
line 3444
;3444:			s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
ADDRGP4 $1786
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+34272
ADDP4
ARGP4
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+34248
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+34256
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
ASGNP4
line 3446
;3445:									cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;3446:		}
line 3447
;3447:	}
ADDRGP4 $1764
JUMPV
LABELV $1763
line 3449
;3448:	else
;3449:	{
line 3450
;3450:		s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
ADDRGP4 $1786
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+34272
ADDP4
ARGP4
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 cgs+34248
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRGP4 cgs+34256
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 3452
;3451:								cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;3452:	}
LABELV $1764
line 3453
;3453:	CG_DrawSmallString( 4, 90, s, 1.0F );
CNSTI4 4
ARGI4
CNSTI4 90
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 3454
;3454:}
LABELV $1743
endproc CG_DrawTeamVote 300 20
proc CG_DrawScoreboard 4 0
line 3456
;3455:
;3456:static qboolean CG_DrawScoreboard() {
line 3457
;3457:	return CG_DrawOldScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1793
endproc CG_DrawScoreboard 4 0
proc CG_DrawIntermission 4 0
line 3529
;3458:#if 0
;3459:	static qboolean firstTime = qtrue;
;3460:	float fade, *fadeColor;
;3461:
;3462:	if (menuScoreboard) {
;3463:		menuScoreboard->window.flags &= ~WINDOW_FORCED;
;3464:	}
;3465:	if (cg_paused.integer) {
;3466:		cg.deferredPlayerLoading = 0;
;3467:		firstTime = qtrue;
;3468:		return qfalse;
;3469:	}
;3470:
;3471:	// should never happen in Team Arena
;3472:	if (cgs.gametype == GT_SINGLE_PLAYER && cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;3473:		cg.deferredPlayerLoading = 0;
;3474:		firstTime = qtrue;
;3475:		return qfalse;
;3476:	}
;3477:
;3478:	// don't draw scoreboard during death while warmup up
;3479:	if ( cg.warmup && !cg.showScores ) {
;3480:		return qfalse;
;3481:	}
;3482:
;3483:	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;3484:		fade = 1.0;
;3485:		fadeColor = colorWhite;
;3486:	} else {
;3487:		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME );
;3488:		if ( !fadeColor ) {
;3489:			// next time scoreboard comes up, don't print killer
;3490:			cg.deferredPlayerLoading = 0;
;3491:			cg.killerName[0] = 0;
;3492:			firstTime = qtrue;
;3493:			return qfalse;
;3494:		}
;3495:		fade = *fadeColor;
;3496:	}																					  
;3497:
;3498:
;3499:	if (menuScoreboard == NULL) {
;3500:		if ( cgs.gametype >= GT_TEAM ) {
;3501:			menuScoreboard = Menus_FindByName("teamscore_menu");
;3502:		} else {
;3503:			menuScoreboard = Menus_FindByName("score_menu");
;3504:		}
;3505:	}
;3506:
;3507:	if (menuScoreboard) {
;3508:		if (firstTime) {
;3509:			CG_SetScoreSelection(menuScoreboard);
;3510:			firstTime = qfalse;
;3511:		}
;3512:		Menu_Paint(menuScoreboard, qtrue);
;3513:	}
;3514:
;3515:	// load any models that have been deferred
;3516:	if ( ++cg.deferredPlayerLoading > 10 ) {
;3517:		CG_LoadDeferredPlayers();
;3518:	}
;3519:
;3520:	return qtrue;
;3521:#endif
;3522:}
;3523:
;3524:/*
;3525:=================
;3526:CG_DrawIntermission
;3527:=================
;3528:*/
;3529:static void CG_DrawIntermission( void ) {
line 3535
;3530://	int key;
;3531:	//if (cg_singlePlayer.integer) {
;3532:	//	CG_DrawCenterString();
;3533:	//	return;
;3534:	//}
;3535:	cg.scoreFadeTime = cg.time;
ADDRGP4 cg+6992
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3536
;3536:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+6988
ADDRLP4 0
INDIRI4
ASGNI4
line 3537
;3537:}
LABELV $1794
endproc CG_DrawIntermission 4 0
proc CG_DrawFollow 32 36
line 3545
;3538:
;3539:/*
;3540:=================
;3541:CG_DrawFollow
;3542:=================
;3543:*/
;3544:static qboolean CG_DrawFollow( void ) 
;3545:{
line 3548
;3546:	const char	*s;
;3547:
;3548:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) ) 
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1799
line 3549
;3549:	{
line 3550
;3550:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1798
JUMPV
LABELV $1799
line 3554
;3551:	}
;3552:
;3553://	s = "following";
;3554:	s = CG_GetStripEdString("INGAMETEXT", "FOLLOWING");
ADDRGP4 $903
ARGP4
ADDRGP4 $1802
ARGP4
ADDRLP4 4
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 3555
;3555:	CG_Text_Paint ( 320 - CG_Text_Width ( s, 1.0f, FONT_MEDIUM ) / 2, 60, 1.0f, colorWhite, s, 0, 0, 0, FONT_MEDIUM );
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 8
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 12
CNSTI4 2
ASGNI4
CNSTI4 320
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1114636288
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3557
;3556:
;3557:	s = cgs.clientinfo[ cg.snap->ps.clientNum ].name;
ADDRLP4 0
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+4
ADDP4
ASGNP4
line 3558
;3558:	CG_Text_Paint ( 320 - CG_Text_Width ( s, 2.0f, FONT_MEDIUM ) / 2, 80, 2.0f, colorWhite, s, 0, 0, 0, FONT_MEDIUM );
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1073741824
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 24
CNSTI4 2
ASGNI4
CNSTI4 320
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1117782016
ARGF4
CNSTF4 1073741824
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3560
;3559:
;3560:	return qtrue;
CNSTI4 1
RETI4
LABELV $1798
endproc CG_DrawFollow 32 36
proc CG_DrawAmmoWarning 0 0
line 3596
;3561:}
;3562:
;3563:#if 0
;3564:static void CG_DrawTemporaryStats()
;3565:{ //placeholder for testing (draws ammo and force power)
;3566:	char s[512];
;3567:
;3568:	if (!cg.snap)
;3569:	{
;3570:		return;
;3571:	}
;3572:
;3573:	sprintf(s, "Force: %i", cg.snap->ps.fd.forcePower);
;3574:
;3575:	CG_DrawBigString(SCREEN_WIDTH-164, SCREEN_HEIGHT-128, s, 1.0f);
;3576:
;3577:	sprintf(s, "Ammo: %i", cg.snap->ps.ammo[weaponData[cg.snap->ps.weapon].ammoIndex]);
;3578:
;3579:	CG_DrawBigString(SCREEN_WIDTH-164, SCREEN_HEIGHT-112, s, 1.0f);
;3580:
;3581:	sprintf(s, "Health: %i", cg.snap->ps.stats[STAT_HEALTH]);
;3582:
;3583:	CG_DrawBigString(8, SCREEN_HEIGHT-128, s, 1.0f);
;3584:
;3585:	sprintf(s, "Armor: %i", cg.snap->ps.stats[STAT_ARMOR]);
;3586:
;3587:	CG_DrawBigString(8, SCREEN_HEIGHT-112, s, 1.0f);
;3588:}
;3589:#endif
;3590:
;3591:/*
;3592:=================
;3593:CG_DrawAmmoWarning
;3594:=================
;3595:*/
;3596:static void CG_DrawAmmoWarning( void ) {
line 3622
;3597:#if 0
;3598:	const char	*s;
;3599:	int			w;
;3600:
;3601:	if (!cg_drawStatus.integer)
;3602:	{
;3603:		return;
;3604:	}
;3605:
;3606:	if ( cg_drawAmmoWarning.integer == 0 ) {
;3607:		return;
;3608:	}
;3609:
;3610:	if ( !cg.lowAmmoWarning ) {
;3611:		return;
;3612:	}
;3613:
;3614:	if ( cg.lowAmmoWarning == 2 ) {
;3615:		s = "OUT OF AMMO";
;3616:	} else {
;3617:		s = "LOW AMMO WARNING";
;3618:	}
;3619:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
;3620:	CG_DrawBigString(320 - w / 2, 64, s, 1.0F);
;3621:#endif
;3622:}
LABELV $1806
endproc CG_DrawAmmoWarning 0 0
proc CG_DrawWarmup 52 36
line 3631
;3623:
;3624:
;3625:
;3626:/*
;3627:=================
;3628:CG_DrawWarmup
;3629:=================
;3630:*/
;3631:static void CG_DrawWarmup( void ) {
line 3640
;3632:	int			w;
;3633:	int			sec;
;3634:	int			i;
;3635:	float scale;
;3636:	clientInfo_t	*ci1, *ci2;
;3637:	int			cw;
;3638:	const char	*s;
;3639:
;3640:	sec = cg.warmup;
ADDRLP4 4
ADDRGP4 cg+13352
INDIRI4
ASGNI4
line 3641
;3641:	if ( !sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1809
line 3642
;3642:		return;
ADDRGP4 $1807
JUMPV
LABELV $1809
line 3645
;3643:	}
;3644:
;3645:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1811
line 3647
;3646://		s = "Waiting for players";		
;3647:		s = CG_GetStripEdString("INGAMETEXT", "WAITING_FOR_PLAYERS");
ADDRGP4 $903
ARGP4
ADDRGP4 $1813
ARGP4
ADDRLP4 32
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 3648
;3648:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 3649
;3649:		CG_DrawBigString(320 - w / 2, 24, s, 1.0F);
CNSTI4 320
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 3650
;3650:		cg.warmupCount = 0;
ADDRGP4 cg+13356
CNSTI4 0
ASGNI4
line 3651
;3651:		return;
ADDRGP4 $1807
JUMPV
LABELV $1811
line 3654
;3652:	}
;3653:
;3654:	if (cgs.gametype == GT_TOURNAMENT) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $1815
line 3656
;3655:		// find the two active players
;3656:		ci1 = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 3657
;3657:		ci2 = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 3658
;3658:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1821
JUMPV
LABELV $1818
line 3659
;3659:			if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE ) {
ADDRLP4 32
CNSTI4 788
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+43024
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $1823
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1823
line 3660
;3660:				if ( !ci1 ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1828
line 3661
;3661:					ci1 = &cgs.clientinfo[i];
ADDRLP4 12
CNSTI4 788
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 3662
;3662:				} else {
ADDRGP4 $1829
JUMPV
LABELV $1828
line 3663
;3663:					ci2 = &cgs.clientinfo[i];
ADDRLP4 24
CNSTI4 788
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 3664
;3664:				}
LABELV $1829
line 3665
;3665:			}
LABELV $1823
line 3666
;3666:		}
LABELV $1819
line 3658
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1821
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $1818
line 3668
;3667:
;3668:		if ( ci1 && ci2 ) {
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $1816
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $1816
line 3669
;3669:			s = va( "%s vs %s", ci1->name, ci2->name );
ADDRGP4 $1834
ARGP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
ASGNP4
line 3670
;3670:			w = CG_Text_Width(s, 0.6f, FONT_MEDIUM);
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1058642330
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 44
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 44
INDIRI4
ASGNI4
line 3671
;3671:			CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE,FONT_MEDIUM);
ADDRLP4 48
CNSTI4 2
ASGNI4
CNSTI4 320
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1114636288
ARGF4
CNSTF4 1058642330
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3672
;3672:		}
line 3673
;3673:	} else {
ADDRGP4 $1816
JUMPV
LABELV $1815
line 3674
;3674:		if ( cgs.gametype == GT_FFA ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 0
NEI4 $1835
line 3675
;3675:			s = "Free For All";
ADDRLP4 8
ADDRGP4 $1838
ASGNP4
line 3676
;3676:		} else if ( cgs.gametype == GT_HOLOCRON ) {
ADDRGP4 $1836
JUMPV
LABELV $1835
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 1
NEI4 $1839
line 3677
;3677:			s = "Holocron FFA";
ADDRLP4 8
ADDRGP4 $1842
ASGNP4
line 3678
;3678:		} else if ( cgs.gametype == GT_JEDIMASTER ) {
ADDRGP4 $1840
JUMPV
LABELV $1839
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $1843
line 3679
;3679:			s = "Jedi Master";
ADDRLP4 8
ADDRGP4 $1846
ASGNP4
line 3680
;3680:		} else if ( cgs.gametype == GT_TEAM ) {
ADDRGP4 $1844
JUMPV
LABELV $1843
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
NEI4 $1847
line 3681
;3681:			s = "Team FFA";
ADDRLP4 8
ADDRGP4 $1850
ASGNP4
line 3682
;3682:		} else if ( cgs.gametype == GT_SAGA ) {
ADDRGP4 $1848
JUMPV
LABELV $1847
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 6
NEI4 $1851
line 3683
;3683:			s = "N/A";
ADDRLP4 8
ADDRGP4 $1854
ASGNP4
line 3684
;3684:		} else if ( cgs.gametype == GT_CTF ) {
ADDRGP4 $1852
JUMPV
LABELV $1851
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
NEI4 $1855
line 3685
;3685:			s = "Capture the Flag";
ADDRLP4 8
ADDRGP4 $1858
ASGNP4
line 3686
;3686:		} else if ( cgs.gametype == GT_CTY ) {
ADDRGP4 $1856
JUMPV
LABELV $1855
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1859
line 3687
;3687:			s = "Capture the Ysalamiri";
ADDRLP4 8
ADDRGP4 $1862
ASGNP4
line 3688
;3688:		} else {
ADDRGP4 $1860
JUMPV
LABELV $1859
line 3689
;3689:			s = "";
ADDRLP4 8
ADDRGP4 $664
ASGNP4
line 3690
;3690:		}
LABELV $1860
LABELV $1856
LABELV $1852
LABELV $1848
LABELV $1844
LABELV $1840
LABELV $1836
line 3691
;3691:		w = CG_Text_Width(s, 1.5f, FONT_MEDIUM);
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1069547520
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 32
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 3692
;3692:		CG_Text_Paint(320 - w / 2, 90, 1.5f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE,FONT_MEDIUM);
ADDRLP4 36
CNSTI4 2
ASGNI4
CNSTI4 320
ADDRLP4 16
INDIRI4
ADDRLP4 36
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1069547520
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3693
;3693:	}
LABELV $1816
line 3695
;3694:
;3695:	sec = ( sec - cg.time ) / 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cg+64
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 3696
;3696:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1864
line 3697
;3697:		cg.warmup = 0;
ADDRGP4 cg+13352
CNSTI4 0
ASGNI4
line 3698
;3698:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3699
;3699:	}
LABELV $1864
line 3701
;3700://	s = va( "Starts in: %i", sec + 1 );
;3701:	s = va( "%s: %i",CG_GetStripEdString("INGAMETEXT", "STARTS_IN"), sec + 1 );
ADDRGP4 $903
ARGP4
ADDRGP4 $1867
ARGP4
ADDRLP4 32
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $938
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
ASGNP4
line 3702
;3702:	if ( sec != cg.warmupCount ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+13356
INDIRI4
EQI4 $1868
line 3703
;3703:		cg.warmupCount = sec;
ADDRGP4 cg+13356
ADDRLP4 4
INDIRI4
ASGNI4
line 3704
;3704:		switch ( sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1874
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $1877
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $1880
ADDRGP4 $1873
JUMPV
LABELV $1874
line 3706
;3705:		case 0:
;3706:			trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+70296+848
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3707
;3707:			break;
ADDRGP4 $1873
JUMPV
LABELV $1877
line 3709
;3708:		case 1:
;3709:			trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+70296+844
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3710
;3710:			break;
ADDRGP4 $1873
JUMPV
LABELV $1880
line 3712
;3711:		case 2:
;3712:			trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+70296+840
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3713
;3713:			break;
line 3715
;3714:		default:
;3715:			break;
LABELV $1873
line 3717
;3716:		}
;3717:	}
LABELV $1868
line 3718
;3718:	scale = 0.45f;
ADDRLP4 20
CNSTF4 1055286886
ASGNF4
line 3719
;3719:	switch ( cg.warmupCount ) {
ADDRLP4 40
ADDRGP4 cg+13356
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $1886
ADDRLP4 40
INDIRI4
CNSTI4 1
EQI4 $1887
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $1888
ADDRGP4 $1883
JUMPV
LABELV $1886
line 3721
;3720:	case 0:
;3721:		cw = 28;
ADDRLP4 28
CNSTI4 28
ASGNI4
line 3722
;3722:		scale = 1.25f;
ADDRLP4 20
CNSTF4 1067450368
ASGNF4
line 3723
;3723:		break;
ADDRGP4 $1884
JUMPV
LABELV $1887
line 3725
;3724:	case 1:
;3725:		cw = 24;
ADDRLP4 28
CNSTI4 24
ASGNI4
line 3726
;3726:		scale = 1.15f;
ADDRLP4 20
CNSTF4 1066611507
ASGNF4
line 3727
;3727:		break;
ADDRGP4 $1884
JUMPV
LABELV $1888
line 3729
;3728:	case 2:
;3729:		cw = 20;
ADDRLP4 28
CNSTI4 20
ASGNI4
line 3730
;3730:		scale = 1.05f;
ADDRLP4 20
CNSTF4 1065772646
ASGNF4
line 3731
;3731:		break;
ADDRGP4 $1884
JUMPV
LABELV $1883
line 3733
;3732:	default:
;3733:		cw = 16;
ADDRLP4 28
CNSTI4 16
ASGNI4
line 3734
;3734:		scale = 0.9f;
ADDRLP4 20
CNSTF4 1063675494
ASGNF4
line 3735
;3735:		break;
LABELV $1884
line 3738
;3736:	}
;3737:
;3738:	w = CG_Text_Width(s, scale, FONT_MEDIUM);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
CNSTI4 2
ARGI4
ADDRLP4 44
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 44
INDIRI4
ASGNI4
line 3739
;3739:	CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE, FONT_MEDIUM);
ADDRLP4 48
CNSTI4 2
ASGNI4
CNSTI4 320
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
DIVI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1123680256
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 3740
;3740:}
LABELV $1807
endproc CG_DrawWarmup 52 36
export CG_DrawTimedMenus
proc CG_DrawTimedMenus 4 8
line 3748
;3741:
;3742://==================================================================================
;3743:/* 
;3744:=================
;3745:CG_DrawTimedMenus
;3746:=================
;3747:*/
;3748:void CG_DrawTimedMenus() {
line 3749
;3749:	if (cg.voiceTime) {
ADDRGP4 cg+13116
INDIRI4
CNSTI4 0
EQI4 $1890
line 3750
;3750:		int t = cg.time - cg.voiceTime;
ADDRLP4 0
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+13116
INDIRI4
SUBI4
ASGNI4
line 3751
;3751:		if ( t > 2500 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2500
LEI4 $1895
line 3752
;3752:			Menus_CloseByName("voiceMenu");
ADDRGP4 $1897
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 3753
;3753:			trap_Cvar_Set("cl_conXOffset", "0");
ADDRGP4 $1898
ARGP4
ADDRGP4 $1899
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3754
;3754:			cg.voiceTime = 0;
ADDRGP4 cg+13116
CNSTI4 0
ASGNI4
line 3755
;3755:		}
LABELV $1895
line 3756
;3756:	}
LABELV $1890
line 3757
;3757:}
LABELV $1889
endproc CG_DrawTimedMenus 4 8
export CG_DrawFlagStatus
proc CG_DrawFlagStatus 32 20
line 3760
;3758:
;3759:void CG_DrawFlagStatus()
;3760:{
line 3761
;3761:	int myFlagTakenShader = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3762
;3762:	int theirFlagShader = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 3763
;3763:	int team = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3764
;3764:	int startDrawPos = 2;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 3765
;3765:	int ico_size = 32;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 3767
;3766:
;3767:	if (!cg.snap)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1902
line 3768
;3768:	{
line 3769
;3769:		return;
ADDRGP4 $1901
JUMPV
LABELV $1902
line 3772
;3770:	}
;3771:
;3772:	if (cgs.gametype != GT_CTF && cgs.gametype != GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
EQI4 $1905
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
EQI4 $1905
line 3773
;3773:	{
line 3774
;3774:		return;
ADDRGP4 $1901
JUMPV
LABELV $1905
line 3777
;3775:	}
;3776:
;3777:	team = cg.snap->ps.persistant[PERS_TEAM];
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
ASGNI4
line 3779
;3778:
;3779:	if (cgs.gametype == GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1910
line 3780
;3780:	{
line 3781
;3781:		if (team == TEAM_RED)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1913
line 3782
;3782:		{
line 3783
;3783:			myFlagTakenShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_rflag_x" );
ADDRGP4 $1915
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3784
;3784:			theirFlagShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_bflag_ys" );
ADDRGP4 $1090
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 3785
;3785:		}
ADDRGP4 $1911
JUMPV
LABELV $1913
line 3787
;3786:		else
;3787:		{
line 3788
;3788:			myFlagTakenShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_bflag_x" );
ADDRGP4 $1916
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3789
;3789:			theirFlagShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_rflag_ys" );
ADDRGP4 $1089
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 3790
;3790:		}
line 3791
;3791:	}
ADDRGP4 $1911
JUMPV
LABELV $1910
line 3793
;3792:	else
;3793:	{
line 3794
;3794:		if (team == TEAM_RED)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1917
line 3795
;3795:		{
line 3796
;3796:			myFlagTakenShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_rflag_x" );
ADDRGP4 $1915
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3797
;3797:			theirFlagShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_bflag" );
ADDRGP4 $1919
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 3798
;3798:		}
ADDRGP4 $1918
JUMPV
LABELV $1917
line 3800
;3799:		else
;3800:		{
line 3801
;3801:			myFlagTakenShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_bflag_x" );
ADDRGP4 $1916
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3802
;3802:			theirFlagShader = trap_R_RegisterShaderNoMip( "gfx/hud/mpi_rflag" );
ADDRGP4 $1920
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 3803
;3803:		}
LABELV $1918
line 3804
;3804:	}
LABELV $1911
line 3806
;3805:
;3806:	if (CG_YourTeamHasFlag())
ADDRLP4 20
ADDRGP4 CG_YourTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1921
line 3807
;3807:	{
line 3808
;3808:		CG_DrawPic( startDrawPos, 365, ico_size, ico_size, theirFlagShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1136033792
ARGF4
ADDRLP4 24
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 3809
;3809:		startDrawPos += ico_size+2;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 3810
;3810:	}
LABELV $1921
line 3812
;3811:
;3812:	if (CG_OtherTeamHasFlag())
ADDRLP4 24
ADDRGP4 CG_OtherTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1923
line 3813
;3813:	{
line 3814
;3814:		CG_DrawPic( startDrawPos, 365, ico_size, ico_size, myFlagTakenShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1136033792
ARGF4
ADDRLP4 28
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 3815
;3815:	}
LABELV $1923
line 3816
;3816:}
LABELV $1901
endproc CG_DrawFlagStatus 32 20
data
export cgRageTime
align 4
LABELV cgRageTime
byte 4 0
export cgRageFadeTime
align 4
LABELV cgRageFadeTime
byte 4 0
export cgRageFadeVal
align 4
LABELV cgRageFadeVal
byte 4 0
export cgRageRecTime
align 4
LABELV cgRageRecTime
byte 4 0
export cgRageRecFadeTime
align 4
LABELV cgRageRecFadeTime
byte 4 0
export cgRageRecFadeVal
align 4
LABELV cgRageRecFadeVal
byte 4 0
export cgAbsorbTime
align 4
LABELV cgAbsorbTime
byte 4 0
export cgAbsorbFadeTime
align 4
LABELV cgAbsorbFadeTime
byte 4 0
export cgAbsorbFadeVal
align 4
LABELV cgAbsorbFadeVal
byte 4 0
export cgProtectTime
align 4
LABELV cgProtectTime
byte 4 0
export cgProtectFadeTime
align 4
LABELV cgProtectFadeTime
byte 4 0
export cgProtectFadeVal
align 4
LABELV cgProtectFadeVal
byte 4 0
export cgYsalTime
align 4
LABELV cgYsalTime
byte 4 0
export cgYsalFadeTime
align 4
LABELV cgYsalFadeTime
byte 4 0
export cgYsalFadeVal
align 4
LABELV cgYsalFadeVal
byte 4 0
export gCGHasFallVector
align 4
LABELV gCGHasFallVector
byte 4 0
code
proc CG_Draw2D 68 24
line 3846
;3817:
;3818:int cgRageTime = 0;
;3819:int cgRageFadeTime = 0;
;3820:float cgRageFadeVal = 0;
;3821:
;3822:int cgRageRecTime = 0;
;3823:int cgRageRecFadeTime = 0;
;3824:float cgRageRecFadeVal = 0;
;3825:
;3826:int cgAbsorbTime = 0;
;3827:int cgAbsorbFadeTime = 0;
;3828:float cgAbsorbFadeVal = 0;
;3829:
;3830:int cgProtectTime = 0;
;3831:int cgProtectFadeTime = 0;
;3832:float cgProtectFadeVal = 0;
;3833:
;3834:int cgYsalTime = 0;
;3835:int cgYsalFadeTime = 0;
;3836:float cgYsalFadeVal = 0;
;3837:
;3838:qboolean gCGHasFallVector = qfalse;
;3839:vec3_t gCGFallVector;
;3840:
;3841:/*
;3842:=================
;3843:CG_Draw2D
;3844:=================
;3845:*/
;3846:static void CG_Draw2D( void ) {
line 3847
;3847:	float			inTime = cg.invenSelectTime+WEAPON_SELECT_TIME;
ADDRLP4 40
ADDRGP4 cg+13788
INDIRF4
CNSTF4 1152319488
ADDF4
ASGNF4
line 3848
;3848:	float			wpTime = cg.weaponSelectTime+WEAPON_SELECT_TIME;
ADDRLP4 44
ADDRGP4 cg+13372
INDIRI4
CNSTI4 1400
ADDI4
CVIF4 4
ASGNF4
line 3850
;3849:	float			bestTime;
;3850:	int				drawSelect = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 3854
;3851:	float			fallTime, rageTime, rageRecTime, absorbTime, protectTime, ysalTime;
;3852:	vec4_t			hcolor;
;3853:
;3854:	if (cgs.orderPending && cg.time > cgs.orderTime) {
ADDRGP4 cgs+70240
INDIRI4
CNSTI4 0
EQI4 $1928
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgs+70244
INDIRI4
LEI4 $1928
line 3855
;3855:		CG_CheckOrderPending();
ADDRGP4 CG_CheckOrderPending
CALLV
pop
line 3856
;3856:	}
LABELV $1928
line 3858
;3857:	// if we are taking a levelshot for the menu, don't draw anything
;3858:	if ( cg.levelShot ) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $1933
line 3859
;3859:		return;
ADDRGP4 $1925
JUMPV
LABELV $1933
line 3862
;3860:	}
;3861:
;3862:	if (cgs.clientinfo[cg.snap->ps.clientNum].team == TEAM_SPECTATOR)
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1936
line 3863
;3863:	{
line 3864
;3864:		cgRageTime = 0;
ADDRGP4 cgRageTime
CNSTI4 0
ASGNI4
line 3865
;3865:		cgRageFadeTime = 0;
ADDRGP4 cgRageFadeTime
CNSTI4 0
ASGNI4
line 3866
;3866:		cgRageFadeVal = 0;
ADDRGP4 cgRageFadeVal
CNSTF4 0
ASGNF4
line 3868
;3867:
;3868:		cgRageRecTime = 0;
ADDRGP4 cgRageRecTime
CNSTI4 0
ASGNI4
line 3869
;3869:		cgRageRecFadeTime = 0;
ADDRGP4 cgRageRecFadeTime
CNSTI4 0
ASGNI4
line 3870
;3870:		cgRageRecFadeVal = 0;
ADDRGP4 cgRageRecFadeVal
CNSTF4 0
ASGNF4
line 3872
;3871:
;3872:		cgAbsorbTime = 0;
ADDRGP4 cgAbsorbTime
CNSTI4 0
ASGNI4
line 3873
;3873:		cgAbsorbFadeTime = 0;
ADDRGP4 cgAbsorbFadeTime
CNSTI4 0
ASGNI4
line 3874
;3874:		cgAbsorbFadeVal = 0;
ADDRGP4 cgAbsorbFadeVal
CNSTF4 0
ASGNF4
line 3876
;3875:
;3876:		cgProtectTime = 0;
ADDRGP4 cgProtectTime
CNSTI4 0
ASGNI4
line 3877
;3877:		cgProtectFadeTime = 0;
ADDRGP4 cgProtectFadeTime
CNSTI4 0
ASGNI4
line 3878
;3878:		cgProtectFadeVal = 0;
ADDRGP4 cgProtectFadeVal
CNSTF4 0
ASGNF4
line 3880
;3879:
;3880:		cgYsalTime = 0;
ADDRGP4 cgYsalTime
CNSTI4 0
ASGNI4
line 3881
;3881:		cgYsalFadeTime = 0;
ADDRGP4 cgYsalFadeTime
CNSTI4 0
ASGNI4
line 3882
;3882:		cgYsalFadeVal = 0;
ADDRGP4 cgYsalFadeVal
CNSTF4 0
ASGNF4
line 3883
;3883:	}
LABELV $1936
line 3885
;3884:
;3885:	if ( cg_draw2D.integer == 0 ) {
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $1941
line 3886
;3886:		return;
ADDRGP4 $1925
JUMPV
LABELV $1941
line 3889
;3887:	}
;3888:	
;3889:	if ( ui_fragsOnly.integer != 0 ) {
ADDRGP4 ui_fragsOnly+12
INDIRI4
CNSTI4 0
EQI4 $1944
line 3890
;3890:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 3891
;3891:		return;
ADDRGP4 $1925
JUMPV
LABELV $1944
line 3894
;3892:	}
;3893:
;3894:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1947
line 3895
;3895:		CG_DrawIntermission();
ADDRGP4 CG_DrawIntermission
CALLV
pop
line 3896
;3896:		return;
ADDRGP4 $1925
JUMPV
LABELV $1947
line 3899
;3897:	}
;3898:
;3899:	if (cgs.clientinfo[cg.snap->ps.clientNum].team != TEAM_SPECTATOR)
CNSTI4 788
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+68
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1950
line 3900
;3900:	{
line 3901
;3901:		if (cg.snap->ps.fd.forcePowersActive & (1 << FP_RAGE))
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1955
line 3902
;3902:		{
line 3903
;3903:			if (!cgRageTime)
ADDRGP4 cgRageTime
INDIRI4
CNSTI4 0
NEI4 $1958
line 3904
;3904:			{
line 3905
;3905:				cgRageTime = cg.time;
ADDRGP4 cgRageTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3906
;3906:			}
LABELV $1958
line 3908
;3907:			
;3908:			rageTime = (float)(cg.time - cgRageTime);
ADDRLP4 20
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgRageTime
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 3910
;3909:			
;3910:			rageTime /= 9000;
ADDRLP4 20
ADDRLP4 20
INDIRF4
CNSTF4 1175232512
DIVF4
ASGNF4
line 3912
;3911:			
;3912:			if (rageTime < 0)
ADDRLP4 20
INDIRF4
CNSTF4 0
GEF4 $1962
line 3913
;3913:			{
line 3914
;3914:				rageTime = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 3915
;3915:			}
LABELV $1962
line 3916
;3916:			if (rageTime > 0.15)
ADDRLP4 20
INDIRF4
CNSTF4 1041865114
LEF4 $1964
line 3917
;3917:			{
line 3918
;3918:				rageTime = 0.15;
ADDRLP4 20
CNSTF4 1041865114
ASGNF4
line 3919
;3919:			}
LABELV $1964
line 3921
;3920:			
;3921:			hcolor[3] = rageTime;
ADDRLP4 0+12
ADDRLP4 20
INDIRF4
ASGNF4
line 3922
;3922:			hcolor[0] = 0.7;
ADDRLP4 0
CNSTF4 1060320051
ASGNF4
line 3923
;3923:			hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 3924
;3924:			hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 3926
;3925:			
;3926:			if (!cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $1969
line 3927
;3927:			{
line 3928
;3928:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 3929
;3929:			}
LABELV $1969
line 3931
;3930:			
;3931:			cgRageFadeTime = 0;
ADDRGP4 cgRageFadeTime
CNSTI4 0
ASGNI4
line 3932
;3932:			cgRageFadeVal = 0;
ADDRGP4 cgRageFadeVal
CNSTF4 0
ASGNF4
line 3933
;3933:		}
ADDRGP4 $1956
JUMPV
LABELV $1955
line 3934
;3934:		else if (cgRageTime)
ADDRGP4 cgRageTime
INDIRI4
CNSTI4 0
EQI4 $1972
line 3935
;3935:		{
line 3936
;3936:			if (!cgRageFadeTime)
ADDRGP4 cgRageFadeTime
INDIRI4
CNSTI4 0
NEI4 $1974
line 3937
;3937:			{
line 3938
;3938:				cgRageFadeTime = cg.time;
ADDRGP4 cgRageFadeTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 3939
;3939:				cgRageFadeVal = 0.15;
ADDRGP4 cgRageFadeVal
CNSTF4 1041865114
ASGNF4
line 3940
;3940:			}
LABELV $1974
line 3942
;3941:			
;3942:			rageTime = cgRageFadeVal;
ADDRLP4 20
ADDRGP4 cgRageFadeVal
INDIRF4
ASGNF4
line 3944
;3943:			
;3944:			cgRageFadeVal -= (cg.time - cgRageFadeTime)*0.000005;
ADDRLP4 56
ADDRGP4 cgRageFadeVal
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 916964780
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgRageFadeTime
INDIRI4
SUBI4
CVIF4 4
MULF4
SUBF4
ASGNF4
line 3946
;3945:			
;3946:			if (rageTime < 0)
ADDRLP4 20
INDIRF4
CNSTF4 0
GEF4 $1978
line 3947
;3947:			{
line 3948
;3948:				rageTime = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 3949
;3949:			}
LABELV $1978
line 3950
;3950:			if (rageTime > 0.15)
ADDRLP4 20
INDIRF4
CNSTF4 1041865114
LEF4 $1980
line 3951
;3951:			{
line 3952
;3952:				rageTime = 0.15;
ADDRLP4 20
CNSTF4 1041865114
ASGNF4
line 3953
;3953:			}
LABELV $1980
line 3955
;3954:			
;3955:			if (cg.snap->ps.fd.forceRageRecoveryTime > cg.time)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $1982
line 3956
;3956:			{
line 3957
;3957:				float checkRageRecTime = rageTime;
ADDRLP4 60
ADDRLP4 20
INDIRF4
ASGNF4
line 3959
;3958:				
;3959:				if (checkRageRecTime < 0.15)
ADDRLP4 60
INDIRF4
CNSTF4 1041865114
GEF4 $1986
line 3960
;3960:				{
line 3961
;3961:					checkRageRecTime = 0.15;
ADDRLP4 60
CNSTF4 1041865114
ASGNF4
line 3962
;3962:				}
LABELV $1986
line 3964
;3963:				
;3964:				hcolor[3] = checkRageRecTime;
ADDRLP4 0+12
ADDRLP4 60
INDIRF4
ASGNF4
line 3965
;3965:				hcolor[0] = rageTime*4;
ADDRLP4 0
CNSTF4 1082130432
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 3966
;3966:				if (hcolor[0] < 0.2)
ADDRLP4 0
INDIRF4
CNSTF4 1045220557
GEF4 $1989
line 3967
;3967:				{
line 3968
;3968:					hcolor[0] = 0.2;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 3969
;3969:				}
LABELV $1989
line 3970
;3970:				hcolor[1] = 0.2;
ADDRLP4 0+4
CNSTF4 1045220557
ASGNF4
line 3971
;3971:				hcolor[2] = 0.2;
ADDRLP4 0+8
CNSTF4 1045220557
ASGNF4
line 3972
;3972:			}
ADDRGP4 $1983
JUMPV
LABELV $1982
line 3974
;3973:			else
;3974:			{
line 3975
;3975:				hcolor[3] = rageTime;
ADDRLP4 0+12
ADDRLP4 20
INDIRF4
ASGNF4
line 3976
;3976:				hcolor[0] = 0.7;
ADDRLP4 0
CNSTF4 1060320051
ASGNF4
line 3977
;3977:				hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 3978
;3978:				hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 3979
;3979:			}
LABELV $1983
line 3981
;3980:			
;3981:			if (!cg.renderingThirdPerson && rageTime)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $1996
ADDRLP4 20
INDIRF4
CNSTF4 0
EQF4 $1996
line 3982
;3982:			{
line 3983
;3983:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 3984
;3984:			}
ADDRGP4 $1973
JUMPV
LABELV $1996
line 3986
;3985:			else
;3986:			{
line 3987
;3987:				if (cg.snap->ps.fd.forceRageRecoveryTime > cg.time)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $1999
line 3988
;3988:				{
line 3989
;3989:					hcolor[3] = 0.15;
ADDRLP4 0+12
CNSTF4 1041865114
ASGNF4
line 3990
;3990:					hcolor[0] = 0.2;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 3991
;3991:					hcolor[1] = 0.2;
ADDRLP4 0+4
CNSTF4 1045220557
ASGNF4
line 3992
;3992:					hcolor[2] = 0.2;
ADDRLP4 0+8
CNSTF4 1045220557
ASGNF4
line 3993
;3993:					CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 3994
;3994:				}
LABELV $1999
line 3995
;3995:				cgRageTime = 0;
ADDRGP4 cgRageTime
CNSTI4 0
ASGNI4
line 3996
;3996:			}
line 3997
;3997:		}
ADDRGP4 $1973
JUMPV
LABELV $1972
line 3998
;3998:		else if (cg.snap->ps.fd.forceRageRecoveryTime > cg.time)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $2006
line 3999
;3999:		{
line 4000
;4000:			if (!cgRageRecTime)
ADDRGP4 cgRageRecTime
INDIRI4
CNSTI4 0
NEI4 $2010
line 4001
;4001:			{
line 4002
;4002:				cgRageRecTime = cg.time;
ADDRGP4 cgRageRecTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4003
;4003:			}
LABELV $2010
line 4005
;4004:			
;4005:			rageRecTime = (float)(cg.time - cgRageRecTime);
ADDRLP4 48
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgRageRecTime
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4007
;4006:			
;4007:			rageRecTime /= 9000;
ADDRLP4 48
ADDRLP4 48
INDIRF4
CNSTF4 1175232512
DIVF4
ASGNF4
line 4009
;4008:			
;4009:			if (rageRecTime < 0.15)//0)
ADDRLP4 48
INDIRF4
CNSTF4 1041865114
GEF4 $2014
line 4010
;4010:			{
line 4011
;4011:				rageRecTime = 0.15;//0;
ADDRLP4 48
CNSTF4 1041865114
ASGNF4
line 4012
;4012:			}
LABELV $2014
line 4013
;4013:			if (rageRecTime > 0.15)
ADDRLP4 48
INDIRF4
CNSTF4 1041865114
LEF4 $2016
line 4014
;4014:			{
line 4015
;4015:				rageRecTime = 0.15;
ADDRLP4 48
CNSTF4 1041865114
ASGNF4
line 4016
;4016:			}
LABELV $2016
line 4018
;4017:			
;4018:			hcolor[3] = rageRecTime;
ADDRLP4 0+12
ADDRLP4 48
INDIRF4
ASGNF4
line 4019
;4019:			hcolor[0] = 0.2;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 4020
;4020:			hcolor[1] = 0.2;
ADDRLP4 0+4
CNSTF4 1045220557
ASGNF4
line 4021
;4021:			hcolor[2] = 0.2;
ADDRLP4 0+8
CNSTF4 1045220557
ASGNF4
line 4023
;4022:			
;4023:			if (!cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $2021
line 4024
;4024:			{
line 4025
;4025:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 4026
;4026:			}
LABELV $2021
line 4028
;4027:			
;4028:			cgRageRecFadeTime = 0;
ADDRGP4 cgRageRecFadeTime
CNSTI4 0
ASGNI4
line 4029
;4029:			cgRageRecFadeVal = 0;
ADDRGP4 cgRageRecFadeVal
CNSTF4 0
ASGNF4
line 4030
;4030:		}
ADDRGP4 $2007
JUMPV
LABELV $2006
line 4031
;4031:		else if (cgRageRecTime)
ADDRGP4 cgRageRecTime
INDIRI4
CNSTI4 0
EQI4 $2024
line 4032
;4032:		{
line 4033
;4033:			if (!cgRageRecFadeTime)
ADDRGP4 cgRageRecFadeTime
INDIRI4
CNSTI4 0
NEI4 $2026
line 4034
;4034:			{
line 4035
;4035:				cgRageRecFadeTime = cg.time;
ADDRGP4 cgRageRecFadeTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4036
;4036:				cgRageRecFadeVal = 0.15;
ADDRGP4 cgRageRecFadeVal
CNSTF4 1041865114
ASGNF4
line 4037
;4037:			}
LABELV $2026
line 4039
;4038:			
;4039:			rageRecTime = cgRageRecFadeVal;
ADDRLP4 48
ADDRGP4 cgRageRecFadeVal
INDIRF4
ASGNF4
line 4041
;4040:			
;4041:			cgRageRecFadeVal -= (cg.time - cgRageRecFadeTime)*0.000005;
ADDRLP4 56
ADDRGP4 cgRageRecFadeVal
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 916964780
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgRageRecFadeTime
INDIRI4
SUBI4
CVIF4 4
MULF4
SUBF4
ASGNF4
line 4043
;4042:			
;4043:			if (rageRecTime < 0)
ADDRLP4 48
INDIRF4
CNSTF4 0
GEF4 $2030
line 4044
;4044:			{
line 4045
;4045:				rageRecTime = 0;
ADDRLP4 48
CNSTF4 0
ASGNF4
line 4046
;4046:			}
LABELV $2030
line 4047
;4047:			if (rageRecTime > 0.15)
ADDRLP4 48
INDIRF4
CNSTF4 1041865114
LEF4 $2032
line 4048
;4048:			{
line 4049
;4049:				rageRecTime = 0.15;
ADDRLP4 48
CNSTF4 1041865114
ASGNF4
line 4050
;4050:			}
LABELV $2032
line 4052
;4051:			
;4052:			hcolor[3] = rageRecTime;
ADDRLP4 0+12
ADDRLP4 48
INDIRF4
ASGNF4
line 4053
;4053:			hcolor[0] = 0.2;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 4054
;4054:			hcolor[1] = 0.2;
ADDRLP4 0+4
CNSTF4 1045220557
ASGNF4
line 4055
;4055:			hcolor[2] = 0.2;
ADDRLP4 0+8
CNSTF4 1045220557
ASGNF4
line 4057
;4056:			
;4057:			if (!cg.renderingThirdPerson && rageRecTime)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $2037
ADDRLP4 48
INDIRF4
CNSTF4 0
EQF4 $2037
line 4058
;4058:			{
line 4059
;4059:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 4060
;4060:			}
ADDRGP4 $2038
JUMPV
LABELV $2037
line 4062
;4061:			else
;4062:			{
line 4063
;4063:				cgRageRecTime = 0;
ADDRGP4 cgRageRecTime
CNSTI4 0
ASGNI4
line 4064
;4064:			}
LABELV $2038
line 4065
;4065:		}
LABELV $2024
LABELV $2007
LABELV $1973
LABELV $1956
line 4067
;4066:		
;4067:		if (cg.snap->ps.fd.forcePowersActive & (1 << FP_ABSORB))
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2040
line 4068
;4068:		{
line 4069
;4069:			if (!cgAbsorbTime)
ADDRGP4 cgAbsorbTime
INDIRI4
CNSTI4 0
NEI4 $2043
line 4070
;4070:			{
line 4071
;4071:				cgAbsorbTime = cg.time;
ADDRGP4 cgAbsorbTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4072
;4072:			}
LABELV $2043
line 4074
;4073:			
;4074:			absorbTime = (float)(cg.time - cgAbsorbTime);
ADDRLP4 24
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgAbsorbTime
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4076
;4075:			
;4076:			absorbTime /= 9000;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1175232512
DIVF4
ASGNF4
line 4078
;4077:			
;4078:			if (absorbTime < 0)
ADDRLP4 24
INDIRF4
CNSTF4 0
GEF4 $2047
line 4079
;4079:			{
line 4080
;4080:				absorbTime = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 4081
;4081:			}
LABELV $2047
line 4082
;4082:			if (absorbTime > 0.15)
ADDRLP4 24
INDIRF4
CNSTF4 1041865114
LEF4 $2049
line 4083
;4083:			{
line 4084
;4084:				absorbTime = 0.15;
ADDRLP4 24
CNSTF4 1041865114
ASGNF4
line 4085
;4085:			}
LABELV $2049
line 4087
;4086:			
;4087:			hcolor[3] = absorbTime/2;
ADDRLP4 0+12
ADDRLP4 24
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4088
;4088:			hcolor[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4089
;4089:			hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 4090
;4090:			hcolor[2] = 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ASGNF4
line 4092
;4091:			
;4092:			if (!cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $2054
line 4093
;4093:			{
line 4094
;4094:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 4095
;4095:			}
LABELV $2054
line 4097
;4096:			
;4097:			cgAbsorbFadeTime = 0;
ADDRGP4 cgAbsorbFadeTime
CNSTI4 0
ASGNI4
line 4098
;4098:			cgAbsorbFadeVal = 0;
ADDRGP4 cgAbsorbFadeVal
CNSTF4 0
ASGNF4
line 4099
;4099:		}
ADDRGP4 $2041
JUMPV
LABELV $2040
line 4100
;4100:		else if (cgAbsorbTime)
ADDRGP4 cgAbsorbTime
INDIRI4
CNSTI4 0
EQI4 $2057
line 4101
;4101:		{
line 4102
;4102:			if (!cgAbsorbFadeTime)
ADDRGP4 cgAbsorbFadeTime
INDIRI4
CNSTI4 0
NEI4 $2059
line 4103
;4103:			{
line 4104
;4104:				cgAbsorbFadeTime = cg.time;
ADDRGP4 cgAbsorbFadeTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4105
;4105:				cgAbsorbFadeVal = 0.15;
ADDRGP4 cgAbsorbFadeVal
CNSTF4 1041865114
ASGNF4
line 4106
;4106:			}
LABELV $2059
line 4108
;4107:			
;4108:			absorbTime = cgAbsorbFadeVal;
ADDRLP4 24
ADDRGP4 cgAbsorbFadeVal
INDIRF4
ASGNF4
line 4110
;4109:			
;4110:			cgAbsorbFadeVal -= (cg.time - cgAbsorbFadeTime)*0.000005;
ADDRLP4 56
ADDRGP4 cgAbsorbFadeVal
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 916964780
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgAbsorbFadeTime
INDIRI4
SUBI4
CVIF4 4
MULF4
SUBF4
ASGNF4
line 4112
;4111:			
;4112:			if (absorbTime < 0)
ADDRLP4 24
INDIRF4
CNSTF4 0
GEF4 $2063
line 4113
;4113:			{
line 4114
;4114:				absorbTime = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 4115
;4115:			}
LABELV $2063
line 4116
;4116:			if (absorbTime > 0.15)
ADDRLP4 24
INDIRF4
CNSTF4 1041865114
LEF4 $2065
line 4117
;4117:			{
line 4118
;4118:				absorbTime = 0.15;
ADDRLP4 24
CNSTF4 1041865114
ASGNF4
line 4119
;4119:			}
LABELV $2065
line 4121
;4120:			
;4121:			hcolor[3] = absorbTime/2;
ADDRLP4 0+12
ADDRLP4 24
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4122
;4122:			hcolor[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4123
;4123:			hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 4124
;4124:			hcolor[2] = 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ASGNF4
line 4126
;4125:			
;4126:			if (!cg.renderingThirdPerson && absorbTime)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $2070
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $2070
line 4127
;4127:			{
line 4128
;4128:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 4129
;4129:			}
ADDRGP4 $2071
JUMPV
LABELV $2070
line 4131
;4130:			else
;4131:			{
line 4132
;4132:				cgAbsorbTime = 0;
ADDRGP4 cgAbsorbTime
CNSTI4 0
ASGNI4
line 4133
;4133:			}
LABELV $2071
line 4134
;4134:		}
LABELV $2057
LABELV $2041
line 4136
;4135:		
;4136:		if (cg.snap->ps.fd.forcePowersActive & (1 << FP_PROTECT))
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2073
line 4137
;4137:		{
line 4138
;4138:			if (!cgProtectTime)
ADDRGP4 cgProtectTime
INDIRI4
CNSTI4 0
NEI4 $2076
line 4139
;4139:			{
line 4140
;4140:				cgProtectTime = cg.time;
ADDRGP4 cgProtectTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4141
;4141:			}
LABELV $2076
line 4143
;4142:			
;4143:			protectTime = (float)(cg.time - cgProtectTime);
ADDRLP4 28
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgProtectTime
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4145
;4144:			
;4145:			protectTime /= 9000;
ADDRLP4 28
ADDRLP4 28
INDIRF4
CNSTF4 1175232512
DIVF4
ASGNF4
line 4147
;4146:			
;4147:			if (protectTime < 0)
ADDRLP4 28
INDIRF4
CNSTF4 0
GEF4 $2080
line 4148
;4148:			{
line 4149
;4149:				protectTime = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 4150
;4150:			}
LABELV $2080
line 4151
;4151:			if (protectTime > 0.15)
ADDRLP4 28
INDIRF4
CNSTF4 1041865114
LEF4 $2082
line 4152
;4152:			{
line 4153
;4153:				protectTime = 0.15;
ADDRLP4 28
CNSTF4 1041865114
ASGNF4
line 4154
;4154:			}
LABELV $2082
line 4156
;4155:			
;4156:			hcolor[3] = protectTime/2;
ADDRLP4 0+12
ADDRLP4 28
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4157
;4157:			hcolor[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4158
;4158:			hcolor[1] = 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ASGNF4
line 4159
;4159:			hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4161
;4160:			
;4161:			if (!cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $2087
line 4162
;4162:			{
line 4163
;4163:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 4164
;4164:			}
LABELV $2087
line 4166
;4165:			
;4166:			cgProtectFadeTime = 0;
ADDRGP4 cgProtectFadeTime
CNSTI4 0
ASGNI4
line 4167
;4167:			cgProtectFadeVal = 0;
ADDRGP4 cgProtectFadeVal
CNSTF4 0
ASGNF4
line 4168
;4168:		}
ADDRGP4 $2074
JUMPV
LABELV $2073
line 4169
;4169:		else if (cgProtectTime)
ADDRGP4 cgProtectTime
INDIRI4
CNSTI4 0
EQI4 $2090
line 4170
;4170:		{
line 4171
;4171:			if (!cgProtectFadeTime)
ADDRGP4 cgProtectFadeTime
INDIRI4
CNSTI4 0
NEI4 $2092
line 4172
;4172:			{
line 4173
;4173:				cgProtectFadeTime = cg.time;
ADDRGP4 cgProtectFadeTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4174
;4174:				cgProtectFadeVal = 0.15;
ADDRGP4 cgProtectFadeVal
CNSTF4 1041865114
ASGNF4
line 4175
;4175:			}
LABELV $2092
line 4177
;4176:			
;4177:			protectTime = cgProtectFadeVal;
ADDRLP4 28
ADDRGP4 cgProtectFadeVal
INDIRF4
ASGNF4
line 4179
;4178:			
;4179:			cgProtectFadeVal -= (cg.time - cgProtectFadeTime)*0.000005;
ADDRLP4 56
ADDRGP4 cgProtectFadeVal
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 916964780
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgProtectFadeTime
INDIRI4
SUBI4
CVIF4 4
MULF4
SUBF4
ASGNF4
line 4181
;4180:			
;4181:			if (protectTime < 0)
ADDRLP4 28
INDIRF4
CNSTF4 0
GEF4 $2096
line 4182
;4182:			{
line 4183
;4183:				protectTime = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 4184
;4184:			}
LABELV $2096
line 4185
;4185:			if (protectTime > 0.15)
ADDRLP4 28
INDIRF4
CNSTF4 1041865114
LEF4 $2098
line 4186
;4186:			{
line 4187
;4187:				protectTime = 0.15;
ADDRLP4 28
CNSTF4 1041865114
ASGNF4
line 4188
;4188:			}
LABELV $2098
line 4190
;4189:			
;4190:			hcolor[3] = protectTime/2;
ADDRLP4 0+12
ADDRLP4 28
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4191
;4191:			hcolor[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4192
;4192:			hcolor[1] = 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ASGNF4
line 4193
;4193:			hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4195
;4194:			
;4195:			if (!cg.renderingThirdPerson && protectTime)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $2103
ADDRLP4 28
INDIRF4
CNSTF4 0
EQF4 $2103
line 4196
;4196:			{
line 4197
;4197:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 4198
;4198:			}
ADDRGP4 $2104
JUMPV
LABELV $2103
line 4200
;4199:			else
;4200:			{
line 4201
;4201:				cgProtectTime = 0;
ADDRGP4 cgProtectTime
CNSTI4 0
ASGNI4
line 4202
;4202:			}
LABELV $2104
line 4203
;4203:		}
LABELV $2090
LABELV $2074
line 4205
;4204:		
;4205:		if (cg.snap->ps.rocketLockIndex != MAX_CLIENTS && (cg.time - cg.snap->ps.rocketLockTime) > 0)
ADDRGP4 cg+36
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 32
EQI4 $2106
ADDRGP4 cg+64
INDIRI4
CVIF4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
SUBF4
CNSTF4 0
LEF4 $2106
line 4206
;4206:		{
line 4207
;4207:			CG_DrawRocketLocking( cg.snap->ps.rocketLockIndex, cg.snap->ps.rocketLockTime );
ADDRGP4 cg+36
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawRocketLocking
CALLV
pop
line 4208
;4208:		}
LABELV $2106
line 4210
;4209:		
;4210:		if (BG_HasYsalamiri(cgs.gametype, &cg.snap->ps))
ADDRGP4 cgs+32960
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $2113
line 4211
;4211:		{
line 4212
;4212:			if (!cgYsalTime)
ADDRGP4 cgYsalTime
INDIRI4
CNSTI4 0
NEI4 $2117
line 4213
;4213:			{
line 4214
;4214:				cgYsalTime = cg.time;
ADDRGP4 cgYsalTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4215
;4215:			}
LABELV $2117
line 4217
;4216:			
;4217:			ysalTime = (float)(cg.time - cgYsalTime);
ADDRLP4 32
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgYsalTime
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4219
;4218:			
;4219:			ysalTime /= 9000;
ADDRLP4 32
ADDRLP4 32
INDIRF4
CNSTF4 1175232512
DIVF4
ASGNF4
line 4221
;4220:			
;4221:			if (ysalTime < 0)
ADDRLP4 32
INDIRF4
CNSTF4 0
GEF4 $2121
line 4222
;4222:			{
line 4223
;4223:				ysalTime = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 4224
;4224:			}
LABELV $2121
line 4225
;4225:			if (ysalTime > 0.15)
ADDRLP4 32
INDIRF4
CNSTF4 1041865114
LEF4 $2123
line 4226
;4226:			{
line 4227
;4227:				ysalTime = 0.15;
ADDRLP4 32
CNSTF4 1041865114
ASGNF4
line 4228
;4228:			}
LABELV $2123
line 4230
;4229:			
;4230:			hcolor[3] = ysalTime/2;
ADDRLP4 0+12
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4231
;4231:			hcolor[0] = 0.7;
ADDRLP4 0
CNSTF4 1060320051
ASGNF4
line 4232
;4232:			hcolor[1] = 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ASGNF4
line 4233
;4233:			hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4235
;4234:			
;4235:			if (!cg.renderingThirdPerson)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $2128
line 4236
;4236:			{
line 4237
;4237:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 4238
;4238:			}
LABELV $2128
line 4240
;4239:			
;4240:			cgYsalFadeTime = 0;
ADDRGP4 cgYsalFadeTime
CNSTI4 0
ASGNI4
line 4241
;4241:			cgYsalFadeVal = 0;
ADDRGP4 cgYsalFadeVal
CNSTF4 0
ASGNF4
line 4242
;4242:		}
ADDRGP4 $2114
JUMPV
LABELV $2113
line 4243
;4243:		else if (cgYsalTime)
ADDRGP4 cgYsalTime
INDIRI4
CNSTI4 0
EQI4 $2131
line 4244
;4244:		{
line 4245
;4245:			if (!cgYsalFadeTime)
ADDRGP4 cgYsalFadeTime
INDIRI4
CNSTI4 0
NEI4 $2133
line 4246
;4246:			{
line 4247
;4247:				cgYsalFadeTime = cg.time;
ADDRGP4 cgYsalFadeTime
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 4248
;4248:				cgYsalFadeVal = 0.15;
ADDRGP4 cgYsalFadeVal
CNSTF4 1041865114
ASGNF4
line 4249
;4249:			}
LABELV $2133
line 4251
;4250:			
;4251:			ysalTime = cgYsalFadeVal;
ADDRLP4 32
ADDRGP4 cgYsalFadeVal
INDIRF4
ASGNF4
line 4253
;4252:			
;4253:			cgYsalFadeVal -= (cg.time - cgYsalFadeTime)*0.000005;
ADDRLP4 60
ADDRGP4 cgYsalFadeVal
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 916964780
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgYsalFadeTime
INDIRI4
SUBI4
CVIF4 4
MULF4
SUBF4
ASGNF4
line 4255
;4254:			
;4255:			if (ysalTime < 0)
ADDRLP4 32
INDIRF4
CNSTF4 0
GEF4 $2137
line 4256
;4256:			{
line 4257
;4257:				ysalTime = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 4258
;4258:			}
LABELV $2137
line 4259
;4259:			if (ysalTime > 0.15)
ADDRLP4 32
INDIRF4
CNSTF4 1041865114
LEF4 $2139
line 4260
;4260:			{
line 4261
;4261:				ysalTime = 0.15;
ADDRLP4 32
CNSTF4 1041865114
ASGNF4
line 4262
;4262:			}
LABELV $2139
line 4264
;4263:			
;4264:			hcolor[3] = ysalTime/2;
ADDRLP4 0+12
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4265
;4265:			hcolor[0] = 0.7;
ADDRLP4 0
CNSTF4 1060320051
ASGNF4
line 4266
;4266:			hcolor[1] = 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ASGNF4
line 4267
;4267:			hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4269
;4268:			
;4269:			if (!cg.renderingThirdPerson && ysalTime)
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
NEI4 $2144
ADDRLP4 32
INDIRF4
CNSTF4 0
EQF4 $2144
line 4270
;4270:			{
line 4271
;4271:				CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 4272
;4272:			}
ADDRGP4 $2145
JUMPV
LABELV $2144
line 4274
;4273:			else
;4274:			{
line 4275
;4275:				cgYsalTime = 0;
ADDRGP4 cgYsalTime
CNSTI4 0
ASGNI4
line 4276
;4276:			}
LABELV $2145
line 4277
;4277:		}
LABELV $2131
LABELV $2114
line 4278
;4278:	}
LABELV $1950
line 4280
;4279:
;4280:	if (cg.snap->ps.rocketLockIndex != MAX_CLIENTS && (cg.time - cg.snap->ps.rocketLockTime) > 0)
ADDRGP4 cg+36
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 32
EQI4 $2147
ADDRGP4 cg+64
INDIRI4
CVIF4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
SUBF4
CNSTF4 0
LEF4 $2147
line 4281
;4281:	{
line 4282
;4282:		CG_DrawRocketLocking( cg.snap->ps.rocketLockIndex, cg.snap->ps.rocketLockTime );
ADDRGP4 cg+36
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_DrawRocketLocking
CALLV
pop
line 4283
;4283:	}
LABELV $2147
line 4285
;4284:
;4285:	if (cg.snap->ps.holocronBits)
ADDRGP4 cg+36
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2154
line 4286
;4286:	{
line 4287
;4287:		CG_DrawHolocronIcons();
ADDRGP4 CG_DrawHolocronIcons
CALLV
pop
line 4288
;4288:	}
LABELV $2154
line 4289
;4289:	if (cg.snap->ps.fd.forcePowersActive || cg.snap->ps.fd.forceRageRecoveryTime > cg.time)
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2162
ADDRGP4 cg+36
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LEI4 $2157
LABELV $2162
line 4290
;4290:	{
line 4291
;4291:		CG_DrawActivePowers();
ADDRGP4 CG_DrawActivePowers
CALLV
pop
line 4292
;4292:	}
LABELV $2157
line 4295
;4293:
;4294:	// Draw this before the text so that any text won't get clipped off
;4295:	CG_DrawZoomMask();
ADDRGP4 CG_DrawZoomMask
CALLV
pop
line 4302
;4296:
;4297:/*
;4298:	if (cg.cameraMode) {
;4299:		return;
;4300:	}
;4301:*/
;4302:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2163
line 4303
;4303:		CG_DrawSpectator();
ADDRGP4 CG_DrawSpectator
CALLV
pop
line 4304
;4304:		CG_DrawCrosshair(NULL, 0);
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 4305
;4305:		CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 4306
;4306:		CG_SaberClashFlare();
ADDRGP4 CG_SaberClashFlare
CALLV
pop
line 4307
;4307:	} else {
ADDRGP4 $2164
JUMPV
LABELV $2163
line 4309
;4308:		// don't draw any status if dead or the scoreboard is being explicitly shown
;4309:		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0 ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 cg+6984
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $2166
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $2166
line 4311
;4310:
;4311:			if ( /*cg_drawStatus.integer*/0 ) {
ADDRGP4 $2170
JUMPV
line 4313
;4312:				//Reenable if stats are drawn with menu system again
;4313:				Menu_PaintAll();
ADDRGP4 Menu_PaintAll
CALLV
pop
line 4314
;4314:				CG_DrawTimedMenus();
ADDRGP4 CG_DrawTimedMenus
CALLV
pop
line 4315
;4315:			}
LABELV $2170
line 4319
;4316:      
;4317:			//CG_DrawTemporaryStats();
;4318:
;4319:			CG_DrawAmmoWarning();
ADDRGP4 CG_DrawAmmoWarning
CALLV
pop
line 4321
;4320:
;4321:			CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 4323
;4322:
;4323:			if (cg_drawStatus.integer)
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
EQI4 $2172
line 4324
;4324:			{
line 4325
;4325:				CG_DrawIconBackground();
ADDRGP4 CG_DrawIconBackground
CALLV
pop
line 4326
;4326:			}
LABELV $2172
line 4328
;4327:
;4328:			if (inTime > wpTime)
ADDRLP4 40
INDIRF4
ADDRLP4 44
INDIRF4
LEF4 $2175
line 4329
;4329:			{
line 4330
;4330:				drawSelect = 1;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 4331
;4331:				bestTime = cg.invenSelectTime;
ADDRLP4 52
ADDRGP4 cg+13788
INDIRF4
ASGNF4
line 4332
;4332:			}
ADDRGP4 $2176
JUMPV
LABELV $2175
line 4334
;4333:			else //only draw the most recent since they're drawn in the same place
;4334:			{
line 4335
;4335:				drawSelect = 2;
ADDRLP4 36
CNSTI4 2
ASGNI4
line 4336
;4336:				bestTime = cg.weaponSelectTime;
ADDRLP4 52
ADDRGP4 cg+13372
INDIRI4
CVIF4 4
ASGNF4
line 4337
;4337:			}
LABELV $2176
line 4339
;4338:
;4339:			if (cg.forceSelectTime > bestTime)
ADDRGP4 cg+13792
INDIRF4
ADDRLP4 52
INDIRF4
LEF4 $2179
line 4340
;4340:			{
line 4341
;4341:				drawSelect = 3;
ADDRLP4 36
CNSTI4 3
ASGNI4
line 4342
;4342:			}
LABELV $2179
line 4344
;4343:
;4344:			switch(drawSelect)
ADDRLP4 60
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
EQI4 $2184
ADDRLP4 60
INDIRI4
CNSTI4 2
EQI4 $2185
ADDRLP4 60
INDIRI4
CNSTI4 3
EQI4 $2186
ADDRGP4 $2183
JUMPV
line 4345
;4345:			{
LABELV $2184
line 4347
;4346:			case 1:
;4347:				CG_DrawInvenSelect();
ADDRGP4 CG_DrawInvenSelect
CALLV
pop
line 4348
;4348:				break;
ADDRGP4 $2183
JUMPV
LABELV $2185
line 4350
;4349:			case 2:
;4350:				CG_DrawWeaponSelect();
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 4351
;4351:				break;
ADDRGP4 $2183
JUMPV
LABELV $2186
line 4353
;4352:			case 3:
;4353:				CG_DrawForceSelect();
ADDRGP4 CG_DrawForceSelect
CALLV
pop
line 4354
;4354:				break;
line 4356
;4355:			default:
;4356:				break;
LABELV $2183
line 4359
;4357:			}
;4358:
;4359:			if (cg_drawStatus.integer)
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
EQI4 $2187
line 4360
;4360:			{
line 4364
;4361:				//Powerups now done with upperright stuff
;4362:				//CG_DrawPowerupIcons();
;4363:
;4364:				CG_DrawFlagStatus();
ADDRGP4 CG_DrawFlagStatus
CALLV
pop
line 4365
;4365:			}
LABELV $2187
line 4367
;4366:
;4367:			CG_SaberClashFlare();
ADDRGP4 CG_SaberClashFlare
CALLV
pop
line 4369
;4368:
;4369:			if (cg_drawStatus.integer)
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
EQI4 $2190
line 4370
;4370:			{
line 4371
;4371:				CG_DrawStats();
ADDRGP4 CG_DrawStats
CALLV
pop
line 4372
;4372:			}
LABELV $2190
line 4376
;4373:
;4374:			//Do we want to use this system again at some point?
;4375:			//CG_DrawReward();
;4376:		}
LABELV $2166
line 4378
;4377:    
;4378:	}
LABELV $2164
line 4380
;4379:
;4380:	if (cg.snap->ps.fallingToDeath)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2193
line 4381
;4381:	{
line 4382
;4382:		fallTime = (float)(cg.time - cg.snap->ps.fallingToDeath);
ADDRLP4 16
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 1396
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4384
;4383:
;4384:		fallTime /= (FALL_FADE_TIME/2);
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1153138688
DIVF4
ASGNF4
line 4386
;4385:
;4386:		if (fallTime < 0)
ADDRLP4 16
INDIRF4
CNSTF4 0
GEF4 $2198
line 4387
;4387:		{
line 4388
;4388:			fallTime = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 4389
;4389:		}
LABELV $2198
line 4390
;4390:		if (fallTime > 1)
ADDRLP4 16
INDIRF4
CNSTF4 1065353216
LEF4 $2200
line 4391
;4391:		{
line 4392
;4392:			fallTime = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 4393
;4393:		}
LABELV $2200
line 4395
;4394:
;4395:		hcolor[3] = fallTime;
ADDRLP4 0+12
ADDRLP4 16
INDIRF4
ASGNF4
line 4396
;4396:		hcolor[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4397
;4397:		hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 4398
;4398:		hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4400
;4399:
;4400:		CG_DrawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH*SCREEN_HEIGHT, hcolor);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
CNSTF4 1217789952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRect
CALLV
pop
line 4402
;4401:
;4402:		if (!gCGHasFallVector)
ADDRGP4 gCGHasFallVector
INDIRI4
CNSTI4 0
NEI4 $2194
line 4403
;4403:		{
line 4404
;4404:			VectorCopy(cg.snap->ps.origin, gCGFallVector);
ADDRGP4 gCGFallVector
ADDRGP4 cg+36
INDIRP4
CNSTI4 64
ADDP4
INDIRB
ASGNB 12
line 4405
;4405:			gCGHasFallVector = qtrue;
ADDRGP4 gCGHasFallVector
CNSTI4 1
ASGNI4
line 4406
;4406:		}
line 4407
;4407:	}
ADDRGP4 $2194
JUMPV
LABELV $2193
line 4409
;4408:	else
;4409:	{
line 4410
;4410:		if (gCGHasFallVector)
ADDRGP4 gCGHasFallVector
INDIRI4
CNSTI4 0
EQI4 $2208
line 4411
;4411:		{
line 4412
;4412:			gCGHasFallVector = qfalse;
ADDRGP4 gCGHasFallVector
CNSTI4 0
ASGNI4
line 4413
;4413:			VectorClear(gCGFallVector);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRGP4 gCGFallVector+8
ADDRLP4 56
INDIRF4
ASGNF4
ADDRGP4 gCGFallVector+4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRGP4 gCGFallVector
ADDRLP4 56
INDIRF4
ASGNF4
line 4414
;4414:		}
LABELV $2208
line 4415
;4415:	}
LABELV $2194
line 4417
;4416:
;4417:	CG_DrawVote();
ADDRGP4 CG_DrawVote
CALLV
pop
line 4418
;4418:	CG_DrawTeamVote();
ADDRGP4 CG_DrawTeamVote
CALLV
pop
line 4420
;4419:
;4420:	CG_DrawLagometer();
ADDRGP4 CG_DrawLagometer
CALLV
pop
line 4422
;4421:
;4422:	if (!cg_paused.integer) {
ADDRGP4 cg_paused+12
INDIRI4
CNSTI4 0
NEI4 $2212
line 4423
;4423:		CG_DrawUpperRight();
ADDRGP4 CG_DrawUpperRight
CALLV
pop
line 4424
;4424:	}
LABELV $2212
line 4426
;4425:
;4426:	if ( !CG_DrawFollow() ) {
ADDRLP4 56
ADDRGP4 CG_DrawFollow
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $2215
line 4427
;4427:		CG_DrawWarmup();
ADDRGP4 CG_DrawWarmup
CALLV
pop
line 4428
;4428:	}
LABELV $2215
line 4431
;4429:
;4430:	// don't draw center string if scoreboard is up
;4431:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 60
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+6988
ADDRLP4 60
INDIRI4
ASGNI4
line 4432
;4432:	if ( !cg.scoreBoardShowing) {
ADDRGP4 cg+6988
INDIRI4
CNSTI4 0
NEI4 $2218
line 4433
;4433:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 4434
;4434:	}
LABELV $2218
line 4435
;4435:}
LABELV $1925
endproc CG_Draw2D 68 24
proc CG_DrawTourneyScoreboard 0 0
line 4438
;4436:
;4437:
;4438:static void CG_DrawTourneyScoreboard() {
line 4439
;4439:}
LABELV $2221
endproc CG_DrawTourneyScoreboard 0 0
export CG_DrawActive
proc CG_DrawActive 24 4
line 4448
;4440:
;4441:/*
;4442:=====================
;4443:CG_DrawActive
;4444:
;4445:Perform all drawing needed to completely fill the screen
;4446:=====================
;4447:*/
;4448:void CG_DrawActive( stereoFrame_t stereoView ) {
line 4453
;4449:	float		separation;
;4450:	vec3_t		baseOrg;
;4451:
;4452:	// optionally draw the info screen instead
;4453:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2223
line 4454
;4454:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 4455
;4455:		return;
ADDRGP4 $2222
JUMPV
LABELV $2223
line 4459
;4456:	}
;4457:
;4458:	// optionally draw the tournement scoreboard instead
;4459:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2226
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $2226
line 4460
;4460:		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
line 4461
;4461:		CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 4462
;4462:		return;
ADDRGP4 $2222
JUMPV
LABELV $2226
line 4465
;4463:	}
;4464:
;4465:	switch ( stereoView ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2233
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $2234
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $2236
ADDRGP4 $2230
JUMPV
LABELV $2233
line 4467
;4466:	case STEREO_CENTER:
;4467:		separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4468
;4468:		break;
ADDRGP4 $2231
JUMPV
LABELV $2234
line 4470
;4469:	case STEREO_LEFT:
;4470:		separation = -cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4471
;4471:		break;
ADDRGP4 $2231
JUMPV
LABELV $2236
line 4473
;4472:	case STEREO_RIGHT:
;4473:		separation = cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 4474
;4474:		break;
ADDRGP4 $2231
JUMPV
LABELV $2230
line 4476
;4475:	default:
;4476:		separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4477
;4477:		CG_Error( "CG_DrawActive: Undefined stereoView" );
ADDRGP4 $2238
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 4478
;4478:	}
LABELV $2231
line 4482
;4479:
;4480:
;4481:	// clear around the rendered view if sized down
;4482:	CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 4485
;4483:
;4484:	// offset vieworg appropriately if we're doing stereo separation
;4485:	VectorCopy( cg.refdef.vieworg, baseOrg );
ADDRLP4 4
ADDRGP4 cg+3616+24
INDIRB
ASGNB 12
line 4486
;4486:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $2241
line 4487
;4487:		VectorMA( cg.refdef.vieworg, -separation, cg.refdef.viewaxis[1], cg.refdef.vieworg );
ADDRGP4 cg+3616+24
ADDRGP4 cg+3616+24
INDIRF4
ADDRGP4 cg+3616+36+12
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+3616+24+4
ADDRGP4 cg+3616+24+4
INDIRF4
ADDRGP4 cg+3616+36+12+4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+3616+24+8
ADDRGP4 cg+3616+24+8
INDIRF4
ADDRGP4 cg+3616+36+12+8
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 4488
;4488:	}
LABELV $2241
line 4491
;4489:
;4490:	// draw 3D view
;4491:	trap_R_RenderScene( &cg.refdef );
ADDRGP4 cg+3616
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 4494
;4492:
;4493:	// restore original viewpoint if running stereo
;4494:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $2271
line 4495
;4495:		VectorCopy( baseOrg, cg.refdef.vieworg );
ADDRGP4 cg+3616+24
ADDRLP4 4
INDIRB
ASGNB 12
line 4496
;4496:	}
LABELV $2271
line 4499
;4497:
;4498:	// draw status bar and other floating elements
;4499: 	CG_Draw2D();
ADDRGP4 CG_Draw2D
CALLV
pop
line 4500
;4500:}
LABELV $2222
endproc CG_DrawActive 24 4
bss
export gCGFallVector
align 4
LABELV gCGFallVector
skip 12
export lagometer
align 4
LABELV lagometer
skip 1544
import zoomFov
export lastvalidlockdif
align 4
LABELV lastvalidlockdif
skip 4
export hudTintColor
align 4
LABELV hudTintColor
skip 4
import cgDC
import CG_CalcMuzzlePoint
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
import CG_OwnerDraw
export teamChat2
align 1
LABELV teamChat2
skip 256
export teamChat1
align 1
LABELV teamChat1
skip 256
export systemChat
align 1
LABELV systemChat
skip 256
import drawTeamOverlayModificationCount
export numSortedTeamPlayers
align 4
LABELV numSortedTeamPlayers
skip 4
export sortedTeamPlayers
align 4
LABELV sortedTeamPlayers
skip 128
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
LABELV $2238
char 1 67
char 1 71
char 1 95
char 1 68
char 1 114
char 1 97
char 1 119
char 1 65
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 58
char 1 32
char 1 85
char 1 110
char 1 100
char 1 101
char 1 102
char 1 105
char 1 110
char 1 101
char 1 100
char 1 32
char 1 115
char 1 116
char 1 101
char 1 114
char 1 101
char 1 111
char 1 86
char 1 105
char 1 101
char 1 119
char 1 0
align 1
LABELV $1920
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 114
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $1919
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 98
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $1916
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 98
char 1 102
char 1 108
char 1 97
char 1 103
char 1 95
char 1 120
char 1 0
align 1
LABELV $1915
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 114
char 1 102
char 1 108
char 1 97
char 1 103
char 1 95
char 1 120
char 1 0
align 1
LABELV $1899
char 1 48
char 1 0
align 1
LABELV $1898
char 1 99
char 1 108
char 1 95
char 1 99
char 1 111
char 1 110
char 1 88
char 1 79
char 1 102
char 1 102
char 1 115
char 1 101
char 1 116
char 1 0
align 1
LABELV $1897
char 1 118
char 1 111
char 1 105
char 1 99
char 1 101
char 1 77
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $1867
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 83
char 1 95
char 1 73
char 1 78
char 1 0
align 1
LABELV $1862
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 89
char 1 115
char 1 97
char 1 108
char 1 97
char 1 109
char 1 105
char 1 114
char 1 105
char 1 0
align 1
LABELV $1858
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 70
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $1854
char 1 78
char 1 47
char 1 65
char 1 0
align 1
LABELV $1850
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $1846
char 1 74
char 1 101
char 1 100
char 1 105
char 1 32
char 1 77
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $1842
char 1 72
char 1 111
char 1 108
char 1 111
char 1 99
char 1 114
char 1 111
char 1 110
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $1838
char 1 70
char 1 114
char 1 101
char 1 101
char 1 32
char 1 70
char 1 111
char 1 114
char 1 32
char 1 65
char 1 108
char 1 108
char 1 0
align 1
LABELV $1834
char 1 37
char 1 115
char 1 32
char 1 118
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1813
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 70
char 1 79
char 1 82
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 83
char 1 0
align 1
LABELV $1802
char 1 70
char 1 79
char 1 76
char 1 76
char 1 79
char 1 87
char 1 73
char 1 78
char 1 71
char 1 0
align 1
LABELV $1786
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 40
char 1 37
char 1 105
char 1 41
char 1 58
char 1 37
char 1 115
char 1 32
char 1 121
char 1 101
char 1 115
char 1 58
char 1 37
char 1 105
char 1 32
char 1 110
char 1 111
char 1 58
char 1 37
char 1 105
char 1 0
align 1
LABELV $1781
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 40
char 1 37
char 1 105
char 1 41
char 1 58
char 1 40
char 1 77
char 1 97
char 1 107
char 1 101
char 1 32
char 1 37
char 1 115
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 110
char 1 101
char 1 119
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 108
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 41
char 1 32
char 1 121
char 1 101
char 1 115
char 1 58
char 1 37
char 1 105
char 1 32
char 1 110
char 1 111
char 1 58
char 1 37
char 1 105
char 1 0
align 1
LABELV $1766
char 1 108
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $1742
char 1 79
char 1 82
char 1 95
char 1 80
char 1 82
char 1 69
char 1 83
char 1 83
char 1 95
char 1 69
char 1 83
char 1 67
char 1 95
char 1 84
char 1 72
char 1 69
char 1 78
char 1 95
char 1 67
char 1 76
char 1 73
char 1 67
char 1 75
char 1 95
char 1 86
char 1 79
char 1 84
char 1 69
char 1 0
align 1
LABELV $1738
char 1 86
char 1 79
char 1 84
char 1 69
char 1 40
char 1 37
char 1 105
char 1 41
char 1 58
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 58
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 58
char 1 37
char 1 105
char 1 0
align 1
LABELV $1737
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 48
char 1 95
char 1 78
char 1 79
char 1 0
align 1
LABELV $1736
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 48
char 1 95
char 1 89
char 1 69
char 1 83
char 1 0
align 1
LABELV $1723
char 1 83
char 1 80
char 1 69
char 1 67
char 1 95
char 1 67
char 1 72
char 1 79
char 1 79
char 1 83
char 1 69
char 1 74
char 1 79
char 1 73
char 1 78
char 1 0
align 1
LABELV $1722
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 84
char 1 79
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 0
align 1
LABELV $1690
char 1 83
char 1 80
char 1 69
char 1 67
char 1 72
char 1 85
char 1 68
char 1 95
char 1 86
char 1 69
char 1 82
char 1 83
char 1 85
char 1 83
char 1 0
align 1
LABELV $1686
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1680
char 1 83
char 1 80
char 1 69
char 1 67
char 1 84
char 1 65
char 1 84
char 1 79
char 1 82
char 1 0
align 1
LABELV $1549
char 1 103
char 1 102
char 1 120
char 1 47
char 1 50
char 1 100
char 1 47
char 1 108
char 1 111
char 1 99
char 1 107
char 1 0
align 1
LABELV $1542
char 1 103
char 1 102
char 1 120
char 1 47
char 1 50
char 1 100
char 1 47
char 1 119
char 1 101
char 1 100
char 1 103
char 1 101
char 1 0
align 1
LABELV $1534
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
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 47
char 1 116
char 1 105
char 1 99
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1533
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
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 47
char 1 108
char 1 111
char 1 99
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1430
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
char 1 70
char 1 108
char 1 97
char 1 114
char 1 101
char 1 0
align 1
LABELV $1233
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 77
char 1 69
char 1 83
char 1 83
char 1 65
char 1 71
char 1 69
char 1 0
align 1
LABELV $1205
char 1 115
char 1 110
char 1 99
char 1 0
align 1
LABELV $1140
char 1 103
char 1 102
char 1 120
char 1 47
char 1 50
char 1 100
char 1 47
char 1 110
char 1 101
char 1 116
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $1136
char 1 67
char 1 79
char 1 78
char 1 78
char 1 69
char 1 67
char 1 84
char 1 73
char 1 79
char 1 78
char 1 95
char 1 73
char 1 78
char 1 84
char 1 69
char 1 82
char 1 82
char 1 85
char 1 80
char 1 84
char 1 69
char 1 68
char 1 0
align 1
LABELV $1130
char 1 80
char 1 76
char 1 69
char 1 65
char 1 83
char 1 69
char 1 95
char 1 87
char 1 65
char 1 73
char 1 84
char 1 0
align 1
LABELV $1129
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 95
char 1 67
char 1 72
char 1 65
char 1 78
char 1 71
char 1 73
char 1 78
char 1 71
char 1 95
char 1 77
char 1 65
char 1 80
char 1 83
char 1 0
align 1
LABELV $1090
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 98
char 1 102
char 1 108
char 1 97
char 1 103
char 1 95
char 1 121
char 1 115
char 1 0
align 1
LABELV $1089
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 114
char 1 102
char 1 108
char 1 97
char 1 103
char 1 95
char 1 121
char 1 115
char 1 0
align 1
LABELV $1048
char 1 37
char 1 51
char 1 105
char 1 32
char 1 37
char 1 51
char 1 105
char 1 0
align 1
LABELV $1045
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 0
align 1
LABELV $978
char 1 37
char 1 105
char 1 58
char 1 37
char 1 48
char 1 50
char 1 105
char 1 46
char 1 37
char 1 48
char 1 51
char 1 105
char 1 0
align 1
LABELV $974
char 1 37
char 1 105
char 1 102
char 1 112
char 1 115
char 1 0
align 1
LABELV $958
char 1 116
char 1 105
char 1 109
char 1 101
char 1 58
char 1 37
char 1 105
char 1 32
char 1 115
char 1 110
char 1 97
char 1 112
char 1 58
char 1 37
char 1 105
char 1 32
char 1 99
char 1 109
char 1 100
char 1 58
char 1 37
char 1 105
char 1 0
align 1
LABELV $953
char 1 37
char 1 105
char 1 47
char 1 37
char 1 105
char 1 0
align 1
LABELV $939
char 1 76
char 1 69
char 1 65
char 1 68
char 1 69
char 1 82
char 1 0
align 1
LABELV $938
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $915
char 1 68
char 1 85
char 1 69
char 1 76
char 1 73
char 1 78
char 1 71
char 1 0
align 1
LABELV $908
char 1 71
char 1 69
char 1 84
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 0
align 1
LABELV $904
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 55
char 1 0
align 1
LABELV $903
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 0
align 1
LABELV $886
char 1 32
char 1 66
char 1 108
char 1 117
char 1 101
char 1 58
char 1 32
char 1 0
align 1
LABELV $881
char 1 45
char 1 0
align 1
LABELV $879
char 1 82
char 1 101
char 1 100
char 1 58
char 1 32
char 1 0
align 1
LABELV $837
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
LABELV $793
char 1 69
char 1 77
char 1 80
char 1 84
char 1 89
char 1 32
char 1 73
char 1 78
char 1 86
char 1 69
char 1 78
char 1 84
char 1 79
char 1 82
char 1 89
char 1 0
align 1
LABELV $762
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $677
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 104
char 1 117
char 1 100
char 1 0
align 1
LABELV $674
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $672
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 37
char 1 115
char 1 0
align 1
LABELV $671
char 1 32
char 1 40
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $670
char 1 32
char 1 40
char 1 43
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $669
char 1 32
char 1 40
char 1 84
char 1 105
char 1 101
char 1 41
char 1 0
align 1
LABELV $664
char 1 0
align 1
LABELV $651
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 47
char 1 37
char 1 105
char 1 0
align 1
LABELV $645
char 1 108
char 1 101
char 1 102
char 1 116
char 1 104
char 1 117
char 1 100
char 1 0
align 1
LABELV $630
char 1 37
char 1 115
char 1 0
align 1
LABELV $628
char 1 70
char 1 65
char 1 83
char 1 84
char 1 0
align 1
LABELV $627
char 1 77
char 1 69
char 1 68
char 1 73
char 1 85
char 1 77
char 1 0
align 1
LABELV $623
char 1 83
char 1 84
char 1 82
char 1 79
char 1 78
char 1 71
char 1 0
align 1
LABELV $612
char 1 37
char 1 105
char 1 0
align 1
LABELV $146
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 84
char 1 72
char 1 82
char 1 79
char 1 87
char 1 50
char 1 0
align 1
LABELV $145
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 68
char 1 69
char 1 70
char 1 69
char 1 78
char 1 83
char 1 69
char 1 50
char 1 0
align 1
LABELV $144
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 79
char 1 70
char 1 70
char 1 69
char 1 78
char 1 83
char 1 69
char 1 50
char 1 0
align 1
LABELV $143
char 1 83
char 1 69
char 1 69
char 1 73
char 1 78
char 1 71
char 1 50
char 1 0
align 1
LABELV $142
char 1 68
char 1 82
char 1 65
char 1 73
char 1 78
char 1 50
char 1 0
align 1
LABELV $141
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 82
char 1 69
char 1 80
char 1 76
char 1 69
char 1 78
char 1 73
char 1 83
char 1 72
char 1 50
char 1 0
align 1
LABELV $140
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 72
char 1 69
char 1 65
char 1 76
char 1 50
char 1 0
align 1
LABELV $139
char 1 65
char 1 66
char 1 83
char 1 79
char 1 82
char 1 66
char 1 50
char 1 0
align 1
LABELV $138
char 1 80
char 1 82
char 1 79
char 1 84
char 1 69
char 1 67
char 1 84
char 1 50
char 1 0
align 1
LABELV $137
char 1 68
char 1 65
char 1 82
char 1 75
char 1 95
char 1 82
char 1 65
char 1 71
char 1 69
char 1 50
char 1 0
align 1
LABELV $136
char 1 76
char 1 73
char 1 71
char 1 72
char 1 84
char 1 78
char 1 73
char 1 78
char 1 71
char 1 50
char 1 0
align 1
LABELV $135
char 1 71
char 1 82
char 1 73
char 1 80
char 1 50
char 1 0
align 1
LABELV $134
char 1 77
char 1 73
char 1 78
char 1 68
char 1 84
char 1 82
char 1 73
char 1 67
char 1 75
char 1 50
char 1 0
align 1
LABELV $133
char 1 80
char 1 85
char 1 76
char 1 76
char 1 50
char 1 0
align 1
LABELV $132
char 1 80
char 1 85
char 1 83
char 1 72
char 1 50
char 1 0
align 1
LABELV $131
char 1 83
char 1 80
char 1 69
char 1 69
char 1 68
char 1 50
char 1 0
align 1
LABELV $130
char 1 74
char 1 85
char 1 77
char 1 80
char 1 50
char 1 0
align 1
LABELV $129
char 1 72
char 1 69
char 1 65
char 1 76
char 1 50
char 1 0
