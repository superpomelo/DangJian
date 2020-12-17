//
//  FirstLaborCenterLessonDetailsCollectionViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/8.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstLaborCenterLessonDetailsCollectionViewCell.h"
#import "FirstFrameOfTheVideo.h"

@implementation FirstLaborCenterLessonDetailsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.leftImageView.layer.cornerRadius = 2;
}
- (void)reloadData:(TeacherLectureHallModel*)model{
    NSURL *Url;
    if ([model.faceUrl containsString:@"http"]) {
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.faceUrl]];

    }else{
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.faceUrl]];

    }
    [self.leftImageView sd_setImageWithURL:Url];
    self.bottomLabel.text = model.title;
}
@end
