//
//  HuoDongTiShiView.m
//  labor
//
//  Created by 狍子 on 2020/12/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "HuoDongTiShiView.h"

@implementation HuoDongTiShiView
/**点击去参加*/
- (IBAction)myButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(iKnowButtClick)]) {
        [self.delegate iKnowButtClick];
    }
}
-(void)dealloc{
    NSLog(@"弹窗安全销毁");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
