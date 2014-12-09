//
//  NTSpherePlaneMeshComponent.m
//  RenderEngine
//
//  Created by Nate on 11/28/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTSpherePlaneMeshComponent.h"
#import "NTConversion.h"
#import "NTSharedDataTypes.h"

#define kFullCircleRadian M_PI * 2

@interface NTSpherePlaneMeshComponent ()
{
    void *_vertices;
//    void *_indices;
    
    size_t _verticesTotalSize;
//    size_t _indicesTotalSize;
}
@end

@implementation NTSpherePlaneMeshComponent

- (void)dealloc
{
    if(_vertices) free(_vertices);
//    if(_indices) free(_indices);
}

- (void *)vertexData
{
    if(_vertices) return _vertices;
    
    [self setDivision:20];
    
    return _vertices;
}

- (void)setDivision:(NSUInteger)division
{
    if(_vertices) {
        free(_vertices);
        _vertices = NULL;
    }
    
    const NSUInteger axis = 3;
    
    // allocate memory for the vertices
    _verticesTotalSize = (division) * sizeof(Vertex) * axis * 2;
    _vertices = malloc(_verticesTotalSize);
    
    [self setVerices:_vertices offset:0 forAxis:0 withDivision:division];
    [self setVerices:_vertices offset:(division * 2) forAxis:1 withDivision:division];
    [self setVerices:_vertices offset:(division * 2) * 2 forAxis:2 withDivision:division];
}

- (void)setVerices:(Vertex *)vertices offset:(NSUInteger)offset forAxis:(NSUInteger)axis withDivision:(NSUInteger)division
{
    float radius = 1;
    for (int i = 0; i < division; i++) {
        float radian1 = ((float)i / (float)division) * kFullCircleRadian;
        float radian2 = ((float)(i+1) / (float)division) * kFullCircleRadian;
        
        vector_float4 position1 = (vector_float4){0, 0, 0, 0};
        vector_float4 position2 = (vector_float4){0, 0, 0, 0};
        switch (axis) {
            case 0:
                position1 = (vector_float4){sin(radian1) * radius, cos(radian1) * radius, 0, 1};
                position2 = (vector_float4){sin(radian2) * radius, cos(radian2) * radius, 0, 1};
                break;
            case 1:
                position1 = (vector_float4){0, cos(radian1) * radius, sin(radian1) * radius, 1};
                position2 = (vector_float4){0, cos(radian2) * radius, sin(radian2) * radius, 1};
                break;
            case 2:
                position1 = (vector_float4){cos(radian1) * radius, 0, sin(radian1) * radius, 1};
                position2 = (vector_float4){cos(radian2) * radius, 0, sin(radian2) * radius, 1};
                break;
        }
        
        NSUInteger offset2 = offset + (i * 2);
        
        
        Vertex v;
        v.position = position1;
        v.normal = (vector_float4){0, 0, -1, 1};
        ((Vertex *)_vertices)[offset2] = v;
        
        v.position = position2;
        v.normal = (vector_float4){0, 0, -1, 1};
        ((Vertex *)_vertices)[offset2 + 1] = v;
    }
}

- (NSUInteger)vertexCount
{
    return _verticesTotalSize / sizeof(Vertex);
}

- (NSUInteger)vertexTotalSize
{
    return _verticesTotalSize;
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
