//
//  NTTextureQuadMeshComponent.m
//  RenderEngine
//
//  Created by Nate on 11/16/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTTextureQuadMeshComponent.h"

const int kCount = 10;

//float quadEdges2[kCount * 6] = {
//    -1.0, -1.0, 0.0, 1,   0, 0, -1, 1,   0, 0,
//    -1.0,  1.0, 0.0, 1,   0, 0, -1, 1,   0, 1,
//    1.0,  1.0, 0.0, 1,   0, 0, -1, 1,   1, 1,
//    
//    1.0, -1.0, 0.0, 1,   0, 0, -1, 1,   1, 0,
//    -1.0, -1.0, 0.0, 1,   0, 0, -1, 1,   0, 0,
//    1.0,  1.0, 0.0, 1,   0, 0, -1, 1,   1, 1,
//};

float quadEdges2[kCount * 4] = {
//    // front
    -1.0,  1.0, 0.0, 1,   0, 0, -1, 1,   0, 1,
     1.0,  1.0, 0.0, 1,   0, 0, -1, 1,   1, 1,
     1.0, -1.0, 0.0, 1,   0, 0, -1, 1,   1, 0,
    -1.0, -1.0, 0.0, 1,   0, 0, -1, 1,   0, 0
};

int16_t indexEdges2[6] = {
    3, 0, 1,
    2, 3, 1
};

@implementation NTTextureQuadMeshComponent

- (void *)vertexData
{
    return quadEdges2;
}

- (NSUInteger)vertexCount
{
    return sizeof(quadEdges2)/(sizeof(float) * kCount);
}

- (NSUInteger)vertexTotalSize
{
    return sizeof(quadEdges2);
}

//- (void *)indexData
//{
//    return NULL;
//}
//
//- (NSUInteger)indexCount
//{
//    return 0;
//}
//
//- (NSUInteger)indexTotalSize
//{
//    return 0;
//}

- (void *)indexData
{
    return indexEdges2;
}

- (NSUInteger)indexCount
{
    return sizeof(indexEdges2) / sizeof(int16_t);
}

- (NSUInteger)indexTotalSize
{
    return sizeof(indexEdges2);
}

- (MTLIndexType)indexType
{
    return MTLIndexTypeUInt16;
}

@end
