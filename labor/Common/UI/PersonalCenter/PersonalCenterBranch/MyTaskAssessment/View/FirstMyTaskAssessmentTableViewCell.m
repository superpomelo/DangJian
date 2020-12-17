//
//  FirstMyTaskAssessmentTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyTaskAssessmentTableViewCell.h"

@implementation FirstMyTaskAssessmentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.youshangjiaoView.hidden = YES;
    self.bottomView.layer.shadowColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0,1);
    self.bottomView.layer.shadowOpacity = 1;
    self.bottomView.layer.shadowRadius = 2;
    self.bottomView.layer.borderWidth = 0.5;
    self.bottomView.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.cornerRadius = 4;
    
    
//    self.bottomView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
//    self.bottomView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2].CGColor;
//    self.bottomView.layer.shadowOffset = CGSizeMake(0,2);
//    self.bottomView.layer.shadowOpacity = 1;
//    self.bottomView.layer.shadowRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyTaskAssessmentModel*)model{
//    self.titleLabel.text = model.title;
    self.titleLabel.attributedText = [UILabel getABTbody:model.title font:17 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.subTitleLabel.text = model.summary;
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
}
@end
