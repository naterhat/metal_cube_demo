//
//  NTMeshComponent.h
//  collision_detection_demo
//
//  Created by Nate on 10/19/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTComponent.h"
#import <Metal/Metal.h>

@class OBJModel;

@protocol NTMeshProtocol <NSObject>

- (void *)vertexData;
- (NSUInteger)vertexCount;
- (NSUInteger)vertexTotalSize;
- (void *)indexData;
- (NSUInteger)indexCount;
- (NSUInteger)indexTotalSize;
- (MTLIndexType)indexType;

@end

@interface NTMeshComponent : NTComponent<NTMeshProtocol>
- (instancetype)initWithContentsOfURL:(NSURL *)url;
@end




