//
//  SwitchRootController.h
//  com.tkhy.driver
//
//  Created by 狍子 on 2020/4/28.
//  Copyright © 2020 CherryKing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwitchRootController : NSObject
/**切换根控制器到首页*/
+(void)goHomeViewController;
/**切换根控制器到登录界面*/
+(void)goLoginController;
@end

NS_ASSUME_NONNULL_END
