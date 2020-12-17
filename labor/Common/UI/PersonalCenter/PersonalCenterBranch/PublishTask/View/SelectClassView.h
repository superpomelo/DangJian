//
//  SelectClassView.h
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublishTaskClassModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SelectClassView;
@protocol SelectClassViewDelegate <NSObject>
/**点击班级*/
- (void)SelectClassViewCollectionViewActiondelegate:(SelectClassView*)view selarray:(NSMutableArray*)selarrayM;


@end
@interface SelectClassView : UIView
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)NSMutableArray *selArray;
@property (nonatomic,weak) id<SelectClassViewDelegate>delegate;
- (void)initUI;
@end

NS_ASSUME_NONNULL_END
