//
//  SecondFaBuGuShiVTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondFaBuGuShiVTableViewCell.h"
@interface SecondFaBuGuShiVTableViewCell ()<UITextViewDelegate>

@end
@implementation SecondFaBuGuShiVTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView.layer.cornerRadius = 6;
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
    if ([self.delegate respondsToSelector:@selector(SecondFaBuGuShiVTableViewCellActiondelegate:textview:)]) {
        [self.delegate SecondFaBuGuShiVTableViewCellActiondelegate:self textview:textView];
    }
}


@end
