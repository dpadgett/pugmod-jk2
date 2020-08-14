// Copyright (C) 1999-2000 Id Software, Inc.
//
// cg_consolecmds.c -- text commands typed in at the local console, or
// executed by a key binding

#include "cg_local.h"
#include "../ui/ui_shared.h"
extern menuDef_t *menuScoreboard;



void CG_TargetCommand_f( void ) {
	int		targetNum;
	char	test[4];

	targetNum = CG_CrosshairPlayer();
	if (!targetNum ) {
		return;
	}

	trap_Argv( 1, test, 4 );
	trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( test ) ) );
}



/*
=================
CG_SizeUp_f

Keybinding command
=================
*/
static void CG_SizeUp_f (void) {
	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer+10)));
}


/*
=================
CG_SizeDown_f

Keybinding command
=================
*/
static void CG_SizeDown_f (void) {
	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer-10)));
}


/*
=============
CG_Viewpos_f

Debugging command to print the current position
=============
*/
static void CG_Viewpos_f (void) {
	CG_Printf ("%s (%i %i %i) : %i\n", cgs.mapname, (int)cg.refdef.vieworg[0],
		(int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
		(int)cg.refdefViewAngles[YAW]);
}


static void CG_ScoresDown_f( void ) {

	CG_BuildSpectatorString();
	if ( cg.scoresRequestTime + 2000 < cg.time ) {
		// the scores are more than two seconds out of data,
		// so request new ones
		cg.scoresRequestTime = cg.time;
		trap_SendClientCommand( "score" );

		// leave the current scores up if they were already
		// displayed, but if this is the first hit, clear them out
		if ( !cg.showScores ) {
			cg.showScores = qtrue;
			cg.numScores = 0;
		}
	} else {
		// show the cached contents even if they just pressed if it
		// is within two seconds
		cg.showScores = qtrue;
	}
}

static void CG_ScoresUp_f( void ) {
	if ( cg.showScores ) {
		cg.showScores = qfalse;
		cg.scoreFadeTime = cg.time;
	}
}

extern menuDef_t *menuScoreboard;
void Menu_Reset();			// FIXME: add to right include file

static void CG_scrollScoresDown_f( void) {
	if (menuScoreboard && cg.scoreBoardShowing) {
		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qtrue);
		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qtrue);
		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qtrue);
	}
}


static void CG_scrollScoresUp_f( void) {
	if (menuScoreboard && cg.scoreBoardShowing) {
		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qfalse);
		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qfalse);
		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qfalse);
	}
}


static void CG_spWin_f( void) {
	trap_Cvar_Set("cg_cameraOrbit", "2");
	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
	trap_Cvar_Set("cg_thirdPerson", "1");
	trap_Cvar_Set("cg_thirdPersonAngle", "0");
	trap_Cvar_Set("cg_thirdPersonRange", "100");
	CG_AddBufferedSound(cgs.media.winnerSound);
	//trap_S_StartLocalSound(cgs.media.winnerSound, CHAN_ANNOUNCER);
	CG_CenterPrint("YOU WIN!", SCREEN_HEIGHT * .30, 0);
}

static void CG_spLose_f( void) {
	trap_Cvar_Set("cg_cameraOrbit", "2");
	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
	trap_Cvar_Set("cg_thirdPerson", "1");
	trap_Cvar_Set("cg_thirdPersonAngle", "0");
	trap_Cvar_Set("cg_thirdPersonRange", "100");
	CG_AddBufferedSound(cgs.media.loserSound);
	//trap_S_StartLocalSound(cgs.media.loserSound, CHAN_ANNOUNCER);
	CG_CenterPrint("YOU LOSE...", SCREEN_HEIGHT * .30, 0);
}


static void CG_TellTarget_f( void ) {
	int		clientNum;
	char	command[128];
	char	message[128];

	clientNum = CG_CrosshairPlayer();
	if ( clientNum == -1 ) {
		return;
	}

	trap_Args( message, 128 );
	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
	trap_SendClientCommand( command );
}

static void CG_TellAttacker_f( void ) {
	int		clientNum;
	char	command[128];
	char	message[128];

	clientNum = CG_LastAttacker();
	if ( clientNum == -1 ) {
		return;
	}

	trap_Args( message, 128 );
	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
	trap_SendClientCommand( command );
}

static void CG_VoiceTellTarget_f( void ) {
	int		clientNum;
	char	command[128];
	char	message[128];

	clientNum = CG_CrosshairPlayer();
	if ( clientNum == -1 ) {
		return;
	}

	trap_Args( message, 128 );
	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
	trap_SendClientCommand( command );
}

static void CG_VoiceTellAttacker_f( void ) {
	int		clientNum;
	char	command[128];
	char	message[128];

	clientNum = CG_LastAttacker();
	if ( clientNum == -1 ) {
		return;
	}

	trap_Args( message, 128 );
	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
	trap_SendClientCommand( command );
}

static void CG_NextTeamMember_f( void ) {
  CG_SelectNextPlayer();
}

static void CG_PrevTeamMember_f( void ) {
  CG_SelectPrevPlayer();
}

// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
//
static void CG_NextOrder_f( void ) {
	clientInfo_t *ci = cgs.clientinfo + cg.snap->ps.clientNum;
	if (ci) {
		if (!ci->teamLeader && sortedTeamPlayers[cg_currentSelectedPlayer.integer] != cg.snap->ps.clientNum) {
			return;
		}
	}
	if (cgs.currentOrder < TEAMTASK_CAMP) {
		cgs.currentOrder++;

		if (cgs.currentOrder == TEAMTASK_RETRIEVE) {
			if (!CG_OtherTeamHasFlag()) {
				cgs.currentOrder++;
			}
		}

		if (cgs.currentOrder == TEAMTASK_ESCORT) {
			if (!CG_YourTeamHasFlag()) {
				cgs.currentOrder++;
			}
		}

	} else {
		cgs.currentOrder = TEAMTASK_OFFENSE;
	}
	cgs.orderPending = qtrue;
	cgs.orderTime = cg.time + 3000;
}


static void CG_ConfirmOrder_f (void ) {
	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_YES));
	trap_SendConsoleCommand("+button5; wait; -button5");
	if (cg.time < cgs.acceptOrderTime) {
		trap_SendClientCommand(va("teamtask %d\n", cgs.acceptTask));
		cgs.acceptOrderTime = 0;
	}
}

static void CG_DenyOrder_f (void ) {
	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_NO));
	trap_SendConsoleCommand("+button6; wait; -button6");
	if (cg.time < cgs.acceptOrderTime) {
		cgs.acceptOrderTime = 0;
	}
}

static void CG_TaskOffense_f (void ) {
	if (cgs.gametype == GT_CTF || cgs.gametype == GT_CTY) {
		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONGETFLAG));
	} else {
		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONOFFENSE));
	}
	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_OFFENSE));
}

static void CG_TaskDefense_f (void ) {
	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONDEFENSE));
	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_DEFENSE));
}

