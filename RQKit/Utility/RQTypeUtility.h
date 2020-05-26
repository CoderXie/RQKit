//
//  RQTypeUtility.h
//  RQKit_Example
//
//  Created by xrq on 2020/5/26.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RQTypeUtility : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (NSArray *)arrayValue:(id)object;
+ (BOOL)boolValue:(id)object;
+ (NSDictionary *)dictionaryValue:(id)object;
+ (NSInteger)integerValue:(id)object;
+ (id)objectValue:(id)object;
+ (NSString *)stringValue:(id)object;
+ (NSTimeInterval)timeIntervalValue:(id)object;
+ (NSUInteger)unsignedIntegerValue:(id)object;
+ (NSURL *)URLValue:(id)object;

@end

NS_ASSUME_NONNULL_END
