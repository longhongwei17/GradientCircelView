//
//  ViewController.m
//  GradientCircelView
//
//  Created by longhongwei on 16/4/22.
//  Copyright © 2016年 longhongwei. All rights reserved.
//

#import "ViewController.h"
#import "DDGradientCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DDGradientCircleView *gView = [[DDGradientCircleView alloc] initWithFrame:CGRectMake(10, 100,260, 260)];
    
    
    [self.view addSubview:gView];
    [gView showViewWithMainColor:[UIColor colorWithRed:40/255. green:87/255. blue:81/255. alpha:1] secondColor:[UIColor colorWithRed:19./255. green:65./255. blue:62./255. alpha:1]];
    
    self.view.backgroundColor = [UIColor colorWithRed:25/255. green:14/255. blue:46/255. alpha:1];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
