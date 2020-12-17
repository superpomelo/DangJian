//
//  ThirdShenQingShuTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdShenQingShuTableViewCell.h"

@implementation ThirdShenQingShuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.submitButton.layer.cornerRadius = 50/2;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)submitButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ThirdShenQingShuTableViewCellActiondelegate:)]) {
        [self.delegate ThirdShenQingShuTableViewCellActiondelegate:self];
    }
}

@end
