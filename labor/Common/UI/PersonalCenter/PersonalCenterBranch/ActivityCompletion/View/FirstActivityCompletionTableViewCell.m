//
//  FirstActivityCompletionTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstActivityCompletionTableViewCell.h"

@implementation FirstActivityCompletionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.rightBottomView.layer.borderWidth = 0.5;
    self.rightBottomView.layer.borderColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1].CGColor;
    self.rightBottomView.layer.cornerRadius = 5;


    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
