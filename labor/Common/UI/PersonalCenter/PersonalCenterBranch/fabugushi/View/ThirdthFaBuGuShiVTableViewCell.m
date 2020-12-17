//
//  ThirdthFaBuGuShiVTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdthFaBuGuShiVTableViewCell.h"

@implementation ThirdthFaBuGuShiVTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.submitButton.layer.cornerRadius = 3;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)submitButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ThirdthFaBuGuShiVTableViewCellButtonActiondelegate:)]) {
        [self.delegate ThirdthFaBuGuShiVTableViewCellButtonActiondelegate:self];
    }
}

@end
