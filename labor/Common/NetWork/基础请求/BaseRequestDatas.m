//
//  BaseRequestDatas.m
//  com.tkhy.driver
//
//  Created by 狍子 on 2020/7/24.
//  Copyright © 2020 TK. All rights reserved.
//

#import "BaseRequestDatas.h"
#import <AFHTTPSessionManager.h>
#import "UserInfoManager.h"
#import "SwitchRootController.h"
#import "JsonString.h"

@implementation BaseRequestDatas

/**
 * 网络请求
 * path: 请求地址
 * method: 请求类型 如 GET POST DELETE
 * headerType: 请求头类型 默认 token
 * parameters: 参数
 * isShowLogding: 是否显示logding 默认true
 * success 为请求成功回调闭包
 * failure 为请求失败回调闭包
 */

+ (void)requestDataWithPath:(NSString *)path parameters:(nullable  id)parameters HTTPMethod:(HTTPMethodState)method HeaderType:(HeaderTypeState)headerType isShowLoading:(BOOL)isshowloading success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    
//    AFNetworkReachabilityManager
     
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.requestSerializer.timeoutInterval = 30.0;
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    // 监听网络状态,每当网络状态发生变化就会调用此block
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:     // 无连线
                NSLog(@"AFNetworkReachability Not Reachable");
                [UserInfoManager setAFNetworkReachabilityStatus:@"NotReachable"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                [UserInfoManager setAFNetworkReachabilityStatus:@"viaWWAN"];

                NSLog(@"AFNetworkReachability Reachable via WWAN");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WiFi
                [UserInfoManager setAFNetworkReachabilityStatus:@"viaWiFi"];

                NSLog(@"AFNetworkReachability Reachable via WiFi");
                break;
            case AFNetworkReachabilityStatusUnknown:          // 未知网络
            default:
                NSLog(@"AFNetworkReachability Unknown");
                break;
        }
    }];
    // 开始监听
    [manager.reachabilityManager startMonitoring];
    //    manager.responseSerializer =  [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer =  [AFJSONResponseSerializer serializer];

    
    NSMutableDictionary *HeaderPara = [NSMutableDictionary dictionary];

    
    if (headerType == HeaderTypeTOKEN) {

        HeaderPara[@"Content-Type"] = @"application/x-www-form-urlencoded;charset=UTF-8";
//        HeaderPara[@"Authorization"] = [NSString stringWithFormat:@"Bearer f46da21a-cc8b-47a1-8932-51000e60aaca"];

        HeaderPara[@"Authorization"] = [NSString stringWithFormat:@"Bearer %@",[UserInfoManager getToken]];

    }else if (headerType == HeaderTypeBaTOKEN) {
        HeaderPara[@"Content-Type"] = @"application/x-www-form-urlencoded;charset=UTF-8";
//        HeaderPara[@"Content-Type"] = @"application/json";

        HeaderPara[@"Authorization"] = @"Basic dGVzdDp0ZXN0";

    }else if (headerType == HeaderTypeNOWWWTOKEN) {
        HeaderPara[@"Content-Type"] = @"application/json;charset=UTF-8";
        HeaderPara[@"Authorization"] = [NSString stringWithFormat:@"Bearer %@",[UserInfoManager getToken]];
    }else if (headerType == HeaderTypeContentTypeTOKEN) {
//        HeaderPara[@"Content-Type"] = @"application/json";
        
//        HeaderPara[@"Authorization"] = [NSString stringWithFormat:@"Bearer f46da21a-cc8b-47a1-8932-51000e60aaca"];

        HeaderPara[@"Authorization"] = [NSString stringWithFormat:@"Bearer %@",[UserInfoManager getToken]];
    }else if (headerType == HeaderTypeNULL) {
        
    }
    
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/xml",@"text/html", nil];
    if (isshowloading) {
      //是否需要loading状态
    [SVProgressHUD show];
    }
    
    if (method == HTTPMethodGET) {
        [manager GET:path parameters:parameters headers:HeaderPara progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (isshowloading) {
              [SVProgressHUD dismiss];
            }
          NSLog(@"API ========= %@ \n %@", task.currentRequest.URL, responseObject);
            NSDictionary *dict = [NSDictionary dictionary];
            dict = responseObject;
            if ([dict.allKeys containsObject:@"code"]) {
                if ([dict[@"code"] intValue] == 401) {
                    [SwitchRootController goLoginController];
                }else{
                   
                }
            }
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (isshowloading) {
              [SVProgressHUD dismiss];
            }
            NSDictionary *erroInfo = error.userInfo;

            NSData *data = [erroInfo valueForKey:@"com.alamofire.serialization.response.error.data"];

            NSString *errorString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *dict = [NSDictionary dictionary];
            dict = [JsonString dictionaryWithJsonString:errorString];
            if ([dict.allKeys containsObject:@"code"]) {
                if ([dict[@"code"] intValue] == 401) {
                    [SwitchRootController goLoginController];
                }else{
                   
                }
            }
            failure(error);
        }];
    }else if (method == HTTPMethodPOST) {
        
        [manager POST:path parameters:parameters headers:HeaderPara progress:^(NSProgress * _Nonnull uploadProgress) {
        
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (isshowloading) {
              [SVProgressHUD dismiss];
            }
           NSLog(@"API ========= %@ \n %@", task.currentRequest.URL, responseObject);
            NSDictionary *dict = [NSDictionary dictionary];
            dict = responseObject;
            if ([dict.allKeys containsObject:@"code"]) {
                if ([dict[@"code"] intValue] == 401) {
                    [SwitchRootController goLoginController];
                }else{
                    
                }
            }
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (isshowloading) {
              [SVProgressHUD dismiss];
            }
            NSDictionary *erroInfo = error.userInfo;

            NSData *data = [erroInfo valueForKey:@"com.alamofire.serialization.response.error.data"];

            NSString *errorString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *dict = [NSDictionary dictionary];
            dict = [JsonString dictionaryWithJsonString:errorString];
            if ([dict.allKeys containsObject:@"code"]) {
                if ([dict[@"code"] intValue] == 401) {
                    [SwitchRootController goLoginController];
                }else{
                   
                }
            }
            failure(error);
        }];
    }else if (method == HTTPMethodDELETE) {
        [manager DELETE:path parameters:parameters headers:HeaderPara success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (isshowloading) {
              [SVProgressHUD dismiss];
            }
            NSLog(@"API ========= %@ \n %@", task.currentRequest.URL, responseObject);
            NSDictionary *dict = [NSDictionary dictionary];
            dict = responseObject;
            if ([dict.allKeys containsObject:@"code"]) {
                if ([dict[@"code"] intValue] == 401) {
                    [SwitchRootController goLoginController];
                }else{
                   
                }
            }
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (isshowloading) {
              [SVProgressHUD dismiss];
            }
            NSDictionary *erroInfo = error.userInfo;

            NSData *data = [erroInfo valueForKey:@"com.alamofire.serialization.response.error.data"];

            NSString *errorString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *dict = [NSDictionary dictionary];
            dict = [JsonString dictionaryWithJsonString:errorString];
            if ([dict.allKeys containsObject:@"code"]) {
                if ([dict[@"code"] intValue] == 401) {
                    [SwitchRootController goLoginController];
                }else{
                   
                }
            }
            failure(error);
        }];
    }
 
    

}

