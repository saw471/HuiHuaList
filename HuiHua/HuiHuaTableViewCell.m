//
//  HuiHuaTableViewCell.m
//  HuiHua
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "HuiHuaTableViewCell.h"

@implementation HuiHuaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    self.jiaoView.layer.masksToBounds = YES;
    self.jiaoView.layer.cornerRadius = 17;
    self.label.layer.masksToBounds = YES;
    self.label.layer.cornerRadius = 10;


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
