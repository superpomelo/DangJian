//
//  quanziModel.h
//  labor
//
//  Created by 狍子 on 2020/9/23.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface quanziModel : NSObject
@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *suprealName;

@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int myzoneId;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) id myzone;

@end

NS_ASSUME_NONNULL_END
