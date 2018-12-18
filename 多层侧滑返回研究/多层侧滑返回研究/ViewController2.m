//
//  ViewController2.m
//  多层侧滑返回研究
//
//  Created by xjk on 2018/12/12.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController1.h"
#import "BaseViewController.h"

@interface ViewController2 ()<UINavigationControllerDelegate>
@end

@implementation ViewController2
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"11" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.rightBarButtonItem = leftItem;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)btnClick {
    
    ViewController2 *vc = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.view.backgroundColor = [UIColor redColor];
    BaseViewController *thirdVC = [[BaseViewController alloc]init];
    thirdVC.view.backgroundColor = [UIColor brownColor];
    [vc addChildViewController:thirdVC];
    [vc.view addSubview:thirdVC.view];
}
- (void)backClick {
 NSArray *array = [self.navigationController popToRootViewControllerAnimated:YES];
    NSLog(@"%@",array);
    
    return;
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否返回" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }]];
    [self presentViewController:alertVC animated:YES completion:nil];
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
