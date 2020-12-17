//
//  JLTextView.m
//  JLTextView
//
//  Created by 杨建亮 on 2018/4/26.
//  Copyright © 2018年 yangjianliang. All rights reserved.
//

#import "JLTextView.h"
#import <CoreText/CoreText.h>

@interface JLTextView ()<UITextInput>
//使用等大JLTextView解决占位符问题.方便设置富文本、typingAttributes等时的字体重叠显示
@property (nonatomic, weak) UITextView *placeholderView;
@property (nonatomic, assign) BOOL scrollEnabledLock;//当使用sizeToFitHight=YES时scrollEnabled外部设置无效

@property (nonatomic, assign) BOOL isNextDidChangeHeight;
@property (nonatomic, assign) CGFloat lastTextHeight;


@property (nonatomic, strong) NSArray *allLinesRef  ;//每行字符串几个，可能会少一行哦
@property (nonatomic, strong) NSMutableArray *allLinesStringArrayM ;//每行字符串集合

@property (nonatomic, assign, readonly) NSInteger curryEditingLine ;//当前正在编辑第几行

@property (nonatomic, strong, readonly) NSMutableDictionary *typingAttributes_Mutable ;
@property (nonatomic, strong, readonly) NSMutableParagraphStyle *paragraphStyle_Mutable ;



@end

@implementation JLTextView
@dynamic text ;

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initDefaultData];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initDefaultData];
    }
    return self;
}
- (void)initDefaultData
{
    _allLinesStringArrayM = [NSMutableArray array];
    
    _jlLineHeight = self.minLineHeight;
    _jlLineSpacing = 0.f;
    _curryTextLines = 0;
    _jlFontSpacing = 0.f;

    _minNumberOfLines = 1;
    _maxNumberOfLines = NSUIntegerMax;
    _sizeToFitHight = NO;

    _maxTextLength = NSUIntegerMax;
    _isNextDidChangeHeight = NO;
    
    _placeholderColor = [UIColor colorWithRed:194.f/255.0f green:194.f/255.0f blue:194.f/255.0f alpha:1.0];
    _scrollEnabledLock = NO;
    _isAutoAdjustTextInsetBehavior = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}
#pragma mark - placeholderView
- (UITextView *)placeholderView
{
    if (!_placeholderView ) {
        UITextView *placeholderView = [[UITextView alloc] initWithFrame:self.bounds];
        _placeholderView = placeholderView;
        _placeholderView.scrollEnabled = NO;
        _placeholderView.showsHorizontalScrollIndicator = NO;
        _placeholderView.showsVerticalScrollIndicator = NO;
        _placeholderView.userInteractionEnabled = NO;
        _placeholderView.backgroundColor = [UIColor clearColor];
        
        _placeholderView.textContainerInset = self.textContainerInset;
        _placeholderView.contentInset = self.contentInset;
        _placeholderView.textContainer.lineFragmentPadding = self.textContainer.lineFragmentPadding;//!

        if (self.typingAttributes)
        {
            [self setTypingAttributes_placeholderView:self.typingAttributes];
        }else
        {
            _placeholderView.textColor = _placeholderColor;
            _placeholderView.text = _placeholder;
            _placeholderView.font = self.font;
        }
        _placeholderView.hidden = self.text.length > 0?YES:NO;
        
        [self addSubview:placeholderView];
    }
    return _placeholderView;
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    if (self.typingAttributes){
        [self setTypingAttributes_placeholderView:self.typingAttributes];
    }else{
        _placeholderView.textColor = placeholderColor;
    }
}
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    if (_placeholder) {
        if (self.typingAttributes){
            [self placeholderView];
            [self setTypingAttributes_placeholderView:self.typingAttributes];
        }else{
            self.placeholderView.text = _placeholder;
        }
    }else{
        [_placeholderView removeFromSuperview];
    }
}
-(NSMutableDictionary *)typingAttributes_Mutable
{
    NSMutableDictionary *dictM;
    if ([self.typingAttributes isKindOfClass:NSMutableDictionary.class]) {
        dictM = (NSMutableDictionary *)self.typingAttributes;
    }else{
        dictM = [NSMutableDictionary dictionaryWithDictionary:self.typingAttributes];
    }
    return dictM;
}
-(NSMutableParagraphStyle *)paragraphStyle_Mutable
{
    NSMutableParagraphStyle *paragraphStyle = [self.typingAttributes objectForKey:NSParagraphStyleAttributeName];
    if (!paragraphStyle || ![paragraphStyle isKindOfClass:NSMutableParagraphStyle.class])
    {
        paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    }
    return paragraphStyle;
}
-(CGFloat)minLineHeight
{
    return self.font.lineHeight+self.font.leading;
}
-(void)setSizeToFitHight:(BOOL)sizeToFitHight
{
    _sizeToFitHight = sizeToFitHight;
    if (_sizeToFitHight) {
        self.scrollEnabledLock = NO;
        self.scrollEnabled = NO;
        self.scrollEnabledLock = YES;
    }else{
        self.scrollEnabledLock = NO;
        self.scrollEnabled = YES;
    }
    if (!self.text||[self.text isEqualToString:@""]) {
        [self sizeToFitMinLinesHightWhenNoText];
    }else{
        [self sizeToFitHightWhenNeed];
    }
}
-(void)sizeToFitMinLinesHightWhenNoText
{
    if (self.sizeToFitHight && self.text.length==0)
    {
        BOOL heightChange = self.frame.size.height!=self.minTextHeight;
//        CGRect frame = self.frame;//对于旋转一定角度，设置直接frame可能会出错。若需要可以在_textHeightHandler再做调整frame
//        frame.size.height = self.minTextHeight;
//        self.frame = frame;
        if (heightChange)
        {
            _lastTextHeight = self.minTextHeight;
            !_textHeightHandler ?: _textHeightHandler(self, self.minTextHeight);
        }
    }
}
-(CGFloat)minTextHeight
{
    if (self.minNumberOfLines == 0) {
        return 0.0;
    }
    CGFloat lineHeight = self.jlLineHeight;
    CGFloat lineSpaceing = self.jlLineSpacing;
    CGFloat heightMIN = lineHeight*_minNumberOfLines +(_minNumberOfLines-1)*lineSpaceing;
    heightMIN = heightMIN+[self jl_getHeightOfContentMargin];
    return heightMIN;
}
-(CGFloat)maxTextHeight
{
    CGFloat lineHeight = self.jlLineHeight;
    CGFloat lineSpaceing = self.jlLineSpacing;
    CGFloat heightMAX = lineHeight*_maxNumberOfLines +(_maxNumberOfLines-1)*lineSpaceing;
    heightMAX = heightMAX+[self jl_getHeightOfContentMargin];
    return heightMAX;
}

