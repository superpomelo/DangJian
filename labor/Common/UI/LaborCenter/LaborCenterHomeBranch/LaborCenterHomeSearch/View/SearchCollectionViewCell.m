//
//  SearchCollectionViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SearchCollectionViewCell.h"

@implementation SearchCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = 2;
    self.layer.borderColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1].CGColor;
}

@end
