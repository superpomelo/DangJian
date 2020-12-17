//
//  XueLiXuanZeViewController.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^XueLiXuanZeresultBlock)(NSString*);

@interface XueLiXuanZeViewController : UIViewController
@property (nonatomic, copy)XueLiXuanZeresultBlock resultBlock;

@end

NS_ASSUME_NONNULL_END
