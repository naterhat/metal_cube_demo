//
//  NTSpherePlaneMeshComponent.h
//  RenderEngine
//
//  Created by Nate on 11/28/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTComponent.h"
#import "NTMeshComponent.h"

@interface NTSpherePlaneMeshComponent : NTComponent <NTMeshProtocol>
/**
 *  The higher the division is set the smoother the circle gets.
 */
- (void)setDivision:(NSUInteger)division;
@end
