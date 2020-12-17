//
//  MobileVali.m
//  labor
//
//  Created by 狍子 on 2020/10/15.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MobileVali.h"

@implementation MobileVali
//手机号码是否正确

+ (NSString *)valiMobile:(NSString *)mobile{

    

    if (mobile.length != 11) {

        return @"手机号长度只能是11位";

    } else {

        /**

         * 移动号段正则表达式

         */

        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(17[0-9])|(18[2-4,7-8]))\\d{8}$";

        /**

         * 联通号段正则表达式

         */

        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(17[0-9])|(18[5,6]))\\d{8}$";

        /**

         * 电信号段正则表达式

         */

        NSString *CT_NUM = @"^((133)|(153)|(17[0-9])|(18[0,1,9]))\\d{8}$";

        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];

        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];

        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];

        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];

        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];

        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];

        

        if (isMatch1 || isMatch2 || isMatch3) {

            return nil;

        } else {

            return @"请输入正确的电话号码";

        }

    }

    

    return nil;

}
@end
