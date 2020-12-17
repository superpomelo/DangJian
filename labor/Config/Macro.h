//
//  Macro.h
//  com.tkhy.driver
//
//  Created by 狍子 on 2020/8/4.
//  Copyright © 2020 TK. All rights reserved.
//

#ifndef Macro_h
#define Macro_h
//本地
static NSString * const Host = @"http://192.168.0.9:9999/";

//正式
//static NSString * const Host = @"http://111.74.0.243:9999/";
static NSString * const VideoHost = @"http://47.111.139.74:8089/";




/// 弱引用对象
#define SL_WeakSelf __weak typeof(self) weakSelf = self;
///主线程操作
#define SL_DISPATCH_ON_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(),mainQueueBlock);

#define kGreenColor     [UIColor colorWithRed:196/255.0 green:48/255.0 blue:48/255.0 alpha:1]
#define db8eColor     [UIColor colorWithRed:80/255.0 green:219/255.0 blue:142/255.0 alpha:1]
#define AppPlaceholderLunboImage   [UIImage imageNamed:@"bg_sign"]

#define SCR_W     [UIScreen mainScreen].bounds.size.width
#define SCR_H     [UIScreen mainScreen].bounds.size.height
/// 屏幕宽高
#define SL_kScreenWidth [UIScreen mainScreen].bounds.size.width
#define SL_kScreenHeight [UIScreen mainScreen].bounds.size.height
//----------------------About Color 颜色 ----------------------------

/// 随机颜色
#define SL_UIColorFromRandomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]
/// rgb颜色
#define SL_UIColorFromRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
/// 16进制 颜色
#define SL_UIColorFromHex(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

//----------------------About Log 打印日志 ----------------------------

/// 打印
#define SL_NSLog(...) printf("%f %s %ld :%s\n",[[NSDate date]timeIntervalSince1970],strrchr(__FILE__,'/'),[[NSNumber numberWithInt:__LINE__] integerValue],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
#ifdef DEBUG
#   define SL_Log(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define SL_Log(...)
#endif

//----------------------About Shader 着色器 ----------------------------
//#x 将参数x字符串化
#define STRINGIZE(x)    #x
#define STRINGIZE2(x)    STRINGIZE(x)
#define Shader_String(text) @ STRINGIZE2(text)



#endif /* Macro_h */
