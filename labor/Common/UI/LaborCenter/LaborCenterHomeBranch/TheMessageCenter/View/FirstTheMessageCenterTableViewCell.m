//
//  FirstTheMessageCenterTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstTheMessageCenterTableViewCell.h"
#import "MyTimeInterval.h"

@implementation FirstTheMessageCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.colorBottomView.layer.cornerRadius = 5/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(TheMessageCenterModel*)model{
    self.titlesLabel.text = model.title;
    self.bodyLabel.text = model.content;
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY.MM.dd HH:mm"]];
}
@end
