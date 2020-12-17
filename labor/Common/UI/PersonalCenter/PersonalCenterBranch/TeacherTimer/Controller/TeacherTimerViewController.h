//
//  TeacherTimerViewController.h
//  labor
//
//  Created by 狍子 on 2020/10/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  教师发布任务选择开始结束时间

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^TeacherTimerresultBlock)(NSString*);
@interface TeacherTimerViewController : UIViewController
@property (nonatomic, copy)TeacherTimerresultBlock resultBlock;
@property (nonatomic,strong)NSString *TITLES;
@end

NS_ASSUME_NONNULL_END
