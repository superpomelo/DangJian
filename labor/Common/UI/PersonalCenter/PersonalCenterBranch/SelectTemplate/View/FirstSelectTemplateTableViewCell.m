//
//  FirstSelectTemplateTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstSelectTemplateTableViewCell.h"

@implementation FirstSelectTemplateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.SelectButton.layer.cornerRadius = 3;
    self.bottomView.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
