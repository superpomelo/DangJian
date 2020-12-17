//
//  ThirdLaborCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdLaborCenterHomeTableViewCell.h"

@implementation ThirdLaborCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.bottomView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
//    self.bottomView.layer.shadowColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
//    self.bottomView.layer.shadowOffset = CGSizeMake(0,2);
//    self.bottomView.layer.shadowOpacity = 1;
//    self.bottomView.layer.shadowRadius = 2;    
//    self.leftImageView.layer.cornerRadius = 3;
    
    
    
    self.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
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