-(void)setMaxTextLength:(NSUInteger)maxTextLength
{
    _maxTextLength = maxTextLength;
    if (self.text.length > _maxTextLength) {
        self.text = [self.text substringToIndex:_maxTextLength]; // 截取最大限制字符数.
    }
}
-(void)setMinNumberOfLines:(NSUInteger)minNumberOfLines
{
    NSUInteger lastMinNumberOfLines = self.minNumberOfLines;
    _minNumberOfLines = minNumberOfLines<_maxNumberOfLines?minNumberOfLines:_maxNumberOfLines;
    if (self.minNumberOfLines!=lastMinNumberOfLines)
    {
        self.isNextDidChangeHeight = YES;
        [self sizeToFitHightWhenNeed];
    }
}
- (void)setMaxNumberOfLines:(NSUInteger)maxNumberOfLines
{
    NSUInteger lastMaxNumberOfLines = self.maxNumberOfLines;
    _maxNumberOfLines = maxNumberOfLines>_minNumberOfLines?maxNumberOfLines:_minNumberOfLines;
    if (self.maxNumberOfLines!=lastMaxNumberOfLines)
    {
        self.isNextDidChangeHeight = YES;
        [self sizeToFitHightWhenNeed];
    }
}
-(NSInteger)curryEditingLine
{
    NSInteger editingIndex = self.selectedRange.location;
    
    NSArray *arr = self.allLinesStringArray;
    NSInteger index = 0;
    NSInteger curryEditingLine = arr.count-1;
    for (int i=0; i< arr.count; ++i) {
        NSString *str = arr[i];
        NSInteger length = str.length;
        
        if (index <=editingIndex && editingIndex< index+length) {
            curryEditingLine = i;
            break;
        }
        index+=str.length;
    }
    
    return curryEditingLine;
}



#pragma mark - 监听文字输入时改动（NSNotification）
- (void)textDidChange:(NSNotification *)notification
{
    if ([notification.object isEqual:self])
    {
        //隐藏placeholderView
        _placeholderView.hidden = self.text.length > 0?YES:NO;
        
        //1.限制字符串长度
        [self jl_limitTextViewMaxLengthWhenDidChange:self.maxTextLength];

        //2.回调文本改变的Block.
        if (!self.sizeToFitHight) {
            !_textLengthHandler ?: _textLengthHandler(self, self.text.length);//项目特殊情况
        }
        
        //3.自适应高度
        [self sizeToFitHightWhenNeed];
    }
   
}
#pragma mark 自适应高度
-(void)sizeToFitHightWhenNeed
{
    if (self.sizeToFitHight)
    {
        CGFloat heightText  = [self calculateCurryTextHeight];//计算字符串高度
        !_textLengthHandler ?: _textLengthHandler(self, self.text.length);//计算好再回调

        CGFloat heightTop_bottom  = [self jl_getHeightOfContentMargin];
        CGFloat height_textView = heightText+ heightTop_bottom;
        if (self.isNextDidChangeHeight || self.lastTextHeight != height_textView)
        {
            self.isNextDidChangeHeight = NO;//只生效一次
            
            //优化系统输入时跳动
            self.scrollEnabledLock = NO;
            self.scrollEnabled = NO;
            self.scrollEnabledLock = YES;

            if (height_textView<=self.minTextHeight)
            {
                if (_isAutoAdjustTextInsetBehavior) {
                    super.textContainerInset = UIEdgeInsetsMake(8, 0, 8, 0);
                    _placeholderView.textContainerInset = super.textContainerInset;
                    self.contentInset = UIEdgeInsetsZero;
                    heightTop_bottom  = [self jl_getHeightOfContentMargin];
                    height_textView = heightText+heightTop_bottom;
                }
                !_textHeightHandler ?: _textHeightHandler(self, self.minTextHeight);
            }
            else if (height_textView>=self.maxTextHeight)
            {
                if (_isAutoAdjustTextInsetBehavior) {
                    super.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
                    _placeholderView.textContainerInset = super.textContainerInset;
                    self.contentInset = UIEdgeInsetsMake(0, 0, 4, 0);
                    heightTop_bottom  = [self jl_getHeightOfContentMargin];
                    height_textView = heightText+heightTop_bottom;
                }
                //当高度大于自身高度时允许滚动
                self.scrollEnabledLock = NO;
                self.scrollEnabled = YES;
                self.scrollEnabledLock = YES;

                !_textHeightHandler ?: _textHeightHandler(self, self.maxTextHeight);
           
            }else{
                if (_isAutoAdjustTextInsetBehavior) {
                    super.textContainerInset = UIEdgeInsetsMake(2, 0, 0, 0);
                    _placeholderView.textContainerInset = super.textContainerInset;
                    self.contentInset = UIEdgeInsetsMake(0, 0, 4,0);
                    heightTop_bottom  = [self jl_getHeightOfContentMargin];
                    height_textView = heightText+heightTop_bottom;
                }

                !_textHeightHandler ?: _textHeightHandler(self, height_textView);

            }
            // 字符串高度改变时调整frame高度
            self.lastTextHeight = height_textView;
        }
    }
    
}
//计算高度，系统的bounding(text/attri)方法对于第三方字体leading>0.f、行高>0时计算有bug(见最底部)
- (CGFloat )calculateCurryTextHeight
{
    CGFloat width = [self jl_getWidthOfContentText];
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributedText);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0, width, MAXFLOAT));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    _allLinesRef = (__bridge NSArray *)CTFrameGetLines(frame);

    _curryTextLines = _allLinesRef.count;
    if ([self.text hasSuffix:@"\n"] || _allLinesRef.count==0)
    {
        _curryTextLines++;
    }
    
    CGFloat textHeight = self.jlLineHeight*_curryTextLines +(_curryTextLines-1.0)*_jlLineSpacing;
    textHeight = ceil(textHeight*1000.f)/1000.f;
    return textHeight ;// self.font.leading>0时需加一个self.font.leading高度，不然系统绘制时会判断在外面而不进行绘制
}

