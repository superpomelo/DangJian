//
//  RootViewController.m
//  JZLTabbar
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import "RootViewController.h"
//#import "FirstViewController.h"
//#import "SecondViewController.h"
//#import "ThirdViewController.h"
//#import "FourthViewController.h"
//#import "FifthViewController.h"
#import "JZLTabBar.h"

#import "LaborCenterHomeViewController.h"
#import "LearningCenterHomeViewController.h"
#import "MyCircleCenterHomeViewController.h"
#import "PersonalCenterHomeViewController.h"


@interface RootViewController ()<JZLTabBarDelegate>
@property (nonatomic, strong) LaborCenterHomeViewController *firstVC;
@property (nonatomic, strong) LearningCenterHomeViewController *secondVC;
@property (nonatomic, strong) MyCircleCenterHomeViewController *thirdVC;
@property (nonatomic, strong) PersonalCenterHomeViewController *fourthVC;
//@property (nonatomic, strong) PersonalCenterHomeViewController *fifthVC;
@property (nonatomic, strong) JZLTabBar *JZLTabBar;
@property (nonatomic, strong) NSMutableArray *viewControllerCountArray;
@end

@implementation RootViewController

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    // 2.删除自动创建的tabBarButton
//    for (UIView *view in self.tabBar.subviews ) {
//        [view removeFromSuperview];
//    }
//    // 把self.wj_tabBar添加到视图上
//    [self.tabBar addSubview:self.JZLTabBar];
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatChildVC];
//    [self.tabBar showBadge:@"99" badgeColor:[UIColor purpleColor] badgeBackgroundColor:[UIColor greenColor] atIndex:2];
}

#pragma mark - 创建子控制器
- (void)creatChildVC {
    self.firstVC = [[LaborCenterHomeViewController alloc] init];
    self.secondVC = [[LearningCenterHomeViewController alloc] init];
    self.thirdVC = [[MyCircleCenterHomeViewController alloc] init];
    self.fourthVC = [[PersonalCenterHomeViewController alloc] init];
//    self.fifthVC = [[FifthViewController alloc] init];
    [self creatTagbBarWithChildVCArray:@[self.firstVC,self.secondVC,self.thirdVC,self.fourthVC] titleArray:@[@"首页", @"党建之窗",@"组织生活", @"我的"] imageArray:@[@"路径 14", @"组件 12 – 1",@"组件 14 – 1",  @"组 11"] selectedImageArray:@[@"路径 27", @"组件 2 – 1",@"组件 15 – 1",@"联合 2"]];
}

//添加子模块
- (void)creatTagbBarWithChildVCArray:(NSArray <UIViewController *>*)childVCArray titleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *>*)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray {
    for (UIViewController *viewController in childVCArray) {
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self.viewControllerCountArray addObject:navigationController];
    }
    self.JZLTabBar = [JZLTabBar tabBarWithFrame:self.tabBar.bounds titleArray:titleArray imageArray:imageArray selectedImageArray:selectedImageArray];
    self.JZLTabBar.JZLTabBarDelegate = self;
    [self setValue:self.JZLTabBar forKeyPath:@"tabBar"];
    self.viewControllers = self.viewControllerCountArray;
    self.selectedIndex = 0;
}


#pragma mark - cansTabBarDelegate
- (void)selectedJZLTabBarItemAtIndex:(NSInteger)index {
    self.selectedIndex = index;
}


#pragma mark - 重写selectedIndex的set方法
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    self.JZLTabBar.selectedIndex = selectedIndex;
}





- (NSMutableArray *)viewControllerCountArray {
    if (!_viewControllerCountArray) {
        _viewControllerCountArray = [[NSMutableArray alloc] init];
    }
    return _viewControllerCountArray;
}


@end













