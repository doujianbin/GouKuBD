//
//  MainTabController.m
//  DocChat-C-iphone
//
//  Created by SeanLiu on 15/8/5.
//  Copyright (c) 2015年 juliye. All rights reserved.
//

#import "MainTabController.h"
#import "MerchantsViewController.h"
#import "MeViewController.h"
#import "MainNavigationViewController.h"

@interface MainTabController () <UITabBarControllerDelegate>

@end

@implementation MainTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self onCreate];
    // Do any additional setup after loading the view.
}

- (void)onCreate {
    
    UINavigationController *nav1 = [[MainNavigationViewController alloc] initWithRootViewController:[[MerchantsViewController alloc] init]];
    UINavigationController *nav2 = [[MainNavigationViewController alloc] initWithRootViewController:[[MeViewController alloc] init]];
    
    NSArray *titles = @[@"商户",@"我的"];
    NSArray *images = @[@"seller",@"my"];
    NSArray *selectImages = @[@"seller_pre",@"my_pre"];
    self.delegate = self;
    
    [self.tabBar setBackgroundImage:[self imageWithColor:[UIColor colorWithHexString:@"#FAFAFA"]]];
    self.viewControllers = @[nav1,nav2];
    
    for (int i=0; i<2; i++) {
        UITabBarItem *item = [self.tabBar.items objectAtIndex:i];
        item.tag = i;
        item.title = [titles objectAtIndex:i];
        item.image = [[UIImage imageNamed:[images objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:[selectImages objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:[NSDictionary
                                      dictionaryWithObjectsAndKeys: [UIColor colorWithHexString:@"#666666"],
                                      NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
        [item setTitleTextAttributes:[NSDictionary
                                      dictionaryWithObjectsAndKeys:COLOR_Main,
                                      NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    }
    
    //一直显示在消息页面
    self.selectedIndex = 0;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(nonnull UITabBarItem *)item{

}

- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
