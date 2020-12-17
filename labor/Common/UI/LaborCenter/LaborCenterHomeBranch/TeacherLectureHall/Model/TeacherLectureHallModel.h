//
//  TeacherLectureHallModel.h
//  labor
//
//  Created by 狍子 on 2020/9/5.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TeacherLectureHallModel : NSObject
/**课程id*/
@property (nonatomic, assign) int courseId;
@property (nonatomic, copy) NSString *createTime;
/**课时id*/
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int sort;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *videoUrl;
@property (nonatomic, assign) int videoLength;
@property (nonatomic, copy) NSString *auth;
@property (nonatomic, assign) int count;
/**详情页的简介*/
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *faceUrl;

@end

NS_ASSUME_NONNULL_END
