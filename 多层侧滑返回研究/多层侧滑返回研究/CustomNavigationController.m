//
//  CustomNavigationController.m
//  多层侧滑返回研究
//
//  Created by xjk on 2018/12/13.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import "CustomNavigationController.h"
#import "PopWithDismissAnimationTransition.h"
#import "SwipeUpInteractiveTransition.h"
#import <UIKit/UIKit.h>

@interface CustomNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) SwipeUpInteractiveTransition *transitionController;
@property (nonatomic, strong)PopWithDismissAnimationTransition *dismissTransition;
@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dismissTransition = [[PopWithDismissAnimationTransition alloc]init];
    _dismissTransition.navc = self;
    _transitionController = [SwipeUpInteractiveTransition new];
    [self.transitionController wireToViewController:self];
    self.delegate = self;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
   return  [super popViewControllerAnimated:animated];
}
- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    NSMutableArray *orginArray = [self.viewControllers mutableCopy];
    if (index == self.viewControllers.count - 1) {
        ///返回到顶部不做任何处理
        return nil;
    }
    NSMutableArray *removeVCArray = [[NSMutableArray alloc]init];
    [orginArray enumerateObjectsUsingBlock:^(UIViewController *  _Nonnull willRemoveVC, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx > index && idx < self.viewControllers.count - 1) {
            [removeVCArray addObject:willRemoveVC];
        }
    }];
    [removeVCArray addObject:orginArray.lastObject];
    
// 移除目标控制器与当前控制器之间的所有控制器
    NSRange  range = NSMakeRange(index + 1, orginArray.count - 1 - (index + 1));
    [orginArray removeObjectsInRange:range];
    self.viewControllers = orginArray;
    [self popViewControllerAnimated:animated];
    return removeVCArray;
}
- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    UIViewController *vc = self.viewControllers.firstObject;
    return [self popToViewController:vc animated:animated];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    
    return self.transitionController.interacting ? self.transitionController : nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        return _dismissTransition;
    }
    return nil;
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
