//
//  BaseTabBarViewController.h
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISettingExtention.h"
#import "BaseNavigationViewController.h"
#import "UIBarButtonItem+Extension.h"

#import "InfoViewController.h"
#import "PathViewController.h"
#import "HomeViewController.h"

@interface BaseTabBarViewController : UITabBarController

@property (nonatomic,strong) HomeViewController * m_homeVc ;
@property (nonatomic,strong) PathViewController * m_msgVc;
@property (nonatomic,strong) InfoViewController * m_purchaseVc ;

- (void)addChildViewController:(UIViewController *)childViewController
andSetUpTabbarOfViewControllerWithTitle:(NSString *)title
                      andImage:(NSString *)imageName
              annSelectedImage:(NSString * )selectedImageName;



@end
