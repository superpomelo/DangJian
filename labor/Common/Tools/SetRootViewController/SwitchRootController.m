//
//  SwitchRootController.m
//  com.tkhy.driver
//
//  Created by 狍子 on 2020/4/28.
//  Copyright © 2020 CherryKing. All rights reserved.
//

#import "SwitchRootController.h"
#import "PersonalCenterHomeViewController.h"
#import "TabBarViewController.h"
#import "PasswordLoginViewController.h"

#import "UserInfoManager.h"

@implementation SwitchRootController
+(void)goHomeViewController{
//        NSMutableArray *controllers = [[NSMutableArray alloc] init];
//
//        PickUpHomeViewController *vc1 = [[PickUpHomeViewController alloc] init];
//        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
//
//        OrderCenterHomeViewController *vc2 = [[OrderCenterHomeViewController alloc] init];
//        UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
//
//        PersonalCenterHomeViewController *vc3 = [[PersonalCenterHomeViewController alloc] init];
//        UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
//        [controllers addObjectsFromArray:@[nav1, nav2, nav3]];
    
        TabBarViewController *tabBarController = [[TabBarViewController alloc] init];
//        [tabBarController setTintColor:kGreenColor];
//        [self customizeTabBarForController:tabBarController];
//        [tabBarController setViewControllers:controllers];
    UIWindow *window;
    if (@available(iOS 13.0, *)) {
            window = [UIApplication sharedApplication].windows[0];
        } else {
            window = [UIApplication sharedApplication].delegate.window;
        }
    window.rootViewController = tabBarController;
    [window makeKeyAndVisible];
}

/**切换根控制器到登录界面*/
+(void)goLoginController{
    [UserInfoManager setLoginStatus:@"no"];
    [UserInfoManager setInfoStatus:@"no"];
    PasswordLoginViewController *PSvc = [[PasswordLoginViewController alloc]init];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:PSvc];
//     navc.modalPresentationStyle = 0;
//    UIApplication.sharedApplication.windows[0].rootViewController = navc;
    
    UIWindow *window;
    if (@available(iOS 13.0, *)) {
            window = [UIApplication sharedApplication].windows[0];
        } else {
            window = [UIApplication sharedApplication].delegate.window;
        }
    window.rootViewController = navc;
    [window makeKeyAndVisible];
}

@end
