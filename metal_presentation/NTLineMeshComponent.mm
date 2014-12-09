//
//  NTLineMeshComponent.m
//  RenderEngine
//
//  Created by Nate on 11/17/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTLineMeshComponent.h"
#import <CoreGraphics/CoreGraphics.h>
#import "NTShared.h"
#import <vector>

using namespace std;

float bezierCurve(float t, float P0,
               float P1, float P2, float P3) {
    // Cubic bezier Curve
    float point = (pow((1-t), 3.0) * P0) +
    (3 * pow((1-t),2) * t * P1) +
    (3 * (1-t) * t * t * P2) +
    (pow(t, 3) * P3);
    return point;
}

@interface NTLineMeshComponent ()
{
    vector<Vertex> _points3;
}

@end

@implementation NTLineMeshComponent

- (instancetype)init
{
    if ( self = [super init] ) {
        
        _points3 = vector<Vertex>();
        
        // add points
        for (int i = 0; i < 10 ; i++) {
            float rate = (float)i / 10.0;
            
            Vertex v;
            v.position = (vector_float4) { rate, rate, 0, 1 };
            v.normal = (vector_float4) { 0, 0, -1, 1 };
            _points3.push_back(v);
        }
        
    } return self;
}

- (void *)vertexData
{
    return _points3.data();
}

- (NSUInteger)vertexCount
{
    return _points3.size();
}

- (NSUInteger)vertexTotalSize
{
    return _points3.size() * sizeof(Vertex);
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

- (void)setPointsWithBegin:(vector_float3)begin handle1:(vector_float3)handle1 handl2:(vector_float3)handle2 end:(vector_float3)end division:(NSUInteger)division
{
    _points3.clear();
    
    for (int i = 0; i <= division; i++) {
        float pos = (float) i / division;
        float x = bezierCurve(pos, begin.x, handle1.x, handle2.x, end.x);
        float y = bezierCurve(pos, begin.y, handle1.y, handle2.y, end.y);
        // In our case, the z should always be empty
        float z = bezierCurve(pos, begin.z, handle1.z, handle2.z, end.z);
        
        NSLog(@"p: %f %f %f", x, y, z);
        
        Vertex v;
        v.position = (vector_float4) {x, y, z, 1};
        v.normal = (vector_float4) {0,0,-1,1};
        _points3.push_back(v);
    }
    
    
}

@end
