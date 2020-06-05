//
//  RQKit.h
//  TestDemo
//
//  Created by xrq on 2020/5/26.
//  Copyright © 2020 xrq. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<RQKit/RQKit.h>)

#import <RQKit/RQColor.h>
#import <RQKit/RQRefreshTableViewController.h>

#import <RQKit/RQHttpTool.h>

#import <RQKit/RQCache.h>
#import <RQKit/RQMemoryCache.h>
#import <RQKit/RQDiskCache.h>

#import <RQKit/NSObject+RQModel.h>

#import <RQKit/NSString+RQKit.h>
#import <RQKit/NSData+RQKit.h>
#import <RQKit/NSNumber+RQKit.h>
#import <RQKit/NSArray+RQKit.h>
#import <RQKit/NSObject+RQKit.h>
#import <RQKit/UIColor+RQKit.h>
#import <RQKit/UIView+RQKit.h>
#import <RQKit/UIApplication+RQKit.h>
#import <RQKit/UIDevice+RQKit.h>

#import <RQKit/RQUtility.h>
#import <RQKit/RQBasicUtility.h>
#import <RQKit/RQTypeUtility.h>

#else

#import "RQColor.h"
#import "RQRefreshTableViewController.h"

#import "RQHttpTool.h"

#import "RQCache.h"
#import "RQMemoryCache.h"
#import "RQDiskCache.h"

#import "NSObject+RQModel.h"

#import "NSString+RQKit.h"
#import "NSData+RQKit.h"
#import "NSNumber+RQKit.h"
#import "NSArray+RQKit.h"
#import "NSArray+RQKit.h"
#import "NSObject+RQKit.h"
#import "UIView+RQKit.h"
#import "UIApplication+RQKit.h"
#import "UIDevice+RQKit.h"

#import "RQUtility.h"
#import "RQBasicUtility.h"
#import "RQTypeUtility.h"

#endif /* RQKit_h */
