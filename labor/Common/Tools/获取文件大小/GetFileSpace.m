//
//  GetFileSpace.m
//  labor
//
//  Created by 狍子 on 2020/10/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "GetFileSpace.h"

@implementation GetFileSpace
//获取视频 大小

+ (NSInteger) getFileSize:(NSString*) path

{

    NSLog(@"path == %@",path);
    
    NSFileManager * filemanager = [[NSFileManager alloc]init];
    NSInteger fileSize = (NSInteger)[[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil].fileSize;
    NSLog(@"视频文件大小 === %fM",fileSize/(1024.0*1024.0));
    
    if([filemanager fileExistsAtPath:path]){

        NSDictionary * attributes = [filemanager attributesOfItemAtPath:path error:nil];

        NSNumber *theFileSize;

        if ( (theFileSize = [attributes objectForKey:NSFileSize]) )

            return  [theFileSize intValue]/1024;

        else
            return -1;

    }

    else

    {

        return -1;

    }

}

@end
