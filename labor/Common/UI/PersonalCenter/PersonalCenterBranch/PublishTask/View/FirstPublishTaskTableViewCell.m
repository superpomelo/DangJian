//
//  FirstPublishTaskTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstPublishTaskTableViewCell.h"
@interface FirstPublishTaskTableViewCell ()<UITextViewDelegate>

@end
@implementation FirstPublishTaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.myTextView.delegate = self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
// 将要开始编辑

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    self.pleaseholdLabel.hidden = YES;
    return YES;
}
// 文本发生改变

- (void)textViewDidChange:(UITextView *)textView{
    NSLog(@"%@",textView.text);
    if ([self.delegate respondsToSelector:@selector(FirstPublishTaskTableViewCellActiondelegate:textview:)]) {
        [self.delegate FirstPublishTaskTableViewCellActiondelegate:self textview:textView];
    }
}
/**图片选择*/
- (IBAction)button1Action:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(FirstPublishTaskTableViewCellButtonActiondelegate:button:tag:)]) {
        [self.delegate FirstPublishTaskTableViewCellButtonActiondelegate:self button:sender tag:1];
    }
}

/**班级选择*/
- (IBAction)classButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FirstPublishTaskTableViewCellClassActiondelegate:)]) {
        [self.delegate FirstPublishTaskTableViewCellClassActiondelegate:self];
    }
}
/**开始时间*/
- (IBAction)startTimeAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FirstPublishTaskTableViewCellStartTimeActiondelegate:)]) {
        [self.delegate FirstPublishTaskTableViewCellStartTimeActiondelegate:self];
    }
}
/**结束时间*/
- (IBAction)endTimeAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FirstPublishTaskTableViewCellEndTimeActiondelegate:)]) {
        [self.delegate FirstPublishTaskTableViewCellEndTimeActiondelegate:self];
    }
}
/**必选*/
- (IBAction)biXuanButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FirstPublishTaskTableViewCellBiXuanActiondelegate:)]) {
        [self.delegate FirstPublishTaskTableViewCellBiXuanActiondelegate:self];
    }
}
/**自选*/
- (IBAction)ziXuanButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FirstPublishTaskTableViewCellZiXuanActiondelegate:)]) {
        [self.delegate FirstPublishTaskTableViewCellZiXuanActiondelegate:self];
    }
}

@end
