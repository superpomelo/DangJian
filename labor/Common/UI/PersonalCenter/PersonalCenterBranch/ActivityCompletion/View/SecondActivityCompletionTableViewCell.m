//
//  SecondActivityCompletionTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondActivityCompletionTableViewCell.h"

@implementation SecondActivityCompletionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/**查看*/
- (IBAction)lookButtonAction:(id)sender {
}

@end
