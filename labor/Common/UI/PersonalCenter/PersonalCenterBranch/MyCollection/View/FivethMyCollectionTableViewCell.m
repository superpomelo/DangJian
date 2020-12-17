//
//  FivethMyCollectionTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FivethMyCollectionTableViewCell.h"

@implementation FivethMyCollectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.myImageView.layer.cornerRadius = 5;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadData:(CollectionquanziModel*)model{
    self.timeLabel.text = model.createTime;
    self.bodyLabel.text = model.content;
    NSString *http;
    if ([model.cover containsString:@"http"]) {
        http = @"";
        
    }else{
        http = [NSString stringWithFormat:@"%@",VideoHost];
//        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,model.cover]]];
}

@end
