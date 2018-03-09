//
//  MeViewController.m
//  GouKuBD
//
//  Created by lixiao on 2018/2/26.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()


@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    [self.view setBackgroundColor:[UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1]];
    
    
}

- (void)onCreate{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
