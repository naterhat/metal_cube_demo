//
//  ViewController.m
//  metal_presentation
//
//  Created by Nate on 12/7/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "ViewController.h"

@import Metal;
@import QuartzCore.CADisplayLink;
@import QuartzCore.CAMetalLayer;

@interface ViewController ()
{
    // setup
    CAMetalLayer *_layer;
    id<MTLDevice> _device;
    id<MTLLibrary> _library;
    id<MTLCommandQueue> _commandQueue;
    id<MTLRenderPipelineState> _renderPipeline;
    id<MTLDepthStencilState> _depthState;
    id<MTLTexture> _depthTexture;
    id<MTLBuffer> _vertexBuffer;
    id<MTLBuffer> _indexBuffer;    
    
    // per frame
    id<MTLCommandBuffer> _commandBuffer;
    id<MTLCommandEncoder> _commandEncoder;
    id<MTLDrawable> _drawable;
}
@property (nonatomic) CADisplayLink *ticker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _ticker = [CADisplayLink displayLinkWithTarget:self selector:@selector(perFrame)];
}

- (void)setup
{
    
}

- (void)beginRenderPass
{
    
}

- (void)setupRenderPipeline
{
    
}

- (void)draw
{
    
}

- (void)endRenderPass
{
    
}

- (void)commit
{
    
}

- (void)perFrame
{
    
}

@end
