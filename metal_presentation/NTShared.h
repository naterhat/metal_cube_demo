//
//  NTShared.h
//  RenderEngine
//
//  Created by Nate on 11/16/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#ifndef __SHARED__
#define __SHARED__

#import <simd/simd.h>

typedef struct
{
    vector_float4 position;
    vector_float4 normal;
} Vertex;

typedef struct
{
    matrix_float4x4 modelViewProjectionMatrix;
    matrix_float4x4 normalMatrix;
} Uniform;

#endif