//
//  FourthLaborCenterLessonDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/8.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FourthLaborCenterLessonDetailsTableViewCell.h"

@implementation FourthLaborCenterLessonDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(TeacherLectureHallModel*)model{
    if (model.body != nil) {
//        NSMutableAttributedString *abt = [[NSMutableAttributedString alloc]initWithString:model.body];
//        self.bodyLabel.attributedText = abt;
        
        NSString *labelText = model.body;

        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont systemFontOfSize:16]}];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:5];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

        
        NSAttributedString *abt = attributedString;
        self.bodyLabel.attributedText = abt;
    }

}
@end
