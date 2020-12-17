//
//  FourthLearningCenterDetails1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FourthLearningCenterDetails1TableViewCell.h"
#import "FirstFrameOfTheVideo.h"

@implementation FourthLearningCenterDetails1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.coverBottomView.hidden = YES;
    self.BottomView.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)playButtonAction:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(FourthLearningCenterDetails1TableViewCellButtonActiondelegate:button:)]) {
        [self.delegate FourthLearningCenterDetails1TableViewCellButtonActiondelegate:self button:sender];
        self.coverBottomView.hidden = YES;

    }
    
}

- (void)reloadData:(LearningCenterDetailsModel*)model{
    self.myImageView.image =  [FirstFrameOfTheVideo firstFrameWithVideoURL:[NSURL URLWithString:model.body] size:self.myImageView.bounds.size];
}


@end
