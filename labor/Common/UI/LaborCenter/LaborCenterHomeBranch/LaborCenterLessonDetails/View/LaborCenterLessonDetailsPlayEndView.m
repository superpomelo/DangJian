//
//  LaborCenterLessonDetailsPlayEndView.m
//  labor
//
//  Created by 狍子 on 2020/10/20.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "LaborCenterLessonDetailsPlayEndView.h"

@implementation LaborCenterLessonDetailsPlayEndView

/**再看一遍*/
- (IBAction)leftButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(LaborCenterLessonDetailsPlayEndViewLeftButtonActiondelegate:)]) {
        [self.delegate LaborCenterLessonDetailsPlayEndViewLeftButtonActiondelegate:self];
    }
}
/**去考试*/
- (IBAction)rightButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(LaborCenterLessonDetailsPlayEndViewrightButtonActiondelegate:)]) {
        [self.delegate LaborCenterLessonDetailsPlayEndViewrightButtonActiondelegate:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
