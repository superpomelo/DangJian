//
//  EightLaborCenterHomeNewsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/9.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "EightLaborCenterHomeNewsTableViewCell.h"
#import "XBTextLoopView.h"

@implementation EightLaborCenterHomeNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView.layer.cornerRadius = 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(id)data{
    XBTextLoopView *loopView = [XBTextLoopView textLoopViewWith:data loopInterval:2.0 initWithFrame:CGRectMake(0, 0, SCR_W-70, 28) selectBlock:^(NSString *selectString, NSInteger index) {
            NSLog(@"%@===index%ld", selectString, index);
        if ([self.delegate respondsToSelector:@selector(EightLaborCenterHomeNewsTableViewCellActiondelegate:index:)]) {
            [self.delegate EightLaborCenterHomeNewsTableViewCellActiondelegate:self index:index];
        }
    }];
    [self.labelBottomView addSubview:loopView];
}
@end
