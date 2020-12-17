//
//  LearningCenterRequest.m
//  labor
//
//  Created by 狍子 on 2020/9/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  学习模块的接口

#import "LearningCenterRequest.h"
#import "BaseRequestDatas.h"
#import "JsonString.h"
#import "UserInfoManager.h"
#import "LearningCenterHomeModel.h"
#import "LearningCenterDetailsModel.h"
#import "GetCommentVoListModel.h"

@implementation LearningCenterRequest
/**劳动知识*/
+ (void)mobileIndexinformationonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
       NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/informationone",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//            NSLog(@"%@",result);
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            if ([dict.allKeys containsObject:@"data"]) {
//                NSLog(@"200");
                NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                success(array);

            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"劳动知识 %@ ---%@",parameters,path);
        }];
}

/**民俗知识*/
+ (void)mobileIndexinformationtworequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/informationtwo",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
//                    NSLog(@"200");
    NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
            success(array);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"民俗知识 %@ ---%@",parameters,path);
            }];
}

/**国学知识*/
+ (void)mobileIndexinformationthrrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/informationthr",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                NSLog(@"%@",result);
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
                    NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(array);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"国学知识 %@ ---%@",parameters,path);
            }];
}

/**农业科技*/
+ (void)mobileIndexinformationfourequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/informationfou",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                NSLog(@"%@",result);
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
                    NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(array);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"农业科技 %@ ---%@",parameters,path);

            }];
}

/**新闻时事*/
+ (void)mobileIndexinformationfivrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/informationfiv",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                NSLog(@"%@",result);
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
                 NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(array);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"新闻时事 %@ ---%@",parameters,path);

            }];
}
/**新闻详情*/
+ (void)mobileIndexinformationDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
       NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/informationDetails",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSLog(@"%@",result);
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            if ([dict.allKeys containsObject:@"data"]) {

                success(dict);

            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"新闻详情 %@ ---%@",parameters,path);

        }];
}
/**评论列表*/
+ (void)mobileIndexgetCommentVoListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
//    getCommentVoList  mobileIndex
       NSString *path = [NSString stringWithFormat:@"%@information/comment/pages",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSLog(@"%@",result);
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            if ([dict.allKeys containsObject:@"data"]) {
//             NSArray *array =  [GetCommentVoListModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                success(dict);

            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"评论列表 %@ ---%@",parameters,path);

        }];
}
/**提交评论*/
+ (void)mobileIndexsubmitCommentrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/submitComment",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
    //             NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(@"1");

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"提交评论 %@ ---%@",parameters,path);

            }];
}

/**新增点赞表*/
+ (void)sysuprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@admin/sysup",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                NSLog(@"%@",result);
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
    //             NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(@"1");

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"新增点赞表 %@ ---%@",parameters,path);

            }];
}

/**取消点赞*/
+ (void)sysupmycollectdelerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@admin/sysup/mycollectdele",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                NSLog(@"%@",result);
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
    //             NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(@"1");

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"取消点赞 %@ ---%@",parameters,path);

            }];
}

/**点赞状态*/
+ (void)sysupmycollectstatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@admin/sysup/mycollectstatus",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
    //             NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(dict);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"点赞状态 %@ ---%@",parameters,path);

            }];
}
/**点赞数量*/
+ (void)sysupmycollectalluprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@admin/sysup/allup",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
    //             NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(dict);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"点赞状态 %@ ---%@",parameters,path);

            }];
}
/**加积分*/
+ (void)sysintegralsaveIntegralFORMOVrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sys-integral/saveIntegralFORMOV",Host];
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
//             NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
             success(dict);

         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"加积分 %@ ---%@",parameters,path);

     }];
}


///**新增收藏*/
//+ (void)LCsyscollectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
//                NSString *path = [NSString stringWithFormat:@"%@information/syscollect",Host];
//    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
//                [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
//                    NSDictionary *dict = [NSDictionary dictionary];
//                    dict = result;
//                    if ([dict.allKeys containsObject:@"data"]) {
//                        NSLog(@"200");
//                        
//        //                NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
//                        success(@"200");
//
//                    }else{
//                        NSLog(@"4");
//
//                    }
//                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
//                    failure(error);
//                }];
//}
//
///**删除收藏*/
//+ (void)LCsyscollectmycollectdelerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
//                NSString *path = [NSString stringWithFormat:@"%@information/syscollect/mycollectdele",Host];
//    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
//                [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
//                    NSDictionary *dict = [NSDictionary dictionary];
//                    dict = result;
//                    if ([dict.allKeys containsObject:@"data"]) {
//                        NSLog(@"200");
//                        
//        //                NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
//                        success(@"200");
//
//                    }else{
//                        NSLog(@"4");
//
//                    }
//                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
//                    failure(error);
//                }];
//}
//
///**收藏状态*/
//+ (void)LCsyscollectmycollectstatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
//                NSString *path = [NSString stringWithFormat:@"%@information/syscollect/mycollectstatus",Host];
//    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
//                [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSDictionary *dict = [NSDictionary dictionary];
//                    dict = result;
//                    if ([dict.allKeys containsObject:@"data"]) {
//                        NSLog(@"200");
//                        
//        //                NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
//                        success(dict);
//
//                    }else{
//                        NSLog(@"4");
//
//                    }
//                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
//                    failure(error);
//                }];
//}
@end
