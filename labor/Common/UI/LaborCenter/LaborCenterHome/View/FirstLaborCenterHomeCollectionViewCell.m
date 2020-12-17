//
//  FirstLaborCenterHomeCollectionViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstLaborCenterHomeCollectionViewCell.h"

@implementation FirstLaborCenterHomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code



}
- (void)initUI{
//    self.bottomView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
//    self.bottomView.layer.shadowColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
//    self.bottomView.layer.shadowOffset = CGSizeMake(0,2);
//    self.bottomView.layer.shadowOpacity = 1;
//    self.bottomView.layer.shadowRadius = 2;
    
    self.playImageView.alpha = 0.8;

    self.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.bottomView.layer.shadowColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0,1);
    self.bottomView.layer.shadowOpacity = 1;
    self.bottomView.layer.shadowRadius = 2;
    self.bottomView.layer.borderWidth = 0.5;
    self.bottomView.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    self.bottomView.layer.cornerRadius = 4;
    self.bottomView.layer.masksToBounds = YES;
}
- (void)reloadData:(TeacherLectureHallModel*)model{
    self.titleLabel.text = model.title;
    self.nameLabel.text = model.auth;
    self.bofangliangLabel.text = [NSString stringWithFormat:@"播放量:%d",model.count];
    NSString *http;
    if ([model.faceUrl containsString:@"http"]) {
        http = @"";
        
    }else{
        http = [NSString stringWithFormat:@"%@",VideoHost];
//        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    [self.firstVideoImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,model.faceUrl]]];
}
@end
