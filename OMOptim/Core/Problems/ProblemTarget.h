﻿// $Id$
/**
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-CurrentYear, Open Source Modelica Consortium (OSMC),
 * c/o Linköpings universitet, Department of Computer and Information Science,
 * SE-58183 Linköping, Sweden.
 *
 * All rights reserved.
 *
 * THIS PROGRAM IS PROVIDED UNDER THE TERMS OF GPL VERSION 3 LICENSE OR 
 * THIS OSMC PUBLIC LICENSE (OSMC-PL). 
 * ANY USE, REPRODUCTION OR DISTRIBUTION OF THIS PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE
 * OF THE OSMC PUBLIC LICENSE OR THE GPL VERSION 3, ACCORDING TO RECIPIENTS CHOICE. 
 *
 * The OpenModelica software and the Open Source Modelica
 * Consortium (OSMC) Public License (OSMC-PL) are obtained
 * from OSMC, either from the above address,
 * from the URLs: http://www.ida.liu.se/projects/OpenModelica or  
 * http://www.openmodelica.org, and in the OpenModelica distribution. 
 * GNU version 3 is obtained from: http://www.gnu.org/copyleft/gpl.html.
 *
 * This program is distributed WITHOUT ANY WARRANTY; without
 * even the implied warranty of  MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE, EXCEPT AS EXPRESSLY SET FORTH
 * IN THE BY RECIPIENT SELECTED SUBSIDIARY LICENSE CONDITIONS OF OSMC-PL.
 *
 * See the full OSMC Public License conditions for more details.
 *
 * Main contributor 2010, Hubert Thierot, CEP - ARMINES (France)

 	@file ProblemTarget.h
 	@brief File concerning ProblemTarget class
 	@author Hubert Thieriot, hubert.thieriot@mines-paristech.fr
 	Company : CEP - ARMINES (France)
 	http://www-cep.ensmp.fr/english/
 	@version 0.9 

  */

#ifndef PROBLEMTARGET_H
#define PROBLEMTARGET_H

#include "ProblemEI.h"
#include "MilpTarget.h"
#include "MERResult.h"
#include "EIConnConstrs.h"



/*
 * \brief Class for Target (Energy integration) problem. Target use GLPK for MILP optimization.
 */
class ProblemTarget : public ProblemEI
{
		Q_OBJECT

public:
	ProblemTarget(Project* _project,EIReader* _eiReader);
	ProblemTarget(const ProblemTarget &);
	virtual ~ProblemTarget(void);
	virtual QString getClassName(){return "ProblemTarget";};

	void launch(ProblemConfig _config);
	void launchMER(ProblemConfig _config,bool includeUtilities);

	QDomElement toXMLData(QDomDocument & doc);
	bool checkBeforeComp(QString & error);

	void clearInputVars();
	void updateInputVars(MOOptVector *);
	void setInputVars(MOOptVector*);

	MERResult* getMERResult();
	MOOptVector * inputVars();
	EIConnConstrs* connConstrs();
	EIItem* _rootEI;

signals :
	void inputVarsModified();

protected :
	MOOptVector * _inputVars;
	EIReader* _eiReader;
	MERResult *_merResult;
	EIConnConstrs *_connConstrs; // connnection constraints
};


#endif