## Copyright:   Public domain.
## Filename:    P70-P71.agc
## Purpose:     The main source file for Luminary revision 069.
##              It is part of the source code for the original release 
##              of the source code for the Lunar Module's (LM) Apollo 
##              Guidance Computer (AGC) for Apollo 10. The actual flown 
##              version was Luminary 69 revision 2, which included a 
##              newer lunar gravity model and only affected module 2.
##              This file is intended to be a faithful transcription, except
##              that the code format has been changed to conform to the
##              requirements of the yaYUL assembler rather than the
##              original YUL assembler.
## Reference:   pp. 829-838
## Assembler:   yaYUL
## Contact:     Ron Burkey <info@sandroid.org>.
## Website:     www.ibiblio.org/apollo/index.html
## Mod history: 2016-12-13 MAS  Created from Luminary 99.
##              2016-12-18 MAS  Updated from comment-proofed Luminary 99 version.
##		2017-01-09 RRB	Updated for Luminary 69.
##              2017-01-20 HG   Fix pseudo code 2CARD -> 2CADR
##              2017-01-21 HG   Fix operand XDEVLFLG -> XDELVFLG

## Page 829
		BANK	21
		SETLOC	R11
		BANK

		EBANK=	DVCNTR
		COUNT*	$$/R11

R10,R11		CS	FLAGWRD7	# IS SERVICER STILL RUNNING?
		MASK	AVEGFBIT
		CCS	A
		TCF	TASKOVER	# LET AVGEND TAKE CARE OF GROUP 2.
		CCS	PIPCTR
		TCF	+2
		TCF	LRHTASK		# LAST PASS. CALL LRHTASK.
 +2		TS	PIPCTR1

PIPCTR1		=	LADQSAVE
PIPCTR		=	PHSPRDT2
		CAF	OCT31
		TC	TWIDDLE
		ADRES	R10,R11
R10,R11A	CS	IMODES33	# IF LAMP TEST, DO NOT CHANGE LR LITES.
		MASK	BIT1
		EXTEND
		BZF	10,11

FLASHH?		MASK	FLGWRD11	# C(A) = 1 - HFLASH BIT
		EXTEND
		BZF	FLASHV?		# H FLASH OFF, SO LEAVE ALONE

		CA	HLITE
		TS	L
		TC	FLIP		# FLIP H LITE

FLASHV?		CA	VFLSHBIT	# VFLASHBIT MUST BE BIT 2.
		MASK	FLGWRD11
		EXTEND
		BZF	10,11		# V FLASH OFF

		CA	VLITE
		TS	L
		TC	FLIP		# FLIP V LITE

10,11		CA	FLAGWRD9	# IS THE LETABORT FLAG SET ?
		MASK	LETABBIT
		EXTEND
		BZF	LANDISP		# NO. PROCEED TO R10.

P71NOW?		CS	MODREG		# YES.  ARE WE IN P71 NOW?
## Page 830
		AD	MODE71
		EXTEND
		BZF	LANDISP		# YES.  PROCEED TO R10.
		
		EXTEND			# NO.  IS AN ABORT STAGE COMMANDED?
		READ	CHAN30
		COM
		TS	L
		MASK	BIT4
		CCS	A
		TCF	P71A		# YES.

P70NOW?		CS	MODREG		# NO. ARE WE IN P70 NOW?
		AD	MODE70
		EXTEND
		BZF	LANDISP		# YES.  PROCEED TO R10.

		CA	L		# NO.  IS AN ABORT COMMANDED?
		MASK	BIT1
		CCS	A
		TCF	P70A		# YES.
		TCF	LANDISP		# NO.  PROCEED TO R10.

		COUNT*	$$/P70

P70		TC	LEGAL?
P70A		CS	ZERO
		TCF	+3
P71		TC	LEGAL?
P71A		CAF	TWO
   +3		TS	Q
		INHINT
		CAF	ABRTJADR
		TS	BRUPT
		RESUME

ABRTJADR	TCF	ABRTJASK

ABRTJASK	CAF	OCTAL27
		AD	Q
		TS	L
		COM
		DXCH	-PHASE4
		INDEX	Q
		CAF	MODE70
		TS	MODREG

		TS	DISPDEX		# INSURE DISPDEX IS POSITIVE.

		CCS	Q		# SET APSFLAG IF P71.
