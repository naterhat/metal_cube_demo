//
//  NTMeshProtocol.h
//  RenderEngine
//
//  Created by Nate on 12/8/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Metal/Metal.h>

@protocol NTMeshProtocol <NSObject>

- (void *)vertexData;
- (NSUInteger)vertexCount;
- (NSUInteger)vertexTotalSize;
- (void *)indexData;
- (NSUInteger)indexCount;
- (NSUInteger)indexTotalSize;
- (MTLIndexType)indexType;

@end
