//
//  SecondTaskAssessmentDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondTaskAssessmentDetailsTableViewCell.h"
#import "MyTimeInterval.h"

@implementation SecondTaskAssessmentDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.time1BottomView.layer.cornerRadius = 2;
    self.time2BottomView.layer.borderWidth = 0.5;
    self.time2BottomView.layer.borderColor = [UIColor colorWithRed:212/255.0 green:55/255.0 blue:55/255.0 alpha:1].CGColor;
    self.time2BottomView.layer.cornerRadius = 2;
    
    self.pleaceBottomView1.layer.cornerRadius = 2;
    self.pleaceBottomView2.layer.borderWidth = 0.5;
    self.pleaceBottomView2.layer.borderColor = [UIColor colorWithRed:248/255.0 green:155/255.0 blue:73/255.0 alpha:1].CGColor;
    self.pleaceBottomView2.layer.cornerRadius = 2;
    
    self.biaoqianBottomView.layer.borderColor = [UIColor colorWithRed:212/255.0 green:55/255.0 blue:55/255.0 alpha:1.0].CGColor;
    self.biaoqianBottomView.layer.borderWidth = 0.5;
    self.biaoqianBottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.biaoqianBottomView.layer.cornerRadius = 2;
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