static void CG_TaskPatrol_f (void ) {
	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONPATROL));
	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_PATROL));
}

static void CG_TaskCamp_f (void ) {
	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONCAMPING));
	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_CAMP));
}

static void CG_TaskFollow_f (void ) {
	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOW));
	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_FOLLOW));
}

static void CG_TaskRetrieve_f (void ) {
	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONRETURNFLAG));
	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_RETRIEVE));
}

static void CG_TaskEscort_f (void ) {
	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOWCARRIER));
	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_ESCORT));
}

static void CG_TaskOwnFlag_f (void ) {
	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_IHAVEFLAG));
}

static void CG_TauntKillInsult_f (void ) {
	trap_SendConsoleCommand("cmd vsay kill_insult\n");
}

static void CG_TauntPraise_f (void ) {
	trap_SendConsoleCommand("cmd vsay praise\n");
}

static void CG_TauntTaunt_f (void ) {
	trap_SendConsoleCommand("cmd vtaunt\n");
}

static void CG_TauntDeathInsult_f (void ) {
	trap_SendConsoleCommand("cmd vsay death_insult\n");
}

static void CG_TauntGauntlet_f (void ) {
	trap_SendConsoleCommand("cmd vsay kill_guantlet\n");
}

static void CG_TaskSuicide_f (void ) {
	int		clientNum;
	char	command[128];

	clientNum = CG_CrosshairPlayer();
	if ( clientNum == -1 ) {
		return;
	}

	Com_sprintf( command, 128, "tell %i suicide", clientNum );
	trap_SendClientCommand( command );
}



/*
==================
CG_TeamMenu_f
==================
*/
/*
static void CG_TeamMenu_f( void ) {
  if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
    CG_EventHandling(CGAME_EVENT_NONE);
    trap_Key_SetCatcher(0);
  } else {
    CG_EventHandling(CGAME_EVENT_TEAMMENU);
    //trap_Key_SetCatcher(KEYCATCH_CGAME);
  }
}
*/

/*
==================
CG_EditHud_f
==================
*/
/*
static void CG_EditHud_f( void ) {
  //cls.keyCatchers ^= KEYCATCH_CGAME;
  //VM_Call (cgvm, CG_EVENT_HANDLING, (cls.keyCatchers & KEYCATCH_CGAME) ? CGAME_EVENT_EDITHUD : CGAME_EVENT_NONE);
}
*/


/*
==================
CG_StartOrbit_f
==================
*/

static void CG_StartOrbit_f( void ) {
	char var[MAX_TOKEN_CHARS];

	trap_Cvar_VariableStringBuffer( "developer", var, sizeof( var ) );
	if ( !atoi(var) ) {
		return;
	}
	if (cg_cameraOrbit.value != 0) {
		trap_Cvar_Set ("cg_cameraOrbit", "0");
		trap_Cvar_Set("cg_thirdPerson", "0");
	} else {
		trap_Cvar_Set("cg_cameraOrbit", "5");
		trap_Cvar_Set("cg_thirdPerson", "1");
		trap_Cvar_Set("cg_thirdPersonAngle", "0");
		trap_Cvar_Set("cg_thirdPersonRange", "100");
	}
}

/*
static void CG_Camera_f( void ) {
	char name[1024];
	trap_Argv( 1, name, sizeof(name));
	if (trap_loadCamera(name)) {
		cg.cameraMode = qtrue;
		trap_startCamera(cg.time);
	} else {
		CG_Printf ("Unable to load camera %s\n",name);
	}
}
*/

static void CG_clientserverstatus_f(void)
{
	int clientNum;
	const char *configstring;
	for(clientNum=0;clientNum<cgs.maxclients;clientNum++)
	{
    	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
	    CG_Printf("%d: %s\n",clientNum,Info_ValueForKey(configstring, "n"));
    }
}

int gotime=0;

static void CG_demopos_f(void)
{
	char min[20],*sec;
	int i;
	if(!cg.demoPlayback)return;
	trap_Argv( 1, min, 20 );
	for( i=0; min[i]!=':'&& min[i]!=0; i++ );
	if(min[i]==0)
		sec = 0;
	else
	{
		min[i] = 0;
		sec = min+i+1;
	}
	gotime = ( atoi( min ) * 60 + atoi( sec ) ) * 1000;
	trap_Cvar_Set("timescale",va("%d",gotime - (cg.time - cgs.levelStartTime)));
}

typedef struct {
	vec3_t		origin;
	vec3_t		angle;
	int			time;
	qboolean	thirdPerson;
	vec4_t		csi_coeff[6];   //cubic spline interpolation coefficients
} demoCam_t;

demoCam_t cam[50];
int curCam = 0;

// start cubic spline interpolation code (parts are converted from javascript at http://people.hofstra.edu/faculty/Stefan_Waner/realworld/tutorialsf1/scriptpivot2.html)

double theMatrix[50*4][50*4+1];
int numRows = 0, numCols = 0;

static void pivot( int rows, int cols, int theRow, int theCol ) {
	double thePivot = theMatrix[theRow][theCol];
	int i, j;
	for( i=0; i<cols; i++ )
		theMatrix[theRow][i] = theMatrix[theRow][i]/thePivot;
	for( i=0; i<rows; i++ )
		if( ( i!=theRow ) && ( theMatrix[i][theCol]!=0 ) )
		{
			double factr = theMatrix[i][theCol];
			for( j=0; j<cols; j++ )
				theMatrix[i][j] = theMatrix[i][j] - factr*theMatrix[theRow][j];	
		}
}

static void swapRows( int p, int q ) {
	double rowHold = 0;
	int j;
	for( j=0; j<numCols; j++ )
	{
		rowHold = theMatrix[p][j];
		theMatrix[p][j] = theMatrix[q][j];
		theMatrix[q][j] = rowHold;
	}
}

static void rowReduce() {
	int i, j, theCol;
	int theRow = 0;
	double theSmallestNumber = 0.00000000001;
	for(  i=0; i<numRows; i++ )
	{ 
		theCol = -1;
		for( j=0; j<numCols; j++ )
		{
			double theNum = theMatrix[i][j];
			if( theNum * ( theNum>0?1:-1 ) <= theSmallestNumber )theMatrix[i][j] = 0;
			else { theCol = j; break; }
		}
		if( theCol!=-1 )pivot(numRows,numCols,i,theCol);
	}
	for( j=0; j<numCols; j++ )
		for( i=theRow; i<numRows; i++ )
			if( theMatrix[i][j] != 0 )
			{
				if( i==theRow ) { theRow++; break; }
				else { swapRows( theRow, i ); theRow++; break; }
			}
}

