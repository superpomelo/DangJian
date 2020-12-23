//
//  NewHuoDongModel.h
//  labor
//
//  Created by 狍子 on 2020/11/19.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewHuoDongModel : NSObject
@property (nonatomic, copy) NSString *activityAddress;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *endTime;

@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *signUpTime;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int visitorsNum;
@property (nonatomic, assign) int signUpNum;

@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int categoryId;
@property (nonatomic, copy) NSString *categoryName;

@end

NS_ASSUME_NONNULL_END
