//
//  FirstDangYuanXiangQinDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstDangYuanXiangQinDetailsTableViewCell.h"

@implementation FirstDangYuanXiangQinDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.iconBottomView.layer.cornerRadius = self.iconBottomView.bounds.size.height/2;
    self.iconBottomView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(VotingQuestionVosModel*)model{
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:model.questionImg]];
    self.userNameLabel.text = model.questionTitle;
}

@end
