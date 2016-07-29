//
//  URLs.h
//  LifeAs
//
//  Created by lyleKP on 16/7/29.
//  Copyright © 2016年 lyleKP. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kURL_APIPREFIX @“”  //最好是从本地文件中读取

#ifndef API

//#define API

#endif

extern NSString *const kCDKAPIScheme;
extern NSString *const kCDKAPIHost;
extern NSString *const kCDKPusherAPIKey;


#ifdef API //正式环境下的宏定义或者可获取到的全局变量



#else//测试环境下的宏定义或者可获取到的全局变量




#endif






@interface URLs : NSObject

+ (NSString *)baseUrl;



@end
