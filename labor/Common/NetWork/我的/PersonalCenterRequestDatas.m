//
//  PersonalCenterRequestDatas.m
//  labor
//
//  Created by 狍子 on 2020/9/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "PersonalCenterRequestDatas.h"
#import "BaseRequestDatas.h"
#import "JsonString.h"
#import "MyPointsModel.h"
#import "PersonalCenterHomeModel.h"
#import "SchoolNameModel.h"
#import "RankListModel.h"
#import "kechengModel.h"
#import "xinwenModel.h"
#import "quanziModel.h"
#import "PersonalMyCircleModel.h"
#import "MyTaskAssessmentModel.h"
#import "MyTaskAssessmentTeacher2Model.h"
#import "PublishTaskClassModel.h"
#import "MyTaskAssessmentTeacherModel.h"
#import "MyTaskAssessmentTeacher1Model.h"
#import "MyTaskAssessmentTeacher2Model.h"
#import "MyTaskAssessmentTeacher3Model.h"
#import "WoDeGuShiListModel.h"
#import "MingZuModel.h"
#import "ShengFenXuanZeModel.h"
#import "RuDangShenQingModel.h"
#import "WodexindeListModel.h"
#import "Guanxizhuanjie1Model.h"
#import "ChangjianWenTiModel.h"

@implementation PersonalCenterRequestDatas
/**个人资料*/
+ (void)mobileUsergetPersonalCenterVorequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
               NSString *path = [NSString stringWithFormat:@"%@admin/mobileUser/getPersonalCenterVo",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
                [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        PersonalCenterHomeModel *model = [PersonalCenterHomeModel mj_objectWithKeyValues:dict[@"data"]];

                        success(model);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"个人资料 %@ ---%@",parameters,path);
                }];
}
/**更改头像*/
+ (void)mobileUseravatarrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/mobileUser/avatar",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
    //                 NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                        success(@"200");

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"更改头像 %@ ---%@",parameters,path);
                }];
}
/**个人信息修改*/
+ (void)mobileUsermyInforequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
        NSString *path = [NSString stringWithFormat:@"%@admin/mobileUser/myInfo",Host];
        //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
        //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        //    dict[@"myzone"] = JsonStr;
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                        NSLog(@"%@",result);
                        NSDictionary *dict = [NSDictionary dictionary];
                        dict = result;
                        if ([dict.allKeys containsObject:@"data"]) {
    //                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                            
        //                 NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                            success(@"200");

                        }else{
                            NSLog(@"4");

                        }
                    } failure:^(NSError * _Nonnull error) {
//                       [SVProgressHUD showInfoWithStatus:@"failure"];
                        failure(error);
                        NSLog(@"个人信息修改 %@ ---%@",parameters,path);
                    }];
}

/**我的积分*/
+ (void)mobileUsermyWaterrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
        NSString *path = [NSString stringWithFormat:@"%@admin/mobileUser/myWater",Host];
        //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
        //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        //    dict[@"myzone"] = JsonStr;
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                        NSLog(@"%@",result);
                        NSDictionary *dict = [NSDictionary dictionary];
                        dict = result;
                        if ([dict.allKeys containsObject:@"data"]) {
    //                     NSArray *array =  [MyCircleCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                            
                         NSArray *array =  [MyPointsModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                            success(array);

                        }else{
                            NSLog(@"4");

                        }
                    } failure:^(NSError * _Nonnull error) {
//                       [SVProgressHUD showInfoWithStatus:@"failure"];
                        failure(error);
                        NSLog(@"我的积分 %@ ---%@",parameters,path);
                    }];
}
/**查询积分对象<总积分>*/
+ (void)sysintegralgetSysIntegralrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sys-integral/getSmyIntegral",Host];
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
                    NSLog(@"查询积分对象<总积分> %@ ---%@",parameters,path);
                }];
}
/**我的周榜*/
+ (void)sysintegralwatermyweeklistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sys-integral-water/myweeklist",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [SchoolNameModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(dict);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"我的周榜 %@ ---%@",parameters,path);
                }];
}
/**我的月榜*/
+ (void)sysintegralwatermymoulistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sys-integral-water/mymoulist",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [SchoolNameModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(dict);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"我的月榜 %@ ---%@",parameters,path);
                }];
}

