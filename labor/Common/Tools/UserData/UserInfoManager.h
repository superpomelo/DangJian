//
//  UserInfoManager.h
//  
//
//  Created by superpomelo on 2018/9/13.
//  Copyright © 2018年 XQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

//用户有关的相对应数据
#define UserDefault  [NSUserDefaults standardUserDefaults]
@interface UserInfoManager : NSObject


/**当前坐标点（存）*/
//+ (void)setCurrentCoordinates:(CLLocation*)Currentcoordinates;
///**当前坐标点（取）*/
//+ (CLLocation*)getCurrentcoordinates;


/**当前经度（存）*/
+ (void)setLon:(NSString*)Lonstring;
/**当前经度（取）*/
+ (NSString*)getLonstring;

/**当前纬度（存）*/
+ (void)setLat:(NSString*)Latstring;
/**当前纬度（取）*/
+ (NSString*)getLatstring;

/**用户角色（存）*/
+ (void)setJiaoSe:(NSString*)JiaoSe;
/**用户角色（取）*/
+ (NSString*)getJiaoSe;

/**用户token（存）*/
+ (void)setToken:(NSString*)token;
/**用户token（取）*/
+ (NSString*)getToken;

/**用户id（存）*/
+ (void)setUid:(int)uid;
/**用户id（取）*/
+ (int)getUid;
/**网络状态（存）*/
+ (void)setAFNetworkReachabilityStatus:(NSString*)status;
/**网络状态（取）*/
+ (NSString*)getAFNetworkReachabilityStatus;
/**信息完善状态（存）*/
+ (void)setInfoStatus:(NSString*)status;
/**信息完善状态（取）*/
+ (NSString*)getInfoStatus;
/**登录状态（存）*/
+ (void)setLoginStatus:(NSString*)status;
/**登录状态（取）*/
+ (NSString*)getLoginStatus;

/**引导页标记（存）*/
+ (void)setGuideStatus:(NSString*)Guide;
/**引导页标记（取）*/
+ (NSString*)getGuide;

/**删除保存的所有数据*/
+ (void)RemoveAllValue;
@end
