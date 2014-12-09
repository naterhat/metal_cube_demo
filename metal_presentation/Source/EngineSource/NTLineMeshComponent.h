//
//  NTLineMeshComponent.h
//  RenderEngine
//
//  Created by Nate on 11/17/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTMeshComponent.h"
#import <simd/simd.h>

@interface NTLineMeshComponent : NTComponent <NTMeshProtocol>
- (void)setPointsWithBegin:(vector_float3)begin handle1:(vector_float3)handle1 handl2:(vector_float3)handle2 end:(vector_float3)end division:(NSUInteger)division;
@end
