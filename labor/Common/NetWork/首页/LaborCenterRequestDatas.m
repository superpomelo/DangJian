//
//  LaborCenterRequestDatas.m
//  labor
//
//  Created by 狍子 on 2020/9/5.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  首页模块的接口

#import "LaborCenterRequestDatas.h"
#import "BaseRequestDatas.h"
#import "JsonString.h"
#import "UserInfoManager.h"
#import "TeacherLectureHallModel.h"
#import "TheExamRushedOffModel.h"
#import "TheTestModel.h"
#import "ExperienceModel.h"
#import "ExaminationResultsModel.h"
#import "AssessmentOfTheTaskModel.h"
#import "TaskAssessmentDetailsModel.h"
#import "LaborLunBoModel.h"
#import "LearningCenterHomeModel.h"
#import "TeacherLectureHallModel.h"
#import "TheMessageCenterModel.h"
#import "JyldHuoDong.h"

@implementation LaborCenterRequestDatas
/**获取全部*/
+ (void)TeacherLectureHall1requestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    //    NSString *path = [NSString stringWithFormat:@"%@/auth/oauth/token",Host];
    
        NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/page",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            NSLog(@"%@",result);
            if ([dict.allKeys containsObject:@"data"]) {
                NSDictionary *dict1 = [NSDictionary dictionary];
                dict1 = result[@"data"];
                if ([dict1.allKeys containsObject:@"records"]) {
                    NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
                    success(array);
                }else{
                    NSLog(@"4");
                }


            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"获取劳动知识%@ ---%@",parameters,path);
        }];
}
/**获取劳动知识*/
+ (void)TeacherLectureHallrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    //    NSString *path = [NSString stringWithFormat:@"%@/auth/oauth/token",Host];
    
        NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/pageformov",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            NSLog(@"%@",result);
            if ([dict.allKeys containsObject:@"data"]) {
                NSDictionary *dict1 = [NSDictionary dictionary];
                dict1 = result[@"data"];
                if ([dict1.allKeys containsObject:@"records"]) {
                    NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict1[@"records"]]; //数组
                    success(array);
                }else{
                    NSLog(@"4");
                }


            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"获取劳动知识%@ ---%@",parameters,path);
        }];
}
/**播放视频-<开始计时>*/
+ (void)learnmobileLearnplayVideorequestDataWithparameters:(id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    //    NSString *path = [NSString stringWithFormat:@"%@/auth/oauth/token",Host];
        NSString *path = [NSString stringWithFormat:@"%@learn/mobileLearn/playVideo",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            if ([dict.allKeys containsObject:@"data"]) {
//                NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
//                success(array);

            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"播放视频-<开始计时> %@ ---%@",parameters,path);
        }];
}
/**结束播放-<结束计时>*/
+ (void)learnmobileLearnendPlayVideorequestDataWithparameters:(id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    //    NSString *path = [NSString stringWithFormat:@"%@/auth/oauth/token",Host];
        NSString *path = [NSString stringWithFormat:@"%@learn/mobileLearn/endPlayVideo",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            if ([dict.allKeys containsObject:@"data"]) {
//                NSLog(@"200");
//                NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                success(dict);

            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"结束播放-<结束计时> %@ ---%@",parameters,path);
        }];
}

/**通过lesson_id查询心得*/
+ (void)experienceexperienceforlessonrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
            NSString *path = [NSString stringWithFormat:@"%@learn/experience/experienceforlesson",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
                    NSArray *array =  [ExperienceModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(array);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"通过lesson_id查询心得 %@ ---%@",parameters,path);

            }];
}

/**提交心得*/
+ (void)mobileLearnsubmitExperiencerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
            NSString *path = [NSString stringWithFormat:@"%@learn/mobileLearn/submitExperience",Host];
//            NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
                    
    //                NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                    success(@"200");

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"提交心得 %@ ---%@",parameters,path);

            }];
}

/**新增收藏*/
+ (void)syscollectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
                NSString *path = [NSString stringWithFormat:@"%@admin/syscollect",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
                [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        
        //                NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(@"200");

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"新增收藏 %@ ---%@",parameters,path);

                }];
}

/**删除收藏*/
+ (void)syscollectmycollectdelerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
                NSString *path = [NSString stringWithFormat:@"%@admin/syscollect/mycollectdele",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
                [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        
        //                NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(@"200");

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"删除收藏 %@ ---%@",parameters,path);

                }];
}

