//
//  SchoolNameModel.h
//  labor
//
//  Created by 狍子 on 2020/9/20.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SchoolNameModel : NSObject
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *contactJob;
@property (nonatomic, copy) NSString *contactPerson;
@property (nonatomic, assign) int delFlag;
@property (nonatomic, assign) int deptId;

@property (nonatomic, assign) int iphone;

@property (nonatomic, copy) NSString *mapX;
@property (nonatomic, copy) NSString *mapY;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int sort;


@end

NS_ASSUME_NONNULL_END
