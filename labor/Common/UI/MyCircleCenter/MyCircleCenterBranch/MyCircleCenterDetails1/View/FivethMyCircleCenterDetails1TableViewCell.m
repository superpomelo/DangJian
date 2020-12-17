//
//  FivethMyCircleCenterDetails1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FivethMyCircleCenterDetails1TableViewCell.h"
#import "MyTimeInterval.h"

@implementation FivethMyCircleCenterDetails1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userImageView.layer.cornerRadius = self.userImageView.bounds.size.height/2;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//- (void)reloadData:(GetCommentVoListModel*)model{
//    self.bodyLabel.text = model.content;
//    self.timeLabel.text = [MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"MM.dd HH:mm"];
//    self.userNameLabel.text = model.realName;
////    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
//    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"touxiangpleasehold"]];
//}

- (void)reloadData:(GetCommentVoListModel*)model{
    self.bodyLabel.text = model.content;
    if ([model.createTime containsString:@" "]) {
        NSArray *array = [model.createTime componentsSeparatedByString:@" "];
        self.timeLabel.text = [NSString stringWithFormat:@"%@",array[0]];
    }else{
        self.timeLabel.text = [NSString stringWithFormat:@"%@",model.createTime];
    }
    if (model.type==0) {
        self.dianzanImageView.image = [UIImage imageNamed:@"组件 6 – 1"];
    }else if (model.type==1){
        self.dianzanImageView.image = [UIImage imageNamed:@"组件 6 – 2"];

    }
    self.dianzanliangLabel.text = [NSString stringWithFormat:@"%d",model.count];
//    self.timeLabel.text = model.createTime;
    self.userNameLabel.text = model.realName;
//    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"touxiangpleasehold"]];
}
- (IBAction)dianzanButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FivethMyCircleCenterDetails1TableViewCellButtonActiondelegate:button:index:)]) {
        [self.delegate FivethMyCircleCenterDetails1TableViewCellButtonActiondelegate:self button:sender index:self.indexpath];
    }
}
@end
