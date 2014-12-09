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

/**
 *  How the function works it turns the screen size to ranges of 1 to -1 for x,y, z is -1.
 *   It then convert the point from Normalized Device Coordinate to World Space.
 */
//extern vector_float3 __attribute__((overloadable)) NTRayDirectionFromScreenToWorldSpace(vector_float2 touchPoint, CGSize screenSize, matrix_float4x4 projection, matrix_float4x4 view);

extern NSString __attribute__((overloadable)) *NTStringFromVector(vector_float2 v);
extern NSString __attribute__((overloadable)) *NTStringFromVector(vector_float3 v);
extern NSString __attribute__((overloadable)) *NTStringFromVector(vector_float4 v);

extern vector_float2 __attribute__((overloadable)) NTVectorFromCGPoint(CGPoint point);

extern NSString __attribute__((overloadable)) *NSStringFromColumn(vector_float4 c);
extern NSString __attribute__((overloadable)) *NSStringFromMatrix(matrix_float4x4 m);

extern NSString __attribute__((overloadable)) *NSStringFromColumn(vector_float3 c);
extern NSString __attribute__((overloadable)) *NSStringFromMatrix(matrix_float3x3 m);