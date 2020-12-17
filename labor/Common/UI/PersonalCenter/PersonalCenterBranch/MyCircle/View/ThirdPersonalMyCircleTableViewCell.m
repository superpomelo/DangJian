//
//  ThirdPersonalMyCircleTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdPersonalMyCircleTableViewCell.h"

@implementation ThirdPersonalMyCircleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.myImageView.layer.cornerRadius = 5;
    self.bofangImageView.alpha = 0.8;
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

    }    NSURL *Url;
    if ([model.cover containsString:@"http"]) {
        Url = [NSURL URLWithString:model.cover];
        
    }else{
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    [self.myImageView sd_setImageWithURL:Url];
}
@end
