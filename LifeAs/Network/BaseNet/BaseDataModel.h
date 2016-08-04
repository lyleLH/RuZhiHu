//
//  BaseDataModel.h
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/31.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef enum {
    
    kClassName_None = -1,
    kClassName_KP_Business = 100
    
}JsonClassName;

typedef enum {
    kClassMethod_None = -1,

    kClassMethod_Tasks,

}JsonClassMethod;


@protocol DataModelUpdateDelegate <NSObject>


@end


@interface BaseDataModel : NSObject


@property (nonatomic,assign) id <DataModelUpdateDelegate> modelDelegate ;


@end
