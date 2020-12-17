//
//  SecondMyCircleCenterDetails1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondMyCircleCenterDetails1TableViewCell.h"

@implementation SecondMyCircleCenterDetails1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyCircleCenterHomeModel*)model{
    if (model.content != nil) {
//            NSAttributedString *abt = [[NSAttributedString alloc]initWithString:model.content];
//        self.bodyLabel.attributedText = abt;
        
        NSString *labelText = model.content;

        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont systemFontOfSize:16]}];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:4];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

        
        NSAttributedString *abt = attributedString;
        self.bodyLabel.attributedText = abt;
    }else{
        NSAttributedString *abt = [[NSAttributedString alloc]initWithString:@"无内容"];
        self.bodyLabel.attributedText = abt;

    }
 

}

@end
