//
//  FirstTheExamRushedOffTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstTheExamRushedOffTableViewCell.h"
#import "MyTimeInterval.h"

@implementation FirstTheExamRushedOffTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView.layer.cornerRadius = 3;
    self.bottomView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(TheExamRushedOffModel*)model{
//    self.titleLabel.text = model.title;
//    self.starttimeLabel.text = [NSString stringWithFormat:@"开始时间:%@",model.startTime];
    self.endtimeLabel.text = [NSString stringWithFormat:@"结束时间:%@",[MyTimeInterval IntervalStringToIneedDateString:model.endTime type:@"YYYY-MM-dd HH:mm"]];

    
    NSString *labelText = model.title;

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

    
    NSAttributedString *abt = attributedString;
    self.titleLabel.attributedText = abt;
//    self.statusLabel
    
}

@end
