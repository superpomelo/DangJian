//
//  SecondMingZhuPingYiDetailsViewTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondMingZhuPingYiDetailsViewTableViewCell.h"

@implementation SecondMingZhuPingYiDetailsViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.finaldaojishiBottomView.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MingZhuPingYiDetailsModel*)model{
    NSMutableAttributedString *attributedString0 = [[NSMutableAttributedString alloc] initWithString:@"评议结束倒计时：" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 16],NSForegroundColorAttributeName:[UIColor colorWithRed:212/255.0 green:55/255.0 blue:55/255.0 alpha:1]}];
    NSAttributedString *abt0 = attributedString0;
    self.daojishibudongLabel.attributedText = abt0;
    
    
    NSMutableAttributedString *attributedString12 = [[NSMutableAttributedString alloc] initWithString:model.title attributes:@{NSFontAttributeName: [UIFont fontWithName:@"SourceHanSerifCN-Bold" size: 21],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt12 = attributedString12;
    self.titleLabel.attributedText = abt12;
//    self.titleLabel.text = model.title;
    
    NSMutableAttributedString *attributedString123 = [[NSMutableAttributedString alloc] initWithString:model.descriptionX attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 16],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt123 = attributedString123;
    self.detailsLabel.attributedText = abt123;
//    self.tianMLabel.text = @"00";
//    self.shiMLabel.text = @"00";
//    self.fenMLabel.text = @"00";
    
}

@end
