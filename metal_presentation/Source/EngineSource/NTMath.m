//
//  NTMath.m
//  RenderEngine
//
//  Created by Nate on 12/8/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTMath.h"

static const float kPi_f      = (float)M_PI;
static const float k1Div180_f = 1.0f / 180.0f;
static const float kRadians   = k1Div180_f * kPi_f;


float NTTransformRadians(const float degrees)
{
    return kRadians * degrees;
} // radians

#pragma mark -
#pragma mark Public - Transformations - Scale

matrix_float4x4 __attribute__((overloadable)) NTTransformScale(const float x,
                           const float y,
                           const float z)
{
    vector_float4 v = {x, y, z, 1.0f};
    return matrix_from_diagonal(v);
} // scale

matrix_float4x4 __attribute__((overloadable)) NTTransformScale(const vector_float3 s)
{
    vector_float4 v = {s.x, s.y, s.z, 1.0f};
    return matrix_from_diagonal(v);
} // scale

#pragma mark -
#pragma mark Public - Transformations - Translate

matrix_float4x4 __attribute__((overloadable)) NTTransformTranslate(const vector_float3 t)
{
    matrix_float4x4 M = matrix_identity_float4x4;
    
    M.columns[3].xyz = t;
    
    return M;
} // translate

matrix_float4x4 __attribute__((overloadable)) NTTransformTranslate(const float x,
                               const float y,
                               const float z)
{
    return NTTransformTranslate((vector_float3){x,y,z});
} // translate

#pragma mark -
#pragma mark Public - Transformations - Rotate

static float AAPLRadiansOverPi(const float degrees)
{
    return (degrees * k1Div180_f);
} // AAPLRadiansOverPi

matrix_float4x4 __attribute__((overloadable)) NTTransformRotate(const float angle,
                            const vector_float3 r)
{
    float a = AAPLRadiansOverPi(angle);
    float c = 0.0f;
    float s = 0.0f;
    
    // Computes the sine and cosine of pi times angle (measured in radians)
    // faster and gives exact results for angle = 90, 180, 270, etc.
    __sincospif(a, &s, &c);
    
    float k = 1.0f - c;
    
    vector_float3 u;
    if(r.x == 0 && r.y == 0 && r.z == 0){
        u = (vector_float3){0, 0, 0};
    } else {
        u = vector_normalize(r);
    }
    vector_float3 v = s * u;
    vector_float3 w = k * u;
    
    vector_float4 P;
    vector_float4 Q;
    vector_float4 R;
    vector_float4 S;
    
    P.x = w.x * u.x + c;
    P.y = w.x * u.y + v.z;
    P.z = w.x * u.z - v.y;
    P.w = 0.0f;
    
    Q.x = w.x * u.y - v.z;
    Q.y = w.y * u.y + c;
    Q.z = w.y * u.z + v.x;
    Q.w = 0.0f;
    
    R.x = w.x * u.z + v.y;
    R.y = w.y * u.z - v.x;
    R.z = w.z * u.z + c;
    R.w = 0.0f;
    
    S.x = 0.0f;
    S.y = 0.0f;
    S.z = 0.0f;
    S.w = 1.0f;
    
    
    return matrix_from_columns(P, Q, R, S);
} // rotate

matrix_float4x4 __attribute__((overloadable)) NTTransformRotate(const float angle,
                            const float x,
                            const float y,
                            const float z)
{
    vector_float3 r = {x, y, z};
    
    return NTTransformRotate(angle, r);
} // rotate




#pragma mark -
#pragma mark Public - Transformations - Perspective

matrix_float4x4 __attribute__((overloadable)) NTTransformPerspective(const float width,
                                 const float height,
                                 const float near,
                                 const float far)
{
    float zNear = 2.0f * near;
    float zFar  = far / (far - near);
    
    vector_float4 P;
    vector_float4 Q;
    vector_float4 R;
    vector_float4 S;
    
    P.x = zNear / width;
    P.y = 0.0f;
    P.z = 0.0f;
    P.w = 0.0f;
    
    Q.x = 0.0f;
    Q.y = zNear / height;
    Q.z = 0.0f;
    Q.w = 0.0f;
    
    R.x = 0.0f;
    R.y = 0.0f;
    R.z = zFar;
    R.w = 1.0f;
    
    S.x =  0.0f;
    S.y =  0.0f;
    S.z = -near * zFar;
    S.w =  0.0f;
    
    return matrix_from_columns(P, Q, R, S);
} // perspective

matrix_float4x4 __attribute__((overloadable)) NTTransformPerspective_fov(const float fovy,
                                     const float aspect,
                                     const float near,
                                     const float far)
{
    float angle  = NTTransformRadians(0.5f * fovy);
    float yScale = 1.0f/ tan(angle);
    float xScale = yScale / aspect;
    float zScale = far / (far - near);
    
    vector_float4 P;
    vector_float4 Q;
    vector_float4 R;
    vector_float4 S;
    
    P.x = xScale;
    P.y = 0.0f;
    P.z = 0.0f;
    P.w = 0.0f;
    
    Q.x = 0.0f;
    Q.y = yScale;
    Q.z = 0.0f;
    Q.w = 0.0f;
    
    R.x = 0.0f;
    R.y = 0.0f;
    R.z = zScale;
    R.w = 1.0f;
    
    S.x =  0.0f;
    S.y =  0.0f;
    S.z = -near * zScale;
    S.w =  0.0f;
    
    return matrix_from_columns(P, Q, R, S);
} // perspective_fov

matrix_float4x4 __attribute__((overloadable)) NTTransformPerspective_fov(const float fovy,
                                     const float width,
                                     const float height,
                                     const float near,
                                     const float far)
{
    float aspect = width / height;
    
    return NTTransformPerspective_fov(fovy, aspect, near, far);
} // perspective_fov


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


void __attribute__((overloadable)) NTTransformModelViewProjection(matrix_float4x4 model, matrix_float4x4 view, matrix_float4x4 projection, matrix_float4x4 *normalMatrix, matrix_float4x4 *mvp)
{
    // view model
    matrix_float4x4 viewModel = matrix_multiply(view, model);
    
    // pvm (projection view model)
    matrix_float4x4 pvm = matrix_multiply(projection, viewModel);
    
    // set uniforms
    *mvp = pvm;
    if(normalMatrix) *normalMatrix = matrix_invert( matrix_transpose( viewModel ));
}