#define TIMEDIV 1000
// recalculate cubic spline interpolation coefficients for cam paths
static void reCalc() {
	int i, j, k, curRow;
	double deltaT;
	for( k=0; k<3; k++ )
	{
		curRow = 0;
		memset( theMatrix[0], 0, sizeof( theMatrix ) );
		for( i=0; i<curCam-1; i++ )
		{
			double deltaT = (double)(cam[i+1].time - cam[i].time);
			double deltaD = (double)(cam[i+1].origin[k] - cam[i].origin[k]);
			j=0;
			//runs through first point
			//guess what? ive decided it's (0,0) kthx.
			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = 1;
			theMatrix[curRow++][(curCam-1)*4+4] = 0;//cam[i].origin[k];
			
			j=0;
			//runs through second point
			//doodz we're makin dese thangs unit doodz so it b leeter :>
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = 1;
			theMatrix[curRow++][(curCam-1)*4+4] = deltaD;
			
			j=0;
			//first derivitives are equal
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*3;
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*2;
			theMatrix[curRow][i*4+j++] = 1;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*3;
			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*2;
			theMatrix[curRow][i*4+j++] = -1;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow++][(curCam-1)*4+4] = 0;
			
			j=0;
			//second derivitives are equal
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*6;
			theMatrix[curRow][i*4+j++] = 2;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*6;
			theMatrix[curRow][i*4+j++] = -2;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow++][(curCam-1)*4+4] = 0;
		}
		//4 more equations are needed to have a solvable matrix (there should be n-1 splines)
		
		j=0;
		//second derivitive at the end is zero
		theMatrix[curRow][(curCam-1)*4+j++] = (((double)cam[curCam].time-cam[curCam-1].time)/TIMEDIV)*6;
		theMatrix[curRow][(curCam-1)*4+j++] = 2;
		theMatrix[curRow][(curCam-1)*4+j++] = 0;
		theMatrix[curRow][(curCam-1)*4+j++] = 0;
		theMatrix[curRow++][(curCam-1)*4+4] = 0;
		
		j=0;
		//second derivitive at the beginning is zero
		theMatrix[curRow][j++] = 0;//(((double)cam[0].time)/TIMEDIV)*6;
		theMatrix[curRow][j++] = 2;
		theMatrix[curRow][j++] = 0;
		theMatrix[curRow][j++] = 0;
		theMatrix[curRow++][(curCam-1)*4+4] = 0;
		
		j=0;
		//runs through first point
		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = 1;
		theMatrix[curRow++][(curCam-1)*4+4] = 0;//cam[(curCam-1)].origin[k];
		
		deltaT = (double)(cam[curCam].time - cam[curCam-1].time);
		j=0;
		//runs through second point
		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = 1;
		theMatrix[curRow++][(curCam-1)*4+4] = cam[curCam].origin[k] - cam[curCam-1].origin[k];
		
		numRows = curRow;
		numCols = curCam*4+1;
		rowReduce();
		
		for( i=0; i<curCam; i++ )
		{
			cam[i].csi_coeff[k][0] = theMatrix[i*4][curCam*4];
			cam[i].csi_coeff[k][1] = theMatrix[i*4+1][curCam*4];
			cam[i].csi_coeff[k][2] = theMatrix[i*4+2][curCam*4];
			cam[i].csi_coeff[k][3] = theMatrix[i*4+3][curCam*4];
		}
	}
	
	//yeah, i know, bad coding to copy/paste the whole loop, but we need to do it over again for angles and i
	//really dont want to go to using pointers and shit, would take a lot of recoding whereas this
	//already works..... (aka, i lazy :oops)
	
	for( k=0; k<3; k++ )
	{
		curRow = 0;
		memset( theMatrix[0], 0, sizeof( theMatrix ) );
		for( i=0; i<curCam-1; i++ )
		{
			double deltaT = (double)(cam[i+1].time - cam[i].time);
			double deltaD = (double)(cam[i+1].angle[k] - cam[i].angle[k]);
			j=0;
			//runs through first point
			//guess what? ive decided it's (0,0) kthx.
			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV)*(((double)cam[i].time)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = 0;//(((double)cam[i].time)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = 1;
			theMatrix[curRow++][(curCam-1)*4+4] = 0;//cam[i].origin[k];
			
			j=0;
			//runs through second point
			//doodz we're makin dese thangs unit doodz so it b leeter :>
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV);
			theMatrix[curRow][i*4+j++] = 1;
			theMatrix[curRow++][(curCam-1)*4+4] = deltaD;
			
			j=0;
			//first derivitives are equal
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*3;
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*2;
			theMatrix[curRow][i*4+j++] = 1;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*3;
			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*2;
			theMatrix[curRow][i*4+j++] = -1;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow++][(curCam-1)*4+4] = 0;
			
			j=0;
			//second derivitives are equal
			theMatrix[curRow][i*4+j++] = (((double)deltaT)/TIMEDIV)*6;
			theMatrix[curRow][i*4+j++] = 2;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow][i*4+j++] = 0;//-(((double)deltaT)/TIMEDIV)*6;
			theMatrix[curRow][i*4+j++] = -2;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow][i*4+j++] = 0;
			theMatrix[curRow++][(curCam-1)*4+4] = 0;
		}
		//4 more equations are needed to have a solvable matrix (there should be n-1 splines)
		
		j=0;
		//second derivitive at the end is zero
		theMatrix[curRow][(curCam-1)*4+j++] = (((double)cam[curCam].time-cam[curCam-1].time)/TIMEDIV)*6;
		theMatrix[curRow][(curCam-1)*4+j++] = 2;
		theMatrix[curRow][(curCam-1)*4+j++] = 0;
		theMatrix[curRow][(curCam-1)*4+j++] = 0;
		theMatrix[curRow++][(curCam-1)*4+4] = 0;
		
		j=0;
		//second derivitive at the beginning is zero
		theMatrix[curRow][j++] = 0;//(((double)cam[0].time)/TIMEDIV)*6;
		theMatrix[curRow][j++] = 2;
		theMatrix[curRow][j++] = 0;
		theMatrix[curRow][j++] = 0;
		theMatrix[curRow++][(curCam-1)*4+4] = 0;
		
		j=0;
		//runs through first point
		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV)*(((double)cam[curCam-1].time)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = 0;//(((double)cam[curCam-1].time)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = 1;
		theMatrix[curRow++][(curCam-1)*4+4] = 0;//cam[(curCam-1)].origin[k];
		
		deltaT = (double)(cam[curCam].time - cam[curCam-1].time);
		j=0;
		//runs through second point
		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV)*(((double)deltaT)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = (((double)deltaT)/TIMEDIV);
		theMatrix[curRow][(curCam-1)*4+j++] = 1;
		theMatrix[curRow++][(curCam-1)*4+4] = cam[curCam].angle[k] - cam[curCam-1].angle[k];
		
		numRows = curRow;
		numCols = curCam*4+1;
		rowReduce();
		
		for( i=0; i<curCam; i++ )
		{
			cam[i].csi_coeff[k+3][0] = theMatrix[i*4][curCam*4];
			cam[i].csi_coeff[k+3][1] = theMatrix[i*4+1][curCam*4];
			cam[i].csi_coeff[k+3][2] = theMatrix[i*4+2][curCam*4];
			cam[i].csi_coeff[k+3][3] = theMatrix[i*4+3][curCam*4];
		}
	}
}

