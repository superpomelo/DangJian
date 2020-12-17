//
//  MingZuXuanZeViewController.h
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^MingZuXuanZeresultBlock)(NSString*,NSString*);
@interface MingZuXuanZeViewController : UIViewController
@property (nonatomic, copy)MingZuXuanZeresultBlock resultBlock;

@end

NS_ASSUME_NONNULL_END
