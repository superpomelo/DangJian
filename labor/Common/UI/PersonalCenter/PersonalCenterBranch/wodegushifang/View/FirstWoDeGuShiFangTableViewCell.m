//
//  FirstWoDeGuShiFangTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstWoDeGuShiFangTableViewCell.h"

@implementation FirstWoDeGuShiFangTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView.layer.cornerRadius = 6;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadData:(WoDeGuShiListModel*)model{
    self.titleLabel.text = model.title;
    self.bodyLabel.text = [NSString stringWithFormat:@"发布时间:%@",model.createTime];
}

@end
