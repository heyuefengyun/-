//
//  SwipeUpInteractiveTransition.h
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PopWithDismissAnimationTransition.h"

@interface SwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;
//@property (nonatomic, assign) PopWithDismissAnimationTransition* aa;
- (void)wireToViewController:(UIViewController*)viewController;
@end
