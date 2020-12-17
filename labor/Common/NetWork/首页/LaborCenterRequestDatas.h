//
//  LaborCenterRequestDatas.h
//  labor
//
//  Created by 狍子 on 2020/9/5.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  首页模块的接口

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LaborCenterRequestDatas : NSObject
/**全部*/
+ (void)TeacherLectureHall1requestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**名师讲堂-<课时列表接口>*/
+ (void)TeacherLectureHallrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;


/**播放视频-<开始计时>*/
+ (void)learnmobileLearnplayVideorequestDataWithparameters:(id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**结束播放-<结束计时>*/
+ (void)learnmobileLearnendPlayVideorequestDataWithparameters:(id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**通过lesson_id查询心得*/
+ (void)experienceexperienceforlessonrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**新增心得表*/
+ (void)mobileLearnsubmitExperiencerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**新增收藏*/
+ (void)syscollectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**删除收藏*/
+ (void)syscollectmycollectdelerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**收藏状态*/
+ (void)syscollectmycollectstatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**在线测评分页*/
+ (void)mobileEvaluationgetExamVoPagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**在线考试*/
+ (void)mobileEvaluationgetExamDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**提交试卷*/
+ (void)mobileEvaluationsubmitExamrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**获取考试结果*/
+ (void)mobileEvaluationgetUserExamResultrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**重新考试*/
+ (void)mobileEvaluationagainExamrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**判断已考试*/
+ (void)mobileEvaluationcheckexamrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**在线考试答题详情*/
+ (void)mobileEvaluationgetmyexaminforequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;


/**组织活动*/
+ (void)mobileActivitygetPagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**活动详情*/
+ (void)mobileActivitygetDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**活动报名*/
+ (void)mobileActivitysingUprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**活动报名状态*/
+ (void)mobileActivitysingUpStatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**活动-即将开始<特别提醒>*/
+ (void)activitygetActivitysListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**首页轮播*/
+ (void)mobileIndexcarouselIndexrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**首页搜索历史*/
+ (void)mobileLearnselectnotesrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**课程搜索*/
+ (void)mobileLearnselectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**新闻搜索*/
+ (void)mobileIndexselectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**清除搜索历史*/
+ (void)mobileLearndelselectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**系统消息*/
+ (void)remindMYREMINDrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**系统消息数量*/
+ (void)remindMYREMINDsizerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**课程详情*/
+ (void)mobileLearngetupdatarequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