// end cubic spline interpolation code

static void CG_smoothcam_f(void)
{
	char x[20],y[20],z[20],time[20],*sec;
	int i=0;
	//if(!cg.demoPlayback)return;
	
	//origins
	trap_Argv( ++i, x, 20 );
	if(Q_stricmp(x,"TP")==0) {
		cam[curCam].thirdPerson = qtrue;
		++i;
	}
	trap_Argv( ++i, y, 20 );
	trap_Argv( ++i, z, 20 );
	VectorSet( cam[curCam].origin, atof(x), atof(y), atof(z) );
	
	//angles
	trap_Argv( ++i, x, 20 );
	trap_Argv( ++i, y, 20 );
	trap_Argv( ++i, z, 20 );
	VectorSet( cam[curCam].angle, atof(x), atof(y), atof(z) );
	
	trap_Argv( ++i, time, 20 );
	for( i=0; time[i]!=':' && time[i]; i++ );
	if(time[i]==0)
		sec = 0;
	else
	{
		time[i] = 0;
		sec = time+i+1;
	}
	cam[curCam].time = ( atoi( time ) * 60000 + atof( sec ) * 1000 );
	
	reCalc();
	
	CG_Printf("Added Cam Location %d.\n",curCam);
	curCam++;
}

static void CG_insertcam_f(void)
{
	char x[20],y[20],z[20],time[20],*sec;
	int i=0, insertCam, j;
	//if(!cg.demoPlayback)return;
	
	trap_Argv( ++i, x, 20 );
	insertCam = atoi( x );
	//push cams >= down one
	for ( j=curCam-1; j>=insertCam; j-- )
	{
		cam[ j+1 ] = cam[ j ];
	}
	//origins
	trap_Argv( ++i, x, 20 );
	if(Q_stricmp(x,"TP")==0) {
		cam[insertCam].thirdPerson = qtrue;
		++i;
	}
	trap_Argv( ++i, y, 20 );
	trap_Argv( ++i, z, 20 );
	VectorSet( cam[insertCam].origin, atof(x), atof(y), atof(z) );
	
	//angles
	trap_Argv( ++i, x, 20 );
	trap_Argv( ++i, y, 20 );
	trap_Argv( ++i, z, 20 );
	VectorSet( cam[insertCam].angle, atof(x), atof(y), atof(z) );
	
	trap_Argv( ++i, time, 20 );
	for( i=0; time[i]!=':' && time[i]; i++ );
	if(time[i]==0)
		sec = 0;
	else
	{
		time[i] = 0;
		sec = time+i+1;
	}
	cam[insertCam].time = ( atoi( time ) * 60000 + atof( sec ) * 1000 );
	
	reCalc();
	
	CG_Printf("Inserted Cam Location %d.\n",insertCam);
	curCam++;
}

static void CG_removecam_f(void)
{
	char x[20];
	int i=0, removeCam, j;
	//if(!cg.demoPlayback)return;
	
	if( trap_Argc() != 2 )
	{
		CG_Printf( "Usage: removecam <cam num>\n" );
		return;
	}
	
	trap_Argv( ++i, x, 20 );
	removeCam = atoi( x );
	//push cams >= up one
	for ( j=removeCam; j<curCam; j++ )
	{
		cam[ j ] = cam[ j+1 ];
	}
	
	reCalc();
	
	CG_Printf("Removed Cam Location %d.\n",removeCam);
	curCam--;
}

static void CG_removeallcams_f(void)
{
	int i;
	//if(!cg.demoPlayback)return;
	
	for ( i=0; i<curCam; i++ )
	{
		memset( &cam[ i ], 0, sizeof( cam[ i ] ) );
	}
	
	CG_Printf("Removed %d Cams.\n",curCam);
	curCam = 0;
}

static void CG_savecamcfg_f(void)
{
	char filename[MAX_QPATH];
	char cmdstring[MAX_STRING_CHARS];
	int i;
	fileHandle_t f;
	
	if (trap_Argc()!=2)
	{
		CG_Printf("Syntax: savecamcfg <filename>\n");
		return;
	}
	
	trap_Argv( 1, filename, sizeof( filename ) );
	
	trap_FS_FOpenFile( filename, &f, FS_APPEND_SYNC );
	if( !f )
	{
		CG_Printf( "Failed to open '%s' for writing.\n", filename );
		return;
	}
	
	CG_Printf( "Dumping Cam " );
	
	for( i=0; i<curCam; i++ )
	{
		char mytmpstr[MAX_STRING_CHARS];
		Q_strncpyz( mytmpstr, va( "%.3f", (float)cam[i].time / 1000 - cam[i].time / 60000 * 60 ), sizeof( mytmpstr ) );
		if( strlen( mytmpstr ) < 6 ) Com_sprintf( mytmpstr, sizeof( mytmpstr ), "0%s", mytmpstr );
		CG_Printf("%d ",i);
		if( !cam[i].thirdPerson )
			Com_sprintf( cmdstring, sizeof( cmdstring ), "smoothcam %f %f %f %f %f %f %d:%s\n",
						 cam[i].origin[0], cam[i].origin[1], cam[i].origin[2],
						 cam[i].angle[0], cam[i].angle[1], cam[i].angle[2],
						 cam[i].time / 60000, mytmpstr );
		else
			Com_sprintf( cmdstring, sizeof( cmdstring ), "smoothcam TP 0 %f %f %f %f %f %d:%s\n",
						 cam[i].origin[1], cam[i].origin[2], cam[i].angle[0],
						 cam[i].angle[1], cam[i].angle[2], cam[i].time / 60000,
						 mytmpstr );
		trap_FS_Write( cmdstring, strlen( cmdstring ), f );
	}
	trap_FS_FCloseFile( f );
	CG_Printf( "\nCam Data Dumped to %s.\n", filename );
}

int showCam = -1;

