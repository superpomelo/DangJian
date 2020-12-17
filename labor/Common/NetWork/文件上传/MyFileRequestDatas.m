//
//  MyFileRequestDatas.m
//  labor
//
//  Created by 狍子 on 2020/9/14.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyFileRequestDatas.h"
#import "BaseRequestDatas.h"

@implementation MyFileRequestDatas
/**图片上传*/
+ (void)informationuploadImgrequestDataWithparameters:(nullable  id)parameters imageDatas:(nullable  id)imageDatas success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
           NSString *path = [NSString stringWithFormat:@"%@information/information/uploadImg",Host];
//            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    
    [BaseRequestDatas uploadImageDataWithPath:path parameters:parameters imgData:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN mimeType:@"image/png" fileName:@"file.png" isShowLoading:YES success:^(id  _Nonnull result) {
        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        if ([dict.allKeys containsObject:@"nameKey"]) {
            NSLog(@"200");
    //                NSArray *array =  [TheTestModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"questionVoList"]]; //数组
            NSString *url = [NSString stringWithFormat:@"%@",dict[@"nameKey"]];
          success(url);

                }else{
                    NSLog(@"4");

                }
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"failure");
        failure(error);
    }];


}

/**视频上传*/
+ (void)lessonuploadrequestDataWithparameters:(nullable  id)parameters imageDatas:(nullable  id)imageDatas success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@learn/lesson/uploadvideo",Host];
//            NSString *JsonStr = [JsonString convertToJsonData:parameters];
    [BaseRequestDatas uploadImageDataWithPath:path parameters:parameters imgData:parameters HTTPMethod:HTTPMethodPOST HeaderType:HeaderTypeContentTypeTOKEN mimeType:@"video/mp4" fileName:@"file.mp4" isShowLoading:YES success:^(id  _Nonnull result) {
        NSLog(@"%@",result);
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        if ([dict.allKeys containsObject:@"data"]) {
            NSLog(@"200");
    //                NSArray *array =  [TheTestModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"questionVoList"]]; //数组
            NSString *url = [NSString stringWithFormat:@"%@",dict[@"data"][@"nameKey"]];
             success(url);

                }else{
                    NSLog(@"4");

                }
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"failure");
        failure(error);
    }];

}
@end
