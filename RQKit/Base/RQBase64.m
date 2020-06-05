//
//  RQBase64.m
//  RQKit_Example
//
//  Created by xrq on 2020/6/5.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import "RQBase64.h"

@implementation RQBase64

static RQBase64 *_decoder;
static RQBase64 *_encoder;

#pragma mark - Class Methods

+ (void)initialize
{
  if (self == [RQBase64 class]) {
    _decoder = [[RQBase64 alloc] init];
    _encoder = [[RQBase64 alloc] init];
  }
}

+ (NSData *)decodeAsData:(NSString *)string
{
  return [_decoder decodeAsData:string];
}

+ (NSString *)decodeAsString:(NSString *)string
{
  return [_decoder decodeAsString:string];
}

+ (NSString *)encodeData:(NSData *)data
{
  return [_encoder encodeData:data];
}

+ (NSString *)encodeString:(NSString *)string
{
  return [_encoder encodeString:string];
}

#pragma mark - Object Lifecycle

#pragma mark - Implementation Methods

- (NSData *)decodeAsData:(NSString *)string
{
  if (!string) {
    return nil;
  }
  // This padding will be appended before stripping unknown characters, so if there are unknown characters of count % 4
  // it will not be able to decode.  Since we assume valid base64 data, we will take this as is.
  int needPadding = string.length % 4;
  if (needPadding > 0) {
    needPadding = 4 - needPadding;
    string = [string stringByPaddingToLength:string.length+needPadding withString:@"=" startingAtIndex:0];
  }

  return [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
}

- (NSString *)decodeAsString:(NSString *)string
{
  NSData *data = [self decodeAsData:string];
  if (!data) {
    return nil;
  }
  return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)encodeData:(NSData *)data
{
  if (!data) {
    return nil;
  }

  return [data base64EncodedStringWithOptions:0];
}

- (NSString *)encodeString:(NSString *)string
{
  return [self encodeData:[string dataUsingEncoding:NSUTF8StringEncoding]];
}


@end
