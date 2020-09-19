//
// Copyright (c) 2000  Microsoft Corporation
//

#include "../../pinball.h"

#ifndef PINBALL_TEDGESEGMENT_H
#define PINBALL_TEDGESEGMENT_H

/* 98 */
struct TEdgeSegment;

TEdgeSegment* __thiscall TEdgeSegment::TEdgeSegment(TEdgeSegment* this, struct TCollisionComponent* a2, char* a3, unsigned int a4);

void* TEdgeSegment::vftable = &_purecall; // weak

#endif //PINBALL_TEDGESEGMENT_H
