//
//  NSString+AES.h
//  
//
//  Created by Bear on 16/11/26.
//  Copyright © 2016年 Bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AES)

/**< 加密方法 */
- (NSString*)aci_encryptWithAESWithPSW_AES_KEY:(NSString*)PSW_AES_KEY  AES_IV_PARAMETER:(NSString*)AES_IV_PARAMETER;

/**< 解密方法 */
- (NSString*)aci_decryptWithAESWithPSW_AES_KEY:(NSString*)PSW_AES_KEY  AES_IV_PARAMETER:(NSString*)AES_IV_PARAMETER;

/**< GTMBase64编码<自用> */
- (NSString*)MyencodeBase64Data;

/**< GTMBase64解码<自用> */
- (NSString*)MydecodeBase64Data;
@end
