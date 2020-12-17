//
//  FirstMyClassCollectionViewCell.m
//  labor
//
//  Created by 狍子 on 2020/10/14.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstMyClassCollectionViewCell.h"

@implementation FirstMyClassCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.bottomView.alpha = 0.3;
    self.bottomView.layer.cornerRadius = 4;
}
- (void)reloadData:(NSString*)str{
    NSMutableAttributedString *abt = [[NSMutableAttributedString alloc]initWithString:str];
    self.classNameLabel.attributedText = abt;
//    NSArray *array = model.count;
//    self.xuehaoLabel.text = [NSString stringWithFormat:@"%lu人",(unsigned long)array.count];
}
@end
