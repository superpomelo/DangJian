//
//  SecondMyClassTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondMyClassTableViewCell.h"

@implementation SecondMyClassTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.tijiaoButton.layer.cornerRadius = 3;
    self.bottomView.layer.cornerRadius = 6;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)submitButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondMyClassTableViewCellActiondelegate:)]) {
        [self.delegate SecondMyClassTableViewCellActiondelegate:self];
    }
}

@end