/**收藏状态*/
+ (void)syscollectmycollectstatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
                NSString *path = [NSString stringWithFormat:@"%@admin/syscollect/mycollectstatus",Host];
    //            NSString *JsonStr = [JsonString convertToJsonData:parameters];
                [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                    NSDictionary *dict = [NSDictionary dictionary];
                    dict = result;
                    if ([dict.allKeys containsObject:@"data"]) {
                        
        //                NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
                        success(dict);

                    }else{
                        NSLog(@"4");

                    }
                } failure:^(NSError * _Nonnull error) {
//                   [SVProgressHUD showInfoWithStatus:@"failure"];
                    failure(error);
                    NSLog(@"收藏状态 %@ ---%@",parameters,path);

                }];
}
/**在线测评分页*/
+ (void)mobileEvaluationgetExamVoPagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
//            NSString *path = [NSString stringWithFormat:@"%@evaluation/evaluation/getownExamPage",Host];
    NSString *path = [NSString stringWithFormat:@"%@evaluation/mobileEvaluation/getExamVoPage",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
//                NSLog(@"%@",result);
                if ([dict.allKeys containsObject:@"data"]) {
                    NSArray *array =  [TheExamRushedOffModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                    success(array);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"在线测评分页 %@ ---%@",parameters,path);

            }];
}
/**在线考试*/
+ (void)mobileEvaluationgetExamDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
        NSString *path = [NSString stringWithFormat:@"%@evaluation/mobileEvaluation/getExamDetails",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            if ([dict.allKeys containsObject:@"data"]) {

                success(result);

            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"在线考试 %@ ---%@",parameters,path);

        }];
}

/**提交试卷*/
+ (void)mobileEvaluationsubmitExamrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
       NSString *path = [NSString stringWithFormat:@"%@evaluation/mobileEvaluation/submitExamios",Host];
        NSString *JsonStr = [JsonString convertToJsonData:parameters];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"string"] = JsonStr;
        [BaseRequestDatas requestDataWithPath:path parameters:dict HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            if ([dict.allKeys containsObject:@"data"]) {
//                NSArray *array =  [TheTestModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"questionVoList"]]; //数组
                success(@"200");

            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"提交试卷 %@ ---%@",parameters,path);

        }];
}

/**获取考试结果*/
+ (void)mobileEvaluationgetUserExamResultrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@evaluation/mobileEvaluation/getUserExamResult",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
//          NSString *JsonStr = [JsonString convertToJsonData:parameters];
//          NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//           dict[@"string"] = JsonStr;
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
                    NSLog(@"200");
                ExaminationResultsModel *model = [ExaminationResultsModel mj_objectWithKeyValues:dict[@"data"]];
    //                NSArray *array =  [TheTestModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"questionVoList"]]; //数组
                    success(model);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"获取考试结果 %@ ---%@",parameters,path);

            }];
}

/**重新考试*/
+ (void)mobileEvaluationagainExamrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@evaluation/mobileEvaluation/againExam",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
    //                NSArray *array =  [TheTestModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"questionVoList"]]; //数组
                    success(@"200");

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"重新考试 %@ ---%@",parameters,path);

            }];
}

/**判断已考试*/
+ (void)mobileEvaluationcheckexamrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@evaluation/mobileEvaluation/checkexam",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
                    NSLog(@"200");
    //                NSArray *array =  [TheTestModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"questionVoList"]]; //数组
                    success(dict);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
//               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"判断已考试 %@ ---%@",parameters,path);

            }];
}

/**在线考试答题详情*/
+ (void)mobileEvaluationgetmyexaminforequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@evaluation/mobileEvaluation/getmyexaminfo",Host];
        //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
            [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
                NSDictionary *dict = [NSDictionary dictionary];
                dict = result;
                if ([dict.allKeys containsObject:@"data"]) {
                    NSArray *array =  [TheTestModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"myQuestionInfoVoList"]]; //数组
                    success(array);

                }else{
                    NSLog(@"4");

                }
            } failure:^(NSError * _Nonnull error) {
               [SVProgressHUD showInfoWithStatus:@"failure"];
                failure(error);
                NSLog(@"在线考试答题详情 %@ ---%@",parameters,path);

            }];
}

/**组织活动*/
+ (void)mobileActivitygetPagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
       NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/getPage",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            if ([dict.allKeys containsObject:@"data"]) {
                NSArray *array =  [AssessmentOfTheTaskModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                success(array);

            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"组织活动 %@ ---%@",parameters,path);
        }];
}

