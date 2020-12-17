//
//  FirstFaBuGuShiVTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstFaBuGuShiVTableViewCell.h"
@interface FirstFaBuGuShiVTableViewCell ()<UITextViewDelegate>

@end
@implementation FirstFaBuGuShiVTableViewCell

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
    if ([self.delegate respondsToSelector:@selector(FirstFaBuGuShiVTableViewCellActiondelegate:textview:)]) {
        [self.delegate FirstFaBuGuShiVTableViewCellActiondelegate:self textview:textView];
    }
}

@end
