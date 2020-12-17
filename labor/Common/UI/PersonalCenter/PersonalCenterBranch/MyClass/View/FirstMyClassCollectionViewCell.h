//
//  FirstMyClassCollectionViewCell.h
//  labor
//
//  Created by 狍子 on 2020/10/14.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublishTaskClassModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyClassCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *xuehaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *renshuLabel;
- (void)reloadData:(NSString*)str;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

NS_ASSUME_NONNULL_END
