//
//  ViewController.m
//  metal_presentation
//
//  Created by Nate on 12/7/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "ViewController.h"
#import "NTShared.h"

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
    id<MTLTexture> _depthTexture; // will be initialize in render pass setup
    id<MTLBuffer> _vertexBuffer;
    id<MTLBuffer> _indexBuffer;
    id<MTLBuffer> _uniformBuffer;
    
    // per frame
    id<MTLCommandBuffer> _commandBuffer;
    id<MTLCommandEncoder> _commandEncoder;
    id<CAMetalDrawable> _drawable;
}
@property (nonatomic) CADisplayLink *ticker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _ticker = [CADisplayLink displayLinkWithTarget:self selector:@selector(perFrame)];
    
    [self setup];
}

- (void)setup
{
    _device = MTLCreateSystemDefaultDevice();
    
    _metalLayer = (id)self.view.layer;
    [_metalLayer setDevice:_device];
    
    _commandQueue = [_device newCommandQueue];
    
    _library = [_device newDefaultLibrary];
    
    // shader functions
    id<MTLFunction> vertexFunction = [_library newFunctionWithName:@"colorVertex"];
    id<MTLFunction> fragmentFunction = [_library newFunctionWithName:@"colorFragment"];
    
    // set render pipeline
    MTLRenderPipelineDescriptor *renderPipelineDescriptor = [MTLRenderPipelineDescriptor new];
    renderPipelineDescriptor.depthAttachmentPixelFormat = MTLPixelFormatDepth32Float;
    renderPipelineDescriptor.colorAttachments[0].pixelFormat = MTLPixelFormatRGBA8Unorm;
    [renderPipelineDescriptor setVertexFunction:vertexFunction];
    [renderPipelineDescriptor setFragmentFunction:fragmentFunction];
    
    NSError *error = nil;
    _renderPipeline = [_device newRenderPipelineStateWithDescriptor:renderPipelineDescriptor error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
    
    // set depth state
    MTLDepthStencilDescriptor *depthDescriptor = [MTLDepthStencilDescriptor new];
    [depthDescriptor setDepthCompareFunction:MTLCompareFunctionLess];
    [depthDescriptor setDepthWriteEnabled:YES];
    
    _depthState = [_device newDepthStencilStateWithDescriptor:depthDescriptor];
    
    // set buffers
}

- (void)beginRenderPass
{
    // create command buffer
    
    // get drawable texture
    
    // create command encoder
    
}

- (void)setupRenderPipeline
{
    // set render pipeline
    
    // set depth
    
    // set buffers
    
    // set textures
    // . . . there are none at this moment
    
}

- (void)draw
{
    // draw
}

- (void)endRenderPass
{
    // end encoder
}

- (void)commit
{
    // commit buffer
}

- (void)perFrame
{
    [self beginRenderPass];
    [self setupRenderPipeline];
    [self draw];
    [self endRenderPass];
    [self commit];
}

@end
