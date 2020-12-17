//
//  FirstMyCircleCenterDetails1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyCircleCenterDetails1TableViewCell.h"
#import "MyTimeInterval.h"

@implementation FirstMyCircleCenterDetails1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImageView.layer.cornerRadius = 40/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyCircleCenterHomeModel*)model{
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY.MM.dd HH:mm"]];
    self.userNameLabel.text = model.username;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
}

@end
