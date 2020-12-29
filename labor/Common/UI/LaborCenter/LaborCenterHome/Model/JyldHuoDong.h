//
//  JyldHuoDong.h
//  labor
//
//  Created by 狍子 on 2020/12/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
// 首页活动提示

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JyldHuoDong : NSObject
@property (nonatomic, copy) NSString *body;
@property (nonatomic, assign) int idx;
@property (nonatomic, copy) NSString *activityAddress;
@property (nonatomic, assign) int categoryId;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *title;
@end

NS_ASSUME_NONNULL_END
