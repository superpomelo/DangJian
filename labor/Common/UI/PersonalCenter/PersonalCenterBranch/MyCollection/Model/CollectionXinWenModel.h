//
//  CollectionXinWenModel.h
//  labor
//
//  Created by 狍子 on 2020/9/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionXinWenModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *createUserName;
@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, assign) int idx;
@end

NS_ASSUME_NONNULL_END
