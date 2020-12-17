//
//  FirstExaminationResultsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/7.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstExaminationResultsTableViewCell.h"

@implementation FirstExaminationResultsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     self.textDetailButton.layer.cornerRadius = self.textDetailButton.bounds.size.height/2;
    self.textDetailButton.layer.borderWidth = 1;
    self.textDetailButton.layer.borderColor = kGreenColor.CGColor;
    self.againButton.layer.cornerRadius = self.againButton.bounds.size.height/2;
//    if ([IsIphoneX isIphoneX]==NO) {
//        self.centerBottomViewLatoutconstraint.constant = 114;
//    }else{
//        self.centerBottomViewLatoutconstraint.constant = 158;
//
//    }
//    self.centerBottomView.layer.cornerRadius = self.centerBottomView.bounds.size.height/2;
//    self.centerBottomView.layer.borderWidth = 5;
//    self.centerBottomView.layer.borderColor = [UIColor whiteColor].CGColor;
   
    
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,SCR_W,self.topbottomView.bounds.size.height);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:214/255.0 green:68/255.0 blue:68/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:214/255.0 green:69/255.0 blue:68/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0.0),@(1.0)];

    [self.topbottomView.layer addSublayer:gl];
    
    

    
   

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(ExaminationResultsModel*)model{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d",model.userScore] attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:48],NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.totalQuestionNumLabel.text = [NSString stringWithFormat:@"%d",model.itemCount];
    self.userScoreLabel.attributedText = attributedString;
    self.wrongQuestionLabel.text = [NSString stringWithFormat:@"%d",model.wrongNum];
    self.UseTimeLabel.text = [NSString stringWithFormat:@"%d",model.answerTime];
    self.endTimeLabel.text = model.endTime;
    self.titlesLabel.text = model.title;
}

- (IBAction)stextDetailButtonAction:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(FirstExaminationResultsTableViewCellButtonActiondelegate:button:)]) {
        [self.delegate FirstExaminationResultsTableViewCellButtonActiondelegate:self button:sender];
    }
}

- (IBAction)sagainButtonAction:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(FirstExaminationResultsTableViewCellButtonActiondelegate:button:)]) {
        [self.delegate FirstExaminationResultsTableViewCellButtonActiondelegate:self button:sender];
    }
}

@end
