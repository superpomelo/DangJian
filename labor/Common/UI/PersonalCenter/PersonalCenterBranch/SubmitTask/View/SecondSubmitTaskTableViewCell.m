//
//  SecondSubmitTaskTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/29.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondSubmitTaskTableViewCell.h"

@implementation SecondSubmitTaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView9.hidden = YES;
    self.bottomView2.hidden = YES;
    self.bottomView3.hidden = YES;
    self.bottomView4.hidden = YES;
    self.bottomView5.hidden = YES;
    self.bottomView6.hidden = YES;
    self.bottomView7.hidden = YES;
    self.bottomView8.hidden = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)button1Action:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(SecondSubmitTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondSubmitTaskTableViewCellButtonActiondelegate:self button:sender tag:1];
    }
}
- (IBAction)button2Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondSubmitTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondSubmitTaskTableViewCellButtonActiondelegate:self button:sender tag:2];
    }
}
- (IBAction)button3Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondSubmitTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondSubmitTaskTableViewCellButtonActiondelegate:self button:sender tag:3];
    }
}
- (IBAction)button4Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondSubmitTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondSubmitTaskTableViewCellButtonActiondelegate:self button:sender tag:4];
    }
}
- (IBAction)button5Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondSubmitTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondSubmitTaskTableViewCellButtonActiondelegate:self button:sender tag:5];
    }
}
- (IBAction)button6Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondSubmitTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondSubmitTaskTableViewCellButtonActiondelegate:self button:sender tag:6];
    }
}
- (IBAction)button7Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondSubmitTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondSubmitTaskTableViewCellButtonActiondelegate:self button:sender tag:7];
    }
}
- (IBAction)button8Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondSubmitTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondSubmitTaskTableViewCellButtonActiondelegate:self button:sender tag:8];
    }
}
- (IBAction)button9Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondSubmitTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate SecondSubmitTaskTableViewCellButtonActiondelegate:self button:sender tag:9];
    }
}

@end
