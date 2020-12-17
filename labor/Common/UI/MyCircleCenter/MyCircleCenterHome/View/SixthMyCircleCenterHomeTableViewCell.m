//
//  SixthMyCircleCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SixthMyCircleCenterHomeTableViewCell.h"

@implementation SixthMyCircleCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
   
    
    self.biaoqianBottomView.layer.borderColor = [UIColor colorWithRed:212/255.0 green:55/255.0 blue:55/255.0 alpha:1.0].CGColor;
    self.biaoqianBottomView.layer.borderWidth = 0.5;
    self.biaoqianBottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.biaoqianBottomView.layer.cornerRadius = 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
