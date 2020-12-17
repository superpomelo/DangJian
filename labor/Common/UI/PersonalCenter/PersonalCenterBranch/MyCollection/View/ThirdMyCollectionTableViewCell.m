//
//  ThirdMyCollectionTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdMyCollectionTableViewCell.h"

@implementation ThirdMyCollectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.mImageView.layer.cornerRadius = 5;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(CollectionXinWenModel*)model{
    if ([model.createTime containsString:@" "]) {
        NSArray *array = [model.createTime componentsSeparatedByString:@" "];
        self.fromAndTimeLabel.text = [NSString stringWithFormat:@"%@",array[0]];
    }else{
        self.fromAndTimeLabel.text = [NSString stringWithFormat:@"%@",model.createTime];
    }
    self.bodyLabel.text = model.title;

    NSString *http;
    if ([model.thumbnail containsString:@"http"]) {
        http = @"";
        
    }else{
        http = [NSString stringWithFormat:@"%@",VideoHost];
//        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    [self.mImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,model.thumbnail]]];
}

@end
