//
//  RQColor.h
//  RQKit_Example
//
//  Created by xrq on 2020/5/27.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import "TargetConditionals.h"

#if !TARGET_OS_TV

#import <UIKit/UIKit.h>

UIColor * RQUIColorWithRGBA(uint8_t r, uint8_t g, uint8_t b, CGFloat a);
UIColor * RQUIColorWithRGB(uint8_t r, uint8_t g, uint8_t b);

#endif
