//
//  FirstCommentOnHistoryTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstCommentOnHistoryTableViewCell.h"
#import "MyTimeInterval.h"

@implementation FirstCommentOnHistoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userImageView.layer.cornerRadius = self.userImageView.bounds.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadDatakecheng:(kechengModel*)model{
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.nameLabel.text = model.userName;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY.MM.dd HH:mm"]];

    self.pinlunLabel.text = model.body;
    if (model.title == nil) {
        self.fromLabel.text = [NSString stringWithFormat:@"* 原课程："];
    }else{
        self.fromLabel.text = [NSString stringWithFormat:@"* 原课程：%@",model.title];
    }
}
- (void)reloadDataxinwen:(xinwenModel*)model{
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.nameLabel.text = model.userName;
 
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY.MM.dd HH:mm"]];
    self.pinlunLabel.text = model.body;
    self.fromLabel.text = [NSString stringWithFormat:@"* 原文章：%@",model.title];
}
- (void)reloadDataquanzi:(quanziModel*)model{
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.nameLabel.text = model.username;
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY.MM.dd HH:mm"]];
    if (model.content == nil) {
        self.pinlunLabel.text = @"无内容";

    }else{
        self.pinlunLabel.text = model.content;

    }
    if (model.suprealName == nil) {
        self.fromLabel.text = [NSString stringWithFormat:@"* 原圈子：已删除的圈子"];
    }else{
        self.fromLabel.text = [NSString stringWithFormat:@"* 原圈子：%@的圈子",model.suprealName];
    }

}

@end
