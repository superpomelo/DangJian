//
//  FirstZhuTiHuoDongDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstZhuTiHuoDongDetailsTableViewCell.h"

@implementation FirstZhuTiHuoDongDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(ZhuTiHuoDongModel*)model{
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
}
@end