## Page 831
		CS	FLGWRD10	# SET APSFLAG PRIOR TO THE ENEMA.
		MASK	APSFLBIT
		ADS	FLGWRD10
		CS	DAPBITS		# DAPBITS = OCT 640 = BITS 6, 8, 9
		MASK	DAPBOOLS	# (TURN OFF: ULLAGE, DRIFT, AND XOVINHIB )
		TS	DAPBOOLS

		CS	FLAGWRD5	# SET ENGONFLG.
		MASK	ENGONBIT
		ADS	FLAGWRD5

		CS	PRIO30		# INSURE THAT THE ENGINE IS ON, IF ARMED.
		EXTEND
		RAND	DSALMOUT
		AD	BIT13
		EXTEND
		WRITE	DSALMOUT

		CAF	LRBYBIT		# TERMINATE R12.
		TS	FLGWRD11

		CS	FLAGWRD0	# SET R10FLAG TO SUPPRESS OUTPUTS TO THE
		MASK	R10FLBIT	# CROSS-POINTER DISPLAY.
		ADS	FLAGWRD0	# THE FOLLOWING ENEMA WILL REMOVE THE
					# DISPLAY INERTIAL DATA OUTBIT AND
					# DISABLE THE RR ERROR CTRS FOR US.

		EXTEND			# LOAD TEVENT FOR THE DOWNLINK.
		DCA	TIME2
		DXCH	TEVENT

		EXTEND
		DCA	SVEXITAD
		DXCH	AVGEXIT

		EXTEND
		DCA	NEG0
		DXCH	-PHASE1
		
		EXTEND
		DCA	NEG0
		DXCH	-PHASE3
		
		EXTEND
		DCA	NEG0
		DXCH	-PHASE6
		
		CAF	THREE		# SET UP 4.3SPOT FOR GOABORT
		TS	L
		COM
## Page 832
		DXCH	-PHASE4

		CAF	OCT37774	# SET T5RUPT TO CALL DAPIDLER IN	
		TS	TIME5		# 40 MILLISECONDS.
		
		TC	POSTJUMP
		CADR	ENEMA

		EBANK=	DVCNTR
SVEXITAD	2CADR	SERVEXIT

MODE70		DEC	70
OCTAL27		OCT	27
MODE71		DEC	71

DAPBITS		OCT	00640

		BANK	32
		SETLOC	ABORTS
		BANK

		COUNT*	$$/P70

GOABORT		TC	INTPRET
		CALL
			INITCDUW
		EXIT
		CAF	FOUR
		TS	DVCNTR

		CAF	WHICHADR
		TS	WHICH

		TC	DOWNFLAG
		ADRES	FLRCS

		TC	DOWNFLAG
		ADRES	FLUNDISP
		
		TC	DOWNFLAG
		ADRES	IDLEFLAG
		
		TC	UPFLAG		# INSURE 4-JET TRANSLATION CAPABILITY.
		ADRES	ACC4-2FL
		
		TC	CHECKMM
70DEC		DEC	70
		TCF	P71RET

P70INIT		TC	INTPRET
## Page 833
		CALL
			TGOCOMP
		DLOAD	SL
			MDOTDPS
			4D
		BDDV
			MASS
		STODL	TBUP
			MASS
		DDV	SR1
			K(1/DV)
		STORE	1/DV1
		STORE	1/DV2
		STORE	1/DV3
		BDDV
			K(AT)
		STODL	AT
			DTDECAY
		DCOMP	SL
			11D
		STORE	TTO
		SLOAD	DCOMP
			DPSVEX
		SR2
		STORE	VE		# INITIALIZE DPS EXHAUST VELOCITY
		SET	CALL
			FLAP
			COMMINIT
INJTARG		GOTO			# *** BYPASS ZONE 0 ***
			UPTHROT		# *** BYPASS ZONE 0 ***
		DLOAD	DSU
			TGO
			50SECS
		BPL	EXIT
			UPTHROT

		TC	CHECKMM
		DEC	70
		CAF	DEC299		# P71.  DELAY 3 SECONDS.
		AD	BIT1		# P70.  DELAY ONE CENTISECOND
		TS	ENGOFFDT
		TC	TWIDDLE
		ADRES	ZONEZERO

		TC	PHASCHNG
		OCT	47014
		-GENADR	ENGOFFDT
		EBANK=	DVCNTR
		2CADR	ZONEZERO
## Page 834
		TCF	ENDOFJOB

ZONEZERO	TC	IBNKCALL
		CADR	ENGINOF2

		CAF	ZERETAD
		TS	OUTROUTE

		TC	DOWNFLAG
		ADRES	V37FLAG

		TC	PHASCHNG
		OCT	00004
		
		TCF	TASKOVER

UPTHROT		SET	EXIT
			FLVR
		
		TC	THROTUP

		TC	PHASCHNG
		OCT	04024

  -3		TC	BANKCALL	# VERIFY THAT THE PANEL SWITCHES 
		CADR	P40AUTO		# ARE PROPERLY SET.
		
		TC	THROTUP

UPTHROT1	EXTEND			# SET SERVICER TO CALL ASCENT GUIDANCE.
		DCA	ATMAGAD
		DXCH	AVGEXIT

GRP4OFF		TC	PHASCHNG	# TERMINATE USE OF GROUP 4.
		OCT	00004

		TCF	ENDOFJOB

ZERETAD		CADR	ZONE0RET
ZONE0RET	TC	2PHSCHNG
		OCT	00002
		OCT	05024
		OCT	25000
		
		TC	INTPRET
		RTB	DAD
