//
//  UIScrollView+GestureConflict.m
//  ios 全屏侧滑返回
//
//  Created by xjk on 2018/12/14.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import "UIScrollView+GestureConflict.h"

@implementation UIScrollView (GestureConflict)
//处理UIScrollView上的手势和侧滑返回手势的冲突
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    // 首先判断otherGestureRecognizer是不是系统pop手势
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        //otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan) {
            return YES;
        }
    }
    return NO;
}
@end
