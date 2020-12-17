//
//  SecondMyTaskAssessmentTeacher1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondMyTaskAssessmentTeacher1TableViewCell.h"

@implementation SecondMyTaskAssessmentTeacher1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    self.bottomView.layer.borderWidth = 0.5;
//    self.bottomView.layer.borderColor = [UIColor blackColor].CGColor;
    self.chakanView.layer.cornerRadius = 3;
    self.bottomView.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyTaskAssessmentTeacherModel*)model model1:(MyTaskAssessmentTeacher1Model*)model1{
    //班级名
    self.classNameLabel.text = model.className;
    //参与人数
    self.canyuLabel.text = [NSString stringWithFormat:@"%d",model1.count];
    //未上传人数
    self.weishangchuanLabel.text = [NSString stringWithFormat:@"%d",model1.havenotdowncount];
    //已上传人数
    self.yishangchuanLabel.text = [NSString stringWithFormat:@"%d",model1.havedowncount];
}
@end
