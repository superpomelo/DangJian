//
//  FirstAssessmentOfTheTaskTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstAssessmentOfTheTaskTableViewCell.h"

@implementation FirstAssessmentOfTheTaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.enterBottomView.layer.cornerRadius = 2;
    

    self.bottomView.layer.shadowColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0,1);
    self.bottomView.layer.shadowOpacity = 1;
    self.bottomView.layer.shadowRadius = 2;
    self.bottomView.layer.borderWidth = 0.5;
    self.bottomView.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.cornerRadius = 4;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(AssessmentOfTheTaskModel*)model{
    self.titleLabel.text = model.title;
    self.subTitleLabel.text = model.summary;
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
}
@end
