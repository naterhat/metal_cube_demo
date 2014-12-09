//
//  NTComponent.h
//  collision_detection_demo
//
//  Created by Nate on 10/19/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NTObject;

@interface NTComponent : NSObject
@property (nonatomic, assign) NTObject *parent;
@property (nonatomic) BOOL activated;

+ (instancetype)component;

- (void)update;

@end
