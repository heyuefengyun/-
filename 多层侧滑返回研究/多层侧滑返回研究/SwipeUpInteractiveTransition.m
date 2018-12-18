//
//  SwipeUpInteractiveTransition.m
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import "SwipeUpInteractiveTransition.h"
#import "ViewController1.h"
#import "CustomNavigationController.h"

@interface SwipeUpInteractiveTransition()
@property (nonatomic, strong) CustomNavigationController *vc;
@end

@implementation SwipeUpInteractiveTransition
-(void)wireToViewController:(CustomNavigationController *)viewController
{
    self.vc = viewController;
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [viewController.interactivePopGestureRecognizer.view addGestureRecognizer:gesture];
}
-(CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    CGFloat fraction = 0;
    fraction = translation.x / self.vc.view.frame.size.width;
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            self.interacting = YES;
            self.vc.orginArray = self.vc.viewControllers;
            [self gestureBegan];
            break;
        case UIGestureRecognizerStateChanged: {
            // 2. Calculate the percentage of guesture
            //Limit it between 0 and 1
            [self updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            // 3. Gesture over. Check if the transition should happen or not
            self.interacting = NO;
            if (fraction < 0.5 || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}
- (void)gestureBegan {
    
    UIViewController *vc = self.vc.viewControllers.lastObject;
    if ([vc respondsToSelector:@selector(backClick)]) {
        ViewController1 *vc1 = (ViewController1 *)vc;
        [vc1 backClick];
    }
}
@end
