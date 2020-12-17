//
//  DangYuanGuShiFangModel.h
//  labor
//
//  Created by 狍子 on 2020/11/18.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DangYuanGuShiFangModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *realName;

@property (nonatomic, assign) int idx;
@end

NS_ASSUME_NONNULL_END
