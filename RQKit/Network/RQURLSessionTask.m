//
//  RQURLSessionTask.m
//  RQKit_Example
//
//  Created by xrq on 2020/6/3.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import "RQURLSessionTask.h"

@implementation RQURLSessionTask

- (instancetype)init
{
  if ((self = [super init])) {
    _requestStartDate = [NSDate date];
  }
  return self;
}

- (instancetype)initWithRequest:(NSURLRequest *)request
                    fromSession:(NSURLSession *)session
              completionHandler:(RQURLSessionTaskBlock)handler
{
  if ((self = [self init])) {
    self.requestStartTime = (uint64_t)([self.requestStartDate timeIntervalSince1970] * 1000);
    self.task = [session dataTaskWithRequest:request completionHandler:handler];
  }
  return self;
}

- (NSURLSessionTaskState)state
{
  return self.task.state;
}

#pragma mark - Task State

- (void)start
{
  [self.task resume];
}

- (void)cancel
{
  [self.task cancel];
  self.handler = nil;
}

@end

