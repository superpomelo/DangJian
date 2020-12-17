//
//  MingZhuPingYiDetailsModel.h
//  labor
//
//  Created by 狍子 on 2020/11/18.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MingZhuPingYiDetailsModel : NSObject
@property (nonatomic, assign) int anonymousFlag;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *createUserId;

@property (nonatomic, copy) NSString *descriptionX;

@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) id votingQuestionVos;

@property (nonatomic, assign) int votingType;
@end

NS_ASSUME_NONNULL_END
