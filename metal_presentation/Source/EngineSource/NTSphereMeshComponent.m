//
//  NTSpereMeshComponent.m
//  RenderEngine
//
//  Created by Nate on 11/15/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTSphereMeshComponent.h"
#import "NTConversion.h"

@interface NTSphereMeshComponent ()
{
    float *_data;
    size_t _dataTotalSize;
    
    int32_t *_index;
    size_t _indexTotalSize;
}
@end

@implementation NTSphereMeshComponent

- (instancetype)init
{
    if ( self = [super init] ) {
        [self vertexData];
    } return self;
}

- (void)dealloc
{
    if(_data) free(_data);
    if(_index) free(_index);
}

- (void *)vertexData
{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        int32_t width = 5;
//        int32_t height = 5;
//        
//        float theta, phi, *dat;
//        int32_t i, j, t, ntri, nvec, *idx;
//        
//        nvec = (height-2)* width+2;
//        ntri = (height-2)*(width-1)*2;
//        
//        dat = (float*) malloc( nvec * 3*sizeof(float) );
//        idx =   (int32_t*) malloc( ntri * 3*sizeof(int32_t)   );
//        
//        // set data
//        for( t=0, j=1; j<height-1; j++ )
//            for(      i=0; i<width; i++ )
//            {
//                theta = (float)j/(height-1) * M_PI;
//                phi   = (float)i/(width-1 ) * M_PI*2;
//                dat[t++] =  sinf(theta) * cosf(phi);
//                dat[t++] =  cosf(theta);
//                dat[t++] = -sinf(theta) * sinf(phi);
//            }
//        dat[t++]=0; dat[t++]= 1; dat[t++]=0;
//        dat[t++]=0; dat[t++]=-1; dat[t++]=0;
//        
//        size_t vertexCount = (nvec * 3*sizeof(float)) / (sizeof(float) * 3);
//        vector_float4 *vectorf4Data = (vector_float4 *) malloc( vertexCount * sizeof(vector_float4) );
//        NTVector3ToVector4((vector_float3 *)dat, vectorf4Data, vertexCount, 1);
//        
//        // set vertex data
//        _dataTotalSize =  vertexCount * sizeof(Vertex);
//        _data = (float *) malloc( _dataTotalSize );
//        NTVector4ToVertex(vectorf4Data, (Vertex *)_data, vertexCount, (vector_float4){0, 0, -1, 1});
//        
//        
//        // set index
//        for( t=0, j=0; j<height-3; j++ )
//            for(      i=0; i<width-1; i++ )
//            {
//                idx[t++] = (j  )*width + i  ;
//                idx[t++] = (j+1)*width + i+1;
//                idx[t++] = (j  )*width + i+1;
//                idx[t++] = (j  )*width + i  ;
//                idx[t++] = (j+1)*width + i  ;
//                idx[t++] = (j+1)*width + i+1;
//            }
//        for( i=0; i<width-1; i++ )
//        {
//            idx[t++] = (height-2)*width;
//            idx[t++] = i;
//            idx[t++] = i+1;
//            idx[t++] = (height-2)*width+1;
//            idx[t++] = (height-3)*width + i+1;
//            idx[t++] = (height-3)*width + i;
//        }
//        
//        _indexTotalSize = ntri * 3*sizeof(int32_t);
//        _index = malloc( _indexTotalSize );
//        memcpy(_index, idx, _indexTotalSize);
//    });
    
    
    return _data;
}

- (NSUInteger)vertexCount
{
    return 0;
//    return _dataTotalSize / sizeof(Vertex);
}

- (NSUInteger)vertexTotalSize
{
    return _dataTotalSize;
}

- (void *)indexData
{
    return _index;
}

- (NSUInteger)indexCount
{
    return _indexTotalSize / sizeof(int32_t);
}

- (NSUInteger)indexTotalSize
{
    return _indexTotalSize;
}

- (MTLIndexType)indexType
{
    return MTLIndexTypeUInt32;
}

@end
