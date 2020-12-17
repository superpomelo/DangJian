//
//  FirstMingZhuPingYiDetailsViewCollectionViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMingZhuPingYiDetailsViewCollectionViewCell.h"

@implementation FirstMingZhuPingYiDetailsViewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userImageView.layer.cornerRadius = self.userImageView.bounds.size.height/2;
    self.toupiaoButton.layer.cornerRadius = 2;
    self.toupiaoButton.userInteractionEnabled = NO;
}
- (IBAction)touPiaoButtonAction:(id)sender {
    
}
- (void)reloadData:(VotingQuestionVosModel*)model{
//    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.questionImg] placeholderImage:[UIImage imageNamed:@""]];
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.questionImg]];
    NSMutableAttributedString *attributedString0 = [[NSMutableAttributedString alloc] initWithString:model.questionTitle attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 16],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt0 = attributedString0;
    self.nameLabel.attributedText = abt0;
//    self.nameLabel.text = model.questionTitle;
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"票数: %d",model.userNum] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 13],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt1 = attributedString1;
    self.piaoShuLabel.attributedText = abt1;
//    self.piaoShuLabel.text = [NSString stringWithFormat:@"票数: %d",model.userNum];
    if (model.type == 0) {
        self.toupiaoButton.backgroundColor = kGreenColor;
        NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:@"投票" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 13],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        NSAttributedString *abt1 = attributedString1;
        [self.toupiaoButton setAttributedTitle:abt1 forState:UIControlStateNormal];

    }else if(model.type == 1) {
        self.toupiaoButton.backgroundColor = [UIColor lightGrayColor];
        NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:@"已投票" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 13],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        NSAttributedString *abt1 = attributedString1;
        [self.toupiaoButton setAttributedTitle:abt1 forState:UIControlStateNormal];
//        [self.toupiaoButton setTitle:@"已投票" forState:UIControlStateNormal];

    }
}

@end
