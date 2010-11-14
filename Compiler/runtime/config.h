/*
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-2010, Linköpings University,
 * Department of Computer and Information Science,
 * SE-58183 Linköping, Sweden.
 *
 * All rights reserved.
 *
 * THIS PROGRAM IS PROVIDED UNDER THE TERMS OF THIS OSMC PUBLIC
 * LICENSE (OSMC-PL). ANY USE, REPRODUCTION OR DISTRIBUTION OF
 * THIS PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THE OSMC
 * PUBLIC LICENSE.
 *
 * The OpenModelica software and the Open Source Modelica
 * Consortium (OSMC) Public License (OSMC-PL) are obtained
 * from Linköpings University, either from the above address,
 * from the URL: http://www.ida.liu.se/projects/OpenModelica
 * and in the OpenModelica distribution.
 *
 * This program is distributed  WITHOUT ANY WARRANTY; without
 * even the implied warranty of  MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE, EXCEPT AS EXPRESSLY SET FORTH
 * IN THE BY RECIPIENT SELECTED SUBSIDIARY LICENSE CONDITIONS
 * OF OSMC-PL.
 *
 * See the full OSMC Public License conditions for more details.
 *
 */

#define DEFAULT_CC "g++"
#define DEFAULT_CXX "g++"
#define DEFAULT_LDFLAGS "-lc_runtime"

#if defined(__MINGW32__) || defined(_MSC_VER) /* Windows */

#define CONFIG_DEFAULT_OPENMODELICAHOME NULL
#if defined(__MINGW32)
  #define CONFIGURE_COMMANDLINE "Manually created Makefiles for OMDev"
#else defined(_MSC_VER)
  #define CONFIGURE_COMMANDLINE "Manually created Makefiles for Visual Studio"
#endif

#define LDFLAGS_SENDDATA " -lsendData -lQtNetwork-mingw -lQtCore-mingw -lQtGui-mingw -luuid -lole32 -lws2_32"
#define CONFIG_EXE_EXT ".exe"
#define CONFIG_DLL_EXT ".dll"
#define CONFIG_OS "Windows_NT"

#if defined(__i386__) || defined(__x86_64__) || defined(_MSC_VER)
  /*
   * if we are on i386 or x86_64 or compiling with
   * Visual Studio then use the SSE instructions,
   * not the normal i387 FPU
   */
  #define DEFAULT_CFLAGS "-msse2 -mfpmath=sse ${MODELICAUSERCFLAGS}"
#else
  #define DEFAULT_CFLAGS "${MODELICAUSERCFLAGS}"
#endif
#if defined(__x86_64__)
  /* -fPIC needed on x86_64! */
  #define DEFAULT_LINKER "g++ -shared -export-dynamic -fPIC"
#else
  #define DEFAULT_LINKER "g++ -shared -export-dynamic"
#endif

#else /* Unix */

#include "config.unix.h"

#endif
