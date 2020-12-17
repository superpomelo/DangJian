//
//  SectionHeaderMyCircleCenterHomeView.h
//  labor
//
//  Created by 狍子 on 2020/9/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SectionHeaderMyCircleCenterHomeView;
@protocol SectionHeaderMyCircleCenterHomeViewDelegate <NSObject>
/**全部/校园圈/视频*/
- (void)SectionHeaderMyCircleCenterHomeViewButtonActiondelegate:(SectionHeaderMyCircleCenterHomeView*)cell tag:(int)tag;

@end
@interface SectionHeaderMyCircleCenterHomeView : UIView
/**全部*/
@property (weak, nonatomic) IBOutlet UIButton *allButton;
/**校园圈*/
@property (weak, nonatomic) IBOutlet UIButton *schoolButton;
/**视频*/
@property (weak, nonatomic) IBOutlet UIButton *videoButton;
@property (nonatomic,weak) id<SectionHeaderMyCircleCenterHomeViewDelegate>delegate;
/**联动*/
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@end

NS_ASSUME_NONNULL_END
