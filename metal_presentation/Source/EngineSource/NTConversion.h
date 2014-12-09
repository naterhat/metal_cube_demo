//
//  NTConversion.h
//  metaldemo_custom
//
//  Created by Nate on 10/21/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <simd/simd.h>
#import <CoreGraphics/CGGeometry.h>

void NTVector4ToVector3(vector_float4 source[], vector_float3 *dest, const size_t count);
void NTVector3ToVector4(vector_float3 source[], vector_float4 *dest, const size_t count, float w);
void NTInt16ToInt32(int16_t source[], int32_t *dest, const size_t count);
void NTIntToInt32(int source[], int32_t *dest, const size_t count);

extern vector_float3 __attribute__((overloadable)) NTRayDirectionFromScreenToWorldSpace(vector_float2 touchPoint, CGSize screenSize, matrix_float4x4 projection, matrix_float4x4 view);