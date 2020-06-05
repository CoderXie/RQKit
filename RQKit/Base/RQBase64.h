//
//  RQBase64.h
//  RQKit_Example
//
//  Created by xrq on 2020/6/5.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RQBase64 : NSObject

/**
  Decodes a base-64 encoded string.
 @param string The base-64 encoded string.
 @return NSData containing the decoded bytes.
 */
+ (NSData *)decodeAsData:(NSString *)string;

/**
  Decodes a base-64 encoded string into a string.
 @param string The base-64 encoded string.
 @return NSString with the decoded UTF-8 value.
 */
+ (NSString *)decodeAsString:(NSString *)string;

/**
  Encodes data into a string.
 @param data The data to be encoded.
 @return The base-64 encoded string.
 */
+ (NSString *)encodeData:(NSData *)data;

/**
  Encodes string into a base-64 representation.
 @param string The string to be encoded.
 @return The base-64 encoded string.
 */
+ (NSString *)encodeString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
