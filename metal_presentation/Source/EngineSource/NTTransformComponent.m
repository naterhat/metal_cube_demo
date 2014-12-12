//
//  NTObject.m
//  collision_detection_demo
//
//  Created by Nate on 10/19/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTTransformComponent.h"
#import "NTUtilities.h"
#import "NTMath.h"

@interface NTTransformComponent ()
{
    matrix_float4x4 _matrix;
    matrix_float4x4 _translationMatrix;
    matrix_float4x4 _rotationMatrix;
    matrix_float4x4 _scaleMatrix;
}
@end

@implementation NTTransformComponent
@synthesize position = _position;

- (instancetype)init
{
    if(self =[super init]){
        [self setPosition:(vector_float3){0, 0, 0}];
        [self setScale:(vector_float3){1, 1, 1}];
        [self setRotation:(vector_float3){0, 0, 0}];
    } return self;
}

- (void)setPosition:(vector_float3)position
{
    _position = position;
    _translationMatrix = NTTransformTranslate(_position);
}

/*
 * Pass degree for the x, y, and z value.
 */
- (void)setRotation:(vector_float3)rotation
{
    _rotation = rotation;
    
    matrix_float4x4 xAxis = NTTransformRotate(_rotation.x, 1, 0, 0);
    matrix_float4x4 yAxis = NTTransformRotate(_rotation.y, 0, 1, 0);
    matrix_float4x4 zAxis = NTTransformRotate(_rotation.z, 0, 0, 1);
    
    _rotationMatrix = matrix_multiply( matrix_multiply(zAxis, yAxis), xAxis);
}

- (void)setScale:(vector_float3)scale
{
    _scale = scale;
    _scaleMatrix = NTTransformScale(_scale);
}

- (matrix_float4x4)transform
{
    matrix_float4x4 m = matrix_multiply(matrix_multiply(_translationMatrix, _rotationMatrix), _scaleMatrix);
    return m;
}

- (matrix_float4x4)positionMatrix
{
    return _translationMatrix;
}

- (matrix_float4x4)rotationMatrix
{
    return _rotationMatrix;
}

- (matrix_float4x4)scaleMatrix
{
    return _scaleMatrix;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\n%@\n",  NSStringFromMatrix([self transform])];
}

#pragma mark -
#pragma mark - Extra Set Functions

- (void)setScaleWithFloat:(float)scale
{
    [self setScale: (vector_float3){scale, scale, scale}];
}

- (void)setPositionWithX:(float)x Y:(float)y Z:(float)z
{
    [self setPosition:(vector_float3){x, y, z}];
}

@end
