//
//  NTObject.h
//  collision_detection_demo
//
//  Created by Nate on 10/19/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTComponent.h"
#import <simd/simd.h>

@interface NTTransformComponent : NTComponent
@property (nonatomic) vector_float3 position;
@property (nonatomic) vector_float3 rotation;
@property (nonatomic) vector_float3 scale;
- (void)setPositionWithX:(float)x Y:(float)y Z:(float)z;
- (void)setScaleWithFloat:(float)scale;
- (matrix_float4x4)transform;
- (matrix_float4x4)positionMatrix;
- (matrix_float4x4)rotationMatrix;
- (matrix_float4x4)scaleMatrix;
@end
