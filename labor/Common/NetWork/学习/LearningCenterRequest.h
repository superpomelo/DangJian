//
//  LearningCenterRequest.h
//  labor
//
//  Created by 狍子 on 2020/9/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  学习模块的接口

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LearningCenterRequest : NSObject
/**劳动知识*/
+ (void)mobileIndexinformationonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**民俗知识*/
+ (void)mobileIndexinformationtworequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**国学知识*/
+ (void)mobileIndexinformationthrrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**农业科技*/
+ (void)mobileIndexinformationfourequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**新闻时事*/
+ (void)mobileIndexinformationfivrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**新闻详情*/
+ (void)mobileIndexinformationDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**评论列表*/
+ (void)mobileIndexgetCommentVoListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**提交评论*/
+ (void)mobileIndexsubmitCommentrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**新增点赞表*/
+ (void)sysuprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**取消点赞*/
+ (void)sysupmycollectdelerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**点赞状态*/
+ (void)sysupmycollectstatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**点赞数量*/
+ (void)sysupmycollectalluprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**加积分*/
+ (void)sysintegralsaveIntegralFORMOVrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;


//
//
//
///**新增收藏*/
//+ (void)LCsyscollectrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
//
///**删除收藏*/
//+ (void)LCsyscollectmycollectdelerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
//
///**收藏状态*/
//+ (void)LCsyscollectmycollectstatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
