//
//  FivethLaborCenterLessonDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/8.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FivethLaborCenterLessonDetailsTableViewCell.h"

@implementation FivethLaborCenterLessonDetailsTableViewCell

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
//    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"touxiangpleasehold"]];
    self.nameLabel.text = model.userName;
    self.badyLabel.text = model.body;
//    self.timeLabel.text = model.createTime;
    if ([model.createTime containsString:@" "]) {
        NSArray *array = [model.createTime componentsSeparatedByString:@" "];
        self.timeLabel.text = [NSString stringWithFormat:@"%@",array[0]];
    }else{
        self.timeLabel.text = [NSString stringWithFormat:@"%@",model.createTime];
    }
}



@end
