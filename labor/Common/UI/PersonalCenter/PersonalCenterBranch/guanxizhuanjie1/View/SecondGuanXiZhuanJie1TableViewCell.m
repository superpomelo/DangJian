//
//  SecondGuanXiZhuanJie1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondGuanXiZhuanJie1TableViewCell.h"

@implementation SecondGuanXiZhuanJie1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(Guanxizhuanjie1Model*)model{
    self.leftLabel.text = model.name;
}

@end
