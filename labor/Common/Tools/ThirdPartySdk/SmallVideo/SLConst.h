//
//  SLConst.h
//  GDXSketch
//
//  Created by apple on 2020/9/17.
//  Copyright © 2020 gdxud. All rights reserved.
//

#ifndef SLConst_h
#define SLConst_h

#import "UIView+SLFrame.h"
#import "SLDelayPerform.h"

/// 屏幕宽高
#define SL_kScreenWidth [UIScreen mainScreen].bounds.size.width
#define SL_kScreenHeight [UIScreen mainScreen].bounds.size.height

/// 弱引用对象
#define SL_WeakSelf __weak typeof(self) weakSelf = self;

///主线程操作
#define SL_DISPATCH_ON_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(),mainQueueBlock);

#endif /* SLConst_h */
