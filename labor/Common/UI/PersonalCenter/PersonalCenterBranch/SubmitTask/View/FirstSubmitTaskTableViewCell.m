//
//  FirstSubmitTaskTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/29.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstSubmitTaskTableViewCell.h"
@interface FirstSubmitTaskTableViewCell ()<UITextViewDelegate>

@end
@implementation FirstSubmitTaskTableViewCell

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
    if ([self.delegate respondsToSelector:@selector(FirstSubmitTaskTableViewCellActiondelegate:textview:)]) {
        [self.delegate FirstSubmitTaskTableViewCellActiondelegate:self textview:textView];
    }
}

@end
