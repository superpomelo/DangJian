//
//  SecondPersonalMyCircleTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondPersonalMyCircleTableViewCell.h"

@implementation SecondPersonalMyCircleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.myImageView.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(PersonalMyCircleModel*)model{
    if (model.content == nil) {
        self.bodyLabel.text = @"无内容";

    }else{
        self.bodyLabel.text = model.content;

    }
    if ([model.cover containsString:@","]) {
        //多张图片
        NSArray *ary = [model.cover componentsSeparatedByString:@","];

        NSURL *Url;
        if ([model.cover containsString:@"http"]) {
            Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",ary[0]]];
            
        }else{
            Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,ary[0]]];

        }
        [self.myImageView sd_setImageWithURL:Url];
    }else{
        NSURL *Url;
        if ([model.cover containsString:@"http"]) {
            Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.cover]];
            
        }else{
            Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

        }
        [self.myImageView sd_setImageWithURL:Url];
    }
}
@end
