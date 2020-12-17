//
//  SecondMyPointsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondMyPointsTableViewCell.h"

@implementation SecondMyPointsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/**排行榜*/
- (IBAction)rankListButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondMyPointsTableViewCellrankListButtonActiondelegate:)]) {
        [self.delegate SecondMyPointsTableViewCellrankListButtonActiondelegate:self];
    }
}
/**积分兑换*/
- (IBAction)jiFenDuiHuanButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondMyPointsTableViewCelljiFenDuiHuanButtonActiondelegate:)]) {
        [self.delegate SecondMyPointsTableViewCelljiFenDuiHuanButtonActiondelegate:self];
    }
}
@end
