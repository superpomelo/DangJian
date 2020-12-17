//
//  SecondChangJianWenTiTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangjianWenTiModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondChangJianWenTiTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
- (void)reloadData:(ChangjianWenTiModel*)model number:(NSInteger)number;

@end

NS_ASSUME_NONNULL_END
