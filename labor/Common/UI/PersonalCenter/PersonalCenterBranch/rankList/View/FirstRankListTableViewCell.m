//
//  FirstRankListTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstRankListTableViewCell.h"

@implementation FirstRankListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.rankList1ImageView.layer.cornerRadius = 75/2;
    self.rankList1View.layer.cornerRadius = 15/2;
    self.rankList1NameBottomView.layer.cornerRadius = 15/2;
    self.rankList1ImageView.layer.borderWidth = 1;
    self.rankList1ImageView.layer.borderColor = [UIColor colorWithRed:33/255.0 green:143/255.0 blue:108/255.0 alpha:1].CGColor;

    self.rankList2ImageView.layer.cornerRadius = 75/2;
    self.rankList2View.layer.cornerRadius = 15/2;
    self.rankList2NameBottomView.layer.cornerRadius = 15/2;
    self.rankList2ImageView.layer.borderWidth = 1;
    self.rankList2ImageView.layer.borderColor = [UIColor colorWithRed:33/255.0 green:143/255.0 blue:108/255.0 alpha:1].CGColor;
    
    self.rankList3ImageView.layer.cornerRadius = 75/2;
    self.rankList3View.layer.cornerRadius = 15/2;
    self.rankList3NameBottomView.layer.cornerRadius = 15/2;
    self.rankList3ImageView.layer.borderWidth = 1;
    self.rankList3ImageView.layer.borderColor = [UIColor colorWithRed:33/255.0 green:143/255.0 blue:108/255.0 alpha:1].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(NSArray*)array{
    if (array.count>0) {
        RankListModel *model = array[0];
        [self.rankList1ImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
        self.ranklist1Label.text = [NSString stringWithFormat:@"%d",model.numerical];
        self.ranklistname1Label.text = model.realName;
        if (array.count>1) {
            RankListModel *model1 = array[1];
            [self.rankList2ImageView sd_setImageWithURL:[NSURL URLWithString:model1.avatar]];
            self.ranklist2Label.text = [NSString stringWithFormat:@"%d",model1.numerical];
            self.ranklistname2Label.text = model1.realName;
        }
        if (array.count>2) {
            RankListModel *model2 = array[2];
            [self.rankList3ImageView sd_setImageWithURL:[NSURL URLWithString:model2.avatar]];
            self.ranklist3Label.text = [NSString stringWithFormat:@"%d",model2.numerical];
            self.ranklistname3Label.text = model2.realName;
        }
    }
}

@end
