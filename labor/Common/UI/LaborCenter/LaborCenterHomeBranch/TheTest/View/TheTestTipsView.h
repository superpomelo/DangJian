//
//  TheTestTipsView.h
//  labor
//
//  Created by 狍子 on 2020/9/1.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TheTestTipsView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)reloadData:(NSString*)str;
@end

NS_ASSUME_NONNULL_END
