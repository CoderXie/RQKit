//
//  RQColor.m
//  RQKit_Example
//
//  Created by xrq on 2020/5/27.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import "TargetConditionals.h"

#if !TARGET_OS_TV

#import "RQColor.h"

static const CGFloat kRGBMax = 255.0;

UIColor *RQUIColorWithRGBA(uint8_t r, uint8_t g, uint8_t b, CGFloat a)
{
    return [UIColor colorWithRed:(r / kRGBMax) green:(g / kRGBMax) blue:(b / kRGBMax) alpha:a];
}

UIColor *RQUIColorWithRGB(uint8_t r, uint8_t g, uint8_t b)
{
    return RQUIColorWithRGBA(r, g, b, 1.0);
}

#endif
