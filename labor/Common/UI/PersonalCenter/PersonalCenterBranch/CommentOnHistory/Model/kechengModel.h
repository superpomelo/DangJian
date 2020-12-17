//
//  kechengModel.h
//  labor
//
//  Created by 狍子 on 2020/9/23.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface kechengModel : NSObject
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *body;

/**id*/
@property (nonatomic, assign) int courseId;
@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, assign) int delFlag;
@property (nonatomic, assign) int deptId;
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int lessonId;
@property (nonatomic, assign) int lockFlag;
@property (nonatomic, assign) int reviewFlag;
@property (nonatomic, assign) int sort;
@property (nonatomic, assign) int tenantId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *userName;

@end

NS_ASSUME_NONNULL_END
