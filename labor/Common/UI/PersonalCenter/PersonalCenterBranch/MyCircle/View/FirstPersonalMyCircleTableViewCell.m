//
//  FirstPersonalMyCircleTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstPersonalMyCircleTableViewCell.h"

@implementation FirstPersonalMyCircleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(PersonalMyCircleModel*)model{
    if (model.content == nil) {
        self.bodyLabel.text = @"无内容";

    }else{
//        self.bodyLabel.text = model.content;
        NSString *labelText = model.content;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont systemFontOfSize:16]}];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:5];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

        
        NSAttributedString *abt = attributedString;
        self.bodyLabel.attributedText = abt;
    }}
@end
