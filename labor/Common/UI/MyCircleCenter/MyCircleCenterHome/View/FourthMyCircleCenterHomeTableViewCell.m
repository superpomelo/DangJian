//
//  FourthMyCircleCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/15.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FourthMyCircleCenterHomeTableViewCell.h"

@implementation FourthMyCircleCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/**全部*/
- (IBAction)allButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyCircleCenterHomeTableViewCellButtonActiondelegate:tag:)]) {
        [self.delegate FourthMyCircleCenterHomeTableViewCellButtonActiondelegate:self tag:1];
    }
}
/**校园圈*/
- (IBAction)schoolButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyCircleCenterHomeTableViewCellButtonActiondelegate:tag:)]) {
        [self.delegate FourthMyCircleCenterHomeTableViewCellButtonActiondelegate:self tag:2];
    }
}
/**视频*/
- (IBAction)videoButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyCircleCenterHomeTableViewCellButtonActiondelegate:tag:)]) {
        [self.delegate FourthMyCircleCenterHomeTableViewCellButtonActiondelegate:self tag:3];
    }
}

@end
