//
//  RQUtility.h
//  RQKit_Example
//
//  Created by xrq on 2020/5/26.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RQUtility : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
  Parses a query string into a dictionary.
 @param queryString The query string value.
 @return A dictionary with the key/value pairs.
 */
+ (NSDictionary<NSString *, NSString *> *)dictionaryWithQueryString:(NSString *)queryString;

/**
  Constructs a query string from a dictionary.
 @param dictionary The dictionary with key/value pairs for the query string.
 @param errorRef If an error occurs, upon return contains an NSError object that describes the problem.
 @return Query string representation of the parameters.
 */
+ (NSString *)queryStringWithDictionary:(NSDictionary<NSString *, id> *)dictionary
                                  error:(NSError **)errorRef;

/**
  Decodes a value from an URL.
 @param value The value to decode.
 @return The decoded value.
 */
+ (NSString *)URLDecode:(NSString *)value;

/**
  Encodes a value for an URL.
 @param value The value to encode.
 @return The encoded value.
 */
+ (NSString *)URLEncode:(NSString *)value;

/**
  Creates a timer using Grand Central Dispatch.
 @param interval The interval to fire the timer, in seconds.
 @param block The code block to execute when timer is fired.
 @return The dispatch handle.
 */
+ (dispatch_source_t)startGCDTimerWithInterval:(double)interval block:(dispatch_block_t)block;

/**
 Stop a timer that was started by startGCDTimerWithInterval.
 @param timer The dispatch handle received from startGCDTimerWithInterval.
 */
+ (void)stopGCDTimer:(dispatch_source_t)timer;

/**
 Get SHA256 hased string of NSString/NSData

 @param input The data that needs to be hashed, it could be NSString or NSData.
 */
+ (nullable NSString *)SHA256Hash:(nullable NSObject *)input;


@end

NS_ASSUME_NONNULL_END
