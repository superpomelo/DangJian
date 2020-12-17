//
//  SecondTheTestTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondTheTestTableViewCell.h"

@implementation SecondTheTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(NSDictionary*)dic{
    NSMutableAttributedString *abs = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@  %@",dic.allKeys[0],dic.allValues[0]]];
    self.leftLabel.attributedText = abs;
}
@end
