//
//  SecondLaborCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondLaborCenterHomeTableViewCell.h"

@implementation SecondLaborCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"党员培训室" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt = attributedString;
    self.p1Label.attributedText = abt;
    
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:@"党务指南" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt2 = attributedString2;
    self.p2Label.attributedText = abt2;
    
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:@"党员发展" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt3 = attributedString3;
    self.p3Label.attributedText = abt3;
    
    NSMutableAttributedString *attributedString4 = [[NSMutableAttributedString alloc] initWithString:@"红色教育" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSAttributedString *abt4 = attributedString4;
    self.p4Label.attributedText = abt4;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/**名师讲堂*/
- (IBAction)teacherLectureHallButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondLaborCenterHomeTableViewCellButtonActiondelegate:button:state:)]) {
        [self.delegate SecondLaborCenterHomeTableViewCellButtonActiondelegate:self button:sender state:LaborCenterStateTeacherLectureHall];
       }
}
/**考试冲关*/
- (IBAction)theTestButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondLaborCenterHomeTableViewCellButtonActiondelegate:button:state:)]) {
        [self.delegate SecondLaborCenterHomeTableViewCellButtonActiondelegate:self button:sender state:LaborCenterStateTheTest];
       }
}
/**任务考核*/
- (IBAction)theExamRushedOffButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondLaborCenterHomeTableViewCellButtonActiondelegate:button:state:)]) {
        [self.delegate SecondLaborCenterHomeTableViewCellButtonActiondelegate:self button:sender state:LaborCenterStateTheExamRushedOff];
       }
}
/**VR看校园*/
- (IBAction)vRSeeCampusButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondLaborCenterHomeTableViewCellButtonActiondelegate:button:state:)]) {
        [self.delegate SecondLaborCenterHomeTableViewCellButtonActiondelegate:self button:sender state:LaborCenterStateVRSeeCampus];
       }
}

@end
