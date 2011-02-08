#include "stdafx.h"


#include "NewtonSettings.h"

NewtonSettings::NewtonSettings()
: iNewt_max					(50)
, dRtol						(1e-6)
, dAtol						(1.0)
, dDelta					(0.9)
{
};
/*max. Anzahl an Newtonititerationen pro Schritt (default: 25)*/
long int     NewtonSettings::getNewtMax()
{
	return iNewt_max;
}
void		 NewtonSettings::setNewtMax(long int max)
{
	iNewt_max =max;
}	
/* Relative Toleranz f�r die Newtoniteration (default: 1e-6)*/
double		 NewtonSettings::getRtol()
{
	return dRtol;
}
void		 NewtonSettings::setRtol(double t)
{
	dRtol=t;
}				
/*Absolute Toleranz f�r die Newtoniteration (default: 1e-6)*/
double		 NewtonSettings::getAtol()
{
	return dAtol;
}						
void		 NewtonSettings::setAtol(double t)
{
	dAtol =t;
}				
/*D�mpfungsfaktor (default: 0.9)*/
double	     NewtonSettings::getDelta()
{
	return dDelta;
}							
void	     NewtonSettings::setDelta(double t)
{
	dDelta = t;
}	

void NewtonSettings::load(string)
{
}