//
//  FirstMyTaskAssessmentTeacher3TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyTaskAssessmentTeacher3TableViewCell.h"

@implementation FirstMyTaskAssessmentTeacher3TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImageView.layer.cornerRadius = 40/2;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyTaskAssessmentTeacher3Model*)model{
//    self.timeLabel.text = model.createTime;
//    self.userNameLabel.text = model.userName;
    NSString *http;
    if ([model.cover containsString:@"http"]) {
        http = @"";
        
    }else{
        http = [NSString stringWithFormat:@"%@",VideoHost];
//        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,model.avatar]]];
}
@end
