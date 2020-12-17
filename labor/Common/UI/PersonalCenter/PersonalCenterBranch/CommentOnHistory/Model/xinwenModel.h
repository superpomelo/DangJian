//
//  xinwenModel.h
//  labor
//
//  Created by 狍子 on 2020/9/23.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface xinwenModel : NSObject

@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int informationId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
