//
//  SecondMyTaskAssessmentTeacher1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentTeacher1Model.h"
#import "MyTaskAssessmentTeacherModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondMyTaskAssessmentTeacher1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UIView *chakanView;
/**参与人数*/
@property (weak, nonatomic) IBOutlet UILabel *canyuLabel;
/**已上传人数*/
@property (weak, nonatomic) IBOutlet UILabel *yishangchuanLabel;
/**未上传人数*/
@property (weak, nonatomic) IBOutlet UILabel *weishangchuanLabel;
/**班级名称*/
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;

- (void)reloadData:(MyTaskAssessmentTeacherModel*)model model1:(MyTaskAssessmentTeacher1Model*)model1;
@end

NS_ASSUME_NONNULL_END
