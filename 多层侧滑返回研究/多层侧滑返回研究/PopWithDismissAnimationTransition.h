//
//  BouncePresentAnimation.h
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CustomNavigationController.h"
//@class CustomNavigationControllerA;
@interface PopWithDismissAnimationTransition : NSObject<UIViewControllerAnimatedTransitioning>
@property(nonatomic,weak)CustomNavigationController *navc;
@end
