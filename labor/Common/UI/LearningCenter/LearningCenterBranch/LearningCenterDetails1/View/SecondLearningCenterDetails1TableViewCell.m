//
//  SecondLearningCenterDetails1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondLearningCenterDetails1TableViewCell.h"
#import "UIImage+ImgSize.h"

@implementation SecondLearningCenterDetails1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(LearningCenterDetailsModel*)model{
    NSURL *Url;
    if ([model.body containsString:@"http"]) {
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.body]];

    }else{
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.body]];

    }

    [self.myImageView sd_setImageWithURL:Url placeholderImage:[UIImage imageNamed:@"huise"]];
//    [self.myImageView sd_setImageWithURL:Url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//            CGSize size = [UIImage getImageSizeWithURL:imageURL];
//            NSLog(@"宽：%f, 高：%f", size.width, size.height);
//        //    [self.myImageView sd_setImageWithURL:Url];
//            int h =  (SCR_W-30)*size.height/size.width;
//            //图片自适应高度
//            [self.myImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.equalTo(self.bottomView.mas_right).offset(15);
//                make.right.equalTo(self.bottomView.mas_left).offset(-15);
//                make.size.mas_equalTo(CGSizeMake(SCR_W-30, h));
//
//            }];
//            [self.myImageView sd_setImageWithURL:imageURL];
//    }];
//    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:model.body]];
}
@end
