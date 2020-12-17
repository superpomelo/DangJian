//
//  SecondLaborCenterLessonDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/8.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondLaborCenterLessonDetailsTableViewCell.h"

@implementation SecondLaborCenterLessonDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(TeacherLectureHallModel*)model{
    self.nameLabel.text = model.auth;
    NSAttributedString *abt = [[NSAttributedString alloc]initWithString:model.title];
    self.titleLabel.attributedText = abt;
    self.playNumLabel.text = [NSString stringWithFormat:@"播放量:%d",model.count];
}
@end