static void CG_showcam_f(void)
{
	int i;
	
	if ( trap_Argc() > 1 )
	{
		char tmps[20];
		char mytmpstr[MAX_STRING_CHARS];
		trap_Argv( 1, tmps, sizeof( tmps ) );
		showCam = i = atoi( tmps );
		Q_strncpyz( mytmpstr, va( "%.3f", (float)cam[i].time / 1000 - cam[i].time / 60000 * 60 ), sizeof( mytmpstr ) );
		if( strlen( mytmpstr ) < 6 ) Com_sprintf( mytmpstr, sizeof( mytmpstr ), "0%s", mytmpstr );
		if( !cam[i].thirdPerson )
			CG_Printf( "%d: %f %f %f %f %f %f %d:%s\n", i,
						 cam[i].origin[0], cam[i].origin[1], cam[i].origin[2],
						 cam[i].angle[0], cam[i].angle[1], cam[i].angle[2],
						 cam[i].time / 60000, mytmpstr );
		else
			CG_Printf( "%d: TP 0 %f %f %f %f %f %d:%s\n", i,
						 cam[i].origin[1], cam[i].origin[2], cam[i].angle[0],
						 cam[i].angle[1], cam[i].angle[2], cam[i].time / 60000,
						 mytmpstr );
		return;
	}
	
	
	for( i=0; i<curCam; i++ )
	{
		char mytmpstr[MAX_STRING_CHARS];
		Q_strncpyz( mytmpstr, va( "%.3f", (float)cam[i].time / 1000 - cam[i].time / 60000 * 60 ), sizeof( mytmpstr ) );
		if( strlen( mytmpstr ) < 6 ) Com_sprintf( mytmpstr, sizeof( mytmpstr ), "0%s", mytmpstr );
		if( !cam[i].thirdPerson )
			CG_Printf( "%d: %f %f %f %f %f %f %d:%s\n", i,
						 cam[i].origin[0], cam[i].origin[1], cam[i].origin[2],
						 cam[i].angle[0], cam[i].angle[1], cam[i].angle[2],
						 cam[i].time / 60000, mytmpstr );
		else
			CG_Printf( "%d: TP 0 %f %f %f %f %f %d:%s\n", i,
						 cam[i].origin[1], cam[i].origin[2], cam[i].angle[0],
						 cam[i].angle[1], cam[i].angle[2], cam[i].time / 60000,
						 mytmpstr );
	}
}

void CG_DumpLoc_f( void )
{
	char locfilename[MAX_QPATH];
	char locationfile[MAX_STRING_CHARS];
	char location[MAX_STRING_CHARS];
	char time[20];
	char *extptr;//, *buffptr;
	fileHandle_t f;

	// Check for argument
	if (trap_Argc() < 3)
	{
		CG_Printf("Syntax: dumploc <start:time[.msec]> <filename> (<TP>)\n");
		return;
	}

	// parse the message
	trap_Argv( 2, location, sizeof(location) );
	trap_Argv( 1, time, 20 );

	// Open locationfile
	Q_strncpyz( locfilename, location, sizeof(locfilename) );
	Q_strncpyz( locationfile, location, sizeof(locationfile) );
	extptr = locfilename + strlen( locfilename ) - 4;
	trap_FS_FOpenFile( locfilename, &f, FS_APPEND_SYNC );
	if( !f )
	{
		CG_Printf( "Failed to open '%s' for writing.\n", locfilename );
		return;
	}

	// Build the entity definition
	if( trap_Argc() == 3)
		Com_sprintf( locationfile, sizeof(locationfile), "smoothcam %f %f %f %f %f %f %s\n",
					 cg.snap->ps.origin[0], cg.snap->ps.origin[1], cg.snap->ps.origin[2],
					 cg.snap->ps.viewangles[0], cg.snap->ps.viewangles[1], cg.snap->ps.viewangles[2],
					 time );
	else
		Com_sprintf( locationfile, sizeof(locationfile), "smoothcam TP 0 %f %f %f %f %f %s\n",
					 cg_thirdPersonHorzOffset.value, cg_thirdPersonVertOffset.value, cg_thirdPersonPitchOffset.value,
					 cg_thirdPersonAngle.value, cg_thirdPersonRange.value, time );

	// And write out/acknowledge
	trap_FS_Write( locationfile, strlen( locationfile ), f );
	trap_FS_FCloseFile( f );
	CG_Printf( "Cam Data Dumped to %s.\n", locfilename );
}

static void CG_AddLoc_f( void )
{
	char cmd[MAX_STRING_CHARS];
	char time[20];

	// Check for argument
	if (trap_Argc() < 2)
	{
		CG_Printf("Syntax: addloc <start:time[.msec]> (<TP>)\n");
		return;
	}

	// parse the message
	trap_Argv( 1, time, 20 );

	// Build the entity definition
	if( trap_Argc() == 2)
		Com_sprintf( cmd, sizeof(cmd), "smoothcam %f %f %f %f %f %f %s\n",
					 cg.snap->ps.origin[0], cg.snap->ps.origin[1], cg.snap->ps.origin[2],
					 cg.snap->ps.viewangles[0], cg.snap->ps.viewangles[1], cg.snap->ps.viewangles[2],
					 time );
	else
		Com_sprintf( cmd, sizeof(cmd), "smoothcam TP 0 %f %f %f %f %f %s\n",
					 cg_thirdPersonHorzOffset.value, cg_thirdPersonVertOffset.value, cg_thirdPersonPitchOffset.value,
					 cg_thirdPersonAngle.value, cg_thirdPersonRange.value, time );
	trap_SendConsoleCommand( cmd );
}

static void CG_InsLoc_f( void )
{
	char cmd[MAX_STRING_CHARS];
	char time[20];
	char camNum[20];

	// Check for argument
	if (trap_Argc() < 3)
	{
		CG_Printf("Syntax: insloc <cam num> <start:time[.msec]> (<TP>)\n");
		return;
	}

	// parse the message
	trap_Argv( 1, camNum, 20 );
	trap_Argv( 2, time, 20 );

	// Build the entity definition
	if( trap_Argc() == 3)
		Com_sprintf( cmd, sizeof(cmd), "insertcam %d %f %f %f %f %f %f %s\n", atoi( camNum ),
					 cg.snap->ps.origin[0], cg.snap->ps.origin[1], cg.snap->ps.origin[2],
					 cg.snap->ps.viewangles[0], cg.snap->ps.viewangles[1], cg.snap->ps.viewangles[2],
					 time );
	else
		Com_sprintf( cmd, sizeof(cmd), "insertcam %d TP 0 %f %f %f %f %f %s\n", atoi( camNum ),
					 cg_thirdPersonHorzOffset.value, cg_thirdPersonVertOffset.value, cg_thirdPersonPitchOffset.value,
					 cg_thirdPersonAngle.value, cg_thirdPersonRange.value, time );
	trap_SendConsoleCommand( cmd );
}

static void CG_ReplLoc_f( void )
{
	char cmd[MAX_STRING_CHARS];
	char time[20];
	char camNum[20];

	// Check for argument
	if (trap_Argc() < 3)
	{
		CG_Printf("Syntax: replloc <cam num> <start:time[.msec]> (<TP>)\n");
		return;
	}

	// parse the message
	trap_Argv( 1, camNum, 20 );
	trap_Argv( 2, time, 20 );

	// Build the entity definition
	if( trap_Argc() == 3)
		Com_sprintf( cmd, sizeof(cmd), "removecam %d;insertcam %d %f %f %f %f %f %f %s\n", atoi( camNum ), atoi( camNum ),
					 cg.snap->ps.origin[0], cg.snap->ps.origin[1], cg.snap->ps.origin[2],
					 cg.snap->ps.viewangles[0], cg.snap->ps.viewangles[1], cg.snap->ps.viewangles[2],
					 time );
	else
		Com_sprintf( cmd, sizeof(cmd), "removecam %d;insertcam %d TP 0 %f %f %f %f %f %s\n", atoi( camNum ), atoi( camNum ),
					 cg_thirdPersonHorzOffset.value, cg_thirdPersonVertOffset.value, cg_thirdPersonPitchOffset.value,
					 cg_thirdPersonAngle.value, cg_thirdPersonRange.value, time );
	trap_SendConsoleCommand( cmd );
}

