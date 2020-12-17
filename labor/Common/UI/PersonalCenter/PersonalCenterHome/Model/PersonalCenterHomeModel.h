//
//  PersonalCenterHomeModel.h
//  labor
//
//  Created by 狍子 on 2020/9/20.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalCenterHomeModel : NSObject
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) int areaId;

@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *birthdaddrass;
@property (nonatomic, copy) NSString *educationName;
@property (nonatomic, copy) NSString *deptName;

@property (nonatomic, assign) int cityId;
@property (nonatomic, assign) int deptId;

@property (nonatomic, assign) int education;
//@property (nonatomic, assign) int infoId;
@property (nonatomic, copy) NSString *infoId;

@property (nonatomic, copy) NSString *jobTime;
@property (nonatomic, copy) NSString *partyTime;

@property (nonatomic, copy) NSString *nationName;
@property (nonatomic, assign) int nation;

@property (nonatomic, assign) int partyNumber;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, assign) int provinceId;

@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *departmentName;



@end

NS_ASSUME_NONNULL_END
