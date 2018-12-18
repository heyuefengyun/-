//
//  CustomNavigationController1.m
//  ios 全屏侧滑返回
//
//  Created by xjk on 2018/12/14.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import "CustomNavigationController1.h"
#import <UIKit/UIKit.h>

@interface CustomNavigationController1 ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIPanGestureRecognizer *panGesture;
@end

@implementation CustomNavigationController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    id target = self.interactivePopGestureRecognizer.delegate;
    /*
     po self.interactivePopGestureRecognizer
     <UIScreenEdgePanGestureRecognizer: 0x7fcfb5c17880; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fcfb5c129e0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fcfb5c17740>)>>
     
     handleNavigationTransition:为系统私有API,即系统自带侧滑手势的回调方法，我们在自己的手势上直接用它的回调方法
     */
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    _panGesture.delegate = self; // 设置手势代理，拦截手势触发
    [self.interactivePopGestureRecognizer.view addGestureRecognizer:_panGesture];
    
    // 一定要禁止系统自带的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}
#pragma mark -- UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == _panGesture) {
        if (self.viewControllers.count > 1) {
            return YES;
        }
        return NO;
    }
    return YES;
    
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
