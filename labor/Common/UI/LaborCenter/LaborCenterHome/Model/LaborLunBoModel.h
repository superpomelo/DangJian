//
//  LaborLunBoModel.h
//  labor
//
//  Created by 狍子 on 2020/9/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LaborLunBoModel : NSObject
@property (nonatomic, copy) NSString *body;

@property (nonatomic, assign) int classificationId;
@property (nonatomic, assign) int commentFlag;

@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *createUserName;
@property (nonatomic, assign) int delFlag;
@property (nonatomic, assign) int headlinesFlag;
@property (nonatomic, assign) int idx;
@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, assign) int lockFlag;
@property (nonatomic, assign) int recommendFlag;
@property (nonatomic, copy) NSString *releaseTime;
@property (nonatomic, assign) int selectNum;


@property (nonatomic, assign) int sort;

@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *sourceUrl;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *updateTime;

@property (nonatomic, assign) int virtualNum;
@end

NS_ASSUME_NONNULL_END
