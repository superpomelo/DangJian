//
//  SevenMyCircleCenterDetails1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SevenMyCircleCenterDetails1TableViewCell.h"
#import "FirstFrameOfTheVideo.h"

@implementation SevenMyCircleCenterDetails1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.myImageView.layer.cornerRadius = 5;
    self.bottomView.layer.cornerRadius = 5;

    self.toumingView.layer.cornerRadius = 5;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyCircleCenterHomeModel*)model{
    NSString *http;
    if ([model.cover containsString:@"http"]) {
        http = @"";
        
    }else{
        http = [NSString stringWithFormat:@"%@",VideoHost];
//        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    self.myImageView.image = [FirstFrameOfTheVideo firstFrameWithVideoURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,model.cover]] size:self.myImageView.bounds.size];
}
@end
