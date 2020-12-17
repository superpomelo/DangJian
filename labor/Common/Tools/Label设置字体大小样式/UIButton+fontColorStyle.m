//
//  UIButton+fontColorStyle.m
//  labor
//
//  Created by 狍子 on 2020/11/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "UIButton+fontColorStyle.h"

@implementation UIButton (fontColorStyle)
/**<自定义字体专用>返回NSAttributedString 传入字体大小font，字体颜色color，字体样式zitistyle（打入的自定义字体）*/
+ (NSMutableAttributedString*)getABTbody:(NSString*)body font:(CGFloat)font color:(UIColor*)color zitistyle:(NSString*)zitistyle{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:body attributes:@{NSFontAttributeName: [UIFont fontWithName:zitistyle size: font],NSForegroundColorAttributeName:color}];
    return attributedString;
}
@end
