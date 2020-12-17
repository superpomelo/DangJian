//
//  FiveMyCircleCenterHomeTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FiveMyCircleCenterHomeTableViewCell.h"
#import "MyTimeInterval.h"

@implementation FiveMyCircleCenterHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
        self.headImageView.layer.cornerRadius = 40/2;
    self.myImageView.layer.cornerRadius = 5;
    
    self.playButtonImageView.alpha = 0.8;
    self.myimgBottomView.layer.cornerRadius = 4;
    self.myimgBottomView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/**收藏*/
- (IBAction)shoucangButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    /**Tag 1收藏，2评论，3转发，4点赞*/
    if ([self.delegate respondsToSelector:@selector(FiveMyCircleCenterHomeTableViewCellButtonActiondelegate:indexpath:Tag:)]) {
        [self.delegate FiveMyCircleCenterHomeTableViewCellButtonActiondelegate:self indexpath:self.indexPath Tag:1];
    }
}
/**评论*/
- (IBAction)pinlunButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
      /**Tag 1收藏，2评论，3转发，4点赞*/
    if ([self.delegate respondsToSelector:@selector(FiveMyCircleCenterHomeTableViewCellButtonActiondelegate:indexpath:Tag:)]) {
        [self.delegate FiveMyCircleCenterHomeTableViewCellButtonActiondelegate:self indexpath:self.indexPath Tag:2];
    }
}
/**转发*/
- (IBAction)zhuanfaButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
      /**Tag 1收藏，2评论，3转发，4点赞*/
    if ([self.delegate respondsToSelector:@selector(FiveMyCircleCenterHomeTableViewCellButtonActiondelegate:indexpath:Tag:)]) {
        [self.delegate FiveMyCircleCenterHomeTableViewCellButtonActiondelegate:self indexpath:self.indexPath Tag:3];
    }
}
/**点赞*/
- (IBAction)dianzanButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
      /**Tag 1收藏，2评论，3转发，4点赞*/
    if ([self.delegate respondsToSelector:@selector(FiveMyCircleCenterHomeTableViewCellButtonActiondelegate:indexpath:Tag:)]) {
        [self.delegate FiveMyCircleCenterHomeTableViewCellButtonActiondelegate:self indexpath:self.indexPath Tag:4];
    }
}

- (void)reloadData:(MyCircleCenterHomeModel*)model{
    NSString *http;
    if ([model.titlepage containsString:@"http"]) {
        http = @"";
        
    }else{
        http = [NSString stringWithFormat:@"%@",VideoHost];
//        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,model.titlepage]]];
//    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://47.111.139.74:8089/group1/M00/00/06/L2-LSl-ObDeAJ1A5AAB9DNZAhoU865.png"]]];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.nameLabel.text = model.username;
    self.schoolLabel.text = model.school;
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:model.createTime type:@"YYYY.MM.dd HH:mm"]];
    if (model.content != nil) {
        NSString *labelText = model.content;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(0.0),NSFontAttributeName: [UIFont systemFontOfSize:16]}];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:5];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

        
        NSAttributedString *abt = attributedString;
        self.bodyLabel.attributedText = abt;

    }else{
        //无内容
        NSMutableAttributedString *abt = [[NSMutableAttributedString alloc]initWithString: @"无内容"];
        self.bodyLabel.attributedText = abt;

    }
    /**imgorvid   0视频 1-图片 2文本*/
    if (model.imgorvid == 0 ) {
        

    }else if (model.imgorvid == 1){
        if ([model.cover containsString:@","]) {
            //多张图片
            NSArray *ary = [model.cover componentsSeparatedByString:@","];

            NSURL *Url;
            if ([model.cover containsString:@"http"]) {
                Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",ary[0]]];
                
            }else{
                Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,ary[0]]];

            }
            [self.myImageView sd_setImageWithURL:Url];
        }else{
            NSURL *Url;
            if ([model.cover containsString:@"http"]) {
                Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.cover]];
                
            }else{
                Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

            }
            [self.myImageView sd_setImageWithURL:Url];
        }
        
    }else if (model.imgorvid == 2){
     
    }
    
    //收藏状态
    if ([model.collectstatus boolValue]== NO) {
        self.shoucangImageView.image = [UIImage imageNamed:@"ic_ldq_collection"];
        self.shoucangLabel.text = @"收藏";
        self.shoucangLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    }else if ([model.collectstatus boolValue] == YES){
        self.shoucangImageView.image = [UIImage imageNamed:@"ic_ldq_collection1"];
        self.shoucangLabel.text = @"已收藏";
        self.shoucangLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    }
    //点赞状态
    if ([model.upstatus boolValue] == NO) {
        self.dianzanImageView.image = [UIImage imageNamed:@"ic_ldq_zan"];
        self.dianzanLabel.text = @"点赞";
        self.dianzanLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    }else if ([model.upstatus boolValue] == YES) {
        self.dianzanImageView.image = [UIImage imageNamed:@"ic_ldq_zan1"];
        self.dianzanLabel.text = @"已点赞";
        self.dianzanLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    }
}
@end
