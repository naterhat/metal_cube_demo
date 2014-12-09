//
//  NTTexture.m
//  RenderEngine
//
//  Created by Nate on 11/16/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTTexture.h"
#import <UIKit/UIImage.h>
#import <CoreGraphics/CoreGraphics.h>

@implementation NTTexture

+ (id<MTLTexture>)textureWithResourceName:(NSString *)name withDevice:(id<MTLDevice>)device
{
    UIImage *image = [UIImage imageNamed:name];
    
    // create a suitable bitmap context for extracting the bits of the image
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGRect bounds = CGRectMake(0, 0, width, height);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    uint8_t *rawData = (uint8_t *)calloc(height * width * 4, sizeof(uint8_t));
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height, bitsPerComponent, bytesPerRow, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    
    CGColorSpaceRelease(colorSpace);
    
    CGContextClearRect(context, bounds);
    
    // Flip the context so the position Y axis points down
    CGContextTranslateCTM(context, 0, height);
    CGContextScaleCTM(context, 1, -1);
    
    // Draw image to context
    CGContextDrawImage(context, bounds, imageRef);
    
    // create texture descriptor
    MTLTextureDescriptor *textureDescriptor = [MTLTextureDescriptor texture2DDescriptorWithPixelFormat:MTLPixelFormatRGBA8Unorm
                                                                                                 width:width
                                                                                                height:height
                                                                                             mipmapped:NO];
    
    
    // this created the texture object (the container), BUT didn't pass the data / store the data inside the container.
    id<MTLTexture> texture = [device newTextureWithDescriptor:textureDescriptor];
    
    MTLRegion region = MTLRegionMake2D(0, 0, width, height);
    
    // set texture with raw data
    [texture replaceRegion:region mipmapLevel:0 withBytes:rawData bytesPerRow:bytesPerRow];
    
    // release
    CGContextRelease(context);
    
    return texture;
}

@end
