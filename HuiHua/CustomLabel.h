//
//  CustomLabel.h
//  HuiHua
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLabel : UILabel
//@property (nonatomic, assign) UIEdgeInsets textInsets; // 控制字体与控件边界的间隙

// 用来决定上下左右内边距，也可以提供一个借口供外部修改，在这里就先固定写死
@property (assign, nonatomic) UIEdgeInsets edgeInsets;
@end
