//
//  GetCommentVoListModel.h
//  labor
//
//  Created by 狍子 on 2020/9/14.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  评论列表model

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetCommentVoListModel : NSObject
@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, assign) int idx;
@property (nonatomic, copy) NSString *informationId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) int type;


@end

NS_ASSUME_NONNULL_END
