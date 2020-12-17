//
//  FourthFaBuXinDeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FourthFaBuXinDeTableViewCell.h"

@implementation FourthFaBuXinDeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)submitButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthFaBuXinDeTableViewCellActiondelegate:)]) {
        [self.delegate FourthFaBuXinDeTableViewCellActiondelegate:self];
    }
}
@end