## Page 835
			LOADTIME
			90SEC
		STORE	PIPTIME1	# STORE TEMPORARILY IN PIPTIME1.
		STCALL	TDEC1
			LEMPREC
		VLOAD
			VATT
		STORE	VN1		# STORE VTIG TEMPORARILY IN VN1.
		MXV	VSL1
			REFSMMAT
		STOVL	V
			RATT
		STORE	RN1		# STORE RTIG TEMPORARILY IN RN1.
		MXV	VSL6
			REFSMMAT
		STCALL	R
			MUNGRAV
		SET	CALL
			FLZONE0
			ASCENT
PREBRET1	EXIT
		TC	PHASCHNG
		OCT	04024
		TC	INTPRET
		CLEAR	VLOAD
			FLZONE0
			VGVECT
		VXM	VSL1
			REFSMMAT
		STORE	DELVSIN
		ABVAL
		STOVL	DELVSAB
			RN1
		STODL	VTIG
			PIPTIME1
		STORE	TIG
		SET	CLEAR
			XDELVFLG
			LETABORT
		EXIT

		CAF	SIX		# SET UP R60 FOR A 10 DEG/SEC MANUV. RATE.
		TS	RATEINDX

		CAF	PRIO13		# REDUCE PRIORITY TO LEVEL EXPECTED BY
		TC	PRIOCHNG	# P40 AND P42.
		CAF	ORBMANAD	# INITIALIZE FOR ORBITAL MANEUVERS LIST.
		TS	DNLSTCOD
## Page 836
		TS	AGSWORD

		TC	CHECKMM
		DEC	70		# FOR MODE=70,USE P40,OTHERWISE P42.
		TCF	42SET
40SET		CAF	P40CADR
		TS	CADRSAVE
		CAF	DEC40
COMMSET		TS	MMSAVE
		TC	PHASCHNG
		OCT	05024
		OCT	13000

		CA	MMSAVE
		TC	NEWMODEA

		CA	CADRSAVE
		TC	BANKJUMP
42SET		CAF	P42CADR
		TS	CADRSAVE
		CAF	DEC42
		TCF	COMMSET

P40CADR		CADR	P40LM
P42CADR		CADR	P42LM
CADRSAVE	=	MASS1
MMSAVE		=	MASS1 +1
DEC40		DEC	40
DEC42		DEC	42

P71RET		TC	DOWNFLAG
		ADRES	LETABORT

		CAF	THRESH2		# SET DVMON THRESHOLD TO THE ASCENT VALUE.
		TS	DVTHRUSH

		TC	INTPRET
		BON	CALL
			FLAP
			OLDTIME
			TGOCOMP		# IF FLAP=0, TGO=T-TIG
		SSP	GOTO
			QPRET
		CADR	INJTARG
			P12INIT		# WILL EXIT P12INIT TO INJTARG
OLDTIME		DLOAD	SL1		# IF FLAP=1,TGO=2 TGO
			TGO
		STCALL	TGO1
			P12INIT
## Page 837
		EXIT
		TC	PHASCHNG
		OCT	04024

		EXTEND
		DCA	TGO1
		DXCH	TGO
		TCF	UPTHROT1 -3

TGO1		=	APO
# ************************************************************************

		BANK	21
		SETLOC	R11
		BANK

		COUNT*	$$/P70

LEGAL?		CS	MMNUMBER	# IS THE DESIRED PGM ALREADY IN PROGRESS?
		AD	MODREG
		EXTEND
		BZF	ABORTALM

		CS	FLAGWRD9	# ARE THE ABORTS ENABLED?
		MASK	LETABBIT
		CCS	A
		TCF	ABORTALM

		CA	FLAGWRD7	# IS SERVICER ON THE AIR?
		MASK	AVEGFBIT
		CCS	A
		TC	Q		# YES. ALL IS WELL.
ABORTALM	TC	FALTON
		TC	RELDSP
		TC	POSTJUMP
		CADR	PINBRNCH

		BANK	32
		SETLOC	ABORTS
		BANK

		COUNT*	$$/P70

# ************************************************************************

TGOCOMP		RTB	DSU
			LOADTIME
			TIG
		SL
## Page 838
			11D
		STORE	TGO
		RVQ

# ************************************************************************

THROTUP		CAF	BIT13
		TS	THRUST
		CAF	BIT4
		EXTEND
		WOR	CHAN14
		TC	Q

# ************************************************************************

DEC299		DEC	299

10SECS		2DEC	1000

90SEC		2DEC	9000

50SECS		2DEC	5000 B-17

HINJECT		2DEC	18288 B-24	# 60,000 FEET EXPRESSED IN METERS.

(TGO)A		2DEC	37000 B-17

K(AT)		2DEC	.02		# SCALING CONSTANT

WHICHADR	REMADR	ABRTABLE

# ************************************************************************
		EBANK=	DVCNTR
ATMAGAD		2CADR	ATMAG

ORBMANAD	ADRES	ORBMANUV

