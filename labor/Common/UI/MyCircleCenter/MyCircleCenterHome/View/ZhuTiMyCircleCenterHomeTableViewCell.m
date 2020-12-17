//
//  ZhuTiMyCircleCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ZhuTiMyCircleCenterHomeTableViewCell.h"
#import "MyTimeInterval.h"

@implementation ZhuTiMyCircleCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.biaoqianBottomView.layer.borderColor = kGreenColor.CGColor;
    self.biaoqianBottomView.layer.borderWidth = 0.5;
    self.biaoqianBottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.biaoqianBottomView.layer.cornerRadius = 2;
    self.typeLabel.textColor = kGreenColor;
    self.myimageView.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(NewHuoDongModel*)model{
    self.titleLabel.attributedText = [UILabel getABTbody:model.title font:17 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    
    self.placeLabel.text = model.activityAddress;
    [self.myimageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    self.renshuLabel.text = [NSString stringWithFormat:@"%d",model.signUpNum];
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:model.signUpTime type:@"YYYY.MM.dd HH:mm"]];
//    self.titleLabel.text = model.title;
    self.typeLabel.text = model.summary;
}

@end
