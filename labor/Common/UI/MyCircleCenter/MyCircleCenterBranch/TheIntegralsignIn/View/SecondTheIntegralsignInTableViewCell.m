//
//  SecondTheIntegralsignInTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondTheIntegralsignInTableViewCell.h"

@implementation SecondTheIntegralsignInTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.qianDaoButton.userInteractionEnabled = NO;
    self.qianDaoButton.layer.cornerRadius = 35/2;
    self.qiandaobeijingView.layer.cornerRadius = 6;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)buttonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondTheIntegralsignInTableViewCellButtonActiondelegate:)]) {
        [self.delegate SecondTheIntegralsignInTableViewCellButtonActiondelegate:self];
    }
}

@end
