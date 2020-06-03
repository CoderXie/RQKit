//
//  RQURLSession.m
//  RQKit_Example
//
//  Created by xrq on 2020/6/3.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import "RQURLSession.h"

#import "RQBasicUtility.h"
#import "RQURLSessionTask.h"

@implementation RQURLSession

- (instancetype)initWithDelegate:(id<NSURLSessionDataDelegate>)delegate
                   delegateQueue:(NSOperationQueue *)queue
{
  if ((self = [super init])) {
    self.delegate = delegate;
    self.delegateQueue = queue;
  }
  return self;
}

- (void)executeURLRequest:(NSURLRequest *)request
        completionHandler:(RQURLSessionTaskBlock)handler
{
  if (self.session == nil) {
    [self updateSessionWithBlock:^{
      RQURLSessionTask *task = [[RQURLSessionTask alloc] initWithRequest:request fromSession:self.session completionHandler:handler];
      [task start];
    }];
  } else {
    RQURLSessionTask *task = [[RQURLSessionTask alloc] initWithRequest:request fromSession:self.session completionHandler:handler];
    [task start];
  }
}

- (void)updateSessionWithBlock:(dispatch_block_t)block
{
  if (self.session == nil) {
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                 delegate:_delegate
                                            delegateQueue:_delegateQueue];
  }
  block();
}

- (void)invalidateAndCancel
{
  [self.session invalidateAndCancel];
  self.session = nil;
}

@end

