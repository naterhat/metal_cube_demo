//
//  NTCamera.m
//  collision_detection_demo
//
//  Created by Nate on 10/19/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTCameraComponent.h"
#import "NTConversion.h"
#import "NTMath.h"

NTCameraT NTCameraTDefault()
{
    NTCameraT camera;
    camera.positon = (vector_float3){0, 0, 0};
    return camera;
}

@implementation NTCameraComponent
@synthesize view = _view;

+ (NSMutableArray *)cameras
{
    static NSMutableArray *cameras = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cameras = [NSMutableArray array];
    });
    
    return cameras;
}

- (void)dealloc
{
    [[[self class] cameras] removeObject:self];
}

- (instancetype)initWithSize:(CGSize)size
{
    if(self = [super init]) {
        // get mvp
        [self setSize:size];
        _camera = NTCameraTDefault();
        [[[self class] cameras] addObject:self];
    } return self;
}

- (void)setSize:(CGSize)size
{
    _size = size;
    float aspect = fabsf(size.width / size.height);
    _projection = NTTransformPerspective_fov(60.0f, aspect, .1f, 100.0f);
}

+ (NTCameraComponent *)mainCamera
{
    return [[self cameras] firstObject];
}

- (matrix_float4x4)view
{
    return _view;
}

//- (vector_float3)positionFromScreenSpaceToWorldSpaceWithPoint:(vector_float2)touchPoint distance:(float)distance
//{
//    vector_float3 rayDirection = NTRayDirectionFromScreenToWorldSpace(touchPoint, self.size, self.projection, self.view);
//    
//    return rayDirection * distance + self.parent.transform.position;
//}

@end
