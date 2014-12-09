//
//  Color.metal
//  metal_presentation
//
//  Created by Nate on 12/9/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#include <metal_stdlib>
#include "NTSharedDataTypes.h"

using namespace metal;

struct FragmentInput
{
    float4 position [[ position ]];
};

vertex FragmentInput ColorVertex ( device Vertex *vertices [[ buffer(0) ]],
                    constant Uniform &uniform [[ buffer(1) ]],
                    uint vid [[ vertex_id ]])
{
    FragmentInput out;
    
    Vertex v = vertices[vid];
    out.position = uniform.modelViewProjectionMatrix * v.position;
    
    return out;
}

fragment half4 ColorFragment (FragmentInput in [[ stage_in ]] )
{
    return half(1);
}


