//
//  SecondMyTaskAssessmentTeacher3TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondMyTaskAssessmentTeacher3TableViewCell.h"

@implementation SecondMyTaskAssessmentTeacher3TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyTaskAssessmentTeacher3Model*)model{
    if (model.body != nil) {
            NSAttributedString *abt = [[NSAttributedString alloc]initWithString:model.body];
        self.bodyLabel.attributedText = abt;
    }else{
        NSAttributedString *abt = [[NSAttributedString alloc]initWithString:@"学生未提交内容"];
        self.bodyLabel.attributedText = abt;

    }
 

}
@end
