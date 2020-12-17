//
//  FirstVRSeeCampusTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstVRSeeCampusTableViewCell.h"

@implementation FirstVRSeeCampusTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    self.bottomView.layer.shadowColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0,1);
    self.bottomView.layer.shadowOpacity = 1;
    self.bottomView.layer.shadowRadius = 2;
    self.bottomView.layer.borderWidth = 0.5;
    self.bottomView.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.cornerRadius = 4;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.bottomView.layer.masksToBounds = YES;

    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
