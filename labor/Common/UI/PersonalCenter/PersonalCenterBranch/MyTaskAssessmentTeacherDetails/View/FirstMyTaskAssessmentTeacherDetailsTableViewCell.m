//
//  FirstMyTaskAssessmentTeacherDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/10/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyTaskAssessmentTeacherDetailsTableViewCell.h"

@implementation FirstMyTaskAssessmentTeacherDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(TaskAssessmentDetailsModel*)model{
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
}
@end
