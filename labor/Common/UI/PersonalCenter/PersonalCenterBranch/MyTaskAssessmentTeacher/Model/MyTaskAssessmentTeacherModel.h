//
//  MyTaskAssessmentTeacherModel.h
//  labor
//
//  Created by 狍子 on 2020/10/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTaskAssessmentTeacherModel : NSObject
@property (nonatomic, copy) NSString *className;

@property (nonatomic, copy) NSString *activityAddress;
@property (nonatomic, assign) int categoryId;
@property (nonatomic, assign) int classId;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, assign) int createUserId;
@property (nonatomic, assign) int deptId;
@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, assign) int idx;
@property (nonatomic, copy) NSString *introduction;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
