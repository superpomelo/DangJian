//
//  SecondMyCircleCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondMyCircleCenterHomeTableViewCell.h"

@implementation SecondMyCircleCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.zhidingBottomView.layer.cornerRadius =2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyCircleCenterHomeModel*)model{
    self.titleLabel.text = model.content;
}
@end
