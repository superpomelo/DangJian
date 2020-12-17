//
//  SecondLearningCenterDetails1NewsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondLearningCenterDetails1NewsTableViewCell.h"

@implementation SecondLearningCenterDetails1NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.dianzanBottomView.layer.cornerRadius = 2;
    self.yueduBottomView.layer.cornerRadius = 2;
}

- (void)reloadData:(int)selectNum{
    self.yueduLabel.text = [NSString stringWithFormat:@"阅读：%d",selectNum];
}
- (void)reloadData2:(int)dianzanNum{
    self.dianzanLabel.text = [NSString stringWithFormat:@"点赞：%d",dianzanNum];
}
- (void)reloadData3:(int)dianzanStatus{
    if (dianzanStatus==0) {
        self.dianzanImageView.image = [UIImage imageNamed:@"组件 6 – 1"];
    }else{
        self.dianzanImageView.image = [UIImage imageNamed:@"组件 6 – 2"];

    }
}

- (IBAction)dianzanButtonAction:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(SecondLearningCenterDetails1NewsTableViewCellButtonActiondelegate:button:)]) {
        [self.delegate SecondLearningCenterDetails1NewsTableViewCellButtonActiondelegate:self button:sender];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
