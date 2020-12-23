//
//  MyCircleCenterRequestDatas.m
//  labor
//
//  Created by 狍子 on 2020/9/14.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyCircleCenterRequestDatas.h"
#import "BaseRequestDatas.h"
#import "JsonString.h"
#import "MyCircleCenterHomeModel.h"
#import "GetCommentVoListModel.h"
#import "DangYuanGuShiFangModel.h"
#import "MingZhuPingYiModel.h"
#import "MingZhuPingYiDetailsModel.h"
#import "NewHuoDongModel.h"
#import "ZhuTiHuoDongModel.h"
#import "GuShiFangModel.h"


@implementation MyCircleCenterRequestDatas
/**新增我的劳动圈*/
+ (void)myzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@activity/myzone/addmyzoneios",Host];
            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:dict HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
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
               [SVProgressHUD showInfoWithStatus:@"服务器开小差了，重拍一次试试"];
                failure(error);
                NSLog(@"新增我的劳动圈 %@ ---%@",parameters,path);
            }];
}

/**分页查询*/
+ (void)myzonepagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@activity/myzone/getall",Host];
//            NSString *JsonStr = [JsonString convertToJsonData:parameters];
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[@"myzone"] = JsonStr;
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                NSLog(@"%@",result);
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
                 NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    
//                 NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                    success(array);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"分页查询 %@ ---%@",parameters,path);
            }];
}

/**学校圈<图片接口>*/
+ (void)myzonepageimgrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
               NSString *path = [NSString stringWithFormat:@"%@activity/myzone/pageimg",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
                [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);

                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
    //                 NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"学校圈<图片接口> %@ ---%@",parameters,path);
                }];
}

/**视频圈*/
+ (void)myzonepagevidrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
            NSString *path = [NSString stringWithFormat:@"%@activity/myzone/pagevid",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
                [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
    //                 NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"视频圈 %@ ---%@",parameters,path);
                }];
}
/**查询到置顶的帖子*/
+ (void)myzonegetupzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
               NSString *path = [NSString stringWithFormat:@"%@activity/myzone/getupzone",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        

                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"查询到置顶的帖子 %@ ---%@",parameters,path);
                }];
}

/**热度*/
+ (void)myzonegetFirerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
               NSString *path = [NSString stringWithFormat:@"%@activity/myzone/getFire",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        

                        success(dict);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"热度 %@ ---%@",parameters,path);
                }];
}

/**点击签到*/
+ (void)syssignaddsignrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/syssign/addsign",Host];
//            NSString *JsonStr = [JsonString convertToJsonData:parameters];
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[@"myzone"] = JsonStr;
[BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//         NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
             

             success(dict);

         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//        [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"点击签到 %@ ---%@",parameters,path);

     }];
}

/**签到状态*/
+ (void)syssignsignstatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/syssign/signstatus",Host];
//            NSString *JsonStr = [JsonString convertToJsonData:parameters];
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[@"myzone"] = JsonStr;
[BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//         NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
             

             success(dict);

         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//        [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"签到状态 %@ ---%@",parameters,path);

     }];
}

/**查询连续登签到天数*/
+ (void)syssigngetsigninrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/syssign/getsignin",Host];
//            NSString *JsonStr = [JsonString convertToJsonData:parameters];
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[@"myzone"] = JsonStr;
[BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
         
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
             

             success(dict);

         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
   
//        [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"查询连续登签到天数 %@ ---%@",parameters,path);

     }];
}

/**评论列表*/
+ (void)CCmobileIndexgetCommentVoListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
       NSString *path = [NSString stringWithFormat:@"%@admin/myzonemember/pages",Host];
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
            NSLog(@"评论列表 %@ ---%@",parameters,path);

        }];
}
/**提交评论*/
+ (void)CCmobileIndexsubmitCommentrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@admin/myzonemember/addmember",Host];
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
                NSLog(@"提交评论 %@ ---%@",parameters,path);

            }];
}

/**劳动圈详情*/
+ (void)myzonegetbyidrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/myzone/getbyidios",Host];
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
//             NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
             MyCircleCenterHomeModel *model = [MyCircleCenterHomeModel mj_objectWithKeyValues:dict[@"data"]];
             success(model);

         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"劳动圈详情 %@ ---%@",parameters,path);

     }];
}

/**移动端查询党员故事坊*/
+ (void)CCmyzonegetListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/myzone/getList",Host];
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
             NSDictionary *dict1 = [NSDictionary dictionary];
             dict1 = dict[@"data"];
             if ([dict1.allKeys containsObject:@"records"]) {
                 NSArray *array =  [DangYuanGuShiFangModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
    //             MyCircleCenterHomeModel *model = [MyCircleCenterHomeModel mj_objectWithKeyValues:dict[@"data"]];
                 success(array);
             }


         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"移动端查询党员故事坊 %@ ---%@",parameters,path);

     }];
}
/**民主评议列表*/
+ (void)activityvotingvotingCenterrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/voting/votingCenter",Host];
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
             NSDictionary *dict1 = [NSDictionary dictionary];
             dict1 = dict[@"data"];
             if ([dict1.allKeys containsObject:@"records"]) {
                 NSArray *array =  [MingZhuPingYiModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
    //             MyCircleCenterHomeModel *model = [MyCircleCenterHomeModel mj_objectWithKeyValues:dict[@"data"]];
                 success(array);
             }


         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"民主评议列表 %@ ---%@",parameters,path);

     }];
}

