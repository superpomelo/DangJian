//
//  SecondMyTaskAssessmentDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondMyTaskAssessmentDetailsTableViewCell.h"
#import "MyTimeInterval.h"

@implementation SecondMyTaskAssessmentDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.time1BottomView.layer.cornerRadius = 2;
    self.time2BottomView.layer.borderWidth = 0.5;
    self.time2BottomView.layer.borderColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1].CGColor;
    self.time2BottomView.layer.cornerRadius = 2;
    
    self.pleaceBottomView1.layer.cornerRadius = 2;
    self.pleaceBottomView2.layer.borderWidth = 0.5;
    self.pleaceBottomView2.layer.borderColor = [UIColor colorWithRed:105/255.0 green:154/255.0 blue:242/255.0 alpha:1].CGColor;
    self.pleaceBottomView2.layer.cornerRadius = 2;
}
- (void)reloadData:(TaskAssessmentDetailsModel*)model{
    NSAttributedString *abt = [[NSAttributedString alloc]initWithString:model.title];
    self.titleLabel.attributedText = abt;
    self.lookNumberLabel.text = [NSString stringWithFormat:@"浏览量:%d",model.visitorsNum];
    self.baoMingLabel.text = [NSString stringWithFormat:@" 报名数:%d",model.signUpNum];;
    self.timeLabel.text = [NSString stringWithFormat:@"%@-%@",[MyTimeInterval IntervalStringToIneedDateString:model.startTime type:@"YYYY.MM.dd HH:mm"],[MyTimeInterval IntervalStringToIneedDateString:model.endTime type:@"MM.dd HH:mm"]];
    self.placeLabel.text = model.activityAddress;
        NSAttributedString *abtact = [[NSAttributedString alloc]initWithString:model.introduction];
    self.activeDetailLabel.attributedText = abtact;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
