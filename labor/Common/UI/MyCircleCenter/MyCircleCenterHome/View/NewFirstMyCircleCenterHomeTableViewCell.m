//
//  NewFirstMyCircleCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/18.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "NewFirstMyCircleCenterHomeTableViewCell.h"
#import "MyTimeInterval.h"

@implementation NewFirstMyCircleCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(DangYuanGuShiFangModel*)model{
    self.rightLabel.text = [MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY-MM-dd"];
    NSString *labelText = model.title;

//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSFontAttributeName: [UIFont fontWithName:@"SourceHanSerifCN-Bold" size: 18],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

    
    NSAttributedString *abt = attributedString;
    self.titleLabel.attributedText = abt;
    //来源
    self.timeLabel.text = model.realName;
    if ([model.cover containsString:@","]) {
        NSArray *arys = [model.cover componentsSeparatedByString:@","];
        if (arys.count>0) {
            [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:arys[0]]];

        }
    }else{
        [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    }

}
@end
