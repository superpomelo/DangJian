//
//  FirstLearningCenterDetails2CollectionViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/7.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstLearningCenterDetails2CollectionViewCell.h"
#import "FirstFrameOfTheVideo.h"

@implementation FirstLearningCenterDetails2CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)reloadData:(TeacherLectureHallModel*)model{
    NSURL *Url;
    if ([model.videoUrl containsString:@"http"]) {
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.videoUrl]];

    }else{
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.videoUrl]];

    }
    self.leftImageView.image = [FirstFrameOfTheVideo firstFrameWithVideoURL:Url size:self.leftImageView.bounds.size];
    self.bottomLabel.text = model.title;
}
@end
