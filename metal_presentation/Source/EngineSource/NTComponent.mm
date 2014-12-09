//
//  NTComponent.m
//  collision_detection_demo
//
//  Created by Nate on 10/19/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTComponent.h"

@implementation NTComponent

- (instancetype)init
{
    if (self = [super init]) {
        _activated = YES;
    } return self;
}

+ (instancetype)component
{
    return [[self alloc] init];
}

- (void)update
{
    
}

@end
