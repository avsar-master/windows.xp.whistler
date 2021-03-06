/**************************************************************************
 *									  *
 * 		 Copyright (C) 2000, Silicon Graphics, Inc.		  *
 *									  *
 *  These coded instructions, statements, and computer programs  contain  *
 *  unpublished  proprietary  information of Silicon Graphics, Inc., and  *
 *  are protected by Federal copyright law.  They  may  not be disclosed  *
 *  to  third  parties  or copied or duplicated in any form, in whole or  *
 *  in part, without the prior written consent of Silicon Graphics, Inc.  *
 *									  *
 **************************************************************************/

/*
 * glcurveval.c++ - curve evaluator
 *
 * $Revision: 1.1 $
 */

/* Polynomial Evaluator Interface */

#include <glos.h>
#include <GL/gl.h>
#include "glimport.h"
#include "glcurvev.h"
#include "nurbscon.h"
 
OpenGLCurveEvaluator::OpenGLCurveEvaluator(void) 
{ 
}

OpenGLCurveEvaluator::~OpenGLCurveEvaluator(void) 
{ 
}

void
OpenGLCurveEvaluator::addMap(CurveMap *m)
{
}

void
OpenGLCurveEvaluator::range1f(long type, REAL *from, REAL *to)
{
}

void
OpenGLCurveEvaluator::domain1f(REAL ulo, REAL uhi)
{
}

void
OpenGLCurveEvaluator::bgnline(void)
{
    glBegin(GL_LINE_STRIP);
}

void
OpenGLCurveEvaluator::endline(void)
{
    glEnd();
}

/*---------------------------------------------------------------------------
 * disable - turn off a curve map
 *---------------------------------------------------------------------------
 */
void
OpenGLCurveEvaluator::disable(long type)
{
    glDisable(type);
}

/*---------------------------------------------------------------------------
 * enable - turn on a curve map
 *---------------------------------------------------------------------------
 */
void
OpenGLCurveEvaluator::enable(long type)
{
    glEnable(type);
}

/*-------------------------------------------------------------------------
 * mapgrid1f - define a lattice of points with origin and offset
 *-------------------------------------------------------------------------
 */
void 
OpenGLCurveEvaluator::mapgrid1f(long nu, REAL u0, REAL u1)
{
    glMapGrid1f(nu, u0, u1);
}

/*-------------------------------------------------------------------------
 * bgnmap1 - preamble to curve definition and evaluations
 *-------------------------------------------------------------------------
 */
void
OpenGLCurveEvaluator::bgnmap1f(long)
{
    glPushAttrib(GL_EVAL_BIT);
}

/*-------------------------------------------------------------------------
 * endmap1 - postamble to a curve map
 *-------------------------------------------------------------------------
 */
void
OpenGLCurveEvaluator::endmap1f(void)
{
    glPopAttrib();
}

/*-------------------------------------------------------------------------
 * map1f - pass a desription of a curve map
 *-------------------------------------------------------------------------
 */
void
OpenGLCurveEvaluator::map1f(
    long type,		 	/* map type */
    REAL ulo,			/* lower parametric bound */
    REAL uhi,			/* upper parametric bound */
    long stride, 		/* distance to next point in REALS */
    long order,			/* parametric order */
    REAL *pts 			/* control points */
)
{
    glMap1f(type, ulo, uhi, stride, order, pts);
}

/*-------------------------------------------------------------------------
 * mapmesh1f - evaluate a mesh of points on lattice
 *-------------------------------------------------------------------------
 */
void OpenGLCurveEvaluator::mapmesh1f(long style, long from, long to)
{
    switch(style) {
    default:
    case N_MESHFILL:
    case N_MESHLINE:
	glEvalMesh1(GL_LINE, from, to);
	break;
    case N_MESHPOINT:
	glEvalMesh1(GL_POINT, from, to);
	break;
    }
}

/*-------------------------------------------------------------------------
 * evalpoint1i - evaluate a point on a curve
 *-------------------------------------------------------------------------
 */
void OpenGLCurveEvaluator::evalpoint1i(long i)
{
    glEvalPoint1(i);
}

/*-------------------------------------------------------------------------
 * evalcoord1f - evaluate a point on a curve
 *-------------------------------------------------------------------------
 */
void OpenGLCurveEvaluator::evalcoord1f(long, REAL u)
{
    glEvalCoord1f(u);
}
