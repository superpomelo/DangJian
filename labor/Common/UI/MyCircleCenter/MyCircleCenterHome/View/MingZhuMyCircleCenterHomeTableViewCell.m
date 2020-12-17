//
//  MingZhuMyCircleCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MingZhuMyCircleCenterHomeTableViewCell.h"
#import "MyTimeInterval.h"

@implementation MingZhuMyCircleCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.myImageView.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MingZhuPingYiModel*)model{
//    self.titleLabel.text = model.title;
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:model.title attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 17],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt3 = attributedString3;
    self.titleLabel.attributedText = abt3;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:model.startTime type:@"YYYY-MM-dd HH:mm"]];
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
}

@end
