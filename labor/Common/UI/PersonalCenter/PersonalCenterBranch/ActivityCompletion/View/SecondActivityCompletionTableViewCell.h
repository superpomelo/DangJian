//
//  SecondActivityCompletionTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondActivityCompletionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
/**查看*/
@property (weak, nonatomic) IBOutlet UIButton *lookButton;

@end

NS_ASSUME_NONNULL_END
