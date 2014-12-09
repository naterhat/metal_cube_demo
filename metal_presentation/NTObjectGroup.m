//
//  NTObjectGroup.m
//  RenderEngine
//
//  Created by Nate on 12/7/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTObjectGroup.h"
#import <Metal/Metal.h>

@interface NTObjectGroup ()
@property (nonatomic) NSMutableArray *mArray;
@property (nonatomic) id<MTLBuffer> vertexBuffer;
@property (nonatomic) id<MTLBuffer> uniformBuffer;
@end

@implementation NTObjectGroup

+ (instancetype)groupWithName:(NSString *)name
{
    NTObjectGroup *group = [[NTObjectGroup alloc] initWithName:name];
    return group;
}

- (instancetype)initWithName:(NSString *)name
{
    if(self = [self init]) {
        _name = name;
    } return self;
}

#pragma mark -
#pragma mark - Override Functions

- (instancetype)init
{
    if(self = [super init]) {
        _mArray = [NSMutableArray array];
    } return self;
}

- (NSUInteger)count
{
    return [self.mArray count];
}

- (id)objectAtIndex:(NSUInteger)index
{
    return [self.mArray objectAtIndex:index];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    return [self.mArray insertObject:anObject atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    [self.mArray removeObjectAtIndex:index];
}

- (void)addObject:(id)anObject
{
    [self.mArray addObject:anObject];
}

- (void)removeLastObject
{
    [self.mArray removeLastObject];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    [self.mArray replaceObjectAtIndex:index withObject:anObject];
}

@end
