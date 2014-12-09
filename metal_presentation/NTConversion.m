//
//  NTConversion.m
//  metaldemo_custom
//
//  Created by Nate on 10/21/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTConversion.h"

void NTVector4ToVector3(vector_float4 source[], vector_float3 *dest, const size_t count)
{
    for (int i = 0; i < count; i++) {
        dest[i] = source[i].xyz;
    }
}


void NTVector3ToVector4(vector_float3 source[], vector_float4 *dest, const size_t count, float w)
{
    for (int i = 0; i < count; i++) {
        dest[i].xyz = source[i].xyz;
        dest[i].w = w;
    }
}

void NTVector4ToVertex(vector_float4 source[], Vertex *dest, const size_t count, vector_float4 normal)
{
    for (int i = 0; i < count; i++) {
        Vertex vertex = dest[i];
        vertex.position = source[i];
        vertex.normal = normal;
        dest[i] = vertex;
    }
}

void NTInt16ToInt32(int16_t source[], int32_t *dest, const size_t count)
{
    for (int i = 0; i < count; i++) {
        dest[i] = source[i];
    }
}

void NTIntToInt32(int source[], int32_t *dest, const size_t count)
{
    for (int i = 0; i < count; i++) {
        dest[i] = source[i];
    }
}
