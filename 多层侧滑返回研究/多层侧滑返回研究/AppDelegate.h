//
//  AppDelegate.h
//  多层侧滑返回研究
//
//  Created by xjk on 2018/12/12.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

