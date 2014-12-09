//
//  NTRayMeshComponent.h
//  RenderEngine
//
//  Created by Nate on 11/28/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTComponent.h"
#import "NTMeshComponent.h"
#import <simd/simd.h>

@interface NTRayMeshComponent : NTComponent <NTMeshProtocol>
- (void)setPointA:(vector_float3)pointA pointB:(vector_float3)pointB;
@end