/**日榜*/
+ (void)sysintegralwaterdaylistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sys-integral-water/daylist",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [RankListModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"日榜 %@ ---%@",parameters,path);
                }];
}
/**周榜*/
+ (void)sysintegralwaterweeklistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sys-integral-water/weeklist",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [RankListModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"周榜 %@ ---%@",parameters,path);
                }];
}

/**月榜*/
+ (void)sysintegralwatermoulistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sys-integral-water/moulist",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [RankListModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"月榜 %@ ---%@",parameters,path);
                }];
}
/**学校列表*/
+ (void)admindeptgetDeptVoListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/dept/getDeptVoList",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [SchoolNameModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"学校列表 %@ ---%@",parameters,path);
                }];
}

/**个人已发表心得接口<课程>*/
+ (void)mobileLearnmyExperiencerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@learn/mobileLearn/myExperience",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [kechengModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"个人已发表心得接口<课程> %@ ---%@",parameters,path);
                }];
}
/**我的新闻评论<新闻>*/
+ (void)mobileIndexmynewscommentrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/mynewscomment",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [xinwenModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"我的新闻评论<新闻> %@ ---%@",parameters,path);
                }];
}

/**我的劳动圈评论<劳动圈>*/
+ (void)myzonemembergetownzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/myzonemember/getownzone",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [quanziModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"我的劳动圈评论<劳动圈> %@ ---%@",parameters,path);
                }];
}
/**我的收藏<分页查询>*/
+ (void)syscollectpagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/syscollect/mycollect",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
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
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"我的收藏<分页查询> %@ ---%@",parameters,path);
                }];
}

/**查询我的劳动圈*/
+ (void)myzonegetownzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/myzone/getownzone",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [PersonalMyCircleModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"查询我的劳动圈 %@ ---%@",parameters,path);
                }];
}

/**我的劳动圈删除*/
+ (void)myzonedelegaterequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/removeByIdforMOV",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodDELETE HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        if ([dict[@"data"] boolValue] == YES) {
                            [SVProgressHUD showSuccessWithStatus:@"删除成功"];
                            success(@"200");

                        }else{
                            [SVProgressHUD showInfoWithStatus:@"删除失败"];


                        }
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"我的劳动圈删除 %@ ---%@",parameters,path);
                }];
}

/**新增心得表<提交任务考核《学生》>*/
+ (void)experiencerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/experience",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                        NSArray *array =  [PersonalMyCircleModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(result);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"新增心得表<提交任务考核《学生》> %@ ---%@",parameters,path);
                }];
}
/**已经报名的组织活动*/
+ (void)mobileActivitygetMyHaveSignrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/getLive",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [MyTaskAssessmentModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"已经报名的组织活动 %@ ---%@",parameters,path);
                }];
}

/**未完成的活动*/
+ (void)mobileActivitygetMyHaveNotOverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/getUnLive",Host];

//    NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/getMyHaveNotOver",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [MyTaskAssessmentModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"未完成的活动 %@ ---%@",parameters,path);
                }];
}

/**已经完成的活动*/
+ (void)mobileActivitygetMyHaveOverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/getDown",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [MyTaskAssessmentModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"已经完成的活动 %@ ---%@",parameters,path);
                }];
}

/**教师端已结束的活动*/
+ (void)mobileActivitypageforteacheroverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/activity/pageforteacherover",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [MyTaskAssessmentTeacherModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端已结束的活动 %@ ---%@",parameters,path);
                }];
}

/**教师端进行中的活动*/
+ (void)mobileActivitypageforteacherrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/activity/pageforteacher",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [MyTaskAssessmentTeacherModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端进行中的活动 %@ ---%@",parameters,path);
                }];
}

/**教师端发布活动*/
+ (void)activityrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/activity/addactivity",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                        NSArray *array =  [MyTaskAssessmentTeacher2Model mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        if ([dict[@"data"] boolValue] == YES) {
                            [SVProgressHUD showSuccessWithStatus:@"发布成功"];

                            success(dict);
                        }else{
                            [SVProgressHUD showInfoWithStatus:@"发布失败"];

                        }
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端发布活动 %@ ---%@",parameters,path);
                }];
}

