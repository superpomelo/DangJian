//
//  ThirdGuanXiZhuanJie2TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdGuanXiZhuanJie2TableViewCell.h"
@interface ThirdGuanXiZhuanJie2TableViewCell ()<UITextViewDelegate>

@end
@implementation ThirdGuanXiZhuanJie2TableViewCell

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
    if ([self.delegate respondsToSelector:@selector(ThirdGuanXiZhuanJie2TableViewCellActiondelegate:textview:)]) {
        [self.delegate ThirdGuanXiZhuanJie2TableViewCellActiondelegate:self textview:textView];
    }
}

@end
