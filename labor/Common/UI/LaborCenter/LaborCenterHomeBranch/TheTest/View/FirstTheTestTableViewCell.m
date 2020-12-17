//
//  FirstTheTestTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstTheTestTableViewCell.h"

@implementation FirstTheTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.questionTypeBottomView.layer.borderWidth = 0.5;
    self.questionTypeBottomView.layer.cornerRadius = 2;
    self.questionTypeBottomView.layer.borderColor = kGreenColor.CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(TheTestModel*)model num:(NSString*)num total:(NSString*)total{
    NSMutableAttributedString *abs = [[NSMutableAttributedString alloc]initWithString:model.stem];
    self.titleLabel.attributedText = abs;
    
    self.numLabel.text = [NSString stringWithFormat:@"%@",num];
    self.totalLabel.text = [NSString stringWithFormat:@"/%@",total];
    if (model.typeId == 0) {
        self.questionTypeLabel.text = @"单选题";
    }else if (model.typeId == 1) {
        self.questionTypeLabel.text = @"多选题";
    }

}

@end
