//
//  ViewController.m
//  ios 全屏侧滑返回
//
//  Created by xjk on 2018/12/14.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 100;
}
- (void)btnClick:(UIButton *)btn {
    if (btn.tag == 100) {
        ViewController1 *vc = [[ViewController1 alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
