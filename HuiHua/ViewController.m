//
//  ViewController.m
//  HuiHua
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"

#import "HuiHuaViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HuiHuaViewController *vc = [[HuiHuaViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
