//
//  FourthLearningCenterDetails2TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FourthLearningCenterDetails2TableViewCell.h"

@implementation FourthLearningCenterDetails2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(TeacherLectureHallModel*)model{
    NSMutableAttributedString *abt = [[NSMutableAttributedString alloc]initWithString:model.body];
    self.bodyLabel.attributedText = abt;
}
@end
