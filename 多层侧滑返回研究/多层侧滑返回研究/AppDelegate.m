//
//  AppDelegate.m
//  多层侧滑返回研究
//
//  Created by xjk on 2018/12/12.
//  Copyright © 2018年 xjk. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CustomNavigationController.h"

@interface AppDelegate ()
{
    UINavigationController *_navc;
}
@end
#pragma mark - 多重侧滑返回使用场景y如果是统一的原生页面 返回时可走leftItem的方法 如果有接入非原生界面则使用会有相关限制
/*
 方案1：监控interactivePopGestureRecognizer的state的KVO获取开始时结束时(取消时)的滑动距离根据滑动距离判断取消还是成功  当state为began时记录原Viewcontrollers 取消时按方案2还原viewcontrollers
 方案2：专场动画  将滑动手势建在【interactivePopGestureRecognizer view】上
 重写poptoroot和poptoViewcontroller 简化为pop（来解决多层返回时navigationItem上控件消失的问题）cancelInteractiveTransition时还原viewcontrollers;
 方案3（全屏侧滑方案）：新建手势沿用interactivePopGestureRecognizer的方法
 方案4（全屏侧滑方案）：https://github.com/forkingdog/FDFullscreenPopGesture

 */
/**
 1：是否走viewwillappear viewwilldisappear viewdiddisappear viewDidAppear
 viewDidAppear没走 viewwillappear走了  viewwilldisappear viewdiddisappear取消策划时走了
 2：是否可走leftitem按钮方法返回
 3：是否能满足多层返回（多层返回时如果中途取消会出现顶部控件消失？？  最好结合把中间页面从导航栈中移除来实现）
    3.1如果把中间页面从导航栈中移除 则不能完全覆盖leftitem方法  再返回时重写pop的几个方法？？？（如果中途取消再改回来）
 4：UINavigationController的代理设置和手势添加view 最好和系统原生的一样
 5:如果push了一个第三方的VC 该VC不支持backClick方法 那就addchiledviewcoontroller
 */
/*
 系统的导航和leftBarButtonItem冲突
 self.interactivePopGestureRecognizer.delegate = self;
 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
 {
 return self.childViewControllers.count > 1;
 }
 */
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *vc = [[ViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    _navc = [[CustomNavigationController alloc]initWithRootViewController:vc];
//    [_navc.interactivePopGestureRecognizer addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:nil];
    self.window.rootViewController = _navc;
    [self.window makeKeyAndVisible];
    return YES;
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    if ([keyPath isEqualToString:@"state"]) {
//        NSLog(@"object === %@====%@",object,[change valueForKey:NSKeyValueChangeNewKey]);
//        UIGestureRecognizer *gesture = _navc.interactivePopGestureRecognizer;
//    }
//}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"________"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
