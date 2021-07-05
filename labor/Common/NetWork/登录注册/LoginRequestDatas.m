//
//  LoginRequestDatas.m
//  labor
//
//  Created by 狍子 on 2020/8/31.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "LoginRequestDatas.h"
#import "BaseRequestDatas.h"
#import "JsonString.h"
#import "UserInfoManager.h"
#import "LoginModel.h"
#import "PerfectYuanXiModel.h"
#import "PerfectClassModel.h"

@implementation LoginRequestDatas

/**登录*/
+ (void)loginrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{

//    NSString *path = [NSString stringWithFormat:@"%@admin/mobileUser/gettoken",Host];
    NSString *path = [NSString stringWithFormat:@"%@auth/oauth/token",Host];

    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeBaTOKEN isShowLoading:YES success:^(id  _Nonnull result) {
//        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        if ([dict.allKeys containsObject:@"access_token"]) {
            if (dict[@"access_token"] != nil&&[dict[@"access_token"] isKindOfClass:[NSNull class]]==NO) {
                LoginModel *model = [LoginModel mj_objectWithKeyValues:dict];
        //    NSArray *array =  [LoginModel mj_objectArrayWithKeyValuesArray:dict] //数组
                [UserInfoManager setToken:model.access_token];
                [UserInfoManager setLoginStatus:@"true"];
                success(@"200");
            }else{
                [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"access_token = %@",dict[@"access_token"]]];

                [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
            }

        }else{
            NSLog(@"4");
            [SVProgressHUD showInfoWithStatus:@"服务器开小差了"];

        }
    } failure:^(NSError * _Nonnull error) {
       [SVProgressHUD showInfoWithStatus:@"服务器开小差了"];
        failure(error);
        NSLog(@"登录 %@ ---%@",parameters,path);
    }];
}

/**判断角色*/
+ (void)adminroleselectUserRolerequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/role/selectUserRoleFORmov",Host];

    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:YES success:^(id  _Nonnull result) {
        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        if ([dict.allKeys containsObject:@"data"]) {
            NSLog(@"200");
//            LoginModel *model = [LoginModel mj_objectWithKeyValues:dict];
    //    NSArray *array =  [LoginModel mj_objectArrayWithKeyValuesArray:dict] //数组
            [UserInfoManager setJiaoSe:dict[@"data"]];
//            [UserInfoManager setLoginStatus:@"true"];
            success(@"200");
        }else{
            NSLog(@"4");
//            [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];

        }
    } failure:^(NSError * _Nonnull error) {
//       [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
        failure(error);
        NSLog(@"判断角色 %@ ---%@",parameters,path);
    }];
}
/**未注册手机发送验证码*/
+ (void)mobilegetmobileforfalserequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/mobile/getmobileforfalse",Host];

    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeBaTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        
        if ([dict.allKeys containsObject:@"data"]) {
            NSLog(@"200");
//            LoginModel *model = [LoginModel mj_objectWithKeyValues:dict];
    //    NSArray *array =  [LoginModel mj_objectArrayWithKeyValuesArray:dict] //数组
//            [UserInfoManager setLoginStatus:@"true"];
            if ([dict[@"data"] boolValue] == YES) {
                //发送成功
                [SVProgressHUD showSuccessWithStatus:@"验证码已发送"];

                success(@"200");
            }else{
                //失败
                if ([dict.allKeys containsObject:@"msg"]) {
                    if (dict[@"msg"] != nil ) {
                        [SVProgressHUD showInfoWithStatus:dict[@"msg"]];
                    }
                }
            }
        }else{
            NSLog(@"4");
//            [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];

        }
    } failure:^(NSError * _Nonnull error) {
//       [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
        failure(error);
        NSLog(@"未注册手机发送验证码 %@ ---%@",parameters,path);
    }];
}

/**已注册手机号获取验证码*/
+ (void)mobilegetmobilefortruerequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/mobile/getmobilefortrue",Host];

    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeBaTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        
        if ([dict.allKeys containsObject:@"data"]) {
            NSLog(@"200");
//            LoginModel *model = [LoginModel mj_objectWithKeyValues:dict];
    //    NSArray *array =  [LoginModel mj_objectArrayWithKeyValuesArray:dict] //数组
//            [UserInfoManager setLoginStatus:@"true"];
            if ([dict[@"data"] boolValue] == YES) {
                //发送成功
                [SVProgressHUD showSuccessWithStatus:@"验证码已发送"];
                [SVProgressHUD showInfoWithStatus:dict[@"msg"]];

                success(@"200");
            }else{
                //失败
                if ([dict.allKeys containsObject:@"msg"]) {
                    if (dict[@"msg"] != nil ) {
                        [SVProgressHUD showInfoWithStatus:dict[@"msg"]];
                    }
                }
            }
        }else{
            NSLog(@"4");
//            [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];

        }
    } failure:^(NSError * _Nonnull error) {
//       [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
        failure(error);
        NSLog(@"未注册手机发送验证码 %@ ---%@",parameters,path);
    }];
}
/**注册*/
+ (void)registeredregisteredrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/registered/DJregistered",Host];

    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeBaTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        if ([dict.allKeys containsObject:@"data"]) {
            NSLog(@"200");

            if ([dict[@"data"] boolValue] == YES) {
                //注册成功
                success(@"200");
            }else{
                //失败
                if ([dict.allKeys containsObject:@"msg"]) {
                    if (dict[@"msg"] != nil ) {
                        [SVProgressHUD showInfoWithStatus:dict[@"msg"]];
                    }
                }
            }
        }else{
            NSLog(@"4");
//            [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];

        }
    } failure:^(NSError * _Nonnull error) {
//       [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
        failure(error);
        NSLog(@"注册 %@ ---%@",parameters,path);
    }];
}

