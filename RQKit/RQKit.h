//
//  RQKit.h
//  TestDemo
//
//  Created by xrq on 2020/5/26.
//  Copyright © 2020 xrq. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<RQKit/RQKit.h>)

#import <RQKit/RQUtility.h>
#import <RQKit/RQBasicUtility.h>
#import <RQKit/RQTypeUtility.h>
#import <RQKit/RQColor.h>
#import <RQKit/NSObject+RQModel.h>
#import <RQKit/NSString+RQKit.h>
#import <RQKit/NSData+RQKit.h>
#import <RQKit/NSNumber+RQKit.h>
#import <RQKit/UIColor+RQKit.h>

#else

#import "RQUtility.h"
#import "RQBasicUtility.h"
#import "RQTypeUtility.h"
#import "RQColor.h"
#import "NSObject+RQModel.h"
#import "NSString+RQKit.h"
#import "NSData+RQKit.h"
#import "NSNumber+RQKit.h"
#import "UIColor+RQKit.h"

#endif /* RQKit_h */
