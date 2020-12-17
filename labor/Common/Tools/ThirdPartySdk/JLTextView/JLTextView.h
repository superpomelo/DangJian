//
//  JLTextView.h
//  JLTextView
//
//  Created by 杨建亮 on 2018/4/26.
//  Copyright © 2018年 yangjianliang. All rights reserved.
//
/**
 JLTextView继承UITextView
 
 1.新增了占位文字、及占位文字颜色;
 2.新增最大限制字符、及字符改变回调;
 
 3.a新增自适应高度及高度改变回调,
   b设置/获取【最小行数、最大行数】,
   c可获取最小行数、最大行数所需高度,
   d可获取当前文本的行高，文本行数
 
 4.基于UITextView的typingAttributes富文本设置扩展支持:
   a最小行高、行间距,字体等
   b同时兼容3中对应的自适应高度全部功能
   c占位文字大小、位置与富文本保持一致、
   d富文本光标位置偏移进行处理，
 
 5.全局富文本设置新增属性：
     a设置/获取全局【行间距、字间距、行高】
     b获取每行的字符串数组
     c新增垂直布局及垂直字符串

 
 */


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class JLTextView;
typedef void(^JLTextChangedHandler)(JLTextView *view,NSUInteger curryLength);
typedef void(^JLTextHeightChangedHandler)(JLTextView *view,CGFloat textHeight);


IB_DESIGNABLE
@interface JLTextView : UITextView
//占位文字
@property (nonatomic, strong, nullable) IBInspectable NSString *placeholder;//支持nib
//占位文字颜色
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

#pragma mark 自适应高度

//自适应高度 default is NO。设置YES后Frame高度设置无效，高度将由minNumberOfLines/maxNumberOfLines决定
@property (nonatomic, assign) BOOL sizeToFitHight;
//自适应高度 (sizeToFitHight=YES)文本高度改变时Block回调.
@property (nonatomic, copy, nullable) JLTextHeightChangedHandler textHeightHandler;

//最小行数 default is 1。  [0 NSUIntegerMax],建议在sizeToFitHight设置之前设置
@property (nonatomic, assign) NSUInteger minNumberOfLines;
//最大行数 default is NSUIntegerMax。[minNumberOfLines NSUIntegerMax],建议在sizeToFitHight设置之前设置
@property (nonatomic, assign) NSUInteger maxNumberOfLines;

//获取自适应高度时的最小行数高度
@property (nonatomic, assign, readonly) CGFloat minTextHeight;
//获取自适应高度时的最大行数高度
@property (nonatomic, assign, readonly) CGFloat maxTextHeight;

//自适应高度时内容上下间距调整、default is NO
//在自适应高度情况下自动调整内容上下间距使当输入超过最大行数时，恰好展示n行，eg：微信聊天输入框
@property (nonatomic, assign) BOOL isAutoAdjustTextInsetBehavior;

//自适应高度
-(void)sizeToFitHightWhenNeed;


//字符限制: 最大限制文本长度 默认为无穷大不限制[0 NSUIntegerMax),
@property (nonatomic, assign) NSUInteger maxTextLength;
//禁用输入emojy表情😊(输入后自动删除) 默认NO
//@property (nonatomic, assign) BOOL  disEnableEmojy;//碰到难题，暂不支持
//字符长度改变Block回调
@property (nonatomic, copy, nullable) JLTextChangedHandler textLengthHandler;




//全局统一属性
@property (nonatomic, assign) CGFloat jlFontSpacing;//字符间距
@property (nonatomic, assign) CGFloat jlLineSpacing;//行间距
@property (nonatomic, assign) CGFloat jlLineHeight;//当前行高(包含self.font.leading)[>=minLineHeight]
@property (nonatomic, assign, readonly) CGFloat minLineHeight ;//(包含self.font.leading)

@property (nonatomic, assign) BOOL middleWhenMoreLineHeight;//当前行高大于字体行高时，文字自动居中，默认NO置底
@property (nonatomic, assign) BOOL jlRightToLeft;
-(void)setRRFont:(UIFont *)font;


//文本排版属性(目前sizeToFitHight=YES有效)
@property (nonatomic, strong, readonly) NSArray *allLinesStringArray ;//每行字符串集合
@property (nonatomic, assign, readonly) NSUInteger curryTextLines;//当前文本行数
//@property (nonatomic, assign, readonly) NSInteger maxTextLengthLine ;//字符串长度最长的那一行 [eg：😄算2个长度]
//@property (nonatomic, assign, readonly) NSInteger maxTextCountLine ; //字个数最多的那一行    [eg：😄算1个字数]


//字符串宽/高计算api
- (CGFloat)calculateCurryTextHeight;
- (CGFloat)calculateTextMaxWidth:(NSString *)text;



@end

#pragma mark UITextView文本内容实际大小计算扩展
@interface UITextView (JLSizeCalculate)
//限制textView当前字数，可用于UITextViewDelegate的textViewDidChange中限制字符个数
- (void)jl_limitTextViewMaxLengthWhenDidChange:(NSUInteger)maxLength;

//获取textView文本内容实际排版宽度
- (CGFloat)jl_getWidthOfContentText;
//获取上下边距总和
- (CGFloat)jl_getHeightOfContentMargin;
@end
NS_ASSUME_NONNULL_END
