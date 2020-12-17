//
//  GuanXiZhuanJie2OKView.m
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "GuanXiZhuanJie2OKView.h"

@implementation GuanXiZhuanJie2OKView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.hidden = YES;
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
