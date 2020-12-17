//
//  SecondShenQingShuTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondShenQingShuTableViewCell.h"

@implementation SecondShenQingShuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView2.hidden = YES;
    self.bottomView3.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)button1Action:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(SecondShenQingShuTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondShenQingShuTableViewCellButtonActiondelegate:self button:sender tag:1];
    }
}
- (IBAction)button2Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondShenQingShuTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondShenQingShuTableViewCellButtonActiondelegate:self button:sender tag:2];
    }
}
- (IBAction)button3Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondShenQingShuTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondShenQingShuTableViewCellButtonActiondelegate:self button:sender tag:3];
    }
}

@end
