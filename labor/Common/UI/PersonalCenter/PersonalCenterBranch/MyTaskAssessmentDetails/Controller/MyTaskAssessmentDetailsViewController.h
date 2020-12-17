//
//  MyTaskAssessmentDetailsViewController.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentModel.h"
typedef enum  {

 MyTaskAssessmentDetailsTypeStateOngoing  = 0, //进行中
 MyTaskAssessmentDetailsTypeStatecomplete,   //已完成
 MyTaskAssessmentDetailsTypeStateuncomplete,   //未完成
} MyTaskAssessmentDetailsTypeState; //任务完成状态
NS_ASSUME_NONNULL_BEGIN

@interface MyTaskAssessmentDetailsViewController : UIViewController
@property(nonatomic,strong) MyTaskAssessmentModel *model;
/**任务状态*/
@property (nonatomic,assign)MyTaskAssessmentDetailsTypeState state;

@end

NS_ASSUME_NONNULL_END
