//
//  FirstPublishTaskCollectionViewCell.h
//  labor
//
//  Created by 狍子 on 2020/10/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  班级

#import <UIKit/UIKit.h>
#import "PublishTaskClassModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstPublishTaskCollectionViewCell : UICollectionViewCell
- (void)initUI;
- (void)reloadData:(PublishTaskClassModel*)model selArray:(NSMutableArray*)selArray;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *titleBottomView;

@end

NS_ASSUME_NONNULL_END
