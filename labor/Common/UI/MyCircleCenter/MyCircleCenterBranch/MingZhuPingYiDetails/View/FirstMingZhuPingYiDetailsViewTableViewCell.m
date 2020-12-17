//
//  FirstMingZhuPingYiDetailsViewTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMingZhuPingYiDetailsViewTableViewCell.h"

@implementation FirstMingZhuPingYiDetailsViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MingZhuPingYiDetailsModel*)model{
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
}
@end
