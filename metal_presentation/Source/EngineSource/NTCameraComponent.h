//
//  NTCamera.h
//  collision_detection_demo
//
//  Created by Nate on 10/19/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTComponent.h"
#import <CoreGraphics/CoreGraphics.h>
#import <simd/simd.h>

typedef struct{
    vector_float3 positon;
} NTCameraT;

NTCameraT NTCameraTDefault();

@interface NTCameraComponent : NTComponent
@property (nonatomic, readonly) NTCameraT camera;
@property (nonatomic) CGSize size;
@property (nonatomic, readonly) matrix_float4x4 projection;
@property (nonatomic, readonly) matrix_float4x4 view;
+ (NTCameraComponent *)mainCamera;
- (instancetype)initWithSize:(CGSize)size;
//- (NTCameraT *)cameraPointer;

//- (vector_float3)positionFromScreenSpaceToWorldSpaceWithPoint:(vector_float2)touchPoint distance:(float)distance;

@end
