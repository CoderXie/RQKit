//
//  RQHttpTool.h
//  RQKit_Example
//
//  Created by xrq on 2020/6/3.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString *const RQHTTPMethod NS_TYPED_EXTENSIBLE_ENUM;
/// GET Request
FOUNDATION_EXPORT RQHTTPMethod RQHTTPMethodGET;

/// POST Request
FOUNDATION_EXPORT RQHTTPMethod RQHTTPMethodPOST;

typedef void (^RQHttpCompletionHandler)(id _Nullable result, NSError *_Nullable error);
@interface RQHttpTool : NSObject

// GET
+ (void)GET:(NSString *)URL params:(NSDictionary *)params completionHandler:(RQHttpCompletionHandler)completionHandler;

// PST
+ (void)POST:(NSString *)URL params:(NSDictionary *)params completionHandler:(RQHttpCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
