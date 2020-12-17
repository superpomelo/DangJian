//
//  FirstTeacherLectureHallCollectionViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstTeacherLectureHallCollectionViewCell.h"
#import "FirstFrameOfTheVideo.h"

@implementation FirstTeacherLectureHallCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.bottomView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
//    self.bottomView.layer.shadowColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
//    self.bottomView.layer.shadowOffset = CGSizeMake(0,2);
//    self.bottomView.layer.shadowOpacity = 1;
//    self.bottomView.layer.shadowRadius = 2;
    self.bottomView.layer.cornerRadius = 4;
    self.bottomView.layer.masksToBounds = YES;
    self.playImageView.alpha = 0.8;
}
- (void)reloadData:(TeacherLectureHallModel*)model{
    self.nameLabel.text = model.auth;
    self.playNumLabel.text = [NSString stringWithFormat:@"播放量:%d",model.count];
    self.titleLabel.text = model.title;
    NSString *http;
    if ([model.faceUrl containsString:@"http"]) {
        http = @"";
        
    }else{
        http = [NSString stringWithFormat:@"%@",VideoHost];
//        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    [self.firstVideoImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,model.faceUrl]]];
//    self.firstVideoImageView.image = [FirstFrameOfTheVideo firstFrameWithVideoURL:Url size:self.firstVideoImageView.bounds.size];

}
@end
