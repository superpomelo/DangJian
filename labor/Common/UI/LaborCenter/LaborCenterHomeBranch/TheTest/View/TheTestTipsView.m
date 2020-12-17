//
//  TheTestTipsView.m
//  labor
//
//  Created by 狍子 on 2020/9/1.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "TheTestTipsView.h"

@implementation TheTestTipsView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.hidden = YES;
}
- (void)reloadData:(NSString*)str{
    NSAttributedString *abt = [[NSAttributedString alloc]initWithString:str];
    self.titleLabel.attributedText = abt;
}
- (IBAction)closeButtonAction:(id)sender {
    self.hidden = YES;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