/**教师端获取班级列表<>*/
+ (void)sysclassgetbytecuseridrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysclass/getbytecuserid",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [PublishTaskClassModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端获取班级列表<> %@ ---%@",parameters,path);
                }];
}
/**教师端进行中的活动详情1MyTaskAssessmentTeacher1*/
+ (void)activitypageforteacherrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/activity/getsecond",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        MyTaskAssessmentTeacher1Model *model = [MyTaskAssessmentTeacher1Model mj_objectWithKeyValues:dict[@"data"]];
                        success(model);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端进行中的活动详情1 %@ ---%@",parameters,path);
                }];
}
/**教师端结束的活动详情1 MyTaskAssessmentTeacher1*/
+ (void)activitypageforteacheroverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/pageforteacherover",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [PublishTaskClassModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端结束的活动详情1 %@ ---%@",parameters,path);
                }];
}

/**教师端学生已提交活动*/
+ (void)activitygethavedownrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/activity/gethavedown",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [MyTaskAssessmentTeacher2Model mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端学生已提交活动 %@ ---%@",parameters,path);
                }];
}

/**教师端学生未提交活动*/
+ (void)activitygetnotdorequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/activity/getnotdo",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [MyTaskAssessmentTeacher2Model mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端学生未提交活动 %@ ---%@",parameters,path);
                }];
}

/**教师端查看学生提交的活动详情*/
+ (void)experiencebyuseridrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/experience/byuserid",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        MyTaskAssessmentTeacher3Model *model = [MyTaskAssessmentTeacher3Model mj_objectWithKeyValues:dict[@"data"]];
                        success(model);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端查看学生提交的活动详情 %@ ---%@",parameters,path);
                }];
}

/**教师端提醒单个学生提交活动*/
+ (void)remindaddremindrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/remind/addremind",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        if ([dict[@"data"] boolValue] == YES) {
                            [SVProgressHUD showSuccessWithStatus:@"提醒成功"];

                            success(dict);
                        }else{
                            [SVProgressHUD showInfoWithStatus:@"提醒失败"];

                        }
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端提醒单个学生提交活动 %@ ---%@",parameters,path);
                }];
}

/**教师端提醒一键提醒学生提交活动*/
+ (void)remindaddremindallrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/remind/addremindall",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        if ([dict[@"data"] boolValue] == YES) {
                            [SVProgressHUD showSuccessWithStatus:@"提醒成功"];

                            success(dict);
                        }else{
                            [SVProgressHUD showInfoWithStatus:@"提醒失败"];

                        }
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端提醒一键提醒学生提交活动 %@ ---%@",parameters,path);
                }];
}

/**教师端查询学生表*/
+ (void)sysclassgetbyclassidrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysclass/getbytecuserid",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        if ([dict[@"data"] boolValue] == YES) {
                            [SVProgressHUD showSuccessWithStatus:@"提醒成功"];

                            success(dict);
                        }else{
                            [SVProgressHUD showInfoWithStatus:@"提醒失败"];

                        }
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端提醒一键提醒学生提交活动 %@ ---%@",parameters,path);
                }];
}

/**建议反馈*/
+ (void)sysfeedbackaddfeedbackrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysfeedback/addfeedback",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        if ([dict[@"data"] boolValue] == YES) {
                            [SVProgressHUD showSuccessWithStatus:@"提交成功"];

                            success(dict);
                        }else{
                            [SVProgressHUD showInfoWithStatus:@"提交失败"];

                        }
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"建议反馈 %@ ---%@",parameters,path);
                }];
}

/**内部修改密码*/
+ (void)registeredupdatePswINrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/registered/updatePswIN",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        if ([dict[@"data"] boolValue] == YES) {
                            [SVProgressHUD showSuccessWithStatus:@"修改成功"];

                            success(dict);
                        }else{
                            [SVProgressHUD showInfoWithStatus:@"修改失败"];

                        }
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"内部修改密码 %@ ---%@",parameters,path);
                }];
}

