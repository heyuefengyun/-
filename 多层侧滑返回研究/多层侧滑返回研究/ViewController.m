//
//  ViewController.m
//  多层侧滑返回研究
//
//  Created by xjk on 2018/12/12.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"

@interface ViewController ()<UINavigationControllerDelegate>
@end

@implementation ViewController
/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"\n侧滑走了viewWillAppear");
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"\n侧滑走了viewWillDisappear");
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"\n侧滑走了viewDidDisappear");
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"\n侧滑走了viewDidAppear");
}
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)btnClick {
    ViewController1 *vc = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
