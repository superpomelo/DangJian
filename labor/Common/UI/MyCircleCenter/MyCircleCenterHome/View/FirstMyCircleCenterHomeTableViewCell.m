//
//  FirstMyCircleCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyCircleCenterHomeTableViewCell.h"

@implementation FirstMyCircleCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.theIntegralsignInButton.layer.cornerRadius = 30/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/**签到*/
- (IBAction)theIntegralsignInButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FirstMyCircleCenterHomeTableViewCelltheIntegralsignInButtonActiondelegate:)]) {
        [self.delegate FirstMyCircleCenterHomeTableViewCelltheIntegralsignInButtonActiondelegate:self];
    }
}
- (void)reloadData:(int)fire{
    self.hotNumLabel.text = [NSString stringWithFormat:@"热度: %d",fire];
}

@end
