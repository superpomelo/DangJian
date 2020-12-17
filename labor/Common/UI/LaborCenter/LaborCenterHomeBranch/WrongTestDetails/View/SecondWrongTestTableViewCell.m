//
//  SecondWrongTestTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/2.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondWrongTestTableViewCell.h"

@implementation SecondWrongTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.rightOrWrongBottomView.layer.cornerRadius = self.rightOrWrongBottomView.bounds.size.height/2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(NSDictionary*)dic model:(TheTestModel*)model{
    NSMutableAttributedString *abs = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@  %@",dic.allKeys[0],dic.allValues[0]]];
    self.leftLabel.attributedText = abs;
    /**状态（0：未答，1：答对，2：答错）*/
    if (model.status == 0) {
//        self.rightOrWrongBottomView.backgroundColor = [UIColor colorWithRed:237/255.0 green:66/255.0 blue:66/255.0 alpha:1];
//        [self.rightOrWrongBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.bottomView.mas_right).offset(15);
//            make.size.mas_equalTo(CGSizeMake(0, 0));
//
//        }];
    }else if (model.status == 1){
//        self.rightOrWrongBottomView.backgroundColor = [UIColor colorWithRed:80/255.0 green:219/255.0 blue:142/255.0 alpha:1];
//        self.rightOrWrongImageView.image = [UIImage imageNamed:@"dui-2"];
//        [self.rightOrWrongBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.bottomView.mas_right).offset(15);
//            make.size.mas_equalTo(CGSizeMake(15, 15));
//
//        }];
    }else if (model.status == 2){
//        self.rightOrWrongBottomView.backgroundColor = [UIColor colorWithRed:237/255.0 green:66/255.0 blue:66/255.0 alpha:1];
//        self.rightOrWrongImageView.image = [UIImage imageNamed:@"cuo"];
//        [self.rightOrWrongBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.bottomView.mas_right).offset(15);
//            make.size.mas_equalTo(CGSizeMake(15, 15));
//
//        }];
    }

}
@end
