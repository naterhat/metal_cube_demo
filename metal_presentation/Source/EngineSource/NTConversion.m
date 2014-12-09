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

//void NTVector4ToVertex(vector_float4 source[], Vertex *dest, const size_t count, vector_float4 normal)
//{
//    for (int i = 0; i < count; i++) {
//        Vertex vertex = dest[i];
//        vertex.position = source[i];
//        vertex.normal = normal;
//        dest[i] = vertex;
//    }
//}