/**活动详情*/
+ (void)mobileActivitygetDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
       NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/getDetails",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
            NSDictionary *dict = [NSDictionary dictionary];
            dict = result;
            if ([dict.allKeys containsObject:@"data"]) {
                TaskAssessmentDetailsModel *model = [TaskAssessmentDetailsModel mj_objectWithKeyValues:dict[@"data"]];

                success(model);

            }else{
                NSLog(@"4");

            }
        } failure:^(NSError * _Nonnull error) {
//           [SVProgressHUD showInfoWithStatus:@"failure"];
            failure(error);
            NSLog(@"活动详情 %@ ---%@",parameters,path);
        }];
}
/**活动报名*/
+ (void)mobileActivitysingUprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
      NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/singUp",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
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
            NSLog(@"活动报名 %@ ---%@",parameters,path);
        }];
}
/**活动报名状态*/
+ (void)mobileActivitysingUpStatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
      NSString *path = [NSString stringWithFormat:@"%@activity/mobileActivity/singUpStatus",Host];
    //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
        [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
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
            NSLog(@"活动报名状态 %@ ---%@",parameters,path);
        }];
}

/**活动-即将开始<特别提醒>*/
+ (void)activitygetActivitysListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/activity/getActivitysList",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {

          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
//              NSLog(@"200");
              NSArray *array =  [AssessmentOfTheTaskModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
              success(array);

          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
          failure(error);
          NSLog(@"活动-即将开始<特别提醒> %@ ---%@",parameters,path);
      }];
}

/**首页轮播*/
+ (void)mobileIndexcarouselIndexrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/carouselIndex",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {

          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
              NSArray *array =  [LaborLunBoModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
              success(array);

          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
          failure(error);
          NSLog(@"首页轮播 %@ ---%@",parameters,path);
      }];
}

/**首页搜索历史*/
+ (void)mobileLearnselectnotesrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/selectnotes",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//          NSLog(@"%@",result);
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
             
              success(dict[@"data"]);

          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
          failure(error);
          NSLog(@"首页搜索历史 %@ ---%@",parameters,path);
      }];
}

/**课程搜索*/
+ (void)mobileLearnselectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@learn/mobileLearn/select",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
              NSArray *array =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
              success(array);

          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
          failure(error);
          NSLog(@"课程搜索 %@ ---%@",parameters,path);
      }];
}
/**新闻搜索*/
+ (void)mobileIndexselectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/select",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//          NSLog(@"%@",result);
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
              NSArray *array =  [LearningCenterHomeModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
              success(array);

          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
          failure(error);
          NSLog(@"新闻搜索 %@ ---%@",parameters,path);
      }];
}
/**清除搜索历史*/
+ (void)mobileLearndelselectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@information/mobileIndex/delselect",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//          NSLog(@"%@",result);
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
              success(@"200");

          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
          failure(error);
          NSLog(@"首页搜索 %@ ---%@",parameters,path);
      }];
}

/**系统消息*/
+ (void)remindMYREMINDrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/remind/MYREMIND",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
//          NSLog(@"%@",result);
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
              NSArray *array =  [TheMessageCenterModel mj_objectArrayWithKeyValuesArray:dict[@"data"]]; //数组
              success(array);

          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
          failure(error);
          NSLog(@"首页搜索 %@ ---%@",parameters,path);
      }];
}

/**系统消息数量*/
+ (void)remindMYREMINDsizerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/remind/MYREMINDsize",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          if ([dict.allKeys containsObject:@"data"]) {
              
                  success(result[@"data"]);
              
          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
  
          failure(error);
          NSLog(@"首页搜索 %@ ---%@",parameters,path);
      }];
}

/**课程详情*/
+ (void)mobileLearngetupdatarequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@learn/mobileLearn/getupdata",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          NSLog(@"%@",result);
          if ([dict.allKeys containsObject:@"data"]) {
                  success(result[@"data"]);  
          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
  
          failure(error);
          NSLog(@"首页搜索 %@ ---%@",parameters,path);
      }];
}

/**是否有将进行的活动*/
+ (void)activitygetActivitysListrequestDataWith2parameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@activity/activity/getActivitysList",Host];
  //    NSString *JsonStr = [JsonString convertToJsonData:parameters];
      [BaseRequestDatas requestDataWithPath:path parameters:parameters HTTPMethod:HTTPMethodGET HeaderType:HeaderTypeContentTypeTOKEN isShowLoading:NO success:^(id  _Nonnull result) {
          NSDictionary *dict = [NSDictionary dictionary];
          dict = result;
          NSLog(@"%@",result);
          if ([dict.allKeys containsObject:@"data"]) {
              NSDictionary *dict2 = [NSDictionary dictionary];
              dict2 = dict[@"data"];
              
              if ([dict2.allKeys containsObject:@"records"]) {
                  NSArray *array =  [JyldHuoDong mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
                    success(array);
              }

          }else{
              NSLog(@"4");

          }
      } failure:^(NSError * _Nonnull error) {
//         [SVProgressHUD showInfoWithStatus:@"failure"];
  
          failure(error);
          NSLog(@"是否有将进行的活动 %@ ---%@",parameters,path);
      }];
    
    
}
@end
