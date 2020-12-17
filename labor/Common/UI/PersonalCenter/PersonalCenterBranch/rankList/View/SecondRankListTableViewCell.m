//
//  SecondRankListTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondRankListTableViewCell.h"

@implementation SecondRankListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userImageView.layer.cornerRadius = self.userImageView.bounds.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(RankListModel*)model indexPath:(NSIndexPath*)indexPath{
    self.numLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row+4];
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.usernameLabel.text = model.realName;
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",model.numerical];
    
}
@end
