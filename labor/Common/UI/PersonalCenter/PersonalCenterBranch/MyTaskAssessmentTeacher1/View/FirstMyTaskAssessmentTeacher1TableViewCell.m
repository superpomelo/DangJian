//
//  FirstMyTaskAssessmentTeacher1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyTaskAssessmentTeacher1TableViewCell.h"

@implementation FirstMyTaskAssessmentTeacher1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.detailsBottomView.layer.borderWidth = 0.5;
    self.detailsBottomView.layer.borderColor = kGreenColor.CGColor;
    self.detailsBottomView.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(NSString*)titles{
    NSMutableAttributedString *abt = [[NSMutableAttributedString alloc]initWithString:titles];
    self.titlesLabel.attributedText = abt;
}
@end
