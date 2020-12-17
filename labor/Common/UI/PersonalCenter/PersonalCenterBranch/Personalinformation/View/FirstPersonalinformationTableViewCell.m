//
//  FirstPersonalinformationTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstPersonalinformationTableViewCell.h"

@implementation FirstPersonalinformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.avatarImageView.hidden = YES;
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.size.height/2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
