//
//  NTCollisionTest.h
//  RenderEngine
//
//  Created by Nate on 12/8/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <simd/simd.h>

extern BOOL __attribute__((overloadable)) NTIntersectTestBetweenRayAndSphere(vector_float3 rayOrigin,
                                                                             vector_float3 rayDirection,
                                                                             vector_float3 sphereCenter,
                                                                             float sphereRadius,
                                                                             float *distance, vector_float3 *point);
