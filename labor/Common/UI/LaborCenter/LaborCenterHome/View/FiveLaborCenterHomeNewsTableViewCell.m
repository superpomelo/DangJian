//
//  FiveLaborCenterHomeNewsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FiveLaborCenterHomeNewsTableViewCell.h"
#import "MyTimeInterval.h"

@implementation FiveLaborCenterHomeNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.rightImageView.layer.cornerRadius = 3;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(LearningCenterHomeModel*)model{
    self.rightLabel.text = [MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY-MM-dd"];
    NSString *labelText = model.title;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSFontAttributeName: [UIFont fontWithName:@"SourceHanSerifCN-Bold" size: 18],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

    
    NSAttributedString *abt = attributedString;
    self.titleLabel.attributedText = abt;
    self.timeLabel.text = model.source;
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnail]];
}
@end
