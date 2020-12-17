//
//  LoginRequestDatas.h
//  labor
//
//  Created by 狍子 on 2020/8/31.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface LoginRequestDatas : NSObject

/**登录*/
+ (void)loginrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**判断角色*/
+ (void)adminroleselectUserRolerequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**未注册手机发送验证码*/
+ (void)mobilegetmobileforfalserequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**已注册手机号获取验证码*/
+ (void)mobilegetmobilefortruerequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**注册*/
+ (void)registeredregisteredrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**忘记密码*/
+ (void)registeredupdatePswrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**退出登录*/
+ (void)authtokenlogoutrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**通过学校id查询系部*/
+ (void)sysdepartmentgetdeptmentbydepdidrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**通过系部id查询班级*/
+ (void)sysclassgetdeptmentbydepdidrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**判断信息是否完善*/
+ (void)mobileUsercheckoverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**完善信息<学校，院系，班级>*/
+ (void)mobileUserputoverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**用户协议*/
+ (void)yonghuxieyirequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
