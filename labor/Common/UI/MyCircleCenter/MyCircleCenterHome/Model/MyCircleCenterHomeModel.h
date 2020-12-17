//
//  MyCircleCenterHomeModel.h
//  labor
//
//  Created by 狍子 on 2020/9/15.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCircleCenterHomeModel : NSObject
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *school;

@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) int count;
@property (nonatomic, copy) id collectstatus;
@property (nonatomic, copy) id upstatus;
@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, assign) int delFlag;

@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int tenantId;

@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString *updateTime;
@property (nonatomic, copy) NSString *titlepage;

@property (nonatomic, assign) int userId;

@property (nonatomic, assign) int imgorvid;
@end

NS_ASSUME_NONNULL_END
