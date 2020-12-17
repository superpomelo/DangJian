//
//  SecondNewCirclesTextAndVideoTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/17.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondNewCirclesTextAndVideoTableViewCell.h"
#import "FirstFrameOfTheVideo.h"

@implementation SecondNewCirclesTextAndVideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.playBottomView.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadDataImg:(UIImage*)img{
    self.picImageView.image = img;
}
- (void)reloadDatavideo:(NSURL*)video{
    self.picImageView.image = [FirstFrameOfTheVideo firstFrameWithVideoURL:video size:self.picImageView.bounds.size];

}

- (IBAction)playButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(SecondNewCirclesTextAndVideoTableViewCellActiondelegate:)]) {
        [self.delegate SecondNewCirclesTextAndVideoTableViewCellActiondelegate:self];
    }
}
@end
