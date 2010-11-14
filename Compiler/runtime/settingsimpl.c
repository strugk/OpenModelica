/*
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-2010, Link�pings University,
 * Department of Computer and Information Science,
 * SE-58183 Link�ping, Sweden.
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
 * from Link�pings University, either from the above address,
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


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "config.h"

/* malloc.h is in sys in Mac OS */
#ifdef __APPLE_CC__
#include <sys/malloc.h>
#else /* Linux or Windows here */
#include <malloc.h>
#endif

#ifdef WIN32
#include <Windows.h>
#endif

char* compileCommand = 0;
char* compilePath = 0;
char* tempDirectoryPath = 0;
char* plotCommand = 0;

int echo = 1; //true

char* _replace(char* source_str,char* search_str,char* replace_str); //Defined in systemimpl.c

// Do not free or modift the returned variable. It's part of the environment!
static const char* SettingsImpl__getInstallationDirectoryPath() {
  const char *path = getenv("OPENMODELICAHOME");
  if (path == NULL)
    return CONFIG_DEFAULT_OPENMODELICAHOME; // On Windows, this is NULL; on Unix it is the configured --prefix
  return path;
}
