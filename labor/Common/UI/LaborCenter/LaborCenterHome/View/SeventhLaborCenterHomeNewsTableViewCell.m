//
//  SeventhLaborCenterHomeNewsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/9.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SeventhLaborCenterHomeNewsTableViewCell.h"
#import "MyTimeInterval.h"

@implementation SeventhLaborCenterHomeNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.videoImageView.layer.cornerRadius = 3;
    self.alphaBottomView.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(LearningCenterHomeModel*)model{
    self.rightLabel.text = [MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY-MM-dd"];
    NSString *labelText = model.title;
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
//    SourceHanSerifCN-Bold
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 18],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:body attributes:@{NSFontAttributeName: [UIFont fontWithName:zitistyle size: font],NSForegroundColorAttributeName:color}];

    
    
    NSAttributedString *abt = attributedString;
    self.titleLabel.attributedText = abt;
    
//    self.titleLabel.text = model.title;
    self.timeLabel.text = model.source;
//    self.videoImageView sd_setImageWithURL:[NSURL]
//    self.videoImageView.image =  [FirstFrameOfTheVideo firstFrameWithVideoURL:[NSURL URLWithString:model.thumbnail] size:self.videoImageView.bounds.size];
    NSURL *Url;
    if ([model.thumbnail containsString:@"http"]) {
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.thumbnail]];

    }else{
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.thumbnail]];

    }
    [self.videoImageView sd_setImageWithURL:Url placeholderImage:[UIImage imageNamed:@""]];

}
@end
