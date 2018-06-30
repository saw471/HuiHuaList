//
//  HuiHuaTableViewCell.h
//  HuiHua
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomLabel.h"

@interface HuiHuaTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CustomLabel *label;
@property (weak, nonatomic) IBOutlet UIView *jiaoView;

@end
