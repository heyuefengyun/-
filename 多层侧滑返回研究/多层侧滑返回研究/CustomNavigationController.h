//
//  CustomNavigationController.h
//  多层侧滑返回研究
//
//  Created by xjk on 2018/12/13.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface CustomNavigationController : UINavigationController
///当侧滑返回取消时  恢复原来的导航栈;
@property (nonatomic, strong) NSArray *orginArray;
@end

NS_ASSUME_NONNULL_END
