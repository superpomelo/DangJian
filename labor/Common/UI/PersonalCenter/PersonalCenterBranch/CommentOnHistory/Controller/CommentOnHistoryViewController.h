//
//  CommentOnHistoryViewController.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum  {

CommentOnHistoryStatekecheng  = 0, //课程

CommentOnHistoryStatexinwen,  //新闻

CommentOnHistoryStatequanzi //圈子



} CommentOnHistoryState; //用户选择 课程/新闻/圈子 的枚举
@interface CommentOnHistoryViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
