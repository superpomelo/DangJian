//
//  FirstChooseQuestionCollectionViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/9.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstChooseQuestionCollectionViewCell.h"

@implementation FirstChooseQuestionCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    self.bottomView.layer.borderWidth = 0.5;
    self.bottomView.layer.borderColor = [UIColor colorWithRed:198/255.0 green:198/255.0 blue:198/255.0 alpha:1].CGColor;
    self.bottomView.layer.cornerRadius = (SCR_W-90)/7/2;
}

@end
