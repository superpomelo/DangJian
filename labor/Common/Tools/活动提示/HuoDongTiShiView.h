//
//  HuoDongTiShiView.h
//  labor
//
//  Created by 狍子 on 2020/12/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HuoDongTiShiViewDelegate <NSObject>
- (void)iKnowButtClick;
@end

@interface HuoDongTiShiView : UIView
@property (weak, nonatomic) IBOutlet UILabel *myTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (nonatomic, weak) id<HuoDongTiShiViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
