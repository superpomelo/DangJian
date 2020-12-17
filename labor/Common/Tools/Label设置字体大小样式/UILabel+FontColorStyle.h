//
//  UILabel+FontColorStyle.h
//  labor
//
//  Created by 狍子 on 2020/11/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (FontColorStyle)
/**<自定义字体专用>返回NSAttributedString 传入字体大小font，字体颜色color，字体样式zitistyle（打入的自定义字体）*/
+ (NSMutableAttributedString*)getABTbody:(NSString*)body font:(CGFloat)font color:(UIColor*)color zitistyle:(nullable NSString*)zitistyle;
@end

NS_ASSUME_NONNULL_END
