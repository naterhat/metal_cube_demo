//
//  NTTexture.h
//  RenderEngine
//
//  Created by Nate on 11/16/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Metal/Metal.h>

@interface NTTexture : NSObject

+ (id<MTLTexture>)textureWithResourceName:(NSString *)name withDevice:(id<MTLDevice>)device;

@end
