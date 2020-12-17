//
//  FivethLearningCenterDetails2TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/2.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FivethLearningCenterDetails2TableViewCell.h"

@implementation FivethLearningCenterDetails2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.leftImageView.layer.cornerRadius = self.leftImageView.bounds.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(ExperienceModel*)model{
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.nameLabel.text = model.userName;
    self.badyLabel.text = model.body;
    self.timeLabel.text = model.createTime;
}
@end
