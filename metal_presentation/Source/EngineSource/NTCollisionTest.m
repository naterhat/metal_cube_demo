//
//  NTCollisionTest.m
//  RenderEngine
//
//  Created by Nate on 12/8/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "NTCollisionTest.h"
#import "NTMath.h"

BOOL __attribute__((overloadable)) NTIntersectTestBetweenRayAndSphere(vector_float3 rayOrigin,
                                                                      vector_float3 rayDirection,
                                                                      vector_float3 sphereCenter,
                                                                      float sphereRadius,
                                                                      float *distance, vector_float3 *point)
{
    // method 1
    vector_float3 rd = vector_normalize(rayDirection);
    float r2 = sphereRadius * sphereRadius;
    vector_float3 l = sphereCenter - rayOrigin;
    float s = vector_dot(rd, l);
    float l2 = vector_dot (l, l);
    if( s < 0 ) {
        if (l2 > r2) {
            *distance = 0;
            *point = NTVectorFloat3Zero();
            return NO;
        }
    }
    
    float m2 = l2 - (s * s);
    if ( m2 > r2 ) {
        *distance = 0;
        *point = NTVectorFloat3Zero();
        return NO;
    }
    
    float t;
    float q = sqrtf(r2 - m2);
    if( l2 > r2) t = s - q;
    else t = s + q;
    
    *distance = t;
    *point = rayOrigin + t * rayDirection;
    return YES;
}