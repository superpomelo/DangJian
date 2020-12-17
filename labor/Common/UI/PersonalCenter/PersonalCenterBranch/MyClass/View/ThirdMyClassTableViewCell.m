//
//  ThirdMyClassTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdMyClassTableViewCell.h"

@implementation ThirdMyClassTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)reloadData:(PublishTaskClassStudentModel*)model xuhao:(NSInteger)xuhao{
    self.paiXuLabel.text = [NSString stringWithFormat:@"%ld",(long)xuhao];
    self.nameLabel.text = model.realName;
    self.pointLabel.text = [NSString stringWithFormat:@"%d",model.numerical];
}

@end
