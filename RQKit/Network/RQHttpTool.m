//
//  RQHttpTool.m
//  RQKit_Example
//
//  Created by xrq on 2020/6/3.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import "RQHttpTool.h"
#import <AFNetworking/AFHTTPSessionManager.h>
#import <AFNetworking/AFURLSessionManager.h>

// constants
RQHTTPMethod RQHTTPMethodGET  = @"GET";
RQHTTPMethod RQHTTPMethodPOST = @"POST";

@implementation RQHttpTool

+ (AFURLSessionManager *)defaultSessionManager
{
    static AFURLSessionManager *s_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_manager = [[AFURLSessionManager alloc]
                     initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        AFHTTPResponseSerializer * responseSerializer = [AFHTTPResponseSerializer serializer];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                     @"application/json",
                                                     @"text/html",
                                                     @"text/json",
                                                     @"text/javascript",
                                                     @"text/plain",
                                                     nil];
        s_manager.responseSerializer = responseSerializer;
        s_manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    });
    return s_manager;
}

+ (AFHTTPSessionManager *)defaultHttpManager
{
    static AFHTTPSessionManager *s_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_manager = [AFHTTPSessionManager manager];
        AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                     @"application/json",
                                                     @"text/html",
                                                     @"text/json",
                                                     @"text/javascript",
                                                     @"text/plain",
                                                     nil];
        s_manager.responseSerializer = responseSerializer;
    });
    return s_manager;
}

+ (void)GET:(NSString *)URL params:(NSDictionary *)params completionHandler:(RQHttpCompletionHandler)completionHandler
{
    [[self defaultHttpManager] GET:URL parameters:params headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        if (completionHandler) {
            completionHandler(json, nil);
        };
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (completionHandler) {
            completionHandler(nil, error);
        };
    }];
}

+ (void)POST:(NSString *)URL params:(NSDictionary *)params completionHandler:(RQHttpCompletionHandler)completionHandler;
{
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:RQHTTPMethodPOST
                                                                                 URLString:URL
                                                                                parameters:nil
                                                                                     error:nil];
    request.timeoutInterval= 60;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData *data = [NSJSONSerialization dataWithJSONObject:params?:@{} options:0 error:nil];
    [request setHTTPBody:data];
    
    [[[self defaultSessionManager] dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        if (completionHandler) {
            completionHandler(json,error);
        }

    }] resume];
}

@end
