//
//  ZuZhiMingChengViewController.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ZuZhiMingChengresultBlock)(NSString*);
@interface ZuZhiMingChengViewController : UIViewController
@property (nonatomic, copy)ZuZhiMingChengresultBlock resultBlock;

@end

NS_ASSUME_NONNULL_END