static void CG_demospec_f()
{
	if(trap_Argc() == 1)
		CG_Printf("\"pug_demospec\" is:\"%d\" default:\"-1\"\n",pug_demospec.integer);
	else
	{
		char newv[MAX_STRING_CHARS];
		trap_Argv( 1, newv, sizeof( newv ) );
		pug_demospec.integer = atoi( newv );
	}
}

static void CG_Rename_f()
{
	char newName[MAX_STRING_CHARS];
	int clNum;
	if( trap_Argc() < 3 ) return;
	trap_Argv( 1, newName, sizeof( newName ) );
	clNum = atoi( newName );
	trap_Argv( 2, newName, sizeof( newName ) );
	Q_strncpyz( cgs.clientinfo[clNum].name, newName, sizeof( cgs.clientinfo[clNum].name ) );
	cgs.clientinfo[clNum].name[ strlen( cgs.clientinfo[clNum].name ) + 1 ] = -1;
}

/*void _mkdir(char *);
#ifndef PATH_SEP
#define PATH_SEP '\\'
#endif*/
/*
============
FS_CreatePath

Creates any directories needed to store the given filename
============
*/
/*static qboolean FS_CreatePath (char *OSPath) {
	char	*ofs;
	
	// make absolutely sure that it can't back up the path
	// FIXME: is c: allowed???
	if ( strstr( OSPath, ".." ) || strstr( OSPath, "::" ) ) {
		Com_Printf( "WARNING: refusing to create relative path \"%s\"\n", OSPath );
		return qtrue;
	}

	for (ofs = OSPath+1 ; *ofs ; ofs++) {
		if (*ofs == PATH_SEP) {
			// create the directory
			*ofs = 0;
			_mkdir (OSPath);
			*ofs = PATH_SEP;
		}
	}
	return qfalse;
}*/

fileHandle_t ghostFile = -1;
qboolean ghostMode = qfalse;

static void CG_GhostSave_f()
{
	char file[MAX_STRING_CHARS];
	char prot[MAX_STRING_CHARS];
	if(trap_Argc() < 2) {
		CG_Printf("Filename required\n");
		return;
	}
	if(ghostFile!=-1) {
		CG_Printf("Error: Ghost already in use\n");
		return;
	}
	trap_Argv( 1, file, sizeof(file) );
	trap_Cvar_VariableStringBuffer( "protocol", prot, sizeof( prot ) );
	//FS_CreatePath( "ghosts" );
	trap_FS_FOpenFile( va( "ghosts/%s.BOO_%s", file, prot ), &ghostFile, FS_WRITE );
	ghostMode = qfalse;
}

static void CG_GhostLoad_f()
{
	char file[MAX_STRING_CHARS];
	char prot[MAX_STRING_CHARS];
	if(trap_Argc() < 2) {
		CG_Printf("Filename required\n");
		return;
	}
	if(ghostFile!=-1) {
		CG_Printf("Error: Ghost already in use\n");
		return;
	}
	trap_Argv( 1, file, sizeof(file) );
	trap_Cvar_VariableStringBuffer( "protocol", prot, sizeof( prot ) );
	trap_FS_FOpenFile( va( "ghosts/%s.BOO_%s", file, prot ), &ghostFile, FS_READ );
	if( ghostFile == 0 ) {
		ghostFile = -1;
		CG_Printf("Error: File not found\n" );
		return;
	}
	ghostMode = qtrue;
}

static void  CG_GhostClose_f()
{
	if(ghostFile==-1) {
		CG_Printf("Error: Ghost already closed\n");
		return;
	}
	trap_FS_FCloseFile( ghostFile );
	ghostFile = -1;
}

static int Q_isdigit( char *c )
{
	int i;
	for( i=0; c[i]!=0; i++ )
		if (!((c[i] >= '0' && c[i] <= '9') || c[i] == '.'))
			return ( 0 );
	return ( 1 );
}

extern int trap_RealTime(qtime_t *qtime);

