//
//  NTUtilities.h
//  RenderEngine
//
//  Created by Nate on 12/1/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import <simd/simd.h>

extern BOOL __attribute__((overloadable)) NTIntersectTestBetweenRayAndSphere(vector_float3 rayOrigin,
                                               vector_float3 rayDirection,
                                               vector_float3 sphereCenter,
                                               float sphereRadius,
                                               float *distance, vector_float3 *point);

/**
 *  How the function works it turns the screen size to ranges of 1 to -1 for x,y, z is -1.
 *   It then convert the point from Normalized Device Coordinate to World Space.
 */
extern vector_float3 __attribute__((overloadable)) NTRayDirectionFromScreenToWorldSpace(vector_float2 touchPoint, CGSize screenSize, matrix_float4x4 projection, matrix_float4x4 view);

extern NSString __attribute__((overloadable)) *NTStringFromVector(vector_float2 v);
extern NSString __attribute__((overloadable)) *NTStringFromVector(vector_float3 v);
extern NSString __attribute__((overloadable)) *NTStringFromVector(vector_float4 v);

extern vector_float2 __attribute__((overloadable)) NTVectorFromCGPoint(CGPoint point);

extern void __attribute__((overloadable)) NTMVP(matrix_float4x4 model, matrix_float4x4 view, matrix_float4x4 projection, matrix_float4x4 *normalMatrix, matrix_float4x4 *mvp);

extern vector_float4 NTVectorFloat4Zero();
extern vector_float3 NTVectorFloat3Zero();
extern vector_float2 NTVectorFloat2Zero();

