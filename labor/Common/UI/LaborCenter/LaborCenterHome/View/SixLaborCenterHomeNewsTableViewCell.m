//
//  SixLaborCenterHomeNewsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SixLaborCenterHomeNewsTableViewCell.h"
#import "MyTimeInterval.h"

@implementation SixLaborCenterHomeNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(LearningCenterHomeModel*)model{
    self.rightLabel.text = [MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY-MM-dd"];
    NSString *labelText = model.title;

//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSFontAttributeName: [UIFont fontWithName:@"SourceHanSerifCN-Bold" size: 18],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

    
    NSAttributedString *abt = attributedString;
    self.titleLabel.attributedText = abt;
//    self.titleLabel.text = model.title;
    self.timeLabel.text = model.source;
}
@end