/***********************************

$viewposX - player view's X world position (same value as posX)
$viewposY - player view's Y world position (same value as posY)
$viewposZ - player view's Z world position (posZ + viewheight)
$viewposXYZ - player view's X Y Z world position

$posX - player's X world position
$posY - player's Y world position
$posZ - player's Z world position
$posXYZ - player's X Y Z world position

$angX - player's X viewangle
$angY - player's Y viewangle
$angZ - player's Z viewangle
$angXYZ - player's X Y Z viewangle

$velX - player's X velocity
$velY - player's Y velocity
$velZ - player's Z velocity
$velXYZ - player's X Y Z velocity

$speedXY - player's horizontal speed
$speedZ  - player's vertical speed

$mapname    - current map name
$date       - current date in YYYYMMDD format
$time       - current time in HHMMSSS format
$playername - player's name (colors removed)
$cgtime     - clientside timer

************************************/
static void CG_VarMath_f()
{
	int i;
	char varName[MAX_STRING_CHARS];
	char tmpBuf[MAX_STRING_CHARS],op;
	double curVal = 0;
	char curValS[MAX_STRING_CHARS];
	qboolean isString = qfalse;
	vec3_t velocity;
	
	if(trap_Argc() < 2) {
		CG_Printf("\n^1varMath: ^2Performs math functions on cvars and vstrs.\n");
		CG_Printf("^7Usage:   varMath targetVariableName operator: +-*/%= value (+-*/%= value)\n");
		CG_Printf("^2Example: ^7varMath timescale * .2\n");
		CG_Printf("^2Example: ^7varMath user_num = 1 + 3 * 5\n");
		CG_Printf("^2Example: ^7varMath user_demoname = $mapname + _ + $date + _ + 001\n\n");
		CG_Printf("^3Note:    for immediate variable update, prefix the targetVariableName with \"user_\"\n");
		return;
	}

	if(trap_Argc() < 3) {
		CG_Printf( "^7*** Error - missing operator\n" );
		return;
	}

	if(trap_Argc() < 4) {
		CG_Printf( "^7*** Error - missing value\n" );
		return;
	}
	VectorCopy( (pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].currentState.pos.trDelta:cg_entities[cg.snap->ps.clientNum].currentState.pos.trDelta), velocity );
	trap_Argv( 1, varName, sizeof( varName ) );
	trap_Cvar_VariableStringBuffer( varName, curValS, sizeof( curValS ) );
	curVal = atof( curValS );
	for( i=2; i<trap_Argc(); i+=2 )
	{
		trap_Argv( i, tmpBuf, sizeof( tmpBuf ) );
		op = tmpBuf[0];
		trap_Argv( i+1, tmpBuf, sizeof( tmpBuf ) );
		if( tmpBuf[0] == '$' )
		{
			if( !strcmp( tmpBuf+1, "viewposX" ) || !strcmp( tmpBuf+1, "posX" ) )
				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[0]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[0] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "viewposY" ) || !strcmp( tmpBuf+1, "posY" ) )
				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[1]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[1] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "viewposZ" ) )
				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[2]+DEFAULT_VIEWHEIGHT:cg_entities[cg.snap->ps.clientNum].lerpOrigin[2]+cg.snap->ps.viewheight ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "viewposXYZ" ) )
				Q_strncpyz( tmpBuf, va( "%f %f %f",
					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[0]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[0],
					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[1]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[1],
					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[2]+DEFAULT_VIEWHEIGHT:cg_entities[cg.snap->ps.clientNum].lerpOrigin[2]+cg.snap->ps.viewheight ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "posZ" ) )
				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[2]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[2] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "posXYZ" ) )
				Q_strncpyz( tmpBuf, va( "%f %f %f",
					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[0]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[0],
					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[1]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[1],
					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpOrigin[2]:cg_entities[cg.snap->ps.clientNum].lerpOrigin[2] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "angX" ) )
				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[0]:cg_entities[cg.snap->ps.clientNum].lerpAngles[0] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "angY" ) )
				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[1]:cg_entities[cg.snap->ps.clientNum].lerpAngles[1] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "angZ" ) )
				Q_strncpyz( tmpBuf, va( "%f", pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[2]:cg_entities[cg.snap->ps.clientNum].lerpAngles[2] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "angXYZ" ) )
				Q_strncpyz( tmpBuf, va( "%f %f %f",
					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[0]:cg_entities[cg.snap->ps.clientNum].lerpAngles[0],
					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[1]:cg_entities[cg.snap->ps.clientNum].lerpAngles[1],
					pug_demospec.integer!=-1?cg_entities[pug_demospec.integer].lerpAngles[2]:cg_entities[cg.snap->ps.clientNum].lerpAngles[2] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "velX" ) )
				Q_strncpyz( tmpBuf, va( "%f", velocity[0] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "velY" ) )
				Q_strncpyz( tmpBuf, va( "%f", velocity[1] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "velZ" ) || !strcmp( tmpBuf+1, "speedZ" ) )
				Q_strncpyz( tmpBuf, va( "%f", velocity[2] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "velXYZ" ) )
				Q_strncpyz( tmpBuf, va( "%f %f %f",
					velocity[0],
					velocity[1],
					velocity[2] ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "speedXY" ) )
				Q_strncpyz( tmpBuf, va( "%f", 
					sqrt(velocity[0] * velocity[0]+velocity[1] * velocity[1]) ), sizeof( tmpBuf ) );
			else if( !strcmp( tmpBuf+1, "mapname" ) )
			{
				const char *pszServerInfo = CG_ConfigString(CS_SERVERINFO);
				Q_strncpyz( tmpBuf, COM_SkipPath(Info_ValueForKey(pszServerInfo, "mapname")), sizeof( tmpBuf ) );
				isString = qtrue;
			}
			else if( !strcmp( tmpBuf+1, "date" ) )
			{
				qtime_t ct;
				trap_RealTime(&ct);
				Q_strncpyz( tmpBuf, va( "%04d%02d%02d", ct.tm_year + 1900, ct.tm_mon+1,ct.tm_mday ), sizeof( tmpBuf ) );
				isString = qtrue;
			}
			else if( !strcmp( tmpBuf+1, "time" ) )
			{
				qtime_t ct;
				trap_RealTime(&ct);
				Q_strncpyz( tmpBuf, va( "%02d%02d%02d", ct.tm_hour, ct.tm_min, ct.tm_sec ), sizeof( tmpBuf ) );
				isString = qtrue;
			}
			else if( !strcmp( tmpBuf+1, "playername" ) )
			{
				Q_strncpyz( tmpBuf, cgs.clientinfo[ pug_demospec.integer!=-1?pug_demospec.integer:cg.snap->ps.clientNum ].name, sizeof( tmpBuf ) );
				isString = qtrue;
			}
			else if( !strcmp( tmpBuf+1, "cgtime" ) )
			{
				Q_strncpyz( tmpBuf, va( "%d" , cg.time ), sizeof( tmpBuf ) );
				isString = qtrue;
			}
			else
				trap_Cvar_VariableStringBuffer( tmpBuf+1, tmpBuf, sizeof( tmpBuf ) );
			if( tmpBuf[0] == 0 )tmpBuf[0]='$';
		}
		switch( op ) {
		case '+':
		{
			if( Q_isdigit( tmpBuf ) && !isString )
				curVal += atof( tmpBuf );
			else {
				Q_strcat( curValS, sizeof( curValS ), tmpBuf );
				isString = qtrue;
			}
			break;
		}
		case '-':
		{
			curVal -= atof( tmpBuf );
			break;
		}
		case '*':
		{
			curVal *= atof( tmpBuf );
			break;
		}
		case '/':
		{
			curVal /= atof( tmpBuf );
			break;
		}
		case '=':
		{
			if( Q_isdigit( tmpBuf ) && !isString )
				curVal = atof( tmpBuf );
			else {
				Q_strncpyz( curValS, tmpBuf, sizeof( curValS ) );
				isString = qtrue;
			}
			break;
		}
		case '%':
		{
			int tmpcurVal;
			tmpcurVal = (int)curVal;
			tmpcurVal %= atoi( tmpBuf );
			curVal = (double)tmpcurVal;
			break;
		}
		default:
		{
			CG_Printf("*** Parse error: invalid operator (%c)\n",op);
			return;
		}
		}
	}
	if( !Q_strncmp( varName, "user_", strlen( "user_" ) ) )
		if( isString ) {
			trap_Cvar_Set( varName, curValS );
			CG_Printf( "^7%s ^4-->^7 %s\n", varName, curValS );
		} else if( curVal - (int)curVal ) {
			trap_Cvar_Set( varName, va( "%f", curVal ) );
			CG_Printf( "^7%s ^4-->^7 %f\n", varName, curVal );
		} else {
			trap_Cvar_Set( varName, va( "%d", (int)curVal ) );
			CG_Printf( "^7%s ^4-->^7 %d\n", varName, (int)curVal );
		}
	else
		if( isString ) {
			trap_SendConsoleCommand( va( "set %s %s", varName, curValS ) );
			CG_Printf( "^7%s ^4-->^7 %s\n", varName, curValS );
		} else if( curVal - (int)curVal ) {
			trap_SendConsoleCommand( va( "set %s %f", varName, curVal ) );
			CG_Printf( "^7%s ^4-->^7 %f\n", varName, curVal );
		} else {
			trap_SendConsoleCommand( va( "set %s %d", varName, (int)curVal ) );
			CG_Printf( "^7%s ^4-->^7 %d\n", varName, (int)curVal );
		}
}


typedef struct {
	char	*cmd;
	void	(*function)(void);
} consoleCommand_t;

