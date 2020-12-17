//
//  FourthMyPointsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FourthMyPointsTableViewCell.h"

@implementation FourthMyPointsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyPointsModel*)model{
    //type：0-课时 1-签到 2-新闻 3-活动 4-朋友圈
    if (model.type == 0) {
        self.titleLabel.text = @"课时";
    }else if (model.type == 1) {
        self.titleLabel.text = @"签到";
    }else if (model.type == 2) {
        self.titleLabel.text = @"新闻";
    }else if (model.type == 3) {
        self.titleLabel.text = @"活动";
    }else if (model.type == 4) {
        self.titleLabel.text = @"劳动圈";
    }
    self.timeLabel.text = model.createTime;
    self.pointLabel.text = [NSString stringWithFormat:@"+%d",model.numerical];
}
@end
