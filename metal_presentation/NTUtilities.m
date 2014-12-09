//
//  NTUtilities.m
//  RenderEngine
//
//  Created by Nate on 12/1/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTUtilities.h"

NSString __attribute__((overloadable)) *NTStringFromVector(vector_float2 v)
{
    return [NSString stringWithFormat:@"%.02f %.02f", v.x, v.y];
}

NSString __attribute__((overloadable)) *NTStringFromVector(vector_float3 v)
{
    return [NSString stringWithFormat:@"%.02f %.02f %.02f", v.x, v.y, v.z];
}


NSString __attribute__((overloadable)) *NTStringFromVector(vector_float4 v)
{
    return [NSString stringWithFormat:@"%.02f %.02f %.02f %.02f", v.x, v.y, v.z, v.w];
}

vector_float2 NTVectorFloat2Zero()
{
    return (vector_float2){0, 0};
}

vector_float3  NTVectorFloat3Zero()
{
    return (vector_float3){0, 0, 0};
}

vector_float4 NTVectorFloat4Zero()
{
    return (vector_float4){0, 0, 0, 0};
}

vector_float2 __attribute__((overloadable)) NTVectorFromCGPoint(CGPoint point)
{
    return (vector_float2){point.x, point.y};
}


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

vector_float3 __attribute__((overloadable)) NTRayDirectionFromScreenToWorldSpace(vector_float2 touchPoint, CGSize screenSize, matrix_float4x4 projection, matrix_float4x4 view)
{
    float x = (2.0f * touchPoint.x) / screenSize.width - 1.0f;
    float y = 1.0f - (2.0f * touchPoint.y) / screenSize.height;
    float z = 1.0f;
    vector_float3 ray_nds = (vector_float3){x, y, z};
    
//    NSLog(@"location: %@ / %@", NTStringFromVector(touchPoint), NTStringFromVector(ray_nds));
    
    vector_float4 ray_clip = (vector_float4) { ray_nds.x, ray_nds.y, -1.0, 1.0 };
    
    vector_float4 ray_eye =  matrix_multiply( matrix_invert(projection), ray_clip );
    
    ray_eye = (vector_float4){ ray_eye.x, ray_eye.y, 1.0, 0.0 };
    
    vector_float3 ray_wor = matrix_multiply( matrix_invert( view ), ray_eye).xyz;
    ray_wor = vector_normalize(ray_wor);
    
    return ray_wor;
}


void __attribute__((overloadable)) NTMVP(matrix_float4x4 model, matrix_float4x4 view, matrix_float4x4 projection, matrix_float4x4 *normalMatrix, matrix_float4x4 *mvp)
{
    // view model
    matrix_float4x4 viewModel = matrix_multiply(view, model);
    
    // pvm (projection view model)
    matrix_float4x4 pvm = matrix_multiply(projection, viewModel);
    
    // set uniforms
    *mvp = pvm;
    if(normalMatrix) *normalMatrix = matrix_invert( matrix_transpose( viewModel ));
}