static consoleCommand_t	commands[] = {
	{ "testgun", CG_TestGun_f },
	{ "testmodel", CG_TestModel_f },
	{ "nextframe", CG_TestModelNextFrame_f },
	{ "prevframe", CG_TestModelPrevFrame_f },
	{ "nextskin", CG_TestModelNextSkin_f },
	{ "prevskin", CG_TestModelPrevSkin_f },
	{ "viewpos", CG_Viewpos_f },
	{ "+scores", CG_ScoresDown_f },
	{ "-scores", CG_ScoresUp_f },
	{ "sizeup", CG_SizeUp_f },
	{ "sizedown", CG_SizeDown_f },
	{ "weapnext", CG_NextWeapon_f },
	{ "weapprev", CG_PrevWeapon_f },
	{ "weapon", CG_Weapon_f },
	{ "tell_target", CG_TellTarget_f },
	{ "tell_attacker", CG_TellAttacker_f },
	{ "vtell_target", CG_VoiceTellTarget_f },
	{ "vtell_attacker", CG_VoiceTellAttacker_f },
	{ "tcmd", CG_TargetCommand_f },
	{ "nextTeamMember", CG_NextTeamMember_f },
	{ "prevTeamMember", CG_PrevTeamMember_f },
	{ "nextOrder", CG_NextOrder_f },
	{ "confirmOrder", CG_ConfirmOrder_f },
	{ "denyOrder", CG_DenyOrder_f },
	{ "taskOffense", CG_TaskOffense_f },
	{ "taskDefense", CG_TaskDefense_f },
	{ "taskPatrol", CG_TaskPatrol_f },
	{ "taskCamp", CG_TaskCamp_f },
	{ "taskFollow", CG_TaskFollow_f },
	{ "taskRetrieve", CG_TaskRetrieve_f },
	{ "taskEscort", CG_TaskEscort_f },
	{ "taskSuicide", CG_TaskSuicide_f },
	{ "taskOwnFlag", CG_TaskOwnFlag_f },
	{ "tauntKillInsult", CG_TauntKillInsult_f },
	{ "tauntPraise", CG_TauntPraise_f },
	{ "tauntTaunt", CG_TauntTaunt_f },
	{ "tauntDeathInsult", CG_TauntDeathInsult_f },
	{ "tauntGauntlet", CG_TauntGauntlet_f },
	{ "spWin", CG_spWin_f },
	{ "spLose", CG_spLose_f },
	{ "scoresDown", CG_scrollScoresDown_f },
	{ "scoresUp", CG_scrollScoresUp_f },
	{ "startOrbit", CG_StartOrbit_f },
	//{ "camera", CG_Camera_f },
	{ "loaddeferred", CG_LoadDeferredPlayers },
	{ "invnext", CG_NextInventory_f },
	{ "invprev", CG_PrevInventory_f },
	{ "forcenext", CG_NextForcePower_f },
	{ "forceprev", CG_PrevForcePower_f },
    { "clientserverstatus", CG_clientserverstatus_f },
    { "demopos", CG_demopos_f },
    { "smoothcam", CG_smoothcam_f },
    { "insertcam", CG_insertcam_f },
    { "removecam", CG_removecam_f },
    { "removeallcams", CG_removeallcams_f },
    { "savecamcfg", CG_savecamcfg_f },
    { "showcam", CG_showcam_f },
	{ "dumploc", CG_DumpLoc_f },
	{ "addloc", CG_AddLoc_f },
	{ "insloc", CG_InsLoc_f },
	{ "replloc", CG_ReplLoc_f },
	{ "truepug_demospec", CG_demospec_f },
	{ "rename", CG_Rename_f },
	{ "varMath", CG_VarMath_f },
	{ "ghostsave", CG_GhostSave_f },
	{ "ghostload", CG_GhostLoad_f },
	{ "ghostclose", CG_GhostClose_f },
};


/*
=================
CG_ConsoleCommand

The string has been tokenized and can be retrieved with
Cmd_Argc() / Cmd_Argv()
=================
*/
qboolean CG_ConsoleCommand( void ) {
	const char	*cmd;
	int		i;

	cmd = CG_Argv(0);

	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
		if ( !Q_stricmp( cmd, commands[i].cmd ) ) {
			commands[i].function();
			return qtrue;
		}
	}

	return qfalse;
}


/*
=================
CG_InitConsoleCommands

Let the client system know about all of our commands
so it can perform tab completion
=================
*/
void CG_InitConsoleCommands( void ) {
	int		i;

	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
		trap_AddCommand( commands[i].cmd );
	}

	//
	// the game server will interpret these commands, which will be automatically
	// forwarded to the server after they are not recognized locally
	//
	trap_AddCommand ("forcechanged");
	trap_AddCommand ("sv_invnext");
	trap_AddCommand ("sv_invprev");
	trap_AddCommand ("sv_forcenext");
	trap_AddCommand ("sv_forceprev");
	trap_AddCommand ("sv_saberswitch");
	trap_AddCommand ("engage_duel");
	trap_AddCommand ("force_heal");
	trap_AddCommand ("force_speed");
	trap_AddCommand ("force_throw");
	trap_AddCommand ("force_pull");
	trap_AddCommand ("force_distract");
	trap_AddCommand ("force_rage");
	trap_AddCommand ("force_protect");
	trap_AddCommand ("force_absorb");
	trap_AddCommand ("force_healother");
	trap_AddCommand ("force_forcepowerother");
	trap_AddCommand ("force_seeing");
	trap_AddCommand ("use_seeker");
	trap_AddCommand ("use_field");
	trap_AddCommand ("use_bacta");
	trap_AddCommand ("use_electrobinoculars");
	trap_AddCommand ("zoom");
	trap_AddCommand ("use_sentry");
	trap_AddCommand ("bot_order");
	trap_AddCommand ("saberAttackCycle");
	trap_AddCommand ("kill");
	trap_AddCommand ("say");
	trap_AddCommand ("say_team");
	trap_AddCommand ("tell");
	trap_AddCommand ("vsay");
	trap_AddCommand ("vsay_team");
	trap_AddCommand ("vtell");
	trap_AddCommand ("vtaunt");
	trap_AddCommand ("vosay");
	trap_AddCommand ("vosay_team");
	trap_AddCommand ("votell");
	trap_AddCommand ("give");
	trap_AddCommand ("god");
	trap_AddCommand ("notarget");
	trap_AddCommand ("noclip");
	trap_AddCommand ("team");
	trap_AddCommand ("follow");
	trap_AddCommand ("levelshot");
	trap_AddCommand ("addbot");
	trap_AddCommand ("setviewpos");
	trap_AddCommand ("callvote");
	trap_AddCommand ("vote");
	trap_AddCommand ("callteamvote");
	trap_AddCommand ("teamvote");
	trap_AddCommand ("stats");
	trap_AddCommand ("teamtask");
	trap_AddCommand ("loaddefered");	// spelled wrong, but not changing for demo
}
