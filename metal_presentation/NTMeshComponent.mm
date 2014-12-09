//
//  NTMeshComponent.m
//  collision_detection_demo
//
//  Created by Nate on 10/19/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTMeshComponent.h"
#import "OBJModel.h"

@interface NTMeshComponent ()
@property (nonatomic) OBJModel *model;
@property (nonatomic) OBJGroup *group;
@end

@implementation NTMeshComponent

- (instancetype)init
{
    if(self = [super init]){
        
    } return self;
}

- (instancetype)initWithContentsOfURL:(NSURL *)url
{
    if(self = [super init]){
        _model = [[OBJModel alloc] initWithContentsOfURL:url];
        _group = [_model groupAtIndex:1];
        if(!_group) _group = [_model groupAtIndex:0];
    } return self;
}

- (NSUInteger)vertexCount
{
    return _group->vertexCount;
}

- (void *)vertexData
{
    return _group->vertices;
}

- (NSUInteger)vertexTotalSize
{
    return _group->vertexCount * sizeof(Vertex);
}


- (void *)indexData
{
    return _group->indices;
}

- (NSUInteger)indexCount
{
    return _group->indexCount;
}

- (NSUInteger)indexTotalSize
{
    return _group->indexCount * sizeof(IndexType);
}

- (MTLIndexType)indexType
{
    return MTLIndexTypeUInt16;
}



@end
