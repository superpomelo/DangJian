//
//  CollectionquanziModel.h
//  labor
//
//  Created by 狍子 on 2020/9/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionquanziModel : NSObject
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *createUserName;
@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, assign) int imgorvid;

@property (nonatomic, assign) int idx;

@end

NS_ASSUME_NONNULL_END
