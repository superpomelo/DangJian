//
//  CollectionKeChengModel.h
//  labor
//
//  Created by 狍子 on 2020/9/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionKeChengModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *faceUrl;
@property (nonatomic, copy) NSString *auth;

@property (nonatomic, assign) int courseId;
@property (nonatomic, copy) NSString *createTime;


@property (nonatomic, assign) int idx;
@end

NS_ASSUME_NONNULL_END
