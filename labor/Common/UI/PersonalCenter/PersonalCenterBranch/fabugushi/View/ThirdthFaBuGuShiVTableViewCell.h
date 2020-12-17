//
//  ThirdthFaBuGuShiVTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ThirdthFaBuGuShiVTableViewCell;
@protocol ThirdthFaBuGuShiVTableViewCellDelegate <NSObject>
- (void)ThirdthFaBuGuShiVTableViewCellButtonActiondelegate:(ThirdthFaBuGuShiVTableViewCell*)cell;

@end
@interface ThirdthFaBuGuShiVTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (nonatomic,weak) id<ThirdthFaBuGuShiVTableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
