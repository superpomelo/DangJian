//
//  ThirdMyClassTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublishTaskClassStudentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThirdMyClassTableViewCell : UITableViewCell
/**排序*/
@property (weak, nonatomic) IBOutlet UILabel *paiXuLabel;
/**名字*/
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/**分数*/
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;

-(void)reloadData:(PublishTaskClassStudentModel*)model xuhao:(NSInteger)xuhao;
@end

NS_ASSUME_NONNULL_END
