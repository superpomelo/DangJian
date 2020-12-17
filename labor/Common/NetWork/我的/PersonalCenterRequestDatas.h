//
//  PersonalCenterRequestDatas.h
//  labor
//
//  Created by 狍子 on 2020/9/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalCenterRequestDatas : NSObject
/**个人资料*/
+ (void)mobileUsergetPersonalCenterVorequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**更改头像*/
+ (void)mobileUseravatarrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**个人信息修改*/
+ (void)mobileUsermyInforequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**我的积分*/
+ (void)mobileUsermyWaterrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;


/**查询积分对象<总积分>*/
+ (void)sysintegralgetSysIntegralrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**我的周榜*/
+ (void)sysintegralwatermyweeklistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**我的月榜*/
+ (void)sysintegralwatermymoulistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**日榜*/
+ (void)sysintegralwaterdaylistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**周榜*/
+ (void)sysintegralwaterweeklistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**月榜*/
+ (void)sysintegralwatermoulistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**学校列表*/
+ (void)admindeptgetDeptVoListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**个人已发表心得接口<课程>*/
+ (void)mobileLearnmyExperiencerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**我的新闻评论<新闻>*/
+ (void)mobileIndexmynewscommentrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**我的劳动圈评论<劳动圈>*/
+ (void)myzonemembergetownzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**我的收藏<分页查询>*/
+ (void)syscollectpagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**查询我的劳动圈*/
+ (void)myzonegetownzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**我的劳动圈删除*/
+ (void)myzonedelegaterequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**新增心得表<提交任务考核《学生》>*/
+ (void)experiencerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**已经报名的组织活动*/
+ (void)mobileActivitygetMyHaveSignrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**学生端未完成的活动*/
+ (void)mobileActivitygetMyHaveNotOverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**学生端已经完成的活动*/
+ (void)mobileActivitygetMyHaveOverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**教师端已结束的活动*/
+ (void)mobileActivitypageforteacheroverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**教师端进行中的活动*/
+ (void)mobileActivitypageforteacherrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**教师端发布活动*/
+ (void)activityrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**教师端获取班级列表<>*/
+ (void)sysclassgetbytecuseridrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**教师端进行中的活动详情1MyTaskAssessmentTeacher1*/
+ (void)activitypageforteacherrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**教师端结束的活动详情1MyTaskAssessmentTeacher1*/
+ (void)activitypageforteacheroverrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**教师端学生已提交活动*/
+ (void)activitygethavedownrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**教师端学生未提交活动*/
+ (void)activitygetnotdorequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;


/**教师端查看学生提交的活动详情*/
+ (void)experiencebyuseridrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**教师端提醒单个学生提交活动*/
+ (void)remindaddremindrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**教师端提醒一键提醒学生提交活动*/
+ (void)remindaddremindallrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**教师端查询学生表*/
+ (void)sysclassgetbyclassidrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**建议反馈*/
+ (void)sysfeedbackaddfeedbackrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**内部修改密码*/
+ (void)registeredupdatePswINrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**我的故事坊*/
+ (void)registeredupdatemyzonegetmineListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**发布故事坊*/
+ (void)registeredupdatemyzonecreatemyzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**民族列表*/
+ (void)admindicttypenationrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**学历列表*/
+ (void)admindicttypeeducationrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**省份列表*/
+ (void)adminsysprovincelistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**入党申请状态*/
+ (void)CCadminsysjoinuscheckminerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**提交入党申请状态*/
+ (void)adminsysjoinusaddJoinrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**心得列表*/
+ (void)activityexperiencepagesrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**添加心得*/
+ (void)activityexperienceaddexprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**转接列表*/
+ (void)adminsysuserchangesgetAllDeptListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**转接申请*/
+ (void)adminsysuserchangesaddSysUserChangesPhonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**问题*/
+ (void)adminsysquesyionpagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
