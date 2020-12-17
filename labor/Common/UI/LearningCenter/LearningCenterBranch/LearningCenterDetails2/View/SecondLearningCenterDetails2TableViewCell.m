//
//  SecondLearningCenterDetails2TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondLearningCenterDetails2TableViewCell.h"

@implementation SecondLearningCenterDetails2TableViewCell

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
    self.titleLabel.text = model.title;
    self.playNumLabel.text = [NSString stringWithFormat:@"播放量:%d",model.count];
}
@end
