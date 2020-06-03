//
//  RQURLSession.h
//  RQKit_Example
//
//  Created by xrq on 2020/6/3.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RQURLSessionTask.h"

NS_ASSUME_NONNULL_BEGIN

@interface RQURLSession : NSObject

@property (atomic, strong, nullable) NSURLSession *session;
@property (nonatomic, weak, nullable) id<NSURLSessionDataDelegate> delegate;
@property (nonatomic, retain, nullable) NSOperationQueue *delegateQueue;

- (instancetype)initWithDelegate:(id<NSURLSessionDataDelegate>)delegate
                   delegateQueue:(NSOperationQueue *)delegateQueue;

- (void)executeURLRequest:(NSURLRequest *)request
        completionHandler:(RQURLSessionTaskBlock)handler;

- (void)updateSessionWithBlock:(dispatch_block_t)block;

- (void)invalidateAndCancel;

@end

NS_ASSUME_NONNULL_END

