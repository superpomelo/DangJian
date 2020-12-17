//
//  AssessmentOfTheTaskModel.h
//  labor
//
//  Created by 狍子 on 2020/9/15.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AssessmentOfTheTaskModel : NSObject
/***/
@property (nonatomic, copy) NSString *activityAddress;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, assign) int signUpFlag;
@property (nonatomic, copy) NSString *signUpTime;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *title;

/**id*/
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int visitorsNum;

@end

NS_ASSUME_NONNULL_END
