//
//  FirstMyTaskAssessmentTeacher2TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyTaskAssessmentTeacher2TableViewCell.h"

@implementation FirstMyTaskAssessmentTeacher2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyTaskAssessmentTeacher2Model*)model tagt:(int)tagt status:(MyTaskAssessmentTeacher2TypeState)status{
    self.nameLabel.text = model.realName;
    //tagt 0 已完成  /1 未完成
    if (tagt==0) {
        //reviewFlag 0未查看 2已查看
        if (model.reviewFlag == 0) {
            self.rightLabel.text = @"查看";
            self.rightLabel.textColor = kGreenColor;
        }else if(model.reviewFlag==2){
            self.rightLabel.text = @"已查看";
            self.rightLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];

        }
    }else{
        if (status == MyTaskAssessmentTeacher2ongoing) {
            self.rightLabel.text = @"提醒";
            self.rightLabel.textColor = [UIColor colorWithRed:38/255.0 green:96/255.0 blue:243/255.0 alpha:1];
        }else{
            self.rightLabel.text = @"";
            self.rightLabel.textColor = [UIColor colorWithRed:38/255.0 green:96/255.0 blue:243/255.0 alpha:1];
        }
       

    }
}
@end