/**民主评议详情*/
+ (void)activityvotinggetVotingDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/voting/getVotingDetails",Host];
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
//             NSDictionary *dict1 = [NSDictionary dictionary];
//             dict1 = dict[@"data"];
//             if ([dict1.allKeys containsObject:@"records"]) {
//                 NSArray *array =  [MingZhuPingYiModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
                 MingZhuPingYiDetailsModel *model = [MingZhuPingYiDetailsModel mj_objectWithKeyValues:dict[@"data"]];
                 success(model);
//             }


         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"民主评议详情 %@ ---%@",parameters,path);

     }];
}

/**民主评议投票*/
+ (void)activityvotinggetOnVotingformovrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/voting/getOnVotingformov",Host];
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
             if ([dict[@"data"] boolValue] == YES) {
                 [SVProgressHUD showSuccessWithStatus:@"投票成功"];

             }else{
                 [SVProgressHUD showSuccessWithStatus:dict[@"msg"]];

             }

//             NSDictionary *dict1 = [NSDictionary dictionary];
//             dict1 = dict[@"data"];
//             if ([dict1.allKeys containsObject:@"records"]) {
//                 NSArray *array =  [MingZhuPingYiModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
//                 MingZhuPingYiDetailsModel *model = [MingZhuPingYiDetailsModel mj_objectWithKeyValues:dict[@"data"]];
                 success(dict);
//             }


         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"民主评议详情 %@ ---%@",parameters,path);

     }];
}

/**三会一课/主题活动/党建活动*/
+ (void)activitymobileActivitygetPagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
//    NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/getPage",Host];
    NSString *path = [NSString stringWithFormat:@"%@activity/activity/pagetest",Host];
    
    
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
//             if ([dict[@"data"] boolValue] == YES) {
//                 [SVProgressHUD showSuccessWithStatus:@"投票成功"];
//
//             }else{
//                 [SVProgressHUD showSuccessWithStatus:dict[@"msg"]];
//
//             }

             NSDictionary *dict1 = [NSDictionary dictionary];
             dict1 = dict[@"data"];
             if ([dict1.allKeys containsObject:@"records"]) {
                 NSArray *array =  [NewHuoDongModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
//                 MingZhuPingYiDetailsModel *model = [MingZhuPingYiDetailsModel mj_objectWithKeyValues:dict[@"data"]];
                 success(array);
             }


         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"三会一课/主题活动/党建活动 %@ ---%@",parameters,path);

     }];
}

/**获取活动详情*/
+ (void)activitymobileActivitygetDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/getDetails",Host];
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
//             if ([dict[@"data"] boolValue] == YES) {
//                 [SVProgressHUD showSuccessWithStatus:@"投票成功"];
//
//             }else{
//                 [SVProgressHUD showSuccessWithStatus:dict[@"msg"]];
//
//             }

//             NSDictionary *dict1 = [NSDictionary dictionary];
//             dict1 = dict[@"data"];
//             if ([dict1.allKeys containsObject:@"records"]) {
//                 NSArray *array =  [NewHuoDongModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
             ZhuTiHuoDongModel *model = [ZhuTiHuoDongModel mj_objectWithKeyValues:dict[@"data"]];
                 success(model);
//             }


         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"获取活动详情 %@ ---%@",parameters,path);

     }];
}
/**报名*/
+ (void)activitymobileActivitysingUprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/singUp",Host];
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
             if ([dict[@"data"] boolValue] == YES) {
//                 [SVProgressHUD showSuccessWithStatus:@"投票成功"];
                 success(result);

             }else{
                 [SVProgressHUD showInfoWithStatus:dict[@"msg"]];

             }

//             NSDictionary *dict1 = [NSDictionary dictionary];
//             dict1 = dict[@"data"];
//             if ([dict1.allKeys containsObject:@"records"]) {
//                 NSArray *array =  [NewHuoDongModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
////                 MingZhuPingYiDetailsModel *model = [MingZhuPingYiDetailsModel mj_objectWithKeyValues:dict[@"data"]];
//                 success(array);
//             }


         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"获取活动详情 %@ ---%@",parameters,path);

     }];
}

/**故事坊轮播图*/
+ (void)activitymobileActivitygetuplistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/myzone/getupList",Host];
 //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
     [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSLog(@"%@",result);
         NSDictionary *dict = [NSDictionary dictionary];
         dict = result;
         if ([dict.allKeys containsObject:@"data"]) {
//                 [SVProgressHUD showSuccessWithStatus:@"投票成功"];
                NSDictionary *dict1 = [NSDictionary dictionary];
                            dict1 = dict[@"data"];
                NSArray *array =  [GuShiFangModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
                 success(array);

           

//             NSDictionary *dict1 = [NSDictionary dictionary];
//             dict1 = dict[@"data"];
//             if ([dict1.allKeys containsObject:@"records"]) {
//                 NSArray *array =  [NewHuoDongModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
////                 MingZhuPingYiDetailsModel *model = [MingZhuPingYiDetailsModel mj_objectWithKeyValues:dict[@"data"]];
//                 success(array);
//             }


         }else{
             NSLog(@"4");

         }
     } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
         failure(error);
         NSLog(@"获取活动详情 %@ ---%@",parameters,path);

     }];
}
@end
