//
//  MyTaskAssessmentTeacher2ViewController.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  班级完成度

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentTeacherModel.h"
typedef enum  {

    MyTaskAssessmentTeacher2ongoing  = 0, //进行中的活动
    MyTaskAssessmentTeacher2end,   //已结束的活动
    
} MyTaskAssessmentTeacher2TypeState; //活动状态,提醒状态是否展示
NS_ASSUME_NONNULL_BEGIN

@interface MyTaskAssessmentTeacher2ViewController : UIViewController
@property(nonatomic,strong)NSString *idx;
@property(nonatomic,strong)MyTaskAssessmentTeacherModel *modelLast;
/**活动状态*/
@property(nonatomic,assign)MyTaskAssessmentTeacher2TypeState status;

@end

NS_ASSUME_NONNULL_END
