//
//  BaseTabBarViewController.m
//  LHTabbarDemo
//
//  Created by lyleKP on 15/7/30.
//  Copyright (c) 2015年 lyleKP. All rights reserved.
//

#import "BaseTabBarViewController.h"

#import "BaseNavigationViewController.h"



@interface BaseTabBarViewController () {
    


    
}




@end

@implementation BaseTabBarViewController




-(instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
         [self initWithFourViewController];
        
    }
    return self;
}

#pragma mark -- property
- (HomeViewController *)m_homeVc {
    if(!_m_homeVc ) {
        _m_homeVc = [[HomeViewController alloc] init];
    }
    return _m_homeVc;
}

- (PathViewController *)m_msgVc {
    if(!_m_msgVc ) {
        
        _m_msgVc = [[PathViewController alloc] init];
    }
    return _m_msgVc;
}
-(InfoViewController *)m_purchaseVc {
    if(!_m_purchaseVc ) {
        
        _m_purchaseVc = [[InfoViewController alloc] init];
    }
    return _m_purchaseVc;
}

#pragma mark --
#pragma mark -- lifeCycle method

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

}

#pragma mark -- method
- (void)initWithFourViewController {
    
    [self addChildViewController:self.m_homeVc andSetUpTabbarOfViewControllerWithTitle:@"GO" andImage:@"tabbar_n1" annSelectedImage:@"tabbar_s1" ];
    [self addChildViewController:self.m_msgVc andSetUpTabbarOfViewControllerWithTitle:@"Paths" andImage:@"tabbar_n2" annSelectedImage:@"tabbar_s2" ];
    [self addChildViewController:self.m_purchaseVc andSetUpTabbarOfViewControllerWithTitle:@"Info" andImage:@"tabbar_n3" annSelectedImage:@"tabbar_s3" ];
}


/**
 *  设置控制器tabbar的样式
 *
 *  @param title             标题
 *  @param imageName         正常状态图片名字
 *  @param selectedImageName 选中状态图片名字
 */
- (void)addChildViewController:(UIViewController *)childViewController
andSetUpTabbarOfViewControllerWithTitle:(NSString *)title
                      andImage:(NSString *)imageName
              annSelectedImage:(NSString * )selectedImageName;


{
    
    //改变tabbar 线条颜色
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, .5);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [UIColor kp_themecolor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setShadowImage:img];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
    //改变背景为白色
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;
    
    childViewController.tabBarItem.title = title;
    
    childViewController.navigationItem.title = title;
    
    //正常文字
    NSMutableDictionary * textNomalAttributesDic = [[NSMutableDictionary alloc] init];
    textNomalAttributesDic[NSForegroundColorAttributeName] = [UIColor kp_suggestiveGrayColor];
    [childViewController.tabBarItem setTitleTextAttributes:textNomalAttributesDic forState:UIControlStateNormal];
    //选中文字
    NSMutableDictionary * textSelectedAttributesDic = [[NSMutableDictionary alloc] init];
    textSelectedAttributesDic[NSForegroundColorAttributeName] = [UIColor kp_themecolor];
    [childViewController.tabBarItem setTitleTextAttributes:textSelectedAttributesDic forState:UIControlStateSelected];
    
    // 即使使用的图片有渲染颜色，也会被渲染成系统蓝色
//    self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_s1"];
//     childViewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //使用图片不渲染
    UIImage * Image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.image = Image;
    
    UIImage * selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.selectedImage = selectedImage;
    

    [self addChildViewController:[[BaseNavigationViewController alloc] initWithRootViewController:childViewController]];

}

#pragma mark --自定义tabbar界面切换
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if(self.selectedViewController != viewController) {
//        [tabBarController.view.layer addAnimation:[CATransition getAnimation:3 subtype:2] forKey:nil];
        return YES;
    }
    return NO;
    
}





@end
