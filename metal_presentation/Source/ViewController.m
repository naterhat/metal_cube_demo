//
//  ViewController.m
//  metal_presentation
//
//  Created by Nate on 12/7/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "ViewController.h"
#import "NTSharedDataTypes.h"
#import "NTCubeMeshComponent.h"
#import "NTTransformComponent.h"
#import "NTCameraComponent.h"

@import Metal;
@import QuartzCore.CADisplayLink;
@import QuartzCore.CAMetalLayer;

@interface ViewController ()
{
    // setup
    CAMetalLayer *_metalLayer;
    id<MTLDevice> _device;
    id<MTLLibrary> _library;
    id<MTLCommandQueue> _commandQueue;
    id<MTLRenderPipelineState> _renderPipeline;
    id<MTLDepthStencilState> _depthState;
    
    id<MTLBuffer> _vertexBuffer;
    id<MTLBuffer> _indexBuffer;
    id<MTLBuffer> _uniformBuffer;
    
    NTTransformComponent *_transformComponent;
    NTCameraComponent *_cameraComponent;
    Uniform _uniform;
    
    
    // per frame
    id<MTLCommandBuffer> _commandBuffer;
    id<MTLRenderCommandEncoder> _commandEncoder;
    id<CAMetalDrawable> _drawable;
    id<MTLTexture> _depthTexture; // will be initialize in render pass setup
    MTLRenderPassDescriptor *_renderPassDescriptor;
    
    NTComponent<NTMeshProtocol> *_mesh;
}
@property (nonatomic) CADisplayLink *ticker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ticker = [CADisplayLink displayLinkWithTarget:self
                                          selector:@selector(perFrame)];
    [_ticker addToRunLoop:[NSRunLoop mainRunLoop]
                  forMode:NSDefaultRunLoopMode];
    
    [self setup];
}

- (void)setup
{

}

#pragma mark - Per Frame

- (void)updatePhysics
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
    [self updatePhysics];
    [self beginRenderPass];
    [self setupRenderPipeline];
    [self draw];
    [self endRenderPass];
    [self commit];
}

@end
