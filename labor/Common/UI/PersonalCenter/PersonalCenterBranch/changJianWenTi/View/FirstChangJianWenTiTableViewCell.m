//
//  FirstChangJianWenTiTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstChangJianWenTiTableViewCell.h"

@implementation FirstChangJianWenTiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(ChangjianWenTiModel*)model{
//    self.answerLabel.text = [NSString stringWithFormat:@"答: %@",model.answer];
    self.answerLabel.attributedText = [UILabel getABTbody:[NSString stringWithFormat:@"答: %@",model.answer] font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
}
@end
