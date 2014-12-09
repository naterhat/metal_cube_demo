//
//  NTUtilities.m
//  RenderEngine
//
//  Created by Nate on 12/1/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "NTUtilities.h"

NSString __attribute__((overloadable)) *NTStringFromVector(vector_float2 v)
{
    return [NSString stringWithFormat:@"%.02f %.02f", v.x, v.y];
}

NSString __attribute__((overloadable)) *NTStringFromVector(vector_float3 v)
{
    return [NSString stringWithFormat:@"%.02f %.02f %.02f", v.x, v.y, v.z];
}


NSString __attribute__((overloadable)) *NTStringFromVector(vector_float4 v)
{
    return [NSString stringWithFormat:@"%.02f %.02f %.02f %.02f", v.x, v.y, v.z, v.w];
}

vector_float2 __attribute__((overloadable)) NTVectorFromCGPoint(CGPoint point)
{
    return (vector_float2){point.x, point.y};
}





NSString __attribute__((overloadable)) *NSStringFromColumn(vector_float4 c)
{
    return [NSString stringWithFormat:@"%.02f %.02f %.02f %.02f", c.x, c.y, c.z, c.w];
}

NSString __attribute__((overloadable)) *NSStringFromMatrix(matrix_float4x4 m)
{
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendFormat:@"%@\n", NSStringFromColumn(m.columns[0])];
    [str appendFormat:@"%@\n", NSStringFromColumn(m.columns[1])];
    [str appendFormat:@"%@\n", NSStringFromColumn(m.columns[2])];
    [str appendFormat:@"%@\n", NSStringFromColumn(m.columns[3])];
    return str;
}


NSString __attribute__((overloadable)) *NSStringFromColumn(vector_float3 c)
{
    return [NSString stringWithFormat:@"%.02f %.02f %.02f", c.x, c.y, c.z];
}

NSString __attribute__((overloadable)) *NSStringFromMatrix(matrix_float3x3 m)
{
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendFormat:@"%@\n", NSStringFromColumn(m.columns[0])];
    [str appendFormat:@"%@\n", NSStringFromColumn(m.columns[1])];
    [str appendFormat:@"%@\n", NSStringFromColumn(m.columns[2])];
    return str;
}

