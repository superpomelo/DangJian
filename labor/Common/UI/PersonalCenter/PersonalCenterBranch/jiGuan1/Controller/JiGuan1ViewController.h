//
//  JiGuan1ViewController.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^JiGuan1resultBlock)(NSString*);

@interface JiGuan1ViewController : UIViewController
@property (nonatomic, copy)JiGuan1resultBlock resultBlock;

@end

NS_ASSUME_NONNULL_END
