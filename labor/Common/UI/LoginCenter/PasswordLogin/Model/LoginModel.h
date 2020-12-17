//
//  LoginModel.h
//  labor
//
//  Created by 狍子 on 2020/9/4.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginModel : NSObject
@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, assign) int active;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, assign) int dept_id;
@property (nonatomic, assign) int expires_in;
@property (nonatomic, copy) NSString *license;
@property (nonatomic, copy) NSString *real_name;
@property (nonatomic, copy) NSString *refresh_token;
@property (nonatomic, copy) NSString *scope;
@property (nonatomic, copy) NSString *tenant_id;
@property (nonatomic, copy) NSString *token_type;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *username;


@end

NS_ASSUME_NONNULL_END
