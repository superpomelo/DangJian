//
//  WoDeGuShiListModel.h
//  labor
//
//  Created by 狍子 on 2020/11/17.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WoDeGuShiListModel : NSObject
@property (nonatomic, assign) int commentFlag;

@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *idx;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *tenantId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *userId;

@end

NS_ASSUME_NONNULL_END