/**忘记密码*/
+ (void)registeredupdatePswrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/registered/updatePsw",Host];

    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeBaTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        if ([dict.allKeys containsObject:@"data"]) {
            NSLog(@"200");

            if ([dict[@"data"] boolValue] == YES) {
                //修改成功
                success(@"200");
            }else{
                //失败
                if ([dict.allKeys containsObject:@"msg"]) {
                    if (dict[@"msg"] != nil ) {
                        [SVProgressHUD showInfoWithStatus:dict[@"msg"]];
                    }
                }
            }
        }else{
            NSLog(@"4");
//            [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];

        }
    } failure:^(NSError * _Nonnull error) {
//       [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
        failure(error);
        NSLog(@"忘记密码 %@ ---%@",parameters,path);
    }];
}

/**退出登录*/
+ (void)authtokenlogoutrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@auth/token/logout",Host];

    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodDELETE HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        if ([dict.allKeys containsObject:@"data"]) {
            NSLog(@"200");

            if ([dict[@"data"] boolValue] == YES) {
                //退出成功
                success(@"200");
            }else{
                //失败
                if ([dict.allKeys containsObject:@"msg"]) {
                    if (dict[@"msg"] != nil ) {
                        [SVProgressHUD showInfoWithStatus:dict[@"msg"]];
                    }
                }
            }
        }else{
            NSLog(@"4");
//            [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];

        }
    } failure:^(NSError * _Nonnull error) {
//       [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
        failure(error);
        NSLog(@"忘记密码 %@ ---%@",parameters,path);
    }];
}

/**通过学校id查询系部*/
+ (void)sysdepartmentgetdeptmentbydepdidrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysdepartment/getdeptmentbydepdid",Host];

    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        if ([dict.allKeys containsObject:@"data"]) {
            NSLog(@"200");

               NSArray *array =  [PerfectYuanXiModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                //退出成功
                success(array);
      
        }else{
            NSLog(@"4");
//            [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];

        }
    } failure:^(NSError * _Nonnull error) {
//       [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
        failure(error);
        NSLog(@"忘记密码 %@ ---%@",parameters,path);
    }];
}

/**通过系部id查询班级*/
+ (void)sysclassgetdeptmentbydepdidrequestDataWithparameters:(nullable id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysclass/getdeptmentbydepdid",Host];

    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        if ([dict.allKeys containsObject:@"data"]) {
            NSLog(@"200");

            NSArray *array =  [PerfectClassModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                //退出成功
                success(array);
        }else{
            NSLog(@"4");
//            [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];

        }
    } failure:^(NSError * _Nonnull error) {
//       [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
        failure(error);
        NSLog(@"忘记密码 %@ ---%@",parameters,path);
    }];
}

/**判断信息是否完善*/
+ (void)mobileUsercheckoverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/mobileUser/checkover",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
              success(result);


              
          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
  
          failure(error);
          NSLog(@"判断信息是否完善 %@ ---%@",parameters,path);
      }];
}

/**完善信息<学校，院系，班级>*/
+ (void)mobileUserputoverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/mobileUser/putover",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
              if ([dict[@"data"] boolValue] == YES) {
                  //成功
                  [UserInfoManager setInfoStatus:@"true"];
                  success(@"200");
              }else{
                  //失败
                  if ([dict.allKeys containsObject:@"msg"]) {
                      if (dict[@"msg"] != nil ) {
                          [SVProgressHUD showInfoWithStatus:dict[@"msg"]];
                      }
                  }
              }


              
          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
  
          failure(error);
          NSLog(@"完善信息 %@ ---%@",parameters,path);
      }];
}
/**用户协议*/
+ (void)yonghuxieyirequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"http://111.74.0.243:9162/"];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeNULL isShowLoading:NO success:^(id  _Nonnull result) {
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
//          NSLog(@"%@",result);
          if ([dict.allKeys containsObject:@"data"]) {
              if ([dict[@"data"] boolValue] == YES) {
                  //成功
                  [UserInfoManager setInfoStatus:@"true"];
                  success(@"200");
              }else{
                  //失败
                  if ([dict.allKeys containsObject:@"msg"]) {
                      if (dict[@"msg"] != nil ) {
                          [SVProgressHUD showInfoWithStatus:dict[@"msg"]];
                      }
                  }
              }


              
          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
  
          failure(error);
          NSLog(@"用户协议 %@ ---%@",parameters,path);
      }];
}
@end
