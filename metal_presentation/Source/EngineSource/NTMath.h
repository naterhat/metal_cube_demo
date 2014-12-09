//
//  NTMath.h
//  RenderEngine
//
//  Created by Nate on 12/8/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <simd/simd.h>

float radians(const float degrees);

extern matrix_float4x4 __attribute__((overloadable)) NTTransformScale(const float x,
                     const float y,
                     const float z);

extern matrix_float4x4 __attribute__((overloadable)) NTTransformScale(const vector_float3 s);

extern matrix_float4x4 __attribute__((overloadable)) NTTransformTranslate(const float x,
                         const float y,
                         const float z);

extern matrix_float4x4 __attribute__((overloadable)) NTTransformTranslate(const vector_float3 t);

extern matrix_float4x4 __attribute__((overloadable)) NTTransformRotate(const float angle,
                      const float x,
                      const float y,
                      const float z);

extern matrix_float4x4 __attribute__((overloadable)) NTTransformRotate(const float angle,
                      const vector_float3 u);


extern matrix_float4x4 __attribute__((overloadable)) NTTransformPerspective(const float width,
                           const float height,
                           const float near,
                           const float far);

extern matrix_float4x4 __attribute__((overloadable)) NTTransformPerspective_fov(const float fovy,
                               const float aspect,
                               const float near,
                               const float far);

extern matrix_float4x4 __attribute__((overloadable)) NTTransformPerspective_fov(const float fovy,
                               const float width,
                               const float height,
                               const float near,
                               const float far);

extern vector_float4 NTVectorFloat4Zero();
extern vector_float3 NTVectorFloat3Zero();
extern vector_float2 NTVectorFloat2Zero();

extern void __attribute__((overloadable)) NTTransformModelViewProjection(matrix_float4x4 model, matrix_float4x4 view, matrix_float4x4 projection, matrix_float4x4 *normalMatrix, matrix_float4x4 *mvp);