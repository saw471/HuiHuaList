//
//  CustomLabel.m
//  HuiHua
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CustomLabel.h"

//#define edge UIEdgeInsetsMake(5, 10, 5, 5)

#define edge UIEdgeInsetsMake(10, 10, 10, 10)

@implementation CustomLabel
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//下面三个方法用来初始化edgeInsets
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
//        self.edgeInsets =edge;
        
    } return self;
    
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
//        self.edgeInsets = edge;
        
    } return self;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
//    self.edgeInsets = edge;
    
} // 修改绘制文字的区域，edgeInsets增加bounds

-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    /* 调用父类该方法 注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域 */
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets) limitedToNumberOfLines:numberOfLines];
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.edgeInsets.left; rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
    
}
//绘制文字
- (void)drawTextInRect:(CGRect)rect { //令绘制区域为原始区域，增加的内边距区域不绘制
        [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
        
}


@end