/**
 * 上传图片
 * path: 请求地址
 * HeaderType: 请求头类型
 * parameters: 参数
 * isShowLoading: 是否显示logding
 * success 为请求成功回调闭包
 * failure 为请求失败回调闭包
 */
+ (void)uploadImageDataWithPath:(NSString *)path parameters:(nullable  id)parameters imgData:(id)imgData HTTPMethod:(HTTPMethodState)method HeaderType:(HeaderTypeState)headerType  mimeType:(NSString*)mimeType fileName:(NSString*)fileName isShowLoading:(BOOL)isshowloading success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
//    manager.responseSerializer =  [AFJSONResponseSerializer serializer];
    
    if (isshowloading) {
      //是否需要loading状态
    [SVProgressHUD show];
    }
    NSMutableDictionary *HeaderPara = [NSMutableDictionary dictionary];

        
    if (headerType == HeaderTypeTOKEN) {
            HeaderPara[@"Content-Type"] = @"application/x-www-form-urlencoded;charset=UTF-8";
            HeaderPara[@"Authorization"] = [NSString stringWithFormat:@"Bearer %@",[UserInfoManager getToken]];

    }else if (headerType == HeaderTypeBaTOKEN) {
            HeaderPara[@"Content-Type"] = @"application/x-www-form-urlencoded;charset=UTF-8";
            HeaderPara[@"Authorization"] = @"Basic dGVzdDp0ZXN0";

    }else if (headerType == HeaderTypeNOWWWTOKEN) {
            HeaderPara[@"Content-Type"] = @"application/json;charset=UTF-8";
            HeaderPara[@"Authorization"] = [NSString stringWithFormat:@"Bearer %@",[UserInfoManager getToken]];
    }else if (headerType == HeaderTypeContentTypeTOKEN) {
    //        HeaderPara[@"Content-Type"] = @"application/json";
            HeaderPara[@"Authorization"] = [NSString stringWithFormat:@"Bearer %@",[UserInfoManager getToken]];
//        HeaderPara[@"Authorization"] = [NSString stringWithFormat:@"Bearer f46da21a-cc8b-47a1-8932-51000e60aaca"];
    }else if (headerType == HeaderTypeNULL) {
            
    }

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    [manager POST:path parameters:parameters headers:HeaderPara constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
       //上传的内容
//        NSData *data;
        [formData appendPartWithFileData:parameters[@"file"] name:@"file" fileName:fileName mimeType:mimeType];//给定数据流的数据名，文件名，文件类型（以图片为例）
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (isshowloading) {
          [SVProgressHUD dismiss];
        }
        NSDictionary *dict = [NSDictionary dictionary];
        dict = responseObject;
        if ([dict.allKeys containsObject:@"code"]) {
            if ([dict[@"code"] intValue] == 401) {
                [SwitchRootController goLoginController];
            }else{
                
            }
        }
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (isshowloading) {
          [SVProgressHUD dismiss];
        }
        NSDictionary *erroInfo = error.userInfo;

        NSData *data = [erroInfo valueForKey:@"com.alamofire.serialization.response.error.data"];

        NSString *errorString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSDictionary dictionary];
        dict = [JsonString dictionaryWithJsonString:errorString];
        if ([dict.allKeys containsObject:@"code"]) {
            if ([dict[@"code"] intValue] == 401) {
                [SwitchRootController goLoginController];
            }else{
               
            }
        }
        failure(error);
    }];
}

@end