-(NSArray *)allLinesStringArray
{
    if (!_allLinesStringArrayM) {
        _allLinesStringArrayM = [NSMutableArray array];
    }
    
    [_allLinesStringArrayM removeAllObjects];
    //    _maxTextLengthLine = 0;
    //    _maxTextCountLine = 0;
    for (int i=0; i<_allLinesRef.count; ++i) {
        CTLineRef lineRef = (__bridge CTLineRef )_allLinesRef[i];
        
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [self.text substringWithRange:range];
        [_allLinesStringArrayM addObject:lineString];
        
//        CFIndex fontCount = CTLineGetGlyphCount(lineRef);

//        if (fontCount>_maxTextCountLine) {
//            _maxTextCountLine = i;
//        }
//        if (lineString.length>_maxLengthLine) {
//            _maxLengthLine = i;
//        }

//        NSArray *arr = (__bridge NSArray *)CTLineGetGlyphRuns(lineRef);
//        NSLog(@"arr i=%d %@", i,arr);
//        NSLog(@"第%d行 字数=%ld 长度=%ld", i,(long)fontCount, lineString.length);//emojy时不相等的,字个数!=字符串长度

//        NSLog(@"第%d行 文字=【%@】", i,lineString);//emojy时不相等的
    }
    
    if ([self.text hasSuffix:@"\n"] || _allLinesStringArrayM.count==0) {
        [_allLinesStringArrayM addObject:@""];
    }
    return _allLinesStringArrayM;
}



-(CGFloat)calculateTextMaxWidth:(NSString *)text
{
    CGFloat textWidth = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:self.typingAttributes context:nil].size.width;
    //    NSLog(@"textWidth=%.8f",textWidth);
    return textWidth;
}





