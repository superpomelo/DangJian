//
//  ThirdLearningCenterDetails2TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ThirdLearningCenterDetails2TableViewCell;
@protocol ThirdLearningCenterDetails2TableViewCellDelegate <NSObject>

- (void)ThirdLearningCenterDetails2TableViewCellCollectionViewActiondelegate:(ThirdLearningCenterDetails2TableViewCell*)cell  CollectionViewindexPath:(NSIndexPath*)indexPath;

@end
@interface ThirdLearningCenterDetails2TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
- (void)reloadData;
@property (nonatomic,copy)NSMutableArray *array;
@property (nonatomic,weak) id<ThirdLearningCenterDetails2TableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
