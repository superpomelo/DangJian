//
//  AppDelegate.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "UserInfoManager.h"
#import "PasswordLoginViewController.h"
#import "MyPerfectInformationViewController.h"
#import "RootViewController.h"//TabBarViewController
#import "MainTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //设置全局状态栏字体颜色为黑色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //设置全局状态栏字体颜色为白色
    // [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //判断登录
    if ([[UserInfoManager getLoginStatus] isEqualToString:@"true"]) {
        //已登陆
//        TabBarViewController *tabbarVC = [[TabBarViewController alloc]init];
        MainTabBarController *tabbarVC = [[MainTabBarController alloc]initWithContext:@""];
//        RootViewController *tabbarVC = [[RootViewController alloc]init];
        self.window.rootViewController = tabbarVC;
        [self.window makeKeyAndVisible];
    }else{
        //未登录
        [UserInfoManager setLoginStatus:@"no"];
        [UserInfoManager setInfoStatus:@"no"];
        PasswordLoginViewController *PSvc = [[PasswordLoginViewController alloc]initWithNibName:@"PasswordLoginViewController" bundle:nil];
        UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:PSvc];
        self.window.rootViewController = navc;
        [self.window makeKeyAndVisible];

    }


    return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
