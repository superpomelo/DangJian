//
//  FourthLaborCenterHomeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FourthLaborCenterHomeTableViewCell;
@protocol FourthLaborCenterHomeTableViewCellDelegate <NSObject>
/**点击视频*/
- (void)FourthLaborCenterHomeTableViewCellCollectionViewActiondelegate:(FourthLaborCenterHomeTableViewCell*)cell index:(NSIndexPath*)indexPath;


@end
@interface FourthLaborCenterHomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,weak) id<FourthLaborCenterHomeTableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
