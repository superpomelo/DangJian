//
//  SecondChangJianWenTiTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondChangJianWenTiTableViewCell.h"

@implementation SecondChangJianWenTiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(ChangjianWenTiModel*)model number:(NSInteger)number{
    self.numberLabel.text = [NSString stringWithFormat:@"Q%ld",number];
//    self.questionLabel.text = model.question;
    self.questionLabel.attributedText = [UILabel getABTbody:model.question font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
}
@end
