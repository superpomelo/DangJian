//
//  FirstChangJianWenTiTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangjianWenTiModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstChangJianWenTiTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
- (void)reloadData:(ChangjianWenTiModel*)model;

@end

NS_ASSUME_NONNULL_END
