//
//  ViewController1.m
//  ios 全屏侧滑返回
//
//  Created by xjk on 2018/12/14.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()
{
    UIScrollView *_scrollView;
}
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(00, 100, 100, 100)];
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.contentSize = CGSizeMake(200, 200);
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
