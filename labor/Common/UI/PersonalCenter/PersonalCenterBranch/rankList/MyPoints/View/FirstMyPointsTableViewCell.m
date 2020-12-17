//
//  FirstMyPointsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyPointsTableViewCell.h"

@implementation FirstMyPointsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.beijingimageview.alpha = 0.1;
    
    CAGradientLayer *gl1 = [CAGradientLayer layer];
    gl1.frame = CGRectMake(0,0,SCR_W,self.topBottom2View.bounds.size.height);
    gl1.startPoint = CGPointMake(0, 0);
    gl1.endPoint = CGPointMake(1, 1);
    gl1.colors = @[(__bridge id)[UIColor colorWithRed:46/255.0 green:179/255.0 blue:144/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:60/255.0 green:196/255.0 blue:147/255.0 alpha:1.0].CGColor];
    gl1.locations = @[@(0.0),@(1.0)];

    [self.topBottom2View.layer addSublayer:gl1];
//    [self sendSubviewToBack:self.topBottomView];
}
- (void)reloadUI{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
