//
//  FirstMyClassTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstMyClassTableViewCell;
@protocol FirstMyClassTableViewCellDelegate <NSObject>

- (void)FirstMyClassTableViewCellCollectionViewActiondelegate:(FirstMyClassTableViewCell*)cell  CollectionViewindexPath:(NSIndexPath*)indexPath;

@end
@interface FirstMyClassTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UIView *jianbianBottomView;

- (void)reloadData;
@property (nonatomic,copy)NSMutableArray *array;
@property (nonatomic,strong)NSIndexPath *indexpathT;
@property (nonatomic,weak) id<FirstMyClassTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
