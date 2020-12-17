//
//  FirstShenQingShuTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstShenQingShuTableViewCell.h"
@interface FirstShenQingShuTableViewCell ()<UITextViewDelegate>

@end
@implementation FirstShenQingShuTableViewCell

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
    if ([self.delegate respondsToSelector:@selector(FirstShenQingShuTableViewCellActiondelegate:textview:)]) {
        [self.delegate FirstShenQingShuTableViewCellActiondelegate:self textview:textView];
    }
}

@end
