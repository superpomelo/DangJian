//
//  MyTaskAssessmentTeacherTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/29.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyTaskAssessmentTeacherTableViewCell.h"

@implementation MyTaskAssessmentTeacherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView.layer.shadowColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0,1);
    self.bottomView.layer.shadowOpacity = 1;
    self.bottomView.layer.shadowRadius = 2;
    self.bottomView.layer.borderWidth = 0.5;
    self.bottomView.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.cornerRadius = 4;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyTaskAssessmentTeacherModel*)model tagt:(int)tagt{
    self.titleLabel.text = [NSString stringWithFormat:@"%@(%@)",model.title,model.className];
    self.bodyLabel.text = model.introduction;
    NSURL *Url;
    if ([model.cover containsString:@"http"]) {
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.cover]];

    }else{
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    [self.coverImageView sd_setImageWithURL:Url];
    if (tagt == 0) {
        self.stateLabel.text = @"进行中";
    }else{
        self.stateLabel.text = @"已结束";
    }
}
@end
