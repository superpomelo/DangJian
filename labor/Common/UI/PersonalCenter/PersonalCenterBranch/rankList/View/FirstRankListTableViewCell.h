//
//  FirstRankListTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstRankListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *rankList1ImageView;
@property (weak, nonatomic) IBOutlet UIView *rankList1NameBottomView;
/**排名1的底部view，小红圈*/
@property (weak, nonatomic) IBOutlet UIView *rankList1View;
@property (weak, nonatomic) IBOutlet UIImageView *rankList2ImageView;
@property (weak, nonatomic) IBOutlet UIView *rankList2NameBottomView;
@property (weak, nonatomic) IBOutlet UIView *rankList2View;
@property (weak, nonatomic) IBOutlet UIImageView *rankList3ImageView;
@property (weak, nonatomic) IBOutlet UIView *rankList3NameBottomView;
@property (weak, nonatomic) IBOutlet UIView *rankList3View;

@property (weak, nonatomic) IBOutlet UILabel *ranklist1Label;
@property (weak, nonatomic) IBOutlet UILabel *ranklist2Label;
@property (weak, nonatomic) IBOutlet UILabel *ranklist3Label;
@property (weak, nonatomic) IBOutlet UILabel *ranklistname1Label;
@property (weak, nonatomic) IBOutlet UILabel *ranklistname2Label;
@property (weak, nonatomic) IBOutlet UILabel *ranklistname3Label;

- (void)reloadData:(NSArray*)array;

@end

NS_ASSUME_NONNULL_END
