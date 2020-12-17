//
//  FirstWrongTestTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/2.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheTestModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstWrongTestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *questionTypeBottomView;
/**题目内容*/
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**题号*/
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
/**题目总量*/
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionTypeLabel;

- (void)reloadData:(TheTestModel*)model num:(NSString*)num total:(NSString*)total;
@end

NS_ASSUME_NONNULL_END
