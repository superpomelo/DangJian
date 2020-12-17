//
//  MyTaskAssessmentTeacher1ViewController.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  活动完成度

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentTeacherModel.h"
#import "MyTaskAssessmentTeacher2ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTaskAssessmentTeacher1ViewController : UIViewController
@property(nonatomic,strong)MyTaskAssessmentTeacherModel *modelLast;
/**活动状态*/
@property(nonatomic,assign)MyTaskAssessmentTeacher2TypeState status;
@end

NS_ASSUME_NONNULL_END
