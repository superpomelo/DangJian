//
//  ThirdShenQingShuTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ThirdShenQingShuTableViewCell;
@protocol ThirdShenQingShuTableViewCellDelegate <NSObject>
/**提交*/
- (void)ThirdShenQingShuTableViewCellActiondelegate:(ThirdShenQingShuTableViewCell*)cell;

@end
@interface ThirdShenQingShuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (nonatomic,weak) id<ThirdShenQingShuTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
