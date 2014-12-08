//
//  NTMetalView.m
//  metal_presentation
//
//  Created by Nate on 12/7/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTMetalView.h"

@import QuartzCore.CAMetalLayer;

@implementation NTMetalView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (Class)layerClass
{
    return [CAMetalLayer class];
}

@end
