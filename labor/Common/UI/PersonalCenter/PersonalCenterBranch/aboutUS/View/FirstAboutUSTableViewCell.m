//
//  FirstAboutUSTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstAboutUSTableViewCell.h"

@implementation FirstAboutUSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.myImageView.layer.cornerRadius = 10;
    // 当前app的信息

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];

//     CFShow(infoDictionary);

    // app名称

//    NSString *appName = [infoDictionary objectForKey:@"CFBundleDisplayName"];

    // app版本

    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];

    self.banbenhaoLabel.text = appVersion;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
