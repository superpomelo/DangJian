//
//  BaseRequestDatas.h
//  com.tkhy.driver
//
//  Created by 狍子 on 2020/7/24.
//  Copyright © 2020 TK. All rights reserved.
//
typedef enum  {

HTTPMethodGET  = 0,

HTTPMethodPOST,

HTTPMethodDELETE

} HTTPMethodState;

typedef enum  {

HeaderTypeTOKEN  = 0,
HeaderTypeBaTOKEN,
HeaderTypeNOWWWTOKEN,
HeaderTypeContentTypeTOKEN,
HeaderTypeNULL,


} HeaderTypeState;

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseRequestDatas : NSObject
/**
 * 网络请求
 * path: 请求地址
 * method: 请求类型 如 GET POST DELETE
 * HeaderType: 请求头类型 
 * parameters: 参数
 * isShowLoading: 是否显示logding
 * success 为请求成功回调闭包
 * failure 为请求失败回调闭包
 */
+ (void)requestDataWithPath:(NSString *)path parameters:(nullable  id)parameters HTTPMethod:(HTTPMethodState)method HeaderType:(HeaderTypeState)headerType isShowLoading:(BOOL)isshowloading success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**
 * 上传图片
 * path: 请求地址
 * HeaderType: 请求头类型
 * parameters: 参数
 * isShowLoading: 是否显示logding
 * success 为请求成功回调闭包
 * failure 为请求失败回调闭包
 */
+ (void)uploadImageDataWithPath:(NSString *)path parameters:(nullable  id)parameters imgData:(id)imgData HTTPMethod:(HTTPMethodState)method HeaderType:(HeaderTypeState)headerType  mimeType:(NSString*)mimeType fileName:(NSString*)fileName isShowLoading:(BOOL)isshowloading success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;



@end

NS_ASSUME_NONNULL_END
