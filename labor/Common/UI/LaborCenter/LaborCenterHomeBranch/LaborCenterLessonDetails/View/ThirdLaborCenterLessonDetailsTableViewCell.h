//
//  ThirdLaborCenterLessonDetailsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/8.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ThirdLaborCenterLessonDetailsTableViewCell;
@protocol ThirdLaborCenterLessonDetailsTableViewCellDelegate <NSObject>

- (void)ThirdLaborCenterLessonDetailsTableViewCellCollectionViewActiondelegate:(ThirdLaborCenterLessonDetailsTableViewCell*)cell  CollectionViewindexPath:(NSIndexPath*)indexPath;

@end
@interface ThirdLaborCenterLessonDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
- (void)reloadData;
@property (nonatomic,copy)NSMutableArray *array;
@property (nonatomic,weak) id<ThirdLaborCenterLessonDetailsTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
