//
//  FirstPublishTaskCollectionViewCell.m
//  labor
//
//  Created by 狍子 on 2020/10/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  班级

#import "FirstPublishTaskCollectionViewCell.h"

@implementation FirstPublishTaskCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)initUI{
    self.titleBottomView.layer.cornerRadius = 2;
}
- (void)reloadData:(PublishTaskClassModel*)model selArray:(NSMutableArray*)selArray{
    self.nameLabel.text = model.name;
    if (selArray.count>0) {
        for (int i = 0; i<selArray.count; i++) {
            PublishTaskClassModel *model1 = selArray[i];
            if (model.classId == model1.classId) {
                self.titleBottomView.backgroundColor = kGreenColor;
                self.nameLabel.textColor = [UIColor whiteColor];
                break;
            }
            
            if (i == selArray.count-1) {
                self.titleBottomView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
                self.nameLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
            }
        }
    }else{
        self.titleBottomView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
        self.nameLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    }

}

@end
