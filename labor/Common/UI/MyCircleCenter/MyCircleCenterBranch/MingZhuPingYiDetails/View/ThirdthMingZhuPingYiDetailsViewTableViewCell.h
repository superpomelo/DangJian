//
//  ThirdthMingZhuPingYiDetailsViewTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VotingQuestionVosModel.h"

NS_ASSUME_NONNULL_BEGIN
@class ThirdthMingZhuPingYiDetailsViewTableViewCell;
@protocol ThirdthMingZhuPingYiDetailsViewTableViewCellDelegate <NSObject>
/**党员详情*/
- (void)ThirdthMingZhuPingYiDetailsViewTableViewCellCollectionViewActiondelegate:(ThirdthMingZhuPingYiDetailsViewTableViewCell*)cell index:(NSIndexPath*)indexPath;


@end
@interface ThirdthMingZhuPingYiDetailsViewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,weak) id<ThirdthMingZhuPingYiDetailsViewTableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
