//
//  RQURLSessionTask.h
//  RQKit_Example
//
//  Created by xrq on 2020/6/3.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RQURLSessionTaskBlock)(NSData *responseData,
                                         NSURLResponse *response,
                                         NSError *error);

@interface RQURLSessionTask : NSObject

@property (nonatomic, strong) NSURLSessionTask *task;
@property (atomic, readonly)  NSURLSessionTaskState state;
@property (nonatomic, strong, readonly) NSDate *requestStartDate;
@property (nonatomic, copy)   RQURLSessionTaskBlock handler;
@property (nonatomic, assign) uint64_t requestStartTime;
@property (nonatomic, assign) NSUInteger loggerSerialNumber;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithRequest:(NSURLRequest *)request
                    fromSession:(NSURLSession *)session
              completionHandler:(RQURLSessionTaskBlock)handler;

- (void)start;
- (void)cancel;

@end