#pragma mark - 重写父类方法
-(void)setScrollEnabled:(BOOL)scrollEnabled
{
    if (!self.scrollEnabledLock) {
        [super setScrollEnabled:scrollEnabled];
    }
}
//- (void)setFont:(UIFont *)font
//{
//    [super setFont:font];
//    [_placeholderView setFont:font];
//
//    [self setValue_jlLineHeight];//若已设置富文本、再设置font，font系统自动加入typingAttributes中、并调整富文本
//
//    self.isNextDidChangeHeight = YES;
//    [self sizeToFitHightWhenNeed];
//}
//-(void)setValue_jlLineHeight
//{
//    NSMutableDictionary *dictM = self.typingAttributes_Mutable;
//    NSParagraphStyle *paragraphStyle =  [dictM objectForKey:NSParagraphStyleAttributeName];
//    if (paragraphStyle)
//    {
//        if (paragraphStyle.minimumLineHeight< self.minLineHeight )
//        {
//            _jlLineHeight = self.minLineHeight;
//            if ([paragraphStyle isKindOfClass:NSMutableParagraphStyle.class])
//            {
//                NSMutableParagraphStyle *paragraphStyle_mutable = (NSMutableParagraphStyle *)paragraphStyle;
//                paragraphStyle_mutable.minimumLineHeight = _jlLineHeight;
//            }else
//            {
//                NSMutableParagraphStyle *paragraphStyle_mutable = [[NSMutableParagraphStyle alloc] init];
//                paragraphStyle_mutable.lineSpacing = paragraphStyle.lineSpacing;
//                paragraphStyle_mutable.paragraphSpacing = paragraphStyle.paragraphSpacing;
//                paragraphStyle_mutable.alignment = paragraphStyle.alignment;
//                paragraphStyle_mutable.firstLineHeadIndent = paragraphStyle.firstLineHeadIndent;
//                paragraphStyle_mutable.headIndent = paragraphStyle.headIndent;
//                paragraphStyle_mutable.tailIndent = paragraphStyle.tailIndent;
//                paragraphStyle_mutable.lineBreakMode = paragraphStyle.lineBreakMode;
//                paragraphStyle_mutable.minimumLineHeight = paragraphStyle.minimumLineHeight;
//                paragraphStyle_mutable.maximumLineHeight = paragraphStyle.maximumLineHeight;
//                paragraphStyle_mutable.baseWritingDirection = paragraphStyle.baseWritingDirection;
//                paragraphStyle_mutable.baseWritingDirection = paragraphStyle.baseWritingDirection;
//                paragraphStyle_mutable.lineHeightMultiple = paragraphStyle.lineHeightMultiple;
//                paragraphStyle_mutable.paragraphSpacingBefore = paragraphStyle.paragraphSpacingBefore;
//                paragraphStyle_mutable.hyphenationFactor = paragraphStyle.hyphenationFactor;
//                paragraphStyle_mutable.tabStops = paragraphStyle.tabStops;
//                paragraphStyle_mutable.defaultTabInterval = paragraphStyle.defaultTabInterval;
//                paragraphStyle_mutable.allowsDefaultTighteningForTruncation = paragraphStyle.allowsDefaultTighteningForTruncation;
//
//                [dictM setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
//            }
//            [self setTypingAttributes:dictM];
//        }else{
//            _jlLineHeight = paragraphStyle.minimumLineHeight;
//        }
//    }
//}
//好像有bug不支持，建议使用textContainerInset设置代替
//同理还有： textView.textContainer.lineFragmentPadding = 30;//not support now
-(void)setContentInset:(UIEdgeInsets)contentInset
{
    UIEdgeInsets old = self.contentInset;

    [super setContentInset:contentInset];
    [_placeholderView setContentInset:contentInset];
    
    if (!UIEdgeInsetsEqualToEdgeInsets(old, contentInset)) {
        self.isNextDidChangeHeight = YES;
        [self sizeToFitHightWhenNeed];
    }
}
-(void)setTextContainerInset:(UIEdgeInsets)textContainerInset
{
    UIEdgeInsets old = self.textContainerInset;

    [super setTextContainerInset:textContainerInset];
    [_placeholderView setTextContainerInset:textContainerInset];

    if (!UIEdgeInsetsEqualToEdgeInsets(old, textContainerInset)) {
        self.isNextDidChangeHeight = YES;
        [self sizeToFitHightWhenNeed];
    }
}
-(void)setTypingAttributes:(NSDictionary<NSString *,id> *)typingAttributes
{
    NSMutableDictionary *dictM;
    if ([typingAttributes isKindOfClass:NSMutableDictionary.class]) {
        dictM = (NSMutableDictionary *)typingAttributes;
    }else{
        dictM = [NSMutableDictionary dictionaryWithDictionary:typingAttributes];
    }
    
    //自动将font、textColor设置为当前富文本(如果未设置。而不是使用富文本的默认值)
    if (![typingAttributes objectForKey:NSFontAttributeName] && self.font)
    {
        [dictM setObject:self.font forKey:NSFontAttributeName];
    }
    if (![typingAttributes objectForKey:NSForegroundColorAttributeName]&&self.textColor)
    {
        [dictM setObject:self.textColor forKey:NSForegroundColorAttributeName];
    }
    
    [self setValue_jlLineHeight_jlLineSpacing__jlFontSpacing:dictM];

    [super setTypingAttributes:dictM];
    [self setTypingAttributes_placeholderView:dictM];

    self.isNextDidChangeHeight = YES;
    [self sizeToFitHightWhenNeed];
}
-(void)setTypingAttributes_placeholderView:(NSDictionary<NSString *,id> *)typingAttributes
{
    //_placeholderView
    NSMutableDictionary *dictM_placeholder = [NSMutableDictionary dictionaryWithDictionary:typingAttributes];
    if ([dictM_placeholder objectForKey:NSBackgroundColorAttributeName]) {//字体背景色
        [dictM_placeholder removeObjectForKey:NSBackgroundColorAttributeName];
    }
    if ([dictM_placeholder objectForKey:NSShadowAttributeName]) {//阴影色
        [dictM_placeholder removeObjectForKey:NSShadowAttributeName];
    }
    if ([dictM_placeholder objectForKey:NSStrokeColorAttributeName]) {//描边色
        [dictM_placeholder removeObjectForKey:NSStrokeColorAttributeName];
        [dictM_placeholder removeObjectForKey:NSStrokeWidthAttributeName];
    }
    if ([dictM_placeholder objectForKey:NSStrikethroughColorAttributeName]) {//删除线颜色
        [dictM_placeholder removeObjectForKey:NSStrikethroughColorAttributeName];
        [dictM_placeholder removeObjectForKey:NSStrikethroughStyleAttributeName];
    }
    if ([dictM_placeholder objectForKey:NSUnderlineColorAttributeName]) {//下划线颜色
        [dictM_placeholder removeObjectForKey:NSUnderlineColorAttributeName];
        [dictM_placeholder removeObjectForKey:NSUnderlineStyleAttributeName];
        [dictM_placeholder removeObjectForKey:NSBaselineOffsetAttributeName];
    }
    [dictM_placeholder setObject:_placeholderColor forKey:NSForegroundColorAttributeName];//字体颜色
    _placeholderView.typingAttributes = dictM_placeholder;
    if (_placeholder) {
        _placeholderView.attributedText = [[NSAttributedString alloc] initWithString:_placeholder attributes:dictM_placeholder];
    }
}
-(void)setValue_jlLineHeight_jlLineSpacing__jlFontSpacing:(NSMutableDictionary *)dictM
{
    NSMutableParagraphStyle *paragraphStyle =  [dictM objectForKey:NSParagraphStyleAttributeName];
    UIFont *nextFont = [dictM objectForKey:NSFontAttributeName];
    _jlLineHeight = nextFont.lineHeight+nextFont.leading;//当前不支持设置较大行高，业务暂不需要，后续考虑
    _jlLineSpacing = paragraphStyle.lineSpacing;
    
//    UIFont *nextFont = [dictM objectForKey:NSFontAttributeName];
//    if (paragraphStyle)
//    {
//        if (paragraphStyle.minimumLineHeight< nextFont.lineHeight)
//        {
//            _jlLineHeight = nextFont.lineHeight;
//            if ([paragraphStyle isKindOfClass:NSMutableParagraphStyle.class])
//            {
//                NSMutableParagraphStyle *paragraphStyle_mutable = (NSMutableParagraphStyle *)paragraphStyle;
//                paragraphStyle_mutable.minimumLineHeight = _jlLineHeight;
//            }else
//            {
//
//                NSMutableParagraphStyle *paragraphStyle_mutable = [[NSMutableParagraphStyle alloc] init];
//                paragraphStyle_mutable.lineSpacing = paragraphStyle.lineSpacing;
//                paragraphStyle_mutable.paragraphSpacing = paragraphStyle.paragraphSpacing;
//                paragraphStyle_mutable.alignment = paragraphStyle.alignment;
//                paragraphStyle_mutable.firstLineHeadIndent = paragraphStyle.firstLineHeadIndent;
//                paragraphStyle_mutable.headIndent = paragraphStyle.headIndent;
//                paragraphStyle_mutable.tailIndent = paragraphStyle.tailIndent;
//                paragraphStyle_mutable.lineBreakMode = paragraphStyle.lineBreakMode;
//                paragraphStyle_mutable.minimumLineHeight = paragraphStyle.minimumLineHeight;
//                paragraphStyle_mutable.maximumLineHeight = paragraphStyle.maximumLineHeight;
//                paragraphStyle_mutable.baseWritingDirection = paragraphStyle.baseWritingDirection;
//                paragraphStyle_mutable.baseWritingDirection = paragraphStyle.baseWritingDirection;
//                paragraphStyle_mutable.lineHeightMultiple = paragraphStyle.lineHeightMultiple;
//                paragraphStyle_mutable.paragraphSpacingBefore = paragraphStyle.paragraphSpacingBefore;
//                paragraphStyle_mutable.hyphenationFactor = paragraphStyle.hyphenationFactor;
//                paragraphStyle_mutable.tabStops = paragraphStyle.tabStops;
//                paragraphStyle_mutable.defaultTabInterval = paragraphStyle.defaultTabInterval;
//                paragraphStyle_mutable.allowsDefaultTighteningForTruncation = paragraphStyle.allowsDefaultTighteningForTruncation;
//
//                [dictM setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
//            }
//        }else{
//            _jlLineHeight = paragraphStyle.minimumLineHeight;
//        }
//        _jlLineSpacing = paragraphStyle.lineSpacing;
//    }else
//    {
//        CGFloat nextLineH = nextFont.lineHeight+nextFont.leading;;
//        _jlLineHeight = nextLineH;
//        _jlLineSpacing = 0.f;
//    }
    
    NSNumber *num = [dictM objectForKey:NSKernAttributeName];
    if (num){
        _jlFontSpacing = num.floatValue;
    }else{
        _jlFontSpacing = 0.f;
    }
    
}
- (void)setText:(NSString *)text
{
    [super setText:text];
    
    if (![self.text isEqualToString:text]) {
        self.isNextDidChangeHeight = YES;
        NSNotification *noti = [[NSNotification alloc] initWithName:@"customNoti" object:self userInfo:nil];
        [self textDidChange:noti];
    }
}
-(void)setAttributedText:(NSAttributedString *)attributedText
{
     BOOL isSame = [self.attributedText isEqualToAttributedString:attributedText];
    [super setAttributedText:attributedText];
    
    if (!isSame) {
        self.isNextDidChangeHeight = YES;
        NSNotification *noti = [[NSNotification alloc] initWithName:@"customNoti" object:self userInfo:nil];
        [self textDidChange:noti];
    }
}
-(void)layoutSubviews
{
//    NSLog(@"JLTextView layoutSubviews");
    [super layoutSubviews];
    [self sizeToFitMinLinesHightWhenNoText];
    if (_placeholderView) {
        if (!CGRectEqualToRect(self.bounds, _placeholderView.frame)) {
            _placeholderView.frame = self.bounds;
        }
    }
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - UITextInput 修正光标在富文本中位置
- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    CGRect originalRect = [super caretRectForPosition:position];
//    NSLog(@"A originalRect=%@",NSStringFromCGRect(originalRect));
//    return originalRect;

    NSMutableParagraphStyle *attName =  [self.typingAttributes objectForKey:NSParagraphStyleAttributeName];
    if (attName) {
        originalRect.origin.y = originalRect.origin.y+(_jlLineHeight-self.font.lineHeight);
    }
    NSNumber *baselineOffset = [self.typingAttributes objectForKey: NSBaselineOffsetAttributeName];
    if (baselineOffset) {
        originalRect.origin.y -= baselineOffset.floatValue/2.f;
    }
    originalRect.size.height = self.font.lineHeight;

    
    if (_jlFontSpacing>0.f)
    {
        if (originalRect.origin.x>self.textContainerInset.left)
        {//非起始位置，光标紧跟着文字后面，忽略减去一个字间距Inf
            originalRect.origin.x -= _jlFontSpacing;
        }
        else
        {//非0时行光标移动到上一行末尾（好像没必要了，而且点击时编辑位置不准确，后续优化后再处理，目前这样也能用）
//            if (self.selectedRange.length==0)
//            {
//                NSInteger cuyEditingRow = self.curryEditingLine;
////                NSLog(@"BB cuyEditingRow=%d",cuyEditingRow);
//                if (cuyEditingRow>0)
//                {//非0行
//                    if (_allLinesStringArrayM.count>cuyEditingRow)
//                    {
//                        NSString *curryRowStr = _allLinesStringArrayM[cuyEditingRow];//当前行非@“”新行、return行
//                        if ([curryRowStr isEqualToString:@""] || [curryRowStr isEqualToString:@"\n"])
//                        {//不处理光标位置
//
//                        }else
//                        {//光标调整为上一行末尾
//                            NSString *lastRowStr = _allLinesStringArrayM[cuyEditingRow-1];//上一行字符串
//                            if (![lastRowStr isEqualToString:@"\n"])
//                            {//上一行非return空行，调整光标至上一行末尾
//                                CGFloat width = [self calculateTextMaxWidth:lastRowStr];
//                                width -= _jlFontSpacing;
//                                originalRect.origin.x = width-originalRect.size.width; //-2.f
//                                originalRect.origin.y = originalRect.origin.y-(_jlLineHeight+_jlLineSpacing);
//                            }
//                        }
//
//                    }
//                }
//            }
        }
    }
    
//    NSLog(@"B originalRect=%@",NSStringFromCGRect(originalRect));
    return originalRect;
}
#pragma mark - 全局统一属性设置
-(void)setJlFontSpacing:(CGFloat)jlFontSpacing
{
    if (_jlFontSpacing==jlFontSpacing) {
        return;
    }
    _jlFontSpacing = jlFontSpacing;
    NSMutableDictionary *dictM = self.typingAttributes_Mutable;
    [dictM setObject:@(_jlFontSpacing) forKey:NSKernAttributeName];//字间距系统右边会多处一个间距处理
    
    //2.全局都统一字间距
    NSMutableAttributedString *attStrM = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [attStrM setAttributes:dictM range:NSMakeRange(0, self.attributedText.length)];
    self.attributedText = attStrM;
    [self setTypingAttributes:dictM];
}
-(void)setJlLineSpacing:(CGFloat)jlLineSpacing
{
    if (_jlLineSpacing==jlLineSpacing) {
        return;
    }
    _jlLineSpacing = jlLineSpacing;
    
    //1.
    NSMutableDictionary *dictM = self.typingAttributes_Mutable;
    
    NSMutableParagraphStyle *paragraphStyle = [dictM objectForKey:NSParagraphStyleAttributeName];
    if (!paragraphStyle || ![paragraphStyle isKindOfClass:NSMutableParagraphStyle.class])
    {
        paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        [dictM setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    paragraphStyle.lineSpacing = _jlLineSpacing;// 字体的行间距
    
//    if (self.font.leading>0.f)
    {
        paragraphStyle.minimumLineHeight = self.font.lineHeight;

        if (_jlLineSpacing>0.f)
        {
            if (_jlLineSpacing>self.font.leading) {
                [dictM setObject:@(self.font.leading) forKey:NSBaselineOffsetAttributeName];
            }else{
                [dictM setObject:@(_jlLineSpacing) forKey:NSBaselineOffsetAttributeName];
            }
        }else
        {
            [dictM removeObjectForKey:NSBaselineOffsetAttributeName];
        }
    }

    //2.全局都统一行间距
    NSMutableAttributedString *attStrM = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [attStrM setAttributes:dictM range:NSMakeRange(0, self.attributedText.length)];
    self.attributedText = attStrM;
    [self setTypingAttributes:dictM];
}
-(void)setRRFont:(UIFont *)font
{
    //1.
    NSMutableDictionary *dictM = self.typingAttributes_Mutable;

    UIFont *oldFont = self.font;
    
    //2.
    [dictM setObject:font forKey:NSFontAttributeName];
    
    NSMutableParagraphStyle *paragraphStyle = [dictM objectForKey:NSParagraphStyleAttributeName];
    if (!paragraphStyle || ![paragraphStyle isKindOfClass:NSMutableParagraphStyle.class])
    {
        paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        [dictM setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    paragraphStyle.minimumLineHeight = font.lineHeight;
    CGFloat NewH = font.lineHeight+font.leading;
    paragraphStyle.lineSpacing = NewH* _jlLineSpacing/(oldFont.lineHeight+oldFont.leading);//百分比
//    if (font.leading>0.f)
//    {
        if (_jlLineSpacing>0.f)
        {
            if (_jlLineSpacing>font.leading) {
                [dictM setObject:@(font.leading) forKey:NSBaselineOffsetAttributeName];
            }else{
                [dictM setObject:@(_jlLineSpacing) forKey:NSBaselineOffsetAttributeName];
            }
        }else
        {
            [dictM removeObjectForKey:NSBaselineOffsetAttributeName];
        }
//    }
    
    //3全局都统一
    NSMutableAttributedString *attStrM ;
    if ([attStrM isKindOfClass:NSMutableAttributedString.class]) {
        attStrM = (NSMutableAttributedString *)self.attributedText;
    }else{
        attStrM = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
    [attStrM setAttributes:dictM range:NSMakeRange(0, self.attributedText.length)];
    
    [self setTypingAttributes:dictM];
    self.attributedText = attStrM;
}
//-(void)setJlLineHeight:(CGFloat)jlLineHeight
//{
//    if (_jlLineHeight==jlLineHeight) {
//        return;
//    }
//
//    CGFloat minHeight = self.font.lineHeight+self.font.leading;//不能小于字体的默认行高
//    _jlLineHeight = jlLineHeight>minHeight ? jlLineHeight : minHeight;
//
//    //1.
//    NSMutableDictionary *dictM = self.typingAttributes_Mutable;
//
//    NSMutableParagraphStyle *paragraphStyle = [dictM objectForKey:NSParagraphStyleAttributeName];
//    if (!paragraphStyle || ![paragraphStyle isKindOfClass:NSMutableParagraphStyle.class])
//    {
//        paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        [dictM setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
//    }
//    paragraphStyle.minimumLineHeight = _jlLineHeight;//行高
//    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
//
//    if (_middleWhenMoreLineHeight)
//    {//较大行高时文字居中，而不是底部
//        UIFont *attFont = [dictM objectForKey:NSFontAttributeName];
//        if (!attFont)
//        {
//            attFont = self.font;
//        }
//        CGFloat attLineHeight = _jlLineHeight> (attFont.lineHeight+attFont.leading) ?_jlLineHeight :  (attFont.lineHeight+attFont.leading);
//        NSNumber *baselineOffset = @((attLineHeight-(attFont.lineHeight+attFont.leading))/2.f);//调整BaselineOffset位置，使较大行高时文字居中，而不是底部
//        [dictM setObject:baselineOffset forKey:NSBaselineOffsetAttributeName];
//    }
//
//    //2.全局都统一行间距
//    NSMutableAttributedString *attStrM = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
//    [attStrM setAttributes:dictM range:NSMakeRange(0, self.attributedText.length)];
//    self.attributedText = attStrM;
//    [self setTypingAttributes:dictM];
//}
//-(void)setMiddleWhenMoreLineHeight:(BOOL)middleWhenMoreLineHeight
//{
//    _middleWhenMoreLineHeight = middleWhenMoreLineHeight;
//
//    //1.
//    NSMutableDictionary *dictM = self.typingAttributes_Mutable;
//
//    if (_middleWhenMoreLineHeight)
//    {//较大行高时文字居中，而不是底部
//
//        UIFont *attFont = [dictM objectForKey:NSFontAttributeName];
//        if (!attFont)
//        {
//            attFont = self.font;
//        }
//        CGFloat attLineHeight = _jlLineHeight> (attFont.lineHeight+attFont.leading) ?_jlLineHeight :  (attFont.lineHeight+attFont.leading);
//        NSNumber *baselineOffset = @((attLineHeight-(attFont.lineHeight+attFont.leading))/2.f);//调整BaselineOffset位置，使较大行高时文字居中，而不是底部
//        [dictM setObject:baselineOffset forKey:NSBaselineOffsetAttributeName];
//    }
//    else
//    {
//        [dictM removeObjectForKey:NSBaselineOffsetAttributeName];
//    }
//
//    //2.全局都统一行间距
//    NSMutableAttributedString *attStrM = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
//    [attStrM setAttributes:dictM range:NSMakeRange(0, self.attributedText.length)];
//    self.attributedText = attStrM;
//    [self setTypingAttributes:dictM];
//}
-(void)setJlRightToLeft:(BOOL)jlRightToLeft
{
    if (_jlRightToLeft==jlRightToLeft) {
        return;
    }
    _jlRightToLeft = jlRightToLeft;
    
    //1.
    NSMutableDictionary *dictM = self.typingAttributes_Mutable;

    if (_jlRightToLeft) {
        [dictM setObject:@[@(NSWritingDirectionRightToLeft | NSWritingDirectionOverride)] forKey:NSWritingDirectionAttributeName];
    }else
    {
        [dictM removeObjectForKey:NSWritingDirectionAttributeName];
    }
    //2.全局都统一方向
    NSMutableAttributedString *attStrM = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [attStrM setAttributes:dictM range:NSMakeRange(0, self.attributedText.length)];
    self.attributedText = attStrM;
    [self setTypingAttributes:dictM];
}


@end

@implementation UITextView (JLSizeCalculate)
- (void)jl_limitTextViewMaxLengthWhenDidChange:(NSUInteger)maxLength
{
    NSString *lang = [[self.nextResponder textInputMode] primaryLanguage]; // 键盘输入模式
    // 简体中文输入，包括简体拼音，健体五笔，简体手写
    if ([lang isEqualToString:@"zh-Hans"])
    {
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position)
        {
            if (self.text.length > maxLength) {
                self.text = [self.text substringToIndex:maxLength]; // 截取最大限制字符数.
                [self.undoManager removeAllActions]; // 达到最大字符数后清空所有undoaction, 以免undo操作(复制过来一个长度很长的字符串，粘贴过后，摇晃手机，点击撤销)造成crash. 注:在粘贴超出长度撤销操作触发字符串越界所致，若自定义实现超出字符串截断再粘贴，会自动丢失摇晃手机撤销功能。还是超出长度粘贴取消撤销功能这样较为简便
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else
        {
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else
    {
        if (self.text.length > maxLength)
        {
            self.text = [ self.text substringToIndex:maxLength];
            [self.undoManager removeAllActions];
        }
    }
    
}


//左右
- (CGFloat)jl_getWidthOfContentText
{
    CGFloat contentWidth = CGRectGetWidth(self.frame);
  
//    CGSize size = CGSizeApplyAffineTransform(self.bounds.size, self.transform);// 处理textView旋转等情况 (textView旋转下进行编辑不支持)
//    CGFloat contentWidth = size.width;

    //内容需要除去显示的边框值= 文本排版真正宽度
    CGFloat broadWith    = (  self.contentInset.left
                            + self.contentInset.right
                            + self.textContainerInset.left
                            + self.textContainerInset.right
                            + self.textContainer.lineFragmentPadding/*左边距*/
                            + self.textContainer.lineFragmentPadding/*右边距*/
                            );
    contentWidth -= broadWith;
    return contentWidth;
}
//上下
- (CGFloat)jl_getHeightOfContentMargin
{
    CGFloat broadHeight  = (  self.contentInset.top
                            + self.contentInset.bottom
                            + self.textContainerInset.top
                            + self.textContainerInset.bottom);//+self.textContainer.lineFragmentPadding/*top*//*+self*//*there is no bottom padding*/);
    return broadHeight;
}


//- (CGFloat)jl_getTextHeightInTextView:(NSString *)text
//{
//    CGFloat  width = [self jl_getWidthOfContentText];
//    CGSize InSize = CGSizeMake(width, MAXFLOAT);
//    CGFloat textHeight =  [text boundingRectWithSize:InSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:self.typingAttributes context:nil].size.height;
////    NSLog(@"text Height=%f",textHeight);
//    return textHeight;
//}
//





/**
 //为了解决bug
 //如果是一行并且带中文，并且设置了间距lineSpace>0.f，结果多发现显示出来多了一个间距的高度。
 第三方字体font.leading不等于0也有bug，输入emoj表情高度也有bug 例如16.16（15.9+0.26） 输入emoj等15.9+行高
- (CGFloat )calculateCurryTextHeight_222
{
    //    [self getSeparatedLines];
    
    //    NSLog(@"%@",self.text);
    
    CGFloat  width = [self jl_getWidthOfContentText];
    CGSize InSize = CGSizeMake(width, MAXFLOAT);
    CGFloat textHeight_att = [self.attributedText boundingRectWithSize:InSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size.height;//NSStringDrawingUsesFontLeading
    
    //    CGFloat textHeight2 =  [self.text boundingRectWithSize:InSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:self.typingAttributes context:nil].size.height;
    //
    //    NSLog(@"textHeight_1==%f     textHeight_2==%f",textHeight_att ,textHeight2);
    //
    //    CGFloat lineCount = textHeight_att/self.font.lineHeight;
    //    NSLog(@"lineCount====%f",lineCount);
    return textHeight_att+100;
    
    
    //    font.pointSize = 16.000000,font.ascender = 10.688000,font.descender = -5.264000,font.capHeight = 12.768000,font.xHeight = 7.312000,font.lineHeight = 15.952000,font.leading = 0.208000
    
    //    font.pointSize = 16.000000,font.ascender = 15.234375,font.descender = -3.859375,font.capHeight = 11.273438,font.xHeight = 8.421875,font.lineHeight = 19.093750,font.leading = 0.000000
    
    
    
    
    //    NSLog(@"textHeight_att 计算为=%f",textHeight_att);
    //
    ////    nk1+(n-1)*k2 = s
    //    CGFloat ins = (textHeight_att+_jlLineSpacing)/(_jlLineHeight+_jlLineSpacing+self.font.leading);
    //    _curryTextLines = roundf(ins);///!!!!youwenti
    //
    //    NSLog(@"ins=%f   _curryTextLines=%d",ins,_curryTextLines );
    //
    //    CGFloat old = textHeight_att;
    ////    textHeight_att = 16.16*_curryTextLines +(_curryTextLines-1)*_jlLineSpacing;
    //
    //    NSLog(@"textHeight_att 修正为=%f",textHeight_att);
    //
    //    NSLog(@"--------- 差几个=%f",(textHeight_att-old)/0.208);
    
    
    //    (lldb) po self.font.leading
    //    0.20800000000000002
    //
    //    (lldb) po self.font.lineHeight
    //    15.952000000000002
    
    //    16.16 42.32
    
    //    41.904 2个0.208
    
    //linespace 10
    
    
    
    //    return textHeight_att;
    
    
    
    
    
    
    
    
    
    
    
    CGFloat textHeight = [self jl_getTextHeightInTextView:self.text] ; //第三方字体计算出来，没有加self.font.leading
    NSLog(@"calculateCurryTextHeight=%f",textHeight);
    
    //    if (_jlLineSpacing>0.f)
    //    {
    //        if ( ( (textHeight - _jlLineHeight) - _jlLineSpacing) <= 0.01)
    //        {////文本的高度减去字体高度小于等于行间距，判断为当前只有1行 -> (textHeight - _jlLineHeight) == _jlLineSpacing)
    //            if ([self containChinese:self.text])
    //            { //如果包含中文
    //                textHeight -= _jlLineSpacing;
    //            }
    //        }
    //    }
    
    //计算当前行数 nk1+(n-1)*k2 = s
    if ((_jlLineHeight+_jlLineSpacing)!=0) {
        CGFloat Lines = (textHeight+_jlLineSpacing)/(_jlLineHeight+_jlLineSpacing+self.font.leading);
        
        NSLog(@"calculateCurryTextHeight Lines=%f",Lines);
        
        _curryTextLines = roundf(Lines);///!!!!youwenti
        
        if (Lines>_curryTextLines) {
            //            textHeight+=self.font.leading;
        }
        
        
        
        //        textHeight = _curryTextLines*(self.font.lineHeight+self.font.leading);
        //修正高度（第三方字体font.leading!=0时）
        
        //        UIFont *font = [self.typingAttributes objectForKey:NSFontAttributeName];
        //        CGFloat H = [self jl_getHeightOfContentMargin];
        //        NSLog(@"jl_curryTextLines = %f",Lines);
        //
        //        NSLog(@"font.pointSize = %f,font.ascender = %f,font.descender = %f,font.capHeight = %f,font.xHeight = %f,font.lineHeight = %f,font.leading = %f",font.pointSize,font.ascender,font.descender,font.capHeight,font.xHeight,font.lineHeight,font.leading);
    }
    
    //    font.pointSize = 16.000000,font.ascender = 10.688000,font.descender = -5.264000,font.capHeight = 12.768000,font.xHeight = 7.312000,font.lineHeight = 15.952000,font.leading = 0.208000
    
    //    font.pointSize = 16.000000,font.ascender = 15.234375,font.descender = -3.859375,font.capHeight = 11.273438,font.xHeight = 8.421875,font.lineHeight = 19.093750,font.leading = 0.000000
    
    NSLog(@"-------calculateCurryTextHeight textHeight =%f",textHeight);
    
    return textHeight;
    
    //fun 2
    //    NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithDictionary:self.typingAttributes];
    //    NSMutableParagraphStyle *attName =  [dictM objectForKey:NSParagraphStyleAttributeName];
    //    if (attName) {
    //        attName.lineSpacing = 0.f;
    //        [dictM setObject:attName forKey:NSParagraphStyleAttributeName];
    //    }
    //
    //    CGFloat  width = [self jl_getWidthOfContentText];
    //    CGFloat textHeight =  [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dictM context:nil].size.height;
    //
    //    CGFloat Lines = textHeight/self.jlLineHeight;
    //    _curryTextLines = Lines;
    //    NSLog(@"jl_curryTextLines%f",Lines);
    //
    //    textHeight = textHeight+self.jlLineSpacing*(Lines-1);
    //    NSLog(@"jl_textHeight%f",textHeight);
    //    return textHeight;
}
//判断如果包含中文
- (BOOL)containChinese:(NSString *)str
{
    for(int i=0; i< [str length];i++){ int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}
*/









//当中文+字符+emojy混搭时，无法准确对其，所以要竖直排版就用多个label竖直排版
//-(void)setIsVerticalLayout:(BOOL)isVerticalLayout
//{
//    if (_isVerticalLayout==isVerticalLayout) {
//        return;
//    }
//    _isVerticalLayout = isVerticalLayout;
//
//    if (!_isVerticalLayout)
//    {
//        if (self.restoreText)
//        {
//            self.text = self.restoreText;
//            self.restoreText = nil;
//
//            self.frame = self.oldFrame;
//            !_textWidthHandler ?: _textWidthHandler(self, self.frame.size.width, [self.text copy]);
//
//            self.isNextDidChangeHeight = YES;
//            NSNotification *noti = [[NSNotification alloc] initWithName:@"customNoti" object:self userInfo:nil];
//            [self textDidChange:noti];
//        }
//    }
//    else
//    {
//        [self resignFirstResponder];
//
//        //每行文字提取
//        NSMutableArray *allRowsArrayM = [NSMutableArray array];
//        NSInteger maxTextCount = 0;
//        for (int i=0; i<self.allLinesStringArrayM.count; ++i) {
//            NSString *curryRowStr = self.allLinesStringArrayM[i];
//
//            //处理emojy😊表情等,因为他们字符串长度一般>1，需特殊处理
//            NSMutableArray *curryRowWordArrM = [NSMutableArray array];
//            for (int j=0; j<curryRowStr.length; ) {
//                NSRange range = [curryRowStr rangeOfComposedCharacterSequenceAtIndex:j];
//                NSString * result = [curryRowStr substringWithRange:range];
//                j += result.length;
//                [curryRowWordArrM addObject:result];
//            }
//
//            NSString *test = [curryRowWordArrM componentsJoinedByString:@"]["];
//            NSLog(@"isVerticalLayout 第%d行 %lu rowText=[%@]", i,(unsigned long)curryRowWordArrM.count , test);
//            [allRowsArrayM addObject:curryRowWordArrM];
//            if (curryRowWordArrM.count>maxTextCount) {
//                maxTextCount = curryRowWordArrM.count;
//            }
//        }
//
//        //组成新字符串
//        NSMutableArray *newAllRowsArrayM = [NSMutableArray array];
//        NSString *maxLengthText ;
//        for (int i=0; i< maxTextCount; ++i) {
//
//            NSMutableString *newRowStr = [NSMutableString string];
//            for (int j=0; j<allRowsArrayM.count; ++j) {
//                NSArray *curryRowWordArrM = allRowsArrayM[j];
//                if (i<curryRowWordArrM.count) {
//                    [newRowStr appendString:curryRowWordArrM[i]];
//                }
//            }
//            [newAllRowsArrayM addObject:newRowStr];
//            if (newRowStr.length>maxLengthText.length) {
//                maxLengthText = newRowStr;
//            }
//        }
//
//        //设置文字
//        self.restoreText = [self.text copy];
//        NSString *textConver = [newAllRowsArrayM componentsJoinedByString:@""];
//        [super setText:textConver];
//
//        //修改frame
//        if (maxLengthText)
//        {
//            CGFloat width = [self calculateTextMaxWidth:maxLengthText];
//            self.oldFrame = self.frame;
//
//            CGRect frame = self.frame;
//            frame.size.width = width;
//            self.frame = frame;
//
//            self.isNextDidChangeHeight = YES;
//            [self textDidChange:nil];
//
//            !_textWidthHandler ?: _textWidthHandler(self, width, [textConver copy]);
//        }
//    }
//}
@end
