//
//  AQINetworkManager.m
//  AQISH
//
//  Created by xiebohui on 8/12/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQINetworkManager.h"
#import <CommonCrypto/CommonCryptor.h>

#define kDecryptKey             @"shhjjczx"
#define kDecryptIV              @"shhjjczx"

@interface AQINetworkManager()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation AQINetworkManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static AQINetworkManager *sharedManager;
    dispatch_once(&onceToken, ^{
        sharedManager = [AQINetworkManager new];
    });
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://219.233.250.38:8087/"]];
        _sessionManager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    }
    return self;
}

- (RACSignal *)requestAlertDataByParameters:(AQIAlertParameters *)parameters {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self.sessionManager GET:@"/semcshare/PatrolHandler.do" parameters:[parameters dictionaryValue] success:^(NSURLSessionDataTask *task, id responseObject) {
            NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSData *responseData = [self decrypt:responseString];
            NSString *decryptString = [[[[[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"NaN" withString:@"0"] stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""] stringByReplacingOccurrencesOfString:@"true" withString:@"1"] stringByReplacingOccurrencesOfString:@"false" withString:@"0"];
            [subscriber sendNext:decryptString];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)requestForecastDataByParameters:(AQIForecastParameters *)parameters {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self.sessionManager GET:@"/semcshare/PatrolHandler.do" parameters:[parameters dictionaryValue] success:^(NSURLSessionDataTask *task, id responseObject) {
            NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSData *responseData = [self decrypt:responseString];
            NSString *decryptString = [[[[[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"NaN" withString:@"0"] stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""] stringByReplacingOccurrencesOfString:@"true" withString:@"1"] stringByReplacingOccurrencesOfString:@"false" withString:@"0"];
            [subscriber sendNext:decryptString];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)requestBasicSiteDataByParameters:(AQIBasicSiteDataParameters *)parameters {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self.sessionManager GET:@"/semcshare/PatrolHandler.do" parameters:[parameters dictionaryValue] success:^(NSURLSessionDataTask *task, id responseObject) {
            NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSData *responseData = [self decrypt:responseString];
            NSString *decryptString = [[[[[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"NaN" withString:@"0"] stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""] stringByReplacingOccurrencesOfString:@"true" withString:@"1"] stringByReplacingOccurrencesOfString:@"false" withString:@"0"];
            [subscriber sendNext:decryptString];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

#pragma mark - Utility

- (NSData *)convertHexString:(NSString *)inputString
{
    NSInteger length = inputString.length / 2;
    char digest[length];
    for(int i = 0; i < length; i++)
    {
        NSString *byteString = [inputString substringWithRange:NSMakeRange(2*i,2)];
        int byteValue;
        const char *input = [byteString UTF8String];
        sscanf(input,"%x",&byteValue);
        digest[i] = byteValue;
    }
    NSData *data = [NSData dataWithBytes:digest length:length];
    return data;
}

// 解密方法
- (NSData *)decrypt:(NSString *)encryptText {
    NSData *encryptData = [self convertHexString: encryptText];
    size_t plainTextBufferSize = [encryptData length];
    const void *vplainText = [encryptData bytes];
    CCCryptorStatus ccStatus;
    char *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    bufferPtrSize = (plainTextBufferSize + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(char));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    const void *vkey = (const void *) [kDecryptKey UTF8String];
    const void *vinitVec = (const void *) [kDecryptIV UTF8String];
    ccStatus = CCCrypt(kCCDecrypt,
                       kCCAlgorithmDES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCBlockSizeDES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    if(ccStatus == kCCSuccess){
        return [NSData dataWithBytes:(const void *)bufferPtr
                              length:(NSUInteger)movedBytes];
    }
    return nil;
}

@end
