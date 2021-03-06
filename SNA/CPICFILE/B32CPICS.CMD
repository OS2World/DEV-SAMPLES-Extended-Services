@echo OFF
cls
ECHO ************************************************************************
ECHO * CPICCSVR Sample Program: CPICCSVR.C                                  *
ECHO *                                                                      *
ECHO * COPYRIGHT:                                                           *
ECHO * ----------                                                           *
ECHO * Copyright (C) International Business Machines Corp., 1991            *
ECHO *                                                                      *
ECHO *                                                                      *
ECHO *  File list:                                                          *
ECHO *                                                                      *
ECHO *   CPICCSVR.C    - source code to create the EXE                      *
ECHO *   CPICCSVR.H    - header file for CPICCSVR.C                         *
ECHO *   CPICCSVR.DEF  - module definition file for CPICCSVR.C              *
ECHO *   B32CPICS.CMD  - command file to link the program dynamically       *
ECHO ************************************************************************
PAUSE
SETLOCAL
ECHO ***************************************************************************
ECHO * Building program                                                        *
ECHO *                                                                         *
ECHO * icc  /Gt  /C+ /G3  /Sm cpiccsvr.c                                       *
ECHO *                                                                         *
ECHO * compiler options:                                                       *
ECHO *                                                                         *
ECHO *   /Gt   :  enable all varibles to be passed to 16 bit functions         *
ECHO *   /C+   :  perform compile only, no link                                *
ECHO *   /G3   :  optimize code for a 386 processor; code will run on a 486    *
ECHO *   /Sm   :  Allow migration extensions                                   *
ECHO *                                                                         *
ECHO ***************************************************************************
icc  /Gt  /C+ /G3  /Sm cpiccsvr.c
IF ERRORLEVEL 0 GOTO LINK
ECHO ERROR:  Failed to compile CPICCSVR.C
ECHO REMEDY: Make sure that you have installed the correct components,
ECHO         and try again
PAUSE
GOTO END
:LINK
ECHO ***************************************************************************
ECHO * Linking program                                                         *
ECHO *                                                                         *
ECHO * link386 /NOE /NOI cpiccsvr,cpiccsvr,cpiccsvr,acs,cpiccsvr.def           *
ECHO *                                                                         *
ECHO * link options:                                                           *
ECHO *                                                                         *
ECHO *   /NOE  - no extra dictionary                                           *
ECHO *   /NOI  - differentiate between cases                                   *
ECHO *                                                                         *
ECHO *  LIBRARIES:                                                             *
ECHO *    DDE4SBS  - Statically bound, single thread, standard library         *
ECHO *    DDE4SBM  - Statically bound, single thread, migration library        *
ECHO *    ACS      - Communication library from CMLIB                          *
ECHO *    CPIC     - CPIC library from CMLIB                                   *
ECHO *    OS2386   - OS/2 import library                                       *
ECHO *                                                                         *
ECHO *  CPICCSVR.DEF - module definition file                                  *
ECHO *                                                                         *
ECHO ***************************************************************************
link386 /NOE /NOI cpiccsvr,cpiccsvr,cpiccsvr,acs+cpic,cpiccsvr.def
IF ERRORLEVEL 0 GOTO END
ECHO ERROR:  Failed to create CPICCSVR.EXE
ECHO REMEDY: Make sure that you have installed the correct components,
ECHO         and try again
PAUSE
:END
ENDLOCAL
