//
//  SecondZhuTiHuoDongDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SecondZhuTiHuoDongDetailsTableViewCell.h"
#import "MyTimeInterval.h"

@implementation SecondZhuTiHuoDongDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.time1BottomView.layer.cornerRadius = 2;
    self.time2BottomView.layer.borderWidth = 0.5;
    self.time2BottomView.layer.borderColor = [UIColor colorWithRed:212/255.0 green:55/255.0 blue:55/255.0 alpha:1].CGColor;
    self.time2BottomView.layer.cornerRadius = 2;
    
    self.pleaceBottomView1.layer.cornerRadius = 2;
    self.pleaceBottomView2.layer.borderWidth = 0.5;
    self.pleaceBottomView2.layer.borderColor = [UIColor colorWithRed:248/255.0 green:155/255.0 blue:73/255.0 alpha:1].CGColor;
    self.pleaceBottomView2.layer.cornerRadius = 2;
    
    self.biaoqianBottomView.layer.borderColor = [UIColor colorWithRed:212/255.0 green:55/255.0 blue:55/255.0 alpha:1.0].CGColor;
    self.biaoqianBottomView.layer.borderWidth = 0.5;
    self.biaoqianBottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.biaoqianBottomView.layer.cornerRadius = 2;
    
    self.jiezhiriqi1BottomView.layer.cornerRadius = 2;

    self.jiezhiriqiBottomView.layer.borderColor = [UIColor colorWithRed:69/255.0 green:113/255.0 blue:216/255.0 alpha:1.0].CGColor;
    self.jiezhiriqiBottomView.layer.borderWidth = 0.5;
//    self.jiezhiriqiBottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.jiezhiriqiBottomView.layer.cornerRadius = 2;
    
}
- (void)reloadData:(ZhuTiHuoDongModel*)model{
    NSInteger s = model.categoryName.length;
//    NSLog(@"%d",s);
    NSMutableString *sm = [NSMutableString string];
    for (int i=0; i<s; i++) {
        [sm appendString:@"   "];
    }
//    NSAttributedString *abt = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",sm,model.title]];
    self.titleLabel.attributedText = [UILabel getABTbody:[NSString stringWithFormat:@"  %@%@",sm,model.title] font:19 color:SL_UIColorFromHex(333333, 1) zitistyle:@"SourceHanSerifCN-Bold"];
//    self.titleLabel.attributedText = abt;
    self.lookNumberLabel.text = [NSString stringWithFormat:@"%@",model.realName];
    self.baoMingLabel.text = [NSString stringWithFormat:@" 浏览量:%d",model.visitorsNum];
    self.placeLabel.text = [NSString stringWithFormat:@"%@-%@",[MyTimeInterval IntervalStringToIneedDateString:model.startTime type:@"YYYY.MM.dd HH:mm"],[MyTimeInterval IntervalStringToIneedDateString:model.endTime type:@"HH:mm"]];
    self.timeLabel.text = model.activityAddress;
        NSAttributedString *abtact = [[NSAttributedString alloc]initWithString:model.introduction];
    self.activeDetailLabel.attributedText = abtact;
    self.baomingrenshuLabel.text = [NSString stringWithFormat:@" %d人已报名",model.signUpNum];
    self.leixingLabel.text = model.categoryName;
    self.jiezhiriqiLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:model.endTime type:@"YYYY.MM.dd HH:mm"]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
