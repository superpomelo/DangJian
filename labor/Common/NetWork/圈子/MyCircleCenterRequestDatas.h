//
//  MyCircleCenterRequestDatas.h
//  labor
//
//  Created by 狍子 on 2020/9/14.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCircleCenterRequestDatas : NSObject
/**新增我的劳动圈*/
+ (void)myzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**分页查询*/
+ (void)myzonepagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**学校圈<图片接口>*/
+ (void)myzonepageimgrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**视频圈*/
+ (void)myzonepagevidrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**查询到置顶的帖子*/
+ (void)myzonegetupzonerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**热度*/
+ (void)myzonegetFirerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**点击签到*/
+ (void)syssignaddsignrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**签到状态*/
+ (void)syssignsignstatusrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**查询连续登签到天数*/
+ (void)syssigngetsigninrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**评论列表*/
+ (void)CCmobileIndexgetCommentVoListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**提交评论*/
+ (void)CCmobileIndexsubmitCommentrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**劳动圈详情*/
+ (void)myzonegetbyidrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**移动端查询党员故事坊*/
+ (void)CCmyzonegetListrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**民主评议列表*/
+ (void)activityvotingvotingCenterrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**民主评议详情*/
+ (void)activityvotinggetVotingDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**民主评议投票*/
+ (void)activityvotinggetOnVotingformovrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**三会一课/主题活动/党建活动*/
+ (void)activitymobileActivitygetPagerequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**获取活动详情*/
+ (void)activitymobileActivitygetDetailsrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
/**报名*/
+ (void)activitymobileActivitysingUprequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**故事坊轮播图*/
+ (void)activitymobileActivitygetuplistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**故事坊详情*/
+ (void)activitymobileActivitygetuplistrequestDataWithparameters:(nullable  id)parameters success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
