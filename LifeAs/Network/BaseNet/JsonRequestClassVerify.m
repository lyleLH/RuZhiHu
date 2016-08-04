//
//  JsonRequestClassVerify.m
//  LHAppFramework
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "JsonRequestClassVerify.h"
#import "KPNetSetting.h"

@implementation JsonRequestClassVerify

+ (NSString *)getClassName:(JsonClassName)cn {
    switch (cn) {
        case kClassName_None:
            return nil;
            break;
        case kClassName_KP_Business:
            return @"KuPaiBusiness";
            break;
        default:
            return nil;
            break;
    }
}

+ (NSString *)getClassMethod:(JsonClassMethod)cm {
    switch (cm) {
        case kClassName_None:
            return nil;
            break;

#pragma mark-- AutoService 服务相关接口
        // START
        case kClassMethod_Tasks: //
            return [self task];
            break;
        default:
            return nil;
            break;
    }
}

+ (NSString *) task {
    return [NSString stringWithFormat:@"%@/tasks",kURL_PREFIX];
}


@end
