//
//  NTObjectGroup.h
//  RenderEngine
//
//  Created by Nate on 12/7/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NTObjectGroup : NSMutableArray
@property (nonatomic) NSString *name;
+ (instancetype)groupWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name;
@end
