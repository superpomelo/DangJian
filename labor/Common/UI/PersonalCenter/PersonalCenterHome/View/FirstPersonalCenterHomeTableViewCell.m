//
//  FirstPersonalCenterHomeTableViewCell.m
//  com.tkhy.driver
//
//  Created by 狍子 on 2020/8/4.
//  Copyright © 2020 TK. All rights reserved.
//

#import "FirstPersonalCenterHomeTableViewCell.h"

@implementation FirstPersonalCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)myPointButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FirstPersonalCenterHomeTableViewCellmyPointButtonActiondelegate:)]) {
        [self.delegate FirstPersonalCenterHomeTableViewCellmyPointButtonActiondelegate:self];
    }
}

- (void)reloadData:(PersonalCenterHomeModel*)model{
//    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"touxiangpleasehold"]];
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:model.realName attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSAttributedString *abt3 = attributedString3;
    self.userNameLabel.attributedText = abt3;
    NSMutableAttributedString *attributedString4 = [[NSMutableAttributedString alloc] initWithString:model.deptName attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
 
    NSAttributedString *abt4 = attributedString4;
    self.classNumLabel.attributedText = abt4;
    NSMutableAttributedString *attributedString5 = [[NSMutableAttributedString alloc] initWithString:model.deptType attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.shenfenLabel.attributedText = attributedString5;

}

@end
