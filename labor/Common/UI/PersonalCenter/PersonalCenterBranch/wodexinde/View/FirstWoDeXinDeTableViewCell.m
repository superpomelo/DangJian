//
//  FirstWoDeXinDeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstWoDeXinDeTableViewCell.h"
#import "WodexindeListModel.h"

@implementation FirstWoDeXinDeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(WodexindeListModel*)model{
    self.bodyLabel.text = model.body;
    self.titleLabel.text = model.title;
}
@end
