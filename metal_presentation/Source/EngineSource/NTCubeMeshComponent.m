//
//  NTCubeMeshComponent.m
//  collision_detection_demo
//
//  Created by Nate on 10/19/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTCubeMeshComponent.h"




float cubeEdges2[6 * 6 * 8] =
{

    // Data layout for each line below is:
    // positionX, positionY, positionZ,     normalX, normalY, normalZ,
    // Bottom
     0.5, -0.5,  0.5, 1.0,   0.0, -1.0,  0.0, 1.0,
    -0.5, -0.5,  0.5, 1.0,   0.0, -1.0, 0.0, 1.0,
    -0.5, -0.5, -0.5, 1.0,  0.0, -1.0,  0.0, 1.0,
    
     0.5, -0.5, -0.5, 1.0,  0.0, -1.0,  0.0, 1.0,
     0.5, -0.5,  0.5, 1.0,   0.0, -1.0,  0.0, 1.0,
    -0.5, -0.5, -0.5, 1.0,  0.0, -1.0,  0.0, 1.0,

    // Left
    0.5, 0.5, 0.5, 1.0,    1.0, 0.0,  0.0, 1.0,
    0.5, -0.5, 0.5, 1.0,   1.0,  0.0,  0.0, 1.0,
    0.5, -0.5, -0.5, 1.0,  1.0,  0.0,  0.0, 1.0,
    
    0.5, 0.5, -0.5, 1.0,   1.0, 0.0,  0.0, 1.0,
    0.5, 0.5, 0.5, 1.0,    1.0, 0.0,  0.0, 1.0,
    0.5, -0.5, -0.5, 1.0,  1.0,  0.0,  0.0, 1.0,

    // Top
    -0.5, 0.5, 0.5, 1.0,    0.0, 1.0,  0.0, 1.0,
     0.5, 0.5, 0.5, 1.0,    0.0, 1.0,  0.0, 1.0,
     0.5, 0.5, -0.5, 1.0,   0.0, 1.0,  0.0, 1.0,
    
    -0.5, 0.5, -0.5, 1.0,   0.0, 1.0,  0.0, 1.0,
    -0.5, 0.5, 0.5, 1.0,    0.0, 1.0,  0.0, 1.0,
     0.5, 0.5, -0.5, 1.0,   0.0, 1.0,  0.0, 1.0,

    // Right
    -0.5, -0.5, 0.5, 1.0,  -1.0,  0.0, 0.0, 1.0,
    -0.5, 0.5, 0.5, 1.0,   -1.0, 0.0,  0.0, 1.0,
    -0.5, 0.5, -0.5, 1.0,  -1.0, 0.0,  0.0, 1.0,
    
    -0.5, -0.5, -0.5, 1.0, -1.0,  0.0,  0.0, 1.0,
    -0.5, -0.5, 0.5, 1.0,  -1.0,  0.0, 0.0, 1.0,
    -0.5, 0.5, -0.5, 1.0,  -1.0, 0.0,  0.0, 1.0,

    // Front
     0.5, 0.5,  0.5, 1.0,  0.0, 0.0,  1.0, 1.0,
    -0.5, 0.5,  0.5, 1.0,  0.0, 0.0,  1.0, 1.0,
    -0.5, -0.5, 0.5, 1.0,  0.0,  0.0, 1.0, 1.0,
    
    -0.5, -0.5, 0.5, 1.0,  0.0,  0.0, 1.0, 1.0,
     0.5, -0.5, 0.5, 1.0,  0.0,  0.0,  1.0, 1.0,
     0.5, 0.5,  0.5, 1.0,  0.0, 0.0,  1.0, 1.0,

    // back
     0.5, -0.5, -0.5, 1.0,  0.0,  0.0, -1.0, 1.0,
    -0.5, -0.5, -0.5, 1.0,  0.0,  0.0, -1.0, 1.0,
    -0.5, 0.5, -0.5, 1.0,   0.0, 0.0, -1.0, 1.0,
    
     0.5, 0.5, -0.5, 1.0,   0.0, 0.0, -1.0, 1.0,
     0.5, -0.5, -0.5, 1.0,  0.0,  0.0, -1.0, 1.0,
    -0.5, 0.5, -0.5, 1.0,   0.0, 0.0, -1.0, 1.0,
};

@implementation NTCubeMeshComponent

- (void *)vertexData
{
    return cubeEdges2;
}

- (NSUInteger)vertexCount
{
    static size_t vertexCount = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vertexCount = sizeof(cubeEdges2)/(sizeof(float) * 8);
    });
    
    return vertexCount;
}

- (NSUInteger)vertexTotalSize
{
    static size_t vertexTotalSize = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vertexTotalSize = sizeof(cubeEdges2);
    });

    return vertexTotalSize;
}

- (void *)indexData
{
    return NULL;
}

- (NSUInteger)indexCount
{
    return 0;
}

- (NSUInteger)indexTotalSize
{
    return 0;
}

- (MTLIndexType)indexType
{
    return MTLIndexTypeUInt16;
}


@end
