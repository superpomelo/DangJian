//
//  NewSecondPersonalCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "NewSecondPersonalCenterHomeTableViewCell.h"

@implementation NewSecondPersonalCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:@"个人信息" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt1 = attributedString1;
    self.gerenxinxiLabel.attributedText = abt1;
    
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:@"入党申请" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt2 = attributedString2;
    self.rudangshenqingLabel.attributedText = abt2;
    
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:@"党费查询" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt3 = attributedString3;
    self.dangfeichaxunLabel.attributedText = abt3;
    
    NSMutableAttributedString *attributedString4 = [[NSMutableAttributedString alloc] initWithString:@"我的收藏" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt4 = attributedString4;
    self.wodeshoucangLabel.attributedText = abt4;
    
    NSMutableAttributedString *attributedString5 = [[NSMutableAttributedString alloc] initWithString:@"我的评论" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt5 = attributedString5;
    self.wodepinglunLabel.attributedText = abt5;
    
    NSMutableAttributedString *attributedString6 = [[NSMutableAttributedString alloc] initWithString:@"我的考试" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt6 = attributedString6;
    self.wodekaoshiLabel.attributedText = abt6;
    
    NSMutableAttributedString *attributedString7 = [[NSMutableAttributedString alloc] initWithString:@"我的书屋" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt7 = attributedString7;
    self.wodeshuwuLabel.attributedText = abt7;
    
    NSMutableAttributedString *attributedString8 = [[NSMutableAttributedString alloc] initWithString:@"学习心得" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt8 = attributedString8;
    self.xuexixindeLabel.attributedText = abt8;
    
    NSMutableAttributedString *attributedString9 = [[NSMutableAttributedString alloc] initWithString:@"组织活动" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt9 = attributedString9;
    self.zuzhihuodongLabel.attributedText = abt9;
   
    
    NSMutableAttributedString *attributedString10 = [[NSMutableAttributedString alloc] initWithString:@"发布故事坊" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt10 = attributedString10;
    self.fabugushiLabel.attributedText = abt10;
    
    NSMutableAttributedString *attributedString11 = [[NSMutableAttributedString alloc] initWithString:@"关系转接" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt11 = attributedString11;
    self.guanxizhuanjieLabel.attributedText = abt11;
    
    NSMutableAttributedString *attributedString12 = [[NSMutableAttributedString alloc] initWithString:@"我的设置" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt12 = attributedString12;
    self.wodeshezhiLabel.attributedText = abt12;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/**个人信息*/
- (IBAction)gerenButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:0];
    }
}
- (IBAction)rudangshenqingButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:1];
    }
}
- (IBAction)dangfeiChaxunButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:2];
    }
}
- (IBAction)shoucangButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:3];
    }
}
- (IBAction)pinlunButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:4];
    }
}
- (IBAction)kaoshiButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:5];
    }
}
- (IBAction)shuwuButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:6];
    }
}
- (IBAction)xindeButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:7];
    }
}
- (IBAction)fabuButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:9];
    }
}
- (IBAction)guanxiButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:10];
    }
}
- (IBAction)shezhiButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:11];
    }
}
- (IBAction)huodongButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:tags:)]) {
        [self.delegate NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:self tags:8];
    }
}

@end
