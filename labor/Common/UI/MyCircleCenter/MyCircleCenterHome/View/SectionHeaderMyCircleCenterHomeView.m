//
//  SectionHeaderMyCircleCenterHomeView.m
//  labor
//
//  Created by 狍子 on 2020/9/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SectionHeaderMyCircleCenterHomeView.h"

@implementation SectionHeaderMyCircleCenterHomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/**全部*/
- (IBAction)allButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SectionHeaderMyCircleCenterHomeViewButtonActiondelegate:tag:)]) {
        [self.delegate SectionHeaderMyCircleCenterHomeViewButtonActiondelegate:self tag:1];
    }
}
/**校园圈*/
- (IBAction)schoolButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SectionHeaderMyCircleCenterHomeViewButtonActiondelegate:tag:)]) {
        [self.delegate SectionHeaderMyCircleCenterHomeViewButtonActiondelegate:self tag:2];
    }
}
/**视频*/
- (IBAction)videoButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SectionHeaderMyCircleCenterHomeViewButtonActiondelegate:tag:)]) {
        [self.delegate SectionHeaderMyCircleCenterHomeViewButtonActiondelegate:self tag:3];
    }
}
@end
