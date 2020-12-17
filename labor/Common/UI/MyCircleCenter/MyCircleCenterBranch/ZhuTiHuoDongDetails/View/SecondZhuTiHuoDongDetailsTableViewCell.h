//
//  SecondZhuTiHuoDongDetailsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhuTiHuoDongModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondZhuTiHuoDongDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *time1BottomView;
@property (weak, nonatomic) IBOutlet UIView *pleaceBottomView1;
@property (weak, nonatomic) IBOutlet UIView *time2BottomView;
@property (weak, nonatomic) IBOutlet UIView *pleaceBottomView2;
- (void)reloadData:(ZhuTiHuoDongModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**报名数*/
@property (weak, nonatomic) IBOutlet UILabel *lookNumberLabel;
/**外语外贸党委*/
@property (weak, nonatomic) IBOutlet UILabel *baoMingLabel;
/**地点*/
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/**时间*/
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
/**活动详情*/
@property (weak, nonatomic) IBOutlet UILabel *activeDetailLabel;
/**党课教育*/
@property (weak, nonatomic) IBOutlet UIView *biaoqianBottomView;
/**截止日期第1部分view*/
@property (weak, nonatomic) IBOutlet UIView *jiezhiriqi1BottomView;
/**截止日期第2部分view*/
@property (weak, nonatomic) IBOutlet UIView *jiezhiriqiBottomView;
/**截止日期第2部分*/
@property (weak, nonatomic) IBOutlet UILabel *jiezhiriqiLabel;
/**报名人数*/
@property (weak, nonatomic) IBOutlet UILabel *baomingrenshuLabel;
/**标签*/
@property (weak, nonatomic) IBOutlet UILabel *leixingLabel;

@end

NS_ASSUME_NONNULL_END
