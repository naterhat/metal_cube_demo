//
//  NTRayMeshComponent.m
//  RenderEngine
//
//  Created by Nate on 11/28/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTRayMeshComponent.h"
#import "NTConversion.h"

@interface NTRayMeshComponent ()
{
    void *_vertices;
    size_t _verticesTotalSize;
}
@end

@implementation NTRayMeshComponent

- (void)dealloc
{
    if(_vertices) free(_vertices);
}

- (void *)vertexData
{
    if(_vertices) return _vertices;
    
    // allocate memory for the vertices
    _verticesTotalSize = sizeof(Vertex) * 2;
    _vertices = malloc(_verticesTotalSize);
    
    [self setPointA:(vector_float3){0, 0, 0} pointB:(vector_float3){0, 0, 1}];
    
    return _vertices;
}

- (void)setPointA:(vector_float3)pointA pointB:(vector_float3)pointB
{
    if (!_vertices) {
        
        // allocate memory for the vertices
        _verticesTotalSize = sizeof(Vertex) * 2;
        _vertices = malloc(_verticesTotalSize);
    }
    
    Vertex v;
    v.position = (vector_float4) {pointA.x, pointA.y, pointA.z, 1};
    v.normal = (vector_float4){0, 0, -1, 1};
    ((Vertex *)_vertices)[0] = v;
    
    v.position = (vector_float4) {pointB.x, pointB.y, pointB.z, 1};
    v.normal = (vector_float4){0, 0, -1, 1};
    ((Vertex *)_vertices)[1] = v;
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