/**我的故事坊*/
+ (void)registeredupdatemyzonegetmineListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/myzone/getmineList",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        NSArray *array =  [WoDeGuShiListModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(array);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端学生未提交活动 %@ ---%@",parameters,path);
                }];
}
/**发布故事坊*/
+ (void)registeredupdatemyzonecreatemyzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/myzone/createmyzone",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                        NSArray *array =  [WoDeGuShiListModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(dict);
                        
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"教师端学生未提交活动 %@ ---%@",parameters,path);
                }];
}
/**民族列表*/
+ (void)admindicttypenationrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/dict/type/nation",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [MingZuModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"民族列表 %@ ---%@",parameters,path);
                }];
}

/**学历列表*/
+ (void)admindicttypeeducationrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/dict/type/education",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [MingZuModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"学历列表 %@ ---%@",parameters,path);
                }];
}
/**省份列表*/
+ (void)adminsysprovincelistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysprovince/list",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [ShengFenXuanZeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        
                        success(array);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"省份列表 %@ ---%@",parameters,path);
                }];
}
/**入党申请状态*/
+ (void)CCadminsysjoinuscheckminerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysjoinus/checkmine",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [ShengFenXuanZeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        RuDangShenQingModel *model = [RuDangShenQingModel mj_objectWithKeyValues:dict[@"data"]];
                        success(model);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"入党申请状态 %@ ---%@",parameters,path);
                }];
}

/**申请入党*/
+ (void)adminsysjoinusaddJoinrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysjoinus/addJoin",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
//                     NSArray *array =  [ShengFenXuanZeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
//                        RuDangShenQingModel *model = [RuDangShenQingModel mj_objectWithKeyValues:dict[@"data"]];
                        if ([result[@"data"] boolValue] == YES) {
                            [SVProgressHUD showSuccessWithStatus:@"入党申请已提交"];

                            success(result);

                        }else{
                            [SVProgressHUD showInfoWithStatus:@"请勿重复添加"];

                        }
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"申请入党 %@ ---%@",parameters,path);
                }];
}
/**心得列表*/
+ (void)activityexperiencepagesrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/experience/pages",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [WodexindeListModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
//                        RuDangShenQingModel *model = [RuDangShenQingModel mj_objectWithKeyValues:dict[@"data"]];
                        
                            success(array);

                       
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"心得列表 %@ ---%@",parameters,path);
                }];
}

/**添加心得*/
+ (void)activityexperienceaddexprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/experience/addexp",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        if ([dict[@"data"] boolValue] == YES) {
                        [SVProgressHUD showSuccessWithStatus:@"发布成功"];

                            success(result);

                        }
//                     NSArray *array =  [ShengFenXuanZeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
//                        RuDangShenQingModel *model = [RuDangShenQingModel mj_objectWithKeyValues:dict[@"data"]];
                        

                       
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"添加心得 %@ ---%@",parameters,path);
                }];
}
/**关系转接列表*/
+ (void)adminsysuserchangesgetAllDeptListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysuserchanges/getAllDeptList",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     

                        success(result);
//                        RuDangShenQingModel *model = [RuDangShenQingModel mj_objectWithKeyValues:dict[@"data"]];
                        

                       
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"关系转接列表 %@ ---%@",parameters,path);
                }];
}

/**转接申请*/
+ (void)adminsysuserchangesaddSysUserChangesPhonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysuserchanges/addSysUserChangesPhone",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        if ([dict[@"data"] boolValue] == YES) {
                            
//                        [SVProgressHUD showSuccessWithStatus:@"已提交申请"];

                            success(result);

                        }else{
                        [SVProgressHUD showInfoWithStatus:dict[@"msg"]];

                        }

//                        RuDangShenQingModel *model = [RuDangShenQingModel mj_objectWithKeyValues:dict[@"data"]];
                        

                       
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"关系转接列表 %@ ---%@",parameters,path);
                }];
}

/**问题*/
+ (void)adminsysquesyionpagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@admin/sysquesyion/page",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    dict[@"myzone"] = JsonStr;
    [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSLog(@"%@",result);
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                     NSArray *array =  [ChangjianWenTiModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
//                        RuDangShenQingModel *model = [RuDangShenQingModel mj_objectWithKeyValues:dict[@"data"]];
                        
                            success(array);

                       
                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"问题 %@ ---%@",parameters,path);
                }];
}
@end
