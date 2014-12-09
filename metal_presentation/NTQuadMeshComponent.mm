//
//  NTQuadMeshComponent.m
//  RenderEngine
//
//  Created by Nate on 11/15/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTQuadMeshComponent.h"

float quadEdges[8 * 6] = {
    
    // front
//    -1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
//     1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
//    -1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
//    
//     1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
//    -1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
//     1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
    
    -1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
     1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
    -1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
    
     1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
     1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
    -1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
    
//    -1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
//    -1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
//     1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
    
//     1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
//     1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
//    -1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
};

//float quadEdges[8 * 4] = {
//    
//    // front
//    -1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
//     1.0,   1.0, 0.0, 1,  0, 0, -1, 1,
//     1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
//    -1.0,  -1.0, 0.0, 1,  0, 0, -1, 1,
//};
//
//int16_t indexEdges[6] = {
//    3, 0, 1,
//    2, 3, 1
//};

@implementation NTQuadMeshComponent

- (void *)vertexData
{
    return quadEdges;
}

- (NSUInteger)vertexCount
{
    return sizeof(quadEdges)/(sizeof(float) * 8);
}

- (NSUInteger)vertexTotalSize
{
    return sizeof(quadEdges);
}

//- (void *)indexData
//{
//    return indexEdges;
//}
//
//- (NSUInteger)indexCount
//{
//    return sizeof(indexEdges) / sizeof(int16_t);
//}
//
//- (NSUInteger)indexTotalSize
//{
//    return sizeof(indexEdges);
//}


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
