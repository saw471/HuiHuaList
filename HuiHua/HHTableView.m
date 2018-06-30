//
//  HHTableView.m
//  HuiHua
//
//  Created by apple on 2018/5/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "HHTableView.h"

@implementation HHTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setContentSize:(CGSize)contentSize
{
    if(!CGSizeEqualToSize(self.contentSize,CGSizeZero))
    {
        if(contentSize.height>self.contentSize.height)
            
        {
            CGPoint offset =self.contentOffset;
            offset.y += (contentSize.height-self.contentSize.height-5);
            self.contentOffset= offset;
        }
        [super setContentSize:contentSize];
    }
}

@end
