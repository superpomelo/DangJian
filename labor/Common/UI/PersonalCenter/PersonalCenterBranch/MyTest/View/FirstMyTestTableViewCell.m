//
//  FirstMyTestTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/4.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyTestTableViewCell.h"

@implementation FirstMyTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView.layer.cornerRadius = 4;
    self.bottomView.layer.masksToBounds = YES;

//    self.scoreBottomView.layer.cornerRadius = 3;
//    self.zanweidatiBottomView.layer.cornerRadius = 3;
//    self.zanweidatiBottomView.layer.masksToBounds = YES;


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(TheExamRushedOffModel*)model{
    self.titleLabel.text = model.title;

    if ([model.endTime containsString:@" "]) {
        NSArray *array = [model.endTime componentsSeparatedByString:@" "];
        self.endTimeLabel.text = [NSString stringWithFormat:@"结束时间:%@",array[0]];
    }else{
        self.endTimeLabel.text = [NSString stringWithFormat:@"结束时间:%@",model.endTime];
    }
    /**0暂未答题  1已答题*/
    if (model.status==0) {
        self.zanweidatiBottomView.hidden = NO;
        self.scoreBottomView.hidden = YES;
    }else if (model.status == 1){
        self.zanweidatiBottomView.hidden = YES;
        self.scoreBottomView.hidden = NO;
        self.scoreLabel.text = [NSString stringWithFormat:@"%d",model.mysacore];
    }
}
@end
