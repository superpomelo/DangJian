//
//  FirstTheProblemOfFeedbackTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/10/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstTheProblemOfFeedbackTableViewCell.h"
@interface FirstTheProblemOfFeedbackTableViewCell ()<UITextViewDelegate>

@end
@implementation FirstTheProblemOfFeedbackTableViewCell

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
    if ([self.delegate respondsToSelector:@selector(FirstTheProblemOfFeedbackTableViewCellActiondelegate:textview:)]) {
        [self.delegate FirstTheProblemOfFeedbackTableViewCellActiondelegate:self textview:textView];
    }
}
@end
