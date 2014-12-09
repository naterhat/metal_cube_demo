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
    
    
    _ticker = [CADisplayLink displayLinkWithTarget:self selector:@selector(perFrame)];
    
    [self setup];
}

- (void)updatePhysics
{
    matrix_float4x4 modelView = matrix_multiply(_transformComponent.transform, _cameraComponent.view);
    matrix_float4x4 modelViewProjection = matrix_multiply(modelView, _cameraComponent.projection);
    
    _uniform.modelViewProjectionMatrix = modelViewProjection;
    
    _uniform.normalMatrix = matrix_transpose( matrix_invert(modelView) );
    
    memcpy([_uniformBuffer contents], &_uniform, sizeof(Uniform));
}

- (void)setup
{
    _device = MTLCreateSystemDefaultDevice();
    
    _metalLayer = (id)self.view.layer;
    [_metalLayer setDevice:_device];
    
    _commandQueue = [_device newCommandQueue];
    
    _library = [_device newDefaultLibrary];
    
    // shader functions
    id<MTLFunction> vertexFunction = [_library newFunctionWithName:@"ColorVertex"];
    id<MTLFunction> fragmentFunction = [_library newFunctionWithName:@"ColorFragment"];
    
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
    _mesh = [NTCubeMeshComponent component];
    _vertexBuffer = [_device newBufferWithBytes:[_mesh vertexData] length:[_mesh vertexTotalSize] options:MTLResourceOptionCPUCacheModeDefault];
    _uniformBuffer = [_device newBufferWithLength:sizeof(Uniform) options:MTLResourceOptionCPUCacheModeDefault];
    
    _transformComponent = [NTTransformComponent component];
    _cameraComponent = [NTCameraComponent component];
}

- (void)beginRenderPass
{
    // create command buffer
    _commandBuffer = [_commandQueue commandBuffer];
    
    // get drawable texture
    _drawable = [_metalLayer nextDrawable];
    NSAssert(_drawable != nil, @"Error retrieving drawable");
    id<MTLTexture>drawableTexture = [_drawable texture];
    
    // create render pass descriptor
    if (!_renderPassDescriptor) {
        _renderPassDescriptor = [MTLRenderPassDescriptor new];
        [_renderPassDescriptor.colorAttachments[0] setLoadAction:MTLLoadActionClear];
        [_renderPassDescriptor.colorAttachments[0] setStoreAction:MTLStoreActionStore];
        [_renderPassDescriptor.colorAttachments[0] setClearColor:MTLClearColorMake(0, 1, 0, 1)];
    }
    
    // set colors attachments
    [_renderPassDescriptor.colorAttachments[0] setTexture:drawableTexture];
    
    // set depth attachment
    if( !_depthTexture ) {
        MTLTextureDescriptor *depthTextureDescriptor = [MTLTextureDescriptor texture2DDescriptorWithPixelFormat:MTLPixelFormatDepth32Float width:[drawableTexture width] height:[drawableTexture height] mipmapped:NO];
        
        _depthTexture = [_device newTextureWithDescriptor:depthTextureDescriptor];
    }
    [_renderPassDescriptor.depthAttachment setTexture:_depthTexture];
    [_renderPassDescriptor.depthAttachment setLoadAction:MTLLoadActionClear];
    [_renderPassDescriptor.depthAttachment setStoreAction:MTLStoreActionDontCare];
    
    // create command encoder
    _commandEncoder = [_commandBuffer renderCommandEncoderWithDescriptor:_renderPassDescriptor];
}

- (void)setupRenderPipeline
{
    // set render pipeline
    [_commandEncoder setRenderPipelineState:_renderPipeline];
    
    // set depth
    [_commandEncoder setDepthStencilState:_depthState];
    
    // set buffers
    [_commandEncoder setVertexBuffer:_vertexBuffer offset:0 atIndex:0];
    [_commandEncoder setVertexBuffer:_uniformBuffer offset:0 atIndex:1];
    
    // set textures
    // . . . there are none at this moment
}

- (void)draw
{
    // draw
    [_commandEncoder drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:[_mesh vertexCount]];
}

- (void)endRenderPass
{
    // end encoder
    [_commandEncoder endEncoding];
}

- (void)commit
{
    // commit buffer
    [_commandBuffer commit];
    
    _commandBuffer = nil;
    _drawable = nil;
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
