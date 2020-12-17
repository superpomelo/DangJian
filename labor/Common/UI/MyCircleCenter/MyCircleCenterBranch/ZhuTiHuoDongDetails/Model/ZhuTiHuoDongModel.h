//
//  ZhuTiHuoDongModel.h
//  labor
//
//  Created by 狍子 on 2020/11/19.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZhuTiHuoDongModel : NSObject
@property (nonatomic, copy) NSString *activityAddress;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, copy) NSString *cover;
@property (nonatomic, assign) int createUserId;
@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, copy) NSString *introduction;
@property (nonatomic, copy) NSString *realName;

@property (nonatomic, assign) int signUpFlag;
@property (nonatomic, assign) int signUpNum;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int visitorsNum;


@end

NS_ASSUME_NONNULL_END
