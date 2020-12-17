//
//  UserInfoManager.m
//  
//
//  Created by superpomelo on 2018/9/13.
//  Copyright © 2018年 XQ. All rights reserved.
//

#define CurrentCoordinates @"currentcoordinate" //当前坐标点
#define Lats @"latstring"
#define Lons @"lonstring"

#define Token @"token"
#define Uid @"uid"
#define LoginStatus @"loginstatus"
#define GuideStatus @"guidestatus"
#define JiaoSes @"jiaose"
#define InfoStatus @"infostatus"
#define AFNetworkReachabilityU @"afnreachability"

#import "UserInfoManager.h"

@implementation UserInfoManager

/**当前坐标点（存）*/
//+ (void)setCurrentCoordinates:(CLLocation*)Currentcoordinates{
//    [UserDefault setObject:[NSKeyedArchiver archivedDataWithRootObject:Currentcoordinates] forKey:CurrentCoordinates];
//    [UserDefault synchronize];
//    
//}
/**当前坐标点（取）*/
//+ (CLLocation*)getCurrentcoordinates{
//     return [NSKeyedUnarchiver unarchiveObjectWithData:[UserDefault objectForKey:CurrentCoordinates]];
//}
/**当前经度（存）*/
+ (void)setLon:(NSString*)Lonstring{
    [UserDefault setObject:Lonstring forKey:Lons];
    [UserDefault synchronize];
}
/**当前经度（取）*/
+ (NSString*)getLonstring{
    return [UserDefault objectForKey:Lons];
}


/**当前纬度（存）*/
+ (void)setLat:(NSString*)Latstring{
    [UserDefault setObject:Latstring forKey:Lats];
    [UserDefault synchronize];
}
/**当前纬度（取）*/
+ (NSString*)getLatstring{
    return [UserDefault objectForKey:Lats];
}



/**用户token（存）*/
+ (void)setToken:(NSString*)token{
    [UserDefault setObject:token forKey:Token];
    [UserDefault synchronize];
}

/**用户角色（存）*/
+ (void)setJiaoSe:(NSString*)JiaoSe{
    [UserDefault setObject:JiaoSe forKey:JiaoSes];
    [UserDefault synchronize];
}
/**用户角色（取）*/
+ (NSString*)getJiaoSe{
    return [UserDefault objectForKey:JiaoSes] ;
}
/**用户token（取）*/
+ (NSString*)getToken{
    return [UserDefault objectForKey:Token] ;
    
}
/**用户id（存）*/
+ (void)setUid:(int)uid{
    [UserDefault setObject:[NSString stringWithFormat:@"%d",uid] forKey:Uid];
    [UserDefault synchronize];
}
/**用户id（取）*/
+ (int)getUid{
    return [[UserDefault objectForKey:Uid] intValue];

}
/**网络状态（存）*/
+ (void)setAFNetworkReachabilityStatus:(NSString*)status{
    [UserDefault setObject:status forKey:AFNetworkReachabilityU];
    [UserDefault synchronize];
}
/**网络状态（取）*/
+ (NSString*)getAFNetworkReachabilityStatus{
    return [UserDefault objectForKey:AFNetworkReachabilityU];

}
/**信息完善状态（存）*/
+ (void)setInfoStatus:(NSString*)status{
    [UserDefault setObject:status forKey:InfoStatus];
    [UserDefault synchronize];
}
/**信息完善状态（取）*/
+ (NSString*)getInfoStatus{
    return [UserDefault objectForKey:InfoStatus];

}
/**登录状态（存）*/
+ (void)setLoginStatus:(NSString*)status{
    [UserDefault setObject:status forKey:LoginStatus];
    [UserDefault synchronize];
}

/**登录状态（取）*/
+ (NSString*)getLoginStatus{
    return [UserDefault objectForKey:LoginStatus];
}
/**引导页标记（存）*/
+ (void)setGuideStatus:(NSString*)Guide{
    [UserDefault setObject:Guide forKey:GuideStatus];
    [UserDefault synchronize];
}
/**引导页标记（取）*/
+ (NSString*)getGuide{
     return [UserDefault objectForKey:GuideStatus];
}

/**删除保存的所有数据*/
+ (void)RemoveAllValue{
     [UserDefault removeObjectForKey:LoginStatus];
     [UserDefault removeObjectForKey:Uid];
     [UserDefault removeObjectForKey:Token];
}
@end
