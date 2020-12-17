//
//  ThirdMyCircleCenterDetails1TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdMyCircleCenterDetails1TableViewCell.h"
#import "UIImage+ImgSize.h"

@implementation ThirdMyCircleCenterDetails1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyCircleCenterHomeModel*)model{
    NSURL *Url;
    if ([model.cover containsString:@"http"]) {
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.cover]];
        
    }else{
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    CGSize size = [UIImage getImageSizeWithURL:Url];
    NSLog(@"宽：%f, 高：%f", size.width, size.height);
//    [self.myImageView sd_setImageWithURL:Url];
    int h =  (SCR_W-30)*size.height/size.width;
    //图片自适应高度
    [self.myImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView.mas_right).offset(15);
        make.right.equalTo(self.bottomView.mas_left).offset(-15);
        make.size.mas_equalTo(CGSizeMake(SCR_W-30, h));

    }];
    [self.myImageView sd_setImageWithURL:Url];
    
}
- (IBAction)buttonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ThirdMyCircleCenterDetails1TableViewCellActiondelegate:)]) {
        [self.delegate ThirdMyCircleCenterDetails1TableViewCellActiondelegate:self];
    }
}

@end
