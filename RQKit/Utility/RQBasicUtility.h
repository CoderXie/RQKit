//
//  RQBasicUtility.h
//  RQKit_Example
//
//  Created by xrq on 2020/5/26.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Describes the callback for appLinkFromURLInBackground.
 @param object the RQAppLink representing the deferred App Link
 @param stop the error during the request, if any

 */
typedef id _Nullable (^RQInvalidObjectHandler)(id object, BOOL *stop);
@interface RQBasicUtility : NSObject

/**
 Converts an object into a JSON string.
 @param object The object to convert to JSON.
 @param errorRef If an error occurs, upon return contains an NSError object that describes the problem.
 @param invalidObjectHandler Handles objects that are invalid, returning a replacement value or nil to ignore.
 @return A JSON string or nil if the object cannot be converted to JSON.
 */
+ (nullable NSString *)JSONStringForObject:(id)object
                                     error:(NSError *__autoreleasing *)errorRef
                      invalidObjectHandler:(nullable RQInvalidObjectHandler)invalidObjectHandler;

/**
 Sets an object for a key in a dictionary if it is not nil.
 @param dictionary The dictionary to set the value for.
 @param object The value to set.
 @param key The key to set the value for.
 */
+ (void)dictionary:(NSMutableDictionary<NSString *, id> *)dictionary
         setObject:(nullable id)object
            forKey:(nullable id<NSCopying>)key;

/**
 Sets an object for a key in a dictionary if it is not nil.
 @param dictionary The dictionary to set the value for.
 @param object The value to set after serializing to JSON.
 @param key The key to set the value for.
 @param errorRef If an error occurs, upon return contains an NSError object that describes the problem.
 @return NO if an error occurred while serializing the object, otherwise YES.
 */
+ (BOOL)dictionary:(NSMutableDictionary<id, id> *)dictionary
setJSONStringForObject:(id)object
            forKey:(id<NSCopying>)key
             error:(NSError *__autoreleasing *)errorRef;

/**
 Adds an object to an array if it is not nil.
 @param array The array to add the object to.
 @param object The object to add to the array.
 */
+ (void)array:(NSMutableArray *)array addObject:(nullable id)object;

/**
 Converts a JSON string into an object
 @param string The JSON string to convert.
 @param errorRef If an error occurs, upon return contains an NSError object that describes the problem.
 @return An NSDictionary, NSArray, NSString or NSNumber containing the object representation, or nil if the string
 cannot be converted.
 */
+ (nullable id)objectForJSONString:(NSString *)string error:(NSError *__autoreleasing *)errorRef;

/**
 Constructs a query string from a dictionary.
 @param dictionary The dictionary with key/value pairs for the query string.
 @param errorRef If an error occurs, upon return contains an NSError object that describes the problem.
 @param invalidObjectHandler Handles objects that are invalid, returning a replacement value or nil to ignore.
 @return Query string representation of the parameters.
 */
+ (NSString *)queryStringWithDictionary:(NSDictionary<NSString *, id> *)dictionary
                                  error:(NSError *__autoreleasing *)errorRef
                   invalidObjectHandler:(nullable RQInvalidObjectHandler)invalidObjectHandler;

/**
 Converts simple value types to the string equivalent for serializing to a request query or body.
 @param value The value to be converted.
 @return The value that may have been converted if able (otherwise the input param).
 */
+ (id)convertRequestValue:(id)value;

/**
 Encodes a value for an URL.
 @param value The value to encode.
 @return The encoded value.
 */
+ (NSString *)URLEncode:(NSString *)value;

/**
 Parses a query string into a dictionary.
 @param queryString The query string value.
 @return A dictionary with the key/value pairs.
 */
+ (NSDictionary<NSString *, NSString *> *)dictionaryWithQueryString:(NSString *)queryString;

/**
 Decodes a value from an URL.
 @param value The value to decode.
 @return The decoded value.
 */
+ (NSString *)URLDecode:(NSString *)value;

/**
 Gzip data with default compression level if possible.
 @param data The raw data.
 @return nil if unable to gzip the data, otherwise gzipped data.
 */
+ (nullable NSData *)gzip:(NSData *)data;

+ (NSString *)anonymousID;
+ (NSString *)persistenceFilePath:(NSString *)filename;

@end

NS_ASSUME_NONNULL_END
