//
//  FivethLearningCenterDetails1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FivethLearningCenterDetails1TableViewCell.h"

@implementation FivethLearningCenterDetails1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(NSString*)model{
//    NSString *s1 = [model.body stringByReplacingOccurrencesOfString:@"&nbsp;&nbsp;" withString:@"\n      "];
//
//
    NSString *labelText = model;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont boldSystemFontOfSize:23]}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

//    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:@"课程推荐" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
    
    NSAttributedString *abt = attributedString;
    self.titleLabel.attributedText = abt;
    [self.titleLabel sizeToFit];
}


@end
